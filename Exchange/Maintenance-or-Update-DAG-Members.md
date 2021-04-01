---
title: Maintenance or Update Exchange DAG members
filename: Exchange\Maintenance-or-Update-DAG-Members.md
date: 2012.03.30
---

# Maintenance or Update Exchange DAG members

## Performing maintenance on DAG members

Software 또는 Hardware 유지관리를 실행하기 전에 DAG member를 먼저 maintenance mode로 설정해야 합니다.

아래의 Exchange 서버에 저장되어 있는 script에서 DAG maintenance 절차를 제공합니다:

- StartDagServerMaintenance.ps1: 모든 활성 database를 서버에서 이동하는 것을 지원합니다. 또한 PAM (Primary Active Manager) 역할 등을 함께 이동하고 maintenance가 완료되기 전에 다시 서버로 이동되는 것을 차단합니다.

    - DAG member의 DatabaseCopyAutoActivationPolicy parameter를 `Blocked`로 설정하여 database copies가 활성화되는 것을 차단합니다.
    - Cluster에서 node를 일시 중지하여 PAM이 되는 것으로 차단합니다.
    - 현재 활성화된 database들을 다른 DAG member들로 이동시킵니다.
    - Default Cluster Group을 소유하고 있다면, 다른 DAG member로 이동시킵니다.

- StopDagServerMaintenance.ps1: DAG 구성원이 maintenance mode를 끝내게 해주며, database 또는 PAM 등이 정상 동작하게 설정합니다.

    - Cluster에서 node를 다시 시작하여 전체 cluster 기능들을 동작하게 합니다.
    - DAG member의 DatabaseCopyAutoActivationPolicy parameter를 `Unrestricted`로 설정합니다.
    - Resume-MailboxDatabaseCopy 명령을 각 database에 대하여 실행합니다.


두 script는 ServerName parameter 와 WhatIf parameter를 사용할 수 있으며, local 또는 remote에서 실행할 수 있으며 Windows Failover Cluster Management 도구(RSAT-Clustering)가 설치되어 있어야 합니다.

### DAG member의 Maintenance Mode 전환

Maintenance 절차에는 transport queues flushing 과 client connectivity suspending을 포함합니다.

1. transport queues flushing

    ```powershell
    Set-ServerComonentState <ServerName> -Component HubTransport -State Draining -Requester Maintenance
    ```

1. transport queues draining을 위해 서비스를 재시작합니다.

    ```powershell
    Restart-Service MSExchangeTransport
    ```

1. All Unified Messaging call draining (Exchange 2016 Only)

    ```powershell
    Set-ServerComponentState <ServerName> -Component UMCallRouter -State Draining -Requester Maintenance
    ```

1. DAG maintenance scripts 폴더로 work folder 변경

    ```powershell
    Set-Location $ExScripts
    ```

1. StartDagServerMaintenance.ps1 실행

    ```powershell
    .\StartDagServerMaintenance.ps1 -ServerName <ServerName> -MoveComment Maintenance -PauseClusterNode
    ```

1. 로컬 queues에 있는 배달 지연 messages를 다른 Exchange 서버로 redirect

    ```powershell
    Redirect-Message -Server <ServerName> -Target <Server FQDN>
    ```

1. 서버를 maintenance mode로 전환

    ```powershell
    Set-ServerComponentState <ServerName> -Component ServerWideOffline -State Inactive -Requester Maintenance
    ```

    1. 서버가 maintenance mode인지 아래 명령으로 확인. `Monitoring`과 `RecoveryActionsEnabled` 속성만 Active 상태인지 확인합니다.

        ```powershell
        Get-ServerComponentState <ServerName> | Format-Table Component,State -Autosize
        ```

    1. 아래 명령을 통해 DatabaseCopyAutoActivationPolicy 가 `Unresticted` 가 아닌 `Blocked` 로 되었는지 확인합니다.

        ```powershell
        Get-MailboxServer <ServerName> | Format-List DatabaseCopyAutoActivationPolicy
        ```

    1. 아래 명령을 통해 cluster node가 paused 인지 확인합니다.

        ```powershell
        Get-ClusterNode <ServerName> | Format-List
        ```

    1. 아래 명령을 통해 모든 transport queue가 비웠는지 확인합니다.

        ```powershell
        Get-Queue
        ```

## DAG member의 Full Production 상태 전환

Maintenance가 완료된 후 DAG member를 다시 service할 수 있는 상태롤 되돌립니다.

1. Maintenance mode를 끝내고 client connection을 받을 수 있게 합니다.

    ```powershell
    Set-ServerComponentState <ServerName> -Component ServerWideOffline -State Active -Requester Maintenance
    ```

1. Unified Messaging calls을 받을 수 있도록 합니다. (Exchange 2016 Only)

    ```powershell
    Set-ServerComponentState <ServerName> -Component UMCallRouter -State Active -Requester Maintenance
    ```

1. DAG maintenance scripts 폴더로 work folder 변경

    ```powershell
    Set-Location $ExScripts
    ```

1. StopDagServerMaintenance.ps1 script 실행합니다.

    ```powershell
    .\StopDagServerMaintenance.ps1 -serverName <ServerName>
    ```

1. transport queues에서 messages 처리를 수용하도록 활성화 합니다.

    ```powershell
    Set-ServerComponentState <ServerName> -Component HubTransport -State Active -Requester Maintenance
    ```

1. transport queues 활성화를 위해 서비스를 재시작합니다.

    ```powershell
    Restart-Service MSExchangeTransport
    ```

1. 서버가 maintenance mode가 아님을 아래 명령으로 확인. `Monitoring`과 `RecoveryActionsEnabled` 속성만 Active 상태인지 확인합니다.

    ```powershell
    Get-ServerComponentState <ServerName> | Format-Table Component,State -Autosize
    ```

    Exchange 업데이트 중 실패가 있었다면, 몇몇 server components가 inactive 상태일 수 있습니다. 이 경우, 아래 명령을 통하여 해결할 수 있습니다.

    ```powershell
    Set-ServerComponentState <ServerName> -Component ServerWideOffline -State Active -Requester Functional

    Set-ServerComponentState <ServerName> -Component Monitoring -State Active -Requester Functional

    Set-ServerComponentState <ServerName> -Component RecoveryActionsEnabled -State Active -Requester Functional
    ```


## Installing Updates on DAG members

1. Backup web.config 및 EdgeTransport.exe.config 설정 파일

    ```powershell
    Backup-ExchangeConfigFiles.ps1 -BackupFolder C:\Working\ConfigBackup
    ```

    > [!NOTE]
    > **Script**:  
    > Download: [Backup-ExchangeConfigFiles.ps1](/Tech/Exchange/Backup-ExchangeConfigFiles.ps1)  
    > View: https://github.com/kj-park/Tech/blob/main/Exchange/Backup-ExchangeConfigFiles.ps1

1. 서버를 유지보수모드(Maintenance mode)로 설정합니다.

1. 서버를 재부팅 합니다.

1. 업데이트 설치

1. 유지보수모드(Maintenance mode)를 종료합니다.

1. RedistributieActiveDatabases.ps1 script를 사용하여 Active Database를 재 분배합니다.

1. Exchange 연관 서비스들을 확인



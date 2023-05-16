---
title: Deployment Exchange 2013
filename: Exchange\2013\Deployment-Exchange-2013.md
ms.date: 2012.03.30
---

# Deployment Exchange 2013

## Exchange 2013 Prerequisites

### Active Directory preparation

아래의 소프트웨어를 설치합니다.

1. [.NET Framework 4.7.2](https://download.microsoft.com/download/6/E/4/6E48E8AB-DC00-419E-9704-06DD46E5F81D/NDP472-KB4054530-x86-x64-AllOS-ENU.exe)
1. [Windows Management Framework 4.0](https://www.microsoft.com/download/details.aspx?id=40855)

아래의 과정을 통해 Remote Tool Administration Pack 을 설치합니다.

- Windows Server 2012 R2 에서

    ```powershell-interactive
    Install-WindowsFeature RSAT-ADDS
    ```

- Windows Server 2008 R2 SP1 에서

    ```powershell-interactive
    Add-WindowsFeature RSAT-ADDS
    ```

### Windows Server 2012 R2 에서 Prerequisites

#### Mailbox or Client Access server roles

1. 필요한 Windows components를 설치합니다.

```powershell
Install-WindowsFeature AS-HTTP-Activation, Desktop-Experience, NET-Framework-45-Features, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation, RSAT-ADDS
```

1. Install [.NET Framework 4.7.2](https://download.microsoft.com/download/6/E/4/6E48E8AB-DC00-419E-9704-06DD46E5F81D/NDP472-KB4054530-x86-x64-AllOS-ENU.exe)

    > [!IMPORTANT]
    > Exchange 2013 CU23은 .NET Framework 4.7.2 를 필요로 한다.  
    > 만약, .NET Framework 4.7.1 환경이며, 먼저, Exchange 2013 CU22로 업그레이드 후 .NET Framework 4.7.2 를 설치합니다.  
    > 만약, .NET Framework 4.6.2 환경이며, 먼저, Exchange 2013 CU20로 업그레이드 후 .NET Framework 4.7.1 를 설치합니다.

1. Install [Windows Management Framework 4.0](https://www.microsoft.com/download/details.aspx?id=40855) (included with Windows Server 2012 R2)

1. Install [Microsoft Unified Communications Managed API 4.0, Core Runtime 64-bit](https://www.microsoft.com/download/details.aspx?id=34992)

1. Install [Visual C++ Redistributable Package for Visual Studio 2012](https://www.microsoft.com/download/details.aspx?id=30679)

1. Install [Visual C++ Redistributable Package for Visual Studio 2013](https://www.microsoft.com/download/details.aspx?id=40784)

---

## Prepare Active Directory and Domains

해당 session의 핵심 내용은 아래와 같습니다:

1. Extend the Active Directory Schema
1. Prepare Active Directory
1. Prepare Active Directory domains

Schema Admins 및 Enterprise Admins 의 구성원으로 작업을 수행합니다.

1. Extend the Active Directory Schema

    ```powershell
    Setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms
    ```

1. Prepare Active Directory

    이 과정은 Exchange Organization을 포함한 Exchange containers 및 개체들을 Active Directory에 생성하는 과정입니다.  
    수행 과정 중 Exchange Organization Name이 필요할 수 있으며 이름은 아래를 참조합니다:
    
    - `A` ~ `Z`, `a` ~ `z`
    - `0` ~ `9`
    - 스페이스를 포함할 수 있으나 이름의 처음과 끝에는 사용할 수 없음
    - `-` 또는 `_`
    - 이름은 64문자까지 가능
    - 이름은 설정 후 변경할 수 없음
    
    ```powershell
    Setup.exe /PrepareAD /OrganizationName:"<organization name>" /IAcceptExchangeServerLicenseTerms
    ```
1. Prepare Active Directory domains

    이 과정은 Exchange  관련 Security Group 들 및 permission등을 설정합니다.  

    두 가지 옵션으로 수행할 수 있습니다.  
    Forest의 전체 domains에 대하여 수행 또는 지정한 domain에 대하여 수행 옵션 중에 적절한 옵션으로 수행하면 됩니다.

    ```powershell
    # All Domains
    Setup.exe /PrepareAllDomains /IAcceptExchangeServerLicenseTerms
    
    # Specified Domain
    Setup.exe /PrepareDomain:<FQDN of the domain you want to prepare> /IAcceptExchangeServerLicenseTerms
    ```

> [!NOTE]
> [Exchange 2013 Active Directory versions](https://learn.microsoft.com/en-us/exchange/prepare-active-directory-and-domains-exchange-2013-help#exchange-2013-active-directory-versions)

---

## Deploy New Installation of Exchange 2013

> [!NOTE]
> [Checklist for a new installation of Exchange 2013](https://learn.microsoft.com/en-us/exchange/checklist-perform-a-new-installation-of-exchange-2013-exchange-2013-help)

1. [Exchange 2013 CU23](https://www.microsoft.com/en-us/download/details.aspx?id=58392) 설치 파일을 다운로하고 실행하여 압축을 해제합니다.

1. 압축 해체한 폴더에서 setup.exe를 관리자 계정으로 실행하여 Setup Wizard로 설치 합니다.
    1. Check for Updates? page
    1. Introduction page
    1. License Agreement page
    1. Recommended settings page
    1. Server Role Selection page
    1. Installation Space and Location page
    1. Exchange Organization을 처음 설정하는 경우, Exchange Organization page
        1. Active Directory split permission security model 옵션
    1. Malware Protection Settings page
    1. Readiness Check page
    1. Completion page

---

## Exchange 2013 Post-Installation tasks

 1. Exchange 2013 Product Key 입력
 
    > [!NOTE]
    > Exchange 서버 license의 경우 설치는 동일하며 입력한 product key 에 따라 Enterprise 및 Standard 로 나뉘어지며, 버전에 따라 사용할 수 있는 기능의 차이가 있습니다.  
    > 자세한 내용은 [Exchange License Type](#Exchange-License-Type)을 참조하세요.

    ```powershell
    Set-ExchangeServer ExServer01 -ProductKey aaaaa-aaaaa-aaaaa-aaaaa-aaaaa
    ```

1. Mail Flow 및 Client Access 구성
    1. Send Connector 생성 및 구성
    1. Accepted Domain 추가 및 구성
    1. Default Email Address Policy 구성
    1. External URLs 구성
    1. Internal URLs 구성
    1. SSL Certificate 구성

1. 옵션: Edge Transport Server를 통한 Internet mail flow 구성

1. Verify an Exchange Installation
    1. Get-ExchangeServer
    1. Application Event Log
    1. Setup Log (C:\ExchangeSetupLogs)

---

## Exchange License Type

Exchange는 Server 와 Client Access License(CAL) 모델로 구성되어 있습니다.

- **Server License**: Standard Edition과 Enterprise Edition으로 나눠집니다.

- **Client Access License (CALs)**: Standard CAL 과 Enterprise CAL로 나눠지며 Exchange Server 라이선스와 혼용하여 사용 가능합니다.


Exchange Standard Edition은 아래와 같은 limitation이 있습니다:

- 기본 Database size limit는 1024 GB

    [Exchange Server 2013, 2016 and 2019 Standard Edition can't mount databases that are larger than 1024 GB](https://learn.microsoft.com/en-us/exchange/troubleshoot/administration/exchange-cannot-mount-database-larger-than-1024-gb)

- 1 ~ 5 Mailbox Database 지원 (Enterprise Edition은 1 ~ 100 Mailbox Database 지원)

Exchange Client Access License (CALs)에 따라 사용 가능한 기능의 차이가 있습니다.

- Journaling: Standard CAL은 Per Database, Enterprise CAL은 Per User/Distribution List 기반 지원
- Journal decryption은 Enterprise CAL에서 지원
- In-Place Archive는 Enterprise CAL에서 지원
- Multi-mailbox Search는 Enterprise CAL에서 지원
- In-Place Hold는 Enterprise CAL에서 지원
- Information protection and control (IPC): transport protection rules, Outlook protection rules, Information Rights Management (IRM) search 는 Enterprise CAL에서 지원

Exchange Licensing에 대하여 아래의 링크를 참조하세요.

> [Exchange Server 2019 licensing](https://www.microsoft.com/en-in/microsoft-365/exchange/microsoft-exchange-server-licensing-licensing-overview)
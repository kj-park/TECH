---
title: Install ExchangeOnlineManagement Module
filename: Exchange\Install-ExchangeOnlineManagement-Module.md
ms.date: 2012.04.29
---

# Install ExchangeOnlineManagement Module

## About the Exchange Online PowerShell V2 Module

Exchange Online PowerShell V2 Module은 Modern Authentication을 사용하여 Multi-Factor Authentication(MFA) 를 이용하여 Microsoft 365 Exchange와 관련되어 아래의 환경에서 사용할 수 있습니다.

- Exchange Online PowerShell
- Security & Compliance Center PowerShell
- Exchange Online Protection PowerShell

## Install and Maintain the EXO V2 Module

EXO V2 Module은 Powershell Gallery에서 다운로드할 수 있습니다.

https://www.powershellgallery.com/packages/ExchangeOnlineManagement/

### Supported OS

Officially supported in Powershell 7 on Windows, Linux, and Apple macOS

#### Windows

Supported in Windows PowerShell 5.1 and PowerShell 7 on Windows

- Windows 10
- Windows 8.1
- Windows Server 2019
- Windows Server 2016
- Windows Server 2012 or Windows Server 2012 R2
- Windows 7 Service Pack 1
- Windows Server 2008 R2 SP1

> [!NOTE] Windows PowerShell 5.1은 Microsoft .NET Framework 4.5 이상에 Windows Management Framework 5.1 이 필요합니다.

> [!NOTE] Powershell 7은 Windows 10 Universal C Runtime (CRT)이 필요합니다. (on Windows 8.1, Windows Server 2012 R2)

### Prerequisites

1. Powershell Gallery에서 다운로드가 가능하게 Powershell Execution Policy를 RemoteSigned로 변경

    ```powershell
    Set-ExecutionPolicy RemoteSigned
    ```

1. WinRM의 Basic Authentication을 enable

    ```dos
    winrm get winrm/config/auth
    
    winrm set winrm/config/client/auth @{Basic="true"}
    ```

### Install the EXO V2 Module

Windows Server 2012 R2에서 아래의 순서대로 설치합니다.

Exchange 2013이 설치된 Windows Server 2012 R2에서 Windows Powershell 5.1에서 EXO V2 Module을 사용합니다.

1. [Windows Management Framework 5.1](https://aka.ms/wmf5download) 설치

1. Powershell Gallery(NuGet) Package Provider 설치 및 EXO V2 Module 설치

    ```powershell
    # TLS 1.2 사용하게 변경
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    
    # NuGet Package Provider 설치
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
    
    # EXO Module 설치
    Install-Module -Name ExchangeOnlineManagement -Scope AllUsers
    ```

---

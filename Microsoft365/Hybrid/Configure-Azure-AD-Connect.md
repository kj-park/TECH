---
title: Configure Azure AD Connect Sync
filename: Microsoft365\Hybrid\Configure-Azure-AD-Connect.md
ms.date: 2012.04.29
---

# Configure Azure AD Connect

Install Type은 아래와 같습니다:

- Express Installation
- Custom Installation

![AAD-Connector-Install-type](images/AAD-Connector-Install-type.png)

---

## Installation Prerequisites

### Azure AD

- Azure AD Tenant
- Add and Verify the domain

### On-Premises Active Directory

- Active Directory Schema version and Forest Functional Level: Windows Server 2003 이상
- Password Writeback 기능: Windows Server 2012 이상 Domain Controller
- Writable Domain Controller, Not RODC
- Forest and Domain Namespace: "dotted" name, NetBIOS name 지원하지 않음
- [Active Directory Recycle Bin enable](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-recycle-bin) 권장

### PowerShell .NET Framework

- "RemoteSigned" 권장 Execution Policy
- .NET Framework 4.5.1 이상
    - Windows Server 2012 R2: Windows Update를 통해 설치
    - Windows Server 2012: .NET Framework 4.5.1와 Windows Management Framework 4.0 설치

### Azure AD Connect Server

Azure AD Connect Server 서버는 critical identity data를 가지고 있어서 Tier 0 구성요소로 취급해야 합니다.

- Domain-Joined Windows Server 2012 이상
- Full GUI installed
- PowerShell Transcription Group Policy must not enabled
- If AD FS is being Deployed:
    - AD FS or Web Application Proxy 는 Windows Server 2012 R2 이상
    - TLS/SSL Certificates 구성 ([Managing SSL/TLS protocols and cipher suites for AD FS](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/operations/manage-ssl-protocols-in-ad-fs) and [Managing SSL certificates in AD FS](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/operations/manage-ssl-certificates-ad-fs-wap))
    - Name Resolution for AD FS or Web Application Proxy
- Global Administrators에 MFA가 enable되어 있으면, IE trusted sites에 https://secure.aadcdn.microsoftonline-p.com 추가
- Azure AD Connect Health deploy를 계획 중이라면, [prerequisites](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-health-agent-install) 확인

### SQL Server used by Azure AD Connect

- 기본으로 SQL Server 2012 Express Local DB를 사용하며 10GB size limit (약 100,000 개체 수용 가능) 존재
- SQL Server를 별도 지정하는 경우:
    - SQL Server 2012(최신 서비스팩) 이상 지원하며 Azure SQL Database는 지원하지 않음
    - Case-Insensitive SQL Collation 구성
    - Only One Sync engine per SQL Instance

### Accounts

- Azure AD Global Administrator Account는 school or organization account이여야 함, Not Microsoft Account
- Express Installation 또는 DirSync 업그레이드인 경우 on-premises Active Directory의 Enterprise Administrator Account 사용

### Connectivity

- Azure AD Connect Server 서버는 Intranet (On-Premises Active Directory) 과 Internet (Azure AD endpoints) 에 대하여 DNS name resolution이 가능해야 함
- Intranet 통신에 Firewall이 있는 경우 domain controller 와 통신을 위한 port open 필요 ([Azure AD Connect ports](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-ports))
- Proxy 및 Firewall이 URL 접근 제어에 제한이 있다면, 아래의 두 문서를 참조하여 open되어야 함
    - [ Office 365 URLs and IP address ranges](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2)
    - [ Safelist the Azure portal URLs on your firewall or proxy server](https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-safelist-urls?tabs=public-cloud)
- Azure AD Connect는 기본적을 TLS 1.2 보안 프로토콜을 사용함
    - .NET 4.5.1 hotfix ([Microsoft Security Advisory 2960358](https://learn.microsoft.com/en-us/security-updates/SecurityAdvisories/2015/2960358))
    - `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework\v4.0.30319` > `"SchUseStrongCrypto"=dword:00000001`
- Outbound Proxy를 통해 Internet 통신이 되는 경우 .NET Framework의 machine.config에 proxy address 등 추가 설정 필요
    - proxy address
    - authentication
    - connection idle timeout: 6분 이상 설정

---

## Express Installation

Express is the most common option and is used by about 90% of all new installations.

- single Active Directory forest
- enterprise administrator account
- less than 100,000 objects

Express Install은 아래의 옵션으로 구성:

- Password Hash Synchronization
- Synchronization for All users, groups, windows 10 computers in all domain
- Automatic upgrade is enabled

---

## Custom Installation

The customized path allows many more options than express.

![AAD-Connector-custom-Install-001](images/AAD-Connector-custom-Install-001.png)

![AAD-Connector-custom-Install-002](images/AAD-Connector-custom-Install-002.png)

![AAD-Connector-custom-Install-003](images/AAD-Connector-custom-Install-003.png)

![AAD-Connector-custom-Install-004](images/AAD-Connector-custom-Install-004.png)

![AAD-Connector-custom-Install-005](images/AAD-Connector-custom-Install-005.png)

![AAD-Connector-custom-Install-006](images/AAD-Connector-custom-Install-006.png)

![AAD-Connector-custom-Install-007](images/AAD-Connector-custom-Install-007.png)

![AAD-Connector-custom-Install-008](images/AAD-Connector-custom-Install-008.png)

![AAD-Connector-custom-Install-009](images/AAD-Connector-custom-Install-009.png)

![AAD-Connector-custom-Install-010](images/AAD-Connector-custom-Install-010.png)

![AAD-Connector-custom-Install-011](images/AAD-Connector-custom-Install-011.png)

![AAD-Connector-custom-Install-012](images/AAD-Connector-custom-Install-012.png)

![AAD-Connector-custom-Install-013](images/AAD-Connector-custom-Install-013.png)

![AAD-Connector-custom-Install-014](images/AAD-Connector-custom-Install-014.png)

![AAD-Connector-custom-Install-015](images/AAD-Connector-custom-Install-015.png)

![AAD-Connector-custom-Install-016](images/AAD-Connector-custom-Install-016.png)

![AAD-Connector-custom-Install-017](images/AAD-Connector-custom-Install-017.png)

![AAD-Connector-custom-Install-018](images/AAD-Connector-custom-Install-018.png)

![AAD-Connector-custom-Install-019](images/AAD-Connector-custom-Install-019.png)

### Azure AD Connect Sync Permissions Assign

```powershell
Import-Module "C:\Program Files\Microsoft Azure Active Directory Connect\AdSyncConfig\AdSyncConfig.psm1"

Set-ADSyncBasicReadPermissions -ADConnectorAccountName aadsync -ADConnectorAccountDomain exopoc.ml

Set-ADSyncMsDsConsistencyGuidPermissions -ADConnectorAccountName aadsync -ADConnectorAccountDomain exopoc.ml

Set-ADSyncPasswordHashSyncPermissions -ADConnectorAccountName aadsync -ADConnectorAccountDomain exopoc.ml

Set-ADSyncPasswordWritebackPermissions -ADConnectorAccountName aadsync -ADConnectorAccountDomain exopoc.ml

Set-ADSyncUnifiedGroupWritebackPermissions -ADConnectorAccountName aadsync -ADConnectorAccountDomain exopoc.ml

Set-ADSyncExchangeHybridPermissions -ADConnectorAccountName aadsync -ADConnectorAccountDomain exopoc.ml

Set-ADSyncExchangeMailPublicFolderPermissions -ADConnectorAccountName aadsync -ADConnectorAccountDomain exopoc.ml
```

---

## More about Install Azure AD Connect

| Topic                              | Link                                                                                                                                                                       |
|------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Supported topologies**           | [Topologies for Azure AD Connect](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/plan-connect-topologies)                                                  |
| **Design concepts**                | [Azure AD Connect design concepts](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/plan-connect-design-concepts)                                            |
| **Accounts used for installation** | [More about Azure AD Connect credentials and permissions](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-accounts-permissions)           |
| **Operational planning**           | [Azure AD Connect sync: Operational tasks and considerations](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-staging-server)           |
| **User sign-in options**           | [Azure AD Connect User sign-in options](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/plan-connect-user-signin)                                           |
| **Configure filtering**            | [Azure AD Connect sync: Configure filtering](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-configure-filtering)                       |
| **Password hash synchronization**  | [Password hash synchronization](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-password-hash-synchronization)                               |
| **Pass-through Authentication**    | [Pass-through authentication](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-pta)                                                           |
| **Password writeback**             | [Getting started with password management](https://learn.microsoft.com/en-us/azure/active-directory/authentication/tutorial-enable-sspr)                                    |
| **Device writeback**               | [Enabling device writeback in Azure AD Connect](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-device-writeback)                            |
| **Prevent accidental deletes**     | [Azure AD Connect sync: Prevent accidental deletes](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-feature-prevent-accidental-deletes) |
| **Automatic upgrade**              | [Azure AD Connect: Automatic upgrade](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-install-automatic-upgrade)                             |

---

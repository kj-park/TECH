---
title: Configure Microsoft 365 Groups with on-premises Exchange Hybrid
filename: Microsoft365\Configure-Microsoft-365-Groups-with-on-premises-Exchange-Hybrid.md
ms.date: 2012.03.31
---

# Configure Microsoft 365 Groups with on-premises Exchange Hybrid

Microsoft 365 Groups 서비스는 팀 간 communicate 및 schedule meetings, 문서 공동 작업 등을 좀 더  쉽게 할 수 있게 합니다.  
그룹에게 email message를 보내고, Group의 OneDrive 또는 SharePoint libraries에 파일을 저장하는 것이 Group의 멤버간에 가능합니다.

아래의 Prerequisites 및 steps을 통하여 Exchange hybrid 환경의 on-premises 사용자들에게 Microsoft 365 Groups 서비스가 가능해집니다.

## Prerequisites

- Azure Active Directory Premium 라이선스 구매. Azure Active Directory Connect의 Group writeback 기능을 활성화하기 위해 필요합니다.

- Microsoft 365/Office 365와 Exchange On-Premises 사이에 Hybrid 설정이 정상적으로 설정되고 기능해야 합니다.
    - [Exchange Server Hybrid Deployments](https://learn.microsoft.com/en-us/exchange/exchange-hybrid)
    - [Hybrid deployment prerequisites](https://learn.microsoft.com/en-us/exchange/hybrid-deployment-prerequisites)

- Microsoft 365 Groups과 On-premise Exchange 통합을 지원하는 버전이 설치되어 있어야 합니다.
    - Exchange 2016 CU1 이상 (최신 CU 설치 권장)
    - Exchange 2013 CU11 이상 (최신 CU 설치 권장)

- Azure Active Directory Connect (Azure AD Connect)를 사용하여 single sign-on 구성되어 있어야 합니다.


## Enable Group writeback in Azure AD Connect

Azure AD Connect 구성의 Optional features에서 **Group writeback** 기능을 선택합니다.  
일반적으로 **Exchange hybrid**와 **password hash synchronization**이 선택되어 있습니다.

## Configure a group domain

Microsoft 365 group의 primary SMTP domain을 group domain이라 합니다. 일반적으로 기본 accepted domain이 group domain으로 사용되어지며, 명시적 group domain을 추가하려면 아래의 steps을 수행합니다.

1. Microsoft 365/Office 365에 새로운 도메인을 추가합니다. 도움이 필요하면 [Add a domain to Microsoft 365](https://learn.microsoft.com/en-us/microsoft-365/admin/setup/add-domain).을 참조하세요.

1. On-premises Exchange 조직에서 아래 명령을 통해 accepted doamin을 group domain으로 추가합니다.

    ```powershell
    New-AcceptedDomain -Name groups.exchange.info -DomainName groups.exchange.info -DomainType InternalRelay
    ```

1. 아래의 DNS records를 생성합니다.

| DNS record name | DNS record type | DNS record value |
|--|--|--|
| groups.exchange.info | MX | groups-exchange-info.mail.protection.outlook.com (domain key 참조) |
| autodiscover.groups.exchange.info | CNAME | autodiscover.outlook.com |

1. Hybrid Send Connector에 group domain을 추가합니다. Hybrid Configuration wizard 또는 아래 명령을 통해 추가할 수 있습니다.

```powershell
Set-SendConnector -Identity "Outbound to Office 365" -AddressSpaces "exchange-info.mail.onmicrosoft.com","groups.exchange.info"
```

## Change Microsoft 365 Group's PrimarySmtpAddress

아래의 EXO PowerShell script를 통해 Microsoft 365 Group들의 Email Address를 변경할 수 있습니다.

```powershell
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline - UserPrincipalName admin@exchange-info.mail.onmicrosoft.com

$groupDomain = "@groups.exchange.info"
$M365Groups = Get-UnifiedGroup -ResultSize Unlimited

foreach ( $M365Group in $M365Groups ) {
        if ( $M365Group.EmailAddresses.Contains(("smtp:" + $M365Group.alias + "@exchange.info")) ) {
        Set-UnifiedGroup -Identity $M365Group.Identity -EmailAddresses @{Remove="$("smtp:" + $M365Group.alias + "@exchange.info")"}
    }
    Set-UnifiedGroup -Identity $M365Group.Identity -PrimarySmtpAddress ($M365Group.alias + $groupDomain)
}
```

## Known issues

> [!NOTE]
> [Configure Microsoft 365 Groups with on-premises Exchange hybrid](https://learn.microsoft.com/en-us/exchange/hybrid-deployment/set-up-microsoft-365-groups#known-issues)

---
title: Configure Exchange Hybrid
filename: Exchange\Configure-Exchange-Hybrid.md
ms.date: 2012.05.10
---

# Configure Exchange Hybrid

**<i class="fa-solid fa-list"></i> In this article**

- [Exchange Hybrid Deployment Considerations](#exchange-hybrid-deployment-considerations)
- [Install Exchange Hybrid Configuration Wizard without Edge](#install-exchange-hybrid-configuration-wizard-without-edge)
- [Install Exchange Hybrid Configuration Wizard with Edge](#install-exchange-hybrid-configuration-wizard-with-edge)
- [Related PowerShell Commands](#related-powershell-commands)

---

Hybrid Deployment는 아래의 기능들을 가능하게 합니다:

- On-Premises 와 Exchange Online 간의 Secure mail routing
- 공유된 domain namespace로 mail routing, 예: @exchange.info
- Unified Global Address List(GAL), Shared Address Book
- On-Premises 와 Exchange Online 간의 Free/Busy 및 Calendar 공유
- 옵션: 중앙화된 Inbound 및 Outbound mail flow 제어
- On-Premises 와 Exchange Online에서 하나의 Single Outlook on the Web URL **[How?]**
- Exchange Online으로 On-Boarding 및 Off-Boarding Mailbox Move
- On-Premises의 Exchange Admin Center(EAC)에서의 중앙화된 Mailbox 관리(Online 포함)
- On-Premises 와 Exchange Online의 Message Tracking 및 MailTips, 검색
- Cloud-based message Archiving

일반적인 Hybrid Deployment 구조는 아래와 같습니다:

![Hybrid-Deployment-Example](images/Hybrid-Deployment-Example.png)

---

## Exchange Hybrid Deployment Considerations

- Common Considerations

    - [Hybrid Deployment Requirements](https://learn.microsoft.com/en-us/exchange/hybrid-deployment-prerequisites)
    - Exchange ActiveSync Clients: 대부분 ActiveSync Clients들은 자동으로 Exchange Online으로 설정 변경되어짐
    - Mailbox Permissions Migration: 명시적으로 지정된 Send As 및 Full Access, Send on Behalf, Folder permissions 과 같은 명시적으로 지정된 Mailbox Permissions은 Exchange Online으로 Migration되지만, 상속되어진 명시적으로 지정되지 않은 Mailbox Permission은 Migration되지 않음
    - Off-boarding
    - Mailbox Forwarding Settings: On-Premises Mailbox forwoarding 설정이 Exchange Online Mailbox로 migration 되지 않음
        - 관련 Exchange Online Mailbox 속성:
            - DeliverToMailboxAndForward
            - ForwardingAddress
            - ForwardingSmtpAddress

- Directory Synchronization and Single Sign-On

    기본 설정으로 500,000 개체 제한(Azure Active Directory Free)
    
    > [!NOTE] [Azure Active Directory Pricing](https://azure.microsoft.com/pricing/details/active-directory/) 참조하세요.

- Certificates

    [Certificate requirements for hybrid deployments](https://learn.microsoft.com/en-us/exchange/certificate-requirements)

    ![Exchange-Hybrid-Configuration-with-Edge](images/Exchange-Hybrid-Configuration-with-Edge.png)

- Client Requirements

    - [Office versions and connectivity to Microsoft 365 services](https://learn.microsoft.com/en-us/deployoffice/endofsupport/microsoft-365-services-connectivity)
    - [New minimum Outlook for Windows version requirements for Microsoft 365](https://techcommunity.microsoft.com/t5/microsoft-365-blog/new-minimum-outlook-for-windows-version-requirements-for/ba-p/2684142)


- Information Rights Management

    [IRM in Exchange hybrid deployments](https://learn.microsoft.com/en-us/exchange/irm)

- [Exchange Online Limits](https://learn.microsoft.com/en-us/office365/servicedescriptions/exchange-online-service-description/exchange-online-limits)

[Top](#)

---

## Install Exchange Hybrid Configuration Wizard without Edge

![Exchange-Hybrid-Configuration-without-Edge-001](images/Exchange-Hybrid-Configuration-without-Edge-001.png)

![Exchange-Hybrid-Configuration-without-Edge-002](images/Exchange-Hybrid-Configuration-without-Edge-002.png)

![Exchange-Hybrid-Configuration-without-Edge-003](images/Exchange-Hybrid-Configuration-without-Edge-003.png)

![Exchange-Hybrid-Configuration-without-Edge-004](images/Exchange-Hybrid-Configuration-without-Edge-004.png)

![Exchange-Hybrid-Configuration-without-Edge-005](images/Exchange-Hybrid-Configuration-without-Edge-005.png)

![Exchange-Hybrid-Configuration-without-Edge-006](images/Exchange-Hybrid-Configuration-without-Edge-006.png)

![Exchange-Hybrid-Configuration-without-Edge-007](images/Exchange-Hybrid-Configuration-without-Edge-007.png)

![Exchange-Hybrid-Configuration-without-Edge-008](images/Exchange-Hybrid-Configuration-without-Edge-008.png)

![Exchange-Hybrid-Configuration-without-Edge-009](images/Exchange-Hybrid-Configuration-without-Edge-009.png)

![Exchange-Hybrid-Configuration-without-Edge-010](images/Exchange-Hybrid-Configuration-without-Edge-010.png)

![Exchange-Hybrid-Configuration-without-Edge-011](images/Exchange-Hybrid-Configuration-without-Edge-011.png)

![Exchange-Hybrid-Configuration-without-Edge-012](images/Exchange-Hybrid-Configuration-without-Edge-012.png)

![Exchange-Hybrid-Configuration-without-Edge-013](images/Exchange-Hybrid-Configuration-without-Edge-013.png)

![Exchange-Hybrid-Configuration-without-Edge-014](images/Exchange-Hybrid-Configuration-without-Edge-014.png)

![Exchange-Hybrid-Configuration-without-Edge-015](images/Exchange-Hybrid-Configuration-without-Edge-015.png)

![Exchange-Hybrid-Configuration-without-Edge-016](images/Exchange-Hybrid-Configuration-without-Edge-016.png)

![Exchange-Hybrid-Configuration-without-Edge-017](images/Exchange-Hybrid-Configuration-without-Edge-017.png)

![Exchange-Hybrid-Configuration-without-Edge-018](images/Exchange-Hybrid-Configuration-without-Edge-018.png)

![Exchange-Hybrid-Configuration-without-Edge-019](images/Exchange-Hybrid-Configuration-without-Edge-019.png)

![Exchange-Hybrid-Configuration-without-Edge-020](images/Exchange-Hybrid-Configuration-without-Edge-020.png)

[Top](#)

---

## Install Exchange Hybrid Configuration Wizard with Edge

### Connectors on Exchange Hybrid with Edge

Exchange Online 관리센터의 Mail flow의 Connector에 아래의 Connectors가 생성되었음을 확인할 수 있습니다:

| Name | From | To |
|--|--|--|
| **Inbound from ...** | Organization | O365 |
| **Outbound to ...**  | O365 | Organization |

#### Connectors on Exchange Online

##### Inbound Connector on Exchange Online

- **ConnectorType**: OnPremises
- **ConnectorSource**: HybridWizard
- **SenderDomain**: `{smtp:*;1}`
- **RequireTls**: True
- **CloudServicesMailEnabled**: True
- **TlsSenderCertificateName**: Hybrid Wizard에서 선택한 Certificated의 Name

##### Outbound Connector on Exchange Online

- **ConnectorType**: OnPremises
- **ConnectorSource**: HybridWizard
- **RecipientDomains**: `{*}`
- **SmartHosts**: Hybrid Wizard에서 선택한 조직의 Edge Servers
- **TlsDomain**: Hybrid Wizard에서 선택한 FQDN
- **TlsSettings**: Domain Validation
- **RouteAllMessagesViaOnPremises**: True (Centralize mail flow option) or False
- **CloudServicesMailEnabled**: True
- **ValidationRecipients**

##### IntraOrganizationConnector on Exchange Online

- **TargetAddressDomains**: accepted domains
- **DiscoveryEndpoint**: https://`<autodiscover endpoint fqdn of org>`/autodiscover/autodiscover.svc
- **TargetSharingEpr**: https://`<guid>`.resource.mailboxmigration.his.msappproxy.net/EWS/Exchange.asmx
- **Name**: HybridIOC - `<guid>`

#### Connectors on Organization Exchange Server

Organization의 Exchange 관리센터에서 아래의 Connectors가 생성되었음을 확인할 수 있습니다:

| Type | Name | From | To |
|--|--|--|--|
| Receive Connector | **Inbound from Office 365...** | O365 | Organization |

Centralize mail flow option이 선택된 경우 Send Connector는 아래와 같습니다:

>[!TODO]

| Type | Name | From | To |
|--|--|--|--|
| Send Connector | **Outbound to ...**  | Organization | O365 |

#### Receive Connectors on Organization Exchange Server

- **TlsCertificateName**: `<i><Issuer of Certificate><s><Subject Name of Certificate>`
- **Permission**: Anonymous Logon - ExtendedRights:MS-Exch-SMTP-Accept-Any-Recipient

>[!TODO]

#### Send Connectors on Organization Exchange Server

>[!TODO]

### Step by Step

![Exchange-Hybrid-Configuration-with-edge-001](images/Exchange-Hybrid-Configuration-with-edge-001.png)

![Exchange-Hybrid-Configuration-with-edge-002](images/Exchange-Hybrid-Configuration-with-edge-002.png)

![Exchange-Hybrid-Configuration-with-edge-003](images/Exchange-Hybrid-Configuration-with-edge-003.png)

![Exchange-Hybrid-Configuration-with-edge-004](images/Exchange-Hybrid-Configuration-with-edge-004.png)

![Exchange-Hybrid-Configuration-with-edge-005](images/Exchange-Hybrid-Configuration-with-edge-005.png)

![Exchange-Hybrid-Configuration-with-edge-006](images/Exchange-Hybrid-Configuration-with-edge-006.png)

![Exchange-Hybrid-Configuration-with-edge-007](images/Exchange-Hybrid-Configuration-with-edge-007.png)

![Exchange-Hybrid-Configuration-with-edge-008](images/Exchange-Hybrid-Configuration-with-edge-008.png)

![Exchange-Hybrid-Configuration-with-edge-009](images/Exchange-Hybrid-Configuration-with-edge-009.png)

![Exchange-Hybrid-Configuration-with-edge-010](images/Exchange-Hybrid-Configuration-with-edge-010.png)

![Exchange-Hybrid-Configuration-with-edge-011](images/Exchange-Hybrid-Configuration-with-edge-011.png)

![Exchange-Hybrid-Configuration-with-edge-012](images/Exchange-Hybrid-Configuration-with-edge-012.png)

![Exchange-Hybrid-Configuration-with-edge-013](images/Exchange-Hybrid-Configuration-with-edge-013.png)

[Top](#)

---

## Related PowerShell Commands

- **[Get-InboundConnector](https://learn.microsoft.com/en-us/powershell/module/exchange/get-inboundconnector?view=exchange-ps)**

    Module: ExchangePowerShell  
    Applies to: Exchange Online, Exchange Online Protection

- **[Get-OutboundConnector](https://learn.microsoft.com/en-us/powershell/module/exchange/get-outboundconnector?view=exchange-ps)**

    Module: ExchangePowerShell  
    Applies to: Exchange Online, Exchange Online Protection

- **[Get-IntraOrganizationConnector](https://learn.microsoft.com/en-us/powershell/module/exchange/get-intraorganizationconnector?view=exchange-ps)**

    Module: ExchangePowerShell  
    Applies to: Exchange Server 2013, Exchange Server 2016, Exchange Server 2019, Exchange Online

- **[Get-OnPremisesOrganization](https://learn.microsoft.com/en-us/powershell/module/exchange/get-onpremisesorganization?view=exchange-ps)**

    Module: ExchangePowerShell  
    Applies to: Exchange Online, Exchange Online Protection

- **[Get-IntraOrganizationConfiguration](https://learn.microsoft.com/en-us/powershell/module/exchange/get-intraorganizationconfiguration?view=exchange-ps)**

    Module: ExchangePowerShell  
    Applies to: Exchange Server 2013, Exchange Server 2016, Exchange Server 2019, Exchange Online

- **[Get-HybridConfiguration](https://learn.microsoft.com/en-us/powershell/module/exchange/get-hybridconfiguration?view=exchange-ps)**

    Module: ExchangePowerShell
    Applies to: Exchange Server 2010, Exchange Server 2013, Exchange Server 2016, Exchange Server 2019

- **[Get-SendConnector](https://learn.microsoft.com/en-us/powershell/module/exchange/get-sendconnector?view=exchange-ps)**

    Module: ExchangePowerShell  
    Applies to: Exchange Server 2010, Exchange Server 2013, Exchange Server 2016, Exchange Server 2019

- **[Get-ReceiveConnector](https://learn.microsoft.com/en-us/powershell/module/exchange/get-receiveconnector?view=exchange-ps)**

    Module: ExchangePowerShell  
    Applies to: Exchange Server 2010, Exchange Server 2013, Exchange Server 2016, Exchange Server 2019

[Top](#)

---

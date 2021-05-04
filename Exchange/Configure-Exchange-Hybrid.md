---
title: Configure Exchange Hybrid
filename: Exchange\Configure-Exchange-Hybrid.md
date: 2012.04.29
---

# Configure Exchange Hybrid

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

![Hybrid-Deployment-Example](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Hybrid-Deployment-Example.png?raw=true)

---

## Exchange Hybrid Deployment Considerations

- Common Considerations

    - [Hybrid Deployment Requirements](https://docs.microsoft.com/en-us/exchange/hybrid-deployment-prerequisites)
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

    [Certificate requirements for hybrid deployments](https://docs.microsoft.com/en-us/exchange/certificate-requirements)

    ![Exchange-Hybrid-Configuration-with-Edge](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-with-Edge.png?raw=true)

- Client Requirements

    Pre-Outlook 2010 clients aren't supported in hybrid deployments or with Microsoft 365 or Office 365.

- Information Rights Management

    [IRM in Exchange hybrid deployments](https://docs.microsoft.com/en-us/exchange/irm)

- [Exchange Online Limits](https://docs.microsoft.com/en-us/office365/servicedescriptions/exchange-online-service-description/exchange-online-limits)

---

## Install Microsoft Office 365 Hybrid Configuration Wizard

![Exchange-Hybrid-Configuration-without-Edge-001](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-001.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-002](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-002.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-003](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-003.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-004](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-004.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-005](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-005.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-006](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-006.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-007](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-007.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-008](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-008.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-009](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-009.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-010](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-010.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-011](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-011.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-012](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-012.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-013](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-013.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-014](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-014.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-015](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-015.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-016](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-016.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-017](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-017.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-018](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-018.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-019](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-019.png?raw=true)

![Exchange-Hybrid-Configuration-without-Edge-020](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Hybrid-Configuration-without-Edge-020.png?raw=true)

---

---
title: Configure Exchange Hybrid
filename: Exchange\Configure-Exchange-Hybrid.md
date: 2012.04.29
---

# Configure Exchange Hybrid

Hybrid Deploymentsms 아래의 기능들을 가능하게 합니다:

- On-Premises 와 Exchange Online 간의 Secure mail routing
- 공유된 domain namespace로 mail routing, 예: @exchange.info
- Unified Global Address List(GAL), Shared Address Book
- On-Premises 와 Exchange Online 간의 Free/Busy 및 Calendar 공유
- 옵션: 중앙화된 Inbound 및 Outbount mail flow 제어
- On-Premises 와 Exchange Online에서 하나의 Single Outlook on the Web URL **[How?]**
- Exchange Online으로 On-Boarding 및 Off-Boarding Mailbox Move
- On-Premises의 Exchange Admin Center(EAC)에서의 중앙화된 Mailbox 관리(Online 포함)
- On-Premises 와 Exchange Online의 Message Tracking 및 MailTips, 검색
- Cloud-based message Archiving

## Exchange Hybrid Deployment Considerations

1. Common Considerations

    - [Hybrid Deployment Requirements](https://docs.microsoft.com/en-us/exchange/hybrid-deployment-prerequisites)
    - Exchange ActiveSync Clients: 대부분 ActiveSync Clients들은 자동으로 Exchange Online으로 설정 변경되어짐
    - Mailbox Permissions Migration: 명시적으로 지정된 Send As 및 Full Access, Send on Behalf, Folder permissions 과 같은 명시적으로 지정된 Mailbox Permissions은 Exchange Online으로 Migration되지만, 상속되어진 명시적으로 지정되지 않은 Mailbox Permission은 Migration되지 않음
    - Off-boarding
    - Mailbox Forwarding Settings: On-Premises Mailbox forwoarding 설정이 Exchange Online Mailbox로 migration 되지 않음
        - 관련 Exchange Online Mailbox 속성:
            - DeliverToMailboxAndForward
            - ForwardingAddress
            - ForwardingSmtpAddress

1. Directory Synchronization and Single Sign-On

1. Certificates

1. Unified Messaging

1. Client Requirements (Not Supported Outlook 2010)

1. Information Rights Management

TODO: https://docs.microsoft.com/en-us/exchange/exchange-hybrid

![Hybrid-Deployment-Example](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Hybrid-Deployment-Example.png?raw=true)

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

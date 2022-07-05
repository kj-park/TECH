---
title: Exchange
filename: Exchange/readme.md
ms.date: 2021.04.01
---

# Exchange

On-Premier 기반의 Exchange Server를 통해 Messaging 시스템을 구축 및 설정, 관리에 대한 기술들을 명시합니다.
엔지니어 관점에서 steps들을 설명하며 연관 기술에 대하여도 함께 설명합니다. 또한 각 내용들과 Powershell 기반 구성이 가능한 부분이 있다면 script도 같이 공유하였습니다.

> [!NOTE] 계속적으로 업데이트 예정입니다.

## Deploy Exchange Server

On-Premier 기반의 Exchange Server 구축에 대하여 기술합니다.

Exchange 2013/2016/2019 서버를 구축하는 과정들에 대하여 기술합니다.

### Exchange 2013 Server

- [Deploy Exchange 2013](2013/Deploy-Exchange-2013)

### Exchange 2016 Server

- Deploy Exchange 2016

### Exchange 2019 Server

- Deploy Exchange 2019

## Configure Exchange Server

Exchange 각 버전 별 설치 후 mail flow 및 client access, High Availability 구성에 대하여 설명합니다. 버전과 크게 다르지 않고 유사하기에 통합하여 명시하였습니다.

- [Configure mail flow and client access for Exchange Server](Configure-mail-flow-and-client-access-for-Exchange-Server)

    - **SCRIPT**: [Configure-ExchangeMailFlowClientAccess.ps1](https://github.com/kj-park/tech/blob/main/Exchange/source/Configure-ExchangeMailFlowClientAccess.ps1)

- [Configure High availability](Configure-High-availability)

    - **SCRIPT**: [Configure-Exchange-DAG.ps1](https://github.com/kj-park/tech/blob/main/Exchange/source/Configure-Exchange-DAG.ps1)

- Configure High availability

- Exchange Hybrid Configuration

- Integration with SharePoint and Skype

## Manage Exchange Server

Exchange 인프라를 관리에 필요한 주제들에 대하여 기술합니다.

- [Maintenance or Update Exchange DAG members](Maintenance-or-Update-DAG-Members)

- Manage MailboxDatabases and Mailbox

- Migration Exchange Infrastructure
    - Between On-Premeise
    - From On-Premeise To Exchange Online

- Manage Address Boooks (OAB, Global Address List, Address List Address Book Policy)
    - Split Address Book
    - Hierarchical Address Books

- Sharing and Organization Relationship

## Exchange Online

- Migrating Mailbox to Microsoft 365
    - [Exchange Hybrid Off-Boarding Migration](Online/Exchange-Hybrid-Off-Boarding-Migration)
    - [Importing PST file to Microsoft 365](Online/Importing-PST-file-to-Microsoft-365)
    - [Migrating your IMAP mailboxes to Microsoft 365](Online/Migrating-your-IMAP-mailboxes-to-Microsoft-365)

- [Exchange Online Quarantine](Online/Exchange-Online-Quarantine)

- [Configure Microsoft 365 Groups with on-premises Exchange Hybrid](Online/Configure-Microsoft-365-Groups-with-on-premises-Exchange-Hybrid)

## Conceptual Documents

- [How to use Sender Policy Framework (SPF) to prevent spoofing](Conceptual/Sender-Policy-Framework)

- [Accepted domains and Email Address Policies in Exchange Server](Conceptual/Accepted-domains-and-Email-Address-Policies-in-Exchange-Server)

- [Understanding the Transport Pipeline](Conceptual/Understanding-the-Transport-pipeline)

- [Digital certificates and encryption in Exchange Server](Conceptual/Certificate-and-Encrpytion-in-Exchange-Server)

- [Exchange Mail Flow and Recipient Types](Conceptual/Exchange-Mail-Flow-and-Recipient-Types)

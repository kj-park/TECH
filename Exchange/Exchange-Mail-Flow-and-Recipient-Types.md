
# Exchange Mail Flow and Recipient Types

---

Contents:

- [Exchange Mail Flow Design and Configuration](#exchange-mail-flow-design-and-configuration)
- [Exchange Recipient Types and Explanation](#exchange-recipient-types-and-explanation)
- [Exchange Clients Services](#exchange-clients-services)

---

## Exchange Mail Flow Design and Configuration

### SMTP & DNS protocol in Mail Flow Conceptual Aspect

#### Simple Mail Transfer Protocol (RFC5321)

![SMTP (RFC5321) Explanation](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Mail-Flow-and-Recipient-Types-001.png?raw=true)

> [!INFO]  
> SMTP Service Extension for Secure SMTP over Transport Layer Security (RFC3207) ~ STARTTLS command for secure SMTP

```dos
EHLO movetocloud.online
MAIL FROM: mimi@movetocloud.online
RCPT TO: kjpark@tdgl.co.kr
DATA
Subject: Test mail flow to tdgl.co.kr

This is a test message...
.
```

![SMTP Command](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Mail-Flow-and-Recipient-Types-002.png?raw=true)

> [!INFO]  
> [Use Telnet to test SMTP communication on Exchange servers](https://docs.microsoft.com/en-us/exchange/mail-flow/test-smtp-with-telnet)

#### Domain Names

- Concepts and Facilities (RFC1034)
- Implementation and Specification (RFC1035)

![DNS Structure](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Mail-Flow-and-Recipient-Types-003.png?raw=true)

![DNS Query](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Mail-Flow-and-Recipient-Types-004.png?raw=true)

#### Exchange Mail Flow & Client Access for DNS Resource Records

##### MX Record

Recipient Domain의 Mail Exchanger의 정보를 나타냄.

![MX Record Explanation](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Mail-Flow-and-Recipient-Types-005.png?raw=true)

##### Sender Policy Framework (SPF: RFC4408)

Mail의 Sender(Mail Exchanger)를 확인하는 과정을 통해 phishing 이나 spam을 줄이기 위하여 사용되어지는 기술.

Sender domain 공인된 DNS의 다음 record들 Query하여 Sender ID를 확인:

- MX 및 A(CNAME) Record
- TXT 중 SPF 정보 (예: v=spf1 include:spf.protection.outlook.com –all)

> [!INFO]  
> [SPF Record Syntax (open-spf.org)](http://www.open-spf.org/SPF_Record_Syntax/)

##### DKIM (RFC5585) & DMARC (RFC7489)

- DomainKeys Identified Mail (DKIM)

    [How to use DKIM for email in your custom domain - Office 365 - Microsoft Docs](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/use-dkim-to-validate-outbound-email)

- Domain-based Message Authentication, Reporting & Conformance (DMARC)

    [Use DMARC to validate email, setup steps - Office 365 - Microsoft Docs](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/use-dmarc-to-validate-email)

##### AUTODISCOVER.TDGL.CO.KR (A & CNAME & SRV Record)

- Microsoft Exchange Server의 Autodiscover 서비스에서 사용하는 DNS Record
- AUTODISCOVER  A 또는 CNAME, SRV  DNS record로 구성할 수 있음

### Inbound & Outbound Mail Flow

#### Inbound Mail Flow

##### Inbound Mail Flow without Edge

![Inbound Mail Flow without Edge](https://github.com/kj-park/Tech/blob/main/Exchange/.media/inbound-mail-flow-without-edge.png?raw=true)

##### Inbound Mail Flow with Edge

![Inbound Mail Flow with Edge](https://github.com/kj-park/Tech/blob/main/Exchange/.media/inbound-mail-flow-with-edge.png?raw=true)

#### Outbound Mail Flow

##### Outbound Mail Flow without Edge

![Outbound Mail Flow without Edge](https://github.com/kj-park/Tech/blob/main/Exchange/.media/outbound-mail-flow-without-edge.png?raw=true)

##### Outbound Mail Flow with Edge

![Outbound Mail Flow with Edge](https://github.com/kj-park/Tech/blob/main/Exchange/.media/outbound-mail-flow-with-edge.png?raw=true)

#### Connectors & Accepted Domains

##### Exchange Connectors

- **Receive Connectors.** 수신 커넥터는 들어오는 SMTP 메일 흐름을 제어합니다. 커넥터의 구성과 일치하는 들어오는 연결을 수신합니다.

    [Receive connectors - Microsoft Docs](https://docs.microsoft.com/en-us/exchange/mail-flow/connectors/receive-connectors)

    Customer Receive Connectors:

    ![Customer Receive Connectors](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Mail-Flow-and-Recipient-Types-006.png?raw=true)

- **Send Connectors.** 송신 커넥터는 보내는 SMTP 메일 흐름을 제어합니다. 메시지 받는 사람 및 커넥터의 구성에 따라 송신 커넥터가 선택됩니다.

    [Send connectors in Exchange Server - Microsoft Docs](https://docs.microsoft.com/en-us/exchange/mail-flow/connectors/send-connectors)

    - Internet Mail Send Connectors
    - Outbound Smart Host Routing

- **[Protocol Logging - Microsoft Docs](https://docs.microsoft.com/en-us/exchange/mail-flow/connectors/protocol-logging)**

##### Accepted Domain

Accepted Domains은 Exchange Organization의 메일을 수신하게 구성된 SMTP address namespace.  Email Address Policies에서 사용.

- Authoritative Domains
- Relay Domains (Internal Relay & External Relay)

### Transport Availability and Features

#### Transport Agents

Transport Agent는 Microsoft 또는 3rd-Party vendor에 제공하는 소프트웨어를 설치할 수 있으며, transport pipeline을 통해 들어온 email messages들에 대한 추가적인 process 또는 action 처리를 할 수 있게 합니다.

##### Transport Agent 분류

- SmtpReceiveAgent
- RoutingAgent
- DeliveryAgent

> [!INFO]  
> [Built-in Transport Agent - Microsoft Docs](https://docs.microsoft.com/en-us/exchange/mail-flow/transport-agents/transport-agents?#built-in-transport-agents)

##### [Mail Flow & Transport Pipeline - Microsoft Docs](https://docs.microsoft.com/en-us/exchange/mail-flow/mail-flow)

![Transport Pipeline Overview](https://github.com/kj-park/Tech/blob/main/Exchange/.media/transport-pipeline-overview.png?raw=true)

#### Transport High Availability & Queues

##### Transport High Availability

Exchange 서버는 message가 성공적으로 배달되기 전/후로 redundant copies를 유지하여 Transport에 대한 High Availability를 확보합니다.

Exchange 서버의 Transport High Availability을 제공하는 핵심 기능은 아래와 같습니다:

- [Shadow Redundancy](https://docs.microsoft.com/en-us/exchange/mail-flow/transport-high-availability/shadow-redundancy)
    ![Exchange Shadow Redundancy](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Shadow-Redundancy.png?raw=true)

- [Safety Net](https://docs.microsoft.com/en-us/exchange/mail-flow/transport-high-availability/safety-net)

**Transport High Availablity with Shadow Redundancy and Safety Net**

![Exchange Transport High Availability](https://github.com/kj-park/Tech/blob/main/Exchange/.media/Exchange-Transport-High-Availability.png?raw=true)

##### [Queues and messages in queues in Exchange Server - Microsoft Docs](https://docs.microsoft.com/en-us/exchange/mail-flow/queues/queues)

#### [Message Size and Recipient Limits](https://docs.microsoft.com/en-us/exchange/mail-flow/message-size-limits)

**Scope of Limits**

1. Organizational Limits
1. Connector Limits
1. Server Limits
1. Recipient Limits

**Types of message size limits**

- Whole message size limits
- Attachment size limits
- Recipient limits
- Message header size limits

---

## Exchange Recipient Types and Explanation

### Exchange Recipient Types

#### Mailbox

- User Mailbox
- Linked Mailbox
- Microsoft 365 Mailbox
- Shared Mailbox (Full Access &vert; Send As &vert; Send on Behalf)
- Resource Mailbox (Room &vert; Equipment)



#### Distribution Groups

#### Mail Users & Mail Contacts

### Recipient Features

#### Email Address & Forwarding

#### Mailbox Permissions & Search, Move

---

## Exchange Clients Services

### Clients Type & Services

#### Autodiscover Service

#### MAPI over HTTP & POP3, IMAP

#### Mobile Outlook App & ActiveSync

#### Outlook on the Web

### Mailbox Access & Policies

#### Mailbox Access

#### Mobile Device Mailbox Policy

#### OWA Mailbox Policy

---
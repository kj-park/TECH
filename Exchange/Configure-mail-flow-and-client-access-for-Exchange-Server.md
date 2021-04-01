---
title: Configure mail flow and client access for Exchange Server
filename: Exchange\Configure-mail-flow-and-client-access-for-Exchange-Server.md
date: 2012.03.30
---

# Configure the mail flow and client access for Exchange Server


## DNS Resource Record 구성

### 처음 구성을 위한 default domain namespace에 대하여 필요한 DNS records 구성

Exchange 서버를 처음 구성 시 두 가지 측면에 대한 DNS resource records 구성이 필요합니다.

- DNS resource records for mail flow
    - [ ] A records for Exchange Servers
    - [ ] MX record for mail flow
    - [ ] TXT record for Sender Policy Framework (SPF)
        > [!NOTE]
        > Sender Policy Framework에 대하여는 아래의 링크를 참조하세요.
        > [How to use Sender Policy Framework (SPF) to prevent spoofing](Conceptual/Sender-Policy-Framework)

- DNS resource records for client access
    - [ ] A or CNAME records for `autodiscover` service
    - [ ] A or CNAME records for the default name of client access


```powershell
#region DNS Resource Records
    <#
    - DNS resource records for mail flow
        - [X] A records for Exchange Servers
            - A: ex01.exchange.info
            - A: ex02.exchange.info
        - [X] MX record for mail flow
            - Preference: 10
            - Name: "."
            - MailExchange: "outlook.exchange.info"
            - ZoneName: "exchange.info" 
        - [ ] TXT record for Sender Policy Framework (SPF)

    - DNS resource records for client access
        - [X] A or CNAME records for `autodiscover` service
            - A: autodiscover.exchange.info
        - [X] A or CNAME records for the default name of client access
            - A: outlook.exchange.info
    #>

    Install-WindowsFeature RSAT-DNS-Server

    Add-DnsServerResourceRecordA -Name outlook -IPv4Address 10.2.13.1 -CreatePtr -ZoneName exchange.info -CimSession dc01.exchange.info -PassThru -Verbose
    Add-DnsServerResourceRecordA -Name outlook -IPv4Address 10.2.13.2 -CreatePtr -ZoneName exchange.info -CimSession dc01.exchange.info -PassThru -Verbose

    Add-DnsServerResourceRecordA -Name autodiscover -IPv4Address 10.2.13.1 -CreatePtr -ZoneName exchange.info -CimSession dc01.exchange.info -PassThru -Verbose
    Add-DnsServerResourceRecordA -Name autodiscover -IPv4Address 10.2.13.2 -CreatePtr -ZoneName exchange.info -CimSession dc01.exchange.info -PassThru -Verbose

    Add-DnsServerResourceRecordMX -Preference 10  -Name "." -MailExchange "outlook.exchange.info" -ZoneName "exchange.info" -CimSession dc01.exchange.info -PassThru -Verbose

#endregion
```

## Exchange 인증서 구성

Exchange는 Clients Access 및 Server Communication에 SSL 기반 통신을 기본으로 구성되어집니다. 따라서 Exchange 인증서 구성에 대하여 고려를 하여야 합니다.

> [!NOTE]
> [Digital certificates and encryption in Exchange Server](Conceptual\Certificate-and-Encrpytion-in-Exchange-Server)

Exchange.Info 도메인을 사용하는 Exchange Server 조직의 경우 이 예는 필요한 최소 호스트 이름의 가상 예입니다.

- outlook.exchange.info: 이 호스트 이름에는 Outlook, 웹용 Outlook, OAB 배포, Exchange 웹 서비스, Exchange ActiveSync, Exchange 관리 센터 및 Exchange 관리 센터를 비롯한 Exchange에 대한 대부분의 연결

- autodiscover.exchange.info: 이 특정 호스트 이름은 Outlook, Exchange ActiveSync 및 Exchange 웹 서비스 클라이언트를 포함하여 자동 검색을 지원하는 클라이언트에 필요합니다.



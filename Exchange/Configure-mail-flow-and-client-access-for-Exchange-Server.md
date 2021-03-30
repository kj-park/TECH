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
        > [How to use Sender Policy Framework (SPF) to prevent spoofing](/Tech/Exchange/Conceptual/Sender-Policy-Framework)

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

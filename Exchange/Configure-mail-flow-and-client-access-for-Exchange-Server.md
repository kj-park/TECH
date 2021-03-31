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

## Exchange 인증서 구성

Exchange는 Clients Access 및 Server Communication에 SSL 기반 통신을 기본으로 구성되어집니다. 따라서 Exchange 인증서 구성에 대하여 고려를 하여야 합니다.

### Digital Certificates Overview

디지털 인증서는 사용자 또는 컴퓨터의 ID를 확인하기 위해 온라인 암호처럼 작동되는 전자 파일입니다. 클라이언트 통신에 사용되는 암호화된 채널을 만드는 데 사용됩니다. 인증서는 CA(인증 기관)에서 발급한 디지털 문서로, 인증서 소유자의 ID를 보장하고 당사자가 암호화를 사용하여 안전한 방식으로 통신할 수 있도록 합니다.

인증서는 아래의 서비스를 제공합니다.

- **Encryption**: 데이터의 도난이나 변조로(theft or tampering) 부터 보호합니다.

- **Authentication**: 




https://docs.microsoft.com/en-us/exchange/architecture/client-access/certificates?view=exchserver-2019

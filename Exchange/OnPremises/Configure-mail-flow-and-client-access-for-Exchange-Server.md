---
title: Configure mail flow and client access for Exchange Server
filename: Exchange\Configure-mail-flow-and-client-access-for-Exchange-Server.md
ms.date: 2012.03.30
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

## Configure Exchange Certificate

Exchange는 Clients Access 및 Server Communication에 SSL 기반 통신을 기본으로 구성되어집니다. 따라서 Exchange 인증서 구성에 대하여 고려를 하여야 합니다.

> [!NOTE]
> [Digital certificates and encryption in Exchange Server](Conceptual\Certificate-and-Encrpytion-in-Exchange-Server)

Exchange.Info 도메인을 사용하는 Exchange Server 조직의 경우 이 예는 필요한 최소 호스트 이름의 가상 예입니다.

- outlook.exchange.info: 이 호스트 이름에는 Outlook, 웹용 Outlook, OAB 배포, Exchange 웹 서비스, Exchange ActiveSync, Exchange 관리 센터 및 Exchange 관리 센터를 비롯한 Exchange에 대한 대부분의 연결

- autodiscover.exchange.info: 이 특정 호스트 이름은 Outlook, Exchange ActiveSync 및 Exchange 웹 서비스 클라이언트를 포함하여 자동 검색을 지원하는 클라이언트에 필요합니다.


```powershell
#region Exchange Certificate Configuration

    # New CA Request

    $sncn = "outlook.exchange.info"
    $san = @(
        "outlook.exchange.info"
        "autodiscover.exchange.info"
        "ex01.exchange.info"
        "ex02.exchange.info"
    )

    $sn = "CN=$sncn, OU=EXCH, O=EXCHANGE LAB, L=JUNG-GU, S=SEOUL, C=KR"

    $Req = New-ExchangeCertificate -GenerateRequest -SubjectName $sn -DomainName $san -PrivateKeyExportable $true -FriendlyName "EXCH-MAIL-CERTIFICATE"

    New-Item -Name Working -Path 'C:\' -ItemType Directory
    Set-Content -Path 'C:\Working\exch-mail-ca.req' -Value $Req

    # Submit CA Request and Download Certificate

    # Request and Complete/Download/Install the Certificate.

    Import-ExchangeCertificate -FileName '\\EX01\C$\Working\exch-mail.cer' -Password (ConvertTo-SecureString -String "!Qaz@Wsx" -AsPlainText -Force)

    # Export the Certificate for other Exchange Servers

    Get-ExchangeCertificate

    <#OUTPUT
      Thumbprint                                Services   Subject                                                                                                           
      ----------                                --------   -------                                                                                                           
    * B8FFF722AAF9E4CFA055581061F6020C70BAC8AF  ...WS..    CN=outlook.exchange.info, OU=EXCH, O=EXCHANGE LAB, L=JUNG-GU, S=SEOUL, C=KR <== Exchange Server Certificate for Exporting
      C07B19E88671134C4C4A38D72F0A587974CE137D  IP.WS..    CN=EX01
      4CE834243B37D27F29379287D3DED6294935EB2D  ....S..    CN=Microsoft Exchange Server Auth Certificate
      EB68147037AA94700E07832B99A71CC6F6FAAD5A  .......    CN=WMSvc-EX01
    #>

    Export-ExchangeCertificate -Thumbprint B8FFF722AAF9E4CFA055581061F6020C70BAC8AF -FileName 'C:\Working\exch-mail-ca.pfx' -BinaryEncoded -Password (ConvertTo-SecureString -String "!Qaz@Wsx" -AsPlainText -Force)

    # Import Certificate for other Exchange Servers

    Import-ExchangeCertificate -FileName "\\EX01\C$\Working\exch-mail-ca.pfx" -Password (ConvertTo-SecureString -String "!Qaz@Wsx" -AsPlainText -Force) -Server EX02

    # Assign Certificate to services
    <#Services
        - IIS
        - IMAP
        - POP
        - SMTP
        - UM
        - UMCallRouter
    #>

    Enable-ExchangeCertificate -Thumbprint B8FFF722AAF9E4CFA055581061F6020C70BAC8AF -Services IIS,SMTP -Server EX01

    Enable-ExchangeCertificate -Thumbprint B8FFF722AAF9E4CFA055581061F6020C70BAC8AF -Services IIS,SMTP -Server EX02

#endregion
```

## Configuration Namespaces for Client Access on Exchange Server

Exchange Server는 다양한 형태의 clients에 대하여 Exchange Mailbox의 정보를 access할 수 있게 서비스를 제공합니다. Desktop Outlook 및 Outlook on the Web(OWA), Mobile phones, Tablets 등이 포함됩니다.

- MAPI over HTTP in Exchange Server
- Outlook Anywhere
- Exchange ActiveSync
- POP3 and IMAP4 in Exchange Server
- Outlook for iOS and Android
- Outlook on the web in Exchange Server

Client Access에서 사용되어지는 namespaces는 Exchange의 이런 서비스와 연관된 IIS의 Virtual Directories의 External/Internal URLs로 설정할 수 있습니다.

```powershell
#region Set Exchange External/Internal URLs

    $servers = @("EX01","EX02")

    $exchangeURLs = @{
        easExt = 'https://outlook.exchange.info/Microsoft-Server-ActiveSync'
        easInt = 'https://outlook.exchange.info/Microsoft-Server-ActiveSync'
        ewsExt = 'https://outlook.exchange.info/EWS/Exchange.asmx'
        ewsInt = 'https://outlook.exchange.info/EWS/Exchange.asmx'
        ecpExt = 'https://outlook.exchange.info/ecp'
        ecpInt = 'http://outlook.exchange.info/ecp'
        oabExt = 'https://outlook.exchange.info/OAB'
        oabInt = 'http://outlook.exchange.info/OAB'
        owaExt = 'https://outlook.exchange.info/owa'
        owaInt = 'http://outlook.exchange.info/owa'
        powershellExt = 'http://outlook.exchange.info/powershell'
        powershellInt = 'http://outlook.exchange.info/powershell'
        mapiExt = 'https://outlook.exchange.info/mapi'
        mapiInt = 'https://outlook.exchange.info/mapi'
    }

    $GetExchangeURLs = @()
    foreach ( $server in $servers ) {
        # Set URLs
        Set-ActiveSyncVirtualDirectory -Identity "$server\Microsoft-Server-ActiveSync (Default Web Site)" -InternalUrl $exchangeURLs.easInt -ExternalUrl $exchangeURLs.easExt
        Set-WebServicesVirtualDirectory -Identity "$server\EWS (Default Web Site)" -InternalUrl $exchangeURLs.ewsInt -Force -ExternalUrl $exchangeURLs.ewsExt
        Set-EcpVirtualDirectory -Identity "$server\ecp (Default Web Site)" -InternalUrl $exchangeURLs.ecpInt  -ExternalUrl $exchangeURLs.ecpExt
        Set-OabVirtualDirectory -Identity "$server\OAB (Default Web Site)" -InternalUrl $exchangeURLs.oabInt  -ExternalUrl $exchangeURLs.oabExt
        Set-OwaVirtualDirectory -Identity "$server\owa (Default Web Site)" -InternalUrl $exchangeURLs.owaInt -ExternalUrl $exchangeURLs.owaExt
        Set-PowerShellVirtualDirectory -Identity "$server\PowerShell (Default Web Site)" -InternalUrl $exchangeURLs.powershellInt -ExternalUrl $exchangeURLs.powershellExt
        Set-MapiVirtualDirectory -Identity "$server\mapi (Default Web Site)" -InternalUrl $exchangeURLs.mapiInt -ExternalUrl $exchangeURLs.mapiExt

        #Get URLs
        $GetExchangeURLs += Get-ActiveSyncVirtualDirectory -Identity "$server\Microsoft-Server-ActiveSync (Default Web Site)" | Select-Object -Property Identity,InternalUrl,ExternalUrl
        $GetExchangeURLs += Get-WebServicesVirtualDirectory -Identity "$server\EWS (Default Web Site)" | Select-Object -Property Identity,InternalUrl,ExternalUrl
        $GetExchangeURLs += Get-EcpVirtualDirectory -Identity "$server\ecp (Default Web Site)" | Select-Object -Property Identity,InternalUrl,ExternalUrl
        $GetExchangeURLs += Get-OabVirtualDirectory -Identity "$server\OAB (Default Web Site)" | Select-Object -Property Identity,InternalUrl,ExternalUrl
        $GetExchangeURLs += Get-OwaVirtualDirectory -Identity "$server\owa (Default Web Site)" | Select-Object -Property Identity,InternalUrl,ExternalUrl
        $GetExchangeURLs += Get-PowerShellVirtualDirectory -Identity "$server\PowerShell (Default Web Site)" | Select-Object -Property Identity,InternalUrl,ExternalUrl
        $GetExchangeURLs += Get-MapiVirtualDirectory -Identity "$server\mapi (Default Web Site)" | Select-Object -Property Identity,InternalUrl,ExternalUrl
    }
    $GetExchangeURLs

    # Config Autodiscover ServiceInternalURI

    foreach ( $server in $servers ) {
        if ( (Get-ExchangeServer -Identity $server).AdminDisplayVersion.Major -gt 15 ) {
            # Over Exchange 2016
            Set-ClientAccessService -Identity $server -AutoDiscoverServiceInternalUri https://autodiscover.exchange.info/Autodiscover/Autodiscover.xml
        }
        else {
            # To Exchange 2013
            Set-ClientAccessServer -Identity $server -AutoDiscoverServiceInternalUri https://autodiscover.exchange.info/Autodiscover/Autodiscover.xml
        }
    }

    foreach ( $server in $servers ) {
        if ( (Get-ExchangeServer -Identity $server).AdminDisplayVersion.Major -gt 15 ) {
            # Over Exchange 2016
            Get-ClientAccessService -Identity $server | Format-Table -Property Name,AutoDiscoverServiceInternalUri -AutoSize
        }
        else {
            # To Exchange 2013
            Get-ClientAccessServer -Identity $server | Format-Table -Property Name,AutoDiscoverServiceInternalUri -AutoSize
        }
    }

#endregion
```

## OPTION: Changing Exchange Transport Database(Queue) Path

선택적으로 각 Exchange 서버의 Exchange Transport Database(Queue)의 경로를 변경할 수 있습니다. Exchange Transport Database로 사용할 Disk(Volume)는 조직의 mail flow의 크기 및 성능을 고려한 disk type을 결정하는 것이 좋습니다.

```powershell
#region OPTION: Changing Queue Database path (execute the script per each exchange server)

    # Crete Folder Structure
    $queueDirectory = 'D:\Queue'
    New-Item -ItemType directory -Path $queueDirectory

    $EdgeTransportConfigs = Get-Content -Path "$($Exbin)EdgeTransport.exe.config"
    $newEdgeTransportConfigs = [String[]]@()
    foreach ( $string in $EdgeTransportConfigs ) {
        if ( $string -match '<add key="QueueDatabasePath"' ) {
            $newEdgeTransportConfigs += "    <add key=""QueueDatabasePath"" value=""$queueDirectory"" />"
        }
        elseif ( $string -match '<add key="QueueDatabaseLoggingPath"' ) {
            $newEdgeTransportConfigs += "    <add key=""QueueDatabaseLoggingPath"" value=""$queueDirectory"" />"
        }
        else {
            $newEdgeTransportConfigs += $string
        }
    }
    $newEdgeTransportConfigs

    Rename-Item -Path "$($Exbin)EdgeTransport.exe.config" -NewName "EdgeTransport.exe.config.gold" -WhatIf
    Set-Content -Path "$($Exbin)EdgeTransport.exe.config" -Value $newEdgeTransportConfigs -Force

    Compare-Object -ReferenceObject $EdgeTransportConfigs -DifferenceObject $newEdgeTransportConfigs
    notepad "$($Exbin)EdgeTransport.exe.config.gold"

    <#
    Modify Config
    <add key="QueueDatabasePath" value="D:\Queue" />
    <add key="QueueDatabaseLoggingPath" value="D:\Queue" />
    #>

    Restart-Service MSExchangeTransport -PassThru

    Get-ChildItem $queueDirectory -Recurse

#endregion
```

## Configuration Exchange Mail flow

Exchange Server 메일 흐름은 Transport Pipeline을 통해 발생합니다. Transport pipeline은 조직의 Exchange Mailbox Server의 Transport 서비스의 모든 message를 분류하고 라우팅하는 services 및 connections, components, queues 모음을 의미합니다.

조직에서 메일 흐름을 구성하는 방법에 대한 자세한 내용은 [Configure mail flow and client access](https://learn.microsoft.com/en-us/Exchange/plan-and-deploy/post-installation-tasks/configure-mail-flow-and-client-access?view=exchserver-2019)를 참조하세요.

> [!NOTE]
> [Understanding the Transport Pipeline](Conceptual/Understanding-the-Transport-pipeline)

### Create an internet Send connector

```powershell
#region Create Send Connector for Global

    $sendConnectorParameters = @{
        Name = 'To Internet'
        Usage = 'Internet'
        DNSRoutingEnabled = $True
        UseExternalDNSServersEnabled = $False
        AddressSpaces= 'SMTP:*;1'
        IsScopedConnector =$False
        SourceTransportServers = $servers
        Fqdn = 'outlook.exchange.info'
        MaxMessageSize = 30MB
        ProtocolLoggingLevel = 'Verbose'
        Enabled = $true
    }
    New-SendConnector @sendConnectorParameters

#endregion
```

### Add additional accepted domains Configure the default email address policy

> [!NOTE]
> [Accepted domains and Email Address Policies in Exchange Server](Conceptual/Accepted-domains-and-Email-Address-Policies-in-Exchange-Server)


```powershell
#region Accepted Domain and Email Address Policy Configuration

    Get-AcceptedDomain | fl

    $newAcceptedDomain = "exchange.co.kr"

    New-AcceptedDomain -Name $newAcceptedDomain -DomainName $newAcceptedDomain -DomainType Authoritative
    <#DomainType
        - Authoritative
        - InternalRelay
        - ExternalRelay
    #>

    # Configure Email Address Policy

    $EmailAddressPolicyParameters = @{
        Name = 'Default EAP'
        IncludedRecipients = 'MailboxUsers'
        EnabledEmailAddressTemplates = @("SMTP:%m@exchange.co.kr","smtp:%m@exchange.info")
        Priority = 1
    }
    New-EmailAddressPolicy @EmailAddressPolicyParameters

    Get-EmailAddressPolicy

#endregion
```

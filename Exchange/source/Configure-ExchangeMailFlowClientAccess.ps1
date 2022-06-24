<#
title: Configure mail flow and client access for Exchange Server
filename: Exchange\Configure-ExchangeMailFlowClientAccess.ps1
permalink: /Tech/Exchange/Configure-ExchangeMailFlowClientAccess.ps1
ms.date: 2012.03.30
#>

#region Connect Exchange Remote Management Shell

    . 'C:\Program Files\Microsoft\Exchange Server\V15\bin\RemoteExchange.ps1'; Connect-ExchangeServer -auto -ClientApplication:ManagementShell

#endregion

#region DNS Resource Records

Install-WindowsFeature RSAT-DNS-Server

Add-DnsServerResourceRecordA -Name outlook -IPv4Address 10.2.13.1 -CreatePtr -ZoneName exchange.info -CimSession dc01.exchange.info -PassThru -Verbose
Add-DnsServerResourceRecordA -Name outlook -IPv4Address 10.2.13.2 -CreatePtr -ZoneName exchange.info -CimSession dc01.exchange.info -PassThru -Verbose
Add-DnsServerResourceRecordA -Name autodiscover -IPv4Address 10.2.13.1 -CreatePtr -ZoneName exchange.info -CimSession dc01.exchange.info -PassThru -Verbose
Add-DnsServerResourceRecordA -Name autodiscover -IPv4Address 10.2.13.2 -CreatePtr -ZoneName exchange.info -CimSession dc01.exchange.info -PassThru -Verbose

#endregion

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

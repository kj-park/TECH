#region Connect Exchange Remote Management Shell

    . 'C:\Program Files\Microsoft\Exchange Server\V15\bin\RemoteExchange.ps1'; Connect-ExchangeServer -auto -ClientApplication:ManagementShell

#endregion

#region Intalling DAG

    <#
    STEP 01: Setting the Vaiables for DAG.

    - [ ] Vaiable: DAG Name
    - [ ] Vaiable: Witness Server Name
    - [ ] Vaiable: Witness Directory Path
    - [ ] Vaiable: DAG PAM Virtual IPAddress
    - [ ] Vaiable: DAG Member Servers (Array)
    - [ ] Check Connectivity with Witness Server

    #>

    # Create the OU for Exchange Servers

    $currentDomain = Get-ADDomain -Current LocalComputer

    # 1st Level OU
    $OU = New-ADOrganizationalUnit -Name "INFRA" -Path ($currentDomain.DistinguishedName) -PassThru
    # 2nd Level OU
    $OU = New-ADOrganizationalUnit -Name "SERVERs" -Path ($OU.DistinguishedName) -PassThru
    # 3rd Level OU
    $OU = New-ADOrganizationalUnit -Name "EXCHANGE" -Path ($OU.DistinguishedName) -PassThru



    # [X] Vaiable: DAG Member Servers (Array)
    $servers = @("EX01", "EX02")
    foreach ( $server in $servers ) { Get-ADComputer -Identity $server | Move-ADObject -TargetPath ($OU.DistinguishedName) }

    # [X] Vaiable: DAG Name
    $DAGName = "EX-DAG01"

    # Create CNO account for DAG
    New-ADComputer -Name $DAGName -Path ($OU.DistinguishedName) -Enabled $False 

    # [X] Vaiable: Witness Server Name
    $WitnessServer = "DC01.exchange.info"

    # [X] Vaiable: Witness Directory Path
    $WitnessDirectory = "C:\DAGWitness"

    # [X] Vaiable: DAG PAM Virtual IPAddress
    $DAGVIPAddress = "255.255.255.255"

    # [X] Check Connectivity with Witness Server
    Test-Connection $WitnessServer
    Test-NetConnection $WitnessServer -Port 445   


    <#
    STEP 02: Install Windows Features for FailOver Clustering Feature

    - [X] Install Windows Features for FailOver Clustering Feature

    #>

    foreach ( $server in $servers ) { Install-WindowsFeature -ComputerName $server -Name FailOver-Clustering }


    <#
    STEP 03: Create the DAG (Database Avaiability Group)

    - [X] Create the DAG
    - [X] Add Servers to DAG Members

    #>

    Add-ADGroupMember -Identity administrators -Members 'Exchange Trusted Subsystem'

    # [X] Create the DAG
    New-DatabaseAvailabilityGroup -Name                                 $DAGName `
                                  -WitnessServer                        $WitnessServer `
                                  -WitnessDirectory                     $WitnessDirectory `
                                  -DatabaseAvailabilityGroupIpAddresses $DAGVIPAddress


    # [X] Add Servers to DAG Members
    foreach ($server in $servers ) { 
        Add-DatabaseAvailabilityGroupServer -Identity $DAGName -MailboxServer $server
    }

    <#
    STEP 04: Setting for DAG Network

    - [X] Checking DAG Network
    - [X] Setting DAG Network to Manual Configuration
    - [X] Setting MAPI DAG Network
    - [X] Setting Replication DAG Network

    #>    

    # [X] Checking DAG Network
    Get-DatabaseAvailabilityGroupNetwork -Identity $DAGName | Format-List

    <# OUTPUT:
    RunspaceId         : 2d979893-7a3d-4526-9570-55d590ab54f7
    Name               : MapiDagNetwork
    Description        : 
    Subnets            : {{10.2.0.0/16,Up}}
    Interfaces         : {{EX01,Up,10.2.13.1}, {EX02,Up,10.2.13.2}}
    MapiAccessEnabled  : True
    ReplicationEnabled : True
    IgnoreNetwork      : False
    Identity           : EX-DAG01\MapiDagNetwork
    IsValid            : True
    ObjectState        : New
    #>

    # [X] Setting DAG Network to Manual Configuration
    Set-DatabaseAvailabilityGroup -Identity $DAGName -ManualDagNetworkConfiguration $false
    
    # [X] Setting MAPI DAG Network
    Get-DatabaseAvailabilityGroupNetwork -Identity $DAGName
    Set-DatabaseAvailabilityGroupNetwork -Identity "$DAGName\MapiDagNetwork" -ReplicationEnabled $false -Subnets 10.2.0.0/16

    # [X] Createing Network ReplicationNetwork for DAG, If, ReplicationDagNetworks were created...
    New-DatabaseAvailabilityGroupNetwork -DatabaseAvailabilityGroup $DAGName -Name 'ReplicationDagNetwork01' -ReplicationEnabled $true -Subnets 10.10.10.0/24
    New-DatabaseAvailabilityGroupNetwork -DatabaseAvailabilityGroup $DAGName -Name 'ReplicationDagNetwork02' -ReplicationEnabled $true -Subnets 20.20.20.0/24

    # [X] Setting Replication DAG Network
    # If Created Replication DAG Network on above, this step can skip.
    Get-DatabaseAvailabilityGroupNetwork -Identity $DAGName
    Set-DatabaseAvailabilityGroupNetwork -Identity "$DAGName\ReplicationDagNetwork01" -ReplicationEnabled $true -Subnets 10.10.10.0/24
    Set-DatabaseAvailabilityGroupNetwork -Identity "$DAGName\ReplicationDagNetwork02" -ReplicationEnabled $true -Subnets 20.20.20.0/24


    <#
    STEP 05: Checking & Setting the Windows Server FailOver Clustering Configurtions

    - [X] Checking the Cluster Name

    #>

    # [X] Checking the Cluster
    Get-Cluster | fl
    <#OUTPUT
    #>

    # [X] Checking the Cluster Group
    Get-ClusterGroup | fl
    <#OUTPUT
    #>

    # [X] Checking the Cluster Resource
    Get-ClusterResource | fl
    <#OUTPUT
    #>

    Get-ClusterNode | fl
    <#OUTPUT
    #>

    Get-ClusterNetwork | fl
    <#OUTPUT
    #>

    Get-ClusterNetworkInterface | fl
    <#OUTPUT
    #>

#endregion



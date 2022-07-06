

<# 
    STEP01: Azure AD Connect 동기화 일정 Disable

    #>

    Set-ADSyncScheduler -SyncCycleEnabled $false


<#
    STEP02: AD Connected Data Source의 Attribute에 msExchUsageLocation 속성 체크 확인

    #>


<#
    STEP03: Sychronization Rule 추가

    - New-ADSyncRule의 Connector parameter 값 확인 필요.

    #>
    
    New-ADSyncRule  `
    -Name 'In from AD – User UsageLocation(MsExchUsageLocation)' `
    -Identifier '03339009-7a79-4a35-b904-2fa19791b5fd' `
    -Description '' `
    -Direction 'Inbound' `
    -Precedence 49 `
    -PrecedenceAfter '00000000-0000-0000-0000-000000000000' `
    -PrecedenceBefore '00000000-0000-0000-0000-000000000000' `
    -SourceObjectType 'user' `
    -TargetObjectType 'person' `
    -Connector 'fd512958-a6c5-4298-baf4-a0353d0fde7f' `
    -LinkType 'Join' `
    -SoftDeleteExpiryInterval 0 `
    -ImmutableTag '' `
    -OutVariable syncRule
    
    Add-ADSyncAttributeFlowMapping  `
    -SynchronizationRule $syncRule[0] `
    -Destination 'usageLocation' `
    -FlowType 'Expression' `
    -ValueMergeType 'Update' `
    -Expression 'IIF(IsNullOrEmpty([msExchUsageLocation]),"US",Trim([msExchUsageLocation]))' `
    -OutVariable syncRule
    
    Add-ADSyncRule  `
    -SynchronizationRule $syncRule[0]
    
    Get-ADSyncRule  `
    -Identifier '03339009-7a79-4a35-b904-2fa19791b5fd'
    
    
<#
    STEP04: Azure AD Connect 동기화 일정 Enable 및 동기화 시작.

    #>

    Set-ADSyncScheduler -SyncCycleEnabled $true

    Start-ADSyncSyncCycle -PolicyType Delta
    
    
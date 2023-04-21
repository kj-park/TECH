---
title: Understand Azure AD Connect Sync
filename: Microsoft365\Hybrid\Understand-Azure-AD-Connect-Sync.md
ms.date: 2022.04.12
---


# Understand Azure AD Connect Sync


## Understanding the architecture

동기화 엔진은 연결된 여러 데이터 원본에 저장된 개체의 통합된 보기를 만들고 해당 데이터 원본에서 ID 정보를 관리합니다. 이 통합된 보기는 연결된 데이터 원본에서 검색된 ID 정보와 이 정보를 처리하는 방법을 결정하는 규칙 집합에 의해 결정됩니다.

![aadc-sync-arch]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-arch.png?raw=true)

### Connected Data Source

동기화 엔진은 Active Directory 또는 SQL Server Database와 같은 다른 데이터 저장소의 Identity 정보를 처리합니다. 이러한 연결된 데이터 저장소들을 **Connected Data Source** 또는 **Connected Directories** (CD) 라고 합니다.

동기화 엔진은 Connected Directories에 연결되어 상호작용을 하는데 **Connector**라는 모듈 안으로 캡슐화합니다.각 유형의 Connected Directories는 특정 Connector를 포함합니다.

### Sync Engine Namespace

동기화 엔진은 Identity 정보를 저장하고 있는 아래의 2개의 namespaces로 구성되어 있습니다.

- Connector Space (CS)
- Metaverse (MV)


**Connector Space**는 Connected Data Source와 attribute inclusion list로 부터 동기화 대상이 되는 개체를 형상을 포함하고 있는 staging 영역입니다.
동기화 엔진은 connector space를 Connected Data source의 무엇이 변경되었는지와 incoming change를 staging하기 위해 사용합니다. 또한 Outgoing change에 대한 staging 영역으로도 사용합니다.

**Metaverse**는 다양한 connected data sources들로 부터 집계된 Identity 정보를 보함하고 있는 저장소 영역입니다.
전역 단일 개체 및 통합된 정보를 제공하기 위해 Connected data sources들과 동기화 진행 규칙들에 위하여 처리된 Identity 정보를 기반으로 Metavserse 개체가 생성됩니다.

### Identity Management Process

Identity Management는 아래의 3 가지 processes에서 발생합니다:

- **Import.** Connected Data Source로 부터 Incoming Identity 정보를 확인합니다. 변경이 감지되면 새로운 staging 개체 또는 기존 staging 개체를 동기화하기 위해 업데이트 합니다.

    업데이트된 데이터가 있는 스테이징 개체는 보류 중인 가져오기로 표시되는데 다음과 같은 가져오기 유형들이 있습니다:

    - None.
    - Add.
    - Update.
    - Delete.
    - Delete/Add

- **Synchronization.** Connect Space에 변경을 metaverse에 반영하기 위해 업데이트합니다.

    Synchronization은 아래 두 개의 processes가 있습니다:

    - Inbound Synchronization. Metaverse의 콘텐츠가 Connector Space의 데이터를 사용하여 업데이트됩니다.
        - **Provision.** new metaverse object
        - **Join.** The Sync engine links a staging object to an existing metaverse object. A join is an object-level operation.
        - **Import attribute flow.** Sync engine updates the attribute values, called attribute flow, of the object in the metaverse
    - Outbound Synchronization. Connector Space의 콘텐츠가 Metaverse의 데이터를 사용하여 업데이트됩니다.
        - **Provisioning.** object-level operations
        - **Deprovisioning.** object-level operations, flagged as deleted
        - **Export attribute flow.
**

- **Export.** 동기화 엔진은 staging 개체에서 준비된 변경 내용을 푸시합니다.

![aadc-sync-process]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-process.png?raw=true)

---

## Declarative Provisioning

Declarative Provisioning은 연결된 원본 디렉터리에서 들어오는 개체를 처리하고 개체 및 특성이 원본에서 대상으로 변환되는 방법을 결정합니다. 개체는 동기화 파이프라인에서 처리되고 파이프라인은 <kbd>**inbound rules**</kbd> 및 <kbd>**outbound rules**</kbd>에 동일합니다.

![aadc-sync-provisioning-001]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-provisioning-001.png?raw=true)

파이프라인에는 여러 다른 모듈이 있습니다. 각 모듈은 동기화 개체에서 한 가지 개념을 담당합니다.

![aadc-sync-provisioning-002]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-provisioning-002.png?raw=true)

- **Source.** The source object
- **Scope.** Finds all sync rules that are in scope
- **Join.** Determines relationship between connector space and metaverse
- **Transform.** Calculates how attributes should be transformed and flow
- **Precedence.** Resolves conflicting attribute contributions
- **Target.** The target object

### Synchronization rule


![aadc-sync-rule-001]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-rule-001.png?raw=true)

![aadc-sync-rule-002]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-rule-002.png?raw=true)

![aadc-sync-rule-003]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-rule-003.png?raw=true)

![aadc-sync-rule-004]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-rule-004.png?raw=true)

---

## Declarative Provisioning Expressions

Azure AD Connect 동기화는 Forefront Identity Manager 2010에 처음 도입된 선언적 프로비전을 기반으로 합니다. 컴파일된 코드를 작성할 필요 없이 전체 ID 통합 비즈니스 논리를 구현할 수 있습니다.

선언적 프로비전의 핵심적인 부분은 특성 흐름에 사용되는 표현 언어입니다. 사용 되는 언어는 VBA(Microsoft® Visual Basic® for Applications)의 하위 집합입니다. 이 언어는 Microsoft Office에서 사용되며, VBScript 경험이 있는 사용자 또한 이 언어를 인식합니다. 선언적 프로비전 표현 언어는 함수만 사용하며 구조적 언어는 아닙니다. 메서드 또는 문이 없습니다. 대신, 빠른 프로그램 흐름에 함수가 중첩됩니다.

> [!INFO]  
> - [Welcome to the Visual Basic for Applications language reference for Office 2013](https://docs.microsoft.com/en-us/office/vba/api/overview/language-reference)  
> - [Understanding Declarative Provisioning Expressions](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/concept-azure-ad-connect-sync-declarative-provisioning-expressions)
> - [Functions Reference](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-sync-functions-reference)

### Custom Inbound Synchronization Rule (msExchUsageLocation)

**Name:** In from AD – User UsageLocation(MsExchUsageLocation) 

![aadc-sync-rule-005]({{ site.url }}/Microsoft365/images/Hybrid/aadc-sync-rule-005.png?raw=true)


```powershell

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

```

---

## Declarative Provisioning Reference

- [Directory extensions](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-feature-directory-extensions)

- [Configure preferred data location for Microsoft 365 resources](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-feature-preferreddatalocation)

- [Configure filtering](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-configure-filtering)

- [Attributes synchronized to Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-sync-attributes-synchronized)

---

## Export Connectors and Synchronization Rules as Json File

```powershell

$BackupPath = 'C:\AADC-SYNC-RULES'
New-Item -Path 'C:\AADC-SYNC-RULES' -ItemType Directory -Force

$ADSyncRules = Get-ADSyncRule

foreach ( $Item in $ADSyncRules ) {
    $FileName = "[$($Item.Direction.ToString())-$($Item.Precedence.ToString('D3'))] - $($Item.Name).json"
    ConvertTo-Json -InputObject $Item | Out-File -LiteralPath "$BackupPath\$FileName"
}

Get-ADSyncConnector | Select-Object -Property Identifier,Type,Version,Name,ObjectInclusionList,AttributeInclusionList | ConvertTo-Json | Out-File -LiteralPath "$BackupPath\ADSyncConnectors.json"

```

---

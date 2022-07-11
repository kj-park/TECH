# draft

## Azure Information Protection Client

Azure Information Protection Unified Labeling Client 는 2022년 1월 1일에 maintenance mode로 변경되어 더 이상 새로운 기능은 추가되지 않을 것입니다.

Azure Information Protection Classic Client와 Azure Portal에서 Laval Management는 2022년 3월 31에 retired되었습니다.

> [!INFO]  
> [AIP Client Timelines](https://docs.microsoft.com/en-us/azure/information-protection/rms-client/use-client#aip-client-timelines)

추가적으로 설치할 필요가 없는 Office Apps의 built-in Labeling은 좀 더 안정적이고 성능 향상 및 Advanced Classifier와 같은 최신 기능을 사용할 수 있어 권장합니다.

AIP unified labeling client에서만 제공하는 추가 기능들은 다음과 같습니다:

- A scanner for on-premises data stores
- PowerShell labeling cmdlets
- Labeling with right-click options from the File Explorer
- A viewer for protected files, such as text, images, PDF, .pfile



---

## Teams 및 그룹, 사이트에 Sensitivity Labels 사용

1. Security & Compliance PowerShell (`Connect-IPPSSession`) 에 연결하여 아래 명령 실행 (Not Work)
    ```powershell
    Connect-IPPSSession -Credential $LabEnv.OnlineCredential
    Execute-AzureAdLabelSync
    ```

1. SharePoint 및 OneDrive에 대하여 Sensitivity Labels 활성화 (Not Work)
    > [!TODO]: 위 단계로 활성화 되는지 확인 필요

    ```powershell
    Connect-SPOService -Url $LabEnv.SPOAdminUrl -Credential $LabEnv.OnlineCredential
    Set-SPOTenant -EnableAIPIntegration $true
    ```

1. `Group.Unified` AzureADDirectorySetting의 `EnableMIPLabels` 속성을 "True"로 변경 (Work)

    ```powershell
    Import-Module AzureADPreview
    Connect-AzureAD -Credential $LabEnv.OnlineCredential
    	 
    #Check if settings object exists or needs to be created first (that's missing in Microsoft Docs)
    $settingsObjectID = (Get-AzureADDirectorySetting | Where-Object -Property Displayname -Value "Group.Unified" -EQ).Id
    if( !$settingsObjectID ) {
        $template = Get-AzureADDirectorySettingTemplate | Where-object {$_.Displayname -eq "group.unified"}
        $settingsCopy = $template.CreateDirectorySetting()
        New-AzureADDirectorySetting -DirectorySetting $settingsCopy
        $settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id
    }
    #Enable Microsoft Information Protection (MIP) labels
    $Setting = Get-AzureADDirectorySetting -Id (Get-AzureADDirectorySetting | Where-Object -Property DisplayName -Value "Group.Unified" -EQ).id
    $Setting.Values
    $Setting["EnableMIPLabels"] = "True"
    Set-AzureADDirectorySetting -Id $Setting.Id -DirectorySetting $Setting
    
    Disconnect-AzureAD
    ```

1. Sensitivity Labels에서 SharePoint 또는 OneDrive, Teams를 포함하게 변경 및 게시

    아래 그림은 Labels을 만들거나 수정 시 Groups & Sites 가 Enable되어 선택할 수 있음을 보여주고 있습니다:

    ![aip label scope groups and sites](https://github.com/kj-park/tech/blob/main/Microsoft365/media/Purview/aip-label-scope-groups-and-sites.png?raw=true)

---


## Manage Information Protection


![purview compliance overview](https://github.com/kj-park/tech/blob/main/Microsoft365/media/Purview/purview-compliance-overview.svg?raw=true)



### Know Your Data

| Capability | What Problems does it Solve? | Get Started |
|--|--|--|
| Sensitive Information Types | 기본 제공 또는 사용자 지정 정규식이나 함수를 사용하여 민감한 데이터를 식별합니다. 확증적 증거에는 키워드, 신뢰 수준 및 근접성이 포함됩니다. | [Customize a built-in sensitive information type](https://docs.microsoft.com/en-us/microsoft-365/compliance/customize-a-built-in-sensitive-information-type?view=o365-worldwide) |
| Trainable classifiers | 항목의 요소를 식별하는 대신 관심 있는 데이터의 예를 사용하여 민감한 데이터를 식별합니다(패턴 일치). 내장 분류기를 사용하거나 자신의 콘텐츠로 분류기를 훈련할 수 있습니다. | [Get started with trainable classifiers](https://docs.microsoft.com/en-us/microsoft-365/compliance/classifier-get-started-with?view=o365-worldwide) |
| Data classification | 민감도 레이블, 보존 레이블이 있거나 분류된 조직의 항목을 그래픽으로 식별합니다. 또한 이 정보를 사용하여 사용자가 이러한 항목에 대해 수행하는 작업에 대한 통찰력을 얻을 수 있습니다. | [Get started with content explorer](https://docs.microsoft.com/en-us/microsoft-365/compliance/data-classification-content-explorer?view=o365-worldwide) <br /> [Get started with activity explorer](https://docs.microsoft.com/en-us/microsoft-365/compliance/data-classification-activity-explorer?view=o365-worldwide) |

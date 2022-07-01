

# Azure Information Protection Client

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

# Teams 및 그룹, 사이트에 Sensitivity Labels 사용

1. Security & Compliance PowerShell (`Connect-IPPSSession`) 에 연결하여 아래 명령 실행
    ```powershell
    Execute-AzureAdLabelSync
    ```
    **참고:** 위 명령으로 Microsoft 365 Groups에 Senitivity Labels을 사용할 수 있게 합니다.
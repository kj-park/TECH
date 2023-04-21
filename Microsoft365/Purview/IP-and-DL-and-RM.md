---
title: Microsoft Purview Information Protection and Manage Data Lifecycle & Records Management
filename: Microsoft365\Purview\IP-and-DL-and-RM.md
ms.date: 2022.07.12
---

# Microsoft Purview Information Protection and Manage Data Lifecycle & Records Management

## Microsoft Purview Information Protection

![purview compliance overview]({{ site.url }}/Microsoft365/images/Purview/purview-compliance-overview.svg?raw=true)

### Know Your Data

데이터 환경을 이해하고 하이브리드 환경에서 민감한 데이터를 식별하려면 다음 기능을 사용하십시오.

| Capability | What Problems does it Solve? | Get Started |
|--|--|--|
| [Sensitive Information Types](https://docs.microsoft.com/en-us/microsoft-365/compliance/sensitive-information-type-learn-about?view=o365-worldwide) | 기본 제공 또는 사용자 지정 정규식이나 함수를 사용하여 민감한 데이터를 식별합니다. 확증적 증거에는 키워드, 신뢰 수준 및 근접성이 포함됩니다. | [Customize a built-in sensitive information type](https://docs.microsoft.com/en-us/microsoft-365/compliance/customize-a-built-in-sensitive-information-type?view=o365-worldwide) |
| [Trainable classifiers](https://docs.microsoft.com/en-us/microsoft-365/compliance/classifier-learn-about?view=o365-worldwide) | 항목의 요소를 식별하는 대신 관심 있는 데이터의 예를 사용하여 민감한 데이터를 식별합니다(패턴 일치). 내장 분류기를 사용하거나 자신의 콘텐츠로 분류기를 훈련할 수 있습니다. | [Get started with trainable classifiers](https://docs.microsoft.com/en-us/microsoft-365/compliance/classifier-get-started-with?view=o365-worldwide) |
| [Data classification](https://docs.microsoft.com/en-us/microsoft-365/compliance/data-classification-overview?view=o365-worldwide) | 민감도 레이블, 보존 레이블이 있거나 분류된 조직의 항목을 그래픽으로 식별합니다. 또한 이 정보를 사용하여 사용자가 이러한 항목에 대해 수행하는 작업에 대한 통찰력을 얻을 수 있습니다. | [Get started with content explorer](https://docs.microsoft.com/en-us/microsoft-365/compliance/data-classification-content-explorer?view=o365-worldwide) <br /> [Get started with activity explorer](https://docs.microsoft.com/en-us/microsoft-365/compliance/data-classification-activity-explorer?view=o365-worldwide) |

### Protect Your Data

암호화, 액세스 제한 및 시각적 표시를 포함하는 유연한 보호 조치를 적용하려면 다음 기능을 사용하십시오.

| Capability | What Problems does it Solve? | Get Started |
|--|--|--|
| [Sensitivity labels](https://docs.microsoft.com/en-us/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide) | 앱, 서비스 및 장치 전반에 걸친 단일 레이블링 솔루션으로 조직 내부 및 외부로 이동하는 데이터를 보호합니다. | [Get started with sensitivity labels](https://docs.microsoft.com/en-us/microsoft-365/compliance/get-started-with-sensitivity-labels?view=o365-worldwide) |
| [Azure Information Protection unified labeling client](https://docs.microsoft.com/en-us/azure/information-protection/rms-client/aip-clientv2) | Windows 컴퓨터의 경우 레이블 지정을 파일 탐색기 및 PowerShell로 확장하고 필요한 경우 Office 앱용 추가 기능 포함 | [Azure Information Protection unified labeling client administrator guide](https://docs.microsoft.com/en-us/azure/information-protection/rms-client/clientv2-admin-guide) |
| [Double Key Encryption](https://docs.microsoft.com/en-us/microsoft-365/compliance/double-key-encryption?view=o365-worldwide) | 어떤 상황에서도 조직에서만 보호된 콘텐츠를 해독할 수 있으며 규정 요구 사항에 따라 지리적 경계 내에서 암호화 키를 보유해야 합니다. | [Deploy Double Key Encryption](https://docs.microsoft.com/en-us/microsoft-365/compliance/double-key-encryption?view=o365-worldwide#deploy-dke) |
| [Office 365 Message Encryption (OME)](https://docs.microsoft.com/en-us/microsoft-365/compliance/ome?view=o365-worldwide) | 모든 장치의 모든 사용자에게 전송되는 이메일 메시지 및 첨부 문서를 암호화하여 승인된 수신자만 이메일 정보를 읽을 수 있도록 합니다. | [Set up new Message Encryption capabilities](https://docs.microsoft.com/en-us/microsoft-365/compliance/set-up-new-message-encryption-capabilities?view=o365-worldwide) |
| [Service encryption with Customer Key](https://docs.microsoft.com/en-us/microsoft-365/compliance/customer-key-overview?view=o365-worldwide) | 승인되지 않은 시스템이나 직원이 데이터를 보는 것을 방지하고 Microsoft 데이터 센터에서 BitLocker 디스크 암호화를 보완합니다. | [Set up Customer Key for Office 365](https://docs.microsoft.com/en-us/microsoft-365/compliance/customer-key-set-up?view=o365-worldwide) |
| [SharePoint Information Rights Management (IRM)](https://docs.microsoft.com/en-us/microsoft-365/compliance/set-up-irm-in-sp-admin-center?view=o365-worldwide#irm-enable-sharepoint-document-libraries-and-lists) | SharePoint 목록 및 라이브러리를 보호하여 사용자가 문서를 체크아웃할 때 다운로드한 파일이 보호되어 권한이 있는 사람만 지정한 정책에 따라 파일을 보고 사용할 수 있습니다. | [Set up Information Rights Management (IRM) in SharePoint admin center](https://docs.microsoft.com/en-us/microsoft-365/compliance/set-up-irm-in-sp-admin-center?view=o365-worldwide) |
| [Rights Management connector](https://docs.microsoft.com/en-us/azure/information-protection/deploy-rms-connector) | Exchange 또는 SharePoint Server를 사용하는 기존 온프레미스 배포 또는 Windows Server 및 FCI(파일 분류 인프라)를 실행하는 파일 서버에 대한 보호 전용입니다. | [Steps to deploy the RMS connector](https://docs.microsoft.com/en-us/azure/information-protection/deploy-rms-connector#steps-to-deploy-the-rms-connector) |
| [Azure Information Protection unified labeling scanner](https://docs.microsoft.com/en-us/azure/information-protection/deploy-aip-scanner) | 온프레미스에 있는 데이터 저장소에 있는 중요한 정보를 검색, 레이블 지정 및 보호합니다. | [Configuring and installing the Azure Information Protection unified labeling scanner](https://docs.microsoft.com/en-us/azure/information-protection/deploy-aip-scanner-configure-install) |
| [Microsoft Defender for Cloud Apps](https://docs.microsoft.com/en-us/cloud-app-security/what-is-cloud-app-security) | 클라우드에 있는 데이터 저장소에 있는 민감한 정보를 검색, 레이블 지정 및 보호합니다. | [Discover, classify, label, and protect regulated and sensitive data stored in the cloud](https://docs.microsoft.com/en-us/cloud-app-security/best-practices#discover-classify-label-and-protect-regulated-and-sensitive-data-stored-in-the-cloud) |

### Prevent Data Loss

https://docs.microsoft.com/en-us/microsoft-365/compliance/information-protection?view=o365-worldwide#prevent-data-loss

민감한 정보의 우발적인 과잉 공유를 방지하려면 다음 기능을 사용하십시오.

| Capability | What Problems does it Solve? | Get Started |
|--|--|--|
| [Microsoft Purview Data Loss Prevention](https://docs.microsoft.com/en-us/microsoft-365/compliance/dlp-learn-about-dlp?view=o365-worldwide) | 민감한 항목의 의도하지 않은 공유를 방지하는 데 도움이 됩니다. | [Get started with the default DLP policy](https://docs.microsoft.com/en-us/microsoft-365/compliance/get-started-with-the-default-dlp-policy?view=o365-worldwide) |
| [Endpoint data loss prevention](https://docs.microsoft.com/en-us/microsoft-365/compliance/endpoint-dlp-learn-about?view=o365-worldwide) | Windows 10 컴퓨터에서 사용 및 공유되는 항목으로 DLP 기능을 확장합니다. | [Get started with Endpoint data loss prevention](https://docs.microsoft.com/en-us/microsoft-365/compliance/endpoint-dlp-getting-started?view=o365-worldwide) |
| [Microsoft Compliance Extension](https://docs.microsoft.com/en-us/microsoft-365/compliance/dlp-chrome-learn-about?view=o365-worldwide) | DLP 기능을 Chrome 브라우저로 확장 | [Get started with the Microsoft Compliance Extension](https://docs.microsoft.com/en-us/microsoft-365/compliance/dlp-chrome-get-started?view=o365-worldwide) |
| [Microsoft Purview data loss prevention on-premises scanner (preview)](https://docs.microsoft.com/en-us/microsoft-365/compliance/dlp-on-premises-scanner-learn?view=o365-worldwide) | 파일 활동에 대한 DLP 모니터링과 해당 파일에 대한 보호 조치를 온-프레미스 파일 공유, SharePoint 폴더 및 문서 라이브러리로 확장합니다. | [Get started with Microsoft Purview data loss prevention on-premises scanner (preview)](https://docs.microsoft.com/en-us/microsoft-365/compliance/dlp-on-premises-scanner-get-started?view=o365-worldwide) |
| [Protect sensitive information in Microsoft Teams chat and channel messages](https://docs.microsoft.com/en-us/microsoft-365/compliance/dlp-microsoft-teams?view=o365-worldwide) | 일부 DLP 기능을 Teams 채팅 및 채널 메시지로 확장 | [Learn about the default data loss prevention policy in Microsoft Teams (preview)](https://docs.microsoft.com/en-us/microsoft-365/compliance/dlp-teams-default-policy?view=o365-worldwide) |

## Manage Data Lifecycle & Records (Govern Your Data)

![purview compliance overview]({{ site.url }}/Microsoft365/images/Purview/govern-your-data.png?raw=true)

### Microsoft Purview Data Lifecycle Management

필요한 것을 유지하고 필요하지 않은 것을 삭제하려면:

| Capability | What Problems does it Solve? |
|--|--|
| [Retention policies for Microsoft 365 workloads, with retention labels for exceptions](https://docs.microsoft.com/en-us/microsoft-365/compliance/retention?view=o365-worldwide) | 전자 메일, 문서, 팀 및 Yammer 메시지에 대한 정책 관리를 통해 콘텐츠를 유지하거나 삭제할 수 있습니다. |
| [Inactive mailboxes](https://docs.microsoft.com/en-us/microsoft-365/compliance/inactive-mailboxes-in-office-365?view=o365-worldwide) | 직원이 조직을 떠난 후에도 사서함 콘텐츠를 유지하여 관리자, 규정 준수 책임자 및 기록 관리자가 이 콘텐츠에 계속 액세스할 수 있습니다. |
| [Archive mailboxes](https://docs.microsoft.com/en-us/microsoft-365/compliance/archive-mailboxes?view=o365-worldwide) | 사용자를 위한 추가 사서함 저장 공간을 제공합니다. |
| [Import service for PST files](https://docs.microsoft.com/en-us/microsoft-365/compliance/importing-pst-files-to-office-365?view=o365-worldwide) | 규정 준수 또는 규정 요구 사항에 대해 전자 메일 메시지를 보관 및 검색하기 위해 PST 파일을 Exchange Online 사서함으로 대량 가져오기를 지원합니다. |

### Microsoft Purview Records Management

비즈니스, 법률 또는 규제 기록 보관 요구 사항에 대한 고가치 항목 관리:

| Capability | What Problems does it Solve? |
|--|--|
| [File plan](https://docs.microsoft.com/en-us/microsoft-365/compliance/file-plan-manager?view=o365-worldwide) | 보존 레이블을 대화식으로 생성하거나 대량으로 가져오고 분석을 위해 내보낼 수 있습니다. 레이블은 비즈니스 또는 규제 요구 사항을 식별하고 추적하는 데 도움이 되는 추가 관리 정보(선택 사항)를 지원합니다. |
| [Retention labels for individual items, retention policies if needed for baseline retention](https://docs.microsoft.com/en-us/microsoft-365/compliance/retention?view=o365-worldwide) | 레이블은 필요할 때 기록 선언과 함께 수동 또는 자동으로 적용할 수 있는 유연한 보존 및 삭제 일정을 지원합니다. |
| [Disposition review and proof of disposition](https://docs.microsoft.com/en-us/microsoft-365/compliance/disposition?view=o365-worldwide) | 기록 폐기 증거와 함께 영구적으로 삭제되기 전에 콘텐츠를 수동으로 검토합니다. |

---

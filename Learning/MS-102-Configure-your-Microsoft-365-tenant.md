---
layout: default
title: [MS-102 Configure your Microsoft 365 tenant]
filename: Learning/MS-102-Configure-your-Microsoft-365-tenant.md
ms.date: 2023.06.30
---

# MS-102 Configure your Microsoft 365 tenant

Microsoft 365의 경우 구성 프로세스에는 다음이 포함됩니다.

- 조직 프로필 설정
- 테넌트 구독 관리
- 서비스 및 추가 기능 관리
- 테넌트 구성 완료

## Microsoft 365 Cloud 환경 탐색

### Microsoft 365 구독 및 계획

Microsoft 365의 맥락에서 "계획"은 일반적으로 구독에 포함된 특정 기능 및 서비스 집합을 나타냅니다. Microsoft는 각각 기능과 가격 구조가 다른 E3 또는 E5와 같은 Microsoft 365의 다양한 플랜 또는 에디션을 제공합니다. 이러한 계획은 사용자가 사용할 수 있는 특정 기능 및 응용 프로그램과 포함된 기타 서비스 또는 혜택을 결정합니다.

반면에 "구독"은 일반적으로 특정 Microsoft 365 플랜에 대한 액세스 권한을 획득하는 행위를 의미합니다.

### Microsoft 365 구독 및 Azure AD 테넌트에 클라우드 컴퓨팅 기반 구축

클라우드 컴퓨팅 기반을 구축하려면 먼저 Microsoft 365 구독과 Azure AD(Azure Active Directory) 테넌트 간의 관계를 이해해야 합니다.

Microsoft 365 계획은 저장, 공동 작업 및 커뮤니케이션을 위한 클라우드 서비스와 함께 Word, Excel, PowerPoint 및 Outlook과 같은 다양한 Microsoft 제품에 대한 액세스를 제공합니다. 예를 들어 Exchange Online, SharePoint Online, 비즈니스용 OneDrive, Microsoft Teams 등이 있습니다.

Azure AD 테넌트는 Office 응용 프로그램, Exchange Online, SharePoint, Teams 등과 같은 Microsoft 365 서비스에 대한 사용자 인증, 권한 부여 및 기타 ID 관련 기능을 활성화하는 기본 기반입니다. 이 단일 테넌트 환경을 통해 조직 내에서 Microsoft 365 및 Azure 서비스를 원활하게 통합하고 관리할 수 있습니다.

Azure AD 테넌트는 해당 구독과 연결된 모든 리소스를 보유하는 컨테이너입니다. 테넌트는 조직 서비스의 URL을 결정합니다. 또한 조직의 Microsoft 365 관리자가 브랜딩 및 보안 정책과 같은 회사의 전역 설정을 관리할 수 있는 곳이기도 합니다.

### Azure AD 테넌트를 만들지 않는 Microsoft 365 계획

Microsoft는 일부 Microsoft 365 계획이 Azure AD 테넌트를 만들지 않기 때문에 여전히 구독에 대해 단일 Azure AD 테넌트만 만듭니다. "Azure AD Free" 또는 "Azure AD 기본" 계획이라고도 하며 제한된 Azure AD 기능을 제공하고 전체 Azure AD 테넌트 생성을 포함하지 않습니다.

- Enterprise Mobility + Security (EMS) E5.
- Microsoft 365 Business Basic. 
- Microsoft 365 Business Standard.
- Microsoft 365 Apps.
- Office 365 F3.
- Microsoft 365 F1.

이러한 계획은 Azure AD 테넌트를 생성하지 않지만 사용자 관리 및 인증 목적을 위해 여전히 Azure AD 기능이 제한되어 있을 수 있습니다. 그러나 고급 ID 보호, 조건부 액세스 및 장치 관리와 같은 고급 Azure AD 기능 및 기능의 경우 일반적으로 Azure AD 테넌트를 생성하는 Microsoft 365 E3 또는 E5와 같은 상위 계층 계획을 고려해야 합니다.

### 라이선스

Microsoft 365 계획을 구독할 때 계획에 대해 구매하는 라이선스 수는 일반적으로 조직에 필요한 사용자 또는 시트 수를 기반으로 합니다. 일반적인 프로세스는 다음과 같습니다.

1. 조직에 적합한 Microsoft 365 플랜을 선택하세요. Microsoft는 기능과 서비스가 다른 다양한 요금제를 제공합니다. 각 계획에는 고유한 기능 및 응용 프로그램 집합이 있습니다. 필요한 기능에 따라 필요에 가장 적합한 요금제를 선택합니다.
1. 조직에 적합한 라이선스 수와 함께 Microsoft 365 플랜을 구매하세요. Microsoft 365 플랜을 구독하면 해당 플랜에 대해 특정 수의 사용자 또는 시트를 구매합니다. 예를 들어 직원이 50명인 경우 선택한 계획에 대해 50개의 사용자 라이선스에 대한 구독을 구매합니다.
1. 라이선스를 할당합니다. 구독을 구매한 후에는 Microsoft 365 계획에 대한 라이선스를 조직 내의 개별 사용자에게 할당할 수 있습니다. Microsoft 365 관리 센터를 통해 이 프로세스를 관리합니다. 특정 사용자에게 라이선스를 할당하여 플랜에 포함된 기능 및 서비스에 대한 액세스 권한을 부여할 수 있습니다.
1. 라이선스를 관리하세요. 조직의 요구 사항이 변경되면 필요에 따라 라이선스를 추가하거나 제거할 수 있습니다. 새로운 사용자를 수용하기 위해 계획에 대해 더 많은 라이센스를 구입할 수 있습니다. 조직을 떠나거나 더 이상 액세스가 필요하지 않은 사용자의 라이선스를 제거할 수도 있습니다. 이러한 유연성을 통해 조직의 규모와 요구 사항에 따라 라이선스를 확장할 수 있습니다.

> [!NOTE]  
> 라이선스 할당 및 관리에 대한 구체적인 세부 정보는 선택한 Microsoft 365 요금제 및 선택한 기타 서비스 또는 추가 기능에 따라 다를 수 있습니다. Microsoft는 라이선스를 효과적으로 관리하는 데 도움이 되는 도구와 리소스를 제공하여 라이선스 조건을 준수하면서 조직의 사용자에게 적절한 수의 라이선스를 보유하도록 합니다.


[!VIDEO https://www.youtube.com/embed/6zfbBRdjlw8]


---


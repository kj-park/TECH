---
title: Azure AD Conditional Access Policy Access Controls
filename: Microsoft365\Security\Azure-AD-Conditional-Access-Policy-Access-Controls.md
ms.date: 2012.05.10
---

# Azure AD Conditional Access Policy Access Controls

## Access Controls: Grant

![conditional-access-policy-access-controls-grant](https://github.com/kj-park/Tech/blob/main/Microsoft365/media/conditional-access-policy-access-controls-grant.svg?raw=true)

### Block Access

### Grant Access

> [!WARNING]
> `Require password change` 옵션은 `Require multi-factor authentication` 옵션이 자동으로 enable되며 그 외 옵션은 선택할 수 없음.

#### Require multi-factor authentication

Azure AD Multi-Factor Authentication 인증을 필요로 함. ([Windows Hello for Business](https://docs.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-overview)가 Conditional Access 정책에서 MFA 조건을 만족함)

> [!NOTE]
> [Planning a cloud-based Azure AD Multi-Factor Authentication deployment](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted)

#### Require device to be marked as compliant

Microsoft Intune의 Compliance requirements 를 만족해야 함. Device는 Azure AD에 registered되어야 함.

> [!NOTE]

>
> ##### Device Options in Azure AD
>
> - Azure AD Registered
>    - 일반적으로 개인 소유의 device에 Microsoft Account 또는 로컬 Account로 signed in 한 경우
>    - Windows 10
>    - iOS
>    - Android
>    - MacOS
> - Azure AD Joined
>    - 조직이 소유하는 경우가 일반적이며 Azure AD에 joined하며 조직의 Azure AD Account로 signed in하며 cloud에만 존재
>    - Windows 10
>    - Windows Server 2019 VM in Azure
> - Hybrid Azure AD joined
>    - 조직이 소유하는 Azure AD에 joined되어 있으며 조직의 Active Directory Domain Service의 계정으로 signed in 하며 cloud와 on-premises에 존재
>    - Windows 7, 8.1, or 10
>    - Windows Server 2008 or newer
>
> **참고:** [What is a device identity?](https://docs.microsoft.com/en-us/azure/active-directory/devices/overview)

#### Require hybrid Azure AD joined device

Organizations can choose to use the device identity as part of their Conditional Access policy

#### Require approved client app

Intune app protection policies에서 지원하는 approved client app

- Azure AD에 등록된 device이여야 하며 broker app이 필요
    - Microsoft Authenticator for iOS
    - Microsoft Authenticator or Microsoft Company Portal for android

- iOS 및 Android device platform 조건만 지원

    iOS 와 Android의 다음 apps에 정책 적용 가능:

    - Microsoft Azure Information Protection
    - Microsoft Bookings
    - Microsoft Cortana
    - Microsoft Dynamics 365
    - Microsoft Edge
    - Microsoft Excel
    - Microsoft Power Automate
    - Microsoft Invoicing
    - Microsoft Kaizala
    - Microsoft Launcher
    - Microsoft Office
    - Microsoft OneDrive
    - Microsoft OneNote
    - Microsoft Outlook
    - Microsoft Planner
    - Microsoft PowerApps
    - Microsoft Power BI
    - Microsoft PowerPoint
    - Microsoft SharePoint
    - Microsoft Skype for Business
    - Microsoft StaffHub
    - Microsoft Stream
    - Microsoft Teams
    - Microsoft To-Do
    - Microsoft Visio
    - Microsoft Word
    - Microsoft Yammer
    - Microsoft Whiteboard
    - Microsoft 365 Admin

- Microsoft Edge in InPrivate mode는 고려하지 않음
- Power BI mobile app(on-premises Power BI Report Server 연결) 지원하지 않고 Microsoft Power BI app이 필요

#### Require app protection policy

[Intune app Protection Policy](https://docs.microsoft.com/en-us/intune/app-protection-policy)

Intune SDK의 Policy Assurance를 만족하게 개발된 apps 아래 client apps이 지원됨:

- Microsoft Cortana
- Microsoft Edge
- Microsoft Excel
- Microsoft Lists (iOS)
- Microsoft Office
- Microsoft OneDrive
- Microsoft OneNote
- Microsoft Outlook
- Microsoft Planner
- Microsoft Power BI
- Microsoft PowerPoint
- Microsoft SharePoint
- Microsoft Word
- MultiLine for Intune
- Nine Mail - Email & Calendar

#### Require password change

User risk를 감지 하면 관리자는 user risk policy conditions를 사용 하여 사용자가 Azure AD self-service password reset을 사용 하여 암호를 안전하게 변경 하도록 선택할 수 있습니다. User risk가 감지되면 사용자는 self-service password reset을 수행하여 자동으로 수정할 수 있습니다.

사용자에게 암호를 변경하라는 메시지가 표시되면 먼저 multi-factor authentication을 완료 해야 합니다.

> [!WARNING]
> 사용자는 user risk policy를 트리거하기 전에 self-service password reset에 이미 등록되어 있어야 합니다.

정책 제한:

- 이 정책은 'All Cloud Apps'에 할당해야 합니다. 이를 통해 다른 app을 통해 단순히 signing-in하는 것으로 user risk를 reset하는 것을 방지합니다.
- 이 정책은 'Require multi-factor authentication' 외 다른 control을 같이 사용할 수 없습니다.
- 이 정책은 user and group assignment 과 cloud app assignment ( to all), user risk 조건(conditions)에만 설정할 수 있습니다.

---

## Access Controls: Session

![conditional-access-policy-access-controls-session](https://github.com/kj-park/Tech/blob/main/Microsoft365/media/conditional-access-policy-access-controls-session.svg?raw=true)

### Use app enforced restrictions

Azure AD에서 선택한 클라우드 앱에 장치 정보를 전달 하도록 요구할 수 있습니다. 클라우드 앱이 규정 준수(compliant) 또는 도메인 조인 디바이스(domain-joined device)에서 연결이 초기화되는지 여부를 알 수 있습니다.

 SharePoint Online 및 Exchange Online만 지원합니다.(Microsoft 365 포함)

- [Enabling limited access with SharePoint Online](https://docs.microsoft.com/en-us/sharepoint/control-access-from-unmanaged-devices)
- [Enabling limited access with Exchange Online](https://aka.ms/owalimitedaccess)

### use Conditional Access App Control

Conditional Access App Control은 Reverse Proxy architecture를 사용하며 Azure AD Conditional Access와 통합되어 있음.

특정 조건(who and what, where) 기반의 조직의 apps에 대하여 정책이 적용되면 사용자들은 [Microsoft Cloud App Security](https://docs.microsoft.com/en-us/cloud-app-security/what-is-cloud-app-security)로 라우팅되어 session 기반의 데이터 보호를 함.

- **Prevent data exfiltration(유출).** 중요한 문서의 다운로드, 잘라내기, 복사, 인쇄를 차단
- **Protect on download.** 중요한 문서의 다운로드를 차단하는 대신 문서에 레이블을 지정하고 Azure Information Protection으로 문서를 보호하도록 요구
- **Prevent upload of unlabeled files.**사용자가 콘텐츠를 분류할 때까지 중요한 콘텐츠가 포함되고 레이블이 지정되지 않은 파일이 업로드되지 않도록 할 수 있음
- **Monitor user sessions for compliance.** 위험 사용자가 앱에 로그인하면 모니터링되고 해당 작업이 세션 내에서 로깅
- **Block access.** 몇 가지 위험 요소에 따라 특정 앱과 사용자의 액세스를 세부적으로 차단
- **Block custom activities.** 일부 앱에는 Microsoft Teams, Slack 등의 앱에서 중요한 콘텐츠가 포함된 메시지를 보내는 경우와 같이 위험을 수반하는 고유한 시나리오가 있습니다. 이 종류의 시나리오에서는 메시지에서 중요한 콘텐츠를 검사하고 실시간으로 메시지를 차단할 수 있음

### Sign-In Frequency

로그인 빈도는 리소스에 액세스하려고 할 때 사용자에게 다시 로그인하라는 메시지가 표시되는 기간을 정의

로그인 빈도 설정은 표준에 따라 OAUTH2 또는 OIDC 프로토콜을 구현한 앱에서 적용됩니다. 다음 웹 애플리케이션을 포함하여 Windows, Mac, 모바일용 Microsoft 네이티브 앱은 대부분 이 설정을 준수합니다.

- Word, Excel, PowerPoint Online
- OneNote Online
- Office.com
- Microsoft 365 Admin portal
- Exchange Online
- SharePoint and OneDrive
- Teams web client
- Dynamics CRM Online
- Azure portal

### Persistent browser session

영구 브라우저 세션을 사용하면 사용자가 브라우저 창을 닫았다가 다시 연 후 로그인 상태를 유지할 수 있습니다.

---

## Report-Only Mode

조직의 조건부 액세스 정책 배포와 관련된 문제 중 하나는 최종 사용자에게 미치는 영향을 파악하는 것입니다. 보고 전용 모드는 관리자가 정책을 환경에 사용하도록 설정하기 전에 조건부 액세스 정책의 영향을 평가할 수 있도록 하는 새 조건부 액세스 정책 상태입니다.

- 로그인하는 동안 보고 전용 모드의 정책은 평가되지만 적용되지 않음
- 결과는 로그인 로그 세부 정보에 대한 조건부 액세스 및 보고 전용 탭에 기록
- Azure Monitor 구독이 있는 고객은 조건부 액세스 인사이트 통합 문서를 사용하여 조건부 액세스 정책의 영향을 모니터링할 수 있음

> [!WARNING]
> 규정 준수 디바이스를 필요로 하는 보고 전용 모드의 정책은 디바이스 규정 준수가 적용되지 않는 경우에도 정책 평가 중에 사용자에게 Mac, iOS, Android에서 디바이스 인증서를 선택하라는 메시지를 표시할 수 있습니다.

### Policy Results

지정된 로그인에 대해 보고 전용 모드의 정책을 평가하는 경우 가능한 결과값은 다음 네 가지입니다.

| Policy Results                        | Description                                                                                                                                                                     |
|---------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Report-only: Success**              | 구성된 모든 정책 조건, 필요한 비대화형 권한 부여 컨트롤 및 세션 컨트롤이 충족되었습니다. 예를 들어 토큰에 이미 있는 MFA 클레임이 다단계 인증 요구 사항을 충족하거나 규정 준수 디바이스에서 디바이스 검사를 수행한 결과 규정 준수 디바이스 정책을 충족합니다. |
| **Report-only: Failure**              | 구성된 모든 정책 조건이 충족되었지만 모든 필수 비대화형 권한 부여 컨트롤 또는 세션 컨트롤이 충족되지는 않았습니다. 차단 컨트롤이 구성된 사용자에게 정책이 적용되거나 디바이스가 규정 준수 디바이스 정책을 충족하지 못하는 경우를 예로 들 수 있습니다. |
| **Report-only: User action required** | 구성된 모든 정책 조건이 충족되었지만 필요한 권한 부여 컨트롤 또는 세션 컨트롤을 충족하려면 사용자 작업이 필요합니다. 보고 전용 모드를 사용하는 경우 사용자에게 필요한 컨트롤을 충족하라는 메시지가 표시되지 않습니다. 예를 들면 사용자에게 다단계 인증 문제나 사용 약관과 관련된 메시지가 표시되지 않는 경우입니다. |
| **Report-only: Not applied**          | 구성된 일부 정책 조건이 충족되지 않았습니다. 예를 들어 사용자가 정책에서 제외되었거나 정책이 신뢰할 수 있는 특정 명명된 위치에만 적용되는 경우입니다. |

### Conditional Access Insights workbook

Conditional Access Insights workbook은 조건부 액세스 쿼리를 시각화하고 지정된 시간 범위, 애플리케이션 집합 및 사용자에 대한 정책의 영향을 모니터링할 수 있습니다.

---

## Service Dependencies

### Policy enforcement

서비스 종속성이 구성 된 경우 초기 바인딩 또는 런타임에 바인딩된 적용을 사용 하 여 정책을 적용할 수 있습니다.

- **Early-bound policy enforcement** 은 사용자가 호출 하는 앱에 액세스 하기 전에 종속 서비스 정책을 충족 해야 함을 의미 합니다. 예를 들어 MS 팀에 로그인 하기 전에 사용자가 SharePoint 정책을 충족 해야 합니다.
- **Late-bound policy enforcement** 은 사용자가 호출 앱에 로그인 한 후에 발생 합니다. 적용은 다운스트림 서비스용 토큰 인 앱 요청을 호출할 때로 지연 됩니다. 예제에는 Planner에 액세스 하는 MS 팀과 SharePoint 액세스 Office.com 포함 됩니다.

아래 다이어그램은 MS 팀 서비스 종속성을 보여 줍니다. 흰색 화살표는 초기 바인딩 적용(Early-bound policy enforcement)을 나타냅니다. Planner의 파선 화살표는 런타임에 바인딩된 적용(Late-bound policy enforcement)을 나타냅니다.

![aad-conditional-access-service-dependencies](https://github.com/kj-park/tech/blob/main/Microsoft365/Azure-AD/.media/aad-conditional-access-service-dependencies.png?raw=true)

가능한 경우 관련 앱과 서비스 간에 공통 정책을 설정 해야 합니다. 일관 된 보안 상태를 유지 하면 최상의 사용자 환경을 제공 합니다.

아래 표에는 클라이언트 앱이 충족 해야 하는 추가 서비스 종속성이 나열 되어 있습니다.

| 클라이언트 앱     | 다운스트림 서비스                   | 적용             |
|------------------ |------------------------------------ |----------------- |
| Azure Data Lake   | Microsoft Azure 관리 (포털 및 API)  | 초기 바인딩      |
| Microsoft 교실    | Exchange                            | 초기 바인딩      |
|                   | SharePoint                          | 초기 바인딩      |
| Microsoft Teams   | Exchange                            | 초기 바인딩      |
|                   | MS Planner                          | 런타임에 바인딩  |
|                   | Microsoft Stream                    | 런타임에 바인딩  |
|                   | SharePoint                          | 초기 바인딩      |
|                   | 비즈니스 온라인용 Skype             | 초기 바인딩      |
| Office 포털       | Exchange                            | 런타임에 바인딩  |
|                   | SharePoint                          | 런타임에 바인딩  |
| Outlook 그룹      | Exchange                            | 초기 바인딩      |
|                   | SharePoint                          | 초기 바인딩      |
| PowerApps         | Microsoft Azure 관리 (포털 및 API)  | 초기 바인딩      |
|                   | Windows Azure Active Directory      | 초기 바인딩      |
| Project           | Dynamics CRM                        | 초기 바인딩      |
| 비즈니스용 Skype  | Exchange                            | 초기 바인딩      |
| Visual Studio     | Microsoft Azure 관리 (포털 및 API)  | 초기 바인딩      |
| Microsoft Forms   | Exchange                            | 초기 바인딩      |
|                   | SharePoint                          | 초기 바인딩      |
| Microsoft To-Do   | Exchange                            | 초기 바인딩      |

---

## What if Tool

**Conditional Access What If policy tool** 를 사용 하 여 사용자 환경에 대 한 조건부 액세스 정책의 영향을 이해할 수 있습니다. 여러 번의 로그인을 수동으로 수행하여 정책을 시험 사용해보는 대신, 이 도구를 사용하여 사용자의 시뮬레이트된 로그인을 평가할 수 있습니다.

![aad-conditional-access-what-If-Tool](https://github.com/kj-park/tech/blob/main/Microsoft365/Azure-AD/.media/aad-conditional-access-what-If-Tool.svg?raw=true)

---

## Continuous access evaluation

![AAD-Continuous-access-evaluation](https://github.com/kj-park/tech/blob/main/Microsoft365/Azure-AD/.media/AAD-Continuous-access-evaluation.png?raw=true)

---

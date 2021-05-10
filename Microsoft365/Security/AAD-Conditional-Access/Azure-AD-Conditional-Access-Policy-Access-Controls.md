---
title: Azure AD Conditional Access Policy Access Controls
filename: Microsoft365\Security\Azure-AD-Conditional-Access-Policy-Access-Controls.md
date: 2012.05.10
---

# Azure AD Conditional Access Policy Access Controls

## Access Controls: Grant

![conditional-access-policy-access-controls-grant](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/conditional-access-policy-access-controls-grant.svg?raw=true)

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

User risk를 감지 하면 관리자는 user risk policy coditions를 사용 하여 사용자가 Azure AD self-service password reset을 사용 하여 암호를 안전하게 변경 하도록 선택할 수 있습니다. User risk가 감지되면 사용자는 self-service password reset을 수행하여 자동으로 수정할 수 있습니다.

사용자에게 암호를 변경하라는 메시지가 표시되면 먼저 multi-factor authentication을 완료 해야 합니다.

> [!WARNING]
> 사용자는 user risk policy를 트리거하기 전에 self-service password reset에 이미 등록되어 있어야 합니다.

정책 제한:

- 이 정책은 'All Cloud Apps'에 할당해야 합니다. 이를 통해 다른 app을 통해 단순히 signing-in하는 것으로 user risk를 reset하는 것을 방지합니다.
- 이 정책은 'Require multi-factor authentication' 외 다른 control을 같이 사용할 수 없습니다.
- 이 정책은 user and group assignment 과 cloud app assignment ( to all), user risk 조건(conditions)에만 설정할 수 있습니다.

---
## Access Controls: Session


![conditional-access-policy-access-controls-session](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/conditional-access-policy-access-controls-session.svg)



---

## Report-Only Mode


---

## Service Dependencies

---

## What if Tool

---

## VPN Connectivity

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
> Microsoft Endpoint Manager
>
>    - Microsoft Intune
>    - Microsoft Endpoint Configuration Manager
>    - Windows Autopilot
>
> Device Options in Azure AD
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

#### Require hybrid Azure AD joined device

#### Require approved client app

#### Require app protection policy

#### Require password change

## Access Controls: Session

## Enable Policy Mode

### Report-Only Mode & On, Off

### Service Dependencies

### What if Tool

## VPN Connectivity

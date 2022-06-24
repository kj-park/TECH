---
title: Azure AD Conditional Access Overview
filename: Microsoft365\Security\Azure-AD-Conditional-Access-Overview.md
ms.date: 2012.05.04
---

# Azure AD Conditional Access Overview

Modern 보안 경계는 조직의 네트워크를 넘어 사용자 와 장치의 Identity를 포함.

조직은 이런 Identity Signals 기반의 접근제어를 할 수 있음.

![conditional-access-signal-decision-enforcement](https://github.com/kj-park/Tech/blob/main/Microsoft365/media/conditional-access-signal-decision-enforcement.png?raw=true)

관리자는 아래의 두 가지 주요 목표에 직면합니다:

- 사용자가 언제 어디서나 생산성을 높일 수 있도록 지원
- 조직의 자산 보호

조건부 액세스 정책을 사용하면 필요할 때 적절한 액세스 제어를 적용하여 조직의 보안을 유지할 수 있습니다.

![conditional-access-overview-how-it-works](https://github.com/kj-park/Tech/blob/main/Microsoft365/media/conditional-access-overview-how-it-works.png?raw=true)

> [!IMPORTANT]
> 조건부 액세스 정책은 1단계 인증이 완료된 후에 적용

## Common Signals

- User 또는 Group Membership.
- IP Location 정보.
    - Trusted IP address 범위
    - Countries/Regions IP ranges
- Device. 특정 platforms 또는 특정 상태.
- Application.
- 계산된 실시간 위험 감지.
- Microsoft Cloud App Security (MCAS). 사용자 애플리케이션 액세스 및 세션을 실시간으로 모니터링 및 제어하여 클라우드 환경 내에서 수행되는 작업에 대한 액세스를 제어하고 가시성을 높일 수 있음.

## Common Decisions

- 액세스 차단. 가장 제한적인 결정.
- 액세스 권한 부여. 다음 옵션 중 하나 이상을 요구할 수 있음.
    - 다단계 인증 필요
    - 디바이스를 준수 상태로 표시해야 함
    - 하이브리드 Azure AD 조인된 디바이스 필요
    - 승인된 클라이언트 앱 필요
    - 앱 보호 정책 필요(미리 보기)

## Commonly Applied Policies

- 관리자 역할이 할당된 사용자에게 다단계 인증 요구
- Azure 관리 작업 시 다단계 인증 요구
- 레거시 인증 프로토콜을 사용하려고 시도하는 사용자의 로그인 차단
- Azure AD Multi-Factor Authentication 등록 시 신뢰할 수 있는 위치 요구
- 특정 위치의 액세스 차단 또는 액세스 권한 부여
- 위험한 로그인 동작 차단
- 특정 애플리케이션에는 조직에서 관리 디바이스를 사용하도록 요구


## License Requirements

Azure AD Premium P1 license.

[Microsoft 365 Business Premium licenses](https://docs.microsoft.com/en-us/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-business-service-description) 가 있는 고객은 조건부 액세스 기능에도 액세스할 수 있음.

[Sign-in Risk](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-conditions#sign-in-risk) requires access to [Identity Protection](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection)

> [!NOTE]
> [Comparing generally available features of the Free, Basic, and Premium editions](https://azure.microsoft.com/pricing/details/active-directory/)

## Building Azure AD Conditional Access Policy

### [Policy Assignments](./Azure-AD-Conditional-Access-Policy-Assignments)

### [Policy Access Controls](./Azure-AD-Conditional-Access-Policy-Access-Controls)

### Common Conditional Access Policies

#### [Security Defaults](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/concept-fundamentals-security-defaults)

#### [Emergency access accounts](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-policy-common#emergency-access-accounts)

- Manage emergency access accounts in Azure AD
- Create a resilient access control management strategy with Azure Active Directory

#### [Typical policies deployed by organizations](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-policy-common#typical-policies-deployed-by-organizations)

- [Block legacy authentication](Common-Policies/Block-Legacy-Authentication.md)
- [Require MFA for administrators](Common-Policies/Require-MFA-for-Administrators.md)
- [Require MFA for Azure management](Common-Policies/Require-MFA-for-Azure-Management.md)
- [Require MFA for all users](Common-Policies/Require-MFA-for-All-Users.md)

#### [Additional policies](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-policy-common#additional-policies)

- [Sign-in risk-based Conditional Access (Requires Azure AD Premium P2)](Common-Policies/Sign-in-risk-based-Conditional-Access)
- [User risk-based Conditional Access (Requires Azure AD Premium P2)](Common-Policies/User-risk-based-Conditional-Access)
- [Securing security info registration (Require trusted location for MFA registration)](Common-Policies/Securing-security-info-registration)
- [Block access by location](Common-Policies/Block-access-by-location)
- [Require compliant device](Common-Policies/Require-compliant-device)
- [Block access except specific apps](Common-Policies/Block-access-except-specific-apps)

---

---
title: Azure AD Conditional Access Policy Assignments
filename: Microsoft365\Security\Azure-AD-Conditional-Access-Policy-Assignments.md
date: 2012.05.06
---

# Azure AD Conditional Access Policy Assignments

## Assignments: Users and Groups

모든 사용자, 특정 사용자 그룹, 디렉터리 역할 또는 외부 게스트 사용자에 대한 사용자 및 그룹 할당을 기반으로 사용자 액세스를 제어

![conditional-access-policy-assignments](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/conditional-access-policy-assignments-users-and-groups.svg?raw=true)


### Include

- 없음
- 모든 사용자
- 사용자 및 그룹
    - 모든 게스트 및 외부 사용자. Azure AD B2B guest를 포함하지만, SharePoint B2B guest는 포함하지 않음
    - 디렉터리 역할. Azure AD directory role
    - 사용자 및 그룹. 모든 종류의 Azure AD Group, Nested Groups

> [!WARNING]
> 구성원이 2048를 초과하는 경우 해당 access는 차단될 수 있음.
>
> Customer Azure AD directory roles은 지원하지 않음.

### Exclude

- 모든 게스트 및 외부 사용자
- 디렉터리 역할
- 사용자 및 그룹

#### Preventing administrator lockout

제외는 일반적으로 응급 액세스 계정에 사용.

- Manage emergency access accounts in Azure AD
- Create a resilient access control management strategy with Azure Active Directory

모든 사용자 및 모든 앱 에 적용 되는 정책을 만들 때 관리자가 자신의 디렉터리에서 자동으로 잠그지 못하도록 방지 하기 위해 다음과 같은 경고가 표시 됩니다.

>Don't lock yourself out! We recommend applying a policy to a small set of users first to verify it behaves as expected. We also recommend excluding at least one administrator from this policy. This ensures that you still have access and can update a policy if a change is required. Please review the affected users and apps.

---

## Assignments: Cloud apps or actions

Cloud apps 또는 actions은 조건부 액세스 정책의 주요 신호에 속합니다

- 관리자는 기본 제공되는 Microsoft 애플리케이션과 모든 [Azure AD integrated applications](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/what-is-application-management) (갤러리, 비갤러리 및 Application Proxy를 통해 게시된 Application 등)을 포함한 Application 목록에서 선택할 수 있습니다.
관리자는 사용자 작업을 기반으로 하여 정책을 정의하도록 선택할 수 있습니다. 유일하게 지원되는 작업은 보안 정보 등록(미리 보기)입니다. 여기서는 조건부 액세스를 사용하여 결합된 보안 정보 등록 환경을 제어할 수 있습니다.

![conditional-access-policy-assignments-cloud-apps-or-actions](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/conditional-access-policy-assignments-cloud-apps-or-actions.svg?raw=true)

### Cloud apps

계속 해 서 더 많은 앱을 추가 하므로 다음 목록은 완전 하지 않으며 변경 될 수 있습니다.

https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-cloud-apps

### User actions

- Register security information
    - [Microsoft Authenticator](https://docs.microsoft.com/en-us/azure/active-directory/user-help/security-info-setup-auth-app)
    - Phone
        - [Text Messaging](https://docs.microsoft.com/en-us/azure/active-directory/user-help/security-info-setup-text-msg)
        - [Phone Call](https://docs.microsoft.com/en-us/azure/active-directory/user-help/security-info-setup-phone-number)
    - [Email](https://docs.microsoft.com/en-us/azure/active-directory/user-help/security-info-setup-email)
    - [Pre-Defined Security Questions](https://docs.microsoft.com/en-us/azure/active-directory/user-help/security-info-setup-questions)

- Register or join devices (preview)

    Enforce Conditional Access policy when users register or join devices to Azure AD

    이 actions은 아래 3 가지 핵심 고려사항이 있음:

    - `Require Multi-Factor Authentication`이 유일한 Grant Access controls의 옵션
    - `Client apps` and `Device state` conditions are not available
    - **Must:** `Devices to be Azure AD joined or Azure AD registered require Multi-Factor Authentication` to No



#### Register security information ([Combined security information registration](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-registration-mfa-sspr-combined))

##### Combined Registration supports:

| Method                                                            | Register           | Change | Delete |
|-------------------------------------------------------------------|--------------------|--------|--------|
| Microsoft Authenticator                                           | Yes (maximum of 5) | No     | Yes    |
| Other authenticator app                                           | Yes (maximum of 5) | No     | Yes    |
| Hardware token                                                    | No                 | No     | Yes    |
| Phone                                                             | Yes                | Yes    | Yes    |
| Alternate phone                                                   | Yes                | Yes    | Yes    |
| Office phone                                                      | Yes                | Yes    | Yes    |
| Email                                                             | Yes                | Yes    | Yes    |
| Security questions                                                | Yes                | No     | Yes    |
| App passwords                                                     | Yes                | No     | Yes    |
| FIDO2 security keys Managed mode only from the Security info page | Yes                | Yes    | Yes    |


##### Multi-Factor Authentication Options:

- Microsoft Authenticator – notification.
- Authenticator app or hardware token – code.
- Phone call.
- Text message.

##### Combined registration modes

- **Interrupt mode.** Wizard-like experience

    - Multi-Factor Authentication registration enforced through Identity Protection
    - Multi-Factor Authentication registration enforced through per-user Multi-Factor Authentication
    - Multi-Factor Authentication registration enforced through Conditional Access or other policies
    - SSPR registration enforced
    - SSPR refresh enforced
    
    ![combined-security-info-flow-chart](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/combined-security-info-flow-chart.png?raw=true)

- **Manage mode.** part of the user profile

    Users can access manage mode by going to https://aka.ms/mysecurityinfo

    users can add methods, delete or change existing methods, change the default method, and more.

---

## Assignments: Conditions

![AAD-Conditional-Access-Configuration-Conditions](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/AAD-Conditional-Access-Configuration-Conditions.png?raw=true)


### User Risk

[Identity Protection](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection)에 대 한 액세스 권한이 있는 고객의 경우 조건부 액세스 정책의 일부로 사용자 위험을 평가할 수 있음.  사용자 위험은 지정된 ID 또는 계정이 손상될 확률을 나타냄.

![identity-protection-user-risk-policy](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/identity-protection-user-risk-policy.svg?raw=true)

> [!NOTE]
> **참고:** [What is risk](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/concept-identity-protection-risks#user-risk) 및 [How To: Configure and enable risk policies](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-configure-risk-policies).

### Sign-in Risk

[Identity Protection](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection)에 대 한 액세스 권한이 있는 고객의 경우 조건부 액세스 정책의 일부로 로그인 위험을 평가할 수 있음.

![identity-protection-sign-in-risk-policy](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/identity-protection-sign-in-risk-policy.svg?raw=true)

> [!NOTE]
> **참고:** [What is risk](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/concept-identity-protection-risks#user-risk) 및 [How To: Configure and enable risk policies](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-configure-risk-policies).

### Device Platforms

### Locations

### Client Apps

### Device state (Preview)



---



- IP Location 정보.
    - Trusted IP address 범위
    - Countries/Regions IP ranges
- Device. 특정 platforms 또는 특정 상태.
- Application.
- 계산된 실시간 위험 감지.
- Microsoft Cloud App Security (MCAS). 사용자 애플리케이션 액세스 및 세션을 실시간으로 모니터링 및 제어하여 클라우드 환경 내에서 수행되는 작업에 대한 액세스를 제어하고 가시성을 높일 수 있음.

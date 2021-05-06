---
title: Azure AD Conditional Access Policy
filename: Microsoft365\Security\Azure-AD-Conditional-Access-Policy.md
date: 2012.05.04
---

# Azure AD Conditional Access Policy

## Common Signals

### Conditional Access: Users and Groups

모든 사용자, 특정 사용자 그룹, 디렉터리 역할 또는 외부 게스트 사용자에 대한 사용자 및 그룹 할당을 기반으로 사용자 액세스를 제어


![conditional-access-policy-assignments](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/conditional-access-policy-assignments.png?raw=true)

![conditional-access-policy-assignments](https://github.com/kj-park/Tech/blob/main/Microsoft365/Security/.media/conditional-access-policy-assignments.svg?raw=true)

#### Include

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

#### Exclude

- 모든 게스트 및 외부 사용자
- 디렉터리 역할
- 사용자 및 그룹

##### Preventing administrator lockout

제외는 일반적으로 응급 액세스 계정에 사용.

- Manage emergency access accounts in Azure AD
- Create a resilient access control management strategy with Azure Active Directory

모든 사용자 및 모든 앱 에 적용 되는 정책을 만들 때 관리자가 자신의 디렉터리에서 자동으로 잠그지 못하도록 방지 하기 위해 다음과 같은 경고가 표시 됩니다.

>Don't lock yourself out! We recommend applying a policy to a small set of users first to verify it behaves as expected. We also recommend excluding at least one administrator from this policy. This ensures that you still have access and can update a policy if a change is required. Please review the affected users and apps.

- IP Location 정보.
    - Trusted IP address 범위
    - Countries/Regions IP ranges
- Device. 특정 platforms 또는 특정 상태.
- Application.
- 계산된 실시간 위험 감지.
- Microsoft Cloud App Security (MCAS). 사용자 애플리케이션 액세스 및 세션을 실시간으로 모니터링 및 제어하여 클라우드 환경 내에서 수행되는 작업에 대한 액세스를 제어하고 가시성을 높일 수 있음.


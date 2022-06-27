---
title: Conditional Access: Require MFA for all users
filename: Microsoft365\Security\Conditional-Access\Common-Policies\Require-MFA-for-All-Users.md
ms.date: 2012.05.18
---

# Conditional Access: Require MFA for all users

> Your password doesn't matter, but MFA does! Based on our studies, your account is more than 99.9% less likely to be compromised if you use MFA.

[Your Pa$$word doesn't matter](https://techcommunity.microsoft.com/t5/Azure-Active-Directory-Identity/Your-Pa-word-doesn-t-matter/ba-p/731984)

## User exclusions

- **Emergency access or break-glass accounts.** 드문 경우지만 모든 관리자가 테넌트에서 잠기면 응급 액세스 관리 계정을 사용하여 테넌트에 로그인하여 액세스 복구 단계를 수행할 수 있습니다.
- **Service accounts and service principals.** 서비스 계정은 특정 사용자에게 연결되지 않은 비대화형 계정입니다. 일반적으로 애플리케이션에 대한 프로그래밍 방식 액세스를 허용하는 백 엔드 서비스에서 사용되지만 관리 목적으로 시스템에 로그인하는 데도 사용됩니다. MFA를 프로그래밍 방식으로 완료할 수 없기 때문에 이러한 서비스 계정은 제외되어야 합니다. 

## Application exclusions

조직에서는 다양한 클라우드 애플리케이션을 사용할 것입니다. 이러한 애플리케이션이 모두 동일한 보안을 요구하는 것은 아닙니다. 예를 들어 급여 및 출석 애플리케이션은 MFA가 필요할 수 있지만 cafeteria는 필요하지 않습니다. 관리자는 특정 애플리케이션을 해당 정책에서 제외하도록 선택할 수 있습니다.

## Policy Settings

- Policy Name: Require MFA for all users
- State: On

### Assignments

- **Users and Groups**
    - Include
        - [ ] None
        - [X] All users
        - [ ] Select users and groups
            - [ ] All guest and external users
            - [ ] Directory roles
            - [ ] Users and groups
    - Exclude: Global Administrators Role user
        - [ ] All guest and external users
        - [ ] Directory roles
        - [X] Users and groups: Global administrator account

- **Cloud apps or actions**
    - [X] Cloud apps
        - Include
            - [ ] None
            - [ ] All cloud apps
            - [X] Select apps: Microsoft Azure Management
        - Exclude:
            - [ ] Select excluded cloud apps
    - [ ] User actions
        - [ ] Register security information
        - [ ] Register or join devices

- **Conditions**
    - User risk: Not configured
    - Sign-in risk: Not configured
    - Device platforms: Not configured
    - Locations
        - Include
            - [X] Any Location
            - [ ] All trusted locations
            - [ ] Selected locations
        - Exclude
            - [X] All trusted locations
            - [ ] Selected locations
    - Client apps
        - Modern authentication clients
            - [X] Browser
            - [X] Mobile apps and desktop clients
        - Legacy authentication clients
            - [X] Exchange ActiveSync clients
            - [X] Other clients
    - Device state (Preview): Not configured
        - Include
            - [ ] All device state
        - Exclude
            - [ ] Device Hybrid Azure AD joined
            - [ ] Device marked as compliant

### Access controls

- **Grant**
    - [ ] Black access
    - [X] Grant access
        - [X] Require multi-factor authentication
        - [ ] Require device to be marked as compliant
        - [ ] Require Hybrid Azure AD joined device
        - [ ] Require approved client app
        - [ ] Require app protection policy
        - [ ] Require password change

        For Multi controls

        - [X] Require all the selected controls (default)
        - [ ] Require one of the selected controls
- **Session**: 0 Controls selected
    - [ ] Use app enforced restrictions
    - [ ] Use Conditional Access App Control
    - [ ] Sign-in frequency
    - [ ] Persistent browser session

---
title: Conditional Access: Require MFA for Azure management
filename: Microsoft365\Security\Conditional-Access\Common-Policies\Require-MFA-for-Azure-Management.md
ms.date: 2012.05.18
---

# Conditional Access: Require MFA for Azure management

조직에서는 다양한 Azure 서비스를 사용하고 다음과 같은 Azure Resource Manager 기반 도구에서 이러한 서비스를 관리합니다.

- Azure portal
- Azure PowerShell
- Azure CLI

이러한 도구는 구독 수준 구성, 서비스 설정 및 구독 청구를 변경할 수 있는, 리소스에 대한 높은 권한의 액세스를 제공할 수 있습니다. 이러한 권한 있는 리소스를 보호하기 위해 이러한 리소스에 액세스하는 모든 사용자에 대해 다단계 인증을 요구하는 것이 좋습니다.

## User exclusions

- **Emergency access or break-glass accounts.** 드문 경우지만 모든 관리자가 테넌트에서 잠기면 응급 액세스 관리 계정을 사용하여 테넌트에 로그인하여 액세스 복구 단계를 수행할 수 있습니다.
- **Service accounts and service principals.** 서비스 계정은 특정 사용자에게 연결되지 않은 비대화형 계정입니다. 일반적으로 애플리케이션에 대한 프로그래밍 방식 액세스를 허용하는 백 엔드 서비스에서 사용되지만 관리 목적으로 시스템에 로그인하는 데도 사용됩니다. MFA를 프로그래밍 방식으로 완료할 수 없기 때문에 이러한 서비스 계정은 제외되어야 합니다. 

## Policy Settings

- Policy Name: Require MFA for Azure management
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
    - Locations: Not configured
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

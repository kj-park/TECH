---
title: Conditional Access: Sign-in risk-based Conditional Access (Requires Azure AD Premium P2)
filename: Microsoft365\Security\Conditional-Access\Common-Policies\Sign-in-risk-based-Conditional-Access.md
date: 2012.05.18
---

# Sign-in risk-based Conditional Access (Requires Azure AD Premium P2)

대부분의 사용자는 추적 가능한 일반 동작을 갖고 있으며, 정상 범위를 벗어나면 사용자가 로그인하도록 허용하는 것이 위험할 수 있습니다. 해당 사용자를 차단 하거나 multi-factor authentication을 수행 하도록 요청 하는 것이 사실 사용자의 신원을 증명할 수 있습니다.

로그인 위험은 지정 된 인증 요청이 id 소유자에 의해 권한이 부여 되지 않은 확률을 나타냅니다. Azure AD Premium P2 라이선스가 있는 조직은 로그인 위험 검색 Azure AD ID 보호통합 하는 조건부 액세스 정책을 만들 수 있습니다.

이 정책이 할당 될 수 있는 두 가지 위치가 있습니다.

- Enable through Identity Protection
- Enable with Conditional Access policy

## Policy Settings (Enable with Conditional Access policy)

- Policy Name: Sign-in risk-based Conditional Access with Conditional Access
- State:

### Assignments

- **Users and Groups**
    - Include
        - [ ] None
        - [ ] All users
        - [ ] Select users and groups
            - [ ] All guest and external users
            - [ ] Directory roles
            - [ ] Users and groups
    - Exclude: Global Administrators Role user
        - [ ] All guest and external users
        - [ ] Directory roles: Global administrator
        - [ ] Users and groups

- **Cloud apps or actions**
    - [ ] Cloud apps
        - Include
            - [ ] None
            - [ ] All cloud apps
            - [ ] Select apps
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
            - [ ] Browser
            - [ ] Mobile apps and desktop clients
        - Legacy authentication clients
            - [ ] Exchange ActiveSync clients
            - [ ] Other clients
    - Device state (Preview): Not configured
        - Include
            - [ ] All device state
        - Exclude
            - [ ] Device Hybrid Azure AD joined
            - [ ] Device marked as compliant

### Access controls

- **Grant**
    - [ ] Black access
    - [ ] Grant access
        - [ ] Require multi-factor authentication
        - [ ] Require device to be marked as compliant
        - [ ] Require Hybrid Azure AD joined device
        - [ ] Require approved client app
        - [ ] Require app protection policy
        - [ ] Require password change

        For Multi controls

        - [ ] Require all the selected controls
        - [ ] Require one of the selected controls
- **Session**: 0 Controls selected
    - [ ] Use app enforced restrictions
    - [ ] Use Conditional Access App Control
    - [ ] Sign-in frequency
    - [ ] Persistent browser session

---

## Policy Settings (Enable through Identity Protection)

- Policy Name: Sign-in risk-based Conditional Access through Identity Protection
- State:

### Assignments

- **Users and Groups**
    - Include
        - [ ] None
        - [ ] All users
        - [ ] Select users and groups
            - [ ] All guest and external users
            - [ ] Directory roles
            - [ ] Users and groups
    - Exclude: Global Administrators Role user
        - [ ] All guest and external users
        - [ ] Directory roles: Global administrator
        - [ ] Users and groups

- **Cloud apps or actions**
    - [ ] Cloud apps
        - Include
            - [ ] None
            - [ ] All cloud apps
            - [ ] Select apps
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
            - [ ] Browser
            - [ ] Mobile apps and desktop clients
        - Legacy authentication clients
            - [ ] Exchange ActiveSync clients
            - [ ] Other clients
    - Device state (Preview): Not configured
        - Include
            - [ ] All device state
        - Exclude
            - [ ] Device Hybrid Azure AD joined
            - [ ] Device marked as compliant

### Access controls

- **Grant**
    - [ ] Black access
    - [ ] Grant access
        - [ ] Require multi-factor authentication
        - [ ] Require device to be marked as compliant
        - [ ] Require Hybrid Azure AD joined device
        - [ ] Require approved client app
        - [ ] Require app protection policy
        - [ ] Require password change

        For Multi controls

        - [ ] Require all the selected controls
        - [ ] Require one of the selected controls
- **Session**: 0 Controls selected
    - [ ] Use app enforced restrictions
    - [ ] Use Conditional Access App Control
    - [ ] Sign-in frequency
    - [ ] Persistent browser session

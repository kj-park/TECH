---
title: Conditional Access: Block legacy authentication
filename: Microsoft365\Security\Conditional-Access\Common-Policies\Block-Legacy-Authentication.md
date: 2012.05.17
---

# Conditional Access: Block legacy authentication

레거시 인증 프로토콜과 관련된 위험이 증가함에 따라 조직은 이러한 프로토콜을 사용하여 인증 요청을 차단하고 최신 인증을 요구하는 것이 좋습니다.


## Policy Settings

- Policy Name: Block legacy authentication
- State: Report-only

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
        - [X] Directory roles: Global administrator
        - [ ] Users and groups

- **Cloud apps or actions**
    - [X] Cloud apps
        - Include
            - [ ] None
            - [X] All cloud apps
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
            - [X] Exchange ActiveSync clients
            - [X] Other clients
    - Device state (Preview): Not configured
        - Include
            - [ ] All device state
        - Exclude
            - [ ] Device Hybrid Azure AD joined
            - [ ] Device marked as compliant

- **Access controls**
    - Grant
        - [X] Black access
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
    - Session: 0 Controls selected
        - [ ] Use app enforced restrictions
        - [ ] Use Conditional Access App Control
        - [ ] Sign-in frequency
        - [ ] Persistent browser session

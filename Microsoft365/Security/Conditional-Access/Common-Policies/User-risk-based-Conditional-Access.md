---
title: Conditional Access: User risk-based Conditional Access (Requires Azure AD Premium P2)
filename: Microsoft365\Security\Conditional-Access\Common-Policies\User-risk-based-Conditional-Access.md
ms.date: 2012.05.18
---

#



## Policy Settings

- Policy Name:
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

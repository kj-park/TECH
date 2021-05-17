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
- 
### Assignments

- **Users and Groups**
    - Include: All users
    - Exclude: Global Administrators Role user

- **Cloud apps or actions**
    - Include: All cloud apps
    - Exclude: None

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

- **Access controls**
    - Grant
        - [X] Black access
    - Session: 0 Controls selected

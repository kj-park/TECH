---
layout: default
title: [Technical Readiness]
filename: Microsoft365/Hybrid/Understand-Azure-AD-Connect-cloud-sync.md
ms.date: 2023.06.13
---

# Understand Azure AD Connect cloud sync

Azure AD Connect cloud sync는 사용자 및 그룹, 연락처를 Azure AD에 동기화하기 위한 Hybrid Identity를 달성하도록 설계된 Microsoft의 새로운 제품입니다.
Azure AD Cloud Provisioning Agent를 사용하여 이 작업을 수행합니다. Azure AD Connect와 함께 사용할 수 있으며 다음과 같은 이점이 있습니다:

- Support for synchronizing to an Azure AD tenant from a multi-forest disconnected Active Directory forest environment: The common scenarios include merger & acquisition (where the acquired company's AD forests are isolated from the parent company's AD forests), and companies that have historically had multiple AD forests.
- 다중 포리스트 연결 끊김 Active Directory 포리스트 환경에서 Azure AD 테넌트와 동기화를 지원합니다. 일반적인 시나리오에는 합병 & 인수(인수한 회사의 AD 포리스트가 부모 회사의 AD 포리스트와 분리된 경우) 및 이전에 여러 AD 포리스트가 있는 회사가 포함됩니다.
- Simplified installation with light-weight provisioning agents: The agents act as a bridge from AD to Azure AD, with all the sync configuration managed in the cloud.
- 경량 프로비저닝 에이전트로 간소화된 설치: 에이전트는 클라우드에서 관리되는 모든 동기화 구성과 함께 AD에서 Azure AD로의 브리지 역할을 합니다.
- Multiple provisioning agents can be used to simplify high availability deployments, particularly critical for organizations relying upon password hash synchronization from AD to Azure AD.
- 여러 프로비저닝 에이전트를 사용하여 고가용성 배포를 간소화할 수 있습니다. 특히 AD에서 Azure AD로의 암호 해시 동기화를 사용하는 조직에 특히 중요합니다.
- Support for large groups with up to 50,000 members. It's recommended to use only the OU scoping filter when synchronizing large groups.
- 최대 50,000명의 구성원이 있는 대기업을 지원합니다. 대규모 그룹을 동기화할 때는 OU 범위 지정 필터만 사용하는 것이 좋습니다.


---

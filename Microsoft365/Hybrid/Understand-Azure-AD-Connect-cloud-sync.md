---
layout: default
title: [Technical Readiness]
filename: Microsoft365/Hybrid/Understand-Azure-AD-Connect-cloud-sync.md
ms.date: 2023.06.13
---

# Understand Azure AD Connect cloud sync

Azure AD Connect cloud sync는 사용자 및 그룹, 연락처를 Azure AD에 동기화하기 위한 Hybrid Identity를 달성하도록 설계된 Microsoft의 새로운 제품입니다.
Azure AD Cloud Provisioning Agent를 사용하여 이 작업을 수행합니다. Azure AD Connect와 함께 사용할 수 있으며 다음과 같은 이점이 있습니다:

- **Support for synchronizing to an Azure AD tenant from a multi-forest disconnected Active Directory forest environment**: 일반적인 시나리오에는 합병 & 인수(인수한 회사의 AD 포리스트가 부모 회사의 AD 포리스트와 분리된 경우) 및 이전에 여러 AD 포리스트가 있는 회사가 포함됩니다.

- **Simplified installation with light-weight provisioning agents**: 에이전트는 클라우드에서 관리되는 모든 동기화 구성과 함께 AD에서 Azure AD로의 브리지 역할을 합니다.

- 여러 프로비저닝 에이전트를 사용하여 고가용성 배포를 간소화할 수 있습니다. 특히 AD에서 Azure AD로의 암호 해시 동기화를 사용하는 조직에 특히 중요합니다.

- 최대 50,000명의 구성원이 있는 대규모 그룹을 지원합니다. 대규모 그룹을 동기화할 때는 OU 범위 지정 필터만 사용하는 것이 좋습니다.

Azure AD Connect cloud sync를 사용하면 AD에서 Azure AD로의 프로비저닝이 Microsoft Online Services에서 오케스트레이션됩니다. 조직에서는 Azure AD와 AD 간의 브리지 역할을 하는 경량 에이전트로 온-프레미스 또는 IaaS 호스팅 환경에만 배포하면 됩니다. 프로비저닝 구성은 Azure AD에 저장되고 서비스의 일부로 관리됩니다.

## Comparison between Azure AD Connect and cloud sync

|| Azure Active Directory Connect sync | Azure Active Directory Connect cloud sync |
|--|:-:|:-:|
| **Connect to single on-premises AD forest**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Connect to multiple on-premises AD forests**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Connect to multiple disconnected on-premises AD forests**|  | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Lightweight agent installation model**|  | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Multiple active agents for high availability**|  | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Connect to LDAP directories**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Support for user objects**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Support for group objects**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Support for contact objects**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Support for device objects**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Allow basic customization for attribute flows**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Synchronize Exchange online attributes**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Synchronize extension attributes 1-15**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Synchronize customer defined AD attributes (directory extensions)**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Support for Password Hash Sync**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Support for Pass-Through Authentication**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Support for federation**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Seamless Single Sign-on**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Supports installation on a Domain Controller**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Support for Windows Server 2016**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Filter on Domains/OUs/groups**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Filter on objects' attribute values**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Allow minimal set of attributes to be synchronized (MinSync)**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Allow removing attributes from flowing from AD to Azure AD**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Allow advanced customization for attribute flows**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Support for password writeback**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Support for device writeback**| <i class="fa fa-circle" aria-hidden="true"></i> | Customers should use Cloud Kerberos trust for this moving forward |
| **Support for group writeback**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Support for merging user attributes from multiple domains**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Azure AD Domain Services support**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Exchange hybrid writeback**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Unlimited number of objects per AD domain**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Support for up to 150,000 objects per AD domain**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Groups with up to 50,000 members**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Large groups with up to 250,000 members**| <i class="fa fa-circle" aria-hidden="true"></i> |  |
| **Cross domain references**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |
| **On-demand provisioning**|  | <i class="fa fa-circle" aria-hidden="true"></i> |
| **Support for US Government**| <i class="fa fa-circle" aria-hidden="true"></i> | <i class="fa fa-circle" aria-hidden="true"></i> |

---

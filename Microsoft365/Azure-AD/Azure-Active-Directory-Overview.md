---
title: Azure Active Directory Overview
filename: Microsoft365\Azure-AD\Azure-Active-Directory-Overview.md
ms.date: 2021.04.06
---

# Azure Active Directory Overview

## What is Azure Active Directory?

Azure AD(Azure Active Directory)는 직원들이 로그인하여 다음 리소스에 액세스할 수 있게 해주는 Microsoft의 클라우드 기반 ID 및 액세스 관리 서비스입니다.

- Microsoft 365, Azure Portal, 수천 개의 기타 SaaS 애플리케이션 등의 외부 리소스.
- 조직에서 자체 개발한 클라우드 앱과 함께 회사 네트워크와 인트라넷의 앱 같은 내부 리소스.

### Who uses Azure AD?

Azure AD의 대상은 다음과 같습니다.

- **IT 관리자.** IT 관리자는 Azure AD를 사용하여 비즈니스 요구 사항에 따라 앱 및 앱 리소스에 대한 액세스를 제어할 수 있습니다. 예를 들어 Azure AD를 사용하여 중요한 조직 리소스에 액세스할 때에는 다단계 인증을 요구할 수 있습니다. 또한 Azure AD를 사용하여 기존 Windows Server AD와 Microsoft 365를 비롯한 클라우드 앱 간에 사용자 프로비저닝을 자동화할 수 있습니다. 마지막으로, Azure AD는 자동으로 사용자 ID 및 자격 증명을 보호하고 액세스 거버넌스 요구 사항을 충족하는 강력한 도구를 제공합니다.

- **앱 개발자**. 앱 개발자는 앱에 SSO(Single Sign-On)를 추가하여 사용자의 기존 자격 증명과 함께 사용할 수 있는 표준 기반 접근 방식으로 Azure AD를 사용할 수 있습니다. Azure AD는 조직의 기존 데이터를 사용하여 맞춤형 앱 환경을 빌드할 수 있는 API도 제공합니다.

- **Microsoft 365, Office 365, Azure 또는 Dynamics CRM Online 구독.** 여러분은 구독자로서 이미 Azure AD를 사용하고 있습니다. 각 Microsoft 365, Office 365, Azure 및 Dynamics CRM Online 테넌트는 자동으로 Azure AD 테넌트입니다. 통합 클라우드 앱에 대한 액세스를 즉시 관리할 수 있습니다.

### What are the Azure AD licenses?

Microsoft 365 또는 Microsoft Azure 같은 Microsoft Online 비즈니스 서비스는 로그인 및 ID 보호를 위해 Azure AD가 필요합니다. Microsoft Online 비즈니스 서비스를 구독하는 경우 모든 무료 기능을 사용할 수 있는 Azure AD가 자동으로 제공됩니다.

Azure AD 구현을 향상하기 위해 Azure Active Directory Premium P1 또는 Premium P2 라이선스로 업그레이드하여 유료 기능을 추가할 수도 있습니다. Azure AD 유료 라이선스는 기존 무료 디렉터리 위에 빌드되며, 돌아다니면서 일하는 직원에게 셀프 서비스, 향상된 모니터링, 보안 보고 및 보안 액세스를 제공합니다.

> [!Note] 이러한 라이선스의 가격 책정 옵션은 [Azure Active Directory Pricing](https://azure.microsoft.com/pricing/details/active-directory/)을 참조하세요.
>
> Azure Active Directory Premium P1 및 Premium P2는 현재 중국에서 지원되지 않습니다.
> 
> **Edited:** `2021.04.06`

- **Azure Active Directory Free.** Azure, Microsoft 365 및 여러 인기 SaaS 앱에 사용자 및 그룹 관리, 온-프레미스 디렉터리 동기화, 기본 보고서, 클라우드 사용자를 위한 셀프 서비스 암호 변경 및 Single Sign-On을 제공합니다.

- **Azure Active Directory Premium P1.** P1은 Free 기능 외에도 하이브리드 사용자에게 온-프레미스 및 클라우드 리소스에 대한 액세스를 제공합니다. 또한 온-프레미스 사용자에 대한 셀프 서비스 암호 재설정을 허용하는 동적 그룹, 셀프 서비스 그룹 관리, Microsoft Identity Manager(온-프레미스 ID 및 액세스 관리 도구 모음), 클라우드 쓰기 저장 기능 등의 고급 관리를 지원합니다.

- **Azure Active Directory Premium P2.** P2는 Free 및 P1 기능 외에도 앱 및 중요한 회사 데이터에 대한 위험 기반 조건부 액세스를 제공하는 [Azure Active Directory Identity Protection](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection)과 관리자의 리소스 액세스를 검색, 제한, 모니터링하고 필요할 때 적시에 액세스를 제공할 수 있도록 도와주는 [Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-getting-started)를 제공합니다.

- **"종량제(Pay as you go)" 기능 라이선스.** Azure Active Directory B2C(Business-to-Customer) 같은 추가 기능 라이선스도 얻을 수 있습니다. B2C는 고객용 앱의 ID 및 액세스 관리 솔루션을 제공하는 데 도움이 될 수 있습니다. 자세한 내용은 [Azure Active Directory B2C documentation](https://docs.microsoft.com/en-us/azure/active-directory-b2c/)를 참조하세요.


### Which features work in Azure AD?

Azure AD 라이선스를 선택하면 조직에서 사용 가능한 다음 기능 중 일부 또는 전부에 대한 액세스 권한을 얻게 됩니다.

| Category | Description |
|--|--|
| Application management | 애플리케이션 프록시, Single Sign-On, 내 앱 포털(액세스 패널이라고도 함) 및 SaaS(Software as a Service) 앱을 사용하여 클라우드 및 온-프레미스 앱을 관리합니다. |
| Authentication | Azure Active Directory 셀프 서비스 암호 재설정, Multi-Factor Authentication, 사용자 지정 금지된 암호 목록 및 스마트 잠금을 관리합니다. |
| Azure Active Directory for developers | 모든 Microsoft ID를 로그인하고 Microsoft Graph, 기타 Microsoft API 또는 사용자 지정 API를 호출하는 토큰을 가져오는 앱을 빌드합니다. |
| Business-to-Business (B2B) | 회사 데이터에 대한 제어를 유지하면서도 게스트 사용자 및 외부 파트너를 관리합니다.  |
| Business-to-Customer (B2C) | 사용자가 앱을 사용할 때 프로필을 등록, 로그인 및 관리하는 방법을 사용자 지정하고 제어합니다. |
| Conditional Access | 클라우드 앱에 대한 액세스 관리 자세한 내용은 [Azure AD Conditional Access documentation](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/)를 참조하세요. |
| Device Management | 클라우드 또는 온-프레미스 디바이스가 회사 데이터에 액세스하는 방법을 관리합니다. 자세한 내용은 [Azure AD Device Management documentation](https://docs.microsoft.com/en-us/azure/active-directory/devices/)를 참조하세요. |
| Domain services | 도메인 컨트롤러를 사용하지 않고 도메인에 Azure 가상 머신을 조인합니다. 자세한 내용은 [Azure AD Domain Services documentation](https://docs.microsoft.com/en-us/azure/active-directory-domain-services/)를 참조하세요. |
| Enterprise users | 그룹 및 관리자 역할을 사용하여 라이선스를 할당하고, 앱에 액세스하고, 대리자를 설정합니다. |
| Hybrid identity | Azure Active Directory Connect 및 Connect Health를 사용하여 위치(클라우드 또는 온-프레미스)에 관계 없이 모든 리소스를 인증하고 권한을 부여할 수 있는 단일 사용자 ID를 제공합니다. |
| Identity governance | 직원, 비즈니스 파트너, 공급업체, 서비스 및 앱 액세스 컨트롤을 통해 조직의 ID를 관리합니다. 액세스 검토를 수행할 수도 있습니다. |
| Identity protection | 조직의 ID에 영향을 미치는 잠재적 취약점을 검색하고, 의심스러운 작업에 대응하는 정책을 구성하고, 문제를 해결하기 위한 적절한 조치를 취합니다. |
| Managed identities for Azure resources | Key Vault를 포함하여 Azure AD에서 지원되는 모든 인증 서비스를 인증할 수 있는 자동으로 관리되는 ID를 Azure 서비스에 제공합니다. |
| Privileged identity management (PIM) | 조직 내 액세스를 관리, 제어 및 모니터링합니다. 이 기능에는 Azure AD, Azure 및 기타 Microsoft Online Services(예: Microsoft 365 또는 Intune)의 리소스에 대한 액세스 권한이 포함되어 있습니다. |
| Reports and monitoring | 환경의 보안과 사용 패턴에 대한 인사이트를 얻을 수 있습니다. 자세한 내용은 [Azure Active Directory reports and monitoring documentation](https://docs.microsoft.com/en-us/azure/active-directory/reports-monitoring/)를 참조하세요. |

### Terminology

Azure AD 및 설명서를 보다 정확하게 이해하려면 다음 용어를 검토하는 것이 좋습니다.

| Term or concept | Description |
|--|--|
| Identity | 인증을 받을 수 있는 대상입니다. ID는 사용자 이름과 암호를 사용하는 사용자일 수 있습니다. ID에는 비밀 키나 인증서를 통해 인증을 필요로 할 수 있는 다른 서버나 애플리케이션도 포함됩니다. |
| Account | 연결된 데이터가 있는 ID입니다. ID가 없는 계정은 있을 수 없습니다. |
| Azure AD account |Azure AD 또는 Microsoft 365 같은 다른 Microsoft 클라우드 서비스를 통해 만들어진 ID입니다. ID는 Azure AD에 저장되고 조직의 클라우드 서비스 구독에 액세스할 수 있습니다. 이 계정을 회사 또는 학교 계정이라고도 합니다.  |
| Account Administrator | 이 클래식 구독 관리자 역할은 개념적으로 구독의 청구 소유자입니다. 이 역할은 Azure 계정 센터에 액세스할 수 있으며 계정의 모든 구독을 관리할 수 있습니다.  |
| Service Administrator | 이 클래식 구독 관리자 역할은 액세스를 포함하여 모든 Azure 리소스를 관리할 수 있습니다. 이 역할은 구독 범위에서 소유자 역할이 할당된 사용자와 동일한 액세스 권한을 갖습니다. |
| Owner | 이 역할은 액세스를 포함하여 모든 Azure 리소스를 관리할 수 있습니다. 이 역할은 Azure 리소스에 대한 세분화된 액세스 관리를 제공하는 Azure RBAC(Azure 역할 기반 액세스 제어)라고 하는 최신 권한 부여 시스템을 기반으로 합니다. |
| Azure AD Global administrator | 이 관리자 역할은 Azure AD 테넌트를 만든 모든 사람에게 자동으로 할당됩니다. 글로벌 관리자는 Exchange Online, SharePoint Online, 비즈니스용 Skype Online 등의 서비스에 페더레이션되는 서비스 및 Azure AD에 대한 모든 관리 기능을 수행할 수 있습니다. 글로벌 관리자를 여러 명 둘 수 있지만, 글로벌 관리자만이 사용자에게 관리자 역할을 할당(다른 글로벌 관리자 할당 포함)할 수 있습니다. 다양한 관리자 역할에 대한 자세한 내용은 [Azure AD built-in roles](https://docs.microsoft.com/en-us/azure/active-directory/roles/permissions-reference)을 참조하세요. |
| Azure subscription | Azure 클라우드 서비스 요금을 지불하는 데 사용됩니다. 여러 구독을 한 신용 카드에 연결할 수 있습니다. |
| Azure tenant | 조직이 Microsoft Azure, Microsoft Intune 또는 Microsoft 365 같은 Microsoft 클라우드 서비스 구독에 등록할 때 자동으로 생성되는 Azure AD의 신뢰할 수 있는 전용 인스턴스입니다. 한 Azure 테넌트는 단일 조직을 나타냅니다. |
| Single tenant | 전용 환경의 다른 서비스에 액세스하는 Azure 테넌트는 단일 테넌트로 간주됩니다. |
| Multi-tenant | 여러 조직에서 공유하는 환경의 다른 서비스에 액세스하는 Azure 테넌트는 다중 테넌트로 간주됩니다. |
| Azure AD directory | Azure 테넌트마다 신뢰할 수 있는 전용 Azure AD 디렉터리가 있습니다. Azure AD 디렉터리는 테넌트의 사용자, 그룹 및 앱을 포함하며 테넌트 리소스에 대한 ID 및 액세스 관리를 수행하는 데 사용됩니다. |
| Custom domain | 모든 새 Azure AD 디렉터리는 domainname.onmicrosoft.com이라는 초기 도메인 이름으로 제공됩니다. 이 초기 이름 외에도, 고객이 비즈니스를 수행하는 데 사용되고 사용자가 조직 리소스에 액세스하는 데 사용되는 이름을 포함하는 조직의 도메인 이름을 목록에 추가할 수 있습니다. 사용자 지정 도메인 이름을 추가하면 alain@contoso.com처럼 사용자에게 친숙한 사용자 이름을 만들 수 있습니다. |
| Microsoft account (also called, MSA) | Outlook, OneDrive, Xbox LIVE 또는 Microsoft 365 같은 소비자 지향 Microsoft 제품 및 클라우드 서비스에 대한 액세스 권한을 제공하는 개인 계정입니다. Microsoft 계정은 Microsoft에서 실행하는 Microsoft 소비자 ID 계정 시스템에 생성되고 저장됩니다. |

---

## Compare Active Directory to Azure Active Directory

Azure AD는 클라우드 및 온-프레미스에서 모든 앱에 대 한 IDaaS (Identity as a Service) 솔루션을 조직에 제공.

다음 표에서는 Active Directory 개념과 Azure Active Directory 간의 차이점과 유사성에 대해 간략하게 설명 합니다.

### 사용자

| 개념 | AD(Active Directory) | Azure Active Directory
|--|--|--|
| 프로 비전: 사용자 | 조직에서는 내부 사용자를 수동으로 만들거나 사내 또는 자동 프로비저닝 시스템 (예: Microsoft Identity Manager)을 사용 하 여 HR 시스템과 통합할 수 있습니다. | 기존 AD 조직은 Azure AD Connect 를 사용하여 id를 클라우드에 동기화 합니다.<br/>Azure AD는 클라우드 HR 시스템에서 사용자를 자동으로 만들 수 있도록 지원 합니다.  Azure AD는 Scim 지원 SaaS 앱에서 id를 프로 비전하여 사용자에 대한 액세스를 허용 하는 데 필요한 세부 정보를 앱에 자동으로 제공 합니다. |
| 프로 비전: 외부 ID | 조직에서는 외부 사용자를 전용 외부 AD 포리스트에 일반 사용자로 직접 만들어 외부 id (게스트 사용자)의 수명 주기를 관리 하는 관리 오버 헤드를 생성 합니다. | Azure AD는 외부 id를 지 원하는 특별 한 id 클래스를 제공 합니다. AZURE AD B2B 는 외부 사용자 id에 대 한 링크를 관리 하 여 유효한 지 확인 합니다. |
| 권한 관리 및 그룹 | 관리자가 사용자를 그룹 구성원으로 만듭니다. 그러면 앱 및 리소스 소유자가 그룹에 앱 또는 리소스에 대 한 액세스 권한을 부여 합니다. | 그룹 은 Azure AD 에서도 사용할 수 있으며, 관리자는 그룹을 사용 하 여 리소스에 대 한 권한을 부여할 수도 있습니다. Azure AD에서 관리자는 그룹에 멤버 자격을 수동으로 할당 하거나 쿼리를 사용 하 여 그룹에 사용자를 동적으로 포함할 수 있습니다.
관리자는 Azure AD에서 자격 관리 를 사용 하 여 워크플로 및 필요한 경우 시간 기반 조건을 사용 하 여 앱 및 리소스 컬렉션에 대 한 액세스 권한을 사용자에 게 제공할 수 있습니다. |
| Admin 관리 | 조직에서는 AD의 도메인, 조직 구성 단위 및 그룹 조합을 사용 하 여 제어 하는 디렉터리 및 리소스를 관리 하는 관리 권한을 위임 합니다. | Azure ad는 azure ad RBAC (역할 기반 액세스 제어) 시스템에 기본 제공 역할 을 제공 하며, id 시스템, 앱 및 it에서 제어 하는 리소스에 대 한 권한 있는 액세스를 위임 하는 사용자 지정 역할을 만드는 기능을 제한적으로 지원 합니다.<br/>권한 있는 역할에 대한 just-in-time, 제한 시간 또는 워크플로 기반 액세스를 제공 하도록 Privileged Identity Management (PIM) 을 사용 하 여 역할 관리를 향상 시킬 수 있습니다. |
| 자격 증명 관리 | Active Directory 자격 증명은 암호, 인증서 인증 및 스마트 카드 인증을 기반으로 합니다. 암호 길이, 만료 및 복잡성을 기반으로 하는 암호 정책을 사용 하 여 암호를 관리 합니다. | Azure AD는 클라우드 및 온-프레미스에 대 한 지능형 암호 보호 를 사용 합니다. 보호에는 스마트 잠금과 사용자 지정 암호 문구 및 대체가 차단 됩니다.<br/>Azure AD는 FIDO2 같은 multi-factor authentication 및 암호 없는 기술을 통해 보안을 크게 강화 합니다.<br/>Azure AD는 사용자에 게 셀프 서비스 암호 재설정 시스템을 제공 하 여 지원 비용을 절감 합니다. |

### 앱

| 개념 | AD(Active Directory) | Azure Active Directory
|--|--|--|
| 인프라 앱 | Active Directory은 많은 인프라 온-프레미스 구성 요소 (예: DNS, DHCP, IPSec, WiFi, NPS 및 VPN 액세스)의 기반을 형성 합니다. | 새로운 클라우드 세계에서 Azure AD는 응용 프로그램에 액세스 하고 네트워킹 제어에 의존 하는 새로운 제어합니다.<br/>사용자가 인증하는 경우 CA (조건부 액세스)는 필요한 조건에서 어떤 앱에 액세스할 수 있는 사용자를 제어 합니다. |
| 기존 앱 및 레거시 앱 | 대부분의 온-프레미스 앱은 LDAP, Windows-Integrated 인증 (NTLM 및 Kerberos) 또는 헤더 기반 인증을 사용 하 여 사용자에 대 한 액세스를 제어 합니다. | Azure AD는 온-프레미스에서 실행 되는 AZURE ad 응용 프로그램 프록시 에이전트를 사용 하 여 이러한 유형의 온-프레미스 앱에 대 한 액세스를 제공할 수 있습니다. 이 방법을 사용 하는 경우 Azure AD는 마이그레이션하는 동안 Kerberos를 사용 하 여 온-프레미스에서 사용자 Active Directory 인증할 수 있으며 레거시 앱과 함께 사용 해야 합니다. |
| SaaS 앱 | Active Directory는 SaaS 앱을 기본적으로 지원 하지 않으며 AD FS와 같은 페더레이션 시스템이 필요 합니다. | OAuth2, SAML 및 WS 인증을 지원하는 SaaS 앱 을 통합하여 인증을 위해 AZURE AD를 사용할 수 있습니다. |
| 최신 인증을 사용 하는 LOB (기간 업무) 앱 | 조직에서는 Active Directory와 함께 AD FS를 사용 하 여 최신 인증을 요구 하는 LOB 앱을 지원할 수 있습니다. | 인증을 위해 Azure AD를 사용 하도록 최신 인증을 요구 하는 LOB 앱을 구성할 수 있습니다. |
| 중간 계층/데몬 서비스 | 온-프레미스 환경에서 실행 되는 서비스는 일반적으로 AD 서비스 계정 또는 gMSA (그룹 관리 서비스 계정)를 사용하여 실행합니다. 이러한 앱은 서비스 계정의 사용 권한을 상속 합니다. | Azure AD는 클라우드에서 다른 작업을 실행 하기 위해 관리 되는 id 를 제공 합니다. 이러한 id의 수명 주기는 Azure AD에서 관리 되 고, 리소스 공급자에 연결 되어 백도어 액세스를 얻는 다른 용도로 사용할 수 없습니다. |

### 디바이스

| 개념 | AD(Active Directory) | Azure Active Directory
|--|--|--|
| 모바일 | Active Directory는 타사 솔루션이 없는 모바일 장치를 기본적으로 지원 하지 않습니다. | Microsoft의 모바일 장치 관리 솔루션 Microsoft Intune는 Azure AD와 통합 됩니다. Microsoft Intune는 인증 중에 평가할 id 시스템에 장치 상태 정보를 제공 합니다. |
| Windows 데스크톱 | Active Directory 그룹 정책, System Center Configuration Manager 또는 기타 타사 솔루션을 사용 하 여 Windows 장치를 관리 하는 도메인 가입 기능을 제공 합니다. | Windows 장치 를 AZURE AD에 조인할수 있습니다. 조건부 액세스는 장치가 인증 프로세스의 일부로 Azure AD에 가입 되어 있는지 확인할 수 있습니다. Microsoft Intune를 사용 하 여 Windows 장치를 관리할 수도 있습니다. 이 경우 조건부 액세스는 앱에 대 한 액세스를 허용 하기 전에 장치가 호환 되는지 (예: 최신 보안 패치와 바이러스 서명)를 고려 합니다. |
| Windows 서버 | Active Directory은 그룹 정책 또는 기타 관리 솔루션을 사용 하 여 온-프레미스 Windows server에 대 한 강력한 관리 기능을 제공 합니다. | Azure의 Windows server 가상 머신은 Azure AD Domain Services로 관리할 수 있습니다. 관리 id 는 vm이 id 시스템 디렉터리 또는 리소스에 액세스 해야 하는 경우에 사용할 수 있습니다. |
| Linux/Unix 워크 로드 | Active Directory는 타사 솔루션 없이는 기본적으로 Windows를 지원 하지 않습니다. 하지만 Active Directory Kerberos 영역으로 인증 하도록 Linux 컴퓨터를 구성할 수 있습니다. | Linux/Unix Vm은 관리 되는 id 를 사용 하 여 id 시스템 또는 리소스에 액세스할 수 있습니다. 일부 조직에서는 이러한 워크 로드를 클라우드 컨테이너 기술로 마이그레이션하고 관리 id를 사용할 수도 있습니다. |

---

## What's new in Azure Active Directory?

이 URL `https://docs.microsoft.com/api/search/rss?search=%22Release+notes+-+Azure+Active+Directory%22&locale=en-us`를 RSS 피드 판독기 아이콘 피드 판독기에 복사하고 붙어넣어 업데이트를 위해 이 페이지를 다시 방문해야 할 때 알림을 받습니다.

자세한 내용은 [What's new in Azure Active Directory?](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/whats-new)을 참조하세요.

### 참고

[What's new for Azure Active Directory in Microsoft 365 Government](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/whats-new-microsoft-365-government)

[Archive for What's new in Azure Active Directory?](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/whats-new-archive)


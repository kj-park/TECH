---
title: Microsoft Intune Overview
filename: Microsoft365\Security\Intune\Microsoft-Intune-Overview.md
ms.date: 2012.05.28
---

# Microsoft Intune Overview

Microsoft Intune은 Mobile Device Management (MDM) 과 Mobile Application Management(MAM)에 초점을 둔 cloud 기반 서비스입니다. 휴대폰, 태블릿, 랩톱 등 조직의 디바이스를 사용하는 방법을 제어할 수 있습니다. 애플리케이션을 제어하는 특정 정책을 구성할 수도 있습니다.

![intune-architecture]({{ site.url }}/Microsoft365/images/EMS/intune-architecture.svg?raw=true)

Intune을 사용하면 다음과 같은 작업을 수행할 수 있습니다:

- Intune을 사용하는 100% 클라우드를 선택하거나 Configuration Manager 및 Intune을 사용하는 공동 관리를 선택합니다.
- 개인 또는 조직이 소유한 디바이스에서 데이터 및 네트워크에 액세스할 수 있도록 규칙을 설정하고 설정을 구성합니다.
- 디바이스(온-프레미스 및 모바일)에 앱을 배포하고 인증합니다.
- 사용자가 정보에 액세스하고 공유하는 방법을 제어하여 회사 정보를 보호합니다.
- 디바이스와 앱이 보안 요구 사항을 준수하는지 확인합니다.

## Manage devices

Intune에서 디바이스를 등록하고 관리하는 경우 관리자는 다음과 같은 작업을 수행할 수 있습니다.

- 등록된 디바이스를 확인하고 조직 리소스에 액세스하는 디바이스의 인벤토리를 가져옵니다.
- 보안 및 상태 표준을 충족하도록 디바이스를 구성합니다. 예를 들어 탈옥 디바이스를 차단하려는 경우가 있습니다.
- 사용자가 Wi-Fi 네트워크에 쉽게 액세스하거나 VPN을 사용하여 네트워크에 연결할 수 있도록 디바이스에 인증서를 푸시합니다.
- 사용자 및 디바이스에 대한 규정 준수 보고서를 확인합니다.
- 디바이스를 분실했거나, 도난당했거나, 더 이상 사용하지 않는 경우 조직 데이터를 제거합니다.

---

### Manage apps

앱이 Intune에서 관리되는 경우 관리자는 다음과 같은 작업을 수행할 수 있습니다.

- 특정 그룹의 사용자, 특정 그룹의 디바이스 등을 포함하여 사용자 그룹 및 디바이스에 모바일 앱을 추가하고 할당합니다.
- 특정 설정을 사용하여 시작 또는 실행하도록 앱을 구성하고 디바이스에 이미 있는 기존 앱을 업데이트합니다.
- 사용되는 앱에 대한 보고서를 확인하고 사용 현황을 추적합니다.
- 앱에서 조직 데이터만 제거하여 선택적 초기화를 수행합니다.

Intune이 모바일 앱 보안을 제공하는 한 가지 방법은 앱 보호 정책 을 통해서입니다.

- Azure AD ID를 사용하여 조직 데이터와 개인 데이터를 격리합니다. 따라서 개인 정보는 조직의 IT 인식에서 격리됩니다. 조직 자격 증명을 사용하여 액세스하는 데이터에는 추가 보안 보호가 제공됩니다.
- 복사 및 붙여넣기, 저장, 보기와 같이 사용자가 수행할 수 있는 작업을 제한하여 개인 디바이스에 대한 액세스를 보호합니다.
- Intune에 등록되었거나, 다른 MDM 서비스에 등록되어 있거나, MDM 서비스에 등록되지 않은 디바이스에서 만들고 배포할 수 있습니다. 등록된 디바이스에서 앱 보호 정책은 보호 계층을 추가할 수 있습니다.

---

## Compliance and conditional access

Intune은 Azure AD와 통합되어 광범위한 액세스 제어 시나리오를 사용합니다. 예를 들어 전자 메일 또는 SharePoint와 같은 네트워크 리소스에 액세스하려면 모바일 디바이스가 Intune에 정의된 조직 표준을 준수해야 합니다. 마찬가지로 특정 모바일 앱 집합에만 사용할 수 있도록 서비스를 잠글 수 있습니다. 예를 들어 Exchange Online은 Outlook 또는 Outlook Mobile에서만 액세스할 수 있도록 제한할 수 있습니다.

Intune에서 조건부 액세스를 사용하는 일반적인 방법

- Device-based Conditional Access
- Applications available in Conditional Access for controlling Microsoft Intune
- Conditional access based on network access control
- Conditional access based on device risk
- Conditional access for Windows PCs
- App-based conditional access
- Intune Conditional access for Exchange on-premises

---

## What is a device Identities?

모든 형태와 크기의 디바이스 및 BYOD(Bring Your Own Device) 개념이 확산됨에 따라 IT 전문가는 다음 두 가지 대립되는 목표에 직면하고 있습니다.

- 최종 사용자가 언제 어디서나 생산성을 높일 수 있도록 허용
- 조직의 자산 보호

이와 같은 자산을 보호하려면 IT 직원이 먼저 디바이스 ID를 관리해야 합니다. IT 직원은 Microsoft Intune 같은 도구를 통해 디바이스 ID를 기반으로 빌드하여 보안 및 규정 준수의 표준을 충족하는지 확인할 수 있습니다. Azure AD(Azure Active Directory)에서는 이 디바이스를 통해 어디에서든지 디바이스, 앱 및 서비스에 대해 Single Sign-On을 수행할 수 있습니다.

- 사용자가 필요한 조직 자산에 액세스할 수 있습니다.
- IT 직원은 조직을 보호하는 데 필요한 컨트롤을 얻습니다.

디바이스 ID 관리는 디바이스 기반의 조건부 액세스에 대한 기반입니다. 디바이스 기반의 조건부 액세스 정책을 사용할 경우 관리 디바이스를 통해서만 환경의 리소스에 액세스하도록 할 수 있습니다.

### Getting devices in Azure AD

Azure AD에서 디바이스를 가져올 수 있는 여러 가지 옵션이 있습니다.

- **Azure AD registered.** Azure AD 등록 상태의 디바이스는 일반적으로 개인 소유이거나 모바일 디바이스이며 개인 Microsoft 계정 또는 다른 로컬 계정으로 로그인됩니다.
    - Windows 10
    - iOS
    - Android
    - MacOS

    최종 사용자가 관리하는 계정을 사용하며, 이 계정은 Microsoft 계정이거나 다음 중 하나 이상으로 보안이 지정된 다른 로컬 관리형 자격 증명입니다.

    - 암호
    - PIN
    - 패턴
    - Windows Hello

- **Azure AD joined.** Azure AD 조인 디바이스는 조직이 소유하며 조직에 속한 Azure AD 계정으로 로그인됩니다. 이 디바이스는 클라우드에만 존재합니다.
    - Windows 10
    - Windows Server 2019 Virtual Machines running in Azure (Server core is not supported)

    다음 중 하나 이상으로 보안이 지정된 Azure AD의 조직 계정을 사용합니다.

    - 암호
    - 비즈니스용 Windows Hello

- **Hybrid Azure AD joined.** 하이브리드 Azure AD 조인 디바이스는 조직이 소유하며 해당 조직에 속한 Active Directory Domain Services 계정으로 로그인됩니다. 이 디바이스는 클라우드와 온-프레미스에 존재합니다.
    - Windows 7, 8.1, or 10
    - Windows Server 2008 or newer

    다음 중 하나 이상으로 보안이 지정된 Azure AD의 조직 계정을 사용합니다.

    - 암호
    - 비즈니스용 Windows Hello

Azure AD의 디바이스는 Microsoft Intune, Microsoft Endpoint Configuration Manager, 그룹 정책(하이브리드 Azure AD 조인), MAM(모바일 애플리케이션 관리) 도구 또는 기타 타사 도구와 같은 MDM(모바일 디바이스 관리) 도구를 사용하여 관리할 수 있습니다.

Azure AD 조인 디바이스 또는 하이브리드 Azure AD 조인 디바이스는 클라우드 리소스뿐 아니라 조직의 온-프레미스 리소스에 SSO를 이용할 수 있습니다. 자세한 내용은 온-프레미스 리소스에 대한 SSO가 Azure AD 조인 디바이스에서 작동하는 방식 문서를 참조하세요.

### Provisioning

디바이스를 Azure AD로 가져오는 작업은 **셀프 서비스 방식**으로 수행하거나 **관리자가 제어하는 프로비저닝 프로세스**로 수행할 수 있습니다.

### License requirements

이 기능을 사용하려면 Azure AD Premium P1 라이선스가 필요합니다.

---

## What is enterprise state roaming?

Windows 10에서는 Azure Active Directory(Azure AD) 사용자가 사용자 설정 및 애플리케이션 설정 데이터를 클라우드와 안전하게 동기화할 수 있습니다. Enterprise State Roaming은 사용자의 모든 Windows 디바이스에 통합된 환경을 제공하고 새 디바이스 구성에 드는 시간을 줄여 줍니다. Enterprise State Roaming은 다음 기능을 제공합니다.

- **기업 데이터와 소비자 데이터 분리** - 조직에서 데이터를 제어할 수 있으며, 소비자 클라우드 계정에 회사 데이터가 섞이거나 엔터프라이즈 클라우드 계정에 기업 데이터가 섞이지 않습니다.

- **보안 강화** - 데이터가 사용자의 Windows 10 디바이스에서 나가기 전에 Azure RMS(Azure Rights Management)를 사용하여 자동으로 암호화되고, 암호화된 상태로 클라우드에 보존됩니다. 설정 이름 및 Windows 앱 이름 같은 네임 스페이스를 제외한 모든 콘텐츠가 암호화된 상태로 클라우드에 보존됩니다.

- **더 나은 관리 및 모니터링** - Azure AD 포털 통합을 통해 조직에서 누가, 어떤 디바이스에서 설정을 동기화할 수 있는지를 제어하고 확인할 수 있습니다.

엔터프라이즈 상태 로밍은 여러 Azure 지역에서 사용할 수 있습니다. 사용할 수 있는 지역 목록 업데이트는 **[Azure Services by Regions](https://azure.microsoft.com/regions/#services)** 페이지에서 확인할 수 있습니다.

> [!NOTE]
> 아직 한국 Region에는 사용 가능하지 않음 (확인: 2021.06.04)
>
> **[Azure Services by Regions](https://azure.microsoft.com/regions/#services)** 페이지에서 확인

---

## Device Type and Features on Azure AD registered or joined

![decision-tree-for-devices-integration]({{ site.url }}/Microsoft365/images/EMS/decision-tree-for-devices-integration.png?raw=true)

| 구분 | AAD Registered | AAD Joined | Hybrid AAD Joined |
|--|--|--|--|
| 정의 | 조직 계정이 디바이스에 로그인하지 않고도 Azure AD에   등록됩니다. | 조직 계정에서 디바이스에 로그인하는 데 필요한 Azure AD에만 조인됩니다. | 조직 계정에서 디바이스에 로그인해야 하는 온-프레미스 AD 및 Azure AD에 조인됩니다. |
| 기본대상 그룹 | 다음 조건에 해당하는 모든 사용자에게 적용됩니다:<br /><ul><li>BYOD(Bring Your Own Device)</li><li>모바일 디바이스</li></ul> | <ul><li>클라우드 전용 및 하이브리드 조직 모두에 적합합니다.</li><li>모바일 디바이스</li></ul> | <ul><li>기존 온-프레미스 AD 인프라를 사용하는 하이브리드 조직에 적합합니다.</li><li>조직의 모든 사용자에게 적용됩니다.</li></ul> |
| 디바이스 소유권 | 사용자 또는 조직 | 조직 | 조직 |
| 운영체제 및 프로비전 | <ul><li>Windows 10 - 설정</li><li>iOS - 회사 포털 또는 Microsoft Authenticator 앱</li><li>Android - 회사 포털 또는 Microsoft Authenticator 앱</li><li>MacOS - 회사 포털</li></ul> | 운영체제<br /><ul><li>Windows 10 Home을 제외한 모든 Windows 10 장치</li><li>Azure에서 실행되는 Windows Server 2019 Virtual Machines(서버 코어는 지원되지 않음)</li></ul>프로비전:<br /><ul><li>셀프 서비스: Windows OOBE 또는 설정</li><li>대량 등록</li><li>Windows Autopilot</li></ul> | <ul><li>Windows 10, Windows Server 2016/2019<ul><li>Azure AD Connect 또는 ADFS 구성을 통한 IT 및 autojoin의 도메인 조인</li><li>Azure AD Connect 또는 ADFS 구성을 통한 Windows Autopilot 및 autojoin의 도메인 조인</li></ul></li><li>Windows 8.1, Windows 7, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 - MSI 필요</li></ul> |
| 디바이스 로그인 옵션 | <ul><li>최종 사용자 로컬 자격 증명</li><li>암호</li><li>Windows Hello</li><li>PIN</li></ul> | 다음을 사용하는 조직 계정:<br /><ul><li>암호</li><li>비즈니스용 Windows Hello</li><li>FIDO2.0 보안 키(미리 보기)</li></ul> | 다음을 사용하는 조직 계정:<br /><ul><li>암호</li><li>Windows Hello</li></ul> |
| 디바이스 관리 | <ul><li>모바일 디바이스 관리(예: Microsoft Intune)</li><li>모바일 애플리케이션 관리</li></ul> | <ul><li>모바일 디바이스 관리(예: Microsoft Intune)</li><li>Microsoft Intune 및 Microsoft Endpoint Configuration Manager를 사용하여 공동 관리</li></ul> | <ul><li>그룹 정책</li><li>Microsoft Intune을 사용하여 Configuration Manager 독립 실행 또는 공동 관리</li></ul> |
| 주요 기능 | <ul><li>클라우드 리소스에 대한 SSO</li><li>Intune에 등록된 경우 조건부 액세스</li><li>앱 보호 정책을 통한 조건부 액세스</li><li>Microsoft Authenticator 앱으로 휴대폰 로그인을 사용하도록 설정</li></ul> | <ul><li>클라우드 및 온-프레미스 리소스 모두에 대한 SSO</li><li>MDM 등록 및 MDM 규정 준수 평가를 통한 조건부 액세스</li><li>잠금 화면에서 셀프 서비스 암호 재설정 및 Windows Hello PIN 재설정</li><li>여러 디바이스에서 Enterprise State Roaming</li></ul> | <ul><li>클라우드 및 온-프레미스 리소스 모두에 대한 SSO</li><li>공동 관리되는 경우 도메인 조인 또는 Intune을 통한 조건부 액세스</li><li>잠금 화면에서 셀프 서비스 암호 재설정 및 Windows Hello PIN 재설정</li><li>여러 디바이스에서 Enterprise State Roaming</li></ul> |
| Device Architecture | ![azure-ad-registered-device]({{ site.url }}/Microsoft365/images/EMS/azure-ad-registered-device.png?raw=true) | ![azure-ad-joined-device]({{ site.url }}/Microsoft365/images/EMS/azure-ad-joined-device.png?raw=true) | ![azure-ad-hybrid-joined-device]({{ site.url }}/Microsoft365/images/EMS/azure-ad-hybrid-joined-device.png?raw=true) |

### Scenario for AAD Registered

조직의 사용자가 홈 PC에서 메일, 보고 시간, 혜택 등록에 대한 도구에 액세스하려고 합니다. 조직에는 Intune 호환 디바이스에서 액세스해야 하는 조건부 액세스 정책을 지원하는 이러한 도구가 있습니다. 사용자가 조직 계정을 추가하고 자신의 홈 PC를 Azure AD에 등록하면 사용자에게 리소스에 대한 액세스 권한을 부여하는 데 필요한 Intune 정책이 적용됩니다.

다른 사용자가 루팅된 개인 Android 휴대폰에서 조직 메일에 액세스하려고 합니다. 회사에서 규정 준수 디바이스가 필요하므로 루팅된 모든 디바이스를 차단하는 Intune 준수 정책을 만들었습니다. 직원이 이 디바이스에서 조직 리소스에 액세스할 수 없습니다.

### Scenario for AAD Joined

Azure AD 가입은 기본적으로 온-프레미스 Windows Server Active Directory 인프라가 없는 조직을 위해 고안되었으나, 다음과 같은 시나리오에서 확실히 사용할 수 있습니다.

- Azure AD 및 Intune 같은 MDM을 사용하여 클라우드 기반 인프라로 전환하려 합니다.
- 온-프레미스 도메인 가입을 사용할 수 없습니다. 예를 들어 제어되는 태블릿 및 휴대폰과 같은 모바일 디바이스가 필요한 경우입니다.
- 사용자가 Azure AD와 통합 된 Microsoft 365 또는 다른 SaaS 앱에 주로 액세스 해야 합니다.
- Active Directory 대신 Azure AD에서 사용자 그룹을 관리하고자 합니다. 예를 들어 이 시나리오는 계절 노동자, 계약자 또는 학생에게 적용할 수 있습니다.
- 제한된 온-프레미스 인프라를 사용하는 원격 지사에서 작업자에게 조인 기능을 제공하려고 합니다.

Azure AD 가입 디바이스의 목표는 단순화하는 것입니다.

- 회사 소유 디바이스의 Windows 배포
- 모든 Windows 디바이스에서 조직의 앱 및 리소스에 액세스
- 회사 소유 디바이스의 클라우드 기반 관리
- 사용자가 Azure AD 또는 동기화된 Active Directory 회사 또는 학교 계정을 사용하여 디바이스에 로그인

다음 방법 중 하나를 사용하여 Azure AD Join을 배포할 수 있습니다.

- [Windows Autopilot](https://learn.microsoft.com/en-us/windows/deployment/windows-autopilot/windows-10-autopilot)
- [Bulk deployment](https://learn.microsoft.com/en-us/intune/windows-bulk-enroll)
- [Self-service experience](https://learn.microsoft.com/en-us/azure/active-directory/devices/azuread-joined-devices-frx)

### Scenario for Hybrid AAD Joined

다음과 같은 경우 Azure AD 하이브리드 조인된 디바이스를 사용합니다.

- Active Directory 컴퓨터 인증을 사용하는 디바이스에 Win32 앱을 배포했습니다.
- 그룹 정책을 계속 사용하여 디바이스 구성을 관리하려고 합니다.
- 기존 이미징 솔루션을 계속 사용하여 디바이스를 배포하고 구성하려고 합니다.
- Windows 10 외에 하위 수준 Windows 7과 8.1 디바이스를 지원해야 합니다.

---

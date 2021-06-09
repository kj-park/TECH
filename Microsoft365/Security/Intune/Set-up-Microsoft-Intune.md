---
title: Set up Microsoft Intune
filename: Microsoft365\Security\Intune\Set-up-Microsoft-Intune.md
ms.ms.date: 06/08/2021
---

# Set up Microsoft Intune

아래의 설정 단계는 Intune을 이용하여 MDM(모바일 디바이스 관리)을 사용하도록 할 수 있습니다. 사용자에게 회사 리소스에 대한 액세스 권한을 부여하거나 해당 디바이스에서 설정을 관리할 수 있으려면 먼저 디바이스가 관리되어야 합니다.

Microsoft Endpoint Configuration Manager를 사용하여 컴퓨터와 서버를 관리하는 경우 [cloud-attach Configuration Manager with co-management](https://docs.microsoft.com/en-us/configmgr/comanage/overview) 를 참조하세요.

> [!TIP]
> 적격 플랜을 통해 Intune에 대한 라이선스를 150개 이상 구매하는 경우 FastTrack 센터 혜택 을 사용할 수 있습니다. 이 서비스를 통해 Microsoft 전문가는 사용자와 협력하여 Intune에 맞게 사용자 환경을 준비합니다. [FastTrack Center Benefit for Enterprise Mobility + Security (EMS)](https://docs.microsoft.com/en-us/enterprise-mobility-security/Solutions/enterprise-mobility-fasttrack-program)을 참조하세요.

1. **[Supported configurations](https://docs.microsoft.com/en-us/mem/intune/fundamentals/supported-devices-browsers)** - 시작하기 전에 알아야 하는 정보입니다. 지원되는 구성 및 네트워킹 요구 사항이 여기에 포함됩니다.

1. **[Sign in to Intune](https://docs.microsoft.com/en-us/mem/intune/fundamentals/account-sign-up)** - 평가판 구독에 로그인하거나 새 Intune 구독을 만듭니다.

1. **[Configure domain name](https://docs.microsoft.com/en-us/mem/intune/fundamentals/custom-domain-name-configure)** - 회사의 도메인 이름이 Intune과 연결되도록 DNS 등록을 설정합니다. 이렇게 하면 Intune에 연결하고 리소스를 사용할 때 사용자에게 친숙한 도메인이 제공됩니다.

1. **[Add users](https://docs.microsoft.com/en-us/mem/intune/fundamentals/users-add) and [groups](https://docs.microsoft.com/en-us/mem/intune/fundamentals/groups-add)** - 사용자 및 그룹을 추가하거나, Active Directory를 연결하여 Intune과 동기화합니다. 예를 들어 디바이스가 “사용자가 없는” 키오스크 디바이스가 아닌 한 필수입니다. 그룹은 앱, 설정 및 기타 리소스를 할당하는 데 사용됩니다.

1. **[Assign licenses](https://docs.microsoft.com/en-us/mem/intune/fundamentals/licenses-assign)** - 사용자에게 Intune 사용 권한을 부여합니다. 각 사용자 또는 사용자가 없는 디바이스가 서비스에 액세스하려면 Intune 라이선스가 필요합니다.

1. **[Set the MDM authority](https://docs.microsoft.com/en-us/mem/intune/fundamentals/mdm-authority-set)** - 사용자 및 디바이스 그룹을 사용하여 관리 작업을 간소화합니다. 그룹은 앱, 설정 및 기타 리소스를 할당하는 데 사용됩니다.

1. **[Add apps](https://docs.microsoft.com/en-us/mem/intune/apps/apps-add)** - 앱을 그룹에 할당하여 자동으로 또는 필요에 따라 설치할 수 있습니다.

1. **[Configure devices](https://docs.microsoft.com/en-us/mem/intune/configuration/device-profiles)** - 디바이스 설정을 관리하는 프로필을 설정합니다. 디바이스 프로필은 메일, VPN, Wi-Fi 및 디바이스 기능에 대한 설정을 미리 구성할 수 있습니다. 디바이스 프로필은 디바이스 및 데이터 보호를 위해 디바이스를 제한할 수도 있습니다.

1. **[Customize Company Portal](https://docs.microsoft.com/en-us/mem/intune/apps/company-portal-app)** - 사용자가 디바이스를 등록하고 앱을 설치하는 데 사용하는 Intune 회사 포털을 사용자 지정합니다. 이러한 설정은 회사 포털 앱과 Intune 회사 포털 웹 사이트 둘 다에 표시됩니다.

1. **[Enable device enrollment](https://docs.microsoft.com/en-us/mem/intune/enrollment/device-enrollment)** - MDM 기관을 설정하고 특정 플랫폼을 사용하도록 설정하여 iOS/iPadOS, Windows, Android 및 Mac 디바이스의 Intune 관리를 사용하도록 설정합니다.

1. **[Configure app policies](https://docs.microsoft.com/en-us/mem/intune/apps/app-protection-policy)** - Microsoft Intune의 앱 보호 정책에 따라 특정 설정을 지정합니다.

---

## Set up Windows enrollment

---

## Set up Android enrollment

---

## Set up iOS or iPadOS enrollment

---

## Set up macOS enrollment

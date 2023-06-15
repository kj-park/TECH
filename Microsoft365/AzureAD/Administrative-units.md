---
layout: default
title: [Azure AD의 Administrative Units]
filename: Microsoft365/AzureAD/Administrative-units.md
ms.date: 2023.06.15
---

# Azure AD의 Administrative Units

Administrative Units에는 사용자, 그룹 또는 디바이스만 포함될 수 있습니다.

Administrative Units는 사용자가 정의하는 조직의 모든 부분에 대한 역할의 권한을 제한합니다. 예를 들어 관리 단위를 사용하여 헬프데스크 관리자 역할을 지역 지원 전문가에게 위임하면 지원하는 지역에서만 사용자를 관리할 수 있습니다.

## Restricted management administrative units (Preview)

Restricted management administrative units을 사용하면 지정한 특정 관리자 집합 이외의 다른 사람이 액세스하지 못하도록 테넌트의 특정 개체를 보호할 수 있습니다. 이를 통해 관리자로부터 테넌트 수준 역할 할당을 제거하지 않고도 보안 또는 규정 준수 요구 사항을 충족할 수 있습니다.

다음은 제한된 관리 관리 단위를 사용하여 테넌트에서 액세스를 관리하는 데 도움이 되는 몇 가지 이유입니다.

- **암호를 재설정하거나 BitLocker 복구 키에 액세스할 수 있는 기술 지원팀 관리자로부터 높은 보안 수준 임원 계정 및 해당 디바이스를 보호하려고 합니다.** 제한된 관리 관리 단위에 높은 보안 수준 사용자 계정을 추가하고 필요한 경우 암호를 재설정하고 BitLocker 복구 키에 액세스할 수 있는 신뢰할 수 있는 특정 관리자 집합을 사용하도록 설정할 수 있습니다.

- **특정 국가의 관리자만 특정 리소스를 관리할 수 있도록 규정 준수 제어를 구현하고 있습니다.** 제한된 관리 관리 단위에 해당 리소스를 추가하고 로컬 관리자를 할당하여 해당 개체를 관리할 수 있습니다. 전역 관리자도 제한된 관리 관리 단위(감사 가능한 이벤트)로 범위가 지정된 역할에 명시적으로 할당하지 않는 한 개체를 수정할 수 없습니다.

- **조직에서 중요한 애플리케이션에 대한 액세스를 제어하여 할당한 특정 관리자만 관리자만 애플리케이션에 액세스할 수 있는 사용자를 제어할 수 있도록 허용하려 합니다.**

## Administrative Units의 limits and restrictions

- 하나의 Azure AD resource는 최대 30 administrative units의 구성원일 수 있습니다.
- 하나의 tenant에는 최대 30개의 restricted management administrative units을 생성할 수 있습니다.
- Azure AD 조직에서 최대 5,000 dynamic groups과 dynamic administrative units을 조합하여 가질 수 있습니다.







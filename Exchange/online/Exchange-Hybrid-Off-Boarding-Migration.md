---
title: Exchange Hybrid Off-Boarding Migration
filename: Exchange\online\Exchange-Hybrid-Off-Boarding-Migration.md
ms.date: 2012.06.15
---

# Exchange Hybrid Off-Boarding Migration

Exchange Online 환경에서 Migration은 환경에 따라  여러 가지 사용 가능한 유형의 migration이 있습니다.

- Cutover Migration 또는 Express Migration
- Staged Migration
- Hybrid Migration (On-Boarding 및 Off-Boarding Migration)

On-Premises의 Exchange 서버가 Exchange 2010 이상 (Exchange 2013 이상 권장) 환경에서는 쉽게 Exchange Online과 On-Premises 간의 사용자 메일 사서함 마이그레이션(Hybrid Migration)이 가능합니다.

이 On-Boarding 및 Off-Boarding 마이그레이션은 사용자의 변화관리를 최소화 할 수 있는 마이그레이션 방법입니다.

- On-Boarding Migration. On-Premises Exchange에서 Exchange Online로 사용자 메일 사서함을 마이그레이션합니다.
- Off-Boarding Migration. Exchange Online에서 On-Premises Exchange 로 사용자 메일 사서함을 마이그레이션합니다.

![exchange-online-migration-types](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-online-migration-types.png?raw=true)

아래에 On-Boarding 및 Off-Boarding 마이그레이션 중 Off-Boarding 마이그레이션 가이드를 설명합니다.

Off-Boarding 마이그레이션을 위하여 고려되어야 할 설정은 아래와 같습니다.

- **Microsoft 365 관리 계정.** Exchange Online 관리자 권한이 있는 Microsoft 365 tenant 관리자 계정으로 로그인해야 합니다.
- **On-Premises Exchange Migration Endpoints (MRS Proxy).** Exchange Hybrid wizard 구성 시 설정된 Exchange Migration Endpoints에 접근이 가능해야 합니다.
- **Off-Boarding 마이그레이션 대상 사용자.** 사용자 메일 사서함을 수동으로 선택 또는 csv 파일을 통해 bulk로 선택할 수 있습니다.
- **Target delivery domain.** On-Boarding 및 Off-Boarding 마이그레이션 방향에 따라 달라집니다. Off-Boarding의 경우 On-Premises Exchange 조직의 기본 Accepted Domain인 경우가 대부분입니다.
- **Archive Mailbox 마이그레이션 옵션.** 사용자 메일 사서함의 archive mailbox가 활성화된 경우 archive mailbox에 대한 마이그레이션 옵션을 선택해야 합니다.
- **On-Premises Exchange Target Mailbox database.** Off-Boarding 마이그레이션의 경우 On-Premises Exchange의 Target Mailbox database를 지정해야 합니다.
- **마이그레이션 시작 및 완료 옵션.** 마이그레이션의 시작 및 완료에 대한 시간 및 시기를 결정해야 합니다.

## Exchange Hybrid Off-Boarding Migration Step

1. Exchange Online 관리자 권한이 있는 Microsoft 365 tenant 관리자 계정으로 Microsoft 365 admin center에 로그인

    **https://admin.microsoft.com**

    ![exchange-off-boarding-migration-001](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-001.png?raw=true)

    왼쪽의 네비게이션 메뉴의 Show all을 선택하여 모든  admin center 메뉴들이 보이게 합니다.를 보이게 하고 Exchange Admin  메뉴를 선택합니다.

1. Exchange 메뉴를 선택하여 Exchange Admin 센터를 실행합니다.

    ![exchange-off-boarding-migration-002](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-002.png?raw=true)

    Exchange Admin Center에서는 On-Boarding Migration만 지원합니다. **Classic Exchange Admin Center**에서 On-Boarding 및 Off-Boarding Migration 수행이 가능합니다.

1. Off-Boarding Migration을 수행하기 위해서는 **Classic Exchange Admin Center**을 선택하여 실행합니다. 

    ![exchange-off-boarding-migration-003](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-003.png?raw=true)

1. **Classic Exchange Admin Center**에서 **`recipients` **메뉴를 선택합니다.

    ![exchange-off-boarding-migration-004](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-004.png?raw=true)

1. **`recipients` **메뉴에서 **`migration`** 메뉴를 선택합니다.

    ![exchange-off-boarding-migration-005](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-005.png?raw=true)

1. **`+`** 메뉴에서 **`Migration from Exchange Online`** 메뉴를 선택합니다.

    ![exchange-off-boarding-migration-006](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-006.png?raw=true)

    'Migration to Exchange Online`은 On-Boarding Migration을 의미합니다.

1. Off-Boarding 마이그레이션 대상 사용자를 선택합니다.

    ![exchange-off-boarding-migration-007](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-007.png?raw=true)

    Off-Boarding 마이그레이션 대상 사용자를 선택은 `Select the users that you want to move` 메뉴를 통해 수동으로 선택하거나, `Specify the users with a CSV file` 메뉴를 통해 bulk select할 수 있습니다.

1. `Select the users that you want to move` 메뉴를 통해 수동으로 선택합니다.

    ![exchange-off-boarding-migration-008](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-008.png?raw=true)

    이전 화면에서 `+` 메뉴를 통해 Exchange Online의 사용자 사서함을 선택할 수 있습니다. 여러 사용자 선택이 가능합니다.

    원하는 사용자 메일 사서함을 선택하면 `add` 후 `OK`를 선택합니다.

1. 대상 사용자 메일 사서함이 선택되었는지 확인 후 `Next`를 선택합니다.

    ![exchange-off-boarding-migration-009](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-009.png?raw=true)

1. Migration Endpoint 정보가 올바른 지 확인 후 `Next`를 선택합니다.

    ![exchange-off-boarding-migration-010](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-010.png?raw=true)

    Migration Endpoints는 Exchange Hybrid Wizard를 실행 시 설정되어집니다.

1. 위에서 언급한 Migration하기 위해 결정되어진 설정들을 기반으로 Off-Boarding Batch 의 이름과 Target delivery domain 이름, Archive 사서함 마이그레이션 옵션, Target Database 이름은 입력 후 `Next`를 선택합니다.

    ![exchange-off-boarding-migration-011](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-011.png?raw=true)

1. 마이그레이션의 시작 및 완료 시간이나 시기를 선택하고 `New`를 선택합니다.

    ![exchange-off-boarding-migration-012](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-012.png?raw=true)

1. Migration Batch가 정상 생성됨을 확인합니다.

    ![exchange-off-boarding-migration-013](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-013.png?raw=true)

1. `recipients` 의 `migration` 메뉴에서 생성한 마이그레이션의 상태를 확인할 수 있습니다.

    ![exchange-off-boarding-migration-014](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-014.png?raw=true)

1. `View details` 메뉴를 통해 개별 사용자 메일 사서함의 마이그레이션 상태를 확인하실 수 있습니다.

    ![exchange-off-boarding-migration-015](https://github.com/kj-park/tech/blob/main/Exchange/.media/exchange-off-boarding-migration-015.png?raw=true)

---

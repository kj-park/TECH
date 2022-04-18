---
title: Migrating your IMAP mailboxes to Microsoft 365
filename: Exchange\ExchangeOnline\Migrating-your-IMAP-mailboxes-to-Microsoft-365.md
ms.date: 2022.04.14
---

# Migrating your IMAP mailboxes to Microsoft 365

## 고려할 사항

- Microsoft의 데이터 마이그레이션 도구는 현재 MRM(메시징 레코드 관리) 또는 보관 정책을 적용하는 도구를 인식하지 못합니다. 따라서 이러한 정책에 의해 삭제되거나 보관함으로 이동된 모든 메시지는 마이그레이션 프로세스에서 이러한 항목을 "누락"으로 표시하게 됩니다. 그 결과 실제 데이터 손실이 아닌 데이터 손실로 인식될 수 있습니다. 따라서 콘텐츠 확인 검사 중에 실제 데이터 손실을 식별하기가 훨씬 더 어려워질 수 있습니다.

    따라서 사서함으로의 데이터 마이그레이션을 시도하기 전에 모든 MRM 및 보관 정책을 비활성화하는 것이 좋습니다.

- 사용자의 받은 편지함 또는 기타 메일 폴더의 항목만 마이그레이션할 수 있습니다. 이 유형의 마이그레이션을 통해서는 연락처, 일정 항목 또는 작업이 마이그레이션되지 않습니다.

- 사용자의 사서함에서 최대 500,000개의 항목을 마이그레이션할 수 있습니다(전자 메일은 최신 항목부터 시간순으로 마이그레이션됨).

- 마이그레이션할 수 있는 최대 전자 메일 크기는 35MB입니다.

- 원본 전자 메일 시스템에 대한 연결을 제한하고 있는 경우 마이그레이션 성능을 높이기 위해 한도를 늘리는 것이 좋습니다. 일반적인 연결 제한에는 클라이언트/서버 총 연결 수, 사용자별 연결 수, 서버 또는 방화벽의 IP 주소 연결 수가 포함됩니다.







![mig-from-imap-to-exo](https://github.com/kj-park/tech/blob/main/Exchange/.media/mig-from-imap-to-exo.png?raw=true)


> [!INFO]  
> [What you need to know about migrating your IMAP mailboxes to Microsoft 365 or Office 365](https://docs.microsoft.com/en-us/exchange/mailbox-migration/migrating-imap-mailboxes/migrating-imap-mailboxes)


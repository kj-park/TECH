---
title: Importing PST file to Microsoft 365
filename: Exchange\Online\Importing-PST-file-to-Microsoft-365
ms.date: 2022.04.13
---

# Importing PST file to Microsoft 365

> [!NOTE]  
> 일반 사용자가 자신의 사서함을 PST로 Import하려면 아래의 링크를 참조하세요.  
> [Import email, contacts, and calendar from an Outlook .pst file](https://go.microsoft.com/fwlink/p/?LinkID=785075)

[Microsoft 365 Compliance Center](https://go.microsoft.com/fwlink/p/?linkid=2077149)에서 Import 서비스를 사용할 수 있습니다.
PST를 Exchange Online 사서함으로 빠르게 bulk import할 수 있습니다.

Microsoft 365로 PST 파일을 Import 하는 두 가지 방식이 있습니다:

- **Network upload.** 임시 Azure Storage 위치로 network을 통해 PST 파일들을 업로드하고 Microsoft 365 Import 서비스를 통해 사서함으로 PST 데이터를 import합니다.

- **Drive Shipping.** BitLocker로 암호화된 hard drive에 PST 파일들을 복사하고 물리적으로 Microsoft에 물리적으로 배송합니다. Microsoft는 hard drive를 받아 임시 Azure Storage위치에 업로드합니다. 그리고, Microsoft 365 Import 서비스를 통해 사서함으로 PST 데이터를 import합니다.

> [!INFO]  
> [Learn about importing your organization's PST files](https://docs.microsoft.com/en-us/microsoft-365/compliance/importing-pst-files-to-office-365)

## How Importing PST files works

![Importing-PST-files-to-M365-001](https://github.com/kj-park/tech/blob/main/Exchange/.media/Importing-PST-files-to-M365-001?raw=true)

1. PST Import 도구와 Azure Storage 액세스를 위한 Key 다운로드

1. PST 파일 업로드

1. PST Importing Mapping 파일 생성

1. PST Import Job 생성

1. Import될 PST 데이터 Filter

1. PST Import Job 시작

아래 그림은 **Network Upload**와 **Drive Shipping** 방법 전체에 대하여 어떻게 PST 파일 Importing이 동작하는지를 보여줍니다.

![import-pst-to-exo](https://github.com/kj-park/tech/blob/main/Exchange/.media/import-pst-to-exo.png?raw=true)




















---


## migrating your IMAP mailboxes to Microsoft 365

![mig-from-imap-to-exo](https://github.com/kj-park/tech/blob/main/Exchange/.media/mig-from-imap-to-exo.png?raw=true)


> [!INFO]  
> [What you need to know about migrating your IMAP mailboxes to Microsoft 365 or Office 365](https://docs.microsoft.com/en-us/exchange/mailbox-migration/migrating-imap-mailboxes/migrating-imap-mailboxes)


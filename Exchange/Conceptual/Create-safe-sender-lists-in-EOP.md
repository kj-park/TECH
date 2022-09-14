---
title: Create safe sender lists in EOP
filename: Exchange\Conceptual\Create-safe-sender-lists-in-EOP.md
ms.date: 2022.09.14
---

# Create safe sender lists in EOP

EOP는 여러 가지 방법으로 신뢰하는 senders로 부터 사용자들이 메일을 받을 수 있게 합니다.

이러한 Safe Sender Lists는 가장 권장되는 것부터 가장 적게 권장되는 순서대로 다음 목록에 설명되어 있습니다.

1. Mail Flow Rules
1. Outlook Safe Senders
1. IP Allow List (**connection filtering**)
1. Allowed sender lists or allowed domain lists (**anti-spam policies**)

Mail Flow Rule은 가장 유연하게 올바른 메시지만 허용되게 합니다.  Anti-Spam Policies에 정의된 허용된 sender 및 domain lists는 sender의 email domain은 쉽게 spoofed될 수 있기에  IP Allow Lists 보다 안전하지 않습니다. 하지만 IP Allow List 또한 위험은 존재합니다. IP address에서 받은 any domain의 email들이 spam filtering에서 bypass되기 때문입니다.

Safe Sender Lists를 사용하는 경우 주의 깊게 모든 exception들을 모니터링하여야 합니다.

Safe Sender Lists는 false positives (정상의 메일이 bad로 표시) 에 유용하지만, 가능하면 Safe Sender Lists를 임시 방편으로 사용하는 것을 권장드립니다.  false positives는 Microsoft에 messages 및 files을 지속적으로 보내어 개선할 수 있습니다.

> [!NOTE] 
> [Report messages and files to Microsoft](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/report-junk-email-messages-to-microsoft?view=o365-worldwide)

도메인이 인증되지 않은 이메일을 보내도록 허용하지만(스푸핑 방지 보호 우회) 스팸 방지 및 기타 보호를 우회하지 않으려면 [spoof intelligence insight](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/learn-about-spoof-intelligence?view=o365-worldwide) 및 [Tenant Allow/Block List](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/manage-tenant-allow-block-list?view=o365-worldwide)을 사용할 수 있습니다.

---

## Use mail flow rules (Recommended)



---

## Use Outlook Safe Senders

---

## Use the IP Allow List (connection filtering)


---

## Use allowed sender lists or allowed domain lists (anti-spam policies)

---

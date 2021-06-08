---
title: How to use Sender Policy Framework (SPF) to prevent spoofing
filename: Exchange\Conceptual\Sender-Policy-Framework.md
ms.date: 2012.03.30
---

# How to use Sender Policy Framework (SPF) to prevent spoofing

SPF TXT record는 email message가 어디서 부터 보냈는지 domain name에 대한 검증을 통하여 spoofing 및 phishing 을 방지할 수 있게 도와주는 DNS record 입니다.

Domain 관리자는 SPF 정보를 DNS의 TXT record에 publish 합니다.  
SPF 정보는 권한이 부여된 outbound mail 서버들을 식별합니다.

## SPF basics: 사용자 지정 도메인에서 보낼 수 있는 IP address

SPF 규칙에 대한 기본 구분은 아래와 같습니다:

`v=spf1 ip4:192.0.2.0/24 ip4:198.51.100.123 a -all`

`v=` defines the version of SPF used
'

| Mechanism | Description |
|--|--|
| ALL |	Matches always; used for a default result like -all for all IPs not matched by prior mechanisms. |
| A | If the domain name has an address record (A or AAAA) that can be resolved to the sender's address, it will match. |
| IP4 | If the sender is in a given IPv4 address range, match. |
| IP6 | If the sender is in a given IPv6 address range, match. |
| MX | If the domain name has an MX record resolving to the sender's address, it will match (i.e. the mail comes from one of the domain's incoming mail servers). |
| PTR | If the domain name (PTR record) for the client's address is in the given domain and that domain name resolves to the client's address (forward-confirmed reverse DNS), match. This mechanism is discouraged and should be avoided, if possible.[13] |
| EXISTS | If the given domain name resolves to any address, match (no matter the address it resolves to). This is rarely used. Along with the SPF macro language it offers more complex matches like DNSBL-queries. |
| INCLUDE | References the policy of anot|her domain. If that domain's policy passes, this mechanism passes. However, if the included policy fails, processing continues. To fully delegate to another domain's policy, the redirect extension must be used. |


---
layout: default
title: [Configure Microsoft 365 Hybrid Infra]
filename: Microsoft365/Hybrid/Configure-Microsoft-365-Hybrid-Infra.md
ms.date: 2023.05.29
---

# Configure Microsoft 365 Hybrid Infra

On-Premise 환경의 Active Directory 및 Exchange 환경의 고객이 Microsoft 365의 Cloud SaaS 서비스로 전환하는 과정에 대하여 시나리오 기반으로 구성 과정을 설명합니다.

특히, Exchange Web Services에 대한 Proxy로 Entra Application Proxy로 구성합니다.

또한, Exchange Hybrid 구성에 HMA (Hybrid Modern Authentication)를 구성하여 모든 Clients 종류의 액세스에 Modern Authentication으로 구성합니다.

## Hybrid Infra 시나리오

- 기존 On-Premise 환경
    - Active Directory Single Forest Single Domain
    - Exchange 2019 CU14 Mailbox Server
    - Exchange 2019 CU14 Edge Transport Server

- To-Be Hybrid 인프라 구성
    ![entra-application-proxy-hma](images\entra-application-proxy-hma.png)

    - NEW: Entra Connect Server
    - NEW: Entra Private Network Connector

[<i class="fa fa-chevron-up" aria-hidden="true"></i> Top](#)

---

## Hybrid Identity 및 Exchange Hybrid Infra 구성요소

- [Active Directory](#active-directory)
- Exchange Mailbox Server
    - Hybrid Modern Authentication (Outlook)
- Exchange Edge Transport Server
- Microsoft 365
    - Custom Domain
    - Network Connectivity for Hybrid Infra 
- Entra Connect Sync Server
- Entra Application Proxy
    - Entra Private Network Connector
    - Entra Enterprise Application with Application Proxy
    - MRS Proxy Endpoint
- Exchange Hybrid
    - On-Premise Exchange Configuration
    - Exchange Online Configuration
- Clients
    - Outlook Desktop App
    - Outlook On the Web (OWA) and ECP
    - Mobile Outlook

[<i class="fa fa-chevron-up" aria-hidden="true"></i> Top](#)

---

## Active Directory

On-Premise Exchange의 마지막 버전인 Exchange 2019이기에 이를 기준으로 Active Directory Requirements를 명시합니다.

- Domain Controller: Windows Server 2012 R2 이상 권장
- AD Forest Level: Windows Server 2016 이상 권장

> [!NOTE]
>
> Exchange Server 2019의 지원 Lifecycle은 아래와 같습니다:
> - Mainstream End Date: Jan 9, 2024
> - Extended End Date: Oct 14, 2025
>
> 참고: Extended Support가 완료되면 Non-Security updates 와 DCR 요청을 할 수 없습니다.
>
> 참고: Security updates의 경우 Extended Security Update Program에 의하여 가능할 수 있습니다.


[<i class="fa fa-chevron-up" aria-hidden="true"></i> Top](#)

---

## Entra Application Proxy

On-Premise Exchange의 Web Services들에 대하여 Entra Application Proxy로 Reverse-Proxy 구성에 대한 전체 구성도는 아래와 같습니다:

![entra-application-proxy](images\entra-application-proxy.png)

### Entra Enterprise Application

- Type: On-Premise Application (Application Proxy)
- Name: EWS - Exchange
- Attributes:
    - 사용자가 로그인할 수 있습니까? - 예
    - 할당이 필요합니까? - 아니요
    - 사용자가 볼 수 있습니까? - 예
- Application Proxy Settings
    - Internal URL: 
    - External URL: 
    - 사전 인증: 통과
    - 컨텍터 그룹: EWS Connector 0 아시아
    - SSL 인증서: CN:exchange.tdg-ai.com




### Private Network Connector

Service Limits and Restrictions

- A maximum of 500 transactions* per second per Application Proxy application.
- A maximum of 750 transactions per second for the Microsoft Entra organization.

*A transaction is defined as a single HTTP request and response for a unique resource. When clients are throttled, they receive a 429 response (too many requests). Transaction metrics are collected on each connector and can be monitored using performance counters under the object name Microsoft Entra private network connector.

> [!NOTE]
>
> [Microsoft Entra service limits and restrictions](https://learn.microsoft.com/en-us/entra/identity/users/directory-service-limits-restrictions)

[Private Network Connector Capacity Planning](https://learn.microsoft.com/en-us/entra/global-secure-access/concept-connectors#capacity-planning)

| Cores | RAM | Expected Latency (MS)-P99 | Max TPS |
| --- | --- | --- | --- |
| 2 | 8 | 325 | 586 |
| 4 | 16 | 320 | 1150 |
| 8 | 32 | 270 | 1190 |
| 16 | 64 | 245 | 1200 |




---
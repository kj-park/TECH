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

- Active Directory
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


- Domain Controller: Windows Server 2012 R2 이상
- AD Forest Level: Windows Server 2016 이상

> [!NOTE]
>
> Exchange Server 2019의 지원 Lifecycle은 아래와 같습니다:
> - Mainstream End Date: Jan 9, 2024
> - Extended End Date: Oct 14, 2025
>
> 참고: Extended Support가 완료되면 Non-Security updates 와 DCR 요청을 할 수 없습니다.
>
> 참고: Security updates의 경우 Extended Security Update Program에 의하여 가능할 수 있습니다.


<i class="fa fa-check-square" aria-hidden="true"></i>

<i class="fa-solid fa-clipboard-check"></i>

---
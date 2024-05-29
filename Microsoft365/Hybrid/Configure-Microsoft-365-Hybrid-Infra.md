---
layout: default
title: [Configure Microsoft 365 Hybrid Infra]
filename: Microsoft365/Hybrid/Configure-Microsoft-365-Hybrid-Infra.md
ms.date: 2023.05.29
---

# Configure Microsoft 365 Hybrid Infra

On-Premise 환경의 Active Directory 및 Exchange 환경의 고객이 Microsoft 365의 Cloud SaaS 서비스로 전환하는 과정에 대하여 시나리오 기반으로 구성 과정을 설명합니다.

특히, Exchange Web Services에 대한 Proxy로 Entra Application Proxy로 구성합니다.

또한, Exchange Hybrid 구성에 HMA (Hybrd Modern Authentication)를 구성하여 모든 Clients 종류의 액세스에 Modern Authentication으로 구성합니다.

## Hybrid Infra 시나리오

- 기존 On-Premise 환경
    - Active Directory Single Forest Single Domain
    - Exchange 2019 CU14 Mailbox Server
    - Exchange 2019 CU14 Edge Transport Server

- To-Be Hybrid 인프라 구성
    ![entra-application-proxy-hma](images\entra-application-proxy-hma.png)

    - NEW: Entra Connect Server
    - NEW: Entra Private Network Connector

## Hybrid Infra 구성요소

- Active Directory
- Exchange Mailbox Server
    - Hybrid Modern Authentication (Outlook)
- Exchange Edge Transport Server
- Microsoft 365
    - Custom Domain
    - Network Connectivity for Hybrid Infra 
- Entra Connect Server
- Entra Application Proxy
    - Entra Private Network Connector
    - Entra Enterprise Application with Application Proxy
- Exchange Hybrid
    - Connectors
    - MRS Proxy Endpoint
    - On-Premise Exchange Configuration
    - Exchange Online Configuration
- Clients
    - Outlook Desktop App
    - Outlook On the Web (OWA) and ECP
    - Mobile Outlook

---

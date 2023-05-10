---
title: Understanding the Transport Pipeline
filename: Exchange\Conceptual\Understanding-the-Transport-pipeline.md
ms.date: 2012.04.01
---

# Understanding the Transport Pipeline

Transport Pipeline은 아래의 서비스로 구성되어 있습니다.

- Front End Transport service on Mailbox servers

- Transport service on Mailbox servers

- Mailbox Transport service on Mailbox servers

    - Mailbox Transport Submission service

    - Mailbox Transport Submission service

- Transport service on Edge Transport servers

아래의 diagram은 Exchange Transport Pipeline의 구성요소간의 관계를 설명합니다.

![Transport Pipeline Overview](./../images/transport-pipeline-overview.png)

## Exchange Mail flow without Edge Transport Server

![inbound mail flow without edge](./../images/inbound-mail-flow-without-edge.png)

![outbound mail flow without edge](./../images/outbound-mail-flow-without-edge.png)


## Exchange Mail flow with Edge Transport Server

![inbound mail flow with edge](./../images/inbound-mail-flow-with-edge.png)

![outbound mail flow with edge](./../images/outbound-mail-flow-with-edge.png)


## Understanding the Transport service on Mailbox servers

## Understanding the Transport service on Edge Transport servers


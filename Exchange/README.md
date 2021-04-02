---
title: Exchange
filename: Exchange/README.md
date: 2012.03.30
---

# Exchange

On-Premier 기반의 Exchange Server를 통해 Messaging 시스템을 구축 및 설정, 관리에 대한 기술들을 명시합니다.
엔지니어 관점에서 steps들을 설명하며 연관 기술에 대하여도 함께 설명합니다. 또한 각 내용들과 Powershell 기반 구성이 가능한 부분이 있다면 script도 같이 공유하였습니다.

> [!NOTE] 계속적으로 업데이트 예정입니다.

## Deploy Exchange Server

On-Premier 기반의 Exchange Server 구축에 대하여 기술합니다.

Exchange 2013/2016/2019 서버를 구축하는 과정들에 대하여 기술합니다.

### Exchange 2013 Server

- [Deploy Exchange 2013](2013/Deploy-Exchange-2013)

### Exchange 2016 Server

### Exchange 2019 Server


## Configure Exchange Server

Exchange 각 버전 별 설치 후 mail flow 및 client access, High Availability 구성에 대하여 설명합니다. 버전과 크게 다르지 않고 유사하기에 통합하여 명시하였습니다.

- [Configure mail flow and client access for Exchange Server](Configure-mail-flow-and-client-access-for-Exchange-Server)

    - **SCRIPT**: [Configure-ExchangeMailFlowClientAccess.ps1](Configure-ExchangeMailFlowClientAccess.ps1)

- [Configure High availability](Configure-High-availability)

    - **SCRIPT**: [Configure-Exchange-DAG.ps1](Configure-Exchange-DAG.ps1)


## Manage Exchange Server

Exchange 인프라를 관리에 필요한 주제들에 대하여 기술합니다.

- [Maintenance or Update Exchange DAG members](Maintenance-or-Update-DAG-Members)

## TODO List

- Configure High availability
- Exchange Hybrid Configuration
- Integration with SharePoint and Skype
- etc
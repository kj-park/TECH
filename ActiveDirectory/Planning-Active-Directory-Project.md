---
title: Planning Active Directory Project
filename: ActiveDirectory\Planning-Active-Directory-Project.md
ms.date: 2021.04.05
---

# Planning Active Directory Project

## Defining Project-Specific Roles

- **Executive Sponsor.**  Active Directory같은 인프라를 design하는 것은 조직 전반에 넓게 영향을 미칠 수 있습니다. 이런 이유로, deploy의 비즈니스 가치를 이해하고 project의 수행 단계에서 조직 내의 갈등을 해결하는데 도움을 줄 수 있는 Executive Sponsor를 project에 포함하는 것은 중요합니다.
- **Project Architect.**  Active Directory design 및 deploy의 의사 결정 과정을 제어하며 project 전 과정에 전문적인 기술을 제공합니다. 
- **Project Manager.**  조직의 IT 그룹 운영 정책에 친숙하며, project를 수행이 원활히 진행 될 수 있게 도와야 합니다. Project의 수행 및 일정, 예산에 대하여 총괄하여 관리합니다.

### Project Architect

Active Directory Project Architect는 아래와 같은 역할을 수행합니다:

- Active Directory 디자인 전체에 대하여 책임을 가지고 있습니다.
- 중요 디자인 의사 결정의 근거 또는 이유에 대하여 기록하고 이해하고 있습니다.
- 조직의 business need를 만족하게 디자인해야 합니다.
- AD 통합 Application의 필요성에 대하여 이해합니다.

### Project Manager

Project manager는 기업의 구성원과 기술 관리 그룹과의 협력을 촉진하는 역할을 수행합니다. 디자인에서 배포까지 계속적으로 전체 프로젝트를 감독하며, 프로젝트가 계획된 일정과 예산에서 진행되는지를 확인합니다.

- 일정이나 예산과 같은 기본적인 프로젝트 계획을 제공합니다.
- Active Directory 디자인 및 배포 프로젝트 진행을 이끕니다.
- 프로젝트의 연락처의 single point로서 역할을 수행합니다.
- 디자인 및 배포, 운영 팀간의 커뮤니케이션을 수립합니다.
- 프로젝트 전체 과정에서 Executive sponsor와의 커뮤니케이션을 유지하고 수립합니다.

## Establishing Owners and Administrators

### Service and Data Owners

- **Service Owners.**  장기간 Active Directory Infrastructure를 유지해야 하며 directory가 계속적으로 기능을 하며 SLA를 유지하는 것에 대한 책임이 있습니다. 
- **Data Owners.**  Directory에 저장된 정보 유지에 대한 책임을 있습니다. 이에는 사용자 및 컴퓨터 관리 와 로컬 자원에 대한 관리를 포함합니다. 
- **Service and Data Administrators.** 위 Owner의 책임과 관련하여 정의된 정책의 수행 또는 유지를 위한 매일 작업을 수행하는 책임을 가지고 있습니다. 

### Service and Data Owners for Active Directory

- **Forest Owner.**  일반적으로 조직의 IT manager인 경우가 많으며 Active Directory deploy 전반적인 과정에 대하여 책임이 있습니다. 또한 핵심 구성 요소 owner를 지정하기도 합니다. 
- **Active Directory DNS Owner.**  기존에 존재하는 DNS infrastructure 및 조직의 namespace를 정확히 이해하고 있어야 합니다.
- **Site Topology Owner.**  조직의 물리적 네트워크 구조에 친숙해야 하며 개별 subnets 및 routers mapping 및 slow link로 연결된 지역 네트워크에 대하여도 알아야 합니다. 
- **OU Owner.**  Directory에 저장되는 data를 관리하는 책임을 가지고 있습니다. 운영 및 보안 정책에 대하여 친숙해야 하며, Service Administrators에게서 위임 받은 OU에 있는 account 및 자원 관리에 대한 책임이 있습니다.

## Building Project Team

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-0d14d865-ebac-4320-a668-5ef0a5cfc80b.png?raw=true)

---
title: Active Directory Design and Deployment
filename: ActiveDirectory\Active-Directory-Design-and-Deployment.md
ms.date: 2021.04.05
---

# Active Directory Design and Deployment

## Active Directory Deployment Project Cycle

Active Directory Deployment Project는 세가지 과정, Design / Deployments / Operations, 으로 분류될 수 있습니다:

- **Design.** Design team을 생성하고 조직의 각 부문의 요구 사항을 만족하는 최적의 Active Directory 논리 구조를 설계합니다.
- **Lab/Pilot.** Design을 완료 한 후, deployment team은 lab 환경에 design을 적용하고 test합니다. 
- **Deploy.** Lab 환경에 design을 적용하고 test한 후, 실제 product 환경에 구현합니다.
- **Operations.** Deployment가 완료된 후 operations team이 directory service 관리에 대한 책임을 가져갑니다.

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/media/image-e902b215-fc55-4dc1-8587-ba9b00f63502.png?raw=true)

---

## Terms and Definitions

아래의 용어 및 정의는 Active Directory 디자인 및 배포 과정을 이해하는데 중요합니다:

- **Active Directory domain.**  Computer network에서 관리의 편의를 위하여 아래의 내용을 포함하는 여러 기능을 포함하고 있는 관리적 단위입니다.
- **Network-Wide User Identity.** Domain은 사용자 identity가 한번 생성되면 domain이 속하는 forest에 join된 어떤 컴퓨터에서도 참조되어질 수 있습니다.  Domain controller는 user 계정 및 암호, 인증서 같은 사용자 credentials을 저장하는데 사용되어집니다.
- **Authentication.** Domain Controller는 데이터에 대한 허가 및 사용자에 대한 인증 서비스를 제공합니다.
- **Trust Relationships.** Domain은 인증 서비스를 Trust를 통하여 Forest안의 다른 Domain의 사용자들에 대하여 확장할 수 있습니다.
- **Replication.** Domain은 Domain 서비스를 제공하기 위한 적정한 데이터를 포함하고 있는 directory partition을 가지고 있으며 이를 Domain Controller간에 복제합니다.
- **Active Directory Forest.** Forest는 같은 논리적 구조 및 글로벌 카탈로그, Directory Schema 및 Directory 구성을 공유하는 양방향 전이 트러스트 관계를 가지는 하나 이상의 Domain의 집합니다. 또한 Security Boundary이기도 합니다.
- **Active Directory Functional Level.** Forest 및 Domain에 대한 기능 수준에 따라 Active Directory의 고급 기능들의 사용 여부가 결정됩니다. 또한 Active Directory Schema Version 과 호환성에서도 중요한 요소가 될 수 있습니다.

---

## Active Directory Maximum Limits

- **Maximum Number of Object.** 각 Domain Controller에는 약 21.5 억 개의 개체를 생성할 수 있습니다.
- **Maximum Number of Security Identifiers.** 도메인에 약  21 억 개의 Security Identifiers를 생성할 수 있습니다.
- **Group Memberships for Security Principals.** User 및 computer, group 계정이 하나의 그룹에 약 1,015 개를 포함할 수 있습니다.
- **FQDN Length Limitations.** Active Directory에서는 FQDN이 64 문자를 넘을 수 없습니다.
- **File Name Length Limitations.** Windows의 File System에서 파일 이름은 260문자를 넘을 수 없습니다. 이 제한은 SYSVOL 및 Database 파일 경로 등에서 유의하여야 합니다.
- **DNS (Domain Name System) Host Name.** 24 문자를 넘을 수 없습니다.
- **Organizational Unit Name Length.** 64 문자를 넘을 수 없습니다.
- **Name Length Limits from the Schema:**
    - **DisplayName.** 256 문자를 넘을 수 없습니다.
    - **CommonName.** 64 문자를 넘을 수 없습니다.
    - **SamAccountName.** 256 문자 제안이나 이전 버전 호환성을 위해 20 문자로 제한합니다.
    - **DistinguishedName.** 255 문자를 넘을 경우 LDAP 바인딩에서 인증 오류가 발생할 수 있습니다. 이로 인해, OU의 계층 깊이나 이름의 길이에 영향을 미칠 수 있습니다.
- **Maximum Number of Group Policy Objects Applied.** 999개의 제한이 있습니다.
- **Maximum Number of Accounts per LDAP Transaction.** Scripts 또는 application에서 LDAP Transaction 하나에 5,000 개까지의 account에 대한 동작이 가능합니다.
- **Recommended Maximum Number of Domains in a Forest.** Windows 2000의 경우 800개이고, Windows 2003인 경우 1,200 개의 domains을 최대로 유지하기를 권장합니다.
- **Recommended Maximum Number of Domain Controllers in a Domain.** 1,200개의 domain controllers 까지 권장합니다.  

---

## Active Directory Deployment Project Progress

Active Directory Deployment Project는 아래의 단계들을 포함할 수 있습니다:

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/media/image-bd19ebb7-49ca-464c-9660-5f6a44025f32.png?raw=true)

1. [Planning Active Directory Project](Design-and-Deploy/Planning-Active-Directory-Project)
1. [Designing Active Directory Logical Structure](Design-and-Deploy/Designing-Active-Directory-Logical-Structure)
1. [Designing the Site Topology](Design-and-Deploy/Designing-the-Site-Topology)
1. [Planning Domain Controller Capacity](Design-and-Deploy/Planning-Domain-Controller-Capacity)
1. [Enable Advanced Active Directory Features](Design-and-Deploy/Enable-Advanced-Active-Directory-Features)
1. [Deploying Active Directory Domains](Design-and-Deploy/Deploying-Active-Directory-Domains)
1. [Planning a Secure Environment](Design-and-Deploy/Planning-a-Secure-Environment)
1. [Designing an Authentication Strategy](Design-and-Deploy/Designing-an-Authentication-Strategy)
1. [Designing a Resource Authorization Strategy](Design-and-Deploy/Designing-a-Resource-Authorization-Strategy)
1. [Designing a File and Print Service](Design-and-Deploy/Designing-a-File-and-Print-Service)
1. [Designing a Group Policy Infrastructure](Design-and-Deploy/Designing-a-Group-Policy-Infrastructure)
1. [Deploying Security Policy](Design-and-Deploy/Deploying-Security-Policy)
1. [Migration of User State](Design-and-Deploy/Migration-of-User-State)
1. [Deploying a Managed Software Environment](Design-and-Deploy/Deploying-a-Managed-Software-Environment)
1. [Designing Managed Updates Management Environment with WSUS](Design-and-Deploy/Designing-Managed-Updates-Management-Environment-with-WSUS)

---

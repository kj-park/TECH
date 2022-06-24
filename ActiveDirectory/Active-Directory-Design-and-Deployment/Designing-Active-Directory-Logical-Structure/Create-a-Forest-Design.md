---
title: Create a Forest Design
filename: ActiveDirectory\Designing-Active-Directory-Logical-Structure\Create-a-Forest-Design.md
ms.date: 2021.04.05
---

# Create a Forest Design

Forest 디자인 절차는 아래와 같습니다:

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-5c28d801-ec04-485d-bda5-45576fc37eae.png?raw=true)

Single Forest와 Multiple Forest 간의 일반적으로 고려 사항들의 특징은 아래와 같습니다.

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-7ccc33f2-de43-4c19-8201-b23fd5d9cdae.png?raw=true)

[TOP](#)

---

## Forest Design Requirements

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-1707f09b-db53-42ad-8abf-c4ff3c0bef59.png?raw=true)

네트워크 자원에 대하여 조직의 그룹들을 얼마나 자율성을 부여할 것인지, 격리할 것인지에 의하여 결정되어집니다. 조직 내 여러 그룹들이 동일하게 관리되어져야 하는 요구사항 및 구조상 또는 운영상의 독립성일 필요한 그룹의 요구사항을 만족하여야 합니다.

- **Organizational Structure Requirements.**  조직의 일부는 비용을 줄이기 위하여 공유된 infrastructure에 속해야 합니다. 하지만 독립적으로 그들의 고유 운영이 필요한 부분이 있습니다.
- **Operational Requirements.**  군사 조직이나 hosting 시나리오, 내부와 외부에 동일한 directory를 유지해야 하는 조직 등과 같이 조직의 일부는 directory service의 구성이나 가용성, 보안, 사용하는 application 등에서 제약이 필요한 경우가 있습니다.
- **Legal Requirements.**  Clients의 재정 정보를 유지해야 하는 재정 조직 및 군사 업무를 담당하는 하청 조직, 일급 비밀 정보를 유지하는 정부 조직 등과 같이 업무 규약이나 법규에 의하여 어떤 정보에 접근을 제한해야 하는 경우가 있을 수 있습니다.

### Service Administrator Scope of Authority

Forest의 Service Administrators는 Forest에 속하는 모든 data 및 service에 대한 모든 제어를 가지고 있습니다. 이런 이유로 Forest 에 있는 OU에 data를 저장하거나 computers를 join하는 그룹은 Service Administrators를 신뢰할 수 있어야 합니다.

### Autonomy (자율성) vs. Isolation (격리)

Autonomy 는 독립성을 의미하나 배타적인 자원에 대한 제어를 포함하지는 않습니다. 반면, Isolation 은 배타적인 자원에 대한 제어를 포함하는 독립성을 의미합니다.

- **Data Isolation.**  Data를 소유한 그룹이나 조직에 의하여 배타적인 제어를 하는 것을 의미합니다. Data는 Active Directory 또는 join된 computers에 저장되기에 Forest의 service administrators로부터 격리할 수 없습니다. 격리할 수 있는 유일한 방법은 Forest를 분리하는 것입니다.
- **Data Autonomy.**  그룹이나 조직이 자신의 소유한 Data를 관리할 수 있는 능력을 의미합니다. 이에는 다른 누구의 검증 없이 Data에 대한 관리적 결정을 하거나 필요한 관리 업무를 수행할 수 있음을 포함합니다.
- **Service Isolation.**  Active Directory infrastructure에 대한 배타적인 제어를 의미하며 그룹은 directory service를 운영하는데 있어 간섭할 수 있는 그룹 외부의 administrator를 필요치 않습니다. 예를 들어 제조회사의 공장의 장비를 제어하는 application이나 hosting 업체가 각 클라이언트에게 서비스에 대한 간섭을 해서는 안 되는 경우가 될 수 있습니다.
- **Service Autonomy.**  배타적인 제어 없이 infrastructure를 관리할 수 있는 능력을 의미합니다. 이는 그룹이 Domain을 추가 또는 제거, DNS namespace를 수정, schema의 변경을 forest owner의 검증 없이 할 수 있음을 의미합니다.
- **Limited Connectivity.**  자체의 장비 또는 제한을 설정한 network을 가진 그룹이 있는지 여부.

### Documenting the Forest Design Requirements

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-4d51e671-c5e1-44ef-927e-757526c6959d.png?raw=true)

[TOP](#)

---

## Determine the number of Forests

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-c8224f3d-742d-43c4-86fb-a84c2808a7c9.png?raw=true)

### Forest Design Models

#### Resource Forest Model

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-f1a80a8d-0f71-4f19-915b-ffaa65bd6343.png?raw=true)

#### Organizational Forest Model

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-f00a7a1b-760c-49e0-9581-d752d6c78aff.png?raw=true)

#### Restricted Access Forest Model

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-2cdd6f83-52de-47fb-beb8-7626d3e51a82.png?raw=true)

#### Organizational Domain Forest Model

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-b121a411-9c08-4883-bc45-7a3a0043ace4.png?raw=true)

### Mapping Design Requirements to Forest Design Models

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-6f7c39cd-d895-40ea-985d-9d51d5b3930e.png?raw=true)

[TOP](#)

---

## Document the Forest Design

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-74b289f6-20e3-4a0b-87d3-e93c6194170e.png?raw=true)

![image.png](https://github.com/kj-park/Tech/blob/main/ActiveDirectory/.media/image-0616cf56-b956-49f4-a637-97d4de3e4779.png?raw=true)

[TOP](#)

---

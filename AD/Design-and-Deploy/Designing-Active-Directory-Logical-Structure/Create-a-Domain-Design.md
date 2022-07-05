---
title: Create a Domain Design
filename: ActiveDirectory\Designing-Active-Directory-Logical-Structure\Create-a-Domain-Design.md
ms.date: 2021.04.05
---

# Create a Domain Design

Domain 디자인 절차는 아래와 같습니다:

![image.png](https://github.com/kj-park/Tech/blob/main/AD/media/image-791866f5-7ce6-4a1a-9eae-37060f3a8e2b.png?raw=true)

Single Domain 와 Multiple Domain 간의 일반적으로 고려 사항들의 특징은 아래와 같습니다.

![image.png](https://github.com/kj-park/Tech/blob/main/AD/media/image-74b2d98d-05b1-4c3c-a9e5-b4fbf93a3384.png?raw=true)

[TOP](#)

---

## Review the Domain Models

![image.png](https://github.com/kj-park/Tech/blob/main/AD/media/image-d27e209e-4559-44fd-86d2-264504991732.png?raw=true)

### Single Domain Model

Single Domain Model은 유지 관리하는데 있어 가장 쉬습니다. 이는 하나의 Forest에 하나의 Domain을 구성하는 것이며 관리의 복잡성을 감소시키는 다음과 같은 장점이 있습니다:

- Forest의 모든 Domain Controller에서 사용자 인증을 처리할 수 있습니다.
- 모든 Domain Controller가 global Catalogs가 될 수 있어 Global Catalog Server Placement를 계획할 필요가 없습니다.

반면, Replication을 많이 발생할 수 있습니다. Replication의 단위가 Domain이기 때문에 Multi Domain을 유지하는 경우 그 Replication이 각각 해당 Domain으로 제한되어지기 때문입니다. 

### Regional Domain Model

한 Domain의 모든 개체 data는 그 Domain의 Domain Controllers 간에 복제가 발생합니다. 이러한 이유로 WAN 연결로 지역적으로 분산된 많은 수의 사용자들을 Forest에 포함하기 위해서는 Regional Domain을 배포하여 WAN 연결간의 Replication traffic을 줄일 수 있습니다.  Regional Domain Model은 하나의 Forest Root Domain과 하나 이상의 Regional Domain으로 구성됩니다.

![image.png](https://github.com/kj-park/Tech/blob/main/AD/media/image-8b3827ba-07f2-466a-b8af-ee3cbc25cf56.png?raw=true)

[TOP](#)

---

## Determine the number of Domains

![image.png](https://github.com/kj-park/Tech/blob/main/AD/media/image-eb8228a8-aec7-4c92-b302-13df5b5b5927.png?raw=true)

모든 Forest는 Single Domain에서 시작합니다. 

### Maximum Number of Users in a Single Domain

| **Slowest Link Connect     (Kbps)** | **Maximum Users     if 1% Bandwidth Available** | **Maximum Users     if 5% Bandwidth Available** | **Maximum Users     if 10% Bandwidth Available** |
| ----------------------------------- | ----------------------------------------------- | ----------------------------------------------- | ------------------------------------------------ |
| 28.8                                | 10,000                                          | 25,000                                          | 40,000                                           |
| 32                                  | 10,000                                          | 25,000                                          | 50,000                                           |
| 56                                  | 10,000                                          | 50,000                                          | 100,000                                          |
| 64                                  | 10,000                                          | 50,000                                          | 100,000                                          |
| 128                                 | 25,000                                          | 100,000                                         | 100,000                                          |
| 256                                 | 50,000                                          | 100,000                                         | 100,000                                          |
| 512                                 | 80,000                                          | 100,000                                         | 100,000                                          |
| 1500                                | 100,000                                         | 100,000                                         | 100,000                                          |

**Note:** 위에 명시된 표는 아래와 같은 조건에서 recommendation 입니다:

- Forest에 매년 20% 정도 신규 사용자가 생성됩니다.
- Forest에 매년 15% 정도 사용자가 떠납니다.
- 각 사용자는 평균적으로 5 개 global groups 과 5 개 universal groups의 구성원입니다.
- 사용자와 컴퓨터의 비율은 1:1 정도입니다.
- Active Directory 통합 DNS 를 사용합니다.
- DNS는 부실 리소스 레코드 검색 및 청소 기능을 사용합니다.

### Identifying Regions

![image.png](https://github.com/kj-park/Tech/blob/main/AD/media/image-6d57782d-199d-4d40-9a56-43c89cb4ee68.png?raw=true)



[TOP](#)

---

## Determine Upgrade or New Deploy Domain

![image.png](https://github.com/kj-park/Tech/blob/main/AD/media/image-a6ae86aa-904d-47f3-8e2f-675d512554bf.png?raw=true)

[TOP](#)

---

## Assign Domain Name & Select Forest Root Domain

![image.png](https://github.com/kj-park/Tech/blob/main/AD/media/image-a7e8db21-7eb2-4f45-acd4-b6ec77f23bf7.png?raw=true)

### Assign Domain Name

### Select Forest Root Domain

[TOP](#)

---
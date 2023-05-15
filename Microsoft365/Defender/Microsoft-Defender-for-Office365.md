

# Microsoft Defender for Office365

Protect Email and Collaboration with Defender

## Table of Contents

- [Microsoft Defender for Office 365 Overview](#microsoft-defender-for-office-365-overview)
- [Microsoft Defender for Office 365 Subscription Plan](#microsoft-defender-for-office-365-subscription-plan)
- [Preset Security Policies & Configuration Analyzer in EOP and MDO](#preset-security-policies--configuration-analyzer-in-eop-and-mdo)

## Microsoft Defender for Office 365 Overview

### 보안 위협에 대한 보호 과제

#### 사용자 환경 보호 과제

![mdo-user-env-protection-challenge]({{ site.url }}/Microsoft365/images/Defender/mdo-user-env-protection-challenge-01.png?raw=true)

![mdo-user-env-protection-challenge]({{ site.url }}/Microsoft365/images/Defender/mdo-user-env-protection-challenge-02.png?raw=true)

<sup>1</sup> Verizon Data Breach Investigations Report  
<sup>2</sup> Microsoft 2021 Digital Defense Report  
<sup>3</sup> US Federal Bureau of Investigation, March 2021  

#### 엔터프라이즈 보안에는 단순한 예방 이상의 기능이 필요

![mdo-user-env-protection-challenge]({{ site.url }}/Microsoft365/images/Defender/mdo-user-env-protection-challenge-03.png?raw=true)

#### Multi-Layered Protection Stack

![mdo-user-env-protection-challenge]({{ site.url }}/Microsoft365/images/Defender/mdo-multi-layered-protection-stack.png?raw=true)

#### Microsoft 365 Zero Trust Architecture

![mdo-m365-zero-trust-architecture]({{ site.url }}/Microsoft365/images/Defender/mdo-m365-zero-trust-architecture.png?raw=true)

---

## Microsoft Defender for Office 365 Subscription Plan

Office 365 Security는 조직의 Email messages 또는 Links(Urls), Collaboration tools에서 노출되는 악의적인 위협에 대한 보호를 제공합니다. 

![mdo-subscription-plan]({{ site.url }}/Microsoft365/images/Defender/mdo-subscription-plan.png?raw=true)

Microsoft Defender for Office 365 Plan 2 is included in Office 365 E5, Office 365 A5, and Microsoft 365 E5.

Microsoft Defender for Office 365 Plan 1 is included in Microsoft 365 Business Premium.

### [Exchange Online Protection](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/exchange-online-protection-overview?view=o365-worldwide)

#### Prevent & Detect (EOP)

- [spam](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/anti-spam-protection?view=o365-worldwide)
- [phish](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/configure-anti-phishing-policies-eop?view=o365-worldwide)
- [malware](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/anti-malware-protection?view=o365-worldwide)
- [bulk mail](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/what-s-the-difference-between-junk-email-and-bulk-email?view=o365-worldwide#how-to-manage-bulk-email)
- [spoof intelligence](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/anti-spoofing-protection?view=o365-worldwide)
- [impersonation detection](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/set-up-anti-phishing-policies?view=o365-worldwide#impersonation-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365)
- [Admin Quarantine](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/quarantine-email-messages?view=o365-worldwide)
- [Admin and user submissions of False Positives and False Negatives](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/report-junk-email-messages-to-microsoft?view=o365-worldwide)
- [Allow/Block for URLs and Files](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/tenant-allow-block-list?view=o365-worldwide)
- [Reports](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/view-email-security-reports?view=o365-worldwide)

#### Investigate (EOP)

- [Audit log](https://learn.microsoft.com/en-us/exchange/security-and-compliance/exchange-auditing-reports/exchange-auditing-reports)
- [Message Trace](https://learn.microsoft.com/en-us/exchange/monitoring/trace-an-email-message/message-trace-modern-eac)

#### Respond (EOP)

- [Zero-hour auto purge (ZAP)](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/zero-hour-auto-purge?view=o365-worldwide)
- Refinement and testing of Allow and Block lists
    - [Block lists for message senders](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/create-block-sender-lists-in-office-365?view=o365-worldwide)
    - [Allow lists for message senders](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/create-block-sender-lists-in-office-365?view=o365-worldwide)

### Defender for Office 365 Plan 1

EOP의 모든 기능을 포함하고 있습니다.

Configuration, protection, and detection capabilities

#### Prevent & Detect (MOD P1)

- [Safe attachments](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/safe-attachments?view=o365-worldwide)
- [Safe links](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/safe-links?view=o365-worldwide)
- [Microsoft Defender for Office 365 protection for workloads (ex. SharePoint Online, Teams, OneDrive for Business)](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/mdo-for-spo-odb-and-teams?view=o365-worldwide)
- [Time-of-click protection in email, Office clients, and Teams](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/safe-links?view=o365-worldwide)
- [anti-phishing in Defender for Office 365](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/set-up-anti-phishing-policies?view=o365-worldwide#exclusive-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365)
- [User and domain impersonation protection](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/impersonation-insight?view=o365-worldwide)
- [Alerts](https://learn.microsoft.com/en-us/microsoft-365/security/defender/investigate-alerts?view=o365-worldwide), and [SIEM integration API for alerts](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/siem-integration-with-office-365-ti?view=o365-worldwide)

#### Investigate (MOD P1)

- [SIEM integration API for detections](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/siem-integration-with-office-365-ti?view=o365-worldwide)
- [Real-time detections tool](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/threat-explorer?view=o365-worldwide)
- [URL trace](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/view-reports-for-mdo?view=o365-worldwide#url-protection-report)

#### Respond (MOD P1)

- Same

### Defender for Office 365 Plan 2

Defender for Office 365 Plan 1의 모든 기능을 포함하고 있습니다.

Automation, investigation, remediation, and education capabilities


#### Prevent & Detect (MOD P2)

- Same

#### Investigate (MOD P2)

- [Threat Explorer](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/threat-explorer?view=o365-worldwide)
- [Threat Trackers](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/threat-trackers?view=o365-worldwide)
- [Campaign views](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/campaigns?view=o365-worldwide)

#### Respond (MOD P2)

- [Automated Investigation and Response (AIR)](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/office-365-air?view=o365-worldwide)
- [AIR from Threat Explorer](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/air-view-investigation-results?view=o365-worldwide)
- [AIR for compromised users](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/address-compromised-users-quickly?view=o365-worldwide)
- [SIEM Integration API for Automated Investigations](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/siem-integration-with-office-365-ti?view=o365-worldwide)


#### [Attack simulation training](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/attack-simulation-training?view=o365-worldwide)

#### [Proactively hunt for threats with advanced hunting in Microsoft 365 Defender](https://learn.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-overview?view=o365-worldwide)

---

## Preset Security Policies & Configuration Analyzer in EOP and MDO

### Preset Security Policies

권장되는 모든 스팸, 맬웨어 및 피싱 정책을 한 번에 적용할 수 있습니다. 구성을 변경할 수 없으나 Microsoft의 데이터 센터의 관찰과 경험을 기반으로 설정하여 유해한 콘텐츠를 멀리 유지하는 것과 불필요한 중단을 방지하는 것 사이의 균형을 유지할 수 있습니다.

![mdo-preset-security-policies.png]({{ site.url }}/Microsoft365/images/Defender/mdo-preset-security-policies.png?raw=true)

- **Built-in Protection.** 악의적인 링크 및 첨부 파일로 부터 보호할 수 있게 조직의 모든 사용자들에게 적용됩니다.
- **Standard Protection.** 스팸, 피싱 및 맬웨어 위협으로 부터 보호하는 기본 보호 프로필입니다.
- **Strict Protection.** 가치가 높은 대상 또는 우선 순위 사용자와 같은 선택된 사용자에 대한 보다 적극적인 보호 프로필입니다.

### Configuration Analyzer

기존 보안 정책을 Standard 또는 Strict 권장사항 수준과 비교 분석하여 조정할 수 있습니다

- Standard Recommendations
- Strict Recommendations

---

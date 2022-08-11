

# Protect Email and Collaboration with Defender

## Table of Contents

- [Microsoft Defender for Office 365 Overview](#Microsoft-Defender-for-Office-365-Overview)
- [Microsoft Defender for Office 365 Subscription Plan](#Microsoft-Defender-for-Office-365-Subscription-Plan)
- [Preset Security Policies & Configuration Analyzer in EOP and MDO](#Preset-Security-Policies-&-Configuration-Analyzer-in-EOP-and-MDO)

## Microsoft Defender for Office 365 Overview

### 보안 위협에 대한 보호 과제

#### 사용자 환경 보호 과제

![mdo-user-env-protection-challenge](https://github.com/kj-park/tech/blob/main/Microsoft365/media/Defender/mdo-user-env-protection-challenge-01.png?raw=true)

![mdo-user-env-protection-challenge](https://github.com/kj-park/tech/blob/main/Microsoft365/media/Defender/mdo-user-env-protection-challenge-02.png?raw=true)

<sup>1</sup> Verizon Data Breach Investigations Report  
<sup>2</sup> Microsoft 2021 Digital Defense Report  
<sup>3</sup> US Federal Bureau of Investigation, March 2021  

#### 엔터프라이즈 보안에는 단순한 예방 이상의 기능이 필요

![mdo-user-env-protection-challenge](https://github.com/kj-park/tech/blob/main/Microsoft365/media/Defender/mdo-user-env-protection-challenge-03.png?raw=true)

#### Multi-Layered Protection Stack

![mdo-user-env-protection-challenge](https://github.com/kj-park/tech/blob/main/Microsoft365/media/Defender/mdo-multi-layered-protection-stack.png?raw=true)

#### Microsoft 365 Zero Trust Architecture

![mdo-m365-zero-trust-architecture](https://github.com/kj-park/tech/blob/main/Microsoft365/media/Defender/mdo-m365-zero-trust-architecture.png?raw=true)

---

## Microsoft Defender for Office 365 Subscription Plan

Office 365 Security는 조직의 Email messages 또는 Links(Urls), Collaboration tools에서 노출되는 악의적인 위협에 대한 보호를 제공합니다. 

![mdo-subscription-plan](https://github.com/kj-park/tech/blob/main/Microsoft365/media/Defender/mdo-subscription-plan.png?raw=true)


### [Exchange Online Protection](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/exchange-online-protection-overview?view=o365-worldwide)

| Prevent/Detect | Investigate | Respond |
|--|--|--|
| <ul><li>spam</li><li>phish</li><li>malware</li><li>bulk mail</li><li>spoof intelligence</li><li>impersonation detection</li><li>Admin Quarantine</li><li>Admin and user submissions of False Positives and False Negatives</li><li>Allow/Block for URLs and Files</li><li>Reports</li> | <li>Audit log</li><li>Message Trace</li></ul> | <ul><li>Zero-hour auto purge (ZAP)</li><li>Refinement and testing of Allow and Block lists</li></ul> |

### Defender for Office 365 Plan 1

EOP의 모든 기능을 포함하고 있습니다.

|Prevent/Detect|Investigate|Respond|
|---|---|---|
| <ul><li>Safe attachments</li><li>Safe links<li>Microsoft Defender for Office 365 protection for workloads (ex. SharePoint Online, Teams, OneDrive for Business)</li><li>Time-of-click protection in email, Office clients, and Teams</li><li>anti-phishing in Defender for Office 365</li><li>User and domain impersonation protection</li><li>Alerts, and SIEM integration API for alerts</li>|<li>SIEM integration API for detections</li><li>**Real-time detections tool**</li><li>URL trace</li></ul> | <ul><li>Same</li></ul> |


### Defender for Office 365 Plan 2

Defender for Office 365 Plan 1의 모든 기능을 포함하고 있습니다.

|Prevent/Detect|Investigate|Respond|
|---|---|---|
| <ul><li>Same</li>|<li>**Threat Explorer**</li><li>Threat Trackers</li><li>Campaign views</li></ul> | <ul><li>Automated Investigation and Response (AIR)</li><li>AIR from Threat Explorer</li><li>AIR for compromised users</li><li>SIEM Integration API for Automated Investigations</li></ul> |

### Microsoft Defender for Office 365 Plan 1 and Plan 2

|Defender for Office 365 Plan 1|Defender for Office 365 Plan 2|
|---|---|
|Configuration, protection, and detection capabilities: <ul><li>[Safe Attachments](safe-attachments.md)</li><li>[Safe Links](safe-links.md)</li><li>[Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](mdo-for-spo-odb-and-teams.md)</li><li>[Anti-phishing protection in Defender for Office 365](set-up-anti-phishing-policies.md#exclusive-settings-in-anti-phishing-policies-in-microsoft-defender-for-office-365)</li><li>[Real-time detections](threat-explorer.md)</li></ul>|Automation, investigation, remediation, and education capabilities: <ul><li>[Threat Trackers](threat-trackers.md)</li><li>[Threat Explorer](threat-explorer.md)</li><li>[Automated investigation and response](office-365-air.md)</li><li>[Attack simulation training](attack-simulation-training.md)</li><li>[Proactively hunt for threats with advanced hunting in Microsoft 365 Defender](../defender/advanced-hunting-overview.md)</li><li>[Investigate incidents in Microsoft 365 Defender](../defender/investigate-incidents.md)</li><li>[Investigate alerts in Microsoft 365 Defender](../defender/investigate-alerts.md)</li></ul>|

- Microsoft Defender for Office 365 Plan 2 is included in Office 365 E5, Office 365 A5, and Microsoft 365 E5.

- Microsoft Defender for Office 365 Plan 1 is included in Microsoft 365 Business Premium.

---

## Preset Security Policies & Configuration Analyzer in EOP and MDO

---

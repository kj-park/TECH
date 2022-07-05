---
title: Exchange Online Quarantine
filename: Exchange\ExchangeOnline\Exchange-Online-Quarantine.md
ms.date: 2022.05.27
---

# Exchange Online Quarantine

Applies to

- Exchange Online Protection
- Microsoft Defender for Office 365 plan 1 and plan 2
- Microsoft 365 Defender


![compare-defender-for-o365-plan1-and-plan2](https://github.com/kj-park/tech/blob/main/Exchange/media/compare-defender-for-o365-plan1-and-plan2.png?raw=true)

![compare-defender-for-o365-included-canbeadded-subscriptions](https://github.com/kj-park/tech/blob/main/Exchange/media/compare-defender-for-o365-included-canbeadded-subscriptions.png?raw=true)

## Defender for Office 365의 Plan 1 과 Plan 2 비교

### Defender for Office 365 Plan 1

- Configuration, protection, and detection capabilities:
    - [Safe Attachments](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/safe-attachments?view=o365-worldwide)
    - [Safe Links](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/safe-links?view=o365-worldwide)
    - [Safe Attachments for SharePoint, OneDrive, and Microsoft Teams](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/mdo-for-spo-odb-and-teams?view=o365-worldwide)
    - [Anti-phishing protection in Defender for Office 365](Anti-phishing protection in Defender for Office 365)
    - [Real-time detections](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/threat-explorer?view=o365-worldwide)

### Defender for Office 365 Plan 2

- Defender for Office 365 Plan 1의 기능을 포함

- Automation, investigation, remediation, and education capabilities:
    - [Threat Trackers](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/threat-trackers?view=o365-worldwide)
    - [Threat Explorer](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/threat-explorer?view=o365-worldwide)
    - [Automated investigation and response](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/office-365-air?view=o365-worldwide)
    - [Attack simulation training](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/attack-simulation-training?view=o365-worldwide)
    - [Proactively hunt for threats with advanced hunting in Microsoft 365 Defender](https://docs.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-overview?view=o365-worldwide)
    - [Investigate incidents in Microsoft 365 Defender](https://docs.microsoft.com/en-us/microsoft-365/security/defender/investigate-incidents?view=o365-worldwide)
    - [Investigate alerts in Microsoft 365 Defender](https://docs.microsoft.com/en-us/microsoft-365/security/defender/investigate-alerts?view=o365-worldwide)


## Overview

Exchange Online에서 Quarantine의 Microsoft 365 Defender의 기능 중 일부입니다.

조직에서는 잠재적으로 위험하거나 원치 않는 메시지를 보유할 수 있습니다. Anti-mailware 및 anti-spam 정책을 통하여 격리를 할 수 있습니다.

**Anti-malware** 정책은 malware가 포함된 첨부가 있는 메시지를 자동으로 격리합니다.

**anti-spam** 정책은 기본적으로 피싱 및 높은 confidence 피싱 메시지를 차단하고, 스팸 및 높은 confidence 스팸과 bulk email 메시지를 사용자의 Junk Email 폴더로 전달합니다.

관리자는 사용자 지정 스팸 방지 정책을 만들어 스팸 및 높은 confidence 스팸과 bulk email 메시지를 격리할 수 있습니다.

![how-eop-works](https://github.com/kj-park/tech/blob/main/Exchange/media/how-eop-works.png?raw=true)


Quarantine and release message







## Quarantine notification settings
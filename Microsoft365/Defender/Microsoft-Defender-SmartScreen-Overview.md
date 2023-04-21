
# Microsoft Defender SmartScreen Overview

Microsoft Defender SmartScreen은 phishing 또는 malware websites/application과 악의적인 파일 다운로드로 부터 보호합니다.

## Benefits of Microsoft Defender SmartScreen

- Anti-phishing and anti-malware support

- Reputation-based URL and app protection

- Operating system integration

- Improved heuristics and diagnostic data

- Management through Group Policy and Microsoft Intune

- Blocking URLs associated with potentially unwanted applications

## Windows Defender SmartScreen Profiles in Intune

Intune에 등록된 Windows들에 대하여 Microsoft Edge에 대한 Defender SmartScreen 설정은 아래에 대하여 고려하여야 합니다.

- Microsoft Edge Legacy와 Microsoft Edge 현재 버전을 구별하여 설정하여야 합니다.
    - Microsoft Edge Legacy
        - MEM Device Configuration Profile (**Device Restriction Type**)
        - MEM Endpoint Security Attack Surface Reduction Profile (**Web Protection Type**)
    - Microsoft Edge Legacy + Microsoft Edge Current Version
        - MEM Device Configuration Profile (**Administrative Templates Type**)

### MEM Device Configuration Profile (**Device Restriction Type**)

![mem-win-config-device-restrict-defender-smartscreen-Profile]({{ site.url }}/Tech/Microsoft365/images/Defender/mem-win-config-device-restrict-defender-smartscreen-Profile.png?raw=true)


### MEM Endpoint Security Attack Surface Reduction Profile (**Web Protection Type**)

![mem-win-endpointsecurity-ASR-webprotection-defender-smartscreen-profile]({{ site.url }}/Tech/Microsoft365/images/Defender/mem-win-endpointsecurity-ASR-webprotection-defender-smartscreen-profile.png?raw=true)


### MEM Device Configuration Profile (**Administrative Templates Type**)

![mem-win-config-admx-computer-defender-smartscreen-Profile]({{ site.url }}/Tech/Microsoft365/images/mem-win-config-admx-computer-defender-smartscreen-Profile.png?raw=true)

![mem-win-config-admx-computer-defender-smartscreen-detailsettings]({{ site.url }}/Tech/Microsoft365/images/Defender/mem-win-config-admx-computer-defender-smartscreen-detailsettings.png?raw=true)

---

## Verify the Defender SmartScreen policies in Microsoft Microsoft Edge

**Microsoft Edge Legacy**에서 Defender SmartScreen 설정은 **Windows Security** 설정 창의 **앱 및 브라우저 컨트롤**의 **평판 기반 보호** 항목에서 확인할 수 있습니다:

![mem-win-config-device-restrict-defender-smartscreen-windowssecurity]({{ site.url }}/Tech/Microsoft365/images/Defender/mem-win-config-device-restrict-defender-smartscreen-windowssecurity.png?raw=true)

또한, Microsoft Edge Legacy에서는 **설정**의 **업데이트 및 보안** 항목에서 확인할 수 있습니다:
![mem-win-config-device-restrict-defender-smartscreen-edgelegacy]({{ site.url }}/Tech/Microsoft365/images/Defender/mem-win-config-device-restrict-defender-smartscreen-edgelegacy.png?raw=true)

**Microsoft Edge** current version에서 Defender SmartScreen 설정은 **[개인 정보, 검색 및 서비스](edge://settings/privacy)**의 **보안** 항목에서 확인할 수 있습니다:

![Edge-Defender-SmartScreen-enable]({{ site.url }}/Tech/Microsoft365/images/Defender/Edge-Defender-SmartScreen-enable.png?raw=true)

정책이 적용된 경우 아래 그림과 같이 **Microsoft Defender SmartScreen** 설정 항목이 켜진 상태로 변경하지 못하게 비활성화되어 있습니다:

![mem-win-config-device-restrict-defender-smartscreen-edge]({{ site.url }}/Tech/Microsoft365/images/Defender/mem-win-config-device-restrict-defender-smartscreen-edge.png?raw=true)

Microsoft Edge에서 적용된 세부 정책의 확인은 **[정책](edge://policy/)**에서 확인할 수 있습니다:

![Edge-Policies]({{ site.url }}/Tech/Microsoft365/images/Defender/Edge-Policies.png?raw=true)

### SmartScreen이 어떻게 보호하나요?

아래의 Demo page에서 SmartScreen에서 어떻게 보호를 하는지 확인할 수 있습니다.

- [https://demo.wd.microsoft.com/](https://demo.wd.microsoft.com/)
- [https://demo.smartscreen.msft.net/](https://demo.smartscreen.msft.net/)
- [https://nav.smartscreen.msft.net/](https://nav.smartscreen.msft.net/)

> [!INFO] 
> 위 demo 사이트는 조만간 서비스가 되지 않을 수 있습니다.

| 분류 | Edge Action | Description |
|--|--|--|
| Suspicious Phishing Site | ![smartscreen-on-edge-phishing-suspicious]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-phishing-suspicious.png?raw=true) |  |
| Known Phishing Site  | ![smartscreen-on-edge-phishing]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-phishing.png?raw=true) |  |
| Malware Site | ![smartscreen-on-edge-malware-site]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-malware-site.png?raw=true) |  |
| Blocked Download | ![smartscreen-on-edge-blocked-download]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-blocked-download.png?raw=true) |  |
| Contain malicious frame site | ![smartscreen-on-edge-malicious-frame]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-malicious-frame.png?raw=true) |  |
| Unknown Download | ![smartscreen-on-edge-unknown-download]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-unknown-download.png?raw=true) |  |
| Known Malware Download | ![smartscreen-on-edge-known-malware-download]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-known-malware-download.png?raw=true) |  |

| 분류 | Edge Action | Description |
|--|--|--|
| Block URL by Web Content Filtering | ![smartscreen-on-edge-web-content-filtering-01]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-web-content-filtering-01.png?raw=true) |  |
| Block URL by Web Content Filtering detail | ![smartscreen-on-edge-web-content-filtering-02]({{ site.url }}/Tech/Microsoft365/images/Defender/smartscreen-on-edge-web-content-filtering-02.png?raw=true) |  |

#### Web Content Filtering in Defender for Endpoint

Web content filtering 기능은 **<u>Microsoft Edge의 경우 Windows Defender SmartScreen 기능에 위해 동작</u>**되며,<br />
**<u>그 외 Chrome 또는 Firefox 등의 브라우저의 경우 Network Protection 기능에 위해 동작</u>**합니다. ([Web content filtering](https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/web-content-filtering?view=o365-worldwide#what-is-web-content-filtering))

Web Content Filtering의 Category 분류는 Cyren과 Partner 협약을 통하여 Defender for Endpoint를 통해 추가적은 비용 없이 Web Content Filtering기능을 사용할 수 있습니다. 

- [참고:Microsoft Defender ATP: Web Content Filtering - Microsoft Tech Community](https://techcommunity.microsoft.com/t5/core-infrastructure-and-security/microsoft-defender-atp-web-content-filtering/ba-p/1550096)
- [참고: Website URL Category Check - Cyren](https://www.cyren.com/security-center/url-category-check-gate)

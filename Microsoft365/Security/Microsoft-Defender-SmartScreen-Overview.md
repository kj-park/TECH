

# Microsoft Defender SmartScreen Overview


Anti-phishing and anti-malware support

Reputation-based URL and app protection.

Operating system integration

Improved heuristics and diagnostic data

Management through Group Policy and Microsoft Intune

Blocking URLs associated with potentially unwanted applications


## Windows Defender SmartScreen Profiles in Intune

Intune에 등록된 Windows들에 대하여 Microsoft Edge에 대한 Defender SmartScreen 설정은 아래에 대하여 고려하여야 합니다.

- Microsoft Edge Legacy와 Microsoft Edge 현재 버전을 구별하여 설정하여야 합니다.
    - Microsoft Edge Legacy
        - MEM Device Configuration Profile (**Device Restriction Type**)
        - MEM Endpoint Security Attack Surface Reduction Profile (**Web Protection Type**)
    - Microsoft Edge Legacy + Microsoft Edge Current Version
        - MEM Device Configuration Profile (**Administrative Templates Type**)

### MEM Device Configuration Profile (**Device Restriction Type**)

![mem-win-config-device-restrict-defender-smartscreen-Profile](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/mem-win-config-device-restrict-defender-smartscreen-Profile.png?raw=true)


### MEM Endpoint Security Attack Surface Reduction Profile (**Web Protection Type**)

![mem-win-endpointsecurity-ASR-webprotection-defender-smartscreen-profile](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/mem-win-endpointsecurity-ASR-webprotection-defender-smartscreen-profile.png?raw=true)


### MEM Device Configuration Profile (**Administrative Templates Type**)

![mem-win-config-admx-computer-defender-smartscreen-Profile](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/mem-win-config-admx-computer-defender-smartscreen-Profile.png?raw=true)

![mem-win-config-admx-computer-defender-smartscreen-detailsettings](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/mem-win-config-admx-computer-defender-smartscreen-detailsettings.png?raw=true)


---

## Verify the Defender SmartScreen policies in Windows Microsoft Edge

**Microsoft Edge Legacy**에서 Defender SmartScreen 설정은 **Windows Security** 설정 창의 **앱 및 브라우저 컨트롤**의 **평판 기반 보호** 항목에서 확인할 수 있습니다:

![mem-win-config-device-restrict-defender-smartscreen-windowssecurity](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/mem-win-config-device-restrict-defender-smartscreen-windowssecurity.png?raw=true)

또한, Microsoft Edge Legacy에서는 **설정**의 **업데이트 및 보안** 항목에서 확인할 수 있습니다:
![mem-win-config-device-restrict-defender-smartscreen-edgelegacy](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/mem-win-config-device-restrict-defender-smartscreen-edgelegacy.png?raw=true)

**Microsoft Edge** current version에서 Defender SmartScreen 설정은 **[개인 정보, 검색 및 서비스](edge://settings/privacy)**의 **보안** 항목에서 확인할 수 있습니다:

![Edge-Defender-SmartScreen-enable](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/Edge-Defender-SmartScreen-enable.png?raw=true)

정책이 적용된 경우 아래 그림과 같이 **Microsoft Defender SmartScreen** 설정 항목이 켜진 상태로 변경하지 못하게 비활성화되어 있습니다:

![mem-win-config-device-restrict-defender-smartscreen-edge](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/mem-win-config-device-restrict-defender-smartscreen-edge.png?raw=true)


Microsoft Edge에서 적용된 세부 정책의 확인은 **[정책](edge://policy/)**에서 확인할 수 있습니다:

![Edge-Policies](https://github.com/kj-park/tech/blob/main/Microsoft365/Security/.media/Edge-Policies.png?raw=true)


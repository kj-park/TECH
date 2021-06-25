---
title: AD FS Requirements
filename: ActiveDirectory\ADFS\adfs-Requirements.md
ms.date: 2021.06.25
---

# AD FS Requirements

## Certificate requirements

### SSL Certificates

ADFS 및 Web Application Proxy 서버는 federation service의 HTTPS 요청을 지원하는 SSL Certificate가 있습니다.

Web Application Proxy는 published application의 requests를 지원하는 추가작 SSL Certificate가 있을 수 있습니다.

**Recommendation:** ADFS 및 WAP(Web Application Proxy) 서버는 동일한 SSL Certificate 사용을 권장합니다.

**Requirements:**

federation 서버에서 SSL Certificate에는 다음 요구 사항을 충족 해야 합니다.

- 공개적으로 신뢰할 수 있는 인증서 (공인 인증서)

- 서버 인증 EKU(확장된 키 사용) 값을 포함하는 인증서
    - 서버 인증 (1.3.6.1.5.5.7.3.1)

- Certificate Subject 또는 Subject Alternative Name (SAN)에서 "fs.contoso.com"와 같은 페더레이션 서비스 이름 포함

- 포트 443에서 사용자 인증서 인증을 위해 인증서에는 SAN의 "certauth.fs.contoso.com"처럼 "certauth.<federation service name>"가 포함됩니다.

- Windows 10 이전 클라이언트를 사용하여 온 프레미스 리소스에 디바이스를 등록하거나 최신 인증을 받으려면 SAN에 조직에서 사용 중인 각 UPN 접미사를 위한 "enterpriseregistration.<upn suffix>"이 포함되어 있어야 합니다.

Web Application Proxy에 대 한 SSL 인증서는 다음 요구 사항을 충족 해야 합니다.

- Proxy에서 Windows Integrated Authentication에 사용되는 ADFS request를 proxy하는 경우, proxy의 SSL Certifcate는 federation 서버의 SSL Certificate 같은 key를 사용해야 합니다.

- "ExtendedProtectionTokenCheck" ADFS 속성이 enable된 경우(ADFS의 기본 설정), proxy의 SSL Certificate federation 서버의 SSL Certificate와 같은 key를 사용해야 합니다.

- 다른 방법으로,  proxy와 federation 서버가 동일한 SSL Certificate 사용합니다.

### Service Communication Certificate

이 인증서를 Azure AD와 Office 365를 포함하는 대부분의 ADFS 시나리오에 필요 없습니다.
기본적으로 AD FS 서비스 통신 인증서로 초기 구성 시 제공 된 SSL 인증서를 구성 합니다.

**Recommendation:** SSL Certificate와 같은 인증서를 사용합니다.

### Token Signing Certificate

이 인증서는 발급된 토큰을 신뢰 당사자에게 서명하는 데 사용됩니다. 따라서 신뢰 당사자 애플리케이션은 알려져 있고 신뢰할 수 있는 것으로 인증서 및 관련 키를 인식해야 합니다. 토큰 서명 인증서 변경 내용을 만료 될 때 및 사용자와 같은 새 인증서를 구성 하는 경우 모든 신뢰 당사자를 업데이트 해야 합니다.

**Recommendation:** ADFS 내부적으로 생성된 기본 자체 서명된 토큰 서명 인증서를 사용합니다.

**Requirements:**

- 조직에서 엔터프라이즈 PKI 인증서를 토큰 서명에 사용할 수는 경우, `AdfsFarm` cmdlet의 `SigningCertificateThumbprint` 매개 변수를 사용 하여 설치하여 사용할 수 있습니다.

- token signing certificate가 변경되면, 기본 내부 certificate 또는 외부에 등록한 certificate를 사용하든, 모든 relying parties가 새로운 certificate 정보로 업데이트 되어야 합니다. 그렇지 않으면 relying parties에 로그온이 실패합니다.

### Token Encrypting/Decrypting Certificate

이 인증서는 AD FS에 발급 된 토큰을 암호화 하는 클레임 공급자가 사용 됩니다.

**Recommendation:** ADFS 내부적으로 생성된 기본 자체 서명된 토큰 서명 인증서를 사용합니다.

**Requirements:**

- 조직에서 엔터프라이즈 PKI 인증서를 토큰 서명에 사용할 수는 경우, `AdfsFarm` cmdlet의 `DecryptingCertificateThumbprint ` 매개 변수를 사용 하여 설치하여 사용할 수 있습니다.

- token decrypting certificate가 변경되면, 기본 내부 certificate 또는 외부에 등록한 certificate를 사용하든, 모든 relying parties가 새로운 certificate 정보로 업데이트 되어야 합니다. 그렇지 않으면 relying parties에 로그온이 실패합니다.

> [!Caution]
> token signing 및 token decrypting/encrypting에 사용되는 certificate는 Federation  서비스의 안정성에 중요 합니다. 이러한 인증서는 백업하고 독립적으로 복구 이벤트를 수행하는 동안 사용 가능해야 합니다.

### User Certificates

- ADFS에서 x509 user certificate 를 사용할 때, 모든 사용자 인증서는 ADFS와 WAP 서버가 신뢰하는 root 인증기관과 연결(chain up)되어야 합니다.

## Hardware requirements

ADFS 및 WAP 하드웨어 요구 사항 (실제 또는 가상) 팜의 처리 용량에 대 한 크기를 지정 해야 하므로 **CPU**에서 제어 됩니다.

- [AD FS 2016 Capacity Planning spreadsheet](https://adfsdocs.blob.core.windows.net/adfs/ADFSCapacity2016.xlsx)를 사용하여, ADFS 및 WAP 서버의 필요 수를 결정할 수 있습니다.

Memory 및 Disk 요구 사항은 상당히 정적이며 아래 표를 참조 하십시오.

Hardware requirement	Minimum requirement	Recommended requirement

---
https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/overview/ad-fs-requirements
---
title: Digital certificates and encryption in Exchange Server
filename: Exchange\Conceptual\Certificate-and-Encrpytion-in-Exchange-Server.md
date: 2012.03.30
---

# Digital certificates and encryption in Exchange Server

암호화 및 디지털 인증서는 모든 조직에서 중요한 고려 사항입니다. 기본적으로 Exchange Server TLS(전송 계층 보안)를 사용하여 내부 Exchange 서버와 로컬 서버의 Exchange 서비스 간 통신을 암호화하도록 구성됩니다.

## Digital Certificates Overview

디지털 인증서는 사용자 또는 컴퓨터의 ID를 확인하기 위해 온라인 암호처럼 작동되는 전자 파일입니다. 클라이언트 통신에 사용되는 암호화된 채널을 만드는 데 사용됩니다. 인증서는 CA(인증 기관)에서 발급한 디지털 문서로, 인증서 소유자의 ID를 보장하고 당사자가 암호화를 사용하여 안전한 방식으로 통신할 수 있도록 합니다.

인증서는 아래의 서비스를 제공합니다.

- **Encryption**: 데이터의 도난이나 변조로(theft or tampering) 부터 보호합니다.

- **Authentication**: 사용자 또는 웹사이트, 라우터와 같은 네트워크 장치가 그들 자신임을 확인합니다. 일반적으로 인증은 원보에서 대상의 ID를 확인하지만 상호 TLS 인증도 가능합니다.

인증서는 여러가지 사용 목적으로 발급될 수 있습니다. 예를 들어 웹 사용자 인증, 웹 서버 인증, S/MIME(Secure/Multipurpose Internet Mail Extensions), IPsec, 코드 서명이 있습니다.

인증서는 공개 키를 포함하며 해당 개인 키를 소유하는 사용자, 컴퓨터 또는 서비스의 ID에 이러한 공개 키를 첨부합니다. 공개 키와 개인 키는 전송되기 전에 클라이언트와 서버에서 데이터를 암호화하는 데 사용됩니다. Windows 사용자, 컴퓨터 및 서비스의 경우 루트 인증서가 신뢰할 수 있는 루트 인증서 저장소에 정의되어 있으며 인증서에 유효한 인증 경로가 포함되어 있는 경우 CA에 대한 트러스트가 설정됩니다. 인증서가 해지되지 않은 경우(CA의 인증서 해지 목록 또는 CRL에 없는 경우) 또는 만료되지 않은 경우 인증서가 유효한 것으로 간주됩니다.

아래 표는 세 가지 유형의 인증서에 대한 설명입니다.

| 유형 | 설명 | 장점 | 단점 |
|--|--|--|--|
| **Self-signed Certificate** | 인증서는 인증서를 만든 응용 프로그램에 의해 서명됩니다. | 비용(무료) | 인증서는 클라이언트 컴퓨터 및 모바일 장치에서 자동으로 신뢰되지 않습니다. 인증서를 모든 클라이언트 컴퓨터 및 장치의 신뢰할 수 있는 루트 인증서 저장소에 수동으로 추가해야 하지만 모든 모바일 장치에서 신뢰할 수 있는 루트 인증서 저장소를 변경할 수 있는 것은 아니며, <br /><br /> 모든 서비스가 자체 서명된 인증서로는 작동하지 않습니다. <br /><br /> 인증서 수명 주기 관리를 위한 인프라를 설정하기가 어렵습니다. 예를 들어 자체 서명된 인증서는 해지할 수 없습니다. |
| **내부 CA에서 발급한 사설 인증서** | 인증서는 조직의 PKI(공개 키 인프라)에서 발급합니다. AD CS(Active Directory 인증서 서비스)를 예로 들 수 있습니다. 자세한 내용은 [Active Directory Certificate Services Overview](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831740(v=ws.11)) 를 참조하세요. | 조직에서 자체 인증서를 발급할 수 있도록 허용합니다. <br /><br /> 상업용 CA의 인증서보다 비용이 저렴합니다. | PKI를 배포 및 유지 관리하기 위한 복잡성이 증가합니다. <br /><br /> 인증서는 클라이언트 컴퓨터 및 모바일 장치에서 자동으로 신뢰되지 않습니다. 인증서를 모든 클라이언트 컴퓨터 및 장치의 신뢰할 수 있는 루트 인증서 저장소에 수동으로 추가해야 하지만 모든 모바일 장치에서 신뢰할 수 있는 루트 인증서 저장소를 변경할 수 있는 것은 아닙니다. |
| **상업용 CA에서 발급한 공인 인증서** | 인증서는 신뢰할 수 있는 상업용 CA에서 구입한 것입니다. | 모든 클라이언트, 장치 및 서버가 인증서를 자동으로 신뢰하기 때문에 인증서 배포가 간소화됩니다. | 비용. 필요한 인증서 수를 최소화하기 위해 미리 계획해야 합니다. |

인증서 소유자가 누구인지 증명하려면 인증서가 다른 클라이언트, 장치 또는 서버에 대한 인증서 소유자를 정확하게 식별해야 합니다. 이 작업을 위한 세 가지 기본 방법은 다음 표에 설명되어 있습니다.

| 방법 | 설명 | 장점 | 단점 |
|--|--|--|--|
| **인증서 주체 이름(Subject Name) 일치** | 인증서의 주체 필드에는 호스트의 CN(일반 이름)이 포함되어 있습니다. | 모든 클라이언트, 장치 및 서비스와 호환됩니다. <br /><br /> 구획화. 호스트에 대한 인증서를 해지해도 다른 호스트에는 영향을 주지 않습니다. | 필요한 인증서 수. 지정된 호스트에 대한 인증서만 사용할 수 있습니다. 예를 들어 서비스를 동일한 서버에 www.exchange.info 경우에도 ftp.exchange.info 인증서를 사용할 수 없습니다. <br /><br /> 복잡성. 웹 서버에서 각 인증서에는 자체 IP 주소 바인딩이 필요합니다. |
| **인증서 주체 대체 이름(SAN) 일치** | 주체 필드 외에 인증서의 주체 대체 이름 필드에는 여러 호스트 이름 목록이 포함되어 있습니다. 예를 들어 다음과 같습니다.<br /> - www.exchange.info<br /> - ftp.exchange.info<br /> - ftp.edu.contoso.com <br /> 도메인 suffix가 상이한 multi domain이름이 필요한 경우 추가 고려가 필요힙니다. | 편리합니다. 별도의 여러 도메인에서 여러 호스트에 동일한 인증서를 사용할 수 있습니다. <br /><br /> 대부분의 클라이언트, 장치 및 서비스는 SAN 인증서를 지원합니다. <br /><br /> 감사 및 보안. SAN 인증서를 사용할 수 있는 호스트를 정확하게 알고 있습니다. | 추가 계획이 필요합니다. 인증서를 만들 때 호스트 목록을 제공해야 합니다. <br /><br /> 구획화가 부족합니다. 인증서의 모든 호스트에 영향을 주지 않으면 지정한 호스트 중 일부에 대한 인증서를 선택적으로 해지할 수 없습니다. |
| **와일드카드 인증서 일치** | 인증서의 주체 필드에는 와일드카드 문자( ) 및 단일 도메인 또는 하위 도메인과 같은 일반 * 이름이 포함되어 있습니다. 예를 들어 *.exchange.info 와일드카드 인증서를 사용할 수 있습니다. | 유연성. 인증서를 요청할 때 호스트 목록을 제공할 필요가 없습니다. 또한 향후 필요할 수 있는 모든 호스트에서 인증서를 사용할 수 있습니다. | 다른 최상위 도메인(TLD)에는 와일드카드 인증서를 사용할 수 없습니다. 예를 들어 *.exchange.info 호스트에 대해 *.contoso.com 이름에 대하여 사용할 수 없습니다. <br /><br /> 와일드카드 수준에서 호스트 이름에 대해 와일드카드 인증서만 사용할 수 있습니다.  <br /><br /> 이전 클라이언트, 장치, 응용 프로그램 또는 서비스는 와일드카드 인증서를 지원하지 않을 수 있습니다. <br /><br /> 와일드카드는 EV(확장 유효성 검사) 인증서에서 사용할 수 없습니다. <br /><br /> 신중한 감사 및 제어가 필요합니다. 와일드카드 인증서가 손상되면 지정된 도메인의 모든 호스트에 영향을 미치게 됩니다.|

## Certificates in Exchange

서버에 Exchange 2016 또는 Exchange 2019를 설치하면 Exchange에서 자체 서명된 인증서 두 개가 만들어지며 설치됩니다. 세 번째 자체 서명된 인증서는 Microsoft Windows에서 IIS(인터넷 정보 서비스)의 웹 관리 서비스용 인증서를 만들어 설치합니다. 이러한 세 인증서는 EAC(Exchange 관리 센터) 및 Exchange 관리 셸에서 볼 수 있으며 다음 표에 설명되어 있습니다.

| 이름 | 설명 |
|--|--|
|Microsoft Exchange| 이 Exchange 자체 서명된 인증서에는 다음 기능이 있습니다. <ul><li>인증서는 조직의 다른 모든 Exchange 서버에서 자동으로 신뢰됩니다. 여기에는 Exchange 조직에 구독된 Edge 전송 서버가 포함됩니다.</li><li>인증서는 통합 메시징을 제외한 모든 Exchange 서비스에 대해 자동으로 사용하도록 설정되며, Exchange 서버, 동일한 컴퓨터의 Exchange 서비스 및 클라이언트 액세스 서비스에서 사서함 서버의 백엔드 서비스로 Proxied되는 클라이언트 연결 간의 내부 통신을 암호화하는 데 사용됩니다.</li><li>외부 SMTP 메시징 서버의 인바운드 연결 및 외부 SMTP 메시징 서버에 대한 아웃바운드 연결에 대해 인증서가 자동으로 사용하도록 설정됩니다. 이 기본 구성을 통해 Exchange는 모든 인바운드 및 아웃바운드 SMTP 연결에 대해 기회적 TLS를 제공할 수 있습니다. Exchange는 외부 메시징 서버와의 SMTP 세션 암호화를 시도하지만 외부 서버가 TLS 암호화를 지원하지 않는 경우 세션은 암호화되지 않습니다.</li><li>인증서는 내부 또는 외부 클라이언트와의 암호화된 통신을 제공하지 않습니다. 인증서가 신뢰할 수 있는 루트 인증 저장소에 정의되어 있지기 때문에 클라이언트와 서버는 Exchange 자체 서명된 인증서를 신뢰하지 않습니다.</li></ul>|
|Microsoft Exchange Server Auth Certificate| 이 Exchange 자체 서명된 인증서는 OAuth를 사용하여 서버 간 인증 및 통합에 사용됩니다. 자세한 내용은 [Plan Exchange Server integration with SharePoint and Skype for Business](https://docs.microsoft.com/en-us/exchange/plan-and-deploy/integration-with-sharepoint-and-skype/integration-with-sharepoint-and-skype?view=exchserver-2019)을 참조하세요. |
|WMSVC| 이 Windows 자체 서명된 인증서는 IIS의 웹 관리 서비스에서 웹 서버 및 연결된 웹 사이트 및 응용 프로그램을 원격으로 관리하도록 설정하는 데 사용됩니다. 이 인증서를 제거하면 유효한 인증서가 선택되지 않은 경우 웹 관리 서비스가 시작되지 않습니다. |

## Certificate requirements for Exchange services

인증서를 할당할 수 있는 Exchange 서비스는 다음 표에 설명되어 있습니다.

| 서비스 | 설명 |
|--|--|
| IIS(HTTP) |  기본적으로 사서함 서버의 클라이언트 액세스(프런트 엔드) 서비스의 기본 웹 사이트에서 다음 서비스가 제공되어 클라이언트가 Exchange에 연결하는 데 사용됩니다.<ul><li>Autodiscover</li><li>Exchange ActiveSync</li><li>Exchange 관리 센터</li><li>Exchange 웹 서비스</li><li>OAB(오프라인 주소장) 배포</li><li>Outlook 외부에서 사용(HTTP를 통한 RPC)</li><li>Outlook HTTP를 통한 MAPI</li><li>웹용 Outlook</li><li>원격 PowerShell</li></ul>단일 인증서만 웹 사이트에 연결할 수 있기 때문에 클라이언트가 이러한 서비스에 연결하는 데 사용하는 모든 DNS 이름을 인증서에 포함해야 합니다. SAN 인증서 또는 와일드카드 인증서를 사용하여 이 작업을 수행할 수 있습니다. |
| POP 또는 IMAP | POP 또는 IMAP에 사용되는 인증서는 IIS에 사용되는 인증서와 다를 수 있습니다. 그러나 관리를 간소화하기 위해 IIS 인증서에 POP 또는 IMAP에 사용되는 호스트 이름도 포함하고 이러한 모든 서비스에 대해 동일한 인증서를 사용하는 것이 좋습니다. |
| SMTP | 클라이언트 또는 메시징 서버의 SMTP 연결은 Exchange 서버의 프런트 엔드 전송 서비스에 구성된 하나 이상의 수신 커넥터에 의해 수락됩니다. 자세한 내용은 [Receive connectors](https://docs.microsoft.com/en-us/exchange/mail-flow/connectors/receive-connectors?view=exchserver-2019)를 참조하세요.<br /><br />SMTP 연결에 대해 TLS 암호화를 요구하려면 각 수신 커넥터에 대해 별도의 인증서를 사용할 수 있습니다. 인증서에는 SMTP 클라이언트 또는 서버에서 수신 커넥터에 연결하는 데 사용하는 DNS 이름이 포함되어야 합니다. 인증서 관리를 간소화하기 위해 단일 인증서에서 TLS 트래픽을 지원해야 하는 모든 DNS 이름을 포함해야 합니다.<br /><br />원본 서버와 대상 서버 간의 SMTP 연결이 모두 암호화되고 인증되는 상호 TLS 인증을 요구하는 경우 필요합니다. 자세한 내용은 [Domain Security](https://docs.microsoft.com/en-us/previous-versions/office/exchange-server-2010/bb124392(v=exchg.141))를 참조하세요. |
| Unified Messaging (UM) | 자세한 내용은 [Deploying Certificates for UM](https://docs.microsoft.com/en-us/exchange/deploying-certificates-for-um-exchange-2013-help?view=exchserver-2019)를 참조하세요.<br />**Note**: Exchange 2019에서 UM은 지원하지 않습니다. |
| Hybrid deployment with Microsoft 365 or Office 365 | 자세한 내용은 [Certificate Requirements for Hybrid Deployments](https://docs.microsoft.com/en-us/exchange/certificate-requirements?view=exchserver-2019)를 참조하세요. |
| Secure/Multipurpose Internet Mail Extensions (S/MIME) | 자세한 내용은 [S/MIME for message signing and encryption](https://docs.microsoft.com/en-us/exchange/policy-and-compliance/smime/smime?view=exchserver-2019)를 참조하세요. |


> [!NOTE]
> Exchange Admin Center와 Exchange Management Shell에서 remote PowerShell 접근을 위해 Kerberos authentication과 Kerberos 암호화가 사용되어집니다. 따라서, Remote PowerShell에서 사용할 인증서를 구성할 필요가 없습니다. 원격 PowerShell을 사용하여 도메인의 구성원이 아닌 컴퓨터에서 Exchange 서버에 연결하거나 인터넷에서 연결하려면 원격 PowerShell에서 사용하도록 인증서를 구성해야 합니다.

## Best practices for Exchange certificates

- 가능한 한 소수의 인증서 사용
- 클라이언트 및 외부 서버 연결에 상용 CA의 인증서 사용
- 적합한 상업용 CA 선택
- Exchange 인증서 마법사 사용
- 가능한 한 적게 호스트 이름 사용

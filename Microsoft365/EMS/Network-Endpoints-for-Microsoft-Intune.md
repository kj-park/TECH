---
title: Network endpoints for Microsoft Intune
filename: Microsoft365\Security\Intune\Network-Endpoints-for-Microsoft-Intune.md
ms.date: 2022.04.26
---

# Network endpoints for Microsoft Intune

Intune 배포에서 필요한 IP Address 및 Port 설정과 Proxy 설정 관련 정보를 설명합니다.

방화벽이나 Proxy 서버에 의하여 보호되는 devices들을 관리하기 위해서는 Intune을 위한 communication이 가능해야 합니다.

> [!INFO]  
> [Network endpoints for Microsoft Intune](https://docs.microsoft.com/en-us/mem/intune/fundamentals/intune-endpoints)

## Proxy Server Requirements

- Proxy Server는 HTTP (80)과 HTTPS (443)을 지원해야 합니다.
    - Windows Information Protection은 444 port를 사용합니다.
- Software updates를 다운로드와 같은 특정 task를 위해서는 intune은 unauthenticated proxy server access를 지원해야 합니다.

> [!NOTE]  
> Inspection SSL traffic은 지원하지 않습니다.

## Firewall Requirements

아래 table은 Intune clients access에서 필요한 Domains 및 IP Address 정보입니다:

| Domains | IP address |
|---|---|
| login.microsoftonline.com<br>*.officeconfig.msocdn.com<br>config.office.com<br>graph.windows.net<br>enterpriseregistration.windows.net | More information Office 365 URLs and IP address ranges |
| *.manage.microsoft.com<br>manage.microsoft.com | 104.214.164.192/27<br>104.46.162.96/27<br>13.67.13.176/28<br>13.67.15.128/27<br>13.69.231.128/28<br>13.69.67.224/28<br>13.70.78.128/28<br>13.70.79.128/27<br>13.71.199.64/28<br>13.73.244.48/28<br>13.74.111.192/27<br>13.75.39.208/28<br>13.77.53.176/28<br>13.86.221.176/28<br>13.89.174.240/28<br>13.89.175.192/28<br>20.189.105.0/24<br>20.189.172.160/27<br>20.189.229.0/25<br>20.191.167.0/25<br>20.37.153.0/24<br>20.37.192.128/25<br>20.38.81.0/24<br>20.41.1.0/24<br>20.42.1.0/24<br>20.42.130.0/24<br>20.42.224.128/25<br>20.43.129.0/24<br>20.44.19.224/27<br>20.49.93.160/27<br>40.119.8.128/25<br>40.67.121.224/27<br>40.70.151.32/28<br>40.71.14.96/28<br>40.74.25.0/24<br>40.78.245.240/28<br>40.78.247.128/27<br>40.79.197.64/27<br>40.79.197.96/28<br>40.80.180.208/28<br>40.80.180.224/27<br>40.80.184.128/25<br>40.82.248.224/28<br>40.82.249.128/25<br>52.150.137.0/25<br>52.162.111.96/28<br>52.168.116.128/27<br>52.182.141.192/27<br>52.236.189.96/27<br>52.240.244.160/27 |

---

## Network Requirements for PowerShell Script and Win32 Apps

PowerShell Script 또는 Win32 Apps 배포에 Intune을 사용한다면 테넌트 위치에 따른 아래의 테이블의 endpoint들에 액세스가 가능해야 합니다.


| Tenant Location | Storage name | CDN |
| -- | -- | -- |
| North Ameria (na) | naprodimedatapri<br/>naprodimedatasec<br/>naprodimedatahotfix<br/> | naprodimedatapri.azureedge.net<br/>naprodimedatasec.azureedge.net<br/>naprodimedatahotfix.azureedge.net<br/> |
| Europe (eu) | euprodimedatapri<br/>euprodimedatasec<br/>euprodimedatahotfix<br/> | euprodimedatapri.azureedge.net<br/>euprodimedatasec.azureedge.net<br/>euprodimedatahotfix.azureedge.net<br/> |
| Asia Pacific (ap) | approdimedatapri<br/>approdimedatasec<br/>approdimedatahotifx<br/> | approdimedatapri.azureedge.net<br/>approdimedatasec.azureedge.net<br/>approdimedatahotfix.azureedge.net<br/> |

---

## Windows Push Notification Services (WNS)

MDM에서 관리되는 Windows의 장치 action 또는 즉각적인 activites를 위하여 Windows Push Notification Services (WNS)를 사용합니다.

https://github.com/kj-park/tech/blob/main/Microsoft365/media/WNSPublicIPs_2021_09_28.xml?raw=true

---

## Delivery Optimization port requirements

### Proxy requirements for Windows Update

### Firewall requirements

*.do.dsp.mp.microsoft.com
*.dl.delivery.mp.microsoft.com
*.emdl.ws.microsoft.com








---

login.microsoftonline.com
*.officeconfig.msocdn.com
config.office.com
graph.windows.net
enterpriseregistration.windows.net
*.manage.microsoft.com
manage.microsoft.com

approdimedatapri.azureedge.net
approdimedatasec.azureedge.net
approdimedatahotfix.azureedge.net

*.notify.windows.com
*.wns.windows.com
*.notify.live.net

login.microsoftonline.com
login.live.com

*.do.dsp.mp.microsoft.com
*.dl.delivery.mp.microsoft.com
*.emdl.ws.microsoft.com


itunes.apple.com
*.itunes.apple.com
*.mzstatic.com
*.phobos.apple.com
*.phobos.itunes-apple.com.akadns.net

#-courier.push.apple.com

phobos.apple.com
ocsp.apple.com
ax.itunes.apple.com
ax.itunes.apple.com.edgesuite.net

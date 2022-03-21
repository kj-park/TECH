---
title: Learning PowerShell
filename: PowerShell\Learning-PowerShell.md
ms.date: 2022.03.21
keywords:
    - PowerShell
    - PowerShell Script
    - PowerShell Module
---

# Learning PowerShell

## Overview

PowerShell은 command-line shell의 **Automation Platform**이며, **Scripting Language**이며 **Configuration Management Framework**입니다.

- PowerShell은 다음 기능들으로 포함하고 있습니다:
    - Robust command-line [history](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_history)
    - Tab completion and command prediction
    - Supports command and parameter [aliases](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_aliases)
    - [Pipeline](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines) for chaining commands
    - In-console [help](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-help) system, similar to Unix `man` pages

### Automation Platform

PowerShell은 Windows 및 Linux, macOS에서 실행되는 cross-platform Automation Solution입니다.

PowerShell은 대부분의 당신이 일하는 것과 관련된 기술들을 관리하고 배포하기 위한 PowerShell Modules를 통해 확장이 가능합니다.

#### Microsoft

- [Azure](https://docs.microsoft.com/en-us/powershell/azure)
- [Windows](https://docs.microsoft.com/en-us/powershell/windows/get-started)
- [Exchange](https://docs.microsoft.com/en-us/powershell/exchange/exchange-management-shell)
- [SQL](https://docs.microsoft.com/en-us/sql/powershell/sql-server-powershell)
- [**Microsoft 365**](https://docs.microsoft.com/en-us/microsoft-365/enterprise/manage-microsoft-365-with-microsoft-365-powershell)

#### Third-party

- [AWS]()
- [VMWare]()
- [Google Cloud]()

### Scripting Language

PowerShell은 build 및 test, deploy solution으로 사용될 수 있으며, CI/CD 환경에서도 사용되어집니다.



> [!TIP]
> CI: Continuous Integration  
> CD: Continuous Delivery & Continuous Deployment

- PowerShell은 일반적인 Shell들이 text를 return하는 것과 달리 .NET objects들을 return하며 다른 shell들의 유용항 기능들을 가지고 있는 Modern command shell입니다.
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

---

Contents:

- [Overview](#overview)
- [Installing PowerShell](Learning/Installing-PowerShell)
- [Learning PowerShell Basic](Learning/Learning-PowerShell-Basic)
- [Desired State Configuration (DSC)](Learning/Desired-State-Configuration)
- [Scripting and Development](Learning/Scripting-and-Development)

---

## Overview

PowerShell은 command-line shell로써 **Automation Platform**이며, **Scripting Language**이며 **Configuration Management Framework**입니다.

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
- [Microsoft Graph PowerShell SDK](https://docs.microsoft.com/en-us/powershell/microsoftgraph/get-started?view=graph-powershell-1.0)
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

PowerShell은 .NET Common Language Runtime (CLR)을 기반으로 만들었기에 모든 Input/Output 을 .NET Objects를 사용하기에 Output으로부터 text로 변환할 필요가 없습니다.

- Extensible through ......
    - [functions](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced),
    - [classes](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes), 
    - [scripts](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_scripts), and 
    - [modules](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules)
- Extensible [formatting system](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_format.ps1xml) for easy output
- Extensible [type system](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_types.ps1xml) for creating dynamic types
- Built-in support for common data formats like ......
    - [CSV](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertfrom-csv), 
    - [JSON](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertfrom-json), and 
    - [XML](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertto-xml)

### Configuration management

PowerShell Desired State Configuration (DSC)는 Enterprise Infrastructure 환경을 관리할 수 있는 Management Framework입니다.

- Create declarative [configurations](https://docs.microsoft.com/en-us/powershell/scripting/dsc/configurations/configurations) and custom scripts for repeatable deployments
- Enforce configuration settings and report on configuration drift
- Deploy configuration using [push or pull models](https://docs.microsoft.com/en-us/powershell/scripting/dsc/pull-server/enactingconfigurations)

---

> [!div class="nextstepaction"]  
> [Installing PowerShell](Learning/Installing-PowerShell)


# Installing PowerShell

---

Contents:

- [Windows PowerShell](#windows-powershell)
- [Installing PowerShell on Windows](#installing-powershell-on-windows)
- [~~Installing PowerShell on Linux~~](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux)
- [~~Installing PowerShell on macOS~~](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos)
- [~~Using PowerShell in Docker~~](https://docs.microsoft.com/en-us/powershell/scripting/install/powershell-in-docker)
- [Useful Tools for Scripting and Shell](#useful-tools-for-scripting-and-shell)

---

## Windows PowerShell

**Windows PowerShell**은 Windows OS에 탑재되어 있는 PowerShell 버전으로 PowerShell과는 약간의 차이가 있습니다.
PowerShell의 경우 cross-platform을 지원하기 위해 .NET Core 기반으로 설치 과정이 필요합니다.

Windows PowerShell은 Windows 7 SP1 또는 Windows Server 2008 R1 SP1부터 탑재되었습니다.

| Windows | PS 3.0 | PS 4.0 | PS 5.0 | PS 5.1 |
|---|:---:|:---:|:---:|:---:|
| Windows 11<br>Windows Server 2022 | - | - | - | **installed** |
| Windows 10 (see Note1)<br>Windows Server 2016 | - | - | - | **installed** |
| Windows 8.1<br>Windows Server 2012 R2 | - | **installed** | WMF 5.0 | [WMF 5.1](https://www.microsoft.com/download/details.aspx?id=54616) |
| Windows 8<br>Windows Server 2012 | **installed** | WMF 4.0 | WMF 5.0 | [WMF 5.1](https://www.microsoft.com/download/details.aspx?id=54616) |
| Windows 7 SP1<br>Windows Server 2008 R2 SP1 | WMF 3.0 | WMF 4.0 | WMF 5.0 | [WMF 5.1](https://www.microsoft.com/download/details.aspx?id=54616) |

> [!NOTE]  
> On the initial release of Windows 10, with automatic updates enabled, PowerShell gets updated from version 5.0 to 5.1.

### ISE

Windows PowerShell ISE는 Windows PowerShell용 호스트 응용 프로그램입니다. ISE에서 단일 Windows 기반 그래픽 사용자 인터페이스에서 명령을 실행하고 스크립트를 작성, 테스트 및 디버그할 수 있습니다.

> [!NOTE]  
> Windows PowerShell ISE는 PowerShell을 지원하지 않습니다. [Visual Studio Code](https://code.visualstudio.com/)에 [PowerShell Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)을 설치하여 사용하기를 권장합니다.

Windows PowerShell ISE의 Key Features는 아래와 같습니다:

- **Multiline editing**: To insert a blank line under the current line in the Command pane, press <kbd>SHIFT</kbd>+<kbd>ENTER</kbd>.
- **Selective execution**: To run part of a script, select the text you want to run, and then click the Run Script button. Or, press <kbd>F8</kbd>.
- **Context-sensitive help**: Type `Invoke-Item`, and then press <kbd>F1</kbd>. The Help file opens to the article for the `Invoke-Item` cmdlet.
- **Script Debugging**

### [Windows Management Framework (WMF)](https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/wmf/overview)

WMF installation adds and/or updates the following features:

- Windows PowerShell
- Windows PowerShell Desired State Configuration (DSC)
- Windows PowerShell Integrated Script Environment (ISE)
- Windows Remote Management (WinRM)
- Windows Management Instrumentation (WMI)
- Windows PowerShell Web Services (Management OData IIS Extension)
- Software Inventory Logging (SIL)
- Server Manager CIM Provider

---

## [Installing PowerShell on Windows](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)

### Installing the MSI package

- [PowerShell-7.2.1-win-x64.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/PowerShell-7.2.1-win-x64.msi)
- [PowerShell-7.2.1-win-x86.msi](https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/PowerShell-7.2.1-win-x86.msi)

> [!TIP] 
> 최신 버전은 아래 링크에서 다운받을 수 있습니다:
> [Installing the MSI Package](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2#installing-the-msi-package)


## Useful Tools for Scripting and Shell

- [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/)

- [Visual Studio Code](https://code.visualstudio.com/)

    - [PowerShell Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)

---

> [!div class="nextstepaction"]  
> [Learning PowerShell](Learning-PowerShell-Basic)

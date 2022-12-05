
# Join to AzureAD

## Verify your account information

check whether you are currently using an AD account or a local account.

1. Press <kbd>windows</kbd> + <kbd>R</kbd> and type "**ms-settings:yourinfo**" in text box and select `OK`.

1. check Your info as the below picture:

    ![join-to-azuread-001](https://github.com/kj-park/tech/blob/main/media/join-to-azuread-001.png?raw=true)

    If you are using AD account, you can check the domain name as like "**`DOMSG\<your-id>`**". "**DOMSG**" is your domain name.

    if you are using a local account go to the **[Join to Azure AD](#join-to-azure-ad)** step.

## Disconnect from AD

1. You need to disconnect from AD in the followed steps.

    download the provision script file from Teams or the followed link:

    [Disconnect-AD.ps1](https://gscaltexsg.sharepoint.com/:u:/r/sites/M365Onboardingteam/Shared%20Documents/Guide/Disconnect-AD.ps1?csf=1&web=1&e=BvrTtf)

    You can download the provision script file from **Guide** channel in **[GSPL] M365 Onboarding team** team as like follow picture:

    ![join-to-azuread-002](https://github.com/kj-park/tech/blob/main/media/join-to-azuread-002.png?raw=true)

    You should save this provision script file to **`C:\Scripts`** folder. if the folder is not exist, you should create the folder at first.

    ![join-to-azuread-003](https://github.com/kj-park/tech/blob/main/media/join-to-azuread-003.png?raw=true)

1. Run the Windows PowerShell as administrator.

    Press <kbd>windows</kbd> + <kbd>X</kbd> and select "**Windows PowerShll (Admin)**"

    ![join-to-azuread-004](https://github.com/kj-park/tech/blob/main/media/join-to-azuread-004.png?raw=true)

1. Run the follow command in Windows PowerShell.

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
    ```

    > [!NOTE]  
    > In Windows 11, You should use `ByPass` instead of `RemoteSigned`

1. Run the provision script in Windows PowerShell

    ```powershell
    C:\Scripts\Disconnect-AD.ps1
    ```

1. In the popuped window, **Disconnect from AD and Restart Windows**, check the account name that can sign-in after restarting windows and Select **`OK`**.

    ![join-to-azuread-006](https://github.com/kj-park/tech/blob/main/media/join-to-azuread-006.png?raw=true)

    It will be restart your windows and sign-in via local user automatically.

## Join to Azure AD

1. Press <kbd>windows</kbd> + <kbd>R</kbd> and type "**ms-settings:workplace**" in text box and select `OK`.

Now, You can join your windows to Azure AD. please refer the provided guide.

---

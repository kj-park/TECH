---
title: [MS-100] Microsoft 365 Identity and Services
filename: MCP\MS-100.md
ms.date: 2012.06.15
---

# [MS-100] Microsoft 365 Identity and Services

## Overview of the SharePoint Migration Tool (SPMT)

SPMT supports migration to SharePoint, OneDrive, and Teams from:

- SharePoint Server 2010, 2013, and 2016
- SharePoint Foundation 2010 and 2013
- Network and local file shares

> [!TIP]
> Learn how to migrate file shares by using [Migration Manager](https://docs.microsoft.com/en-us/sharepointmigration/mm-get-started).

see [How to use the SharePoint Migration Tool](https://docs.microsoft.com/en-us/sharepointmigration/how-to-use-the-sharepoint-migration-tool) to get started.

## Download and Install

Download and install SPMT using one of the links listed below.

| Public preview | First release | General Availability |
|:--:|:--:|:--:|
| [Install here](https://spmt.sharepointonline.com/betainstall/default.htm) | [Install here](https://aka.ms/spmt-ga-page) | [Install here](https://aka.ms/spmt-ga-page) |

### Permissions required

- **Global or SharePoint Admin.** To migrate at the organization-level, you must sign in as a Global or SharePoint admin in Microsoft 365.
- **Site Admin.** To migrate at the site collection level, you must be a site admin for that site collection.

### Prerequisites and Endpoints

Review the [SPMT system prerequisites and endoints](https://docs.microsoft.com/en-us/sharepointmigration/spmt-prerequisites)

- [SPMT settings](https://docs.microsoft.com/en-us/sharepointmigration/spmt-settings)
- [Understanding permissions when using the SharePoint Migration Tool](https://docs.microsoft.com/en-us/sharepointmigration/understanding-permissions-when-migrating)

#### Allow or prevent Custom Script (NoScript)

During migration, some web parts require this setting set to allow.

Changes to this setting might take up to 24 hours to take effect.

### Authentication supported

SPMT supports the following authentication methods:

- NTLM
- Kerberos
- Forms
- ADFS
- Multi-factor authentication
- SAML-based claims
- Client certificate authentication

> [!IMPORTANT]
> If the on-premises server is configured to support multiple authentication providers, including Windows authentication, then Windows authentication will not be supported. If this describes your environment, use other authentication methods instead of Windows authentication.

### Where is your data currently located?

Before you start using the SharePoint Migration Tool (SPMT), note where your data is located, and where you want those files located after migration.

SPMT lets you select from two sources from which to migrate your data: from an on-premises SharePoint Server 2010, 2013, or 2016 site, or from a local file share or network path.

- **SharePoint on-premises:** If you select the SharePoint on-premises option, you are prompted to enter the name of the SharePoint Server site where your files are located and prompted for your credentials for that site. You will indicate what document library you wish to migrate.

- **File share:** If you select the file share option, you are prompted to enter the location of the file share, the URL of the SharePoint site, and the document library where they will be copied. The files are not deleted from the source.

## Using the SharePoint Migration tool

> [!IMPORTANT]
> Proxy connections are not supported. Using Proxy connections yields errors such as "SharePoint login fail" or "cannot load document library".

- Migrating data files from SharePoint Server document libraries
- Migrating data files from a local file share
- To use a JSON or CSV file for bulk migration

## Monitoring and reporting status of migration jobs

see [Using the SharePoint Migration Tool Reports](https://docs.microsoft.com/en-us/sharepointmigration/using-the-sharepoint-migration-tool-reports).

### Resuming migration jobs

### Incremental migration

### Availability

## Upload User-Mapping file to SharePoint Migration Tool

You can use the default user-mapping file when you migrate data from a local file share or on-premises SharePoint Server document library. 

 > [!IMPORTANT]
>
> For **SharePoint Server 2010** migrations, only the log-in name is supported in column A.
>
> For **SharePoint Server 2013** and later, you can use either the log-in name or the SID in column A.

For all SharePoint Server versions:

![spmt-user-mapping](https://github.com/kj-park/tech/blob/main/MCP/.media/spmt-user-mapping.png?raw=true)


Only SharePoint Server 2013 and 2016 can use this format, in addition to using a log-in name:

![spmt-user-mapping-2013](https://github.com/kj-park/tech/blob/main/MCP/.media/spmt-user-mapping-2013.png?raw=true)

 > [!IMPORTANT]
> Don't include a header row in your CSV file.
>
> **Column A:** From the source location, enter the log-in name of the user. Required.
>
> **Column B:** On the target site, enter the user principal name (UPN). Required.
>
> **Column C:** If the user principal name on the target site is an Active Directory (AD) group, enter TRUE. If it's not an AD group, enter FALSE. Required.

## [Bulk upload SPMT migration task with JSON or CSV file](https://docs.microsoft.com/en-us/sharepointmigration/how-to-format-your-csv-file-for-data-content-migration)








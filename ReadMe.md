# ReadMe

## M365Dsc installation

To install M365DSC run:

```PS
 Install-Module Microsoft365DSC -Force
 Update-M365DSCDependencies
```

To check the installed version run :

```PS
Get-Module Microsoft365DSC -ListAvailable | select ModuleBase, Version
```

To update M365DSC run:

```PS
Update-Module Microsoft365DSC
Update-M365DSCDependencies
```

For official documentation view [this Link](https://microsoft365dsc.com/user-guide/get-started/how-to-install/)

## App Registration

## config.json

The ___config.json___ file contains the configuration of your project. To setup the initial configuration, complete the below steps:

1. Rename ___example_config.json___ in the __Config___ folder to ___config.json___
2. Replace the default values with your data
3. Enter the default dns name for your baseline tenant
4. Add each tenant to the Tenants array

```JSON
{
    "AppId": "YOUR_APP_ID",
    "TenantId": "YOUR_TENANT_ID",
    "CertificateThumbprint" : "YOUR_CERT_THUMBPRINT" ,
    "Secret" : "YOUR_SECRET",
    "Baseline": "baseline_tanant.onmicrosoft.com",
    "Tenants":[
        "tenant1.onmicrosoft.com",
        "tenant2.onmicrosoft.com",
        "tenant3.onmicrosoft.com"
    ]
}
```


#Version: 1.0.0.0
#Author: christopher.wall@crayon.vom
#Reference: 
#Required Module : 


function Write-Log
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][System.String]$Message
    )

    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Write-Host "$timestamp - $Message"
}

function GetOpperation{
    [CmdletBinding()]param ([System.Int32]$Selected)
    try{
        Write-Host "Select Opperation to perform" -ForegroundColor Green
        Write-Host "-----------------------------------------------------------------"`n -ForegroundColor Green
        Write-Host "1) List tenants" -ForegroundColor Green
        Write-Host "2) Export Baseline"-ForegroundColor Green
        Write-Host "3) Deploy baseline"-ForegroundColor Green
        Write-Host "4) Generate baseline reports"-ForegroundColor Green
        Write-Host "5) Generate comparison reports"-ForegroundColor Green
        Write-Host "6) Check Backup Status"-ForegroundColor Green
        Write-Host "7) Backup"-ForegroundColor Green
        Write-Host ""

        $Selected = Read-Host -Prompt "Please enter an opperation"
        if($Selected -eq 1){        
            List_Tenants
        }
        elseif ($Selected -eq 2) {
            Export_Baseline
            GetOpperation
        }
        elseif ($Selected -eq 3) {
            Write-Host " Option 3"
        }
        elseif ($Selected -eq 4) {
            Generate_Baseline_Report
        }
        elseif ($Selected -eq 5) {
            Generate_Delta_Report
            GetOpperation
        }
        elseif ($Selected -eq 6) {
            Git_Status
            GetOpperation
        }
        elseif ($Selected -eq 7) {
            Backup  
            GetOpperation
        }
        elseif ($Selected -eq 8) {
            Write-Host " Option 8"
        }
        elseif ($Selected -eq 9) {
            exit
        }
        else{
            Write-Log "[ERROR] Invalid selection!"
            GetOpperation
        }
    }
    catch{
        Write-Host "Error Invalid Entry "
        Write-Host $_.Exception.Message
    }
}

Function Check_Folders($folder){
    if (-Not (Test-Path -Path $folder)) {
    New-Item -ItemType directory -Path  $folder
} 


}

Function Ceate_Folders{
    Check_Folders("Baseline")
    foreach($tenant in $Tenants){
        
        $tenant_url= $tenant.split(".")
        $path = "Tenants/"+$tenant_url[0]
        Check_Folders($path)
    }    
}

Function List_Tenants{
    write-host "- Baseline:" $Baseline
    foreach($tenant in $Tenants){
        write-host "- " $tenant
    }
    GetOpperation
}


Function Export_Baseline{
    
    $Credential = Get-Credential
    # Exporting resources using certificate
    Export-M365DSCConfiguration -Components @("SPOAccessControlSettings",
                                                 "SPOApp", 
                                                 "SPOBrowserIdleSignout", 
                                                 "SPOHomeSite", 
                                                 "SPOHubSite", 
                                                 "SPOOrgAssetsLibrary", 
                                                 "SPOPropertyBag", 
                                                 "SPOSearchManagedProperty", 
                                                 "SPOSearchResultSource", 
                                                 "SPOSharingSettings", 
                                                 "SPOSite", 
                                                 "SPOSiteAuditSettings", 
                                                 "SPOSiteDesign", 
                                                 "SPOSiteDesignRights", 
                                                 "SPOSiteGroup", 
                                                 "SPOSiteScript", 
                                                 "SPOStorageEntity", 
                                                 "SPOTenantCdnEnabled", 
                                                 "SPOTenantCdnPolicy", 
                                                 "SPOTenantSettings", 
                                                 "SPOTheme", 
                                                 "SPOUserProfileProperty"
                                            #    ) -ApplicationId $AppId -CertificateThumbprint $Cert -TenantId $Baseline -Path "Baseline"
                                           # ) -ApplicationId $AppId -ApplicationSecret $Secret -TenantId $Baseline -Path "Baseline"
    ) -Credential $Credential -Path "Baseline"
}


Function Generate_Baseline_Report{
    $type = "HTML"
    #$type = "JSON"
    #$type = "Excel"
    $inputFile = "Baseline/M365TenantConfig.ps1"
    $report = "Baseline/M365TenantConfig.ps1"
    New-M365DSCReportFromConfiguration -Type $type -ConfigurationPath $inputFile -OutputPath $report
    GetOpperation
}

Function Generate_Delta_Report{
    #$inputFile = "Baseline/M365TenantConfig.ps1"
    $inputFile = ".\Baseline\M365TenantConfig.ps1"

    foreach($tenant in $Tenants){
        $tenant_url= $tenant.split(".")
        $path = ".\Tenants\$($tenant_url[0])"
        $destinationFile = "$($path)\M365TenantConfig.ps1"
        $report = "$($path)\DeltReport.html"
        Write-Host "Generating Delta Report for $($path)"
        New-M365DSCDeltaReport -Source $inputFile -Destination $destinationFile -OutputPath $report
       # New-M365DSCDeltaReport -Source "Tenants\w8pr5\DeltReport.html" -Destination "Baseline\M365TenantConfig.ps1"  -OutputPath $report
    }
}


Function Git_Status{
    git status
}

Function Backup{
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    git add .
    git commit -m $timestamp
    git push
}

######################################################################
######################## End Functions ###################################
######################################################################

#######Di a check t see if the module is installed


if ($MyInvocation.MyCommand.CommandType -eq "ExternalScript")
 { $ScriptPath = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition }
 else
 { $ScriptPath = Split-Path -Parent -Path ([Environment]::GetCommandLineArgs()[0]) 
     if (!$ScriptPath){ $ScriptPath = "." } 
}

     

#Config file path
$Configfile = Join-Path $ScriptPath -ChildPath "\Config\config.json"
$Configfile = Join-Path $PSScriptRoot -ChildPath "\Config\config.json"

#Import variables from config file
$Config = Get-Content $Configfile |ConvertFrom-Json
$AppId = $Config.AppId
#$TenantId = $Config.TenantId
$Cert = $Config.CertificateThumbprint
$Secret = $Config.Secret
$Baseline =$Config.Baseline
$Tenants =$Config.Tenants

#Ceate default folders
Ceate_Folders


Write-Log -Message 'Checking for required modules'
$RequiredModules = @('Microsoft365DSC')

 foreach($m in $RequiredModules){
   $Module = Get-Module $m -ListAvailable
   if ($Module){ 
        Write-Log -Message "$m Versionersion: $($Module.Version)"
    
   }
   else{
        Write-Log "[ERROR] not all required modules are installed, cancelling!"
        exit
    } 
} 


#Display menu
GetOpperation


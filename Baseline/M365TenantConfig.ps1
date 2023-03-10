# Generated with Microsoft365DSC version 1.23.215.1
# For additional information on how to use Microsoft365DSC, please visit https://aka.ms/M365DSC
param (
    [parameter()]
    [System.Management.Automation.PSCredential]
    $Credential
)

Configuration M365TenantConfig
{
    param (
        [parameter()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    if ($null -eq $Credential)
    {
        <# Credentials #>
        $Credscredential = Get-Credential -Message "Credentials"

    }
    else
    {
        $CredsCredential = $Credential
    }

    $OrganizationName = $CredsCredential.UserName.Split('@')[1]

    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.23.215.1'

    Node localhost
    {
        SPOAccessControlSettings ddfdc1f4-b764-4639-9ae5-e2610da7c945
        {
            CommentsOnSitePagesDisabled  = $False;
            Credential                   = $Credscredential;
            DisallowInfectedFileDownload = $False;
            DisplayStartASiteOption      = $True;
            EmailAttestationReAuthDays   = 30;
            EmailAttestationRequired     = $False;
            Ensure                       = "Present";
            ExternalServicesEnabled      = $True;
            IPAddressAllowList           = "";
            IPAddressEnforcement         = $False;
            IPAddressWACTokenLifetime    = 15;
            IsSingleInstance             = "Yes";
            SocialBarOnSitePagesDisabled = $False;
        }
        SPOBrowserIdleSignout 5727029c-bff4-457e-8ea6-f0203fb6eb88
        {
            Credential           = $Credscredential;
            Enabled              = $False;
            IsSingleInstance     = "Yes";
            SignOutAfter         = "00:00:00";
            WarnAfter            = "00:00:00";
        }
        SPOHomeSite b2a93b1c-beae-44b0-a360-faaf81785dd3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            IsSingleInstance     = "Yes";
            Url                  = "https://lxmk.sharepoint.com";
        }
        SPOHubSite 280ed696-69d1-4911-8c96-ff4be24ce5fe
        {
            AllowedToJoin        = @("c.wall-adm@$OrganizationName");
            Credential           = $Credscredential;
            Ensure               = "Present";
            RequiresJoinApproval = $False;
            SiteDesignId         = "00000000-0000-0000-0000-000000000000";
            Title                = "HKM Project Hub";
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOHubSite 2ab03fda-16b9-4e36-8ae8-d52eb3098fd3
        {
            AllowedToJoin        = @("c.wall-adm@$OrganizationName");
            Credential           = $Credscredential;
            Ensure               = "Present";
            RequiresJoinApproval = $False;
            SiteDesignId         = "00000000-0000-0000-0000-000000000000";
            Title                = "Intranet";
            Url                  = "https://lxmk.sharepoint.com";
        }
        SPOSharingSettings db326683-a78f-46a9-bac9-909eadface5e
        {
            BccExternalSharingInvitations              = $False;
            Credential                                 = $Credscredential;
            DefaultLinkPermission                      = "Edit";
            DefaultSharingLinkType                     = "AnonymousAccess";
            EnableGuestSignInAcceleration              = $False;
            Ensure                                     = "Present";
            FileAnonymousLinkType                      = "Edit";
            FolderAnonymousLinkType                    = "Edit";
            IsSingleInstance                           = "Yes";
            MySiteSharingCapability                    = "ExternalUserAndGuestSharing";
            NotifyOwnersWhenItemsReshared              = $True;
            PreventExternalUsersFromResharing          = $False;
            ProvisionSharedWithEveryoneFolder          = $False;
            RequireAcceptingAccountMatchInvitedAccount = $False;
            SharingCapability                          = "ExternalUserAndGuestSharing";
            SharingDomainRestrictionMode               = "None";
            ShowAllUsersClaim                          = $False;
            ShowEveryoneClaim                          = $False;
            ShowEveryoneExceptExternalUsersClaim       = $True;
            ShowPeoplePickerSuggestionsForGuestUsers   = $False;
        }
        SPOSite 23b9737b-62ed-4b56-8844-08a995db84f3
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "774d07b8-557e-4ea0-af19-642814055463";
            SharingCapability                           = "ExternalUserAndGuestSharing";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "SITEPAGEPUBLISHING#0";
            TimeZoneId                                  = 13;
            Title                                       = "Intranet";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSite 30a3a482-aa9c-46a2-b509-ce1381dcbeca
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "SCAProject@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "SCA Projects";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSite cb3677b8-21ed-474f-a6c9-7b1cabad394f
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "1082-00000356PhnixIntern@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "1082-00000356 Phönix | Intern";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1082-00000356PhnixIntern";
        }
        SPOSite 6a401912-7381-4334-b481-22d8fe20c115
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "774d07b8-557e-4ea0-af19-642814055463";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "STS#0";
            TimeZoneId                                  = 13;
            Title                                       = "Classic Team";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSite 499757b2-3da8-4bf9-9fda-ee77127e1f00
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "Angebote@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Angebote";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSite a0a46428-1f33-4ef3-8002-d9a5ef768ee6
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "774d07b8-557e-4ea0-af19-642814055463";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "APPCATALOG#0";
            TimeZoneId                                  = 13;
            Title                                       = "Apps";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/appcatalog";
        }
        SPOSite 4174b6cd-dd16-4c26-b960-8ca9eeebcf3f
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "ChatBot@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 204800;
            StorageWarningLevel                         = 174080;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "ChatBot";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSite d9f58e81-b7f7-42d7-b2a4-f3e5bb208062
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "c.wall-adm@$OrganizationName";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 0;
            Template                                    = "CONTENTCTR#0";
            TimeZoneId                                  = 13;
            Title                                       = "Content Center";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSite 6163f3fc-bf2e-45ec-aecc-29097697737c
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "DigitalInitiativePublicRelations@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Digital Initiative Public Relations";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSite 6196538f-819a-4624-8b02-28957f516ae6
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            HubUrl                                      = "https://lxmk.sharepoint.com";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "c.wall-adm@$OrganizationName";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "SITEPAGEPUBLISHING#0";
            TimeZoneId                                  = 13;
            Title                                       = "Finance";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSite 1e61d4ef-ffdb-4013-ac6e-f33613e729ce
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "group1@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 1048576;
            StorageWarningLevel                         = 1022361;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Group1";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSite 6589e8ed-e481-4d7f-982c-5dc737897f7f
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "group2@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 1048576;
            StorageWarningLevel                         = 1022361;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Group2";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSite 379cbc4c-6376-4a2c-8183-4bd3510ee559
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "HKM@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 204800;
            StorageWarningLevel                         = 174080;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "HKM Project Hub";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSite 5ff373de-3819-49fb-b887-da956c8428cd
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            HubUrl                                      = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "HKMTemplate@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 204800;
            StorageWarningLevel                         = 174080;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "HKM Template";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSite 680fdb49-ff2a-4b88-964c-69544eaab596
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            HubUrl                                      = "https://lxmk.sharepoint.com";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "c.wall-adm@$OrganizationName";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "SITEPAGEPUBLISHING#0";
            TimeZoneId                                  = 13;
            Title                                       = "HR";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSite 6cc51ca7-0f6d-477a-ac59-16a27eb409c8
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "hr@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "HR";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSite 8b066f06-79ed-490f-86b3-bcfcacef716d
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            HubUrl                                      = "https://lxmk.sharepoint.com";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "c.wall-adm@$OrganizationName";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "SITEPAGEPUBLISHING#0";
            TimeZoneId                                  = 13;
            Title                                       = "IT";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSite 203c4899-598c-4d53-805f-840e19d29eca
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "it@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "IT";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSite 222b23e3-eba8-4eda-9058-27a7afa9ac86
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "M365LicenseManagement@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "M365 License Management";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LicenseManagement";
        }
        SPOSite f9ad4d76-b10d-4f76-930e-175f91721643
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "c.wall-adm@$OrganizationName";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "SITEPAGEPUBLISHING#0";
            TimeZoneId                                  = 13;
            Title                                       = "Microsoft 365 learning pathways";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSite fe24fcbc-ddee-476f-8566-0243b3d87aa2
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "Mark8ProjectTeam@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Mark 8 Project Team";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSite 5b770644-7618-4d07-a66f-901563aedba8
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "c.wall-adm@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "TEAMCHANNEL#1";
            TimeZoneId                                  = 13;
            Title                                       = "Mark 8 Project Team - Test Private";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSite 925c07f5-cc5a-48be-ba30-9005eb3f5b9c
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            HubUrl                                      = "https://lxmk.sharepoint.com";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "c.wall-adm@$OrganizationName";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "SITEPAGEPUBLISHING#0";
            TimeZoneId                                  = 13;
            Title                                       = "Marketing";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSite 981e5ab9-ee21-4169-961e-a8d5eff51060
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "marketing@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Marketing";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSite be612a7f-13d1-48a1-b5e9-14a781e974b6
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "MeetingMinutes@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25559040;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Meeting Minutes";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSite d1125048-d37d-4928-9345-4c2035805076
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "PowerAppTeam@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 1048576;
            StorageWarningLevel                         = 1022361;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "PowerApp Team";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSite 5ca2f7e9-3a7a-4ff6-9ad9-923a51341044
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "privatecommunity@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Private Community";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSite 15b122c0-ade7-4343-aaa4-a2ffb661961c
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            HubUrl                                      = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "ProjectSite@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25559040;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Project Site";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSite a48cfd6d-da4f-455c-a047-2ae3efbb810f
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "PSGroup1@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 1048576;
            StorageWarningLevel                         = 1022361;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "PSGroup1";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSite 1ac5622e-3b13-49b4-a445-0cabc62744a2
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "PSGroup2@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 1048576;
            StorageWarningLevel                         = 1022361;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "PSGroup2";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSite 27613548-870b-4ed6-bd86-56190b4ecc2e
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "PSGroup3@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 1048576;
            StorageWarningLevel                         = 1022361;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "PSGroup3";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSite a1532abb-29c1-4049-bd27-99e664d7dd8f
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "RecommendationsSite@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 204800;
            StorageWarningLevel                         = 174080;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Recommendations Site";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RecommendationsSite";
        }
        SPOSite 8aea21af-b8fb-4042-bb91-062cc1d54f0c
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "RequestaGuest@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 1048576;
            StorageWarningLevel                         = 1022361;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Request a Guest";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSite 4a9fca97-add2-477f-8207-9731e1f204b6
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "Retail@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Retail";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSite 2d9206c3-43f9-4080-acdd-26739c1c8de6
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "SalesandMarketing@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Sales and Marketing";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSite a55d7803-811a-49f3-a4c3-c63091f6931f
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "SampleTeamSite@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Sample Team Site";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSite d0b5db99-436a-45ab-b517-c547ed872b77
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "SCAProjects@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "SCA Projects";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSite e40eb788-fe52-4671-95a8-0d0197a96beb
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "ServiceAngebot@$OrganizationName";
            SharingCapability                           = "ExternalUserAndGuestSharing";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "ServiceAngebot";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSite 7cde4632-f54d-494e-9178-2a42c58a11fa
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            HubUrl                                      = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "TestProject1@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25559040;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Test Project 1";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSite 493ff6df-3362-470a-b985-f8309b8ce50c
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "test-security_group@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "Test-Security_Group";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSite 416d4a31-dcae-4c63-9663-fc1a2a3e71ed
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            HubUrl                                      = "https://lxmk.sharepoint.com";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "c.wall-adm@$OrganizationName";
            SharingCapability                           = "Disabled";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "SITEPAGEPUBLISHING#0";
            TimeZoneId                                  = 13;
            Title                                       = "Training";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSite a612c098-40f9-496b-b93e-bcca1d4da09b
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "TU-PProjekt@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "TU-P Projekt";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TU-PProjekt";
        }
        SPOSite a052280e-43e9-426e-b403-6366e9299877
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "AdeleV@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "TEAMCHANNEL#1";
            TimeZoneId                                  = 13;
            Title                                       = "TU-P Projekt - Geschäftsführung";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TU-PProjekt-Geschftsfhrung";
        }
        SPOSite daed9320-80c6-4fb0-aa4b-8ba3dff2e20d
        {
            AllowSelfServiceUpgrade                     = $True;
            AnonymousLinkExpirationInDays               = 0;
            CommentsOnSitePagesDisabled                 = $False;
            Credential                                  = $Credscredential;
            DefaultLinkPermission                       = "None";
            DefaultSharingLinkType                      = "None";
            DenyAddAndCustomizePages                    = $True;
            DisableAppViews                             = "NotDisabled";
            DisableCompanyWideSharingLinks              = "NotDisabled";
            DisableFlows                                = $False;
            Ensure                                      = "Present";
            LocaleId                                    = 1033;
            OverrideTenantAnonymousLinkExpirationPolicy = $False;
            Owner                                       = "U.S.Sales@$OrganizationName";
            SharingCapability                           = "ExternalUserSharingOnly";
            ShowPeoplePickerSuggestionsForGuestUsers    = $False;
            SocialBarOnSitePagesDisabled                = $False;
            StorageMaximumLevel                         = 26214400;
            StorageWarningLevel                         = 25574400;
            Template                                    = "GROUP#0";
            TimeZoneId                                  = 13;
            Title                                       = "U.S. Sales";
            Url                                         = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteAuditSettings ff70c3ea-b5df-416c-b0b3-e5fa85114742
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteAuditSettings 18cc9329-2239-469b-814c-224dc4863873
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/search";
        }
        SPOSiteAuditSettings de10426b-c154-46b3-a7b4-5908bb70d3cf
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSiteAuditSettings cb2e43a8-87f0-48b2-a37b-8c089f62ea6f
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1082-00000356PhnixIntern";
        }
        SPOSiteAuditSettings d257735c-d030-4e7b-8a1c-2a87f1d2f7f3
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteAuditSettings b9915ff3-879c-4d48-b626-3ae05f3c32a1
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSiteAuditSettings 6b68cd93-eae6-4ec9-a2a6-c814c2a2a73d
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/appcatalog";
        }
        SPOSiteAuditSettings e0180d9f-5f25-4d44-82f4-2b929a6045ff
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSiteAuditSettings 2bf73ed8-ae79-4057-8b41-635f153c3af3
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSiteAuditSettings 3730541e-aa06-4437-bc64-cb52a0fd28e8
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSiteAuditSettings 734bbc32-b830-4362-905a-a89b8b8e7294
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSiteAuditSettings f77c5862-d761-426c-86e7-0d5159b7aab2
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSiteAuditSettings 8177c980-18f0-4c7c-8a43-8fff535787be
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSiteAuditSettings 3a6b74f5-01e0-4945-83e8-9765b5b6b0cd
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteAuditSettings 86fc1139-1a83-4f36-8679-d69dd0327a25
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSiteAuditSettings 2921f68a-2440-4dd6-b9bd-f4b0f558111a
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSiteAuditSettings 959d7da1-62a2-40be-b8d9-3591c0e532c8
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSiteAuditSettings 36a70361-f4d7-4d8f-8bba-f62409d4dfcd
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSiteAuditSettings c832fb0f-5a28-4d65-a8ae-1ea057ce5028
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSiteAuditSettings 97261a84-0cdc-41f6-b96b-cbf153cc15f3
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteAuditSettings 30e00ec3-3af0-44c4-b994-d55cd770e936
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteAuditSettings b6679867-1859-4183-ab89-910572145352
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSiteAuditSettings 13273b58-6e42-4abe-9741-a66553091321
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSiteAuditSettings 5598b8de-c88f-4ba0-8bbe-79ec140d81d3
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSiteAuditSettings 1034b993-8169-4abc-b61a-dfae33ae4396
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSiteAuditSettings 3ff9e275-1c73-42c2-8b21-3c31ac297983
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSiteAuditSettings 4486c295-0e95-47c0-a0fb-21b593f7e215
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSiteAuditSettings a9a0fa6c-21b5-440b-b2d8-209ce0e86855
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteAuditSettings d173f52d-852e-425a-8f76-8b9d101b4ca8
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSiteAuditSettings 0e61912f-0b8c-421a-81a9-02f7a76d4137
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSiteAuditSettings 7eaee80b-f2aa-498b-8d21-0acf8544d960
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSiteAuditSettings 8907fa8f-ca94-465f-a5a4-6a4192ccfc1f
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSiteAuditSettings 473dd567-bdcd-4aec-9aa2-f5b2a6356216
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSiteAuditSettings 5915ed13-bc34-448f-b8dc-0c1ff79a0143
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSiteAuditSettings 1eefbb0c-4403-44e8-af8f-4104d76e170d
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSiteAuditSettings ff326d52-e8dd-4613-a90a-15d01fc6f208
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSiteAuditSettings dddeceb0-3f5e-4490-b4c9-0bdcae68201b
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteAuditSettings 2322ff22-3c18-4df4-9127-3a46feb1c05b
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSiteAuditSettings 2e0f469d-8ae1-4527-9de2-bf11367c369b
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSiteAuditSettings 52bfd6b0-6cdf-44ad-838b-e46f19c6eb8e
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSiteAuditSettings 2816bc3b-6e4d-4df5-a13f-e54f84a46f45
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteAuditSettings d8bad062-6327-48e1-8d72-20d1a67010fb
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://lxmk-my.sharepoint.com/";
        }
        SPOSiteGroup 39c6ddd6-f989-4746-84b2-629c354c47c2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Communication site Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 39946429-fba6-4375-af0a-f7f1a4422288
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Communication site Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 37188ae6-ccae-46c7-b312-1d7b103ef4b6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Communication site Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 82b23be5-7a0e-475b-9d71-d5d24a558ba1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharePointHome OrgLinks Admins";
            PermissionLevels     = @("Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 3f5486e4-c593-4bae-a8c3-13734b02b6ba
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharePointHome OrgLinks Editors";
            PermissionLevels     = @("Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 4e927676-1624-4dbf-b108-8c0b49edeffe
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharePointHome OrgLinks Viewers";
            PermissionLevels     = @("Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 69616b12-976c-44ef-96e9-aef46c5b8bf5
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Members";
            PermissionLevels     = @("Contribute");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/search";
        }
        SPOSiteGroup c3b649c4-1717-4166-b701-1321ce4e4a40
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/search";
        }
        SPOSiteGroup 574d614c-c3b5-41bd-a6a4-8ea52bafb16f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/search";
        }
        SPOSiteGroup 7b0bff43-3cbc-4b55-903e-9d5f440e088e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSiteGroup 71095ed7-ff59-4bb3-9218-6d020bebdfb9
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSiteGroup 1d4e97e9-aee9-49fb-be0b-d9ee4553dce3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSiteGroup d9d41811-2fc0-4811-b909-ddd58516c725
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Classic Team Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteGroup 2f5d57de-2f0c-4896-80c3-a3d4cce51e92
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Classic Team Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteGroup 20eecf69-81d7-4c40-8c93-f9f78ef1cc5c
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Classic Team Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteGroup d2124c19-7ed9-4737-8771-098761a5fa8b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Excel Services Viewers";
            PermissionLevels     = @("View Only");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteGroup a1678bc9-d4b5-492f-a583-bd145611102c
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Angebote Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSiteGroup 071071a6-22e6-45d2-a50e-d46bd57c4e8f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Angebote Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSiteGroup 7ca8fb92-3ab5-4462-9832-1c848c648436
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Angebote Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSiteGroup 9713daf2-f651-4865-9eef-323147bc2e4a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ChatBot Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSiteGroup 17a42df1-d64e-4ebc-8521-2b6a20d70993
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ChatBot Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSiteGroup 9d4b111c-4354-4668-970c-ed942c74e590
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ChatBot Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSiteGroup 22ccfe45-20a4-4853-b26e-c618c7b1b190
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Content Center Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSiteGroup 483365f8-9b4d-4b11-8076-ceeff9b6229e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Content Center Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSiteGroup 38fb6742-9ce1-4994-ae9c-ecbad2fbf429
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Content Center Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSiteGroup 39da791d-ab17-4aa9-96f2-11f6fb817d55
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Digital Initiative Public Relations Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSiteGroup 022db538-7a05-4ec5-abca-5383f501983a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Digital Initiative Public Relations Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSiteGroup 01648f61-9275-4eff-829e-1a80d0112292
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Digital Initiative Public Relations Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSiteGroup e2598df0-77da-48e0-8237-ec4c594431ea
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Finance Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSiteGroup 05f86b70-7fcc-4ee2-a84e-61095b94142b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Finance Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSiteGroup 7a488e9d-6091-492e-9b29-53c80370120d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Finance Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSiteGroup c066c1f9-bde2-4029-ba04-20bebf804d2f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group1 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSiteGroup 3914a447-a663-4596-9bb3-b24b2decfe2a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group1 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSiteGroup cfd74180-6fb1-4856-b35c-9c53b231f0ea
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group1 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSiteGroup 8c71b793-3d58-4597-a50a-c756a070f93c
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group2 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSiteGroup d7d9300a-a193-438a-b366-8d89782b1d5b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group2 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSiteGroup 8094ce28-ee3e-4fbd-b43d-90a6eb77b737
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group2 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSiteGroup fd252907-f2e9-41ff-b0a3-cfc679e08877
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Project Hub Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup a1034040-f4be-48a3-a74f-b84c8d746471
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Project Hub Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup 36401e57-9ca4-4878-a089-3bc9c60e472a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Project Hub Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup e482e091-bf61-4955-a021-d61c3950261a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For List 9006f151-9861-4505-856a-6628fed2c96e";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup 459f3ad8-6451-457b-95aa-8b8000289a7b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For Web 3cadc78c-6a2d-4b91-80c1-289e707e47e8";
            PermissionLevels     = @("Web-Only Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup d39eeb1b-3de7-4c09-848c-04b2fbd0bd54
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.6ce3537e-7aca-49fd-b137-c22c26ec6ffd.OrganizationEdit.49b5bfa9-b118-42f6-b754-7e6665db0669";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup a48cafa3-0914-4c0c-8e01-e215c0c31fad
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Template Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSiteGroup f87f2d6d-a37f-438a-86f2-6d7450abe1ca
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Template Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSiteGroup 958539d0-8314-4010-b8ce-7e1ae6eb6f10
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Template Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSiteGroup 54d5c059-6900-4175-a02a-ea5a0024be9f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSiteGroup 3464daf3-1f65-42af-a8c9-0434f6a9534a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSiteGroup 9b7dd682-3718-45da-b9fb-4e1ac978a19d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSiteGroup ed30ebdf-8098-44fe-aa71-ac0a988c7f3f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSiteGroup 87d8a5e2-efbb-4627-8f16-4c4643c34166
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSiteGroup 13329823-144a-4ef9-a3d6-6e85f83b9839
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSiteGroup d75f3aab-ad74-4f4e-8f17-ec285199b4bf
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSiteGroup 1c991840-33bc-4d22-ac65-712d0f545e15
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSiteGroup e8339164-1148-475d-bccf-5e6545e47e1b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSiteGroup 886fa9d0-e05c-40ca-b39e-0179694588d0
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSiteGroup e1ba147c-05bb-4539-b501-48a23df58738
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSiteGroup f62b49c7-1988-4925-a21b-daff385a1f03
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSiteGroup 74209e08-0279-497c-b400-e144cca4b78b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For List ce92f2b7-5f9b-41e8-a5df-d00ffdfe190d";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup 9d18385b-c0bf-4516-8d62-8edcda0cb9ff
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For Web 95fdb75f-9a65-4016-9e8a-e86cc99fb301";
            PermissionLevels     = @("Web-Only Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup 0b4fa50e-c581-4293-a964-095550bb1982
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Microsoft 365 learning pathways Members";
            PermissionLevels     = @("Edit","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup 672a31ce-fd94-466b-8b5a-ec975d9bfea8
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Microsoft 365 learning pathways Owners";
            PermissionLevels     = @("Full Control","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup 824ee423-cc79-40e1-9eea-d75089249896
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Microsoft 365 learning pathways Visitors";
            PermissionLevels     = @("Read","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup fd15578c-8b59-43df-9da4-c46d4635179a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.54437daa-80d2-4e40-8431-6daac10e73a7.OrganizationEdit.038ce20f-cbbc-49b2-bddc-062190527dd3";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup 5db6064a-b996-4480-a4c9-e2ec041e1e19
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.58b87ad8-8c63-4959-96a2-a35329e3a518.OrganizationEdit.ebaa5752-0a95-4892-b67c-9c1f66c8c7b2";
            PermissionLevels     = @("Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup daf4c9ed-5a16-4843-a3c6-c15f32601eb4
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "external";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteGroup 1ec3c4c3-4f4e-4e2e-a612-3c98dc2e1907
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteGroup e890d492-6b84-4ff3-8bc9-8d7007a9969f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteGroup 3d83e5c9-ec9d-4431-8cd1-b5693f898361
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteGroup 215e80c6-2fc0-4ac2-a98e-16c4da3a7fea
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team - Test Private Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSiteGroup 0c11cc72-99cd-40ca-bc0e-4376a5c547a2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team - Test Private Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSiteGroup dd1d8f61-287f-4c49-b8cc-ce4155a0fb15
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team - Test Private Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSiteGroup 469303d2-c770-41cb-976f-11b29ae4b96a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSiteGroup 4b598023-6238-46ea-ab37-4e50275b7069
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Owners";
            PermissionLevels     = @("Full Control","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSiteGroup da5e4142-a29b-4b9e-9134-39f508cf0533
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSiteGroup 3e076da1-7027-4570-80ea-74704609c361
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSiteGroup c6da6b13-9d0d-4959-adf6-e7262dcc1665
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSiteGroup 0d11876b-8b01-464e-a47d-592dc4a3b9ff
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSiteGroup 9002c5c9-46c8-4997-b90e-d42284ca910e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Meeting Minutes Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSiteGroup 3df6790d-1aae-4485-ab36-4c060ea8e8c0
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Meeting Minutes Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSiteGroup 582c2bad-6214-4a8e-b226-ac5544135548
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Meeting Minutes Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSiteGroup f9ced14d-d2e8-4341-882e-b7c156c28f77
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PowerApp Team Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSiteGroup 0c242eb9-dd17-42d5-a149-162c07e4a36f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PowerApp Team Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSiteGroup f8393bbf-71b7-4d50-969b-a85605ff6db6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PowerApp Team Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSiteGroup 02bbb00f-4e7e-4561-abb5-badbeeef1c04
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Private Community Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSiteGroup 8e37ce28-d0d6-4900-ad29-7a2f5e8f9419
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Private Community Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSiteGroup 11f742a8-f30e-456e-8c05-b8333f5c6feb
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Private Community Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSiteGroup 0352d69c-af1d-4d6f-a498-1c1f474c3eed
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "External Members";
            PermissionLevels     = @("Contribute","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup 741f96e6-f398-445e-8164-762be851c575
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "External Visitors";
            PermissionLevels     = @("Read","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup 79edf7f7-32be-490f-82ce-87415912bd96
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Project Site Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup bef611d3-cff6-45eb-aaf8-218fecf4eb76
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Project Site Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup c96d5c16-6534-46e8-b666-f8c4f5f325d1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Project Site Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup 3e118288-132f-4da3-9bc1-329774e40515
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup1 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSiteGroup cb932414-236c-475c-b0a3-c3e805c278ad
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup1 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSiteGroup 77bbb63d-cf09-4c2b-8f24-46aebc4bfa03
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup1 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSiteGroup 6d456a46-41fd-4d1c-beaf-62e8fdd76dfb
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup2 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSiteGroup 5db77493-164a-4fd6-b691-e8935934eae1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup2 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSiteGroup 811790b4-97c7-426b-a31c-516fdcd781fb
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup2 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSiteGroup ac4a1e66-1d80-4687-82d6-9c2a14676a66
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup3 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSiteGroup 9d51f347-710a-4cb4-a5c2-8566ec287b97
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup3 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSiteGroup 44de79fa-73ac-4a85-88fd-07f21b2600fc
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup3 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSiteGroup d7f3ce45-3ba0-46db-980c-8d7388ae85c6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Request a Guest Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSiteGroup a6830d21-259b-4ee1-9fef-644a1d090436
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Request a Guest Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSiteGroup 413bfa9e-57b0-4c95-9694-dd55a57ca626
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Request a Guest Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSiteGroup 98dd56d9-f04e-45f4-ad9f-103f60664ae1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Retail Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSiteGroup ad1389f7-9087-4e40-9c6a-01e8f703b598
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Retail Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSiteGroup 0e7746b3-ea16-47b8-9628-36208d6363d3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Retail Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSiteGroup ea0e5cd2-d516-433d-bbdb-557269f17680
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sales and Marketing Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSiteGroup 841891db-246f-405e-9aff-f677236859c5
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sales and Marketing Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSiteGroup d0c6fc32-6978-4f29-b1a0-549a30a12aa4
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sales and Marketing Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSiteGroup 1e966bdd-3935-4270-a31b-879e45697327
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sample Team Site Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSiteGroup 8ddf1258-d0bd-4aa8-b1e4-3ac557943ff3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sample Team Site Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSiteGroup 592b0bb4-0b98-4a53-aa9f-bb012fbe1a7b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sample Team Site Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSiteGroup 5ada005d-cda1-4180-9ae5-d75a82c1e086
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSiteGroup 5921e3ae-229f-4173-8b77-c5f8e2919e53
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSiteGroup 341bcd0e-62d0-484d-830d-f96b6c12ef38
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSiteGroup add16d98-745b-4977-8199-e88bcbb01f82
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For List 718edc2c-6b20-4783-80ad-e5abb73fbb07";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup dba76d5f-2544-4976-9cfd-e32bcebf8e69
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For Web d6c22401-ae02-4f8b-983e-ef9f81e76496";
            PermissionLevels     = @("Web-Only Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 28b67960-534c-499f-8b45-bfc899b0020a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ServiceAngebot Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup bd6d0bdb-269f-4a7d-87cd-f40317e95720
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ServiceAngebot Owners";
            PermissionLevels     = @("Full Control","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup fb8b4309-506c-4c54-89eb-4643442cf04b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ServiceAngebot Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 11eae1e7-1b1b-464b-ae61-993610c2e123
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.bf0865d3-16bd-4b12-90d7-ed9b0e6e1ee0.AnonymousEdit.93625a46-cfe6-40fe-9a29-f4e28377afcf";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 95901bca-d4c2-4fea-95a3-4a6603390a76
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.e69fc8ad-9a52-4b40-b95d-8810b48ddcd5.OrganizationEdit.b54ed27e-2f2d-4580-ba15-7def3e6066cf";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 0c2ebee3-fdf6-4228-9d1a-9fe2fc1dadb1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.f22e8dee-c64e-4035-ba15-2d0d1da6728e.AnonymousEdit.6c3dbe84-e2a3-4439-9991-2bb3a3322684";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 6d9aa713-d0a0-4d37-aab7-73a7836ac0f3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test Project 1 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSiteGroup 9d1cd32e-b250-4690-9a83-21cbf0d8b4b5
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test Project 1 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSiteGroup e79f1c5a-a842-4001-8f48-3906a9c11d0f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test Project 1 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSiteGroup d36d4f8a-4920-4523-b674-c848f58776a4
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test-Security_Group Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSiteGroup 027c36c9-23cc-474d-8ef7-ec5ef7009a3f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test-Security_Group Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSiteGroup 793d8e9b-fd71-436e-91bd-71f70daa2bb2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test-Security_Group Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSiteGroup 27baba68-3a47-410c-ac46-c11faf808a09
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Training Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSiteGroup 44c71721-4eea-4fa1-adaa-6cf2f7b10459
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Training Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSiteGroup 5498209b-4e1e-4743-ab66-433c1513334b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Training Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSiteGroup c5948ace-13de-4026-aa5f-7b26c17e8615
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "U.S. Sales Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteGroup aa53b4e5-bb40-41dd-83d3-d69dc1e876db
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "U.S. Sales Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteGroup 3ce41081-0de9-4ea6-bf84-86297e7c6c72
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "U.S. Sales Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteGroup 65953712-3373-478c-9405-c806fc732a6f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Members";
            PermissionLevels     = @("Contribute");
            Url                  = "https://$($OrganizationName.Split('.')[0])-my.sharepoint.com/";
        }
        SPOSiteGroup 58909ca6-5b35-4d5a-a574-241abc9ef15b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0])-my.sharepoint.com/";
        }
        SPOSiteGroup 129eb3ae-5174-44b2-9a9f-f3c2899df04b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0])-my.sharepoint.com/";
        }
        SPOStorageEntity fd5c6e63-3afc-4f63-bbb7-1916f2ff652b
        {
            Credential           = $Credscredential;
            Description          = "CDN source for Microsoft Content";
            Ensure               = "Present";
            EntityScope          = "Tenant";
            Key                  = "MicrosoftCustomLearningCdn";
            SiteUrl              = "https://$($OrganizationName.Split('.')[0])-admin.sharepoint.com";
            Value                = "https://pnp.github.io/custom-learning-office-365/learningpathways/";
        }
        SPOStorageEntity ce8a90cf-3050-4377-b036-a3fdd1d85301
        {
            Credential           = $Credscredential;
            Description          = "Custom Learning Site Collection";
            Ensure               = "Present";
            EntityScope          = "Tenant";
            Key                  = "MicrosoftCustomLearningSite";
            SiteUrl              = "https://$($OrganizationName.Split('.')[0])-admin.sharepoint.com";
            Value                = "/sites/M365LP";
        }
        SPOStorageEntity cdd6b17f-4f9e-4039-8c26-82877e78d983
        {
            Credential           = $Credscredential;
            Description          = "Custom Learning Telemetry Collection";
            Ensure               = "Present";
            EntityScope          = "Tenant";
            Key                  = "MicrosoftCustomLearningTelemetryOn";
            SiteUrl              = "https://$($OrganizationName.Split('.')[0])-admin.sharepoint.com";
            Value                = "true";
        }
        SPOTenantCdnEnabled 5353d0aa-9b9b-4834-acc0-27b7bfb0f24b
        {
            CdnType              = "Public";
            Credential           = $Credscredential;
            Enable               = $False;
        }
        SPOTenantCdnEnabled 9fb12f2c-493b-480b-9080-941772ce84b0
        {
            CdnType              = "Private";
            Credential           = $Credscredential;
            Enable               = $False;
        }
        SPOTenantCdnPolicy 3992109b-9443-4e48-9950-7ae2f82580ad
        {
            CDNType                              = "Public";
            Credential                           = $Credscredential;
            ExcludeRestrictedSiteClassifications = @();
            IncludeFileExtensions                = @();
        }
        SPOTenantCdnPolicy 179ca22e-1fa5-4fe3-9989-2316c9217f2f
        {
            CDNType                              = "Private";
            Credential                           = $Credscredential;
            ExcludeRestrictedSiteClassifications = @();
            IncludeFileExtensions                = @();
        }
        SPOTenantSettings ccf71ca9-0b42-4d63-bf1e-4e2d0e02278f
        {
            ApplyAppEnforcedRestrictionsToAdHocRecipients = $True;
            ConditionalAccessPolicy                       = "AllowFullAccess";
            Credential                                    = $Credscredential;
            Ensure                                        = "Present";
            FilePickerExternalImageSearchEnabled          = $True;
            HideDefaultThemes                             = $False;
            IsSingleInstance                              = "Yes";
            LegacyAuthProtocolsEnabled                    = $True;
            MarkNewFilesSensitiveByDefault                = "AllowExternalSharing";
            MaxCompatibilityLevel                         = "15";
            MinCompatibilityLevel                         = "15";
            NotificationsInSharePointEnabled              = $True;
            OfficeClientADALDisabled                      = $False;
            OwnerAnonymousNotification                    = $True;
            PublicCdnAllowedFileTypes                     = "CSS,EOT,GIF,ICO,JPEG,JPG,JS,MAP,PNG,SVG,TTF,WOFF";
            PublicCdnEnabled                              = $False;
            SearchResolveExactEmailOrUPN                  = $False;
            SignInAccelerationDomain                      = "";
            UseFindPeopleInPeoplePicker                   = $False;
            UsePersistentCookiesForExplorerView           = $False;
            UserVoiceForFeedbackEnabled                   = $True;
        }
        SPOUserProfileProperty 36014da3-12c5-4039-bcd0-f6cf48418021
        {
            Credential           = $Credscredential;
            Properties           = @(
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserProfile_GUID'
                Value = 'a50aca1e-5de9-41ff-90c9-d4df9b67d787'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SID'
                Value = 'i:0h.f|membership|10032001d2ea487c@live.com'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'ADGuid'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AccountName'
                Value = 'i:0#.f|membership|adelev@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'FirstName'
                Value = 'Adele'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticFirstName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'LastName'
                Value = 'Vance'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticLastName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredName'
                Value = 'Adele Vance'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticDisplayName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkPhone'
                Value = '+1 425 555 0109'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Department'
                Value = 'Retail'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Title'
                Value = 'Retail Manager'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Department'
                Value = 'Retail'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Manager'
                Value = 'i:0#.f|membership|c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AboutMe'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PersonalSpace'
                Value = '/personal/adelev_lxmk_onmicrosoft_com/'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PictureURL'
                Value = 'https://lxmk-my.sharepoint.com:443/User%20Photos/Profile%20Pictures/adelev_lxmk_onmicrosoft_com_MThumb.jpg'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserName'
                Value = 'AdeleV@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'QuickLinks'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WebSite'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PublicSiteRedirect'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-JobTitle'
                Value = 'Retail Manager'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Dotted-line'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Peers'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Responsibility'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SipAddress'
                Value = 'AdeleV@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MySiteUpgrade'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ProxyAddresses'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HireDate'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DisplayOrder'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimID'
                Value = 'AdeleV@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderID'
                Value = 'membership'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceSID'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MasterAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserPrincipalName'
                Value = 'AdeleV@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-O15FirstRunExperience'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteInstantiationState'
                Value = '2'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DistinguishedName'
                Value = 'CN=dfcdd32f-ee8d-486c-8c15-24f7d878a8ea,OU=30682b55-8271-4354-a7ac-dfdd6ac173f3,OU=Tenants,OU=MSOnline,DC=SPODS187849,DC=msft,DC=net'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SourceObjectDN'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderType'
                Value = 'Forms'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedAccountName'
                Value = 'i:0#.f|membership|adelev@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedSID'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ObjectExists'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteCapabilities'
                Value = '4'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationTime'
                Value = '1/24/2022 1:14:58 PM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteLastCreationTime'
                Value = '1/24/2022 1:14:58 PM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteNumberOfRetries'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationError'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-FeedIdentifier'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkEmail'
                Value = 'AdeleV@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'CellPhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Fax'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'HomePhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Office'
                Value = '18/2111'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Location'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Assistant'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PastProjects'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Skills'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-School'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Birthday'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-StatusNotes'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Interests'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HashTags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-EmailOptin'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyPeople'
                Value = 'True'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyActivity'
                Value = '4095'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureTimestamp'
                Value = '63784333079'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PicturePlaceholderState'
                Value = '0'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureExchangeSyncState'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TimeZone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'OfficeGraphEnabled'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserType'
                Value = '0'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HideFromAddressLists'
                Value = 'False'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-RecipientTypeDetails'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'DelveFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'VideoUserPopup'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'msOnline-ObjectId'
                Value = 'dfcdd32f-ee8d-486c-8c15-24f7d878a8ea'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PointPublishingUrl'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TenantInstanceId'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SharePointHomeExperienceState'
                Value = '18353153'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MultiGeoFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredDataLocation'
                Value = ''
            }
            );
            UserName             = "AdeleV@$OrganizationName";
        }
        SPOUserProfileProperty 9cb1553b-350b-445e-a9bb-379ed62801d0
        {
            Credential           = $Credscredential;
            Properties           = @(
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserProfile_GUID'
                Value = '8e4a546b-4ee7-4c61-8c3c-9636dd4d0cc4'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SID'
                Value = 'i:0h.f|membership|10032001d2d920e0@live.com'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'ADGuid'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AccountName'
                Value = 'i:0#.f|membership|c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'FirstName'
                Value = 'Christopher'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticFirstName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'LastName'
                Value = 'Wall'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticLastName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredName'
                Value = 'Christopher Wall'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticDisplayName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkPhone'
                Value = '4901733431897'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Department'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Title'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Department'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Manager'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AboutMe'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PersonalSpace'
                Value = '/personal/c_wall-adm_lxmk_onmicrosoft_com/'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PictureURL'
                Value = 'https://lxmk-my.sharepoint.com:443/User%20Photos/Profile%20Pictures/c6351057-0d88-454e-abde-bdef47695180_MThumb.jpg'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserName'
                Value = 'c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'QuickLinks'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WebSite'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PublicSiteRedirect'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-JobTitle'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DataSource'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MemberOf'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Dotted-line'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Peers'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Responsibility'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SipAddress'
                Value = 'c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MySiteUpgrade'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DontSuggestList'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ProxyAddresses'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HireDate'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DisplayOrder'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimID'
                Value = 'c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderID'
                Value = 'membership'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-LastColleagueAdded'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-OWAUrl'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceSID'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MasterAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserPrincipalName'
                Value = 'c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-O15FirstRunExperience'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteInstantiationState'
                Value = '2'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DistinguishedName'
                Value = 'CN=c6351057-0d88-454e-abde-bdef47695180,OU=30682b55-8271-4354-a7ac-dfdd6ac173f3,OU=Tenants,OU=MSOnline,DC=SPODS187849,DC=msft,DC=net'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SourceObjectDN'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-LastKeywordAdded'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderType'
                Value = 'Forms'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedAccountName'
                Value = 'i:0#.f|membership|c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedSID'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ObjectExists'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteCapabilities'
                Value = '4'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationTime'
                Value = '2/3/2022 1:06:55 PM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteLastCreationTime'
                Value = '2/3/2022 1:06:55 PM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteNumberOfRetries'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationError'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-FeedIdentifier'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkEmail'
                Value = 'c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'CellPhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Fax'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'HomePhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Office'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Location'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Assistant'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PastProjects'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Skills'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-School'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Birthday'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-StatusNotes'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Interests'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HashTags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-EmailOptin'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyPeople'
                Value = 'True'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyActivity'
                Value = '4095'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureTimestamp'
                Value = '63779820394'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PicturePlaceholderState'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureExchangeSyncState'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MUILanguages'
                Value = 'en-US'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ContentLanguages'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TimeZone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-RegionalSettings-FollowWeb'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Locale'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-CalendarType'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-AltCalendarType'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-AdjustHijriDays'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ShowWeeks'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-WorkDays'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-WorkDayStartHour'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-WorkDayEndHour'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Time24'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-FirstDayOfWeek'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-FirstWeekOfYear'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-RegionalSettings-Initialized'
                Value = 'True'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'OfficeGraphEnabled'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserType'
                Value = '0'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HideFromAddressLists'
                Value = 'False'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-RecipientTypeDetails'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'DelveFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'VideoUserPopup'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PulseMRUPeople'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'msOnline-ObjectId'
                Value = 'c6351057-0d88-454e-abde-bdef47695180'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PointPublishingUrl'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TenantInstanceId'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SharePointHomeExperienceState'
                Value = '17304577'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-RefreshToken'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MultiGeoFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredDataLocation'
                Value = ''
            }
            );
            UserName             = "c.wall-adm@$OrganizationName";
        }
        SPOUserProfileProperty 6ee09f5e-54c1-46a1-baa3-bcd29fff3bae
        {
            Credential           = $Credscredential;
            Properties           = @(
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserProfile_GUID'
                Value = '119bf844-afcc-4673-b93f-73a80cac2460'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SID'
                Value = 'i:0h.f|membership|10032001faff46a4@live.com'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'ADGuid'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AccountName'
                Value = 'i:0#.f|membership|i.islamaj@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'FirstName'
                Value = 'Idlir'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticFirstName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'LastName'
                Value = 'Islamaj'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticLastName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredName'
                Value = 'Idlir Islamaj'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticDisplayName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkPhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Department'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Title'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Department'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Manager'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AboutMe'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PersonalSpace'
                Value = '/personal/i_islamaj_lxmk_onmicrosoft_com/'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PictureURL'
                Value = 'https://lxmk-my.sharepoint.com:443/User%20Photos/Profile%20Pictures/i_islamaj_lxmk_onmicrosoft_com_MThumb.jpg'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserName'
                Value = 'i.islamaj@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'QuickLinks'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WebSite'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PublicSiteRedirect'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-JobTitle'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Dotted-line'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Peers'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Responsibility'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SipAddress'
                Value = 'i.islamaj@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MySiteUpgrade'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ProxyAddresses'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HireDate'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DisplayOrder'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimID'
                Value = 'i.islamaj@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderID'
                Value = 'membership'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceSID'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MasterAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserPrincipalName'
                Value = 'i.islamaj@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-O15FirstRunExperience'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteInstantiationState'
                Value = '2'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DistinguishedName'
                Value = 'CN=f14565a2-b278-40cc-b362-f31754fc791a,OU=30682b55-8271-4354-a7ac-dfdd6ac173f3,OU=Tenants,OU=MSOnline,DC=SPODS187849,DC=msft,DC=net'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SourceObjectDN'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderType'
                Value = 'Forms'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedAccountName'
                Value = 'i:0#.f|membership|i.islamaj@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedSID'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ObjectExists'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteCapabilities'
                Value = '4'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationTime'
                Value = '5/17/2022 12:06:14 PM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteLastCreationTime'
                Value = '5/17/2022 12:06:14 PM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteNumberOfRetries'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationError'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-FeedIdentifier'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkEmail'
                Value = 'i.islamaj@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'CellPhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Fax'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'HomePhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Office'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Location'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Assistant'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PastProjects'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Skills'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-School'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Birthday'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-StatusNotes'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Interests'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HashTags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-EmailOptin'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyPeople'
                Value = 'True'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyActivity'
                Value = '4095'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureTimestamp'
                Value = '63788904312'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PicturePlaceholderState'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureExchangeSyncState'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TimeZone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'OfficeGraphEnabled'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserType'
                Value = '0'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HideFromAddressLists'
                Value = 'False'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-RecipientTypeDetails'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'DelveFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'VideoUserPopup'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'msOnline-ObjectId'
                Value = 'f14565a2-b278-40cc-b362-f31754fc791a'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PointPublishingUrl'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TenantInstanceId'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SharePointHomeExperienceState'
                Value = '17304577'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MultiGeoFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredDataLocation'
                Value = ''
            }
            );
            UserName             = "i.islamaj@$OrganizationName";
        }
        SPOUserProfileProperty 21f4307e-5039-4c16-8c09-8dc8fd66943b
        {
            Credential           = $Credscredential;
            Properties           = @(
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserProfile_GUID'
                Value = 'c593ade3-9910-4b56-8053-8ff8a0dd4757'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SID'
                Value = 'i:0h.f|membership|10032001d2eb1262@live.com'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'ADGuid'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AccountName'
                Value = 'i:0#.f|membership|leeg@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'FirstName'
                Value = 'Lee'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticFirstName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'LastName'
                Value = 'Gu'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticLastName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredName'
                Value = 'Lee Gu'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticDisplayName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkPhone'
                Value = '+1 913 555 0101'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Department'
                Value = 'Manufacturing'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Title'
                Value = 'Director'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Department'
                Value = 'Manufacturing'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Manager'
                Value = 'i:0#.f|membership|c.wall-adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AboutMe'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PersonalSpace'
                Value = '/personal/leeg_lxmk_onmicrosoft_com/'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PictureURL'
                Value = 'https://lxmk-my.sharepoint.com:443/User%20Photos/Profile%20Pictures/f08e543e-11a0-47c0-8840-f56ec0ea27fa_MThumb.jpg'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserName'
                Value = 'LeeG@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'QuickLinks'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WebSite'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PublicSiteRedirect'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-JobTitle'
                Value = 'Director'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Dotted-line'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Peers'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Responsibility'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SipAddress'
                Value = 'f08e543e11a047c08840f56ec0ea27faleeg@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MySiteUpgrade'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ProxyAddresses'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HireDate'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DisplayOrder'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimID'
                Value = 'LeeG@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderID'
                Value = 'membership'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceSID'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MasterAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserPrincipalName'
                Value = 'LeeG@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-O15FirstRunExperience'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteInstantiationState'
                Value = '2'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DistinguishedName'
                Value = 'CN=f08e543e-11a0-47c0-8840-f56ec0ea27fa,OU=30682b55-8271-4354-a7ac-dfdd6ac173f3,OU=Tenants,OU=MSOnline,DC=SPODS187849,DC=msft,DC=net'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SourceObjectDN'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderType'
                Value = 'Forms'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedAccountName'
                Value = 'i:0#.f|membership|leeg@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedSID'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ObjectExists'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteCapabilities'
                Value = '4'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationTime'
                Value = '1/24/2022 1:14:39 PM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteLastCreationTime'
                Value = '1/24/2022 1:14:39 PM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteNumberOfRetries'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationError'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-FeedIdentifier'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkEmail'
                Value = 'LeeG@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'CellPhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Fax'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'HomePhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Office'
                Value = '23/3101'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Location'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Assistant'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PastProjects'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Skills'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-School'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Birthday'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-StatusNotes'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Interests'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HashTags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-EmailOptin'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyPeople'
                Value = 'True'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyActivity'
                Value = '4095'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureTimestamp'
                Value = '63796336803'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PicturePlaceholderState'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureExchangeSyncState'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TimeZone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'OfficeGraphEnabled'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserType'
                Value = '0'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HideFromAddressLists'
                Value = 'False'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-RecipientTypeDetails'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'DelveFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'VideoUserPopup'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'msOnline-ObjectId'
                Value = 'f08e543e-11a0-47c0-8840-f56ec0ea27fa'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PointPublishingUrl'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TenantInstanceId'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SharePointHomeExperienceState'
                Value = '1024'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MultiGeoFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredDataLocation'
                Value = ''
            }
            );
            UserName             = "LeeG@$OrganizationName";
        }
        SPOUserProfileProperty 5f4bf1ec-9943-49b4-acb9-4ae75f91f77d
        {
            Credential           = $Credscredential;
            Properties           = @(
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserProfile_GUID'
                Value = '705a14d0-ed22-4c2e-80bf-58c2b2b4a63f'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SID'
                Value = 'i:0h.f|membership|100320026e1e8f32@live.com'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'ADGuid'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AccountName'
                Value = 'i:0#.f|membership|t.gust_adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'FirstName'
                Value = 'Thorsten'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticFirstName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'LastName'
                Value = 'Gust'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticLastName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredName'
                Value = 'Thorsten Gust'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PhoneticDisplayName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkPhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Department'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Title'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Department'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Manager'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'AboutMe'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PersonalSpace'
                Value = '/personal/t_gust_adm_lxmk_onmicrosoft_com/'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PictureURL'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'UserName'
                Value = 't.gust_adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'QuickLinks'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WebSite'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PublicSiteRedirect'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-JobTitle'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Dotted-line'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Peers'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Responsibility'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SipAddress'
                Value = 't.gust_adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MySiteUpgrade'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ProxyAddresses'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HireDate'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DisplayOrder'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimID'
                Value = 't.gust_adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderID'
                Value = 'membership'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceSID'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ResourceAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MasterAccountName'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserPrincipalName'
                Value = 't.gust_adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-O15FirstRunExperience'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteInstantiationState'
                Value = '2'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-DistinguishedName'
                Value = 'CN=fa048090-45f3-4482-8b68-a7769db1b30e,OU=30682b55-8271-4354-a7ac-dfdd6ac173f3,OU=Tenants,OU=MSOnline,DC=SPODS187849,DC=msft,DC=net'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SourceObjectDN'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ClaimProviderType'
                Value = 'Forms'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedAccountName'
                Value = 'i:0#.f|membership|t.gust_adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SavedSID'
                Value = 'System.Byte[]'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-ObjectExists'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteCapabilities'
                Value = '4'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationTime'
                Value = '1/30/2023 10:15:29 AM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteLastCreationTime'
                Value = '1/30/2023 10:15:29 AM'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteNumberOfRetries'
                Value = '1'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PersonalSiteFirstCreationError'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-FeedIdentifier'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'WorkEmail'
                Value = 't.gust_adm@$OrganizationName'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'CellPhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Fax'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'HomePhone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Office'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Location'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'Assistant'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PastProjects'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Skills'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-School'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Birthday'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-StatusNotes'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-Interests'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HashTags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-EmailOptin'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyPeople'
                Value = 'True'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PrivacyActivity'
                Value = '4095'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureTimestamp'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PicturePlaceholderState'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PictureExchangeSyncState'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TimeZone'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'OfficeGraphEnabled'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-UserType'
                Value = '0'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-HideFromAddressLists'
                Value = 'False'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-RecipientTypeDetails'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'DelveFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'VideoUserPopup'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'msOnline-ObjectId'
                Value = 'fa048090-45f3-4482-8b68-a7769db1b30e'
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-PointPublishingUrl'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-TenantInstanceId'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-SharePointHomeExperienceState'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'SPS-MultiGeoFlags'
                Value = ''
            }
             MSFT_SPOUserProfilePropertyInstance
             {
                Key   = 'PreferredDataLocation'
                Value = ''
            }
            );
            UserName             = "t.gust_adm@$OrganizationName";
        }
    }
}

M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -Credential $Credential

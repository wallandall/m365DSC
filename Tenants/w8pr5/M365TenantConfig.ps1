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
        SPOAccessControlSettings 535fe320-aa60-4871-b0c3-c090689406f6
        {
            CommentsOnSitePagesDisabled  = $True;
            Credential                   = $Credscredential;
            DisallowInfectedFileDownload = $True;
            DisplayStartASiteOption      = $True;
            EmailAttestationReAuthDays   = 30;
            EmailAttestationRequired     = $True;
            Ensure                       = "Present";
            ExternalServicesEnabled      = $True;
            IPAddressAllowList           = "";
            IPAddressEnforcement         = $True;
            IPAddressWACTokenLifetime    = 15;
            IsSingleInstance             = "Yes";
            SocialBarOnSitePagesDisabled = $False;
        }
        SPOBrowserIdleSignout 14dfe9ef-d93a-43af-a9b7-4509e72ca396
        {
            Credential           = $Credscredential;
            Enabled              = $False;
            IsSingleInstance     = "Yes";
            SignOutAfter         = "00:00:00";
            WarnAfter            = "00:00:00";
        }
        SPOHomeSite fdbfd717-287e-4481-9afb-19d433b68d43
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            IsSingleInstance     = "Yes";
            Url                  = "https://lxmk.sharepoint.com";
        }
        SPOHubSite 3dadfd1e-0758-46be-ab49-27214343a7b9
        {
            AllowedToJoin        = @("c.wall-adm@$OrganizationName");
            Credential           = $Credscredential;
            Ensure               = "Present";
            RequiresJoinApproval = $False;
            SiteDesignId         = "00000000-0000-0000-0000-000000000000";
            Title                = "HKM Project Hub";
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOHubSite bb49faec-2d9e-46b0-a749-ecbb96b6acee
        {
            AllowedToJoin        = @("c.wall-adm@$OrganizationName");
            Credential           = $Credscredential;
            Ensure               = "Present";
            RequiresJoinApproval = $False;
            SiteDesignId         = "00000000-0000-0000-0000-000000000000";
            Title                = "Intranet";
            Url                  = "https://lxmk.sharepoint.com";
        }
        SPOSharingSettings cd9e3071-e03f-4663-8d85-e4a20d888294
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
        SPOSite b4221759-0b9d-49f5-b974-0545baa53766
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
        SPOSite f638263f-0760-474f-8ee2-ab26650f8b02
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
        SPOSite e274c155-1910-4a88-9dae-c5b5a426fec4
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
        SPOSite 53101b2d-ee51-4d69-80ed-626f79b7162e
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
        SPOSite a3e08090-705d-4d3c-a9d4-b11f483bf1a2
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
        SPOSite 158b0851-a5d6-4bb0-9546-d05fea5d310f
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
        SPOSite c0aac4e3-6685-45fb-b1aa-67114c06c7f3
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
        SPOSite 32625a04-f64d-4163-b273-48c6d5415ebc
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
        SPOSite 687cead1-1700-4864-b0d2-a2648bef6be8
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
        SPOSite 7b27a23c-79e7-4542-a7df-ae95dec05ce2
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
        SPOSite d86ed40e-4392-41fc-89c3-a28c40b836ec
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
        SPOSite fb2e7b0d-188f-4c80-b015-de4363c2f994
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
        SPOSite f6f8b5df-69ec-4c2c-9133-e68e9f904076
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
        SPOSite 50f9bde1-cda1-43c6-ba91-1cf5566a3987
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
        SPOSite d6fcc340-bfcf-426d-9e9b-caffaf8f8c99
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
        SPOSite 3ffaf23f-732c-42bf-85c9-4b4f5ed09b4c
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
        SPOSite 811a8e79-a024-46a2-8525-9e044a9414d2
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
        SPOSite ac78f925-4b74-4cb1-afba-ccafec307ce2
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
        SPOSite b3d487fe-2d2e-4a55-953b-2005540db300
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
        SPOSite 774d106c-73d2-4e8c-81b0-4ddfa505853a
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
        SPOSite 8899ffc8-4491-4b8c-95c8-4315a9638c09
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
        SPOSite 2cd20e00-8aea-485e-8053-453d16ff4e3d
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
        SPOSite af8bf2ca-de81-46c9-a141-0e8a77101dc9
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
        SPOSite da23f6c5-eb56-4d1d-894c-08171b08af04
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
        SPOSite b1b619a9-dfc2-4754-9577-5e5e527886c2
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
        SPOSite 571e52c5-b429-4a01-85d2-c5dcebda3c42
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
        SPOSite 2f969164-d3c4-4410-b9ff-1397a58576a3
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
        SPOSite 4309ffb6-4cc4-4d93-adcc-6302d748f32b
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
        SPOSite 3ac6abf6-1022-43c4-a1ba-3389bc8b9ff3
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
        SPOSite 5d3ec44f-643e-40dd-a47f-4d2956a4fa56
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
        SPOSite 370b189d-d4c0-4989-ba5c-7613403be08b
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
        SPOSite 80144496-2f11-4c6c-af00-4c9300fd367e
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
        SPOSite f4b1d008-f503-4cf1-bfe8-b1d313d0af9a
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
        SPOSite 083e2799-0acb-4348-979d-2d68bb04c43d
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
        SPOSite 0034c35d-67be-4a5d-8806-79efc2e80d3f
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
        SPOSite cae2e3e7-d7fa-4f10-98bf-1463a63b0153
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
        SPOSite 9df0e01a-cb2e-4145-b7a5-4d7b157a7444
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
        SPOSite 30c24d54-6cc2-4602-9f76-95c2f17960b2
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
        SPOSite 5e4c34c7-01c1-4e7e-a665-ac46b1b7ee87
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
        SPOSite 1df9d0c0-59f0-4be7-b0ad-2347b137baef
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
        SPOSite b77b063d-ab5b-409a-bc58-5758d673e168
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
        SPOSite b8bdfbce-84fb-472b-a9b1-ad3ea3687da2
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
        SPOSite 51f348b7-24d7-435b-b97d-a1f1d2486046
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
        SPOSite 9ca57eac-927e-4f8f-a496-a82ff0c13413
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
        SPOSiteAuditSettings a0a398d8-7fad-4276-993b-26908009a833
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteAuditSettings a0815a38-e1bc-40ff-8a62-47b270085417
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/search";
        }
        SPOSiteAuditSettings 0a063660-f321-47b9-af17-cd542ebc502d
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSiteAuditSettings ee671ea2-332b-4e6d-a4f5-5eded8ae4675
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1082-00000356PhnixIntern";
        }
        SPOSiteAuditSettings 9e8242d7-bff1-4f10-90d5-e625ab2ea1ae
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteAuditSettings 97b27829-3687-4dcd-9e5d-6ca0da30cc39
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSiteAuditSettings 94454821-1496-4397-b0f7-a27da39967de
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/appcatalog";
        }
        SPOSiteAuditSettings 06abb455-47d4-4ce5-ad4a-8e92c722d00c
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSiteAuditSettings c707f930-67e2-41f2-a896-3a3e116013b3
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSiteAuditSettings 82fba0d0-a558-4cc6-8433-09990e981fff
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSiteAuditSettings d40d3b00-caa7-4687-9aba-050efeff9e64
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSiteAuditSettings 5389e562-1151-493c-bc07-b1df9f3165ff
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSiteAuditSettings 6770f02d-c860-4169-894a-d1dc6509b958
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSiteAuditSettings dcc82216-cac2-4490-9ba7-588615a8c8df
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteAuditSettings 47a592a3-f552-48d8-96e5-055f756d0247
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSiteAuditSettings cf2d913e-6ec7-4940-b368-761e043716df
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSiteAuditSettings bfadf74e-7b05-4054-9d86-fd4857b3e997
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSiteAuditSettings 3fba6bfb-d849-4a9a-924f-ca1c637abe92
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSiteAuditSettings eb4b5d76-6b55-44cb-9d42-1255a9c5c076
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSiteAuditSettings 26a6474a-b8af-4d44-99fb-a3c601258d91
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteAuditSettings 11f92903-e4be-4212-9e00-465c8e3b4a13
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteAuditSettings 5b3e82d6-6205-418e-8b49-6e860f25e1df
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSiteAuditSettings a5dd399a-6b11-4e57-a85a-28df38fd2ae2
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSiteAuditSettings 4566bf93-eac1-4ffd-b355-f5acdf228b9f
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSiteAuditSettings 059ef2df-ac4b-4bb1-b122-753fe21225df
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSiteAuditSettings 9ba346a0-a643-4716-844f-bf9651e5d698
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSiteAuditSettings 4a4cf6d5-a7df-46ad-b231-ce510191de29
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSiteAuditSettings 9010b60d-e4ce-4844-85fd-1f47e03b4158
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteAuditSettings d6187326-d3cb-461d-b828-23b454ef2abf
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSiteAuditSettings a41705a1-c81f-4b67-87ff-094a1caa7e67
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSiteAuditSettings 8d4a1f8a-ef41-4187-95d3-8888e07f393e
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSiteAuditSettings 046691fa-5b72-45b8-947d-4975d1b65756
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSiteAuditSettings f1cc706f-f02b-4a66-be93-38422e23fc31
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSiteAuditSettings ef657a50-bb36-4fe3-b4a7-478ab5521d5c
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSiteAuditSettings 7c3419b0-6fec-490b-977c-3be2a0bae8ac
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSiteAuditSettings b3969756-4099-4f2b-abb7-76ec615ca652
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSiteAuditSettings afd6517a-f4f4-4a15-b367-4742b5049057
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteAuditSettings 73a7135f-af7e-46ad-be70-3c83fa153bbf
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSiteAuditSettings 024741a9-c7bc-4441-a37f-8e7e1c7a7fc0
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSiteAuditSettings c6035aa9-f31d-4458-bdee-68a3347f4958
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSiteAuditSettings 15eea0b1-49ab-4e1f-9975-0947a03661cf
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteAuditSettings 591bfc1f-4042-4dc7-a23f-2c41318f10e3
        {
            AuditFlags           = "None";
            Credential           = $Credscredential;
            Url                  = "https://lxmk-my.sharepoint.com/";
        }
        SPOSiteGroup 119c42ef-0824-41b6-bf91-ab89ed1bdd96
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Communication site Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 7ad7d700-ab4d-41ef-b032-19279d25c6b1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Communication site Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 57b6d76e-2fdd-4573-94f3-ae1c4ec84681
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Communication site Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup faf39b00-10fa-47ff-a4ed-4931a14f250d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharePointHome OrgLinks Admins";
            PermissionLevels     = @("Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup 30b8011d-66af-4bd5-a723-a0ed2265b0c7
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharePointHome OrgLinks Editors";
            PermissionLevels     = @("Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup c4717bdb-324d-4c8d-af9f-48951d3130a2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharePointHome OrgLinks Viewers";
            PermissionLevels     = @("Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/";
        }
        SPOSiteGroup c350cac6-32fa-45b0-9055-b3b858691cf2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Members";
            PermissionLevels     = @("Contribute");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/search";
        }
        SPOSiteGroup b03d6bef-084d-4996-8af5-a642af066b74
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/search";
        }
        SPOSiteGroup 512c9ab0-ede0-4866-a2fa-c852ba2573dd
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/search";
        }
        SPOSiteGroup d6eb0c1d-dc33-46bd-9e0d-c4639bbaf38a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSiteGroup 89e71c51-965f-438d-abbd-408131f33042
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSiteGroup c833f457-9e1c-4713-b009-b635a00bd1d7
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/1";
        }
        SPOSiteGroup 9827d818-c1ec-455b-b434-bc2a4df74d2d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Classic Team Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteGroup caeb1c2c-7336-4082-942a-67a1b6e64a2e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Classic Team Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteGroup 53a1fbd5-ab5b-4a54-9f34-65accad8fdbb
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Classic Team Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteGroup 1d3f89a2-5854-469a-8381-05b336d26c47
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Excel Services Viewers";
            PermissionLevels     = @("View Only");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/2";
        }
        SPOSiteGroup 5331fdc9-5664-4b83-a0b5-207e2a0c9a69
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Angebote Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSiteGroup dd528666-dab8-46a3-aee2-28d0a452e9a4
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Angebote Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSiteGroup bd672065-d691-4c92-9ddf-19e02917123d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Angebote Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Angebote";
        }
        SPOSiteGroup a0be275e-8e1f-4250-bd52-fac8dab39ae2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ChatBot Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSiteGroup 78973ebf-f5da-441a-b623-d38732976edc
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ChatBot Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSiteGroup 916bb140-29d8-47ba-b4ee-bb2204a2690e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ChatBot Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ChatBot";
        }
        SPOSiteGroup c3e597ce-6728-4424-be61-b6e22f3ddd2d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Content Center Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSiteGroup f1774822-15d8-45aa-ade0-2c8547564d32
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Content Center Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSiteGroup c6ea3c63-48a8-4cc3-985f-2bd354bcae14
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Content Center Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ContentCenter";
        }
        SPOSiteGroup 980b9932-d409-41ab-963d-ecb7f28dc9bd
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Digital Initiative Public Relations Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSiteGroup 970def39-59d3-4b78-a7eb-8f33524660ac
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Digital Initiative Public Relations Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSiteGroup 92ee8a1f-64f6-4318-85ef-8bd3c485bdac
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Digital Initiative Public Relations Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/DigitalInitiativePublicRelations";
        }
        SPOSiteGroup ff8b4cbf-8d28-41b6-8adf-c2d903e726fa
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Finance Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSiteGroup debc5995-2039-4a0b-b878-56e59ce55fda
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Finance Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSiteGroup 64da5a23-f245-4a7c-84bd-abfc500a3d9e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Finance Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Finance";
        }
        SPOSiteGroup 51e89129-bed4-426f-98b0-de8104c495b8
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group1 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSiteGroup 282cfd02-991f-420f-a6c5-c1092d919f35
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group1 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSiteGroup 42e79294-e07f-49e8-a3da-85b617b80d81
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group1 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group1";
        }
        SPOSiteGroup 431beeba-bea8-405d-b9e2-cee8e399c2ce
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group2 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSiteGroup f9600c75-f09c-4343-8b4d-9d8b66c63df6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group2 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSiteGroup d11b48e0-1565-42fd-92d4-f221bfcc249a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Group2 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/group2";
        }
        SPOSiteGroup 10708962-24d7-4bd5-ae7a-5f77f7ffa126
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Project Hub Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup 4cf38692-79a8-4fdf-bff4-ca49aa1971b0
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Project Hub Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup e7c0ab89-8d49-43d5-8cc1-dc6a79e21d1a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Project Hub Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup ac2622c6-a0c6-486a-aa45-5e45095d6636
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For List 9006f151-9861-4505-856a-6628fed2c96e";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup b582e9f8-0a44-4656-9616-9692a9f2a2fd
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For Web 3cadc78c-6a2d-4b91-80c1-289e707e47e8";
            PermissionLevels     = @("Web-Only Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup 8b4beaad-4246-4ce9-9614-03d89af15e26
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.6ce3537e-7aca-49fd-b137-c22c26ec6ffd.OrganizationEdit.49b5bfa9-b118-42f6-b754-7e6665db0669";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKM";
        }
        SPOSiteGroup 2386dbf3-31c5-4825-9f1d-e49d03259781
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Template Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSiteGroup 8335970f-36af-4d2d-8256-24492fa6801c
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Template Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSiteGroup bf2ab878-d29c-4ee3-bcdd-0f439ec0b745
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HKM Template Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HKMTemplate";
        }
        SPOSiteGroup 1bfe54c1-cb4b-41ec-8771-57a6b306a98d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSiteGroup 03894896-c20d-4f94-bc6c-45bbdf8f506d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSiteGroup 90f5a33b-d8bd-4457-8f92-54d7d22460b8
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/HR";
        }
        SPOSiteGroup ccaf1a45-d89f-4f20-8c22-3468c1dfb8f8
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSiteGroup 722ecad7-4001-4f61-94da-6c0f500d3d3d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSiteGroup 95ad215b-2ebc-45bc-8a63-e5aa1418bc61
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "HR Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/hr2";
        }
        SPOSiteGroup aa6bb0e0-d613-4111-9f39-a5c7aeccac42
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSiteGroup 4a1ea2f2-11dc-4c87-ae75-fc9cb83b0570
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSiteGroup a76d9c0d-6d56-4ec0-bef1-af09b76a5932
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/IT";
        }
        SPOSiteGroup f59f8d30-0912-4bb4-980e-c9367caa696a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSiteGroup 6849656f-8c58-4457-a26d-cdf6cbdffe4a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSiteGroup 104765a7-b5f5-4427-9bd8-38a97337c3c8
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "IT Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/it2";
        }
        SPOSiteGroup 852e2e2b-ce42-4b44-9ecd-a5329a3130c6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For List ce92f2b7-5f9b-41e8-a5df-d00ffdfe190d";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup 8d2efdc9-aa7a-4465-a7cd-9bb255f69159
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For Web 95fdb75f-9a65-4016-9e8a-e86cc99fb301";
            PermissionLevels     = @("Web-Only Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup fbca9e5a-cbee-428e-99e8-6ca8620348a6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Microsoft 365 learning pathways Members";
            PermissionLevels     = @("Edit","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup 94295752-1b24-4b89-8ab8-24db11808e77
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Microsoft 365 learning pathways Owners";
            PermissionLevels     = @("Full Control","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup 77a7da64-cc1f-4383-8008-b17837e94bfb
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Microsoft 365 learning pathways Visitors";
            PermissionLevels     = @("Read","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup d5e9f072-b2ee-4e26-903a-32db856d12e2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.54437daa-80d2-4e40-8431-6daac10e73a7.OrganizationEdit.038ce20f-cbbc-49b2-bddc-062190527dd3";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup cfab9cfa-2763-46ff-9ef4-b21c0d930517
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.58b87ad8-8c63-4959-96a2-a35329e3a518.OrganizationEdit.ebaa5752-0a95-4892-b67c-9c1f66c8c7b2";
            PermissionLevels     = @("Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/M365LP";
        }
        SPOSiteGroup c87ae0df-d9bf-4db0-b468-6407b52c01ed
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "external";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteGroup 41cb04b7-1e8f-45b2-aa04-b16e62d1a1ff
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteGroup dbab2a32-4b74-40eb-ada7-5072f7514ec3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteGroup 6007ad4e-d95d-4ad0-805f-7d0ac09259c0
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam";
        }
        SPOSiteGroup f79dafa5-21ca-4230-9c9f-686a997fe192
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team - Test Private Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSiteGroup a281713b-04b6-42b1-8f41-4f7f044788e6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team - Test Private Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSiteGroup c76c57f9-72d5-4199-a1ee-386a5c10de78
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Mark 8 Project Team - Test Private Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Mark8ProjectTeam-TestPrivate";
        }
        SPOSiteGroup 36bedc3b-7431-4e18-b843-683803b3ea7a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSiteGroup e25df910-b372-41fa-b9f1-05bfdbc52f10
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Owners";
            PermissionLevels     = @("Full Control","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSiteGroup 5f6e848f-51a4-47ab-9367-126df8ee4ca2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Marketing";
        }
        SPOSiteGroup 7f5a42d2-2452-4891-b29c-e1651eacdbed
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSiteGroup 2217406e-7715-454e-8057-4465f3f91bef
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSiteGroup 68947b0a-de99-4008-8b71-a51a55ba2952
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Marketing Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/marketing2";
        }
        SPOSiteGroup 5fcb4272-94fe-44b8-9f96-aa70a1c13ce1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Meeting Minutes Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSiteGroup b44ba0e4-28b5-4010-999e-a6cedd7d40fe
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Meeting Minutes Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSiteGroup 9ffdc512-f85a-449f-abc4-c65273345629
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Meeting Minutes Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/MeetingMinutes";
        }
        SPOSiteGroup afb6c269-6b1c-4037-8b5b-b64810d63308
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PowerApp Team Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSiteGroup b124f2d5-7315-4e53-8891-6d51768ae613
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PowerApp Team Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSiteGroup f249b2d3-779b-4cf3-bfe1-6e47ccd7efee
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PowerApp Team Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PowerAppTeam";
        }
        SPOSiteGroup 7ab6ff13-397a-477d-970b-ae60435936c6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Private Community Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSiteGroup 80b8d6e9-a056-4288-948a-9d482bef7fb1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Private Community Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSiteGroup cacecb91-4bf2-468c-a87c-f874f8722dbe
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Private Community Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/privatecommunity";
        }
        SPOSiteGroup 3f26c890-eec1-45af-ada2-11a2c1752750
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "External Members";
            PermissionLevels     = @("Contribute","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup 3188d963-07ff-43e5-942a-0416112d2659
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "External Visitors";
            PermissionLevels     = @("Read","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup ff4dbfa9-c18d-41db-8c00-054563f57bad
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Project Site Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup b5a54dc7-9bca-4222-93cc-0edfe029f1c4
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Project Site Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup ebd8b625-6781-45f1-8ed8-bed5ae28671e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Project Site Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ProjectSite";
        }
        SPOSiteGroup ebe7d0ef-c793-4be8-9d7a-6f99a4c8fd70
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup1 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSiteGroup 1ebd4c0b-892e-4384-ac4e-0d4e72799c67
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup1 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSiteGroup ddbf8a30-29a0-42b0-ace5-25e6d84336a7
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup1 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup1843";
        }
        SPOSiteGroup 4c14459c-f212-433c-a2da-7bb70ae06b5f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup2 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSiteGroup 413376ac-252b-483d-a8c0-18e6b3017e6b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup2 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSiteGroup 58b4d664-78ef-4bd7-b6fb-012b1acc1d94
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup2 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup2843";
        }
        SPOSiteGroup d6e3bc9e-6139-42b3-8ce4-0d6a47b728e6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup3 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSiteGroup 6d210164-130d-4662-93ae-dfd41d1d86c6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup3 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSiteGroup e19c128a-bd21-441d-ae8d-9412edfd1e24
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "PSGroup3 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/PSGroup3843";
        }
        SPOSiteGroup fddaaf1c-82ec-4b6d-b280-1251066dd996
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Request a Guest Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSiteGroup 9f8a59e1-e70e-4930-93ed-d9f9ebeece14
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Request a Guest Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSiteGroup 039d83e0-74fd-4be1-861a-f1fe498869d0
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Request a Guest Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/RequestaGuest";
        }
        SPOSiteGroup 0b7fb988-67ea-4bec-b658-d133f68d24b8
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Retail Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSiteGroup 5b1586f7-313d-4287-bc1a-c3da66eb8a0c
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Retail Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSiteGroup 7db0ec71-ecb5-4875-9314-dad25c9e98c3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Retail Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Retail";
        }
        SPOSiteGroup d6a36142-741d-4637-a118-58c3f876ad70
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sales and Marketing Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSiteGroup e0025846-989c-441a-b291-ea10ed2111dd
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sales and Marketing Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSiteGroup 7eca82b5-ddd3-451d-9a4d-40d3640eddf2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sales and Marketing Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SalesandMarketing";
        }
        SPOSiteGroup 4f9c75ba-1387-47ed-93ad-904068d10617
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sample Team Site Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSiteGroup 24e88275-80eb-46bd-973a-58d440598c24
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sample Team Site Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSiteGroup bacf3a30-07cd-41cc-b659-78e470999fc6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Sample Team Site Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SampleTeamSite";
        }
        SPOSiteGroup 00c4d123-1aee-4f24-a17c-3e893767e687
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSiteGroup 681bba93-b800-4cf1-88f8-fb1ed9283e53
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSiteGroup e2073ea9-6bb7-47ef-96df-2a7ba9769280
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SCA Projects Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/SCAProjects";
        }
        SPOSiteGroup 93498518-0acf-4fba-a02c-e84d9fbb26d5
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For List 718edc2c-6b20-4783-80ad-e5abb73fbb07";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 00239d23-6e94-4a0f-ab03-f9c03167de03
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Limited Access System Group For Web d6c22401-ae02-4f8b-983e-ef9f81e76496";
            PermissionLevels     = @("Web-Only Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup eb50debb-a9b5-40b2-91a3-58bac40b0a8f
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ServiceAngebot Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup c9eca8d6-f138-440d-b562-3a1c26af4cb3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ServiceAngebot Owners";
            PermissionLevels     = @("Full Control","Limited Access");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 21dfa49b-3944-4df2-a6b7-043795d700fd
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "ServiceAngebot Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 5838af6b-9c51-40b8-9b83-14fb8d0c61f2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.bf0865d3-16bd-4b12-90d7-ed9b0e6e1ee0.AnonymousEdit.93625a46-cfe6-40fe-9a29-f4e28377afcf";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 23529add-6371-4405-8450-9c4f17f109ff
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.e69fc8ad-9a52-4b40-b95d-8810b48ddcd5.OrganizationEdit.b54ed27e-2f2d-4580-ba15-7def3e6066cf";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup 1c3e480e-2d26-4130-ba73-e25ef6ca8895
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "SharingLinks.f22e8dee-c64e-4035-ba15-2d0d1da6728e.AnonymousEdit.6c3dbe84-e2a3-4439-9991-2bb3a3322684";
            PermissionLevels     = @();
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/ServiceAngebot";
        }
        SPOSiteGroup fdb4c65e-6641-469f-8fe7-05393b9729f7
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test Project 1 Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSiteGroup 61b1045c-d297-4711-a5c5-17f30b4f2d20
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test Project 1 Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSiteGroup 4f2267f0-1a68-4d98-80e8-bf2e092b9cb9
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test Project 1 Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/TestProject1";
        }
        SPOSiteGroup b3ffe162-b20a-48b6-8aab-b5d34bacd7b1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test-Security_Group Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSiteGroup 1713b90e-096d-4f86-9e17-d9404c2af68a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test-Security_Group Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSiteGroup 6796e76b-f890-4c0a-8d00-9f27328331a4
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Test-Security_Group Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/test-security_group";
        }
        SPOSiteGroup c844fb82-3c92-45b7-a3fd-e9c6ea33b7f8
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Training Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSiteGroup 115d5f2b-cca8-4db2-b606-ac2679a78e1c
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Training Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSiteGroup 7fb34185-2f39-4301-b913-f02ad13213f5
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Training Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/Training";
        }
        SPOSiteGroup 380d063e-ee9c-4bac-9351-756b98cc7e00
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "U.S. Sales Members";
            PermissionLevels     = @("Edit");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteGroup 791d2a63-97b4-48bc-befb-198e815d3de3
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "U.S. Sales Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteGroup 2595e3b7-6851-4056-89af-24ee12ecdd5d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "U.S. Sales Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0]).sharepoint.com/sites/U.S.Sales";
        }
        SPOSiteGroup dc9914f0-5fc6-4999-9728-c46df8d90f11
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Members";
            PermissionLevels     = @("Contribute");
            Url                  = "https://$($OrganizationName.Split('.')[0])-my.sharepoint.com/";
        }
        SPOSiteGroup 6ae6de2d-d7ba-41b0-a691-c88e1c5dbc6d
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Owners";
            PermissionLevels     = @("Full Control");
            Url                  = "https://$($OrganizationName.Split('.')[0])-my.sharepoint.com/";
        }
        SPOSiteGroup a768c7cc-28dc-4e11-a675-254f5f7c8a04
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Identity             = "Visitors";
            PermissionLevels     = @("Read");
            Url                  = "https://$($OrganizationName.Split('.')[0])-my.sharepoint.com/";
        }
        SPOStorageEntity 6fc834a9-c8d8-4c77-a495-f37e779af57f
        {
            Credential           = $Credscredential;
            Description          = "CDN source for Microsoft Content";
            Ensure               = "Present";
            EntityScope          = "Tenant";
            Key                  = "MicrosoftCustomLearningCdn";
            SiteUrl              = "https://$($OrganizationName.Split('.')[0])-admin.sharepoint.com";
            Value                = "https://pnp.github.io/custom-learning-office-365/learningpathways/";
        }
        SPOStorageEntity 6b609918-3f13-4949-a1f9-ce31571e8f57
        {
            Credential           = $Credscredential;
            Description          = "Custom Learning Site Collection";
            Ensure               = "Present";
            EntityScope          = "Tenant";
            Key                  = "MicrosoftCustomLearningSite";
            SiteUrl              = "https://$($OrganizationName.Split('.')[0])-admin.sharepoint.com";
            Value                = "/sites/M365LP";
        }
        SPOStorageEntity b7ca9519-888c-4d84-9b9c-55e99263f670
        {
            Credential           = $Credscredential;
            Description          = "Custom Learning Telemetry Collection";
            Ensure               = "Present";
            EntityScope          = "Tenant";
            Key                  = "MicrosoftCustomLearningTelemetryOn";
            SiteUrl              = "https://$($OrganizationName.Split('.')[0])-admin.sharepoint.com";
            Value                = "true";
        }
        SPOTenantCdnEnabled 16281842-a838-4e74-8c0a-1a591ca3ac51
        {
            CdnType              = "Public";
            Credential           = $Credscredential;
            Enable               = $False;
        }
        SPOTenantCdnEnabled 769fabe3-4e8a-48a8-ba35-269813b46441
        {
            CdnType              = "Private";
            Credential           = $Credscredential;
            Enable               = $False;
        }
        SPOTenantCdnPolicy e06ded91-5bcd-4005-9678-88ce1efa1a73
        {
            CDNType                              = "Public";
            Credential                           = $Credscredential;
            ExcludeRestrictedSiteClassifications = @();
            IncludeFileExtensions                = @();
        }
        SPOTenantCdnPolicy cb8499c1-b97d-4099-a2c7-470f2d60b0f1
        {
            CDNType                              = "Private";
            Credential                           = $Credscredential;
            ExcludeRestrictedSiteClassifications = @();
            IncludeFileExtensions                = @();
        }
        SPOTenantSettings ac6c5bdf-a8bf-4352-b8d3-e33e841f8285
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
        SPOUserProfileProperty fb482c1e-6a2c-4b04-8c7f-ac2a29d65479
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
        SPOUserProfileProperty 31342703-c34e-42ff-8947-1dee27035bf6
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
        SPOUserProfileProperty 51f7d955-aaba-45ec-b0f5-e9560a08988e
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
        SPOUserProfileProperty 1ae33923-01b2-4ab8-a80d-383830aae79b
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
        SPOUserProfileProperty 8972d4ac-4342-4cd3-94a7-a976401fb871
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

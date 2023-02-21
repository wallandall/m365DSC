@{
    AllNodes = @(
        @{
            NodeName                    = "localhost"
            PSDscAllowPlainTextPassword = $true;
            PSDscAllowDomainUser        = $true;
            #region Parameters
            # Default Value Used to Ensure a Configuration Data File is Generated
            ServerNumber = "0"

        }
    )
    NonNodeData = @(
        @{
            # Tenant's default verified domain name
            OrganizationName = "lxmk.onmicrosoft.com"

            # Azure AD Application Id for Authentication
            ApplicationId = "d995b85e-f319-4d82-b54a-098442ae501f"

            # The Id or Name of the tenant to authenticate against
            TenantId = "lxmk.onmicrosoft.com"

            # Azure AD Application Secret for Authentication
            ApplicationSecret = "rLc8Q~S~zdhR6F5mVQAHI2e_HEP2PWxqQkd4bbzi"

        }
    )
}

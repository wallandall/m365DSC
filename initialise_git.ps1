git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/wallandall/m365DSC.git
git push -u origin main

New-M365DSCDeltaReport -Source "C:\Users\chrwall\Desktop\New folder\M365DSC\Tenants\w8pr5\M365TenantConfig.ps1" -Destination "C:\Users\chrwall\Desktop\New folder\M365DSC\Baseline\M365TenantConfig.ps1"  -OutputPath test.html
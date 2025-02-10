$CustomPolicies = @(
    @{ Path = "\\suiprodstorageaccount001.file.core.windows.net\share-prod-002\RoamingFiles\AppControlPolicies\Enforced\{848E7D2B-D231-49DE-AEF2-6F1E21C92C53}.cip"; ID = "848E7D2B-D231-49DE-AEF2-6F1E21C92C53" },
    @{ Path = "\\suiprodstorageaccount001.file.core.windows.net\share-prod-002\RoamingFiles\AppControlPolicies\Enforced\{63DF5BD9-3B51-49E4-A639-7DC264D59B4A}.cip"; ID = "63DF5BD9-3B51-49E4-A639-7DC264D59B4A" }
)
$ImplementedPolicies = CiTool --list-policies --json | ConvertFrom-Json

foreach ($policy in $CustomPolicies)
{
    if (-not ($ImplementedPolicies.policies | Where-Object { $_.PolicyID -eq $policy.ID })) {
        CiTool --update-policy $policy.Path --json
    }
}
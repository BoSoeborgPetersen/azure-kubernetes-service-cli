# LaterDo: Add a lot more checks.
# LaterDo: Allow to run from other subscriptions (add subscription parameter, calculate other variables from that).
param($oldRegistry, $oldRegistryRepo, $newRegistryRepo, $newRegistry)

WriteAndSetUsage ([ordered]@{
    "<old registry>" = "Old Azure registry"
    "<old registry repo>" = "Old Azure registry repository"
    "<new registry repo>" = "New Azure registry repository"
    "[new registry]" = "New Azure Registry"
})

CheckVariable $oldRegistry "old registry"
CheckVariable $oldRegistryRepo "old registry repo"
CheckVariable $newRegistryRepo "new registry repo"

if (!$newRegistry)
{
    $newRegistry = $oldRegistry
}

Write-Info "Migrate all docker images from registry/repo '$oldRegistry/$oldRegistryRepo' to registry/repo '$newRegistry/$newRegistryRepo'"

$imageTags = AzQuery "acr repository show-tags -n $oldRegistry --repository $oldRegistryRepo" | ConvertFrom-Json

foreach($imageTag in $imageTags.Split(" "))
{
    Write-Info "Moving '$oldRegistry.azurecr.io/${oldRegistryRepo}:$imageTag' to '$newRegistry.azurecr.io/${newRegistryRepo}:$imageTag'"
    AzCommand "acr import -n $newRegistry --source $oldRegistry.azurecr.io/${oldRegistryRepo}:$imageTag --image ${newRegistryRepo}:$imageTag"
}
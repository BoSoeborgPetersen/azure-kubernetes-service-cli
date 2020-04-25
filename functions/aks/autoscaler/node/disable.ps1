WriteAndSetUsage "aks autoscaler node disable"

CheckCurrentCluster

Write-Info "Disable node autoscaler"

ExecuteCommand "az aks update -n $($GlobalCurrentCluster.Name) -g $($GlobalCurrentCluster.ResourceGroup) --disable-cluster-autoscaler $debugString"
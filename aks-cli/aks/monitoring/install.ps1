# TODO: Rewrite config files to new format.
WriteAndSetUsage

CheckCurrentCluster

Write-Info "Installing Prometheus"

HelmAddRepo prometheus-community 'https://prometheus-community.github.io/helm-charts'

HelmCommand "install prometheus prometheus-community/prometheus" -n monitoring
# HelmCommand "install prometheus prometheus-community/prometheus -f $PSScriptRoot/config/helm-prometheus.yaml" -n monitoring

# Write-Info "Installing Grafana"

# KubectlCommand "apply -n monitoring -f 'config/configmaps/DataSource.yaml'"
# KubectlCommand "apply -n monitoring -f 'config/configmaps/K8s Cluster Summary.yaml'"
# KubectlCommand "apply -n monitoring -f 'config/configmaps/Windows Node 2.yaml'"
# KubectlCommand "apply -n monitoring -f 'config/configmaps/Windows Node w_ process info.yaml'"
# KubectlCommand "apply -n monitoring -f 'config/configmaps/Windows Node.yaml'"

# HelmCommand "install grafana stable/grafana -f config/helm-grafana.yaml" -n monitoring
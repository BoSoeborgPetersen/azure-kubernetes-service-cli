param($subCommand)

$subCommands=@{
    "install" = "Install Nginx-Ingress (Helm chart), using static public IP.";
    "upgrade" = "Upgrade Nginx-Ingress (Helm chart).";
    "config" = "Prints the contents of the nginx.conf file inside the Nginx pod.";
    "logs" = "Get Nginx Deployment logs.";
    "yaml" = "Edit nginx-config.yaml file, with Kubernetes Config Map.";
    "edit-configmap" = "Opens the Nginx configmap for editing in notepad.";
    "uninstall" = "Uninstall Nginx-Ingress (Helm chart).";
}

SubMenu $PSScriptRoot $command $subCommand $subCommands
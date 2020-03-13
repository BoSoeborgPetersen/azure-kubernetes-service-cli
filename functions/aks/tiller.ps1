param($subCommand)

$subCommands=@{
   "setup" = "Install or update the Helm server side component (Tiller).";
   "install" = "Install the Helm server side component (Tiller).";
   "update" = "Update the Helm server side component (Tiller).";
   "ready" = "Return whether the Helm server side component (Tiller) is ready.";
   "wait" = "Wait for the Helm server side component (Tiller) to be ready.";
   "uninstall" = "Uninstall the Helm server side component (Tiller).";
}

SubMenu $PSScriptRoot $command $subCommand $subCommands
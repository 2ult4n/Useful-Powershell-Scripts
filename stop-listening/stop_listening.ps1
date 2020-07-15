$Process = Get-Process -Id (Get-NetTCPConnection -LocalPort $args[0]).OwningProcess
if ($Process){
    Write-Host "Process Name: $($Process.Name) Process Id: $($Process.Id) "
    
    $title    = "Conform"
    $question = "Are you sure you want to stop the following process? Process Name: $($Process.Name) Process Id: $($Process.Id) "
    $choices  = '&Yes', '&No'

    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)

    if ($decision -eq 0) {
        Stop-Process -Id $Process.Id
        Write-Host "Process with the name $($Process.Name) have been stopped"
    } else {
        Write-Host 'Cancelled'
    }
}else{
    Write-Host "There is no process listening to the port $($args[0])" 
}



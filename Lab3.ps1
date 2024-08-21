
# Connect to vCenter Server 
$vcenterServer = "72.172.185.171" # Replace with your vCenter Server 
$credential = Get-Credential 
   # Connect-VIServer -Server $vcenterServer -Credential $credential 

# Get all VMs 
$vms = Get-VM 

# Filter VMs that are powered off 
$poweredOffVMs = $vms | Where-Object { $_.PowerState -eq "PoweredOff" } 

# Power on each VM that is powered off 
foreach ($vm in $poweredOffVMs) { 
     Write-Host "Powering on VM: $($vm.Name)" 
     Start-VM -VM $vm 
} 

# Disconnect from vCenter Server 
    # Disconnect-VIServer -Confirm:$false 

$SetName = Read-Host -Prompt "Name The VM"

$VMName = $SetName
$VMPath = "h:\VM-10\"
$Gen = "2"
$HDD = "h:\VM-10\$SetName\Virtual Hard Disk\$SetName.VHDX"
$Mem = 1GB
$Parent = "H:\Hyper-V\Lab-100\Base Images\Base-Win-10-E.vhdx"
$Switch1 = "Lab-100-Internal"

New-VM -Name $VMName -Generation $Gen -MemoryStartupBytes $Mem -Path $VMPath 

Set-VMProcessor -VMName $VMName -Count 2

New-VHD -ParentPath $Parent -Path $HDD -Differencing

Get-VM -Name $VMName | Add-VMHardDiskDrive -ControllerType SCSI -ControllerNumber 0 -Path $HDD

$Var1 = Get-VMNetworkAdapter -VMName $VMName
$Var2 = Get-VMHardDiskDrive -VMName $VMName
Set-VMFirmware -VMName $VMName -BootOrder $Var2, $Var1

Connect-VMNetworkAdapter -VMName $VMName -SwitchName $Switch1
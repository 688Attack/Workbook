#This will promt you to enter the name of the VM

$SetName = Read-Host -Prompt "Name The VM"

#These settings need to be check and configured

$VMName = $SetName
$VMPath = "E:\Hyper-V\Machines\01"
$Gen = "2"
$HDD = "E:\Hyper-V\Machines\01\$SetName\Virtual Hard Disk\$SetName.VHDX"
$Mem = 4GB
$Parent = "E:\Hyper-V\Base\Base-Server-2016.vhdx"

#Creates the VM

New-VM -Name $VMName -Generation $Gen -MemoryStartupBytes $Mem -Path $VMPath 

#Sets CPU count

Set-VMProcessor -VMName $VMName -Count 2

#Creates new hard drive which in this case will be a differencing
#Also sets the parent hard drive

New-VHD -ParentPath $Parent -Path $HDD -Differencing

#Adds the new virtual hard disk to the VM

Get-VM -Name $VMName | Add-VMHardDiskDrive -ControllerType SCSI -ControllerNumber 0 -Path $HDD

#Sets the two variables used to set the boot order7

$Var1 = Get-VMNetworkAdapter -VMName $VMName
$Var2 = Get-VMHardDiskDrive -VMName $VMName

#Uses the set variables var1, var2 to organise the boot order

Set-VMFirmware -VMName $VMName -BootOrder $Var2, $Var1

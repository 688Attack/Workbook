#This will promt you to enter the name of the VM

$SetName = Read-Host -Prompt "Name The VM"

#These settings need to be check and configured

$VMName = $SetName
$VMPath = "E:\Hyper-V\Hyper-v Machines\Local_Lab\Machines\"
$Gen = "2"
$HDD = "E:\Hyper-V\Hyper-v Machines\Local_Lab\Machines\$SetName\Virtual Hard Disk\$SetName.VHDX"
$Mem = 4GB
$Parent = "E:\Hyper-V\Base Images\Base-Server-2012-R2.vhdx"

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

#Connects the VM to a virtual network switch


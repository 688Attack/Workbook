$SetName = "New 25"

$VMName = $SetName
$VMPath = "h:\VM-10\"
$Gen = "2"
$HDD = "h:\VM-10\$SetName\Virtual Hard Disk\$SetName.VHDX"
$Mem = 1GB
$HddSize = 40000000000
$Parent = "H:\Hyper-V\Lab-100\Base Images\Base-Win-10-E.vhdx"

New-VM -Name $VMName -Generation $Gen -MemoryStartupBytes $Mem -Path $VMPath 

Set-VMProcessor -VMName $VMName -Count 2

New-VHD -ParentPath $Parent -Path $HDD -NewVHDSizeBytes $HddSize -Differencing

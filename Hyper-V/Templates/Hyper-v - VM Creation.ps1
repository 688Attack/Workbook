$SetName = "New 17"

$VMName = $SetName
$VMPath = "h:\VM-10\$SetName"
$Gen = "2"
$HDD = "h:\VM-10\$SetName\Virtual Hard Disk\$SetName.VHDX"
$Mem = 1GB
$HddSize = 40000000000
$Parent = "H:\Hyper-V\Lab-100\Base Images\Base-Win-10-E.vhdx"

New-VM -Name "New 18" -Generation $Gen -MemoryStartupBytes $Mem -Path "h:\VM-10\New 18"



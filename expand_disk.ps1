$DriveLetter = "C"

$partition = Get-Partition -DriveLetter $DriveLetter

$supportedSize = Get-PartitionSupportedSize -PartitionNumber $partition.PartitionNumber -DiskNumber $partition.DiskNumber

Resize-Partition -PartitionNumber $partition.PartitionNumber -DiskNumber $partition.DiskNumber -Size $supportedSize.SizeMax

Write-Output "Disk $DriveLetter extended to maximum size."

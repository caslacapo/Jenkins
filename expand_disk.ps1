param(
    [Parameter(Mandatory=$true)]
    [string]$DriveLetter
)

# Ensure the drive letter is a single character without colon
$DriveLetter = $DriveLetter.TrimEnd(':').ToUpper()

# Get the partition
$partition = Get-Partition -DriveLetter $DriveLetter

# Get the maximum supported size
$supportedSize = Get-PartitionSupportedSize -PartitionNumber $partition.PartitionNumber -DiskNumber $partition.DiskNumber

# Resize the partition to the maximum size
Resize-Partition -PartitionNumber $partition.PartitionNumber -DiskNumber $partition.DiskNumber -Size $supportedSize.SizeMax

Write-Output "Disk $DriveLetter extended to maximum size."
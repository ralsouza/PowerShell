
function Get-TimeStamp {
    
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
    
}

$datacollectorset = New-Object -COM Pla.DataCollectorSet

$datacollectorset.Query("Baseline SQL Server",$null)

if ($datacollectorset.Status -eq 0) {
	Write-Output "$(Get-TimeStamp) The performance counter is stopped. Trying to start..." | Out-file C:\Logs\SQL_Perf\perf_sql_status_log.txt -append
	$datacollectorset.Start($false)
	Write-Output "$(Get-TimeStamp) It started successfully!" | Out-file C:\Logs\SQL_Perf\perf_sql_status_log.txt -append
}else{
		Write-Output "$(Get-TimeStamp) Performance counter is ok, nothing to do." | Out-file C:\Logs\SQL_Perf\perf_sql_status_log.txt -append
	}

\Windows\Application Experience\Microsoft Compatibility Appraiser" /f         &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /f                        &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /f                            &rem - 9 B
schtasks /Delete /tn "\Microsoft\Windows\ApplicationData\appuriverifierdaily" /f                              &rem - - B
schtasks /Delete /tn "\Microsoft\Windows\ApplicationData\appuriverifierinstall" /f                            &rem - - B
schtasks /Delete /tn "\Microsoft\Windows\Autochk\Proxy" /f                                                    &rem 7 9 B

schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /f                   &rem - 9 -
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f             &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /f           &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f                  &rem 7 9 B

schtasks /Delete /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" /f                                           &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\Device Information\Device" /f                                        &rem - - B
schtasks /Delete /tn "\Microsoft\Windows\Diagnosis\Scheduled" /f                                              &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /f     &rem 7 9 B

schtasks /Delete /tn "\Microsoft\Windows\LanguageComponentsInstaller\Installation" /f                         &rem - - B
schtasks /Delete /tn "\Microsoft\Windows\LanguageComponentsInstaller\Uninstallation" /f                       &rem - - B

schtasks /Delete /tn "\Microsoft\Windows\Maintenance\WinSAT" /f                                               &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\Maps\MapsToastTask" /f                                               &rem - - B
schtasks /Delete /tn "\Microsoft\Windows\Maps\MapsUpdateTask" /f                                              &rem - - B
schtasks /Delete /tn "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser" /f                    &rem - 9 B
schtasks /Delete /tn "\Microsoft\Windows\MobilePC\HotStart" /f                                                &rem 7 - -
schtasks /Delete /tn "\Microsoft\Windows\MUI\LPRemove" /f                                                     &rem 7 9 B

schtasks /Delete /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /f                                       &rem 7 9 B

schtasks /Delete /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /f                       &rem 7 9 B

schtasks /Delete /tn "\Microsoft\Windows\RAC\RacTask" /f                                                      &rem 7 9 -
schtasks /Delete /tn "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" /f                            &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\RetailDemo\CleanupOfflineContent" /f                                 &rem - - B

schtasks /Delete /tn "\Microsoft\Windows\SettingSync\BackgroundUploadTask" /f                                 &rem - 9 B
schtasks /Delete /tn "\Microsoft\Windows\SettingSync\BackupTask" /f                                           &rem - 9 B
schtasks /Delete /tn "\Microsoft\Windows\SettingSync\NetworkStateChangeTask" /f                               &rem - 9 B
schtasks /Delete /tn "\Microsoft\Windows\Setup\EOSNotify" /f                                                  &rem 7 9 -
schtasks /Delete /tn "\Microsoft\Windows\Setup\EOSNotify2" /f                                                 &rem 7 9 -
schtasks /Delete /tn "\Microsoft\Windows\Setup\SetupCleanupTask" /f                                           &rem - 9 B
schtasks /Delete /tn "\Microsoft\Windows\Speech\SpeechModelDownloadTask" /f                                   &rem - - B
schtasks /Delete /tn "\Microsoft\Windows\SystemRestore\SR" /f                                                 &rem 7 9 B

schtasks /Delete /tn "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /f                             &rem 7 9 B

schtasks /Delete /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /f                           &rem 7 9 B
schtasks /Delete /tn "\Microsoft\Windows\WindowsBackup\ConfigNotification" /f                                 &rem 7 - -
schtasks /Delete /tn "\Microsoft\Windows\WS\License Validation" /f                                            &rem - 9 -
schtasks /Delete /tn "\Microsoft\Windows\WS\WSRefreshBannedAppsListTask" /f                                   &rem - 9 -

schtasks /Delete /tn "\Microsoft\XblGameSave\XblGameSaveTask" /f                                              &rem - - B
schtasks /Delete /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /f                                         &rem - - B

timeout 3 > nul
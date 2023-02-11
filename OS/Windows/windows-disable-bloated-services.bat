:: Disable windows bloated services https://antoshabrain.blogspot.com/p/windows10-disable-unnecessary-services.html

:: USE AT YOUR OWN RISK!

:: Xbox Live Auth Manager
SC STOP XblAuthManager
SC CONFIG XblAuthManager start= disabled
SC DELETE XblAuthManager

:: Xbox Accessory Managment Service
SC STOP XboxGipSvc
SC CONFIG XboxGipSvc start= disabled
SC DELETE XboxGipSvc

:: Xbox Live Game Save
SC STOP XblGameSave
SC CONFIG XblGameSave start= disabled
SC DELETE XblGameSave

:: Xbox Live Networking Service
SC STOP XboxNetApiSvc
SC CONFIG XboxNetApiSvc start= disabled
SC DELETE XboxNetApiSvc




:: Print Spooler
::SC STOP Spooler
::SC CONFIG Spooler start= disabled
::SC DELETE Spooler




:: Fax
SC STOP Fax
SC CONFIG Fax start= disabled
::SC DELETE Fax




:: Windows Image Acquisition (WIA)
SC STOP stisvc
SC CONFIG stisvc start= disabled
::SC DELETE stisvc




:: Bluetooth Support Service
::SC STOP bthserv
::SC CONFIG bthserv start= disabled
::SC DELETE bthserv

:: Bluetooth Service
::SC STOP btwdins
::SC CONFIG btwdins start= disabled
::SC DELETE btwdins

:: Bluetooth Radio Control Service
::SC STOP BcmBtRSupport
::SC CONFIG BcmBtRSupport start= disabled
::SC DELETE BcmBtRSupport

:: Bluetooth Audio Gateway Service
::SC STOP BTAGService
::SC CONFIG BTAGService start= disabled
::SC DELETE BTAGService




:: Windows Search
SC STOP WSearch
SC CONFIG WSearch start= disabled
::SC DELETE WSearch




:: Windows Error Reporting Service
SC STOP WerSvc
SC CONFIG WerSvc start= disabled
::SC DELETE WerSvc




:: Windows Insider Service
SC STOP wisvc
SC CONFIG wisvc start= disabled
::SC DELETE wisvc




:: Touch Keyboard and Handwriting Panel Service
SC STOP TabletInputService
SC CONFIG TabletInputService start= disabled
::SC DELETE TabletInputService




:: Remote Registry
SC STOP RemoteRegistry
SC CONFIG RemoteRegistry start= disabled
::SC DELETE RemoteRegistry




:: Downloaded Maps Manager
SC STOP MapsBroker
SC CONFIG MapsBroker start= disabled
::SC DELETE MapsBroker




:: Connected User Experiences and Telemetry
SC STOP DiagTrack
SC CONFIG DiagTrack start= disabled
::SC DELETE DiagTrack




:: Windows Biometric Service
SC STOP WbioSrvc
SC CONFIG WbioSrvc start= disabled
::SC DELETE WbioSrvc




:: Parental Controls
SC STOP WpcMonSvc
SC CONFIG WpcMonSvc start= disabled
::SC DELETE WpcMonSvc




:: Windows Camera Frame Server
SC STOP FrameServer
SC CONFIG FrameServer start= disabled
::SC DELETE FrameServer




:: Security Center
SC STOP wscsvc
SC CONFIG wscsvc start= disabled
::SC DELETE wscsvc




:: Retail Demo Service
SC STOP RetailDemo
SC CONFIG RetailDemo start= disabled
::SC DELETE RetailDemo




:: Windows Media Player Network Sharing Service
SC STOP WMPNetworkSvc
SC CONFIG WMPNetworkSvc start= disabled
::SC DELETE WMPNetworkSvc




:: Geolocation Service
SC STOP lfsvc
SC CONFIG lfsvc start= disabled
::SC DELETE lfsvc




:: Program Compatibility Assistant Service
SC STOP PcaSvc
SC CONFIG PcaSvc start= disabled
::SC DELETE PcaSvc




:: Enterprise App Management Service
SC STOP EntAppSvc
SC CONFIG EntAppSvc start= disabled
::SC DELETE EntAppSvc




:: Windows Update
SC STOP wuauserv
SC CONFIG wuauserv start= disabled
::SC DELETE wuauserv




:: Microsoft Edge Update Service
SC STOP edgeupdate
SC CONFIG edgeupdate start= disabled
::SC DELETE edgeupdate

:: YandexBrowserService
SC STOP YandexBrowserService
SC CONFIG YandexBrowserService start= disabled
::SC DELETE YandexBrowserService

:: gupdate + gupdatem + GoogleChromeElevationService
SC STOP gupdate
SC CONFIG gupdate start= disabled
::SC DELETE gupdate

SC STOP gupdatem
SC CONFIG gupdatem start= disabled
::SC DELETE gupdatem

SC STOP GoogleChromeElevationService
SC CONFIG GoogleChromeElevationService start= disabled
::SC DELETE GoogleChromeElevationService

:: MozillaMaintenance
SC STOP MozillaMaintenance
SC CONFIG MozillaMaintenance start= disabled
::SC DELETE MozillaMaintenance


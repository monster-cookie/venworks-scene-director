ScriptName Venworks:DynamicScenesEngine:Managers:DSEManager_OnOpen Extends Venworks:DynamicScenesEngine:Managers:DSEManager_Base
{This spawns NPCs on open of the attached container or door}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:DynamicScenesEngine:Data:Enumerations


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Private Variables
;;;
bool HasProcessed = false


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;

; Event received when this object is closed
Event OnOpen(ObjectReference akActionRef)
  SpawnerType spawnerTypeTable = new SpawnerType
  String spawnerType=GetSpawnerType(spawnerTypeTable.OnOpen)

  If (!HasProcessed)
    HasProcessed = true
    LogModuleInformational(functionName="HandleTrigger[" + spawnerType + "]", logMessage="OnOpen triggered, spawning NPCs")
    HandleTrigger(spawnerTypeTable.OnOpen, self)
  EndIf
EndEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions - Logging Helpers
;;;
Function LogModuleInformational(String functionName, String logMessage)
  LogUserInformational(moduleName="Managers:DSEManager_OnOpen", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleWarning(String functionName, String logMessage)
  LogUserWarning(moduleName="Managers:DSEManager_OnOpen", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleError(String functionName, String logMessage)
  LogUserError(moduleName="Managers:DSEManager_OnOpen", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleCritical(String functionName, String logMessage)
  LogUserCritical(moduleName="Managers:DSEManager_OnOpen", functionName=functionName, logMessage=logMessage)
EndFunction

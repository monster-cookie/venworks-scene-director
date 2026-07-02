ScriptName Venworks:DynamicScenesEngine:Managers:DSEManager_OnCellLoad Extends Venworks:DynamicScenesEngine:Managers:DSEManager_Base
{This spawns NPCs on load of the attached cell, packin, or worldspace}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Imports
;;;
Import Venworks:DynamicScenesEngine:Data:Enumerations


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Events
;;;

; Event received when every object in this object's parent cell is loaded (TODO: Find restrictions)
Event OnCellLoad()
  SpawnerType spawnerTypeTable = new SpawnerType
  String spawnerType=GetSpawnerType(spawnerTypeTable.CellLoad)

  LogModuleInformational(functionName="HandleTrigger[" + spawnerType + "]", logMessage="OnCellLoad triggered, spawning NPCs.")
  HandleTrigger(spawnerTypeTable.CellLoad, self)
EndEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions - Logging Helpers
;;;
Function LogModuleInformational(String functionName, String logMessage)
  LogUserInformational(moduleName="Managers:DSEManager_OnCellLoad", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleWarning(String functionName, String logMessage)
  LogUserWarning(moduleName="Managers:DSEManager_OnCellLoad", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleError(String functionName, String logMessage)
  LogUserError(moduleName="Managers:DSEManager_OnCellLoad", functionName=functionName, logMessage=logMessage)
EndFunction

Function LogModuleCritical(String functionName, String logMessage)
  LogUserCritical(moduleName="Managers:DSEManager_OnCellLoad", functionName=functionName, logMessage=logMessage)
EndFunction

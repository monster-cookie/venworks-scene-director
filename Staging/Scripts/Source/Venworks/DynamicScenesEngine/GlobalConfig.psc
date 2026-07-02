ScriptName Venworks:DynamicScenesEngine:GlobalConfig Extends ScriptObject Hidden

Struct Creation
  String Name = "Venworks-DynamicScenesEngine"
EndStruct

String Function GetCreationName() Global
  Creation mod = new Creation
  Return mod.Name
EndFunction
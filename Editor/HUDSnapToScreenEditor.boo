import UnityEngine
import UnityEditor

[CustomEditor (typeof (HUDSnapToScreen))] 
class HUDSnapToScreenEditor (Editor): 

		
	
	def OnInspectorGUI ():
		

		obj as HUDSnapToScreen = target as HUDSnapToScreen;

		if obj == null:
			return
		

		super.DrawDefaultInspector()
		EditorGUILayout.BeginHorizontal ()

		// Rebuild mesh when user click the Rebuild button
		if GUILayout.Button("Update Snapping") :
			obj.UpdateSnap()
		
		EditorGUILayout.EndHorizontal ()

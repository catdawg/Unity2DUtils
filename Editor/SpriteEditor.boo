import UnityEngine
import UnityEditor

[CustomEditor (typeof (Sprite))] 
class SpriteEditor (Editor): 

	[MenuItem ("GameObject/Create Other/Sprite")]
	static def Create():
		
		
		gameObject = GameObject("Sprite")
		s = gameObject.AddComponent[of Sprite]();
		meshFilter = gameObject.GetComponent[of MeshFilter]()
		meshFilter.mesh = Mesh()
		s.Rebuild();
		
		
	
	def OnInspectorGUI ():
		

		obj as Sprite = target as Sprite;

		if obj == null:
			return
		

		super.DrawDefaultInspector()
		EditorGUILayout.BeginHorizontal ()

		// Rebuild mesh when user click the Rebuild button
		if GUILayout.Button("Rebuild") :
			obj.Rebuild()
		
		EditorGUILayout.EndHorizontal ()
	
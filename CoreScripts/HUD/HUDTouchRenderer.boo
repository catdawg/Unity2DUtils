import UnityEngine

class HUDTouchRenderer (MonoBehaviour): 

	
	static defaultTex as Texture
	static mat as Material
	static mesh as Mesh
	
	def Start ():
		
		if defaultTex == null:
			defaultTex = Resources.Load("circle")
			
		if mat == null:
			mat = Material(Shader.Find("SpriteShader"))
			
		if mat.GetTexture("_MainTex") == null:
			mat.SetTexture("_MainTex", defaultTex)
			
		mesh = Mesh()
		width = mat.GetTexture("_MainTex").width
		height = mat.GetTexture("_MainTex").height
		
		populateMeshWithQuad(mesh, width, height)
	
		
		
	
	def DrawTouch(pos as Vector3):
		pos = self.transform.localToWorldMatrix.MultiplyPoint(pos)
		Graphics.DrawMesh(mesh, pos, Quaternion.identity, mat, 0)
		
	
	def Update ():
		for touch as Touch in Input.touches:
			DrawTouch(touch.position)
		
		if Input.GetMouseButton(0):
			DrawTouch(Input.mousePosition)
		

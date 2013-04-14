import UnityEngine


[ExecuteInEditMode]
[RequireComponent(typeof(MeshRenderer)), RequireComponent(typeof(MeshFilter))]
class Sprite (MonoBehaviour):


	static defaultTex as Texture
	static mat as Material
	def Rebuild ():
		if defaultTex == null:
			defaultTex = Resources.Load("DefaultImage")
			
		if mat == null:
			mat = Material(Shader.Find("SpriteShader"))
			
		if mat.GetTexture("_MainTex") == null:
			mat.SetTexture("_MainTex", defaultTex)
		
		renderer.sharedMaterial = mat
		
		meshFilter = GetComponent[of MeshFilter]()
		if meshFilter==null:
			Debug.LogError("MeshFilter not found!")
			return
		
		
		if renderer==null:
			Debug.LogError("Renderer not found!")
			return
		
			
		mesh = meshFilter.sharedMesh
		if mesh == null :
			meshFilter.mesh = Mesh()
			mesh = meshFilter.mesh
		
		mesh.Clear();
		
		width = mat.GetTexture("_MainTex").width
		height = mat.GetTexture("_MainTex").height
		
		populateMeshWithQuad(mesh, width, height)
		

	
		
		
		

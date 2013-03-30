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
			meshFilter.sharedMesh = Mesh()
			mesh = meshFilter.sharedMesh
		
		mesh.Clear();
		
		width = mat.GetTexture("_MainTex").width
		height = mat.GetTexture("_MainTex").height
		
		vertices as (Vector3) = (
			Vector3( width/2, height/2, 0),
			Vector3( width/2, -height/2,0),
			Vector3(-width/2, height/2, 0),
			Vector3(-width/2, -height/2,0),
		)
 
		uv as (Vector2) = (
			Vector2(1, 1),
			Vector2(1, 0),
			Vector2(0, 1),
			Vector2(0, 0),
		)
 
		triangles as (int) = (
			0, 1, 2,
			2, 1, 3,
		)
 
		mesh.vertices = vertices;
		mesh.uv = uv;
		mesh.triangles = triangles;
		

	
		
		
		

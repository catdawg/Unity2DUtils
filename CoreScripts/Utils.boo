import UnityEngine


def populateMeshWithQuad(mesh as Mesh, width as single, height as single):
	
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

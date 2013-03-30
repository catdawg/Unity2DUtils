import UnityEngine
import System



[ExecuteInEditMode]
class HUD (MonoBehaviour): 

	public static ScreenWidth as int
	public static ScreenHeight as int
	
	
	private boxCollider as BoxCollider
	
		
	def CheckScreenSizeChange():
		if ScreenHeight != Screen.height or ScreenWidth != Screen.width:
			ScreenHeight = Screen.height
			ScreenWidth = Screen.width
			HUDEvents.RaiseScreenSizeChanged()
			self.RepositionHUD()	
			
			
		
	
	
	def RepositionHUD():
#ifdef UNITY_EDITOR
		if not Application.isPlaying:
			return
#endif
		transform.localPosition.x = -ScreenWidth/2
		transform.localPosition.y = -ScreenHeight/2
		
	def Awake ():
		
		ScreenWidth = -1
		ScreenHeight = -1
			
		self.RepositionHUD()
		
		HUDEvents.ResetAllEvents()
		
	def OnDrawGizmos():
		Gizmos.DrawLine(Vector3(self.transform.position.x, self.transform.position.y, 0), 
						Vector3(self.transform.position.x + ScreenWidth, self.transform.position.y, 0))
		Gizmos.DrawLine(Vector3(self.transform.position.x, self.transform.position.y, 0), 
						Vector3(self.transform.position.x, self.transform.position.y + ScreenHeight, 0))
		Gizmos.DrawLine(Vector3(self.transform.position.x + ScreenWidth, self.transform.position.y, 0), 
						Vector3(self.transform.position.x + ScreenWidth, self.transform.position.y + ScreenHeight, 0))
		Gizmos.DrawLine(Vector3(self.transform.position.x, self.transform.position.y + ScreenHeight, 0), 
						Vector3(self.transform.position.x + ScreenWidth, self.transform.position.y + ScreenHeight, 0))
				
	
										
	def Update ():
		CheckScreenSizeChange()
		

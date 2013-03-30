import UnityEngine

class CameraScript (MonoBehaviour): 

	def ScreenSizeChanged():
		camera.orthographicSize = HUD.ScreenHeight/2
		
		
	def Start ():
		
		camera.transparencySortMode = TransparencySortMode.Orthographic
		
		camera.orthographicSize = Screen.height/2
		
		HUDEvents.ScreenSizeChanged -= ScreenSizeChanged
		HUDEvents.ScreenSizeChanged += ScreenSizeChanged
	
	
	def Update ():
		pass

import UnityEngine
import System



enum SnapType:
	ToTheBottomLeftOfTheScreen
	ToTheBottomRightOfTheScreen
	ToTheTopRightOfTheScreen
	ToTheTopLeftOfTheScreen
	ToTheMidLeftOfTheScreen
	ToTheMidRightOfTheScreen
	ToTheMidBottomOfTheScreen
	ToTheMidTopOfTheScreen
	ToTheCenterOfTheScreen



[ExecuteInEditMode]
class HUDSnapToScreen (MonoBehaviour): 

	public Snap as SnapType
			

	[SerializeField]
	permaPositionOffset as Vector2
	
	
	
	
	def UpdateOffset():
		if Snap == SnapType.ToTheBottomLeftOfTheScreen:
			permaPositionOffset.x = 0
			permaPositionOffset.y = 0
		elif Snap == SnapType.ToTheBottomRightOfTheScreen:
			permaPositionOffset.x = HUD.ScreenWidth
			permaPositionOffset.y = 0
		elif Snap == SnapType.ToTheTopRightOfTheScreen:
			permaPositionOffset.x = HUD.ScreenWidth
			permaPositionOffset.y = HUD.ScreenHeight
		elif Snap == SnapType.ToTheTopLeftOfTheScreen:
			permaPositionOffset.x = 0
			permaPositionOffset.y = HUD.ScreenHeight
		elif Snap == SnapType.ToTheMidLeftOfTheScreen:
			permaPositionOffset.x = 0
			permaPositionOffset.y = HUD.ScreenHeight/2
		elif Snap == SnapType.ToTheMidRightOfTheScreen:
			permaPositionOffset.x = HUD.ScreenWidth
			permaPositionOffset.y = HUD.ScreenHeight/2
		elif Snap == SnapType.ToTheMidBottomOfTheScreen:
			permaPositionOffset.x = HUD.ScreenWidth/2
			permaPositionOffset.y = 0
		elif Snap == SnapType.ToTheMidTopOfTheScreen:
			permaPositionOffset.x = HUD.ScreenWidth/2
			permaPositionOffset.y = HUD.ScreenHeight
		elif Snap == SnapType.ToTheCenterOfTheScreen:
			permaPositionOffset.x = HUD.ScreenWidth/2
			permaPositionOffset.y = HUD.ScreenHeight/2
		
	
	
	public def UpdateSnap():
		transform.localPosition.x -= permaPositionOffset.x
		transform.localPosition.y -= permaPositionOffset.y
		
		self.UpdateOffset()
		transform.localPosition.x += permaPositionOffset.x
		transform.localPosition.y += permaPositionOffset.y
		
	
		
	private _ScreenSizeChangedSubscribed as int = 0
	def ScreenSizeChanged():
		UpdateSnap()
		
		
	def Start ():
		HUDEvents.ScreenSizeChanged -= ScreenSizeChanged
		HUDEvents.ScreenSizeChanged += ScreenSizeChanged
		UpdateSnap()
		
	
	def Update ():
		pass
		
		

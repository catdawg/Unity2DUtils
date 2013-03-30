


	
public static class HUDEvents:


			
	public event ScreenSizeChanged as callable()
	
	public def RaiseScreenSizeChanged():

		ScreenSizeChanged()


	public def ResetAllEvents():
		ScreenSizeChanged = null
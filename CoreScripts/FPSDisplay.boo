
import UnityEngine
 
class FPSDisplay (MonoBehaviour): 
 
    public updateInterval as single = 0.5
 
    private accum as single = 0 // FPS accumulated over the interval
    private frames as int = 0 // Frames drawn over the interval
    private timeleft as single // Left time for current interval
 
    def Start ():
        if(not guiText):
            Debug.Log("FPS Display needs a GUIText component!")
            enabled = false
        timeleft = updateInterval
 
    def Update ():
        timeleft -= Time.deltaTime
        accum += Time.timeScale/Time.deltaTime
        ++frames
 
        if (timeleft <= 0.0):
            fps = accum/frames
            format = System.String.Format("FPS: {0:F2}", fps);
            guiText.text = format
 
            if(fps < 30):
                guiText.material.color = Color.yellow
            elif(fps < 10):
                guiText.material.color = Color.red
            else:
                guiText.material.color = Color.green
 
            timeleft = updateInterval
            accum = 0.0
            frames = 0
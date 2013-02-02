using UnityEngine;
using System.Runtime.InteropServices;


public enum NativeTransitionAnimation {
	None,
	CoverVertical,
	Flip,
	CrossDissolve
}


public class NativeUI : MonoBehaviour {
	
	
	void Awake() {
		gameObject.name = "NativeUI";
	}
	
	private static bool _pause = true;
	public static bool pause {
		get {
			return _pause;
		}
		set {
			setPauseUnity(value);
			_pause = value;
		}
	}
	

#region iOS
#if UNITY_IPHONE 
	
	[DllImport("__Internal")]
    private static extern void _showStoryboard( string storyboard, int animation );
    
	public static void showStoryboard( string storyboard, NativeTransitionAnimation animation = NativeTransitionAnimation.None) {
		int anim = (int)animation -1;
		
        if( Application.platform == RuntimePlatform.IPhonePlayer) {
			_showStoryboard( storyboard, anim );
		} else {
			Debug.LogError("Cannot display Storyboard on Android!");
		}	
    }
	
#endif
#endregion

	
#region Android
#if UNITY_ANDROID
	// ANDROID COMING
#endif
#endregion
	
	
#region Global	
	
    [DllImport("__Internal")]
    private static extern void _hideUI();
 
    public static void hideUI() {
		
        if (Application.platform == RuntimePlatform.IPhonePlayer) {
			_hideUI();
		} else if (Application.platform == RuntimePlatform.Android) {
			// Android coming	
		}
		
    }
	
#endregion

	
	
#region Unity Control 
	
	[DllImport("__Internal")]
	private static extern void _setPauseUnity(bool pause);
	
	private static void setPauseUnity(bool pause) {
		
		if (Application.platform == RuntimePlatform.IPhonePlayer) {
			_setPauseUnity(pause);
		} else if (Application.platform == RuntimePlatform.Android) {
			// Android coming	
		}
		
	}
	
#endregion

}	

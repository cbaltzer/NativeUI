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
    
	/// <summary>
	/// Shows the initial view controller in a storyboard.
	/// </summary>
	/// <param name='storyboard'>
	/// Storyboard.
	/// </param>
	/// <param name='animation'>
	/// Animation to present with.
	/// </param>
	public static void showStoryboard( string storyboard, NativeTransitionAnimation animation = NativeTransitionAnimation.None ) {
		int anim = (int)animation -1;
		
        if( Application.platform == RuntimePlatform.IPhonePlayer) {
			_showStoryboard( storyboard, anim );
		} else {
			Debug.LogError("Cannot display Storyboard on this platform!");
		}	
    }
	
	
	[DllImport("__Internal")]
	private static extern void _showViewControllerFromXibWithAnimation( string xib, int animation );
	
	/// <summary>
	/// Shows the view controller from xib with animation.
	/// </summary>
	/// <param name='xib'>
	/// The Xib. The view controller must have the same name.
	/// </param>
	/// <param name='animation'>
	/// Animation.
	/// </param>
	public static void showViewControllerFromXibWithAnimation( string xib, NativeTransitionAnimation animation = NativeTransitionAnimation.None ) {
		int anim = (int)animation -1;
		
        if(Application.platform == RuntimePlatform.IPhonePlayer) {
			_showViewControllerFromXibWithAnimation( xib, anim );
		} else {
			Debug.LogError("Cannot display Storyboard on this platform!");
		}	
	}
	
	[DllImport("__Internal")]
	private static extern void _showViewControllerFromXibWithFrame( string xib, float x, float y, float width, float height );
	
	/// <summary>
	/// Shows the view controller from a Xib in a frame. This is for partial views. Does not animate. Does not pause Unity.
	/// </summary>
	/// <param name='xib'>
	/// The Xib. The view controller must have the same name. 
	/// </param>
	/// <param name='frame'>
	/// Frame. Note iOS internally doubles these values for Retina displays. Set your Rect for non-Retina!
	/// </param>
	public static void showViewControllerFromXibWithFrame( string xib, Rect frame) {
		if (Application.platform == RuntimePlatform.IPhonePlayer) {
			_showViewControllerFromXibWithFrame( xib, frame.x, frame.y, frame.width, frame.height);
		} else {
			Debug.LogError("Cannot display Xib on this platform!");
		}
	}
	
	[DllImport("__Internal")]
	private static extern void _sendMessageToListener( string listener, string method, string message );
	
	public static void sendMessageToListener( string listener, string method, string message ) {
		if (Application.platform == RuntimePlatform.IPhonePlayer) {
			_sendMessageToListener( listener, method, message );
		} else {
			Debug.LogError("Cannot send message: " + method + "(" + message + ") to listener " + listener);
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
 
	/// <summary>
	/// Hides the UI.
	/// </summary>
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

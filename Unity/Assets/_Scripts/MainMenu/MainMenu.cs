using UnityEngine;
using System.Collections;

public class MainMenu : MonoBehaviour {
	
	public string storyboardName;
	public string xibName;
	
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		//Debug.Log ("NotPaused: " + Time.time);
	}
	
	
	void OnGUI () {
		
		if(GUI.Button(new Rect( 10, 50, 200, 100), "Native")) {
			Debug.Log("Showing native UI");
			NativeUI.showStoryboard(storyboardName);
		}
		
	
		if(GUI.Button(new Rect( 10, 250, 200, 100), "Native slide")) {
			Debug.Log("Showing native UI");
			NativeUI.showStoryboard(storyboardName, NativeTransitionAnimation.CoverVertical);
		}
		
		
		if(GUI.Button(new Rect( 10, 450, 200, 100), "Native fade")) {
			Debug.Log("Showing native UI");
			NativeUI.showStoryboard(storyboardName, NativeTransitionAnimation.CrossDissolve);
		}
		
		
		if(GUI.Button(new Rect( 10, 650, 200, 100), "Native flip")) {
			Debug.Log("Showing native UI");
			NativeUI.showStoryboard(storyboardName, NativeTransitionAnimation.Flip);
		}
		
		if(GUI.Button(new Rect( 300, 50, 200, 100), "Subview")) {
			NativeUI.showViewControllerFromXibWithFrame(xibName, new Rect(0, 400, 320, 140) );
		}
		
		if(GUI.Button(new Rect( 300, 250, 200, 100), "Modal Xib")) {
			NativeUI.showViewControllerFromXibWithAnimation(xibName, NativeTransitionAnimation.CoverVertical);
		}
		
		
		if(GUI.Button(new Rect( 300, 450, 200, 100), "NoPauseSendMessage")) {
			NativeUI.pause = false;
			NativeUI.showStoryboard(storyboardName);
			Invoke("PassMessageToNative", 3f);
		}
		
		
		if (GUI.Button(new Rect( 600, 50, 50, 50), "x")) {
			NativeUI.hideUI();
		}
	}
	
	public void Load(string level) {
		Debug.Log ("Loading Level: " + level);
		Application.LoadLevelAdditive(level);
	}
	
	public void PassMessageToNative() {
		NativeUI.sendMessageToListener("NUIViewController", "logMessage:", "Test message!");
	}
	
}

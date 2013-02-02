using UnityEngine;
using System.Collections;

public class MainMenu : MonoBehaviour {
	
	public string storyboardName;
	
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	
	void OnGUI () {
		
		if(GUI.Button(new Rect( 10, 50, 200, 100), "Native")) {
			Debug.Log("Showing native UI");
			NativeUI.showStoryboard( storyboardName );
		}
		
	
		if(GUI.Button(new Rect( 10, 250, 200, 100), "Native slide")) {
			Debug.Log("Showing native UI");
			NativeUI.showStoryboard( storyboardName, NativeTransitionAnimation.CoverVertical);
		}
		
		
		if(GUI.Button(new Rect( 10, 450, 200, 100), "Native fade")) {
			Debug.Log("Showing native UI");
			NativeUI.showStoryboard( storyboardName, NativeTransitionAnimation.CrossDissolve);
		}
		
		
		if(GUI.Button(new Rect( 10, 650, 200, 100), "Native flip")) {
			Debug.Log("Showing native UI");
			NativeUI.showStoryboard( storyboardName, NativeTransitionAnimation.Flip);
		}
		
	}
}

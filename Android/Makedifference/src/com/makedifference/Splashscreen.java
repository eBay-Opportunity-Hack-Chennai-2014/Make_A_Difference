package com.makedifference;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;

public class Splashscreen extends Activity {
	MediaPlayer mMediaPlayer;
	Uri uri;
	String store_date = "MyStoredDates";
	String storeddates[] = new String[3];
	Thread t = null;
	Context mContext=Splashscreen.this;
    SharedPreferences appPreferences;
    boolean isAppInstalled = false;
    Thread splash;
    public static Splashscreen sp;
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.flash);
		
		sp=this;

	}

	

	@Override
	protected void onResume() {
		super.onResume();
		
		
		
	
		 splash = new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					Thread.sleep(8000);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					Intent i = new Intent(Splashscreen.this, MainActivity.class);
					finish();
					startActivity(i);
					//finish();
				}
			}
		});
		splash.start();
	}
	
	
	
}
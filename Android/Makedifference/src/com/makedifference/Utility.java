package com.makedifference;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.util.Log;

public class Utility {
	
	
	
 	
	public static boolean isNetworkAvailable(Context con) {
		ConnectivityManager cm = (ConnectivityManager) con
				.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo ni = cm.getActiveNetworkInfo();
		if (ni != null && ni.isConnected()) {
			Log.e("Internet in metroactivity: ", "Present");
			return true;
		} else {
			Log.e("Internet in metroactivity: ", "Absent");
			return false;
		}
	}
	
	/**
	 * Show alert dialog.
	 *
	 * @param con the con
	 * @param title the title
	 * @param msg the msg
	 */

	
	@SuppressWarnings("deprecation")
	public static void showAlertDialog(Context con, String title, String msg) {
		AlertDialog alertDialog = new AlertDialog.Builder(con).create();
		
		// Setting Dialog Title
		alertDialog.setTitle(title);

		// Setting Dialog Message
		alertDialog.setMessage(msg);

		// Setting OK Button
		alertDialog.setButton("Ok", new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int which) {
				// Write your code here to execute after dialog closed

				dialog.dismiss();
			}
		});

		// Showing Alert Message
		alertDialog.show();
	}
	
	
	
}

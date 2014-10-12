package com.makedifference;

import org.json.JSONObject;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;

import com.makedifference.Json.APIConnection;

public class MainActivity extends Activity {
	EditText userEditText, pwdEditText;
	Button loginButton;
	String name_str="";
	String password_str="";


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.login);
		userEditText = (EditText) findViewById(R.id.edit_username);
		pwdEditText = (EditText) findViewById(R.id.edit_pwd);
		loginButton = (Button) findViewById(R.id.login_btn);
		
		userEditText.setText("fiona.annette.0110@gmail.com");
		pwdEditText.setText("pass");
		loginButton.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View arg0) {
				submitValidation();
			}
		});
	}

	private void submitValidation() {

		 name_str = userEditText.getText().toString();
		 password_str = pwdEditText.getText().toString();

		if (name_str.equals("") || password_str.equals("")) {

			if (name_str.equals("")) {

				Utility.showAlertDialog(MainActivity.this, "Error",
						"Please enter user");

			} else if (password_str.equals("")) {
				Utility.showAlertDialog(MainActivity.this, "Error",
						"Please enter password");
			}

		}

		else {
			if (Utility.isNetworkAvailable(MainActivity.this)) {
				new getRegister().execute();
			} else {
				Utility.showAlertDialog(MainActivity.this, "Error",
						"Network Not Avilable");
			}

		}

	}

	public class getRegister extends AsyncTask<Void, Void, String> {

		String url = "http://makeadiff.in/madapp/index.php/api/user_login?email="+name_str+"&password="+password_str;

		/** The dialog. */
		ProgressDialog dialog = new ProgressDialog(getBaseContext());

		/*
		 * (non-Javadoc)
		 * 
		 * @see android.os.AsyncTask#onPostExecute(java.lang.Object)
		 */
		@Override
		protected void onPostExecute(String result) {
			super.onPostExecute(result);
			dialog.dismiss();

			if (result.equals("")) {
				Utility.showAlertDialog(MainActivity.this, "Error",
						"Network Not Avilable");

			} else {
				System.out.println(" Login Details " + result);
				loginMethod(result);
			}

		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see android.os.AsyncTask#onPreExecute()
		 */
		@Override
		protected void onPreExecute() {
			super.onPreExecute();
			dialog = ProgressDialog
					.show(MainActivity.this, "Loading", "", true);

		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see android.os.AsyncTask#doInBackground(java.lang.Object[])
		 */
		@Override
		protected String doInBackground(Void... params) {

			if (Utility.isNetworkAvailable(MainActivity.this)) {

				String response = APIConnection.getData(url);
				return response;

			} else {
				return "";
			}

		}

	}

	private void loginMethod(String result) {
		// TODO Auto-generated method stub
		
		try
		{
		JSONObject jsonobj=new JSONObject(result);
		
		if(jsonobj.optString("status").equals("1"))
		{
			
			SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(MainActivity.this);
			SharedPreferences.Editor editor = preferences.edit();
			editor.putString("user_id", jsonobj.optString("user_id"));
			editor.putString("key", jsonobj.optString("key"));
			editor.putString("name", jsonobj.optString("name"));
			editor.putString("city_id", jsonobj.optString("city_id"));
			editor.commit();
			System.out.println(" SHARED PREFERENCE ####### ");
			System.out.println(preferences.getString("user_id","EMPTY"));
			System.out.println(preferences.getString("key","EMPTY"));
			System.out.println(preferences.getString("name","EMPTY"));
			System.out.println(preferences.getString("city_id","EMPTY"));
			
			
			System.out.println("status"+jsonobj.optString("status"));
			Intent in=new Intent(MainActivity.this,Homeactivity.class);
			in.putExtra("user_id", jsonobj.optString("user_id"));
			in.putExtra("key", jsonobj.optString("key"));
			in.putExtra("name", jsonobj.optString("name"));
			in.putExtra("city_id", jsonobj.optString("city_id"));
			startActivity(in);
			
		}
		else
		{
			Utility.showAlertDialog(MainActivity.this, "Error",
					"Invalid user or password");
		}
		
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}

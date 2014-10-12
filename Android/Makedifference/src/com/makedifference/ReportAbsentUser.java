package com.makedifference;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import com.makedifference.ReportAbsentUser.getRegister;
import com.makedifference.Json.APIConnection;

public class ReportAbsentUser extends Activity implements OnClickListener {


	Button back_btn;
	
	ListView level;
	ArrayList<String> classtime=new ArrayList<String>();
	ArrayList<String> classstatus=new ArrayList<String>();
	ArrayList<String> classchange=new ArrayList<String>();
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.attenance);
		
		back_btn=(Button)findViewById(R.id.back_btn);
		level = (ListView) findViewById(R.id.listView1);
		new getRegister().execute();
		back_btn.setOnClickListener(this);
		TextView head=(TextView)findViewById(R.id.head);
		head.setText("Absent User");
		
	}

	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		
		switch (v.getId()) {
		case R.id.back_btn:
        	finish();
        	break;
		}
		}
	
	
	public class getRegister extends AsyncTask<Void, Void, String> {
		SharedPreferences preferences = PreferenceManager
				.getDefaultSharedPreferences(ReportAbsentUser.this);
		/*
		 * String url =
		 * "http://makeadiff.in/madapp/index.php/api/class_get_last_batch?user_id="
		 * + preferences.getString("user_id", "") + "&key=" +
		 * preferences.getString("key", "");
		 * 
		 * 
		 */
		
		
		String url="http://makeadiff.in/madapp/index.php/api/report_absent_user?city_id=1&key="+ preferences.getString("key", "");
		
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
				Utility.showAlertDialog(ReportAbsentUser.this, "Error",
						"Network Not Avilable");

			} else {
				System.out.println(" Atten Details " + result);
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
			System.out.println("level url ####" + url);
			dialog = ProgressDialog
					.show(ReportAbsentUser.this, "Loading", "", true);

		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see android.os.AsyncTask#doInBackground(java.lang.Object[])
		 */
		@Override
		protected String doInBackground(Void... params) {

			if (Utility.isNetworkAvailable(ReportAbsentUser.this)) {

				String response = APIConnection.getData(url);
				return response;

			} else {
				return "";
			}

		}

	}

	@SuppressLint("NewApi")
	private void loginMethod(String result) {
		// TODO Auto-generated method stub

		try {
			JSONObject jsonobj = new JSONObject(result);
			JSONArray jsonobjtaecher = jsonobj.getJSONArray("data");
			for (int i = 0; i < jsonobjtaecher.length(); i++) {

				
				classtime.add("Center name:"+jsonobjtaecher.getJSONObject(i).getString(
						"center_name"));
				classchange.add("Time :"+jsonobjtaecher.getJSONObject(i)
						.getString("class_nime"));
				
				classstatus.add("Name :"+jsonobjtaecher.getJSONObject(i)
						.getString("name"));
				

			}

			/*
			 * Iterator<String> keys = classes.keys();
			 * 
			 * while (keys.hasNext()) { String key = keys.next();
			 * Log.v("**********", "**********"); Log.v("category key", key);
			 * JSONObject innerJObject = classes.getJSONObject(key);
			 * System.out.println(innerJObject.getString("id"));
			 * System.out.println(innerJObject.getString("level_id"));
			 * System.out.println(innerJObject.getString("level_name"));
			 * System.out.println(innerJObject.getString("lesson_id"));
			 * System.out.println(innerJObject.getString("student_attendence"));
			 * levelname_ar.add(innerJObject.getString("level_name"));
			 * 
			 * 
			 * JSONArray taecher=innerJObject.getJSONArray("teachers"); for (int
			 * i = 0; i < taecher.length(); i++) { JSONObject
			 * j=taecher.getJSONObject(i);
			 * System.out.println(" TEACHER "+j.getString("id")); }
			 * 
			 * 
			 * 
			 * }
			 */
			/*
			 * for (int i = 0; i < jsonobj.optString("classes").length(); i++) {
			 * 
			 * JSONObject jsonobject_level=new
			 * JSONObject(jsonobj.optString("classes").get);
			 * 
			 * }
			 */

			Creditadapter adapter = new Creditadapter(ReportAbsentUser.this, classstatus,classtime,classchange,1,R.drawable.reports);
			level.setAdapter(adapter);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}
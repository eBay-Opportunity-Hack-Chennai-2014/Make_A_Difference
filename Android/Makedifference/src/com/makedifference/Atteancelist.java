package com.makedifference;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.Button;
import android.widget.ListView;

import com.makedifference.Json.APIConnection;

public class Atteancelist extends Activity implements OnClickListener {

	Button back_btn;
	ListView level;
	WorkorderListadapter adapter;

	ArrayList<String> levelname_ar = new ArrayList<String>();
	ArrayList<String> id = new ArrayList<String>();
	ArrayList<String> level_id = new ArrayList<String>();
	ArrayList<String> lesson_id = new ArrayList<String>();
	ArrayList<String> student_attendence = new ArrayList<String>();
	ArrayList<String> teachersid = new ArrayList<String>();
	ArrayList<String> teachersname = new ArrayList<String>();
	ArrayList<Integer> maxUnit = new ArrayList<Integer>();
	ArrayList<String> class_status_ar = new ArrayList<String>();
	ArrayList<String> class_id_ar = new ArrayList<String>();
	ArrayList<String> teacherid_ar = new ArrayList<String>();
	ArrayList<String> lessonid_ar = new ArrayList<String>();
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.attenance);

		back_btn = (Button) findViewById(R.id.back_btn);
		back_btn.setOnClickListener(this);
		level = (ListView) findViewById(R.id.listView1);
		new getRegister().execute();

		level.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long arg3) {

				ArrayList<String> teacherlist = new ArrayList<String>();
				ArrayList<String> teacheridlist = new ArrayList<String>();
				for (int i = 0; i < teachersid.size(); i++) {

					if (teachersid.get(i).equals(levelname_ar.get(position))) {
						teacherlist.add(teachersname.get(i));
						teacheridlist.add(teacherid_ar.get(i));
					}

				}

				System.out.println("attteachernamelist" + teacherlist);

				Intent in = new Intent(Atteancelist.this, AtteanceView.class);
				in.putExtra("levelname", levelname_ar.get(position));
				in.putExtra("student_attendence",
						student_attendence.get(position));
				in.putStringArrayListExtra("teacher", teacherlist);
				in.putStringArrayListExtra("teacherid", teacheridlist);
				in.putExtra("max", maxUnit.get(position));
				in.putExtra("class_status", class_status_ar.get(position));
				in.putExtra("class_id", class_id_ar.get(position));
				in.putExtra("lesson_id", lessonid_ar.get(position));
				startActivity(in);

			}
		});

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
				.getDefaultSharedPreferences(Atteancelist.this);
		/*
		 * String url =
		 * "http://makeadiff.in/madapp/index.php/api/class_get_last_batch?user_id="
		 * + preferences.getString("user_id", "") + "&key=" +
		 * preferences.getString("key", "");
		 */
		String url = "http://makeadiff.in/madapp/index.php/api/class_get_last_batch?user_id="
				+ "1" + "&key=" + preferences.getString("key", "");

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
				Utility.showAlertDialog(Atteancelist.this, "Error",
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
					.show(Atteancelist.this, "Loading", "", true);

		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see android.os.AsyncTask#doInBackground(java.lang.Object[])
		 */
		@Override
		protected String doInBackground(Void... params) {

			if (Utility.isNetworkAvailable(Atteancelist.this)) {

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
			JSONArray jsonobjtaecher = jsonobj.getJSONArray("classes");
			for (int i = 0; i < jsonobjtaecher.length(); i++) {

				JSONArray taecher = jsonobjtaecher.getJSONObject(i)
						.getJSONArray("teachers");
				levelname_ar.add(jsonobjtaecher.getJSONObject(i).getString(
						"level_name"));
				student_attendence.add(jsonobjtaecher.getJSONObject(i)
						.getString("student_attendence"));
				
				class_status_ar.add(jsonobjtaecher.getJSONObject(i)
						.getString("class_status"));
				class_id_ar.add(jsonobjtaecher.getJSONObject(i)
						.getString("id"));
				
				lessonid_ar.add(jsonobjtaecher.getJSONObject(i)
						.getString("lesson_id"));
				
				
				maxUnit.add(jsonobjtaecher.getJSONObject(i).getInt(
						"max_lesson"));
				for (int j = 0; j < taecher.length(); j++) {

					JSONObject je = taecher.getJSONObject(j);
					System.out.println(" TEACHER " + je.getString("id"));

					teachersname.add(je.getString("name"));
					teacherid_ar.add(je.getString("id"));
					teachersid.add(jsonobjtaecher.getJSONObject(i).getString(
							"level_name"));
				}

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

			adapter = new WorkorderListadapter(Atteancelist.this, levelname_ar);
			level.setAdapter(adapter);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

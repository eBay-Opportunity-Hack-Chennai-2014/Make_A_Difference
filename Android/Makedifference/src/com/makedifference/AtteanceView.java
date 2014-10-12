package com.makedifference;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;

import com.makedifference.Json.APIConnection;

public class AtteanceView extends Activity implements OnClickListener {

	String levelname_str = "";
	String student_str = "";
	String classid_str = "", lesson_str = "";
	ArrayList<String> teachernamelist = new ArrayList<String>();
	ArrayList<String> teacheridlist = new ArrayList<String>();
	ImageView check;
	TextView t1, t2, t3;
	Button save;
	Spinner stnds, sub, unit, attnded;
	int max;
	ArrayList<String> maxArr = new ArrayList<String>();
	ArrayList<String> strArr = new ArrayList<String>();
	ArrayList<String> attatnce = new ArrayList<String>();
	LinearLayout ll1, ll2, ll3;
	static String log;
	ArrayList<String> alist = new ArrayList<String>();
	ArrayList<String> id = new ArrayList<String>();
	String teacherstr = "";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.attenanceview);
		attatnce.add("Persent");
		attatnce.add("Absent");
		levelname_str = getIntent().getExtras().getString("levelname");
		lesson_str = getIntent().getExtras().getString("lesson_id");
		classid_str = getIntent().getExtras().getString("class_id");
		student_str = getIntent().getExtras().getString("student_attendence");
		teachernamelist = getIntent().getStringArrayListExtra("teacher");
		teacheridlist = getIntent().getStringArrayListExtra("teacherid");
		log = getIntent().getExtras().getString("class_status");
		System.out.println("teachernamelist" + teachernamelist);
		check = (ImageView) findViewById(R.id.check_cancel);

		max = getIntent().getIntExtra("max", 0);
		for (int i = 0; i < max; i++) {
			if (i == 0) {
				maxArr.add("none");

			} else {
				maxArr.add("" + i);
			}
		}

		maxArr.add("Revision");
		maxArr.add("Test");

		t1 = (TextView) findViewById(R.id.teachers1);
		t2 = (TextView) findViewById(R.id.teachers2);
		t3 = (TextView) findViewById(R.id.teachers3);
		save = (Button) findViewById(R.id.login_btn);
		sub = (Spinner) findViewById(R.id.sub);
		unit = (Spinner) findViewById(R.id.unit);
		attnded = (Spinner) findViewById(R.id.attnd);
		stnds = (Spinner) findViewById(R.id.students);
		ll1 = (LinearLayout) findViewById(R.id.tl1);
		ll2 = (LinearLayout) findViewById(R.id.tl2);
		ll3 = (LinearLayout) findViewById(R.id.tl3);

		if (teachernamelist.size() == 3) {
			t1.setText("" + teachernamelist.get(0));
			t2.setText("" + teachernamelist.get(1));
			t3.setText("" + teachernamelist.get(2));

			teacherstr = "&teacher_id[0]=" + teacheridlist.get(0)
					+ "&teacher_id[1]=" + teacheridlist.get(1)
					+ "&teacher_id[2]=" + teacheridlist.get(2);
		}
		if (teachernamelist.size() == 2) {
			ll3.setVisibility(View.GONE);
			t1.setText("" + teachernamelist.get(0));
			t2.setText("" + teachernamelist.get(1));
			teacherstr = "&teacher_id[0]=" + teacheridlist.get(0)
					+ "&teacher_id[1]=" + teacheridlist.get(1);

		}
		if (teachernamelist.size() == 1) {
			ll2.setVisibility(View.GONE);
			ll3.setVisibility(View.GONE);
			t1.setText("" + teachernamelist.get(0));
			teacherstr = "&teacher_id[0]=" + teacheridlist.get(0);
		}

		String[] strNo = student_str.split("/");
		int i = Integer.parseInt(strNo[1]);
		for (int j = 0; j < i; j++) {
			strArr.add("" + (j + 1) + "/" + i);
		}

		ArrayAdapter<String> dataAdapter_three = new ArrayAdapter<String>(this,
				android.R.layout.simple_spinner_item, maxArr) {
			public View getView(int position, View convertView, ViewGroup parent) {
				View v = super.getView(position, convertView, parent);
				((TextView) v).setTextColor(getResources().getColor(
						R.color.black));
				((TextView) v).setText(maxArr.get(position));
				return v;
			}

			public View getDropDownView(int position, View convertView,
					ViewGroup parent) {
				View v = super.getDropDownView(position, convertView, parent);

				((TextView) v).setText(maxArr.get(position));
				((TextView) v).setTextColor(getResources().getColor(
						R.color.black));

				return v;
			}
		};
		save.setOnClickListener(this);
		findViewById(R.id.back_btn).setOnClickListener(this);
		findViewById(R.id.check_cancel).setOnClickListener(this);

		dataAdapter_three
				.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		unit.setAdapter(dataAdapter_three);

		ArrayAdapter<String> dataAdapter_two = new ArrayAdapter<String>(this,
				android.R.layout.simple_spinner_item, strArr) {
			public View getView(int position, View convertView, ViewGroup parent) {
				View v = super.getView(position, convertView, parent);

				((TextView) v).setText(strArr.get(position));
				((TextView) v).setTextColor(getResources().getColor(
						R.color.black));
				return v;
			}

			public View getDropDownView(int position, View convertView,
					ViewGroup parent) {
				View v = super.getDropDownView(position, convertView, parent);

				((TextView) v).setText(strArr.get(position));
				((TextView) v).setTextColor(getResources().getColor(
						R.color.black));

				return v;
			}
		};

		dataAdapter_two
				.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		stnds.setAdapter(dataAdapter_two);

		ArrayAdapter<String> dataAdapter_one = new ArrayAdapter<String>(this,
				android.R.layout.simple_spinner_item, attatnce) {
			public View getView(int position, View convertView, ViewGroup parent) {
				View v = super.getView(position, convertView, parent);

				((TextView) v).setText(attatnce.get(position));
				((TextView) v).setTextColor(getResources().getColor(
						R.color.black));
				return v;
			}

			public View getDropDownView(int position, View convertView,
					ViewGroup parent) {
				View v = super.getDropDownView(position, convertView, parent);

				((TextView) v).setText(attatnce.get(position));
				((TextView) v).setTextColor(getResources().getColor(
						R.color.black));

				return v;
			}
		};

		dataAdapter_one
				.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		attnded.setAdapter(dataAdapter_one);
		String url = "http://makeadiff.in/madapp/index.php/api/user_get_teachers?city_id=10&key=am3omo32hom4lnv32vO";
		new getRegister().execute(url);

	}

	@Override
	public void onClick(View v) {
		System.out.println("Clicked");
		switch (v.getId()) {
		case R.id.back_btn:
			finish();
			break;
		case R.id.check_cancel:
			// finish();
			System.out.println("Clicked check");
			if (log.equals("1")) {

				System.out.println("Clicked check if");
				check.setImageResource(android.R.drawable.presence_online);
				log = "0";
			} else {
				log = "1";
				System.out.println("Clicked check else");
				check.setImageResource(android.R.drawable.presence_offline);
			}
			break;
		case R.id.login_btn:

			// ImageView check;
			// TextView t1, t2, t3;
			// Button save;
			// Spinner stnds, sub, unit, attnded;
			new getRegisterNew().execute("");

			if (log.equals("1")) {

			} else {

			}

			// finish();
			break;

		}

	}

	public class getRegister extends AsyncTask<String, Void, String> {

		String url = "http://makeadiff.in/madapp/index.php/api/user_login?email="
				+ "" + "&password=" + "";

		/** The dialog. */
		ProgressDialog dialog = new ProgressDialog(getBaseContext());

		@Override
		protected void onPostExecute(String result) {
			super.onPostExecute(result);
			dialog.dismiss();

			if (result.equals("")) {
				Utility.showAlertDialog(AtteanceView.this, "Error",
						"Network Not Avilable");

			} else {
				System.out.println(" Login Details " + result);
				loginMethod(result);
			}

		}

		@Override
		protected void onPreExecute() {
			super.onPreExecute();
			dialog = ProgressDialog
					.show(AtteanceView.this, "Loading", "", true);

		}

		@Override
		protected String doInBackground(String... params) {

			if (Utility.isNetworkAvailable(AtteanceView.this)) {
				String url1 = params[0];
				System.out.println(" DYNAMIC URL" + url1);
				String response = APIConnection.getData(url1);
				return response;

			} else {
				return "";
			}

		}

	}

	private void loginMethod(String result) {
		// TODO Auto-generated method stub

		try {

			System.out.println(" URLLLL " + result);
			JSONObject jsonobj = new JSONObject(result);
			JSONArray arr = jsonobj.getJSONArray("teachers");
			for (int i = 0; i < arr.length(); i++) {
				JSONObject j = arr.getJSONObject(i);
				System.out.println(" " + j.getString("name"));
				alist.add(j.getString("name"));
				id.add(j.getString("id"));
				// System.out.println(" " +arr.getString(i));
			}
			/*
			 * for (int i = 0; i < jsonobj.length(); i++) { Iterator<String> itr
			 * = jsonobj.keys(); while (itr.hasNext()) { String key =
			 * itr.next(); System.out.println("key SSS  " + key); JSONObject
			 * inner = new JSONObject(String.valueOf(key));
			 * System.out.println(" TEACHERS " + inner.getString("name"));
			 * 
			 * } }
			 */

			ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this,
					android.R.layout.simple_spinner_item, alist) {
				public View getView(int position, View convertView,
						ViewGroup parent) {
					View v = super.getView(position, convertView, parent);

					((TextView) v).setText(alist.get(position));
					((TextView) v).setTextColor(getResources().getColor(
							R.color.black));
					return v;
				}

				public View getDropDownView(int position, View convertView,
						ViewGroup parent) {
					View v = super.getDropDownView(position, convertView,
							parent);

					((TextView) v).setText(alist.get(position));
					((TextView) v).setTextColor(getResources().getColor(
							R.color.black));

					return v;
				}
			};

			dataAdapter
					.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
			sub.setAdapter(dataAdapter);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public class getRegisterNew extends AsyncTask<String, Void, String> {
		SharedPreferences preferences = PreferenceManager
				.getDefaultSharedPreferences(AtteanceView.this);

		String url = "http://makeadiff.in/madapp/index.php/api/class_save_level?key="
				+ preferences.getString("key", "")
				+ "&class_id="
				+ classid_str
				+ "&lesson_id="
				+ lesson_str
				+ teacherstr
				+ "&substitute_id[0]="
				+ id.get(sub.getSelectedItemPosition())
				+ "&status[0]="
				+ attnded.getSelectedItemPosition()
				+ "&zero_hour_attendance[0]=1" + "&substitute_id[1]=1&status[1]=absent&zero_hour_attendance[1]=0&";

		/** The dialog. */
		ProgressDialog dialog = new ProgressDialog(getBaseContext());

		@Override
		protected void onPostExecute(String result) {
			super.onPostExecute(result);
			dialog.dismiss();

			if (result.equals("")) {
				Utility.showAlertDialog(AtteanceView.this, "Error",
						"Network Not Avilable");

			} else {
				System.out.println(" Login Details " + result);
				// loginMethodNew(result);
				
				

				AlertDialog alertDialog = new AlertDialog.Builder(AtteanceView.this).create();
				
				// Setting Dialog Title
				alertDialog.setTitle("Info");

				// Setting Dialog Message
				alertDialog.setMessage("Successfully updated");

				// Setting OK Button
				alertDialog.setButton("Ok", new DialogInterface.OnClickListener() {
					public void onClick(DialogInterface dialog, int which) {
						// Write your code here to execute after dialog closed

						dialog.dismiss();
						finish();
					}
				});

				// Showing Alert Message
				alertDialog.show();
			
			}

		}

		@Override
		protected void onPreExecute() {
			super.onPreExecute();
			System.out.println("  ggggg  " + url);
			dialog = ProgressDialog
					.show(AtteanceView.this, "Loading", "", true);

		}

		@Override
		protected String doInBackground(String... params) {

			if (Utility.isNetworkAvailable(AtteanceView.this)) {
				String url1 = params[0];
				System.out.println(" DYNAMIC URL" + url);
				String response = APIConnection.getData(url);
				return response;

			} else {
				return "";
			}

		}

	}

	private void loginMethodNew(String result) {
		// TODO Auto-generated method stub

		try {

			System.out.println(" URLLLL " + result);
			JSONObject jsonobj = new JSONObject(result);
			JSONArray arr = jsonobj.getJSONArray("teachers");
			for (int i = 0; i < arr.length(); i++) {
				JSONObject j = arr.getJSONObject(i);
				System.out.println(" " + j.getString("name"));
				alist.add(j.getString("name"));
				// System.out.println(" " +arr.getString(i));
			}
			/*
			 * for (int i = 0; i < jsonobj.length(); i++) { Iterator<String> itr
			 * = jsonobj.keys(); while (itr.hasNext()) { String key =
			 * itr.next(); System.out.println("key SSS  " + key); JSONObject
			 * inner = new JSONObject(String.valueOf(key));
			 * System.out.println(" TEACHERS " + inner.getString("name"));
			 * 
			 * } }
			 */

			ArrayAdapter<String> dataAdapter = new ArrayAdapter<String>(this,
					android.R.layout.simple_spinner_item, alist) {
				public View getView(int position, View convertView,
						ViewGroup parent) {
					View v = super.getView(position, convertView, parent);

					((TextView) v).setText(alist.get(position));
					((TextView) v).setTextColor(getResources().getColor(
							R.color.black));
					return v;
				}

				public View getDropDownView(int position, View convertView,
						ViewGroup parent) {
					View v = super.getDropDownView(position, convertView,
							parent);

					((TextView) v).setText(alist.get(position));
					((TextView) v).setTextColor(getResources().getColor(
							R.color.black));

					return v;
				}
			};

			dataAdapter
					.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
			sub.setAdapter(dataAdapter);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

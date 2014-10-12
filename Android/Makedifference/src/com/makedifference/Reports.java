package com.makedifference;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class Reports extends Activity implements OnClickListener {

	Button back_btn, bt1, bt2, bt3;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.reports);
		back_btn = (Button) findViewById(R.id.back_btn);
		back_btn.setOnClickListener(this);
		bt1 = (Button) findViewById(R.id.lowcredits);
		bt2 = (Button) findViewById(R.id.substitute);
		bt3 = (Button) findViewById(R.id.creditleaders);
		bt1.setOnClickListener(this);
		bt2.setOnClickListener(this);
		bt3.setOnClickListener(this);
		

	}

	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub

		switch (v.getId()) {
		case R.id.back_btn:
			finish();
			break;
		case R.id.lowcredits:
			Intent in_low =new Intent(Reports.this, ReportLowCreditUser.class);
			startActivity(in_low);
			break;
		case R.id.substitute:
			Intent in =new Intent(Reports.this, ReportAbsentUser.class);
			startActivity(in);
			break;
		case R.id.creditleaders:
			Intent in_board =new Intent(Reports.this, ReportCreditLeaderboard.class);
			startActivity(in_board);
			break;
		}
	}

}
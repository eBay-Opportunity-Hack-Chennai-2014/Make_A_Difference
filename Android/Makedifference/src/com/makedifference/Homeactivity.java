package com.makedifference;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageButton;

public class Homeactivity  extends Activity implements OnClickListener {


	ImageButton attenance,classhistory,credithistory,voluntarydb,reports;
	Button back_btn;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.home);
		
		attenance=(ImageButton)findViewById(R.id.attenance_imgbtn);
		classhistory=(ImageButton)findViewById(R.id.class_imgbtn);
		credithistory=(ImageButton)findViewById(R.id.credit_imgbtn);
		voluntarydb=(ImageButton)findViewById(R.id.voluntary_imgbtn);
		reports=(ImageButton)findViewById(R.id.reports_imgbtn);
		back_btn=(Button)findViewById(R.id.back_btn);
		back_btn.setOnClickListener(this);
		attenance.setOnClickListener(this);
		classhistory.setOnClickListener(this);
		credithistory.setOnClickListener(this);
		voluntarydb.setOnClickListener(this);
		reports.setOnClickListener(this);
		
		
		
		
	}

	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		
		switch (v.getId()) {

		case R.id.attenance_imgbtn:
			
			Intent in=new Intent(Homeactivity.this,Atteancelist.class);
			startActivity(in);
			
			break;
			
        case R.id.class_imgbtn:
        	Intent in_class=new Intent(Homeactivity.this,ClassHistory.class);
			startActivity(in_class);
			
			break;
        case R.id.credit_imgbtn:
        	Intent in_credit=new Intent(Homeactivity.this,CreditHistory.class);
			startActivity(in_credit);
			
			
			break;
        case R.id.voluntary_imgbtn:
        	Intent in_vol=new Intent(Homeactivity.this,VolutantaryDb.class);
			startActivity(in_vol);
			
			break;
        case R.id.reports_imgbtn:
        	Intent in_report=new Intent(Homeactivity.this,Reports.class);
			startActivity(in_report);
			
			break;
			
        case R.id.back_btn:
        	finish();
        	break;
			
		}
		
	}
}

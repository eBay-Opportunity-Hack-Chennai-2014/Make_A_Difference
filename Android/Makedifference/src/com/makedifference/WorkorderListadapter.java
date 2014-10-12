package com.makedifference;

import java.util.ArrayList;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

@SuppressLint("ResourceAsColor")
public class WorkorderListadapter extends ArrayAdapter<String> {
	Context context;
	ArrayList<String> level;

	int selectedpos = 0;
	String[] classficationList;

	public WorkorderListadapter(Context context, ArrayList<String> level) {
		super(context, R.layout.list_item, level.size());
		this.context = context;
		this.level = level;
	}

	public int getCount() {
		return level.size();
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		LayoutInflater inflater = (LayoutInflater) context
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		View rowView = inflater.inflate(R.layout.list_item, parent, false);
		TextView wonum = (TextView) rowView.findViewById(R.id.level_item);
		ImageView img=(ImageView)rowView.findViewById(R.id.img_list);
		img.setBackgroundResource(R.drawable.attendence_img);
		wonum.setText("" + level.get(position));
		return rowView;
	}
}

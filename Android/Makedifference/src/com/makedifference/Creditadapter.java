package com.makedifference;

import java.util.ArrayList;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class Creditadapter extends ArrayAdapter<String> {
	Context context;
	ArrayList<String> levelone;
	ArrayList<String> leveltwo;
	ArrayList<String> levelthree;
	int selectedpos = 0;
	String[] classficationList;
	int check=0,checkimg;

	public Creditadapter(Context context, ArrayList<String> level,ArrayList<String> leveltwo,ArrayList<String> levelthree,int check,int checkimg) {
		super(context, R.layout.list_item, level.size());
		this.context = context;
		this.levelone = level;
		this.leveltwo = leveltwo;
		this.levelthree = levelthree;
		this.check=check;
		this.checkimg=checkimg;
	}

	public int getCount() {
		return levelone.size();
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		LayoutInflater inflater = (LayoutInflater) context
				.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		View rowView = inflater.inflate(R.layout.creditlist_item, parent, false);
		TextView one = (TextView) rowView.findViewById(R.id.level_item_one);
		TextView two = (TextView) rowView.findViewById(R.id.level_item_two);
		TextView three = (TextView) rowView.findViewById(R.id.level_item_three);
		//TextView nextTV=(TextView)rowView.findViewById(R.id.nextTV);
		ImageView img=(ImageView)rowView.findViewById(R.id.img_list);
		img.setBackgroundResource(checkimg);
		one.setText("" + levelone.get(position));
		two.setText("" + leveltwo.get(position));
		three.setText("" + levelthree.get(position));
		/*if(check==1)
		{
			nextTV.setVisibility(View.GONE);
		}*/
		return rowView;
	}
}

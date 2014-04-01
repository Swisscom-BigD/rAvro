package io.kvant.r.ravro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataFrame {
	Map<String, List<Object>> data = new HashMap<String, List<Object>>();
	String[] colNames;
	String[] colTypes;
	
	public DataFrame(String[] colNames, String[] colTypes) {
		this.colNames = colNames;
		this.colTypes = colTypes;
		for(String colName : colNames) {
			data.put(colName, new ArrayList<Object>());
		}
	}
	
	public void addRow(Object[] row) {
		for(int i=0; i < colNames.length; i++) {
			(data.get(colNames[i])).add(row[i]);
		}
	}
	
	public String[] getNames() {
		return this.colNames;
	}
	public String[] getTypes() {
		return this.colTypes;
	}
	
	public Object[] getColumn(String colName) {
		return (data.get(colName)).toArray(new Object[0]);
	}
}

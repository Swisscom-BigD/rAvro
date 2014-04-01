package io.kvant.r.ravro;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.avro.Schema;
import org.apache.avro.Schema.Field;
import org.apache.avro.file.DataFileReader;
import org.apache.avro.file.FileReader;
import org.apache.avro.generic.GenericDatumReader;
import org.apache.avro.generic.IndexedRecord;

public class AvroLoader 
{	
	public DataFrame load(File inputFile) {
		DataFrame df = null;
		
		try {
			GenericDatumReader<Object> reader = new GenericDatumReader<Object>();
			FileReader<Object> fileReader =
			      DataFileReader.openReader(inputFile, reader);
	   
	    	Schema schema = fileReader.getSchema();
	    	List<String> names = new ArrayList<String>();
	    	List<String> types = new ArrayList<String>();
	    	for (Field f : schema.getFields()) {
	    		names.add(f.name());
	    		types.add(f.schema().getType().toString());
	    	}
	    	df = new DataFrame(names.toArray(new String[0]), types.toArray(new String[0]));
	    	
	    	while(fileReader.hasNext()) {
	    	    IndexedRecord datum = (IndexedRecord) fileReader.next();
	    	    Object[] row = new Object[names.size()];
	    	    for (Field f : schema.getFields()) {
	    	    	row[f.pos()] = (datum.get(f.pos()));
	    	    }
	    	    df.addRow(row);
	    	}
	    	
	    	fileReader.close();
	    	
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		return(df);
	}
	
	public DataFrame load(String inputPath) {
		return(load(new File(inputPath)));
	}
}

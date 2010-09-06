package railo.extensions.io.text;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import com.yahoo.platform.yui.compressor.CssCompressor;

public class YuiCssCompressor {
	
	private int linebreak;
	
	public YuiCssCompressor(int linebreak){
		 this.linebreak = linebreak;
	}

	public void compress(String source, String destination) throws IOException{
			
		InputStreamReader isr = new InputStreamReader(new FileInputStream(new File(source)));
		OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(new File(destination)));
		
		CssCompressor cssComp = new CssCompressor(isr);
		cssComp.compress(osw, linebreak);	
	}

}

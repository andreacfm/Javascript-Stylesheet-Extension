package railo.extensions.io.text;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import com.yahoo.platform.yui.compressor.JavaScriptCompressor;

public class YuiJsCompressor {
	
	private int linebreak;
	private boolean munge;
	private boolean verbose;
	private boolean preserveAllSemiColons;
	private boolean disableOptimizations;

	public YuiJsCompressor(int linebreak, boolean munge, boolean verbose, boolean preserveAllSemiColons, boolean disableOptimizations){
		this.linebreak=linebreak;
		this.munge=munge;
		this.verbose=verbose;
		this.preserveAllSemiColons=preserveAllSemiColons;
		this.disableOptimizations=disableOptimizations;
	}
	
	public void compress(String source, String destination) throws IOException{
			
		InputStreamReader isr = new InputStreamReader(new FileInputStream(new File(source)));
		OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(new File(destination)));
		
		JavaScriptCompressor compressor=new JavaScriptCompressor(isr, new ErrorReporterImpl());
		compressor.compress(osw, linebreak, munge, verbose, preserveAllSemiColons, disableOptimizations);

	}

}

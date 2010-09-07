package railo.extensions.io.text;

import java.io.PrintWriter;
import org.mozilla.javascript.ErrorReporter;
import org.mozilla.javascript.EvaluatorException;

public class ErrorReporterImpl implements ErrorReporter {
	

	private PrintWriter writer;

	/**
	 * @see org.mozilla.javascript.ErrorReporter#warning(java.lang.String, java.lang.String, int, java.lang.String, int)
	 */
	public void warning(String message, String sourceName, int line, String lineSource, int lineOffset)	{
		if (line < 0) 	print("WARNING", message);
	 	else			print("WARNING", line + ':' + lineOffset + ':' + message);
	}

	/**
	 * @see org.mozilla.javascript.ErrorReporter#error(java.lang.String, java.lang.String, int, java.lang.String, int)
	 */
	public void error(String message, String sourceName,int line, String lineSource, int lineOffset) {
		if (line < 0)	print("ERROR", message);
		else 			print("ERROR", line + ':' + lineOffset + ':' + message);
	}

	private void print(String level, String message) {
		if(writer==null)writer=new PrintWriter(System.err);
		writer.write("["+level+"] "+message+"\n");
    	writer.flush();	
	}

	public EvaluatorException runtimeError(String message, String sourceName,int line, String lineSource, int lineOffset) {
		error(message, sourceName, line, lineSource, lineOffset);
		return new EvaluatorException(message);
	}
	
}
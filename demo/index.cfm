<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>CfJavascript - CfStylesheet</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>


<h3>CFJAVSCRIPT<h3/>

<h4>Attributes</h4>
<table class="tablelisting" width="100%">
	<thead>
		<tr><th>Name</th><th>Type</th><th>Required</th><th>Default</th><th>Description</th></tr>
	</thead>
	<tbody>
		<tr>
			<td>src</td>
			<td>String or [String]
			<td>true</td>
			<td></td>
			<td>
				A single ( or an array of ) relative path that point to the js files to be compressed. 
				Path must be relative and inside the context web root.
			</td>
		</tr>
		<tr>
			<td>path</td>
			<td>String</td>
			<td>false</td>
			<td>/_cfjavascript</td>
			<td>
				A relative path that will be used to store the compressed file and to serve it to the web server. 
				If not provided a directory called /_cfjavascript will be created and used.
			</td>
		</tr>
		<tr>
			<td>filename</td>
			<td>String</td>
			<td>false</td>
			<td></td>
			<td>
				If provided give the name to the js generated file. <br/>Filename must be unique in the choosen 'path' ( or per project 
				if a single path is used all along the project ). Tag will check if a file exists when decide if generated a new compression
				or serving a cached copy. If not provided an hash is used. 
			</td>
		</tr>
		<tr>
			<td>cache</td>
			<td>boolean</td>
			<td>false</td>
			<td>true</td>
			<td>
				If true the compression is done once for any different sets or src paths. From this point the saved file will be served
				to the web server.<br/>
				Set this to false if you want to force the tag to generate a new compressed file 
				( <i>you can obtain the same result adding '_cfjavascript_nocache' to the url </i>).
			</td>
		</tr>
		<tr>
			<td>debug</td>
			<td>boolean</td>
			<td>false</td>
			<td>false</td>
			<td>
				If true the tag will output the files as originally are. The src array order is respected.<br/>
				<i>You can obtain the same result adding '_cfjavascript_debug' to the url</i>.<br/>
				This is incredibly usefull for js debugging.
			</td>
		</tr>
		<tr>
			<td>linebreak</td>
			<td>Numeric</td>
			<td>false</td>
			<td>800</td>
			<td>
				The linebreak option is used in that case to split long lines after a specific column. <br/>
				It can also be used to make the code more readable, easier to debug (especially with the MS Script Debugger)
     			Specify 0 to get a line break after each semi-colon in JavaScript, and after each rule in CSS.
			</td>
		</tr>
		<tr>
			<td>munge</td>
			<td>boolean</td>
			<td>false</td>
			<td>false</td>
			<td>
				If true minify and also obfuscate local symbols.			
			</td>
		</tr>
		<tr>
			<td>preserveAllSemiColons</td>
			<td>boolean</td>
			<td>false</td>
			<td>false</td>
			<td>
				Preserve unnecessary semicolons (such as right before a '}')			
			</td>
		</tr>
		<tr>
			<td>disableOptimizations</td>
			<td>boolean</td>
			<td>false</td>
			<td>true</td>
			<td>
				Disable all the built-in micro optimizations.			
			</td>
		</tr>
	</tbody>
</tbody>	
</table>
<h4>Examples</h4>
<ul>
	<li>
		<a href="cfjs/default.cfm">Default - compress and concatenate 2 js files.</a>
		<div class="code">
			&lt;cfset src = ['RailoAjax.js','jquery.js'] /><br/>
			&lt;cfjavascript src="#src#" />
		</div>
	</li>
	<li>
		<a href="cfjs/filename.cfm">Choose a filename and a custom path.</a>
		<div class="code">
			&lt;cfset src = ['RailoAjax.js','jquery.js'] /><br/>
			&lt;cfjavascript src="#src#" path="/cfjs/test/jscompressed" filename="myJs"/>
		</div>
	</li>
	<li>
		<a href="cfjs/default.cfm?_cfjavascript_debug">Debug</a>
		<div class="code">
			Same as the default but this time url called is : default.cfm?_cfjavascript_debug
		</div>
	</li>
	<li>
		<a href="cfjs/default.cfm?_cfjavascript_nocache">Force Compression ( no cache )</a>
		<div class="code">
			Same as the default but this time url called is : default.cfm?_cfjavascript_nocache. Files will be recompressed.
		</div>
	</li>	
	<li>
		<a href="cfjs/munge.cfm">Munge</a>
		<div class="code">
			&lt;cfset src = ['RailoAjax.js','jquery.js'] /><br/>
			&lt;fjavascript src="#src#" path="/cfjs/test/jscompressed" filename="myJs_Munge" munge="true"/>
		</div>
	</li>
</ul>

<hr/>

<h3>CFSTYLESHEET</h3>
<h4>Attributes</h4>
<table class="tablelisting" width="100%">
	<thead>
		<tr><th>Name</th><th>Type</th><th>Required</th><th>Default</th><th>Description</th></tr>
	</thead>
	<tbody>
		<tr>
			<td>src</td>
			<td>String or [String]
			<td>true</td>
			<td></td>
			<td>
				A single ( or an array of ) relative path that point to the css files to be compressed. 
				Path must be relative and inside the context web root.
			</td>
		</tr>
		<tr>
			<td>path</td>
			<td>String</td>
			<td>false</td>
			<td>/_cfstylesheet</td>
			<td>
				A relative path that will be used to store the compressed file and to serve it to the web server. 
				<b>Css files need to point to external resources as images.... The path should be the same of the original files so to be
				sure  do not break css dependencies</b>
			</td>
		</tr>
		<tr>
			<td>filename</td>
			<td>String</td>
			<td>false</td>
			<td></td>
			<td>
				If provided give the name to the js generated file. <br/>Filename must be unique in the choosen 'path' ( or per project 
				if a single path is used all along the project ). Tag will check if a file exists when decide if generated a new compression
				or serving a cached copy. If not provided an hash is used. 
			</td>
		</tr>
		<tr>
			<td>cache</td>
			<td>boolean</td>
			<td>false</td>
			<td>true</td>
			<td>
				If true the compression is done once for any different sets or src paths. From this point the saved file will be served
				to the web server.<br/>
				Set this to false if you want to force the tag to generate a new compressed file 
				( <i>you can obtain the same result adding '_cfjavascript_nocache' to the url </i>).
			</td>
		</tr>
		<tr>
			<td>debug</td>
			<td>boolean</td>
			<td>false</td>
			<td>false</td>
			<td>
				If true the tag will output the files as originally are. The src array order is respected.<br/>
				<i>You can obtain the same result adding '_cfjavascript_debug' to the url</i>.<br/>
				This is incredibly usefull for js debugging.
			</td>
		</tr>
		<tr>
			<td>linebreak</td>
			<td>Numeric</td>
			<td>false</td>
			<td>800</td>
			<td>
				The linebreak option is used in that case to split long lines after a specific column. <br/>
				It can also be used to make the code more readable, easier to debug (especially with the MS Script Debugger)
     			Specify 0 to get a line break after each semi-colon in JavaScript, and after each rule in CSS.
			</td>
		</tr>
	</tbody>
</tbody>	
</table>

<h4>Examples</h4>
<ul>
	<li>
		<a href="cfcss/default.cfm">Default - compress and concatenate.</a>
		<div class="code">
			&lt;cfset src = ['core.css','skin.css']  />
			&lt;cfstylesheet src="#src#" />
		</div>
	</li>
	<li>
		<a href="cfcss/filename.cfm">Choose a filename and a custom path.</a>
		<div class="code">
			&lt;cfset src = ['RailoAjax.js','jquery.js'] /><br/>
			&lt;cfstylesheet src="#src#" path="/demo/cssCompressed" filename="myCss"/>
		</div>
	</li>
	<li>
		<a href="cfcss/default.cfm?_cfstylesheet_debug">Debug</a>
		<div class="code">
			Same as the default but this time url called is : default.cfm?_cfstylesheet_debug
		</div>
	</li>
	<li>
		<a href="cfcss/default.cfm?_cfstylesheet_nocache">Force Compression ( no cache )</a>
		<div class="code">
			Same as the default but this time url called is : default.cfm?_cfstylesheet_nocache. Files will be recompressed.
		</div>
	</li>	
	<li>
		<a href="cfcss/linebreak.cfm">Linebreak = 0 </a>
		<div class="code">
			&lt;cfset src = ['RailoAjax.js','jquery.js'] /><br/>
			&lt;cfstylesheet src="#src#" path="/demo/cssCompressed" filename="myCss_l0" linebreak="0"/>
		</div>
	</li>
</ul>
</body>
</html>
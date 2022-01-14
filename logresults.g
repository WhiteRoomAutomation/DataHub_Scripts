require ("Application");
require ("Time");


class LogResults Application
{
}

method LogResults.LogData (value, tagname)
{
	//writec ("c:\temp\temp.txt", format ("Cleared: %-20s = %10g\n", string(tagname), value));
	log_file = open ("c:/temp/temp.txt", "a");
	
	

	
	writec (log_file, format ("%s,%s,%g\n",date(),tagname,value));
	princ (log_file, format ("%s,%s,%g\n",date(),tagname,value));
	
	if (log_file)
        close (log_file);
}

method LogResults.constructor ()
{
	local points = datahub_points("dynamic");

	with p in points do

	{
			.monitor(p.name);
		}
}


method LogResults.monitor (tagname)
{
	local path;
	path = string("dynamic:",p.name);
	.OnChange(symbol(path), `(@self).LogData(value,#@path));
}

method LogResults.destructor ()
{
}

ApplicationSingleton (LogResults);

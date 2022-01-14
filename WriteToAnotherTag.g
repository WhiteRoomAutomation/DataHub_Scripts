require ("Application");

class Adder Application
{
}


method Adder.constructor ()
{
	local points2 = datahub_points("dynamic",t,"*_o*");

	with p in points2 do

	{
			.monitor(p.name);
		}
}


method Adder.increment (value,tagname)
{
			

		princ(string("dynamic:",tagname),"\n");

		
		
		//substitute o with i and write the value
		writeto = Regex.Subst("s/_o/_i/g", string(tagname));
		princ(writeto,"\n");
		
		princ(value,"\n");
			
		datahub_write(string(writeto),value+1);
		
		val2 = datahub_read(string(writeto))[0].value;
		princ(val2,"\n");



	
}




method Adder.monitor (tagname)
{
	local path;
	
	path = string("dynamic:",tagname);
	princ("addder.monitor: ",path,"\n");
	.OnChange(symbol(path), `(@self).increment(value,#@path));
}

method Adder.destructor ()
{
}

ApplicationSingleton (Adder);

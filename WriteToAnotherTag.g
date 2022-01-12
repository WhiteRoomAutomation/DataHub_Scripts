require ("Application");

class Adder Application
{
}

method Adder.samplemethod ()
{
}

method Adder.constructor ()
{
	
		local points2 = datahub_points("dynamic",t,"*_o*");

	with p in points2 do

	{

		princ(string("dynamic:",p.name,"\n"));

		
		
		//substitute o with i and write the value
		writeto = Regex.Subst("s/_o/_i/g", string("dynamic:",p.name));
		princ(writeto,"\n");
		
		val = datahub_read(string("dynamic:",p.name))[0].value;
		princ(val,"\n");
			
		datahub_write(string(writeto),val+1);
		
		val2 = datahub_read(string(writeto))[0].value;
		princ(val2,"\n");



	}
}

method Adder.destructor ()
{
}

ApplicationSingleton (Adder);

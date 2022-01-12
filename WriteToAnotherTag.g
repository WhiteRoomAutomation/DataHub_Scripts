//reads from all tags with _o in the tag name and writes them to the corresponding tag with _i.
//for example mytag_o11 writes to mytag_i11
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
			
		datahub_write(string(writeto),val);



	}
}

method Adder.destructor ()
{
}

ApplicationSingleton (Adder);

/* All user scripts should derive from the base "Application" class */

require ("Application");

/* Get the Gamma library functions and methods for ODBC and/or
 * Windows programming.  Uncomment either or both. */

//require ("WindowsSupport");
//require ("ODBCSupport");

/* Applications share the execution thread and the global name
 * space, so we create a class that contains all of the functions
 * and variables for the application.  This does two things:
 *   1) creates a private name space for the application, and
 *   2) allows you to re-load the application to create either
 *      a new unique instance or multiple instances without
 *      damaging an existing running instance.
 */
class IncrementInputs Application
{
}

/* Use methods to create functions outside the 'main line'. */
method IncrementInputs.write ()
{
	
		local points2 = datahub_points("dynamic",t,"*_i*");

	with p in points2 do

	{
		
		
		
			val = datahub_read(string("dynamic:",p.name))[0].value;
			princ("IncrementInputs: ",val,"\n");
			
			
				datahub_write(string("dynamic:",p.name),val +1);


	}
}

/* Write the 'main line' of the program here. */

method IncrementInputs.constructor ()
{
	
	local points = datahub_points("dynamic");

	with p in points do

	{
		
				
			datahub_write(string("dynamic:",p.name),0);

	}
	princ("IncrementInputs Start","\n");
 .TimerEvery(45, `(@self).write());
}

/* Any code to be run when the program gets shut down. */
method IncrementInputs.destructor ()
{
}

/* Start the program by instantiating the class.  If your
 * constructor code does not create a persistent reference to
 * the instance (self), then it will be destroyed by the
 * garbage collector soon after creation.  If you do not want
 * this to happen, assign the instance to a global variable, or
 * create a static data member in your class to which you assign
 * 'self' during the construction process.  ApplicationSingleton()
 * does this for you automatically. */
ApplicationSingleton (IncrementInputs);

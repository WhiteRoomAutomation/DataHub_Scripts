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
class MyApp Application
{
}

/* Use methods to create functions outside the 'main line'. */
method MyApp.samplemethod ()
{
}

/* Write the 'main line' of the program here. */
method MyApp.constructor ()
{
	local points = datahub_points("dynamic");

	with p in points do

	{
		
			pretty_print(string("dynamic:",p.name));
			datahub_write(string("dynamic:",p.name),0);

	}
}

/* Any code to be run when the program gets shut down. */
method MyApp.destructor ()
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
ApplicationSingleton (MyApp);

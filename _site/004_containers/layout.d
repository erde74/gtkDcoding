// Test Rig Foundation for Learning GtkD Coding

import std.stdio;

import gtk.MainWindow;
import gtk.Main;
import gtk.Widget;

/////////////////////////////////////
// Additional import statements START
/////////////////////////////////////

import gtk.Layout;
import gtk.Button;
import gdk.Event;

///////////////////////////////////
// Additional import statements END
///////////////////////////////////

void main(string[] args)
{
	Main.init(args);
	TestRigWindow myTestRig = new TestRigWindow("Test Rig");
	
	/////////////////////////////
	// See below for test code //
	/////////////////////////////

	// Show the window and its contents...
	myTestRig.showAll();
		
	
	// give control over to gtkD.
	Main.run();
	
} // main()


class TestRigWindow : MainWindow
{
	this(string title)
	{
		// window
		super(title);
		addOnDestroy(delegate void(Widget w) { quitApp(); } );

		/////////////////////
		// Test Code Start //
		/////////////////////
	
		auto myButton = new MyButt("Button Name");
		auto myOtherButton = new MyOtherButt("Other Button Name");
		
		// layout
		auto myLayout = new MyLayout(myButton, myOtherButton);
		add(myLayout);

		///////////////////
		// Test Code End //
		///////////////////
		
	} // this() CONSTRUCTOR
	
	
	void quitApp()
	{
		// This exists in case we want to do anything
		// before exiting such as warn the user to
		// save work.
		writeln("Bye.");
		Main.quit();
		
	} // quitApp()

} // class myAppWindow

/////////////////////
// Test Code Start //
/////////////////////

class MyLayout : Layout
{
	this(MyButt myButton, MyOtherButt otherButton)
	{
		super(null, null);
		put(myButton, 10, 20);
		put(otherButton, 10, 60);
		
	} // this()
	
} // class MyLayout


class MyButt : Button
{
	this(string labelText)
	{
		super(labelText);
		addOnButtonRelease(&doSomething);
		
	} // this()
	
	
	bool doSomething(Event e, Widget w)
	{
		writeln("Something was done.");
		
		return(true);
		
	} // doSomething()

} // class MyButt


class MyOtherButt : Button
{
	this(string labelText)
	{
		super(labelText);
		string message = "Something other than that was done.";
		addOnClicked(delegate void(_) { doSomething(message); } );
		
	} // this()
	
	
	void doSomething(string messageText)
	{
		writeln(messageText);
		
	} // doSomething()

} // class MyButt

///////////////////
// Test Code End //
///////////////////

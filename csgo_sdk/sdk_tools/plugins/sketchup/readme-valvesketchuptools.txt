=====
About
=====
 
The SketchUp plugins in this folder allow you to create 3D content for the Source game 
engine using Google SketchUp.

The vmf_export plugin allows you to export SketchUp models to Hammer, the environment
editor for the Source game engine. Hammer is used to create game levels for titles 
such as Half Life, Portal, Counter Strike, Day of Defeat, and Left 4 Dead.

The smd_export plugin is useful for creating models for props or for making static 
models that can be placed in your levels.

For the most up to date version of this document, please visit:

http://developer.valvesoftware.com/wiki/SketchUp_Source_Tools

Please send feedback to sketchuptools@valvesoftware.com

=========================
How It Works (vmf_export)
=========================

You start by creating groups of 3D geometry in SketchUp. Each group is typically a 
simple "solid" form such as a box or cylinder, or anything with a convex topology.
The plugin translates each group/component into a "brush" and saves the results out to
a .vmf file. VMF is a source (raw) file that can be opened directly in Hammer, The
Source world editor.

Once in Hammer, you can further edit and append to the game level, as well as 
compile or "bake" your level into a .bsp file. BSP files can be loaded and 
played directly by Source engine games. Learn more here:

http://developer.valvesoftware.com/wiki/SketchUp_to_Hammer_Export_plugin

If you're new to editing game levels using Source, it's recommended that you 
visit the Valve Development Community Wiki. There you'll find the best source
of information on how to setup and get started using Hammer:

http://developer.valvesoftware.com/wiki/Category:Level_Design


=========================
How It Works (smd_export)
=========================

You start by creating 3D geometry in SketchUp. (The types of geometry you can export
to smd format are not as limited as is with vmf.) The plugin translates your model
to an .smd file, which is then compiled or "baked" into an .mdl (model) file. Mdl files
are used by the game engine directly, and are used to create props or parts of the 
environment to compliment brushes. More info can be found here:

http://developer.valvesoftware.com/wiki/SketchUp_to_SMD_Export_plugin

And more information on creating models for the Source Engine:

http://developer.valvesoftware.com/wiki/Category:Modeling



============
Installation 
============

1. The first step is to download SketchUp. Find the latest version here: 

   http://sketchup.google.com/download/ 

   You can use either the free version or the "Pro" version of SketchUp, which 
   offers advanced features. The source plugins should work with either, 
   and with any of the SketchUp releases between 5-7.


2. Install SketchUp. Launch it once, just to make sure it runs properly, then
   exit.


3. Next, you will need to copy the valve SKetchUp plugins and their support folders 
   into SketchUp's plugins folder. The exact target location depends on what 
   version of SketchUp you have installed, as well as where you've installed it, 
   but it's most commonly found here:

   C:\program Files\Google\Google SketchUp 7\Plugins


4. You should have the following new files in the SketchUp plugins folder:

 - vmf_export.rbs
        A script file which performs vmf export

 - smd_export.rbs
        A script file which performs smd export

 - valve_sketchup_tools_config.rb
        A file that has user-changable configuration settings

 - valve (folder):
        A folder that contains required support files:

 - valve library (folder):
        A folder that contains examples, tutorial files, and useful components:


 
5. Launch SketchUp. Under the "plugins" menu, there should be menu items 
   labeled "Export VMF..." and "Export SMD..." You should be ready!


For more information, please visit:


http://developer.valvesoftware.com/wiki/SketchUp_Source_Tools





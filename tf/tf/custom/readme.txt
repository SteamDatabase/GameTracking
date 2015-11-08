When the game boots, this folder is automatically scanned for VPK files or
subfolders. Each subfolder or VPK is added as a search path, so the files
inside those VPK's or subfolders will override the default game files.

See gameinfo.txt for more details.

For example, you might have the following file structure:

	tf/custom/my_custom_stuff/   <<< This subfolder will be added as a search path
	tf/custom/my_custom_stuff/models/custom_model.mdl
	tf/custom/my_custom_stuff/materials/custom_material.vmt
	tf/custom/my_custom_stuff/materials/vgui/custom_ui_thing.res
	tf/custom/some_mod.vpk       <<< This VPK will be added as a search path
	tf/custom/another_mod.vpk    <<< This VPK will be added as a search path


Mounting a VPK to the filesystem is more efficient than adding a subfolder,
as each time the engine needs to open a file, it will need to make a call to the
operating system to search the folder. VPKs can therefore be searched by the engine
much more efficiently. Each subfolder is a new search path that must be checked each
time the engine tries to open a file. So, for optimal load times, always use VPK files
and don't make any subfolders in this folder!


Note that the following directory structure is NOT correct:

	tf/custom/models/my_model.mdl

That will add the directory "tf/custom/models" as a search path, in which case the
file my_model.mdl actually exists at the root of the game's virtual filesystem.
Instead, you would use something like:

	tf/custom/my_custom_stuff/models/my_model.mdl

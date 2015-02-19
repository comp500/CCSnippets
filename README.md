# CCSnippets
Snippets of Lua that you can include in CC projects. These are available under the permissive MIT license, so feel free to fork, send pull requests and include in your own Lua projects. The only requirement is that you credit me.

## Usage
Many of these snippets are designed to be easily incorporated into the top of a CC program. In this case, simply insert the code (smaller, minified code is available in releases) at the top of your program, ensuring the license is kept as a comment. This code will work in most recent versions of ComputerCraft, and with some modification, in generic Lua.
The files are stored on the repository as .lua files. This is not the case for computercraft programs, so you will either have to remove the extension or download the release, which includes the programs without the extensions.

## Snippets

### require()
*Requires ComputerCraft 1.63 or newer*

This snippet provides a require() function, very similar to CommonJS AMD module loading.

    module1, module2, module3... = require(location1, location2, location3...)
    
This function takes the location of a lua file/module and gives you the namespace for that module. It uses os.loadAPI, so you do not have to modify APIs to use them. You can include as many modules at once, or just one.
It is easy to use and only around 400B when minified. This snippet is designed to be inserted at the top of a file.
To find a module, specify it with no trailing slash (relative) and `require()` will look in the current directory and all directories above the current directory. If you include a trailing slash (absolute), `require()` will only look in the directory you specify.

ComputerCraft 1.63 is required for the `fs.getDir` function, but if you do want to use it for earlier versions, you could write a replacement for `fs.getDir`, or find one.

#### Example usage
    
    btn = require("button") -- Includes the button api
    btn.heading("Hello!") -- A function of the button api, adds a heading on an attached monitor
    disk = require(disk.getMountPath("left") .. "randomapi") -- Includes an api from the disk attached to the left
    disk.random()

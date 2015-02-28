# CCSnippets
Snippets of Lua that you can include in CC projects. These are available under the permissive MIT license, so feel free to fork, send pull requests and include in your own Lua projects. The only requirement is that you credit me.

## Usage
require is designed to be easily incorporated into the top of a CC program. In this case, simply insert the code (smaller, minified code is available in releases) at the top of your program, ensuring the license is kept as a comment. This code will work in most recent versions of ComputerCraft, and with some modification, in generic Lua.
The files are stored on the repository as .lua files. This is not the case for computercraft programs, so you will either have to remove the extension or download the release, which includes the programs without the extensions. Some of my other snippets can easily be downloaded and added to your programs using `require()`.

### *new!* Packman Installation
~~You can now~~ You will be able to use Packman, a package manager included in LyqydOS, to install my programs [when it gets added](https://github.com/lyqyd/cc-packman/pull/10).
Simply update your version of packman: `packman fetch` and install a program using `packman install <program>`.
To update your packman programs, run `packman fetch update`.
To add require to your programs, see below.

## Snippets

### require()
*Requires ComputerCraft 1.63 or newer* - Also available on CC forums [here](http://www.computercraft.info/forums2/index.php?/topic/22053-require-amd-for-cc-an-api-to-include-apis/).

This snippet provides a require() function, very similar to CommonJS AMD module loading.

    module1, module2, module3... = require(location1, location2, location3...)
    
This function takes the location of a lua file/module and gives you the namespace for that module. It uses os.loadAPI, so you do not have to modify APIs to use them. You can include as many modules at once, or just one.
It is easy to use and only around 600B when minified. This snippet is designed to be inserted at the top of a file.
To find a module, specify it with no trailing slash (relative) and `require()` will look in the current directory and all directories above the current directory. If you include a trailing slash (absolute), `require()` will only look in the directory you specify.

ComputerCraft 1.63 is required for the `fs.getDir` function, but if you do want to use it for earlier versions, you could write a replacement for `fs.getDir`, or find one.

#### Example usage
    
    btn = require("button") -- Includes the button api
    btn.heading("Hello!") -- A function of the button api, adds a heading on an attached monitor
    t = require("touchpoint").new() -- Includes the touchpoint api and creates a new instance of buttons, discarding the touchpoint api reference
    t:add(...) -- Adds buttons
    t:draw() -- Draws buttons
    disk = require(disk.getMountPath("left") .. "randomapi") -- Includes an api from the disk attached to the left
    disk.random()

#### Packman
The packman package for this snippet is `require-api`.

### addrequire
This is a simple program that makes it easy to add require to a program. Simply install it then run it for each of your files:

    addrequire <file1> [file2] [file3] ...

#### Packman
The packman package for this snippet is `addrequire`.
It depends on `require-api`, so it will automatically be installed when you install addrequire.

## To-Do list
- What do you want me to add?

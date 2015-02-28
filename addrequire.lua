args = {...}
if #args > 0 then
    require = nil
    if fs.exists("/usr/apis/require") then
        require = fs.open("/usr/apis/require", "r")
    elseif shell.resolveProgram("require") and fs.exists(shell.resolveProgram("require")) then
        require = fs.open(shell.resolveProgram("require"), "r")
    end 
    if require == nil then
        print("require not found. Please install it or copy it to /")
    else
        rq = require.readAll()
        require.close()
        for i,v in ipairs(args) do
            if fs.exists(v) then
                local file = fs.open(v, "r")
                local orig = file.readAll()
                file.close()
                local file2 = fs.open(v, "w")
                file2.writeLine(rq)
                file2.writeLine("")
                file2.write(orig)
                file2.close()
            else
                print(v .. " not found!")
            end
        end
    end
else
    print("Usage: addrequire <file> [file2] [file3] ...")
end

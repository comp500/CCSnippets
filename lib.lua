-- lib() for CC by comp500
-- MIT license - https://github.com/comp500/CCSnippets/
function lib(...)
    local c,r,s = fs.combine,{},shell.resolveProgram
    local function fn(a) return fs.exists(a) and a or false end
    for i,v in ipairs(arg) do
        local file = fn(c('usr/apis',v)) or fn(v) or s(v)
        if not file then
            local pm = s('packman') or s('ac-get')
            if http and pm then
            else
                printError("API "..v.." not found")
                table.insert(r,nil)
            end
        else
            table.insert(r,file)
        end
    end
    return unpack(r)
end
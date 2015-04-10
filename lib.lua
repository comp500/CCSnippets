-- lib() for CC by comp500
-- MIT license - https://github.com/comp500/CCSnippets/
function lib(...)
    local c,r = fs.combine,{}
    local function fn(a) return fs.exists(a) and a or false end
    for i,v in ipairs(arg) do
        local file = fn(c('usr/apis',v)) or fn(v) or fn(shell.resolveProgram(v))
        if not file then
            local pm = fn('usr/bin/packman') or fn('usr/bin/ac-get')
            shell.run(pm, "")
        else
            table.insert(a,file)
        end
    end
    return r
end
-- BootKit v0.0.0.0.0.0.0.0.0.0.0.0.0.0.1-gamma for CC by comp500
-- MIT license - https://github.com/comp500/CCSnippets/
local events = {}

function raise(e, ...)
    if events[e] ~= nil then
        for key,value in pairs(events[e]) do
            value(...)
        end
    end
end

function addListener(e, func)
    if events[e] == nil then
        events[e] = {}
    end
    table.insert(events[e], func)
    return func
end

-- add listeners from config

raise("preboot")

-- show boot screen and load libs

raiseWait("boot")

-- once done

raise("postboot")

-- some sort of thing event loop fancy scheduler thing... WIP!

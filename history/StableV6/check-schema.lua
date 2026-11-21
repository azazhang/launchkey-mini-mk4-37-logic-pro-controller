local path=assert(arg[1],'Usage: texlua schema_fingerprint.lua config.lua')
local code=100
local constants={}
setmetatable(_G,{__index=function(_,key)
  if type(key)=='string' and (key:match('^[A-Z][A-Z0-9_]*$') or key:match('^kAssign')) then
    if constants[key]==nil then code=code+1;constants[key]=code end
    return constants[key]
  end
  return nil
end})
settriggertimer=function(_) end
local f,err=loadfile(path)
assert(f,err);f()
local info=controller_info()
local function stable(value)
 if type(value)~='table' then return type(value)..':'..tostring(value) end
 local keys={}
 for k in pairs(value) do keys[#keys+1]=k end
 table.sort(keys,function(a,b)
  if type(a)==type(b) then return a<b end
  return type(a)<type(b)
 end)
 local parts={}
 for _,k in ipairs(keys) do parts[#parts+1]=stable(k)..'='..stable(value[k]) end
 return '{'..table.concat(parts,',')..'}'
end
-- Exclude volatile logging fields. Include every controller_info item and assignment.
print('SCHEMA_BEGIN')
print('DEVICE '..tostring(info.model)..' '..tostring(info.manufacturer))
for i=0,300 do
 if info.items[i]~=nil then print('ITEM',i,stable(info.items[i])) end
end
for i,entry in ipairs(info.assignments) do print('ASSIGN',i,stable(entry)) end
print('SCHEMA_END')

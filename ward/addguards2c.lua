ward = os.getenv("WARD")
args = table.concat({...}, " ")
argtable = {...}
file = argtable[#argtable]
if string.sub(file, -2, -1) == ".c" then
  guard = os.tmpname()
  os.execute(ward .. "/bin/cward -suggest " .. args .. ">" .. guard)
  os.execute(ward .. "/bin/addguardsc " .. guard .. " " .. file)
  os.remove(guard)
else
  os.execute("cat "..file)
end

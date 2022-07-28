print("Man I am so lost right now!")
local x, y, z = gps.locate(5)
if not x then --If gps.locate didn't work, it won't return anything. So check to see if it did.
  print("Failed to get my location!")
else
  print("I am at (" .. x .. ", " .. y .. ", " .. z .. ")") --This prints 'I am at (1, 2, 3)' or whatever your coordinates are
end
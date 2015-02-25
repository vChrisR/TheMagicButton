ssid = "yourssid"
password = "yourpassword"

gpio.mode(4, gpio.OUTPUT)
gpio.write(4,0)

print("set up wifi mode")
wifi.setmode(wifi.STATION)
wifi.sta.config(ssid,password)
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function() 
    if wifi.sta.getip()== nil then 
         print("IP unavaiable, Waiting...") 
    else 
     tmr.stop(1)
     print("Config done, IP is "..wifi.sta.getip())
     dofile("TheMagicButton.lua")
    end 
 end)

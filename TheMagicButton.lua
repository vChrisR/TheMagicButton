targetHost = "82.157.195.146"
targetPort = 3000
apikey = yourapikey

gpio.mode(3, gpio.INPUT, gpio.PULLUP)
gpio.mode(4, gpio.OUTPUT)
gpio.write(4,0)

gpio.trig(3, "up", function (state)     
     tmr.delay(10000)
     if (gpio.read(3) == 1) then
          tmr.delay(10000)
          if (gpio.read(3) == 1) then          
               print ("pushed")
               gpio.write(4,0)
               --if (sk ~= nil) then sk:close() end
               sk=net.createConnection(net.TCP,0) 
               sk:on("receive", function(sck, c) 
                    print (c)
                    gpio.write(4,1)
               end)
             
               local httpPost = "POST /magicbutton?apikey="..apikey.." HTTP/1.1\r\nHost: "..targetHost.."\r\nConnection: close\r\nContent-Type: application/json\r\nContent-Length: 20\r\n\r\n{\"event\": \"pressed\"}"
               --print("Posting Message:\r\n------------\r\n"..httpPost.."\r\n----------\r\n")
               sk:connect(targetPort, targetHost)
               sk:send(httpPost)
          end
     end
end)

gpio.write(4,1)
print("Waiting for the magic to happen")

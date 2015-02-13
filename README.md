# TheMagicButton
This LUA Script runs on ESP8266 Wifi SoC. All this script does is sending an HTTP Post to webEye when a button is pressed. This in turn trigers a vRO Workflow. 

I Used an emergency stop button which is noramlly closed. The button is connected betwee GPIO0 and ground. The button needs to be pressed (open) to powerup the ESP. Otherwise it will start into bootloader mode.

The delays in the script are for debouncing. 

To Use the script edit the values in at the top of both files to match your wifi and webEye configuration.

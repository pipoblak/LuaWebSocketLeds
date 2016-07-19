wifi.setmode(wifi.STATIONAP)
wifi.sta.config("Rocketz VIVO 2.4Ghz","placefirst2.4")


wifi.sta.connect()
print(wifi.sta.getip())

red = 2
green = 1
blue = 3

function rgb_init(freq, duty)
	-- Configure PWM (freq, 50% duty cycle[512/1203])
    gpio.mode(red, gpio.OUTPUT)
    gpio.mode(green, gpio.OUTPUT)
    gpio.mode(blue, gpio.OUTPUT)

	pwm.setup(red, freq, duty); -- Red
	pwm.setup(green, freq, duty); -- Green
	pwm.setup(blue, freq, duty);-- Blue

	-- Start the PWM on those pins (Defaults to white)
	pwm.start(red);
	pwm.start(green);
	pwm.start(blue);
end 

function rgb_restart(freq, duty)
	
	pwm.stop(red);
	pwm.stop(green);
	pwm.stop(blue);
	-- Configure PWM (freq, 50% duty cycle[512/1203])
	pwm.setup(red, freq, duty); -- Red
	pwm.setup(green, freq, duty); -- Green
	pwm.setup(blue, freq, duty); -- Blue

	-- Start the PWM on those pins (Defaults to white)
	pwm.start(red);
	pwm.start(green);
	pwm.start(blue);
end 

function on_Led()
	gpio.write(red, gpio.HIGH);
	gpio.write(green, gpio.HIGH);
	gpio.write(blue, gpio.HIGH);
end

function off_Led()
	gpio.write(red, gpio.LOW);
	gpio.write(green, gpio.LOW);
	gpio.write(blue, gpio.LOW);
	pwm.stop(red);
	pwm.stop(green);
	pwm.stop(blue);
end

function set_RGB(r,g,b)
		pwm.setduty(red,r*1023/255);
		pwm.setduty(green,g*1023/255);
		pwm.setduty(blue,b*1023/255);
end
function set_RGBs(r,g,b,pixels)
ws2812.write(string.char(r,g,b):rep(pixels));
end

rgb_init(100,1023);
ws2812.init();
dofile("websocket.lc")
dofile("main.lc")

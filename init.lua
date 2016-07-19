wifi.setmode(wifi.STATIONAP)
wifi.sta.config("Rocketz VIVO 2.4Ghz","placefirst2.4")

red = 0 ;
green = 0;
blue = 0;
tamanhoFita=0;
i = 0;
wifi.sta.connect()
print(wifi.sta.getip())

function startVariables(r,g,b,pixels)
    red=r;
    green=g;
    blue=b;
    tamanhoFita=pixels;
end

function set_RGBs(r,g,b,pixels)
    startVariables(r,g,b,pixels);
    ws2812.write(string.char(r,g,b):rep(pixels));
end



function doSideBySide()
    b = ws2812.newBuffer(8,3);
    i=i+1
    b:fade(2)
    b:set(i%b:size()+1, red, green,blue)
    b:write()
end

function startSideBySide(time)
    tmr.unregister(0);
    tmr.alarm(0, time, 1, doSideBySide);
end



ws2812.init();
dofile("websocket.lc")
dofile("main.lc")

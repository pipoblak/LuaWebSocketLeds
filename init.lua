wifi.setmode(wifi.STATIONAP)
wifi.sta.config("Rocketz VIVO 2.4Ghz","placefirst2.4")

red = 0 ;
green = 0;
blue = 0;
tamanhoFita=0;
i = 1;
ida=true;
firstTime=true;
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
    buff = ws2812.newBuffer(tamanhoFita,3);
    i=i+1
    buff:fade(2)
    buff:set(i%b:size()+1, red, green,blue)
    buff:write()
end

function doARun()
    if firstTime==true then
            buff = ws2812.newBuffer(tamanhoFita,3);
            ws2812.write(string.char(0,0,0):rep(tamanhoFita));
            buff:write(buff:fill(0,0,0));
            firstTime=false;
    end
     
    if ida==true then
        
        if i==1 then
      
        end
        
       
        
        if i>=1 and i<=tamanhoFita then
        buff:write(buff:set(i,red,green,blue));
        end
       
        
    
        if i~=1 then
        
            buff:write(buff:set(i-1,0,0,0));
    
        end
    
        if i==tamanhoFita then
            tmr.delay(500000)
                     
        end
        
            
        buff:write(buff:set(i,0,0,0));
    
        
    
        if i==tamanhoFita then
            
        ida=false;
            i=i-1;
        else 
            i=i+1;
        end
        
         
    else
       
        
        buff:write(buff:set(i,red,green,blue));
        
        if i~=1 then
        buff:write(buff:set(i+1,0,0,0));
        end
        
 
        buff:write(buff:set(i,0,0,0));
        
        i=i-1;
         if i==0 then
            ida=true;
            i=i+1;
        end
    end
    
       
end

function doAEffect(time,id)
    
    i=1;
    firstTime=true;
    tmr.unregister(1);
    if id == 0 then
        tmr.alarm(1, time, 1, doSideBySide);
    elseif id == 1 then
        ida=true;
        tmr.alarm(1, time, 1, doARun);
    elseif id == 2 then
        tmr.alarm(1, time, 1, doSideBySide);
    elseif id == 3 then
        tmr.alarm(1, time, 1, doSideBySide);
    elseif id == 4 then
        tmr.alarm(1, time, 1, doSideBySide);
            
    end
    
    
end



ws2812.init();
dofile("websocket.lc")
dofile("main.lc")

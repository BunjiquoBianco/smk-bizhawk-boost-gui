---
--- Created by BunjiquoBianco.
--- DateTime: 08/02/2021 13:07
---


local memp_boost = 0x7e10ca
local memp_speed = 0x7e10ea
local xm
local ym
local x_offset = 10

local function write_boost_counter(y_offset)
    local boost = 0
    boost = memory.read_u16_le(memp_boost)
    if(boost < 128) then
        gui.text(x_offset * xm, y_offset * ym, boost)
    elseif boost >= 128 then
        gui.drawText(x_offset * xm, y_offset * ym, boost, "blue", "black", 24)
    end
end

local function write_speedo(y_offset)
    local speed = 0
    speed = memory.read_u16_le(memp_speed)
    if speed == 0 then
        gui.text(x_offset * xm, y_offset * ym, "STOPPED")
    elseif speed > 0 and speed < 600 then
        gui.text(x_offset * xm, y_offset * ym, "LOW", "red")
    elseif speed >= 600 and speed < 1100 then
        gui.text(x_offset * xm, y_offset * ym, "MED", "orange")
    elseif speed >= 1100 and speed < 1105 then
        gui.text(x_offset * xm, y_offset * ym, "MAX", "green")
    elseif speed >= 1105 then
        gui.text(x_offset * xm, y_offset * ym, "BOOST", "blue")
    end
end

local function scaler()
    xm = client.screenwidth() / 256
    ym = client.screenheight() / 224
end

while true do
    scaler()
    write_speedo(10)
    write_boost_counter(20)
    emu.frameadvance()
end
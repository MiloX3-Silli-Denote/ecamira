--[[

________________________________________________________________________________________________________________________

?   https://github.com/MiloX3-Silli-Denote/ecamira

?   MIT License

?   Copyright (c) 2024 Milo:3 Silli Denote

*   Permission is hereby granted, free of charge, to any person obtaining a copy
*   of this software and associated documentation files (the "Software"), to deal
*   in the Software without restriction, including without limitation the rights
*   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*   copies of the Software, and to permit persons to whom the Software is
*   furnished to do so, subject to the following conditions:
*
*   The above copyright notice and this permission notice shall be included in all
*   copies or substantial portions of the Software.
*
*   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
*   SOFTWARE.

________________________________________________________________________________________________________________________

]]

local Ecamira = {};

Ecamira.__index = Ecamira;

function Ecamira.new(drawX_canv, drawY, drawW, drawH)
    local instance = setmetatable({}, Ecamira);

    if drawX_canv and type(drawX_canv) ~= "number" then -- if its a canvas or texture then try to use its dimmensions instead
        instance.drawX = 0;
        instance.drawY = 0;
        instance.drawW = drawX_canv.getWidth and drawX_canv:getWidth() or (love.graphics.getWidth() - instance.drawX);
        instance.drawH = drawX_canv.getHeight and drawX_canv:getHeight() or (love.graphics.getHeight() - instance.drawY);
    else
        instance.drawX = drawX_canv or 0;
        instance.drawY = drawY or 0;
        instance.drawW = drawW or (love.graphics.getWidth() - instance.drawX);
        instance.drawH = drawH or (love.graphics.getHeight() - instance.drawY);
    end

    instance.centerX = instance.drawX + instance.drawW / 2;
    instance.centerY = instance.drawY + instance.drawH / 2;

    instance.paralax = 1; -- 1 is normal, higher is foreground, lower is background (0 is no movement)

    instance.x = 0;
    instance.y = 0;

    instance.scaleX = 1;
    instance.scaleY = 1;

    instance.rot = 0;

    return instance;
end

function Ecamira:translate(x, y)
    if not (type(x) == "number" and (y == nil or type(y) == "number")) then
        error("cannot translate position of camera by non number");
    end

    self.x = self.x + x;
    self.y = self.y + (y or 0);
end
function Ecamira:setPosition(x, y)
    if not (type(x) == "number" and (y == nil or type(y) == "number")) then
        error("cannot set position of camera to non number");
    end

    self.x = x;
    self.y = y or self.y;
end
function Ecamira:setX(x)
    assert(type(x) == "number", "cannot set x to non number");

    self.x = x;
end
function Ecamira:setY(y)
    assert(type(y) == "number", "cannot set y to non number");

    self.y = y;
end
function Ecamira:getX()
    return self.x;
end
function Ecamira:getY()
    return self.y;
end
function Ecamira:getPosition()
    return self.x, self.y;
end

function Ecamira:scale(x, y)
    if not (type(x) == "number" and (y == nil or type(y) == "number")) then
        error("cannot scale camera by non number");
    end

    self.scaleX = self.scaleX * x;
    self.scaleY = self.scaleY * (y or x);
end
function Ecamira:scaleX(x)
    assert(type(x) == "number", "cannot scale x by non number");

    self.scaleX = self.scaleX * x;
end
function Ecamira:scaleY(y)
    assert(type(y) == "number", "cannot scale y by non number");

    self.scaleY = self.scaleY * y;
end
function Ecamira:setScale(x, y)
    if not (type(x) == "number" and (y == nil or type(y) == "number")) then
        error("cannot set camera scale to non number");
    end

    self.scaleX = x;
    self.scaleY = y or x;
end
function Ecamira:setScaleX(x)
    assert(type(x) == "number", "cannot set x scale to non number");

    self.scaleX = x;
end
function Ecamira:setScaleY(y)
    assert(type(y) == "number", "cannot set y scale to non number");

    self.scaleY = y;
end
function Ecamira:getScaleX()
    return self.scaleX;
end
function Ecamira:getScaleY()
    return self.scaleY;
end
function Ecamira:getScale()
    return self.scaleX, self.scaleY;
end

function Ecamira:rotate(rot)
    assert(type(rot) == "number", "cannot rotate by non number");

    self.rot = self.rot + rot;
end
function Ecamira:setRotation(rot)
    assert(type(rot) == "number", "cannot set rotation to non number");

    self.rot = rot;
end
function Ecamira:getRotation()
    return self.rot;
end

function Ecamira:setParalax(paralax)
    assert(type(paralax) == "number", "cannot set camera paralax to non number");

    self.paralax = paralax;
end
function Ecamira:getParalax()
    return self.paralax;
end

function Ecamira:setDrawPosition(x, y)
    if not (type(x) == "number" and (y == nil or type(y) == "number")) then
        error("cannot set camera draw position to non number");
    end

    self.drawX = x;
    self.drawY = y or self.drawY;
end
function Ecamira:setDrawX(x)
    assert(type(x) == "number", "cannot set camera draw x to non number");

    self.drawX = x;
end
function Ecamira:setDrawY(y)
    assert(type(y) == "number", "cannot set camera draw y to non number");

    self.drawY = y;
end
function Ecamira:setDrawDimmensions(x, y)
    if not (type(x) == "number" and (y == nil or type(y) == "number")) then
        error("cannot set camera draw dimmensions to non number");
    end

    self.drawW = x;
    self.drawH = y or self.drawH;
end
function Ecamira:setDrawWidth(x)
    assert(type(x) == "number", "cannot set camera draw width to non number");

    self.drawW = x;
end
function Ecamira:setDrawHeight(y)
    assert(type(y) == "number", "cannot set camera draw height to non number");

    self.drawH = y;
end
function Ecamira:getDrawX()
    return self.drawX;
end
function Ecamira:getDrawY()
    return self.drawY;
end
function Ecamira:getDrawPosition()
    return self.drawX, self.drawY;
end
function Ecamira:getDrawWidth()
    return self.drawW;
end
function Ecamira:getDrawHeight()
    return self.drawH;
end
function Ecamira:getDrawDimmensions()
    return self.drawW, self.drawH;
end
function Ecamira:getDrawSpace()
    return self.drawX, self.drawY, self.drawW. self.drawH;
end

function Ecamira:center()
    self.centerX = self.drawX + self.drawW / 2;
    self.centerY = self.drawY + self.drawH / 2;
end
function Ecamira:translateCenter(x, y)
    if not (type(x) == "number" and (y == nil or type(y) == "number")) then
        error("cannot translate camera center by non number");
    end

    self.centerX = self.centerX + x;
    self.centerY = self.centerY + (y or 0);
end
function Ecamira:setCenter(x, y)
    if not (type(x) == "number" and (y == nil or type(y) == "number")) then
        error("cannot set camera center to non number");
    end

    self.centerX = x;
    self.centerY = y or 0;
end
function Ecamira:setCenterX(x)
    assert(type(x) == "number", "cannot set camera center x to non number");

    self.centerX = x;
end
function Ecamira:setCenterY(y)
    assert(type(y) == "number", "cannot set camera center y to non number");

    self.centerY = y;
end
function Ecamira:getCenterX()
    return self.centerX;
end
function Ecamira:getCenterY()
    return self.centerY;
end
function Ecamira:getCenterPosition()
    return self.centerX, self.centerY;
end

function Ecamira:copy()
    local ret = Ecamira.new(self.drawX, self.drawY, self.drawW, self.drawH);
    ret:setPosition(self.x, self.y);
    ret:setScale(self.scaleX, self.scaleY);
    ret:setCenter(self.centerX, self.centerY);
    ret:setRotation(self.rot);
    ret:setParalax(self.paralax);

    return ret;
end

function Ecamira:draw(func)
    assert(type(func) == "function", "cannot call draw from camera with non function");

    local px, py, pw, ph = love.graphics.getScissor();
    love.graphics.setScissor(self.drawX, self.drawY, self.drawW, self.drawH);

    love.graphics.push();

    love.graphics.translate(self.centerX, self.centerY);
    love.graphics.rotate(-self.rot);
    --love.graphics.translate(-self.centerX, -self.centerY);
    love.graphics.scale(self.scaleX, self.scaleY);
    love.graphics.translate(-self.x * self.paralax, -self.y * self.paralax);

    func();

    love.graphics.pop();

    love.graphics.setScissor(px, py, pw, ph);
end

return setmetatable({}, {__call = function(a, ...) return Ecamira.new(...) end});

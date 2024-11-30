local Ecamira = require("ecamira");

local cam1 = Ecamira();

function love.update(dt)
    -- move: left, right, up, down
    if love.keyboard.isDown("a") then
        cam1:translate(-200 * dt, 0);
    end
    if love.keyboard.isDown("d") then
        cam1:translate(200 * dt, 0);
    end
    if love.keyboard.isDown("space") then
        cam1:translate(0, -200 * dt);
    end
    if love.keyboard.isDown("lctrl") then
        cam1:translate(0, 200 * dt);
    end

    -- move forwards and backwards (scale)
    if love.keyboard.isDown("w") then
        cam1:scale(1.4 ^ dt);
    end
    if love.keyboard.isDown("s") then
        cam1:scale((1 / 1.4) ^ dt);
    end

    -- rotate
    if love.keyboard.isDown("e") then
        cam1:rotate(0.7 * dt);
    end
    if love.keyboard.isDown("q") then
        cam1:rotate(-0.7 * dt);
    end
end

function love.draw()
    cam1:draw(drawCam1);

    love.graphics.circle("fill", cam1:getCenterX(), cam1:getCenterY(), 5); -- draw at center of camera
end

function drawCam1()
    love.graphics.setColor(1,0,0);
    love.graphics.rectangle("fill", -10, -10, 20, 20); -- red square encasing origin (0,0)

    love.graphics.setColor(0,1,0);
    love.graphics.rectangle("fill", 20, 20, 20, 20); -- green square off to the side a bit

    love.graphics.setColor(1,1,1);
end
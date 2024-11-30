# ecamira
love2d camera with many features

## Usage
download ecamira.lua and place it into your project (license is in lua file aswell)
and place ```Ecamira = require("ecamira");``` in your main script
### Basic usage
```lua
Ecamira = require("ecamira"); -- include

local camera = Ecamira(); -- call script as function to create a new camera object

camera:setPosition(100, 50); -- call functions to modify the object

function drawCallback() -- draw callback function
  love.graphics.setColor(1, 0, 0);
  love.graphics.rectangle("fill", -10,-10, 20,20);
end

camera:draw(drawCallback); -- call :draw() on camera with callback function as input
```
### Functions
a created camera object has many different functions that you call to modify its output image

```lua
camera:draw(callback);
```
camera applies transformations to the draw scene then calls the callback function, after the callback function it undoes the transformations
```lua
camera:translate(x, [y]);
```
moves the camera position by the given x and y value
```lua
camera:setPosition(x, [y]);
```
sets the position of the camera to the given x and y value (if no y is given then no change occurs)
```lua
camera:setX(x);
```
sets the x component of the cameras position
```lua
camera:setY(y);
```
sets the y component of the cameras position
```lua
camera:scale(x, [y]);
```
multiplies the x and y component of the scale by the corresponding input (if no y input then multiply both by the x input)
```lua
camera:scaleX(x);
```
multiplies the x component of the scale by the input
```lua
camera:scaleY(y);
```
multiplies the y component of the scale by the input
```lua
camera:setScale(x, [y]);
```
set the x and y component of the scale to the input (do not change the y if no y input is given)
```lua
camera:setScaleX(x);
```
set the x component of the scale to the given input
```lua
camera:setScaleY(y);
```
set the y component of the scale to the given input
```lua
camera:rotate(rot);
```
add the given input to the rotation of the camera
```lua
camera:setRotation(rot);
```
set the rotation of the camera to the given input
```lua
camera:setParalax(paralax);
```
set the paralx value of the camera to the given input
```lua
camera:setDrawPosition(x, [y]);
```
set the position of the top left corner of the draw area accoding to the window (if no y is given then the y component wont change)
```lua
camera:setDrawX(x);
```
set the x component of the top left corner of the draw area according to the window
```lua
camera:setDrawY(y);
```
set the y component of the top left corner of the draw area according to the window
```lua
camera:setDrawDimmensions(w, [h]);
```
set the width and height of the draw area in pixels according to the top left corner of the draw area to the window (if no h is given then height wont change)
```lua
camera:setDrawWidth(w);
```
set the width of the draw area in pixels according to the top left corner of the draw area to the window
```lua
camera:setDrawHeight(h);
```
set the height of the draw area in pixels according to the top left corner of the draw area to the window
```lua
camera:translateCenter(x, [y]);
```
move the center of the camera by the corresponding input
```lua
camera:setCenter(x, [y]);
```
set the position of the center of the camera to the input (if no y input given then no change occurs)
```lua
camera:setCenterX(x);
```
set the x component of the center of the camera to the given input
```lua
camera:setCenterY(y);
```
set the y component of the center of the camera to the given input
```lua
camera:center();
```
the center of the camera is moved to the center of the draw area
```lua
camera:copy();
```
a new camera object is returned that has all the same values as the camera used


```lua
camera:getX(); -- x
```
returns the x component of the position of the camera
```lua
camera:getY(); -- y
```
returns the y component of the position of the camera
```lua
camera:getPosition(); -- x, y
```
returns the x and y component of the position of the camera
```lua
camera:getScaleX(); -- x
```
returns the x component of the scale of the camera
```lua
camera:getScaleY(); -- y
```
returns the y component of the scale of the camera
```lua
camera:getScale(); -- x, y
```
returns the x and y component of the scale of the camera
```lua
camera:getRotation(); -- rot
```
returns the rotation of the camera
```lua
camera:getParalax(); -- paralax
```
returns the paralax of the camera
```lua
camera:getDrawX(); -- x
```
returns the x component of the top left corner of the draw area according to the window
```lua
camera:getDrawY(); -- y
```
returns the y component of the top left corner of the draw area according to the window
```lua
camera:getDrawPosition(); -- x, y
```
returns the x and y component of the top left corner of the draw area according to the window
```lua
getDrawWidth(); -- w
```
returns the width of the draw area according to the top left corner of the darw area to the window
```lua
camera:getDrawHeight(); -- h
```
returns the height of the draw area according to the top left corner of th draw area tio the window
```lua
camera:getDrawDimmensions(); -- w, h
```
returns the width and height component of the draw area according to the top left corner of the draw area to the window
```lua
camera:getDrawSpace(); -- x, y, w, h
```
returns the x, y, width, and height of the draw area according to the window
```lua
camera:getCenterX(); -- x
```
returns the x component of the center of the camera
```lua
camera:getCenterY(); -- y
```
returns the y component of the center of the camera
```lua
camera:getCenterPosition(); -- x, y
```
returns the x and y component of the center of the camera

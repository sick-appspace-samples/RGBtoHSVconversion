
--Start of Global Scope---------------------------------------------------------

-- Delay in ms between visualization steps for demonstration purpose
local DELAY = 2000

-- Create viewer
local viewer = View.create()

-- Setting up graphical overlay attributes
local textDecoration = View.TextDecoration.create()
textDecoration:setPosition(20, 50):setSize(40):setColor(0, 220, 0)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

---Viewing image with text label
---@param img Image
---@param name string
local function show(img, name)
  viewer:clear()
  viewer:addImage(img)
  viewer:addText(name, textDecoration)
  viewer:present()
  Script.sleep(DELAY) -- for demonstration purpose only
end

local function main()
  local img = Image.load('resources/RGBtoHSVconversion.bmp')
  show(img, 'Input image')

  -- Convert to HSV color space (Hue, Saturation, Value)
  local H, S, V = img:toHSV()
  show(H, 'Hue') -- View image with text label and delay
  show(S, 'Saturation')
  show(V, 'Value')

  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------

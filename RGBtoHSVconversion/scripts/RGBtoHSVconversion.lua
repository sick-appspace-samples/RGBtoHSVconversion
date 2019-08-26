--[[----------------------------------------------------------------------------

  Application Name:
  RGBtoHSVconversion
                                                                                             
  Description:
  Converting image to to HSV color space.
  
  How to Run:
  Starting this sample is possible either by running the app (F5) or
  debugging (F7+F10). Setting breakpoint on the first row inside the 'main'
  function allows debugging step-by-step after 'Engine.OnStarted' event.
  Results can be seen in the image viewer on the DevicePage.
  To run this sample a device with SICK Algorithm API is necessary.
  For example InspectorP or SIM4000 with latest firmware. Alternatively the
  Emulator on AppStudio 2.2 or higher can be used.
       
  More Information:
  Tutorial "Algorithms - Color".

------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

-- Delay in ms between visualization steps for demonstration purpose
local DELAY = 2000

-- Create viewer
local viewer = View.create()

-- Setting up graphical overlay attributes
local textDecoration = View.TextDecoration.create()
textDecoration:setPosition(20, 50)
textDecoration:setSize(40)
textDecoration:setColor(0, 220, 0)

local decoration = View.ShapeDecoration.create()
decoration:setLineColor(0, 230, 0) -- Green

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

-- Viewing image with text label
--@show(img:Image, name:string)
local function show(img, name)
  viewer:clear()
  local imid = viewer:addImage(img)
  viewer:addText(name, textDecoration, nil, imid)
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

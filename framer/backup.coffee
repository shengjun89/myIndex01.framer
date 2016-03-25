# This imports all the layers for "index" into indexLayers
myIndex = Framer.Importer.load "imported/index"

#initial
myIndex.side.x = -460
myIndex.layout.opacity = 0
myIndex.list.superLayer = myIndex.side
myIndex.ggtext.opacity = 0
slide = new Layer()
slide.width = 1768
slide.height = 145
slide.x = 0
slide.y = 426
slide.image = "images/slide.png"
myIndex.more.z = 2
slide.draggable.enabled = true
slide.draggable.vertical = false

slide.states.add
	one: x: -346
	two: x: -346*2
	three: x: -346*3
slide.states.animationOptions = curve: "spring(400, 20, 0)"	

slide.on Events.DragEnd, ->
	if slide.x < 0
		slide.states.switch("one")
		
	else if slide.x < -346
		slide.states.switch("two")
	
	else if slide.x < -346*2
		slide.states.switch("three")
		
	else
		slide.states.switch("default")	
	

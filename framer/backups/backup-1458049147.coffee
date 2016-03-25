# This imports all the layers for "index" into indexLayers
myIndex = Framer.Importer.load "imported/index"

myIndex.top.opacity = 0
#initial
slide01 = new Layer()
slide01.width = 692
slide01.height = 145
slide01.x = 0
slide01.image = "images/slide01.png"
slide02 = new Layer()
slide02.width = 692
slide02.height = 145
slide02.x = 0
slide02.image = "images/slide02.png"

SLIDER = new PageComponent
	width: 692
	height: 142
	x : 0
	y : 428
	scrollVertical: false
# 	backgroundColor: "000"

SLIDER.addPage(slide01)
SLIDER.addPage(slide02,"right")
myIndex.layout.superLayer = myIndex.index
SLIDER.superLayer = myIndex.index
myIndex.more.z = 1
SLIDER.z = 0
myIndex.layout.z = 1

#iconanimate
openStep = 1
closeStep = 1
isActive = true
openAnimation = null
closeAnimation = null

icon = new Layer()
bg = new BackgroundLayer
	backgroundColor: "FFF"
icon.width = 76
icon.height = 76
icon.openSteps = 21
icon.closeSteps = 20
icon.brightness = 100
icon.x = 0
icon.y = 40
icon.scale = 0.8
icon.backgroundColor = null
icon.clip = true
cell = new Layer()
cell.width = icon.width * icon.openSteps
cell.height = icon.height * 2
cell.superLayer = icon
cell.image = "images/icon_3.png"

#slide animation

icon.superLayer = myIndex.side
myIndex.side.opacity = 1
myIndex.side.x = -874
myIndex.side.z = 3
myIndex.top.z = 3
myIndex.layout.opacity = 0
myIndex.list.z = 2
myIndex.messBtn.z = 3
myIndex.layout.z = 0
myIndex.gg.x = 192
myIndex.ggtext.y = 110
myIndex.ggtext.opacity = 0
myIndex.gg.opacity = 1
myIndex.ggxq.opacity = 0
myIndex.sideBar.z = 0
sideBottom = new Layer
	width:1334
	height:1334
	x: -874
	y:0
	z:-2
	opacity: 1
	backgroundColor: "#FFF"

sideBottom.superLayer = myIndex.side
myIndex.messBtn.superLayer = myIndex.index
myIndex.messBtn.z = 3
# myIndex.index.draggable.enabled = true
# myIndex.index.draggable.vertical = false
# myIndex.layout.draggable.enabled = true
# myIndex.layout.draggable.vertical = false


#add states
myIndex.side.states.add
	on:{ x:0 }
myIndex.side.states.animationOptions = curve:  "spring(500,30,0)"

myIndex.index.states.add
	on:{ x:460 }	
myIndex.index.states.animationOptions = curve: "spring(500,30,0)"

myIndex.ggtext.states.add
	on:{ opacity:1 }
myIndex.ggtext.states.animationOptions = curve: "spring(500,30,0)"

myIndex.layout.states.add
	on:{ opacity:1 }
myIndex.layout.states.animationOptions = curve: "spring(500,30,0)"


myIndex.sideBar.states.add
	on: { width: 780 }
myIndex.sideBar.states.animationOptions = curve: "spring(500,30,0)"

myIndex.sideBottom.states.add
	on: { width: 780}
myIndex.sideBottom.states.animationOptions = curve: "spring(500,30,0)"

myIndex.list.states.add
	on:
		opacity:0
		time:0
myIndex.list.states.animationOptions = curve: "spring(500,30,0)"

myIndex.ggxq.states.add
	on:
		opacity: 1
		x: 292
myIndex.ggxq.states.animationOptions = curve: "spring(500,30,0)"

myIndex.gg.states.add
	on:{ opacity: 0 }	
myIndex.gg.states.animationOptions = curve: "spring(500,30,0)"

SLIDER.states.add
	on:
		opacity: 0.2
SLIDER.states.animationOptions = curve: "spring(500,30,0)"	

myIndex.messBtn.on Events.Click, ->
	myIndex.side.states.next()
	myIndex.index.states.next()
	myIndex.layout.states.next()
	SLIDER.states.next()
# 	sideBottom.states.switch("on")

myIndex.layout.on Events.Click, ->
	myIndex.side.states.switch("default")
	myIndex.index.states.switch("default")
	myIndex.layout.states.switch("default")
	myIndex.ggxq.states.switch("default")
	myIndex.gg.states.switch("default")	
	SLIDER.states.switch("default")
icon.onClick ->
	if isActive 
		openAnimation = new Animation
			layer:cell
			properties:x:0,y:0
			time:0
		openAnimation.start()
		
	else
		closeAnimation = new Animation
			layer:cell
			properties:y:-icon.height,x:0
			time:0
		closeAnimation.start()

cell.onAnimationEnd ->
	if isActive
		if openStep < icon.openSteps
			openAnimation.options.properties.x = -icon.width * openStep
			openAnimation.options.delay = 0.018
			openStep += 1
			openAnimation.start()
		else
			isActive = false
			openStep = 1
			openAnimation.stop()
	else
		if closeStep < icon.closeSteps
			closeAnimation.options.properties.x = -icon.width * closeStep
			closeAnimation.options.delay = 0.018
			closeStep += 1
			closeAnimation.start()	
		else
			isActive = true
			closeStep = 1
			closeAnimation.stop()
		
icon.on Events.Click, ->
	if isActive 
		openAnimation = new Animation
			layer:cell
			properties:x:0,y:0
			time:0
		openAnimation.start()
	else
		closeAnimation = new Animation
			layer:cell
			properties:y:-icon.height,x:0
			time:0
		closeAnimation.start()
	myIndex.sideBar.states.next()
	myIndex.sideBottom.states.next()
	myIndex.list.states.next()	
	myIndex.ggxq.states.next()
	myIndex.gg.states.next()	
	myIndex.ggtext.states.next()
			
myIndex.sideBottom.onClick ->
	if isActive 
		openAnimation = new Animation
			layer:cell
			properties:x:0,y:0
			time:0
		openAnimation.start()
	else
		closeAnimation = new Animation
			layer:cell
			properties:y:-icon.height,x:0
			time:0
		closeAnimation.start()
	myIndex.sideBar.states.next()
	myIndex.sideBottom.states.next()
	myIndex.list.states.next()	
	myIndex.ggxq.states.next()
	myIndex.gg.states.next()	
	myIndex.ggtext.states.next()
		
myIndex.list.on Events.Click, ->
	if isActive 
		openAnimation = new Animation
			layer:cell
			properties:x:0,y:0
			time:0
		openAnimation.start()
	else
		closeAnimation = new Animation
			layer:cell
			properties:y:-icon.height,x:0
			time:0
		closeAnimation.start()
	myIndex.sideBar.states.next()
	myIndex.sideBottom.states.next()
	myIndex.list.states.next()
	myIndex.ggxq.states.next()
	myIndex.gg.states.next()			
	myIndex.ggtext.states.next()
page.on Events.ScrollEnd, ->
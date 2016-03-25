openStep = 1
closeStep = 1
isActive = true
openAnimation = null
closeAnimation = null
bg = new BackgroundLayer()
icon = new Layer()
icon.width = 76
icon.height = 76
icon.openSteps = 28
icon.closeSteps = 25
icon.brightness = 100
icon.center()
icon.scale = 2
icon.backgroundColor = null
icon.clip = true
cell = new Layer()
cell.width = icon.width * icon.openSteps
cell.height = icon.height * 2
cell.superLayer = icon
cell.image = "images/icon_2.png"

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
		




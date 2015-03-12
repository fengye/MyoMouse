scriptId = 'me.beaconguide.myomouse'
scriptTitle = "Myo Mouse"
scriptDetailsUrl = "https://github.com/fengye/MyoMouse"

myo.controlMouse(true)
myo.setLockingPolicy('none')


function activeAppName()
    return "Myo Mouse"
end

function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ", " .. edge)

    if pose == 'fingersSpread' and edge == 'on' then
    	myo.mouse('left', 'click')
    	myo.vibrate('short')
    elseif pose == 'fist' then
    	if edge == 'on' then
    		myo.mouse('left', 'down')
    		myo.vibrate('medium')
    	else
    		myo.mouse('left', 'up')
    		myo.vibrate('short')
    	end
    elseif pose == 'doubleTap' then
    	-- emulate double click?
    	myo.mouse('left', 'click')
	elseif pose == 'rest' then
		myo.mouse('left', 'up')
	end
end

function onPeriodic()
end


function onForegroundWindowChange(app, title)
    -- myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    return true
end


function onActiveChange(isActive)
    -- myo.debug("onActiveChange")

    if isActive then
    	-- say hello world
    	myo.vibrate('long')
    end
end

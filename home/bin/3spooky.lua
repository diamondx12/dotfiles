#!/usr/bin/env lua
--Definitely not my best work, first script I've done in Lua 5.2
function draw()
	nissue = {
		"\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[1;33m",
		",~~~~~~~~~~~~~,                  \027[0;31m..:::::::::.. \027[1;33m                  ,~~~~~~~~~~~~~,\027[1;33m",
		"\027[1;33m:\027[1;32m .-======-,\027[1;33m  : \027[0;31m            ..:::\027[1;37maad8888888baa\027[0;31m:::..              \027[1;33m:\027[1;34mExploit-the \027[1;33m :\027[1;32m",
		"\027[1;33m:\027[1;32m ||\027[0;31mH4CK3R\027[1;32m|# \027[1;33m :       \027[0;31m   .::::\027[1;37md:?88888888888?::8b\027[0;31m::::.          \027[1;33m :\027[0;31m.-------,./|\027[1;33m :\027[1;32m",
		"\027[1;33m:\027[1;32m ||______|| \027[1;33m :\027[1;34m&&&&    \027[0;31m.:::\027[1;37md8888:?88888888??a888888b\027[0;31m:::.    \027[1;34m &&&&\027[1;33m:\027[0;31m{ \027[1;33m VIRUS \027[0;31m  /\027[1;33m :\027[1;33m",
		"\027[1;33m:\027[1;32m |   ___  | \027[1;33m : \027[1;34m  +  \027[0;31m.:::\027[1;37md8888888a8888888aa8888888888b\027[0;31m:::.  \027[1;34m + \027[1;33m  :\027[0;31m \\\027[1;33m DROPPER\027[0;31m 7\027[1;33m :\027[1;33m",
		"\027[1;33m:\027[1;32m |  |\027[1;35m[]\027[1;32m | | \027[1;33m : \027[1;34m   &\027[0;31m::::\027[1;37mdP\027[0;31m\023\022\021\020\019\018\017\016\027[1;37m88888888888\027[0;31m\023\022\021\020\019\018\017\016\027[1;37mYb\027[0;31m::::\027[1;34m&&\027[1;33m    :\027[0;31m  ~.  ,--.( \027[1;33m :\027[1;33m",
		"\027[1;33m:\027[1;32m  `-------' \027[1;33m :    \027[0;31m::::\027[1;37mdP\027[0;31m\024:::::::\015\027[1;37mY888888888P\027[0;31m\024:::::::\015\027[1;37mYb\027[0;31m::::\027[1;33m     : \027[0;31m   '~    `;\027[1;33m :\027[1;33m",
		"\027[1;33m:\027[0;31mReverse-    \027[1;33m :   \027[0;31m::::\027[1;37md8\027[0;31m\001:::::::::\014\027[1;37mY8888888P\027[0;31m\001:::::::::\014\027[1;37m8b\027[0;31m::::\027[1;33m    :\027[1;34mNation's-\027[0;31mData\027[1;33m:\027[1;33m",
		"\027[1;33m:\027[0;31mEngineering  \027[1;33m:  \027[0;31m.::::\027[1;37m88\027[0;31m\002\003\004\005\006\007\008\009\010\011\012\013\027[1;37mY88888P\027[0;31m\002\003\004\005\006\007\008\009\010\011\012\013\027[1;37m88\027[0;31m::::.\027[1;33m    `~~~~~~~~~~~~'\027[1;33m",
		"\027[1;33m `~~~~~~~~~~~~'  \027[0;31m:::::\027[1;37mY8baaaaaaaaaa88P\027[0;31m:\027[1;37mT\027[0;31m:\027[1;37mY88aaaaaaaaaad8P\027[0;31m:::::                  \027[0;31m",
		"\027[0;31m                 :::::::\027[1;37mY88888888888P\027[0;31m::\027[1;37m|\027[0;31m::\027[1;37mY88888888888P\027[0;31m:::::::                  \027[0;31m",
		"\027[1;33m,~~~~~~~~~~~~~,  \027[0;31m::::::::::::::::\027[1;37m888\027[0;31m:::\027[1;37m|\027[0;31m:::\027[1;37m888\027[0;31m::::::::::::::::\027[1;33m   ,~~~~~~~~~~~~~,\027[1;33m",
		"\027[1;33m:\027[1;34m R00T-KITS  \027[1;33m :  \027[0;31m`:::::::::::::::\027[1;37m8888888888888b\027[0;31m::::::::::::::'  \027[1;33m :\027[0;31mHoM3-$w33t\027[1;33m   :\027[1;37m",
		"\027[1;33m:\027[0;31m  ____ \027[1;37m  __ \027[1;33m :   \027[0;31m:::::::::::::::\027[1;37m88888888888888\027[0;31m::::::::::::::   \027[1;33m :\027[1;34m    (I\027[1;33m       :\027[1;33m",
		"\027[1;33m: \027[0;31m|    |\027[1;37m |\027[0;31m-_\027[1;37m| \027[1;33m:\027[0;31m    :::::::::::::\027[1;37md88888888888888\027[0;31m:::::::::::::    \027[1;33m :\027[1;36m^^^\027[1;34m  |\027[1;36m    ^^^\027[1;33m:\027[1;33m",
		"\027[1;33m:\027[0;31m |____|\027[1;33m_\027[1;37m|\027[0;31m=_\027[1;37m|\027[1;33m :\027[0;31m     ::::::::::::\027[1;37m88\027[0;31m::\027[1;37m88\027[0;31m::\027[1;37m88\027[0;31m:::\027[1;37m88\027[0;31m::::::::::::\027[1;33m      :\027[1;34m|u|_\027[1;36m^^^^^\027[1;34m_|u|\027[1;33m:\027[1;33m",
		"\027[1;33m:\027[1;37m  ____\027[1;33m)\027[1;37m_\027[1;37m.\027[1;37m___\027[1;33m :      \027[0;31m`::::::::::\027[1;37m88\027[0;31m::\027[1;37m88\027[0;31m::\027[1;37m88\027[0;31m:::\027[1;37m88\027[0;31m::::::::::'      \027[1;33m :\027[1;34m|_  u _ u  _|\027[1;33m:\027[1;33m",
		"\027[1;33m: \027[1;37m/\027[1;34m:::::;\027[1;37m|\027[1;34m  _\027[1;37m)\027[1;33m:\027[1;34m      &\027[0;31m`:::::::::\027[1;37m88\027[0;31m::\027[1;37m88\027[0;31m::\027[1;37mP\027[0;31m::::\027[1;37m88\027[0;31m:::::::::'\027[1;34m&       \027[1;33m:\027[1;34m  |__|\027[1;37m;\027[1;34m|__| \027[1;33m :\027[1;33m",
		"\027[1;33m:\027[1;37m `======'\027[1;34m |_|\027[1;33m:      \027[1;34m+ \027[0;31m `:::::::\027[1;37m88\027[0;31m::\027[1;37m88\027[0;31m:::::::\027[1;37m88\027[0;31m:::::::' \027[1;34m  +     \027[1;33m :\027[1;34m    /_/     \027[1;33m :\027[1;33m",
		"\027[1;33m:\027[1;34mUr-Computer-\027[1;33m :\027[1;34m&&&&&&& \027[0;31m   ``:::::::::::::::::::::::''\027[1;34m     &&&&&&&\027[1;33m:\027[0;31mH4x0r-HoM3- \027[1;33m :\027[1;33m",
		"\027[1;33m:\027[1;34mis-MY-\027[0;31mSlave \027[1;33m : \027[0;31m               ``::::::::::::::''\027[1;33m                :\027[0;31m *\027[1;37m127\027[0;31m.\027[1;37m0\027[0;31m.\027[1;37m0\027[0;31m.\027[1;37m1\027[0;31m* \027[1;33m:\027[1;33m",
		"\027[1;33m `~~~~~~~~~~~~'                                                   `~~~~~~~~~~~~'\027[1;33m",
		"\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[0;31m=\027[1;37m-\027[1;37m",
		"\027[0;31m -======-   \027[1;37m  +\027[0;31mWARNING\027[1;37m+\027[1;33m\"\027[0;31mIllegal\027[1;37m_\027[0;31mNetwork\027[1;37m_\027[0;31mConnections\027[1;37m_\027[0;31mBeyond\027[1;37m_\027[0;31mLogin\027[1;33m\"   \027[0;31m    -======-\027[0;31m",
		"\027[0;31m |\027[1;32mH\027[1;34m4\027[1;33mC\027[1;35mK\027[1;36m3\027[1;37mR\027[0;31m|        \027[1;34m -== \027[1;37m You are at the point of \027[0;31mNO RETURN \027[1;34m ==-          \027[0;31m |\027[1;32mH\027[1;34m4\027[1;33mC\027[1;35mK\027[1;36m3\027[1;37mR\027[0;31m|\027[0;31m",
		"\027[0;31m |______|\027[0;31mYour Activities\027[1;37m:\027[1;33mWill\027[1;37m_\027[1;33mbe\027[1;37m_\027[1;33mKeylogged\027[1;37m_\027[1;33mand\027[1;37m_\027[1;33mTimestamped \027[1;34m\"\027[0;31mUSER_BEWARE\027[1;34m\"\027[0;31m|______|\027[0;31m",
		"\027[0;31mHacking Sites\027[1;37m:\027[0;31m https\027[1;37m:\027[1;33m//\027[0;31msites\027[1;37m.\027[0;31mgoogle\027[1;37m.\027[0;31mcom\027[1;33m/\027[0;31msite\027[1;33m/\027[0;31mlazyboxx \027[1;35m*\027[0;31m http\027[1;37m:\027[1;33m//\027[0;31mwww\027[1;37m.\027[0;31mfreebsd\027[1;37m.\027[0;31morg \027[1;33m"
	}
	io.write("\027[1;1H") --reset cursor
	for a = 7,11 do
		for b = 1,24 do
			if b == position then
				nissue[a] = string.gsub(nissue[a],string.char(b),"\027[1;31m@\027[0;31m")
			else
				nissue[a] = string.gsub(nissue[a],string.char(b),":")
			end
		end
	end
	for a = 5,21 do
		if bool then
			nissue[a] = string.gsub(nissue[a],"&","\027[31;1m=\027[37;1m")
			nissue[a] = string.gsub(nissue[a],"+","\027[31;1m|\027[37;1m")
		else
			nissue[a] = string.gsub(nissue[a],"&","=")
			nissue[a] = string.gsub(nissue[a],"+","|")
		end
	end
	for i = 1,28 do
		print(nissue[i])
	end
	bool = not bool
end
function changepos(num)
	if position == 24 and num == 1 then
		position = 1
	elseif position == 1 and num == -1 then
		position = 24
	else
		position = position + num
	end
end

local clock = os.clock
function sleep(n)  -- seconds
	local t0 = clock()
	while clock() - t0 <= n do end
end

position = 14
bool = true
dirs = {1,-1}
draw()
while true do
	move = math.random(1,6)
	dir = dirs[math.random(1,2)]
	draw()
	for m = 1,move do
		changepos(dir)
		draw()
		sleep(0.1) --Replace it with some other way to wait one tenth of a second if you're using Windows or don't have "sleep"
	end							--On the subject of Windows compatibility, Ansicon is a perfect way to make the Ansi escape codes work.
end

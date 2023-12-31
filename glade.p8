pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function playerdraw(sp,xf)
	player.sp = sp
	player.xf = xf
end

function velocity(x,y)
	player.x = player.x+x
	player.y = player.y+y
end

objs = {}

function isoobj(x,y,w,l,h)
	obj = {
		x=x,
		y=y,
		w=w,
		l=l,
		h=h
	}
	add(objs, obj)
end

function _init()
 player = {
 	x = 0,
 	y = 0,
 	sp = 1,
 	xf = false
 	}
	isoobj(5,5,40,22,50)
	isoobj(0,25,120,120,5)
end

function _update()
	if btn(0) then
		playerdraw(1,true)
		velocity(-1,0)
	end
	if btn(1) then
		playerdraw(1,false)
		velocity(1,0)
	end
	if btn(2) then
		playerdraw(2,false)
		velocity(0,-1)
	end
	if btn(3) then
		playerdraw(3,false)
		velocity(0,1)
	end
end

function drawisoobjs()
	for o in all(objs) do
		relativex = o.x-player.x+64
		relativey = o.y-player.y+64
		print(relativex)
		print(relativey)
		line(relativex,relativey,relativex,relativey-o.h) //middle verticle line |
		line(relativex,relativey,relativex+(o.l * cos(0.875)),relativey-(o.l *sin(0.875)))//right bottom line /
		line(relativex,relativey,relativex-(o.w * cos(0.875)),relativey-(o.w *sin(0.875)))//left bottom line \
		line(relativex+(o.l * cos(0.875)),relativey-(o.l *sin(0.875)), relativex+(o.l * cos(0.875)), relativey-(o.l *sin(0.875))-o.h)//right verticle line |
		line(relativex-(o.w * cos(0.875)),relativey-(o.w *sin(0.875)), relativex-(o.w * cos(0.875)), relativey-(o.w *sin(0.875))-o.h)//left verticle line |
		line(relativex+(o.l * cos(0.875)), relativey-(o.l *sin(0.875))-o.h, relativex, relativey-o.h)
		line(relativex-(o.w * cos(0.875)), relativey-(o.w *sin(0.875))-o.h,relativex, relativey-o.h)
		line(relativex+(o.l * cos(0.875)), relativey-(o.l *sin(0.875))-o.h, relativex+(o.l * cos(0.875))-(o.w * cos(0.875)),relativey-(o.l *sin(0.875))-o.h-(o.w *sin(0.875)))
		line(relativex-(o.w * cos(0.875)),relativey-(o.w *sin(0.875))-o.h, relativex+(o.l * cos(0.875))-(o.w * cos(0.875)),relativey-(o.l *sin(0.875))-o.h-(o.w *sin(0.875)))
	end	
end

function _draw()
	cls()
	print(player.x)
	print(player.y)
	drawisoobjs()
	spr(player.sp,64,64,1,1,player.xf)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000004000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000099400004940000499900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000099999900009990000094940000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000499999940009990000099990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700449999000004990000049490000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000040404000004440000004040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

using GeometryTypes, ColorTypes
using GLAbstraction, GLFW
using ModernGL, GLWindow



using Base.Test
sleep(0.1)
GLFW.Init()
global const window = createwindow("Mesh Display", 1000, 1000, debugging = false)
N = 100



t1 = Texture(RGBAU8,     (512,10), minfilter=:nearest, x_repeat=:clamp_to_edge)
t2 = Texture(Vec{2, GLushort}, (77,91), minfilter=:nearest, x_repeat=:clamp_to_edge)
typealias Vec2 Vec{2, Float32}
typealias Vec3 Vec{3, Float32}
typealias Vec4 Vec{4, Float32}

typealias iVec2 Vec{2, Cint}
typealias iVec3 Vec{3, Cint}
typealias iVec4 Vec{4, Cint}

typealias uVec2 Vec{2, Cuint}
typealias uVec3 Vec{3, Cuint}
typealias uVec4 Vec{4, Cuint}

intensity2Di 	= Texture(Cint[0 for i=1:N, j=1:N])
intensity2Dui 	= Texture(Cuint[0 for i=1:N, j=1:N])

rg2Df 	= Texture([Vec2(0) for i=1:N, j=1:N])
rg2Di 	= Texture([iVec2(0) for i=1:N, j=1:N])
rg2Dui 	= Texture([uVec2(0f0) for i=1:N, j=1:N])

rgb2Df 	= Texture([Vec3(0) for i=1:N, j=1:N])
rgb2Di 	= Texture([iVec3(0) for i=1:N, j=1:N])
rgb2Dui = Texture([uVec3(0f0) for i=1:N, j=1:N])

rgba2Df  = Texture([Vec4(0) for i=1:N, j=1:N])
rgba2Di  = Texture([iVec4(0) for i=1:N, j=1:N])
rgba2Dui = Texture([uVec4(0f0) for i=1:N, j=1:N])


z = Matrix{Vec4}[Vec4[Vec4(0f0) for i=1:N, j=1:N] for i=1:10]
arraytexture = Texture(z)


@test toglsltype_string(intensity2Df) 	== "uniform sampler2D"
@test toglsltype_string(rg2Df) 			== "uniform sampler2D"
@test toglsltype_string(rgb2Df) 		== "uniform sampler2D"
@test toglsltype_string(rgba2Df) 		== "uniform sampler2D"


@test typeof(intensity2Df).parameters == (Float32, 2)
@test typeof(rgba2Df).parameters == (Vec4, 2)

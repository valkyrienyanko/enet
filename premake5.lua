workspace "enet"
	configurations { "Debug", "Release" }
	platforms { "x32", "x64" }

	project "enet_static"
		kind "StaticLib"
		language "C"
		
		files { "*.c" }
		
		includedirs { "include/" }
		
		filter "configurations:Debug"
			targetsuffix "d"
			defines { "DEBUG" }
			symbols "On"
		
		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "Full"

	  filter { "configurations:Debug", "platforms:x64" }
			targetsuffix "64d"
			
		filter { "configurations:Release", "platforms:x64" }
			targetsuffix "64"

	project "enet"
		kind "SharedLib"
		language "C"
		
		files { "*.c" }
		
		includedirs { "include/" }
		
		defines { "ENET_DLL=1" }
		
		filter "configurations:Debug"
			targetsuffix "d"
			defines { "DEBUG" }
			symbols "On"
		
		filter "configurations:Release"
			defines { "NDEBUG" }
			optimize "Full"
			
		filter { "configurations:Debug", "platforms:x64" }
			targetsuffix "64d"
			
		filter { "configurations:Release", "platforms:x64" }
			targetsuffix "64"

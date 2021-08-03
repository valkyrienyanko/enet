project "enet"
	kind "StaticLib"
	language "C"
	staticruntime "off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files { "*.c", "*.h" }

	links { "ws2_32.lib",
		"winmm.lib" }
	
	includedirs { "include/" }
	
	filter "configurations:Debug"
		targetsuffix "d"
		defines { "DEBUG" }
		symbols "On"
	
	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "Full"

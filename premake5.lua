project "bimg"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


    files
	{
		"src/**.h",
		"src/**.cpp",
		"3rdparty/**.cpp",
		"3rdparty/**.h",
		"include/**.h",
	}

	includedirs
	{
		"include",
		"src",
		"3rdparty",
        "3rdparty/astc-encoder/include",
        "3rdparty/iqa/include",
		"3rdparty/tinyexr/deps/",
		"3rdparty/nvtt/",
		"%{IncludeDir.bx}"
	}

	links
	{
		"bx"
	}
	
	filter "system:windows"
		systemversion "latest"
		buildoptions { "/Zc:__cplusplus", "/Zc:preprocessor" }
        exceptionhandling "Off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines
        {
            "BX_CONFIG_DEBUG"
        }

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"

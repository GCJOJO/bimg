project "bimg"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


	-- Same files as the "bimg" project of scripts/bimg.lua (no decode / encode: bgfx only needs the core)
    files
	{
		"include/**.h",
		"src/image.cpp",
		"src/image_encode_wic.cpp",
		"src/image_wic.h",
		"src/bimg_p.h",
		"src/config.h",
		"3rdparty/astc-encoder/source/**.cpp",
		"3rdparty/astc-encoder/source/**.h",
	}

	includedirs
	{
		"include",
		"src",
		"3rdparty",
        "3rdparty/astc-encoder/include",
		"%{IncludeDir.bx}"
	}

	links
	{
		"bx"
	}
	
	defines
	{
		"BX_CONFIG_DEBUG",
		"ASTCENC_F16C=0",
		"ASTCENC_NEON=0"
	}

	filter "system:windows"
		systemversion "latest"
		buildoptions { "/Zc:__cplusplus", "/Zc:preprocessor" }
        exceptionhandling "Off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"

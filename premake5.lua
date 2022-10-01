project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
        "imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "system:macosx"
		pic "On"

	filter "configurations:Debug"
		optimize "Off"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"
		runtime "Release"
		symbols "On"

	filter "configurations:Dist"
		optimize "Full"
		runtime "Release"
		symbols "Off"

    filter { ("configurations:Release" or "configurations:Dist") and "system:windows" }
		flags
		{
			"LinkTimeOptimization"
		}

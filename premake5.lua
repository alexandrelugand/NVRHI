local _files =
{
	"./include/**.h",
	"./src/**.cpp",
	-- "./rtxmu/include/**.h",
	-- "./rtxmu/src/**.cpp"
}

local _includedirs =
{
	"./include",
	-- "./rtxmu/include",
	-- "%{includeDir.VulkanSDK}",
	"%{includeDir.NVRHI_Thirdparty_Vulkan}/include",
	"%{includeDir.NVRHI_Thirdparty_DirectX}/include"
}

-- local _libdirs =
-- {
-- 	"C:/Program Files (x86)/Windows Kits/10/Lib/10.0.26100.0/um/x64"
-- }

group "Dependencies"
	project "NVRHI"
		kind "StaticLib"
		language "C++"
		cppdialect "C++17"
		staticruntime "off"
		architecture "x64"
    disablewarnings { "4005" }
		targetdir ("%{wks.location}/bin/" .. outputdir)
		objdir ("%{wks.location}/obj/" .. tmpdir)

		files(_files)
		includedirs(_includedirs)
		--libdirs(_libdirs)

		defines
		{
			"NOMINMAX",
			"VK_USE_PLATFORM_WIN32_KHR",
			"NVRHI_D3D12_WITH_COOPVEC=0",
			"VULKAN_HPP_DISPATCH_LOADER_DYNAMIC=1",
			"NVRHI_SHARED_LIBRARY_BUILD"
		}

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"
			optimize "Off"

		filter "configurations:Release"
			runtime "Release"
			optimize "full"

group ""

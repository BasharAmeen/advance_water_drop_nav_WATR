#include "include/advance_water_drop_nav_bar/advance_water_drop_nav_bar_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "advance_water_drop_nav_bar_plugin.h"

void AdvanceWaterDropNavBarPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  advance_water_drop_nav_bar::AdvanceWaterDropNavBarPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

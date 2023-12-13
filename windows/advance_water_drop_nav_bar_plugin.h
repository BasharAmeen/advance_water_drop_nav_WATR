#ifndef FLUTTER_PLUGIN_ADVANCE_WATER_DROP_NAV_BAR_PLUGIN_H_
#define FLUTTER_PLUGIN_ADVANCE_WATER_DROP_NAV_BAR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace advance_water_drop_nav_bar {

class AdvanceWaterDropNavBarPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AdvanceWaterDropNavBarPlugin();

  virtual ~AdvanceWaterDropNavBarPlugin();

  // Disallow copy and assign.
  AdvanceWaterDropNavBarPlugin(const AdvanceWaterDropNavBarPlugin&) = delete;
  AdvanceWaterDropNavBarPlugin& operator=(const AdvanceWaterDropNavBarPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace advance_water_drop_nav_bar

#endif  // FLUTTER_PLUGIN_ADVANCE_WATER_DROP_NAV_BAR_PLUGIN_H_

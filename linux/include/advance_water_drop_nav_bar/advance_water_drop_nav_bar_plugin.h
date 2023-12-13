#ifndef FLUTTER_PLUGIN_ADVANCE_WATER_DROP_NAV_BAR_PLUGIN_H_
#define FLUTTER_PLUGIN_ADVANCE_WATER_DROP_NAV_BAR_PLUGIN_H_

#include <flutter_linux/flutter_linux.h>

G_BEGIN_DECLS

#ifdef FLUTTER_PLUGIN_IMPL
#define FLUTTER_PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define FLUTTER_PLUGIN_EXPORT
#endif

typedef struct _AdvanceWaterDropNavBarPlugin AdvanceWaterDropNavBarPlugin;
typedef struct {
  GObjectClass parent_class;
} AdvanceWaterDropNavBarPluginClass;

FLUTTER_PLUGIN_EXPORT GType advance_water_drop_nav_bar_plugin_get_type();

FLUTTER_PLUGIN_EXPORT void advance_water_drop_nav_bar_plugin_register_with_registrar(
    FlPluginRegistrar* registrar);

G_END_DECLS

#endif  // FLUTTER_PLUGIN_ADVANCE_WATER_DROP_NAV_BAR_PLUGIN_H_

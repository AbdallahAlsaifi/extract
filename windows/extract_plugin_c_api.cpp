#include "include/extract/extract_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "extract_plugin.h"

void ExtractPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  extract::ExtractPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

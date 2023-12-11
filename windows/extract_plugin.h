#ifndef FLUTTER_PLUGIN_EXTRACT_PLUGIN_H_
#define FLUTTER_PLUGIN_EXTRACT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace extract {

class ExtractPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ExtractPlugin();

  virtual ~ExtractPlugin();

  // Disallow copy and assign.
  ExtractPlugin(const ExtractPlugin&) = delete;
  ExtractPlugin& operator=(const ExtractPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace extract

#endif  // FLUTTER_PLUGIN_EXTRACT_PLUGIN_H_

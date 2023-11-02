#ifndef FLUTTER_PLUGIN_HUMAN_AVATAR_PLUGIN_H_
#define FLUTTER_PLUGIN_HUMAN_AVATAR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace human_avatar {

class HumanAvatarPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  HumanAvatarPlugin();

  virtual ~HumanAvatarPlugin();

  // Disallow copy and assign.
  HumanAvatarPlugin(const HumanAvatarPlugin&) = delete;
  HumanAvatarPlugin& operator=(const HumanAvatarPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace human_avatar

#endif  // FLUTTER_PLUGIN_HUMAN_AVATAR_PLUGIN_H_

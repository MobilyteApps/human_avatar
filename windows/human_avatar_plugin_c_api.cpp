#include "include/human_avatar/human_avatar_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "human_avatar_plugin.h"

void HumanAvatarPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  human_avatar::HumanAvatarPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

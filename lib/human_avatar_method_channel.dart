import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'human_avatar_platform_interface.dart';

/// An implementation of [HumanAvatarPlatform] that uses method channels.
class MethodChannelHumanAvatar extends HumanAvatarPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('human_avatar');

}

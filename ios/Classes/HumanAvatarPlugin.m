#import "HumanAvatarPlugin.h"
#if __has_include(<human_avatar/human_avatar-Swift.h>)
#import <human_avatar/human_avatar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "human_avatar-Swift.h"
#endif

@implementation HumanAvatarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHumanAvatarPlugin registerWithRegistrar:registrar];
}
@end

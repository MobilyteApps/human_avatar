import 'human_avatar_platform_interface.dart';
import 'models/AvatarData.dart';
import 'models/CreateVideoAvatarData.dart';

//this is class to access fields and functions
///[HumanAvatar] is needs to initialize in your code
class HumanAvatar {
  ///call this function by creating [HumanAvatar] instance
  ///Used to create image Avatar
  /// `secretKey` is provided by Elai. platform
  /// pass gender in [createAvatar] function
  /// you can create [avatar] by selecting gallery image and from camera
  Future<AvatarData?> createAvatar(
      {required String secretKey,
      required String gender,
      required String photoName,
      required String photoData}) {
    return HumanAvatarPlatform.instance
        .createAvatar(secretKey, gender, photoName, photoData);
  }

  /// Used to create text to speech video from avatar
  ///call this function by creating [HumanAvatarVideo]instance
  /// `secretKey` is provided by Elai. platform
  /// pass Image Url in [createVideoAvatar] function
  /// send your text that need to speech
  ///[avatarName] is optional
  /// [videoName] is optional param
  Future<CreateVideoAvatarData?> createVideoAvatar({
    required String secretKey,
    required String imageUrl,
    required String speechText,
    required String gender,
    String? avatarName,
    String? videoName,
    required String avatarId,
    required Null Function(CreateVideoAvatarData value) onRender,
  }) {
    return HumanAvatarPlatform.instance.createVideoAvatar(
        secretKey,
        imageUrl,
        speechText,
        gender,
        avatarName ?? '',
        videoName ?? "My Video",
        avatarId,
        onRender);
  }

  /// Used to retrieve all videos from Elai.
  ///call this function by creating [fetchAvatarVideo]instance
  /// `secretKey` is provided by Elai. platform
  /// pass [page] and [limit] in [retrieveAllVideos] function to create pagination
  Future<String?> retrieveAllVideos(
      {required String secretKey, String? page = "1", String? limit = "50"}) {
    return HumanAvatarPlatform.instance
        .retrieveAllVideos(secretKey, page, limit);
  }
}

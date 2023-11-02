
import 'human_avatar_platform_interface.dart';
import 'models/AvatarData.dart';
import 'models/CreateVideoAvatarData.dart';

class HumanAvatar {
  Future<AvatarData?> createAvatar(
  {required String secretKey,
    required  String gender,
    required  String photoName,
    required   String photoData} ){
    return HumanAvatarPlatform.instance.createAvatar(secretKey, gender, photoName, photoData);
  }

  Future<CreateVideoAvatarData?>createVideoAvatar({
    required String secretKey,
    required String imageUrl,
    required String speechText,
    required String gender,
      String? avatarName,
      String? videoName,
    required  String avatarId,
    required Null Function(CreateVideoAvatarData value) onRender,
  }) {
    return HumanAvatarPlatform.instance.createVideoAvatar(
        secretKey,
        imageUrl,
        speechText,
        gender,
        avatarName??'',
        videoName??"My Video",
        avatarId,
        onRender);
  }

  Future<String?>retrieveAllVideos({required String secretKey,String? page="1",String? limit="50"}){
    return HumanAvatarPlatform.instance.retrieveAllVideos(secretKey,page,limit);
  }







}

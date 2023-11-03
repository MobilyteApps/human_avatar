[<img src="https://raw.githubusercontent.com/firebase/flutterfire/master/resources/flutter_favorite.png" width="200" />](https://flutter.dev/docs/development/packages-and-plugins/favorites)

# human_avatar

A  Flutter package for create video by using human avatar.

![The example playing video](https://github.com/MobilyteApps/human_avatar/docs/human_video.gif?raw=true)

## Installation

To use this plugin, add human_avatar as a [dependency in your pubspec.yaml file.](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

```bash
human_avatar: any
```

## Getting Started

To get started with Human_vatar for Flutter first you will have to create account on Elai. and genrate you secret_key, please [see the documentation](https://app.elai.io/signup).

## Create Avatar

```bash
 await _humanAvatarPlugin.createAvatar(
                    secretKey:secretKey,
                    gender: "male",
                    photoName: photo.name,
                    photoData: _base64String);
```

## create Video
```bash
 await _humanAvatarPlugin.createVideoAvatar(
                    secretKey:secretKey,
                    imageUrl: data?.frontendConfig?.canvas ?? '',
                    speechText: "this is my first text video",
                    gender:  "male",
                    avatarName: "",
                    avatarId:  data?.avatarDataId ?? '',
                    onRender:(value){
                      print(value.url);
                      createVideoAvatarData=value;
                    }
                );
```



# human_avatar

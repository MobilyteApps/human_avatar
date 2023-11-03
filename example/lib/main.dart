import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:human_avatar/human_avatar.dart';
import 'package:human_avatar/models/AvatarData.dart';
import 'package:human_avatar/models/CreateVideoAvatarData.dart';
import 'package:human_avatar_example/video_player_view.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final secretKey = 'Z0BHr9hDpHw0yl9pQsiMHTN6cXdfgdfga';

  ///this is secret key you can get from Elai. platform
  final _humanAvatarPlugin = HumanAvatar();

  ///here is initialize [HumanAvatar]
  AvatarData? data;

  ///used for created avatar response handle
  CreateVideoAvatarData? createVideoAvatarData;

  ///used for created avatar video response handle

  @override
  void initState() {
    super.initState();
  }

  ///this is [human_avatar] example

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            createVideoAvatarData?.url ?? "No url found",
            style: const TextStyle(color: Colors.black),
          ),
          if (createVideoAvatarData?.url == null) ...{
            GestureDetector(
              onTap: () async {
                ///Navigate to Video player with created video url
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VideoPlayerView(createVideoAvatarData?.url ?? '')));
              },
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    'View video',
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
          },
          GestureDetector(
            onTap: () async {
              ///image picker open device camera
              final XFile? photo =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (photo != null) {
                Uint8List bytes = await photo.readAsBytes();
                String base64String = base64.encode(bytes);

                ///Here is calling create your image avatar
                data = await _humanAvatarPlugin.createAvatar(
                    secretKey: secretKey,
                    gender: "male",
                    photoName: photo.name,
                    photoData: base64String //photo data send in base64
                    );
                if (data != null) {
                  setState(() {});
                }
              }
            },
            child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: 50,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                    child: Text(
                  'Create Avatar',
                  style: TextStyle(color: Colors.white),
                ))),
          ),
          if (data?.frontendConfig?.thumbnail != null) ...{
            GestureDetector(
              onTap: () async {
                ///here is calling create video with your avatar url
                await _humanAvatarPlugin.createVideoAvatar(
                    secretKey: secretKey,
                    imageUrl: data?.frontendConfig?.canvas ?? '',
                    speechText: "this is my first text video",
                    gender: data?.frontendConfig?.gender ?? '',
                    avatarName: "",
                    avatarId: data?.avatarDataId ?? '',
                    onRender: (value) {
                      createVideoAvatarData = value;
                      setState(() {});
                    });
              },
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    'Create Avatar video',
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
          }
        ],
      ),
    );
  }
}

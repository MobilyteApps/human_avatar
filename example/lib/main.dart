import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:human_avatar/human_avatar.dart';
import 'package:human_avatar/models/AvatarData.dart';
import 'package:human_avatar/models/CreateVideoAvatarData.dart';
import 'package:human_avatar_example/video_player_view.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MaterialApp(
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final secretKey='Z0BHr9hDpHw0yl9pQsiMHTN6cXKHR9Ue';
  final _humanAvatarPlugin = HumanAvatar();
  AvatarData? data;
  CreateVideoAvatarData? createVideoAvatarData;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(createVideoAvatarData?.url??"No url found",style: const TextStyle(color: Colors.black),),
          if(createVideoAvatarData?.url==null)...{
            GestureDetector(
              onTap: () async {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      VideoPlayerView(createVideoAvatarData?.url??
                          'https://apis.elai.io/public/video/6541edfbe33322d8d6ea15d7.mp4?s=99aa0662abd499bc9d8f064bbbd60a8446b6ed50db3fa5799df67d11eedf589f')));

              },
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                  child: const Center(child: Text('View video',
                    style: TextStyle(color: Colors.white),))),
            ),
          },

          GestureDetector(
            onTap: () async {
              final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
              if(photo!=null){
                Uint8List _bytes = await photo.readAsBytes();
                String _base64String = base64.encode(_bytes);
                data= await _humanAvatarPlugin.createAvatar(
                    secretKey:secretKey,
                    gender: "male",
                    photoName: photo.name,
                    photoData: _base64String);
                if(data!=null){
                  setState(() {
                  });
                }
              }
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                height: 50,
                width: double.infinity,
                color: Colors.black,
                child: const Center(child: Text('Create Avatar',style: TextStyle(color: Colors.white),))),
          ),

          if(data?.frontendConfig?.thumbnail!=null)...{
            GestureDetector(
              onTap: () async {
                await _humanAvatarPlugin.createVideoAvatar(
                    secretKey:secretKey,
                    imageUrl: data?.frontendConfig?.canvas ?? '',
                    speechText: "this is my first text video",
                    gender:  data?.frontendConfig?.gender ?? '',
                    avatarName: "",
                    avatarId:  data?.avatarDataId ?? '',
                    onRender:(value){
                      print(value.url);
                      createVideoAvatarData=value;
                      setState(() {
                      });
                    }
                );
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                  child: const Center(child: Text('Create Avatar video',
                    style: TextStyle(color: Colors.white),))),
            ),
          }
        ],
      ),
    );
  }
}

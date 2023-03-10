import 'package:boot_camp_creativa/view/interface.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset('assets/HarryPotterTheme.mp4')
      ..initialize().then((value) {
        setState(() {});
      })
      ..setVolume(
        5.0,
      );

    playVideo();
  }

  @override
  void playVideo() async {
    controller.play();
    await Future.delayed(
      Duration(seconds: 15),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Interface()));
  }

  @override
  void dispose() {
    // TODO: implement dispose

    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : Container(),
      ),
    );
  }
}

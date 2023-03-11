import 'package:boot_camp_creativa/modules/interface_screen/interface.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // late VideoPlayerController controller;
  late AnimationController controller;
  bool isLoaded = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 25,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Interface()));
      }
    });
    // TODO: implement initState
    super.initState();
    // controller = VideoPlayerController.asset('assets/HarryPotterTheme.mp4')
    //   ..initialize().then((value) {
    //     setState(() {});
    //   })
    //   ..setVolume(
    //     5.0,
    //   );
    //
    // playVideo();
  }

  @override
  // void playVideo() async {
  //   controller.play();
  //   await Future.delayed(
  //     Duration(seconds: 10),
  //   );
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => Interface()));
  // }

  @override
  // void dispose() {
  //   // TODO: implement dispose
  //
  //   controller.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_fFAEQMshT3.json',
            controller: controller, onLoaded: (comp) {
          controller.duration = comp.duration;
          controller.forward();
        }),
      ),
    );

    //body
    // Center(
    //   child: controller.value.isInitialized
    //       ? AspectRatio(
    //     aspectRatio: controller.value.aspectRatio,
    //     child: VideoPlayer(controller),
    //   )
    //       : Container(),
    // ),
  }
}

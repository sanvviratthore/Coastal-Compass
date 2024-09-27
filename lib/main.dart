import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'login_signup_page.dart'; // Login and Signup page
import 'dart:async';
//import 'dart:ui';

void main() {
  runApp(const CoastalCompassApp());
}

class CoastalCompassApp extends StatelessWidget {
  const CoastalCompassApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

// Splash Screen with Logo
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: Image.asset(
            'assets/images/11627D6D-753F-4270-A5D1-50F26DCAF4CE.jpeg', // Logo image for splash screen
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

// Home Page with Video Background and Navigation
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/825a7892e6814559b9f37f61ed535f23.mp4')
      ..setLooping(true) // Loop the video
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coastal Compass'),
        backgroundColor: Color.fromARGB(255, 198, 226, 238),
      ),
      body: Stack(
        children: [
          // Video Background
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Center(child: CircularProgressIndicator()),

          // Translucent Overlay
          Container(
            color: Colors.black.withOpacity(0.2),
          ),

          // Welcome Text and Button
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Welcome to the Coastal Compass App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 26, 1, 1),
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    
                    _controller.pause();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginSignupPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 243, 128, 33),
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  ),
                  child: const Text(
                    'Login / Signup',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

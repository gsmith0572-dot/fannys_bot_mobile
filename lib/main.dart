import 'package:flutter/material.dart';

void main() => runApp(const FannyApp());

class FannyApp extends StatelessWidget {
  const FannyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fanny's Bot",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.transparent),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0F0F1A), Color(0xFF1A0033)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFFF00E5), Color(0xFF00FFFF)],
                ).createShader(bounds),
                child: const Text(
                  "FANNY'S",
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
              const Text(
                "BOT",
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900, color: Colors.white),
              ),
              const Spacer(),
              FloatingActionButton(
                elevation: 40,
                backgroundColor: Colors.transparent,
                onPressed: () {},
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [Color(0xFFFF00E5), Color(0xFF00FFFF)]),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF00E5).withOpacity(0.8),
                        blurRadius: 60,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.mic, size: 80, color: Colors.white),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

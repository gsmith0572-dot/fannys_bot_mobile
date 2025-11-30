import 'package:flutter/material.dart';

void main() => runApp(const MediVoxApp());

class MediVoxApp extends StatelessWidget {
  const MediVoxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0A001A), Color(0xFF1A0033), Color(0xFF000000)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF00FFFF), Color(0xFFFF00FF)],
                  ).createShader(bounds),
                  blendMode: BlendMode.srcIn,
                  child: const Text(
                    'MediVox',
                    style: TextStyle(
                      fontSize: 88,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -2,
                      shadows: [
                        Shadow(color: Colors.white, blurRadius: 20),
                        Shadow(color: Color(0xFF00FFFF), blurRadius: 40),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
              const Text(
                'Inteligencia Artificial Médica\nen la Palma de tu Mano',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600, color: Colors.white, height: 1.35),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    _button(Icons.apple, 'Entra con Apple', Colors.white, Colors.black),
                    const SizedBox(height: 16),
                    _button(null, 'Entra con Google', Colors.white, Colors.black,
                        customIcon: Image.asset('assets/google_logo.png', height: 26)),
                    const SizedBox(height: 16),
                    _button(Icons.email_outlined, 'Entra con Email', const Color(0xFF00D4FF), Colors.black),
                  ],
                ),
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(IconData? icon, String text, Color bg, Color fg, {Widget? customIcon}) {
    return SizedBox(
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customIcon ?? Icon(icon, size: 28),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

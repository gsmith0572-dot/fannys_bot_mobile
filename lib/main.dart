import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Fanny Bot', home: Scaffold(body: LoginScreen()));
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Supabase.instance.client.auth.signInWithOAuth(
              OAuthProvider.google,
              redirectTo: 'io.supabase.flutter://callback',
            ),
            child: const Text('Sign in with Google'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Supabase.instance.client.auth.signInWithOAuth(
              OAuthProvider.apple,
              redirectTo: 'io.supabase.flutter://callback',
            ),
            child: const Text('Sign in with Apple'),
          ),
          const SizedBox(height: 40),
          StreamBuilder<AuthState>(
            stream: Supabase.instance.client.auth.onAuthStateChange,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.session != null) {
                return const Text('LOGIN OK', style: TextStyle(color: Colors.green, fontSize: 32));
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

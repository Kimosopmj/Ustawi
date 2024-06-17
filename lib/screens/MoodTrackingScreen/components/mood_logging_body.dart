import 'package:flutter/material.dart';

class MoodLoggingBody extends StatelessWidget {
  const MoodLoggingBody({super.key});

  void _handleLogin(BuildContext context) {
    // Handle login logic here
    // For example, you can navigate to the home page
    Navigator.pushNamed(context, '/home');
  }

  void _handleForgotPassword(BuildContext context) {
    // Handle forgot password logic here
    // For example, you can navigate to the forgot password page
    Navigator.pushNamed(context, '/forgot_password');
  }

  void _handleSignUp(BuildContext context) {
    // Handle sign-up logic here
    // For example, you can navigate to the sign-up page
    Navigator.pushNamed(context, '/sign_up');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Code for Login screen body
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _handleLogin(context);
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  _handleForgotPassword(context);
                },
                child: const Text('Forgot Password?'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  _handleSignUp(context);
                },
                child: const Text('Sign Up'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Logging App',
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
              appBar: AppBar(title: Text('Login')),
              body: MoodLoggingBody(),
            ),
        '/home': (context) => Scaffold(
              appBar: AppBar(title: Text('Home')),
              body: Center(child: Text('Welcome to Home Page!')),
            ),
        '/forgot_password': (context) => Scaffold(
              appBar: AppBar(title: Text('Forgot Password')),
              body: Center(child: Text('Forgot Password Page')),
            ),
        '/sign_up': (context) => Scaffold(
              appBar: AppBar(title: Text('Sign Up')),
              body: Center(child: Text('Sign Up Page')),
            ),
      },
    );
  }
}


import 'package:flutter/material.dart';

class MoodLoggingBody extends StatelessWidget {
  const MoodLoggingBody({super.key});

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
            // Handle login button press
          },
          child: const Text('Login'),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            // Handle forgot password button press
          },
          child: const Text('Forgot Password?'),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            // Handle sign up button press
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
    
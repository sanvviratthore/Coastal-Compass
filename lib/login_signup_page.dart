import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login or Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Email TextField
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              
              // Password TextField
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              
              // Login Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement login logic
                  print('Login pressed');
                },
                child: Text('Login'),
              ),
              
              SizedBox(height: 16.0),
              
              // Google Sign-In Button
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement Google Sign-In logic
                  print('Google Sign-In pressed');
                },
                icon: Image.asset('assets/images/icon_google.png', height: 24.0), // Add your Google logo asset here
                label: Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
                ),
              ),
              
              SizedBox(height: 16.0),
              
              // Sign-Up Button
              TextButton(
                onPressed: () {
                  // TODO: Implement sign-up logic
                  print('Sign-Up pressed');
                },
                child: Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


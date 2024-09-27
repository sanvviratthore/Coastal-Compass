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
              
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),
              
              
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
                  
                  print('Login pressed');
                },
                child: Text('Login'),
              ),
              
              SizedBox(height: 16.0),
              
              // Google Sign-In Button
              ElevatedButton.icon(
                onPressed: () {
                  
                  print('Google Sign-In pressed');
                },
                icon: Image.asset('assets/images/icon_google.png', height: 24.0), 
                label: Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white, 
                ),
              ),
              
              SizedBox(height: 16.0),
              
              // Sign-Up Button
              TextButton(
                onPressed: () {
                  
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


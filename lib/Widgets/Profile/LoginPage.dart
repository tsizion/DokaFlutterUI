import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doka/providers/profilepage.dart';
import 'package:doka/theme/styles.dart';
import 'package:doka/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? _emailOrPhone;
  String? _password;
  bool _isPasswordVisible = false;

  late final FlutterSecureStorage _secureStorage;

  @override
  void initState() {
    super.initState();
    _secureStorage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  // Instance method for Android options
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> _login() async {
    final url = Uri.parse("https://dokabackend.onrender.com/api/v1/login");
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json', // Add Accept header
    };
    final body = jsonEncode({
      if (_emailOrPhone != null && _emailOrPhone!.contains('@'))
        'email': _emailOrPhone
      else
        'phoneNumber': _emailOrPhone,
      'password': _password,
    });

    // Debugging print statements
    print("Request URL: $url");
    print("Request headers: $headers");
    print("Request body: $body");

    try {
      final response = await http.post(url, headers: headers, body: body);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        await _secureStorage.write(
          key: 'token',
          value: responseData['token'],
        );

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', responseData['user']['_id']);
        await prefs.setString('username', responseData['user']['username']);
        await prefs.setString(
            'phoneNumber', responseData['user']['phoneNumber']);
        await prefs.setStringList(
            'address', List<String>.from(responseData['user']['address']));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Successfully logged in as ${responseData['user']['username']}')),
        );
        ref.read(authPageProvider.notifier).changePage(AuthPage.loggedInUser);
      } else {
        print("Failed to log in: ${response.statusCode} - ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to log in. Please check your credentials.')),
        );
      }
    } catch (error) {
      print("Error occurred during login: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: backgroundColor2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Doka', style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign In to Your Account',
                      style: displaySmallStyle?.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          label: 'Email or Phone',
                          isPassword: false,
                          onSaved: (value) => _emailOrPhone = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email or phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        _buildTextField(
                          label: 'Password',
                          isPassword: true,
                          onSaved: (value) => _password = value,
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!
                                    .save(); // Ensure fields are saved
                                _login();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 161, 82, 186),
                              padding: EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Sign In',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('or'),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromARGB(255, 161, 82, 186)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Sign In With Google',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: displaySmallStyle),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(authPageProvider.notifier)
                                    .changePage(AuthPage.signUp);
                              },
                              child: Text(
                                "Sign Up",
                                style: displaySmallStyle?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 161, 82, 186),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required bool isPassword,
    required FormFieldSetter<String?> onSaved,
    required FormFieldValidator<String?> validator,
  }) {
    return TextFormField(
      obscureText: isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        hintStyle: displaySmallStyle,
        filled: true,
        fillColor: Colors.white,
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Color.fromARGB(255, 161, 82, 186), width: 0.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(_isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}

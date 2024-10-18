import 'dart:io';

import 'package:doka/Widgets/Profile/LoginPage.dart';
import 'package:doka/providers/profilepage.dart';
import 'package:doka/theme/styles.dart';
import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends ConsumerStatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? _emailOrPhone;
  String? _password;
  String? _confirmPassword;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Text(
                  'Doka', // Your text logo
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Text('Create Your Account',
                      style: displaySmallStyle?.copyWith(
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 24),

                // Registration Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email or Phone Field
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

                      // Password Field
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
                      SizedBox(height: 16),

                      // Confirm Password Field
                      _buildTextField(
                        label: 'Confirm Password',
                        isPassword: true,
                        onSaved: (value) => _confirmPassword = value,
                        validator: (value) {
                          if (value != _password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),

                      // Signup Button
                      Container(
                        width: double.infinity, // Full width
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Handle successful registration here
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 161, 82, 186),
                            padding: EdgeInsets.symmetric(
                                vertical: 18), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      // OR Sign Up with Google
                      Text('or'),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity, // Full width
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.symmetric(
                                vertical: 18), // Button padding
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 161, 82, 186)),
                              borderRadius:
                                  BorderRadius.circular(10), // Border radius
                            ),
                          ),
                          child: Text(
                            'Sign Up With Google',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account",
                            style: displaySmallStyle,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(authPageProvider.notifier)
                                  .changePage(AuthPage.login);
                            },
                            child: Text(
                              "Login",
                              style: displaySmallStyle?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 161, 82, 186)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
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
      obscureText: isPassword
          ? (label == 'Password'
              ? !_isPasswordVisible
              : !_isConfirmPasswordVisible)
          : false,
      decoration: InputDecoration(
        hintStyle: displaySmallStyle,
        filled: true,
        fillColor: Colors.white,
        hintText: label, // Use hintText instead of labelText
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none, // No visible border by default
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.red, width: 1.5), // Red border on error
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Color.fromARGB(255, 161, 82, 186),
              width: 0.7), // Dark border on focus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none, // Default no border
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  label == 'Password'
                      ? (_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off)
                      : (_isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                ),
                onPressed: () {
                  setState(() {
                    if (label == 'Password') {
                      _isPasswordVisible = !_isPasswordVisible;
                    } else {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    }
                  });
                },
              )
            : null,
        contentPadding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 20), // Padding inside the field
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}

import 'package:doka/theme/styles.dart';
import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';

class NonRegisteredProfile extends StatefulWidget {
  @override
  _NonRegisteredProfileState createState() => _NonRegisteredProfileState();
}

class _NonRegisteredProfileState extends State<NonRegisteredProfile> {
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
                  alignment: Alignment.topLeft,
                  child: Text('Create Your Account',
                      style: displayMediumStyle?.copyWith(
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
                            backgroundColor: Colors.black,
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
                      Text('or sign up with'),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle Google sign up
                        },
                        icon: Icon(Icons.login),
                        label: Text('Sign Up with Google'),
                      ),
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
    return Container(
      height: 50, // Set a fixed height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 216, 216, 216)
                .withOpacity(0.2), // Shadow color
            offset: Offset(0, 4), // Horizontal and vertical offset
            blurRadius: 8, // Blur radius
            spreadRadius: 1, // Spread radius
          ),
        ],
        color: Colors.white, // Inside color
      ),
      child: TextFormField(
        obscureText: isPassword
            ? !(_isPasswordVisible || _isConfirmPasswordVisible)
            : false,
        decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none, // No border color
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPassword == true
                          ? (_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off)
                          : (_isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                    ),
                    onPressed: () {
                      setState(() {
                        if (isPassword) {
                          if (label == 'Password') {
                            _isPasswordVisible = !_isPasswordVisible;
                          } else {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          }
                        }
                      });
                    },
                  )
                : null,
            errorStyle: TextStyle(color: Colors.red),
            contentPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 20), // Padding inside the field
            labelStyle: displaySmallStyle // Label color
            ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}

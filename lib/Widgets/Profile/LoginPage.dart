import 'package:doka/theme/styles.dart';
import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _emailOrPhone;
  String? _password;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Ensure the scaffold is at the top level

        body: Container(
      decoration: BoxDecoration(
        color: backgroundColor2,
      ),
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
                  child: Text(
                    'Sign In to Your Account',
                    style: displaySmallStyle?.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 24),

                // Login Form
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
                      SizedBox(height: 24),

                      // Sign In Button
                      Container(
                        width: double.infinity, // Full width
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Handle successful login here
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 161, 82, 186),
                            padding: EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      // OR Sign In with Google
                      Text('or'),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity, // Full width
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 161, 82, 186)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Sign In With Google',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: displaySmallStyle,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Sign Up",
                            style: displaySmallStyle?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 161, 82, 186)),
                          )
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
    ));
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
            width: 0.7,
          ), // Dark border on focus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none, // Default no border
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
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

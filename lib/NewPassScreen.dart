import 'package:doctor_appointment/ForgetPassScreen.dart';
import 'package:doctor_appointment/LoginScreen.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset successfully"),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Logo
                  const AppLogo(size: 80, iconSize: 44),

                  const SizedBox(height: 12),

                  const Text(
                    "HealthPal",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1E2A3A),
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Create new password",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1E2A3A),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Your new password must be different form\npreviously used password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Password Field
                  _passwordField(
                    controller: passwordController,
                    hint: "Password",
                    obscure: obscurePassword,
                    toggle: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  // Confirm Password Field
                  _passwordField(
                    controller: confirmPasswordController,
                    hint: "Confirm Password",
                    obscure: obscureConfirmPassword,
                    toggle: () {
                      setState(() {
                        obscureConfirmPassword =
                        !obscureConfirmPassword;
                      });
                    },
                    isConfirm: true,
                  ),

                  const SizedBox(height: 28),

                  // Reset Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1E2A3A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      onPressed: _resetPassword,
                      child: const Text(
                        "Reset Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
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

  // 🔹 Password Input
  Widget _passwordField({
    required TextEditingController controller,
    required String hint,
    required bool obscure,
    required VoidCallback toggle,
    bool isConfirm = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hint is required";
        }
        if (!isConfirm && value.length < 6) {
          return "Password must be at least 6 characters";
        }
        if (isConfirm && value != passwordController.text) {
          return "Passwords do not match";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon:
        const Icon(Icons.lock_outline, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: toggle,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(color: Color(0xff1E2A3A)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

/// 🔹 App Logo Widget
class AppLogo extends StatelessWidget {
  final double size;
  final double iconSize;

  const AppLogo({
    super.key,
    this.size = 64,
    this.iconSize = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: const Color(0xff1E2A3A),
        borderRadius: BorderRadius.circular(size * 0.22),
      ),
      child: Icon(
        Icons.local_hospital_outlined,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'NewPassScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _sendCode() {
    // ✅ EMPTY + EMAIL VALIDATION CHECK
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const CreateNewPasswordScreen(),
        ),
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),

                /// Logo
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
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1E2A3A),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Enter your Email, we will send you a verification code.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 32),

                /// Email Field
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value.trim())) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Your Email",
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
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
                      borderSide: const BorderSide(
                        color: Color(0xff1E2A3A),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      const BorderSide(color: Colors.red),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                /// Send Code Button
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
                    onPressed: _sendCode,
                    child: const Text(
                      "Send Code",
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
    );
  }
}

/// 🔹 Global App Logo Widget
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

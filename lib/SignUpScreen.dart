import 'package:doctor_appointment/HomeScreen.dart';
import 'package:doctor_appointment/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'Firebase/FirestoreService.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedGender;
  bool _obscurePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      dobController.text =
      "${picked.day}/${picked.month}/${picked.year}";
    }
  }


  void _createAccount() async{
    if (_formKey.currentState!.validate()) {
      debugPrint("Name: ${nameController.text}");
      debugPrint("Nickname: ${passwordController.text}");
      debugPrint("Email: ${emailController.text}");
      debugPrint("DOB: ${dobController.text}");
      debugPrint("Gender: $selectedGender");

      String username = emailController.text.trim();
      String password = passwordController.text.trim();

      await FirestoreService().addUser(username, password);


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account Created Successfully")),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),

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

                  const SizedBox(height: 28),

                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1E2A3A),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "We are here to help you!",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  const SizedBox(height: 32),

                  _inputField(
                    hint: "Your Name",
                    icon: Icons.person_outline,
                    controller: nameController,
                  ),

                  const SizedBox(height: 16),

                 /* _inputField(
                    hint: "Password",
                    icon: Icons.lock,
                    controller: passwordController,
                  ),*/


              TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscurePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xff1E2A3A)),
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

            ),

                  const SizedBox(height: 16),

                  _inputField(
                    hint: "name@example.com",
                    icon: Icons.email_outlined,
                    controller: emailController,
                  ),

                  const SizedBox(height: 16),

                  _dateField(),

                  const SizedBox(height: 16),

                  _genderDropdown(),

                  const SizedBox(height: 24),

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
                      onPressed: _createAccount,
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("or", style: TextStyle(color: Colors.grey)),
                      ),
                      Expanded(child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _socialButton(
                    text: "Sign In with Google",
                    imagePath: "assets/images/google.png",
                  ),

                  _socialButton(
                    text: "Sign In with Facebook",
                    imagePath: "assets/images/facebook.png",
                  ),


                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do you have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Input Field
  Widget _inputField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) =>
      value == null || value.isEmpty ? '$hint is required' : null,
      decoration: _inputDecoration(hint, icon),
    );
  }

  // 🔹 Date of Birth
  Widget _dateField() {
    return TextFormField(
      controller: dobController,
      readOnly: true,
      onTap: _pickDate,
      validator: (value) =>
      value == null || value.isEmpty ? 'Date of Birth is required' : null,
      decoration: _inputDecoration("Date of Birth", Icons.calendar_today),
    );
  }

  // 🔹 Gender Dropdown
  Widget _genderDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      validator: (value) => value == null ? 'Gender is required' : null,
      decoration: _inputDecoration("Gender", Icons.keyboard_arrow_down),
      items: const [
        DropdownMenuItem(value: "Male", child: Text("Male")),
        DropdownMenuItem(value: "Female", child: Text("Female")),
        DropdownMenuItem(value: "Other", child: Text("Other")),
      ],
      onChanged: (value) {
        setState(() => selectedGender = value);
      },
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xff1E2A3A)),
      ),
    );
  }

  Widget _socialButton({
    required String text,
    required String imagePath,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 22,
              width: 22,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

// 🔹 Global Logo
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

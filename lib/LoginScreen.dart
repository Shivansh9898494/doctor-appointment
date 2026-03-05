import 'package:doctor_appointment/ForgetPassScreen.dart';
import 'package:doctor_appointment/HomeScreen.dart';
import 'package:doctor_appointment/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Firebase/FirestoreService.dart';
import 'Models/UserModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List<UserModel> users = [];

  @override
  void initState() {
    print("Helo Users Init State");
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    print("Helo Users Load users");
    users = await FirestoreService().fetchUsers();
    for (var u in users) {
      print("Users");
      print(u.username);
      print(u.password);
    }
    setState(() {});
  }

  Future<void> save(String key , String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  void loginUser() async {

    String email = emailController.text.trim();
    String pass = passwordController.text.trim();

    bool isUserFound = false;

    for (var user in users) {
      if (user.username == email && user.password == pass) {
        isUserFound = true;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("username", email);

        save("login", "true");
        save("username", user.username.toString());
        save("password", user.password.toString());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      }
    }

    if (!isUserFound) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid username or password")),
      );
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
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

                  const SizedBox(height: 32),

                  const Text(
                    "Hi, Welcome Back!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff1E2A3A),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Hope you're doing fine.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 32),

                  _inputField(
                    hint: "Your Email",
                    icon: Icons.email_outlined,
                    controller: emailController,
                  ),

                  const SizedBox(height: 16),

                  _inputField(
                    hint: "Password",
                    icon: Icons.lock_outline,
                    controller: passwordController,
                    isPassword: true,
                  ),

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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Login logic here
                          debugPrint("Email: ${emailController.text}");
                          debugPrint("Password: ${passwordController.text}");

                          if (_formKey.currentState!.validate()) {
                            loginUser();
                          }
                          //Navigation
                          /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) =>  HomeScreen()),
                          );*/
                        }
                      },
                      child: const Text(
                        "Sign In",
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


                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) =>  ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account yet? ",
                          style: TextStyle(color: Colors.grey)),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) =>  SignUpScreen()),
                          );
                        },
                        child: const Text(
                          "Sign up",
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

  // Input Field
  Widget _inputField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$hint is required';
        }
        return null;
      },
      decoration: InputDecoration(
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
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

// 🔹 Global App Logo Widget
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

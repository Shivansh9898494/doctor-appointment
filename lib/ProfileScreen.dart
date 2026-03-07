import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  String _selectedGender = '';
  String _imageUrl = '';

  final List<String> _genderOptions = ['Male', 'Female', 'Other', 'Prefer not to say'];

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? 'Michael Jordan';
      _nicknameController.text = prefs.getString('nickname') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _dobController.text = prefs.getString('dob') ?? '';
      _selectedGender = prefs.getString('gender') ?? '';
      _imageUrl = prefs.getString('image') ?? '';
    });
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text.trim());
    await prefs.setString('nickname', _nicknameController.text.trim());
    await prefs.setString('email', _emailController.text.trim());
    await prefs.setString('dob', _dobController.text.trim());
    await prefs.setString('gender', _selectedGender);
    if (_imageUrl.isNotEmpty) {
      await prefs.setString('image', _imageUrl);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile saved successfully!'),
          backgroundColor: Color(0xff1C2A3A),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pop(context);
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff1C2A3A),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _dobController.text =
        '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      });
    }
  }

  void _showGenderPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Select Gender',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              ..._genderOptions.map(
                    (g) => ListTile(
                  title: Text(g),
                  trailing: _selectedGender == g
                      ? const Icon(Icons.check, color: Color(0xff1C2A3A))
                      : null,
                  onTap: () {
                    setState(() => _selectedGender = g);
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  void _changeProfilePhoto() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Change Profile Photo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Take Photo'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Choose from Gallery'),
                onTap: () => Navigator.pop(context),
              ),
              if (_imageUrl.isNotEmpty)
                ListTile(
                  leading: const Icon(Icons.delete_outline, color: Colors.red),
                  title: const Text('Remove Photo', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    setState(() => _imageUrl = '');
                    Navigator.pop(context);
                  },
                ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),

              // Avatar
              GestureDetector(
                onTap: _changeProfilePhoto,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: const Color(0xffE8ECF4),
                      backgroundImage: _imageUrl.isNotEmpty
                          ? NetworkImage(_imageUrl)
                          : null,
                      child: _imageUrl.isEmpty
                          ? const Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xffC5CDD8),
                      )
                          : null,
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                        color: Color(0xff1C2A3A),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Full Name
              _buildTextField(
                controller: _nameController,
                hint: 'Full Name',
                validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Name is required' : null,
              ),
              const SizedBox(height: 14),

              // Nickname
              _buildTextField(
                controller: _nicknameController,
                hint: 'Nickname',
              ),
              const SizedBox(height: 14),

              // Email
              _buildTextField(
                controller: _emailController,
                hint: 'name@example.com',
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v != null && v.isNotEmpty) {
                    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(v)) return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Date of Birth
              GestureDetector(
                onTap: _pickDate,
                child: AbsorbPointer(
                  child: _buildTextField(
                    controller: _dobController,
                    hint: 'Date of Birth',
                    prefixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      size: 18,
                      color: Color(0xff9E9E9E),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Gender dropdown
              GestureDetector(
                onTap: _showGenderPicker,
                child: Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffE8ECF4), width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _selectedGender.isEmpty ? 'Gender' : _selectedGender,
                          style: TextStyle(
                            fontSize: 14,
                            color: _selectedGender.isEmpty
                                ? const Color(0xff9E9E9E)
                                : Colors.black87,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff9E9E9E),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 36),

              // Save Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1C2A3A),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    Widget? prefixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xff9E9E9E),
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff1C2A3A), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserProfile {
  final String name;
  final String phone;
  final String imageUrl;

  UserProfile({
    required this.name,
    required this.phone,
    required this.imageUrl,
  });
}


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Daniel Martinez";
  String phone = "+123 856479683";
  String image =
      "https://i.pravatar.cc/300"; // demo image

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name") ?? name;
      phone = prefs.getString("phone") ?? phone;
      image = prefs.getString("image") ?? image;
    });
  }

  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("phone", phone);
    await prefs.setString("image", image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(image),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xff1C2A3A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, color: Colors.white, size: 18),
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            phone,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),

          _menuItem(Icons.person_outline, "Edit Profile"),
          _menuItem(Icons.favorite_border, "Favorite"),
          _menuItem(Icons.notifications_none, "Notifications"),
          _menuItem(Icons.settings_outlined, "Settings"),
          _menuItem(Icons.help_outline, "Help and Support"),
          _menuItem(Icons.description_outlined, "Terms and Conditions"),
          _menuItem(Icons.logout, "Log Out", isLogout: true),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, {bool isLogout = false}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
          title: Text(
            title,
            style: TextStyle(
              color: isLogout ? Colors.red : Colors.black,
              fontSize: 15,
            ),
          ),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            if (title == "Log Out") {
              // clear persisted data if needed
            }
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}*/

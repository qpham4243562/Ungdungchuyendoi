import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitInput() {
    // Lấy giá trị nhập vào từ các TextField
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      // Nếu tất cả các trường đều có giá trị, hiển thị thông báo
      Navigator.pop(context); // Quay lại trang trước (HomeScreen)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Xin chào, $name!')),
      );
    } else {
      // Thông báo nếu một trong các trường không có giá trị
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nhập thông tin'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nhập thông tin của bạn:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Tên
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Email
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            // Mật khẩu
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Ẩn mật khẩu
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitInput,
              child: const Text('Gửi thông tin'),
            ),
          ],
        ),
      ),
    );
  }
}

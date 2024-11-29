import 'package:flutter/material.dart';
import 'temper_convert_screen.dart';
import 'unit_convert_screen.dart';
import 'ex_screen.dart';
import 'youtube_video_screen.dart';  // Import màn hình YouTube mới tạo

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng chuyển đổi'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TemperatureConverterScreen()),
                );
              },
              child: const Text('Chuyển đổi nhiệt độ'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UnitConverterScreen()),
                );
              },
              child: const Text('Chuyển đổi đơn vị đo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InputScreen()),
                );
              },
              child: const Text('Bài tập'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YouTubeVideoScreen(),
                  ),
                );
              },
              child: const Text('Xem Video YouTube'),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/img.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

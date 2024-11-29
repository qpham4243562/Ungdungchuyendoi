import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoScreen extends StatefulWidget {
  const YouTubeVideoScreen({super.key});

  @override
  _YouTubeVideoScreenState createState() => _YouTubeVideoScreenState();
}

class _YouTubeVideoScreenState extends State<YouTubeVideoScreen> {
  TextEditingController _urlController = TextEditingController();
  late YoutubePlayerController _youtubeController;
  bool _isVideoLoaded = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  // Hàm để xử lý videoId từ URL
  void _loadVideo() {
    String url = _urlController.text.trim();
    String? videoId = YoutubePlayer.convertUrlToId(url);

    if (videoId != null) {
      setState(() {
        _youtubeController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            disableDragSeek: true,
            hideThumbnail: false,
            loop: false,
          ),
        );
        _isVideoLoaded = true;
        _errorMessage = '';
      });
    } else {
      setState(() {
        _errorMessage = 'URL không hợp lệ. Vui lòng nhập URL YouTube đúng.';
        _isVideoLoaded = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _youtubeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xem Video YouTube'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Khung nhập URL YouTube
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Nhập URL YouTube',
                border: OutlineInputBorder(),
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
            ),
            const SizedBox(height: 20),
            // Nút Play Video
            ElevatedButton(
              onPressed: _loadVideo,
              child: const Text('Play Video'),
            ),
            const SizedBox(height: 20),
            // Hiển thị video nếu đã load thành công
            _isVideoLoaded
                ? YoutubePlayer(
              controller: _youtubeController,
              showVideoProgressIndicator: true,
              onReady: () {
                print("Player is ready");
              },
              onEnded: (metaData) {
                print("Video ended");
              },
            )
                : const SizedBox(), // Nếu không có video, không hiển thị gì cả
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../models/playlist_model.dart';
import '../../services/youtub_services.dart';
import '../../widgets/player_videos/video_player_widget.dart';
import '../../widgets/player_videos/video_tile.dart';

class PlayerVideosScreen extends StatefulWidget {
  final String playlistId;
  final String title;

  const PlayerVideosScreen({
    super.key,
    required this.playlistId,
    required this.title,
  });

  @override
  _PlayerVideosScreenState createState() => _PlayerVideosScreenState();
}

class _PlayerVideosScreenState extends State<PlayerVideosScreen> {
  final YoutubeService service = YoutubeService();
  String? selectedVideoId;
  YoutubePlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void playVideo(String videoId) {
    if (_controller == null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: true),
      );
    } else {
      _controller!.load(videoId);
    }
    setState(() {
      selectedVideoId = videoId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
      ),
      body: Column(
        children: [
          if (selectedVideoId != null && _controller != null)
            VideoPlayerWidget(controller: _controller!),
          Expanded(
            child: FutureBuilder<List<VideoItem>>(
              future: service.fetchVideos(widget.playlistId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                final videos = snapshot.data ?? [];

                return ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return VideoTile(
                      video: video,
                      onTap: () => playVideo(video.videoId),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

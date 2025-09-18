import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mister_app/utils/secrets.dart';
import '../models/playlist_model.dart';

class YoutubeService {
  final String apiKey = youtubApiKey;

  // جلب البلاي ليست مع عدد الفيديوهات
  Future<List<Playlist>> fetchAllPlaylists(String channelId) async {
    List<Playlist> allPlaylists = [];
    String? nextPageToken;

    do {
      final url =
          "https://www.googleapis.com/youtube/v3/playlists?part=snippet,contentDetails&channelId=$channelId&maxResults=50&key=$apiKey${nextPageToken != null ? "&pageToken=$nextPageToken" : ""}";
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        final List items = data['items'];
        allPlaylists.addAll(items.map((e) => Playlist.fromJson(e)).toList());

        nextPageToken = data['nextPageToken'];
      } else {
        throw Exception("Failed to load playlists");
      }
    } while (nextPageToken != null);

    return allPlaylists;
  }

  // جلب الفيديوهات من بلاي ليست معينة
  Future<List<VideoItem>> fetchVideos(String playlistId) async {
    List<VideoItem> allVideos = [];
    String? nextPageToken;

    do {
      final url =
          "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet,contentDetails&playlistId=$playlistId&maxResults=50&key=$apiKey${nextPageToken != null ? "&pageToken=$nextPageToken" : ""}";
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        final List items = data['items'] ?? [];
        allVideos.addAll(items.map((e) => VideoItem.fromJson(e)).toList());
        nextPageToken = data['nextPageToken'];
      } else {
        throw Exception("Failed to load videos: ${res.statusCode}");
      }
    } while (nextPageToken != null);

    return allVideos;
  }
}

class Playlist {
  final String id;
  final String title;
  final String thumbnail;
  final int itemCount; // 👈 أضفنا عدد الفيديوهات

  Playlist({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.itemCount,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      title: json['snippet']['title'],
      thumbnail: json['snippet']['thumbnails']['medium']['url'],
      itemCount: json['contentDetails'] != null
          ? json['contentDetails']['itemCount'] ?? 0
          : 0, // 👈 هنا بنجيب عدد الفيديوهات
    );
  }
}

class VideoItem {
  final String videoId;
  final String title;
  final String thumbnail;

  VideoItem({
    required this.videoId,
    required this.title,
    required this.thumbnail,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      videoId: json['snippet']['resourceId']['videoId'],
      title: json['snippet']['title'],
      thumbnail: json['snippet']['thumbnails']['medium']['url'],
    );
  }
}

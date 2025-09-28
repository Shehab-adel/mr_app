import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/models/playlist_model.dart';
import 'package:mister_app/services/youtub_services.dart';
import 'package:mister_app/utils/app_strings.dart';
import '../../widgets/playlists/playlist_card.dart';
import '../../widgets/common/custom_appbare.dart';

class PlaylistsScreen extends StatelessWidget {
  final String channelId = AppStrings.channelId;
  final YoutubeService service = YoutubeService();

  PlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbare(
        title: AppStrings.plylists,
      ),
      body: FutureBuilder<List<Playlist>>(
        future: service.fetchAllPlaylists(channelId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final playlists = snapshot.data ?? [];

          return GridView.builder(
            padding: EdgeInsets.all(12.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.75,
            ),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              return PlaylistCard(playlist: playlists[index]);
            },
          );
        },
      ),
    );
  }
}

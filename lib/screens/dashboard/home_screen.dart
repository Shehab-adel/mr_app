import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/dashboard/profile/profile_cubit.dart';
import 'package:mister_app/utils/token_storage.dart';
import '../../widgets/home/home_header.dart';
import '../../widgets/home/welcome_section.dart';
import '../../widgets/home/feature_grid.dart';
import '../../widgets/home/recent_videos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final token = await TokenStorage.getToken();
    if (token != null) {
      context.read<ProfileCubit>().fetchProfile(token);
      // print("$token");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            SizedBox(height: 20.h),
            const WelcomeSection(),
            SizedBox(height: 20.h),
            const FeatureGrid(),
            SizedBox(height: 20.h),
            // const RecentVideos(),
          ],
        ),
      ),
    );
  }
}

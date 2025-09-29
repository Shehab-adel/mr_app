import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mister_app/cubit/profile/profile_cubit.dart';
import 'package:mister_app/cubit/profile/profile_state.dart';
import 'package:mister_app/utils/token_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: TokenStorage.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Scaffold(
            body: Center(child: Text("لم يتم العثور على التوكن")),
          );
        }

        final token = snapshot.data!;

        return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileSuccess) {
              final user = state.user;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("الاسم: ${user.name}",
                        style: const TextStyle(fontSize: 18)),
                    Text("البريد: ${user.email}",
                        style: const TextStyle(fontSize: 16)),
                    Text("الدور: ${user.role}",
                        style: const TextStyle(fontSize: 16)),
                    Text("المرحلة: ${user.stage}",
                        style: const TextStyle(fontSize: 16)),
                    Text("الفصل: ${user.semester}",
                        style: const TextStyle(fontSize: 16)),
                    Text("المادة: ${user.subject}",
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return Center(child: Text("خطأ: ${state.message}"));
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

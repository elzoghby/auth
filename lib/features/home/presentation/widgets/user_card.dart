import 'package:auth/core/Theme/Local_colors.dart';
import 'package:auth/features/home/domain/entities/home_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/Theme/text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../providers/controllers_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserCard extends ConsumerWidget {
  final HomeUser user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context,ref) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                // Avatar
                CircleAvatar(backgroundColor: LocalColors.primary5,
                  radius: 36,
                  backgroundImage: NetworkImage(user.image ?? ''),
                ),
                const SizedBox(width: 16),

                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.firstName??''} ${user.lastName??''}",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.email ?? '',
                        style: TextThemes.subtitleNeutralRegular.copyWith(
                              color: LocalColors.neutral2,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "@${user.username??''}",
                        style: TextThemes.smailTileBlackRegular.copyWith(
                              color: LocalColors.neutral7,
                            ),
                      ),
                    ],
                  ),
                ),

                // Gender badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: user.gender?.toLowerCase() == "female"
                        ? LocalColors.orange3
                        : LocalColors.primary40,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    user.gender ?? '',
                    style: TextStyle(
                      color: user.gender?.toLowerCase() == "female"
                          ? LocalColors.primary40
                          : LocalColors.orange3,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),    SizedBox(height: 20.px,),   AppButton(
              width: double.infinity,
              height: 5.h,
              backColor: LocalColors.primary40,
              text: 'Logout',
              onPress: () => ref.read(homeControllerProvider).logout(context),)
          ],
        ),
      ),
    );
  }
}

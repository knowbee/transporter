import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intersperse/intersperse.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/enums/side_menu_links.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/values/assets/profile_assets.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/circle_avatar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(userRepository: context.read<UserRepository>())
        ..checkAuthState(),
      child: const DrawerView(),
    );
  }
}

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return ClipRRect(
            key: const Key('menuDrawer'),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(80),
              bottomRight: Radius.circular(80),
            ),
            child: Drawer(
              backgroundColor: AppColors.tWhite,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: Dimensions.marginBig,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.arrow_back_ios_new_sharp,
                                      color: Color(0xFF414141),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      Strings.of(context).header_back_label,
                                      style: Styles.regularLightBlackSubheading,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: Dimensions.marginBig,
                              ),
                              const CustomCircleAvatar(
                                imageWidth: 100,
                                imageHeight: 100,
                                borderColor: AppColors.tLightGreen,
                                fit: BoxFit.fill,
                                imagePath: ProfileAssets.avatar,
                              ),
                              const SizedBox(
                                height: Dimensions.marginDefault,
                              ),
                              Text(
                                state.user.name,
                                style: Styles.mediumBlackText,
                              ),
                              Text(
                                state.user.email,
                                style: Styles.regularGreyParagraph,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        ...intersperse(
                          _buildDivider(),
                          SideMenuLinks.values.map((e) {
                            return _buildDrawerItem(
                              icon: e.icon,
                              text: e.label,
                              onTap: () {
                                if (e.label == SideMenuLinks.logout.label) {
                                  context
                                      .read<AuthCubit>()
                                      .logOut(email: state.user.email);
                                }
                                Navigator.pop(context);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute<Material>(
                                    builder: (context) => e.content,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildDrawerItem({
    required Widget icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: Styles.regularBlackText,
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: AppColors.tSeparatorColor,
      height: 1,
      thickness: 1,
    );
  }
}

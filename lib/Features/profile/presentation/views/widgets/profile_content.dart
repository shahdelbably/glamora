// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/data/models/user_model.dart';
import 'package:store_powered_ai/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/manger/orders_cubit/orders_cubit.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/settings_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/helpcenter_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/myorders_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/privacy_policy.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/profile_view.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_divider.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_list_title.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/edit_userprofile_pic.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/editprofilebody.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/profile_name_container.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/user_profile_pic.dart';
import 'package:store_powered_ai/core/utils/asset_data.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class Profilecontent extends StatefulWidget {
  const Profilecontent({super.key});

  @override
  State<Profilecontent> createState() => _ProfilecontentState();
}

class _ProfilecontentState extends State<Profilecontent> {
  bool editUserPic = true;
  late String fName, lName, email, address, selectedGender;
  UserModel? user;
  File? avatarFile;

  @override
  void initState() {
    super.initState();

    final token = CacheHelper.getData(key: 'token');
    if (token == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginView(
              isOnboarding: false,
              returnScreen: ProfileView(),
            ),
          ),
        );
      });
    } else {
      context.read<AuthCubit>().getMe();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GetMeSuccess) {
          setState(() {
            user = state.user;
            fName = user!.firstName;
            lName = user!.lastName;
            email = user!.email;
            selectedGender = user!.gender;
            address = user!.addresses!.isNotEmpty
                ? user!.addresses![0]
                : "No Address yet";
            avatarFile =
                File(user!.avatarFile!.split(": ").last.replaceAll("'", ""));
          });
        } else if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Success!',
                message: 'Account Updated successfully!',
                contentType: ContentType.success,
              ),
            ),
          );
        } else if (state is UpdateProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Error!',
                message: state.errorMessage,
                contentType: ContentType.failure,
              ),
            ),
          );
        }
      },
      child: user == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ProfileNameContainer(
                      editUserPic: editUserPic,
                      fName: fName,
                      lName: lName,
                    ),
                    Positioned(
                      top: -60,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          editUserPic
                              ? UserProfilePic(
                                  avatarFile: avatarFile,
                                  avatarUrl: user?.avatarFile,
                                )
                              : EditUserprofilePic(
                                  avatarPathFromApi: avatarFile?.path,
                                ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: editUserPic
                        ? Column(
                            children: [
                              CustomListTile(
                                onTap: () {
                                  setState(() {
                                    editUserPic = false;
                                  });
                                },
                                image: isDark
                                    ? AssetsData.lighteditprofile
                                    : 'assets/images/iconamoon_profile-fill.png',
                                title: 'Edit Profile',
                              ),
                              const CustomDivider(),
                              CustomListTile(
                                onTap: () {
                                  context.read<OrdersCubit>().getOrders();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MyordersView(),
                                    ),
                                  );
                                },
                                image: isDark
                                    ? AssetsData.lightmyorders
                                    : 'assets/images/order.png',
                                title: 'My Orders',
                              ),
                              const CustomDivider(),
                              CustomListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsView(),
                                    ),
                                  );
                                },
                                image: isDark
                                    ? AssetsData.lightsetting
                                    : 'assets/images/settings.png',
                                title: 'Settings',
                              ),
                              const CustomDivider(),
                              CustomListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HelpCenterView(),
                                    ),
                                  );
                                },
                                image: isDark
                                    ? AssetsData.lighthelpcenter
                                    : 'assets/images/helpCenter.png',
                                title: 'Help Center',
                              ),
                              const CustomDivider(),
                              CustomListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PrivacyPolicy(),
                                    ),
                                  );
                                },
                                image: isDark
                                    ? AssetsData.lightprivacypolicy
                                    : 'assets/images/privacy.png',
                                title: 'Privacy Policy',
                              ),
                              const CustomDivider(),
                              CustomListTile(
                                onTap: () async {
                                  bool? confirmLogout = await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Confirm Logout"),
                                      content: const Text(
                                          "Are you sure you want to log out?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: const Text("Logout"),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (confirmLogout == true) {
                                    bool isRemoved =
                                        await CacheHelper.removeData(
                                            key: "token");
                                    if (!mounted) return;
                                    if (isRemoved) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, "/login", (route) => false);
                                    } else {
                                      log("Failed to remove token");
                                    }
                                  }
                                },
                                image: isDark
                                    ? AssetsData.lightlogout
                                    : 'assets/images/logout.png',
                                title: 'Logout',
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          )
                        : EditProfilebody(
                            selectedGender,
                            fName: fName,
                            lName: lName,
                            email: email,
                            address: address,
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}

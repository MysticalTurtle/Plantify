import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recog_plantify/core/config/preferences.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/presentation/cubits/login/auth_cubit.dart';
import 'package:recog_plantify/presentation/cubits/recognition/recognition_cubit.dart';
import 'package:recog_plantify/presentation/modules/home/widgets/verify_email.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recog_plantify/presentation/modules/preview/preview_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    User user = (context.read<AuthCubit>().state as Authenticated).user;
    XFile? image;
    // RecognitionCubit cubit = context.read<RecognitionCubit>();
    NavigatorState navigator = Navigator.of(context);

    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          children: [
            // VerifyEmail(onTap: /*context.read<SendEmailCubit>().*/ () {
            //   var prefs = SecureStoragePlantify();
            //   prefs.setPlantIdToken(
            //       "3IG8pt7WkS75KtlU81fN6sQV07cvqrhDMebn7fWEKTR3WDaf55");
            // }),
            RichText(
              text: TextSpan(
                text: "Bienvenido ",
                style: TextStyles.lastOnboardingBlack,
                children: [
                  TextSpan(
                    text: user.name,
                    style: TextStyles.lastOnboardingGreen,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              "¿Listo para aprender sobre tus plantas favoritas?\n",
              style: TextStyles.lastOnboardingBlack400,
            ),
            const Text(
              "Identifica y aprende",
              style: TextStyles.onboardingMainText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Image.asset("assets/images/home1.png"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/leaf_filled.png"),
                const SizedBox(width: 10),
                Image.asset("assets/images/leaf_empty.png"),
                const SizedBox(width: 10),
                Image.asset("assets/images/leaf_empty.png"),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            const Text(
              "Identifica tus plantas",
              style: TextStyles.onboardingDescription,
              textAlign: TextAlign.center,
            ),
            // const SizedBox(height: 10),
            // const Text("¡Comienza ya!", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _ImageSelector(
                    onTap: () async {
                      if (!await Permission.camera.request().isGranted) return;

                      
                      image = await ImagePicker().pickImage(source: ImageSource.camera);

                      String tempPath =  (await getTemporaryDirectory()).path;
                      print("path: $tempPath${image!.path}");

                      if (image == null) return;

                      navigator.push(MaterialPageRoute(builder: (context) => PreviewScreen(imagePath: image!.path)));

                    },
                    text: "Tomar una foto",
                    icon: Icons.camera_alt,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _ImageSelector(
                    onTap: () async {
                      image = await ImagePicker().pickImage(source: ImageSource.gallery);

                      if (image == null) return;


                      navigator.push(MaterialPageRoute(builder: (context) => PreviewScreen(imagePath: image!.path)));
                    },
                    text: "Sube una imagen",
                    icon: Icons.photo,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _ImageSelector extends StatelessWidget {
  const _ImageSelector(
      {required this.onTap, required this.text, required this.icon});

  final void Function()? onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.primaryBlack),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.darkGreen),
            ),
            const SizedBox(height: 10),
            Icon(
              icon,
              size: 45,
            ),
          ],
        ),
      ),
    );
  }
}

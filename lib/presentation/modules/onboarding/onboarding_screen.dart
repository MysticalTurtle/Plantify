import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/presentation/modules/onboarding/widgets/dots.dart';
import 'package:recog_plantify/presentation/modules/onboarding/widgets/info_onboarding.dart';
import 'package:recog_plantify/presentation/widgets/light_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int dots = 1;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        // controller.viewportFraction = 0.5;
        dots = controller.page!.toInt() + 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (dots == 3) {
      skip();
      return;
    }
    controller.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  void skip() {
    Navigator.pushReplacementNamed(context, "onboarding4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: const [
                  InfoOnboarding(
                    imagePath: "assets/images/onboarding1.png",
                    title: "Reconocimiento por IA",
                    description:
                        "Podrás identificar la información  de más de 50.000 plantas",
                  ),
                  InfoOnboarding(
                    imagePath: "assets/images/onboarding2.png",
                    title: "Opción de búsqueda individual",
                    description:
                        "Puedes buscar una planta de tu interés para obtener más información sobre ella.",
                  ),
                  InfoOnboarding(
                    imagePath: "assets/images/onboarding3.png",
                    title: "Observa el estado y cuidado de la planta",
                    description:
                        "Podrás conocer la salud de tus plantas. ¡Atento por si ves una alteración en tu planta favorita!",
                  ),
                ],
              ),
            ),
            // const Spacer(),
            Dots(currentIndex: dots),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LightButton(
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.darkGreen,
                    text: "Omitir",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "onboarding4");
                    },
                  ),
                  LightButton(
                    text: "Continuar",
                    onPressed: nextPage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

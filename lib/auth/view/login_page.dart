import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../controller/login_controller.dart';



/// Login Screen is Here
/// In Divided into two Parts

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF5F7FF), Color(0xFFF2ECFF)],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s80),
              child: Row(
                children: [

                  /// Left Content Call

                  const Expanded(child: _LeftContent()),

                  /// Right Content Call

                  Expanded(
                    child: _LoginCard(
                      onGoogleTap: () =>
                          controller.loginWithGoogle(GoRouter.of(context)),
                      onContinueTap: () =>
                          controller.continueWithEmail(GoRouter.of(context)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/// Left Content is Here

class _LeftContent extends StatelessWidget {
  const _LeftContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const Image(
          image: NetworkImage(
            "https://cdn.shopify.com/s/files/1/0734/7155/7942/files/AppDrop_Black_Logo.png",
          ),
          height: 40,
        ),
        const SizedBox(height: AppSpacing.s16),
        const Text("Build Amazing Apps\nwith AppBuilder",
            style: AppTextStyles.headingXL),
        const SizedBox(height: AppSpacing.s24),
        const Text("1000+ Brands & 100M+ Users Trust AppBuilder"),
        const SizedBox(height: 40),

        /// Brand placeholders
        Row(
          children: const [
            BrandText("boAt"),
            const SizedBox(width: 20),
            BrandText("mCaffeine"),
            const SizedBox(width: 20),
            BrandText("Mamaearth"),
            const SizedBox(width: 20),
            BrandText("Nykaa"),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            SvgPicture.asset("assets/icons/Link.svg"),
            SvgPicture.asset("assets/icons/Link-1.svg"),
            SvgPicture.asset("assets/icons/Link-2.svg"),
            SvgPicture.asset("assets/icons/Link-3.svg"),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

class BrandText extends StatelessWidget {
  final String text;
  const BrandText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black38,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}


/// Right Content is Here

class _LoginCard extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onContinueTap;

  const _LoginCard({
    required this.onGoogleTap,
    required this.onContinueTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        padding: const EdgeInsets.all(AppSpacing.s32),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black38,blurRadius: 25, offset: Offset(5, 10)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Welcome Back", style: AppTextStyles.heading),
            const SizedBox(height: AppSpacing.s8),
            const Text(
              "For secure access, please enter your details below.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body,
            ),
            const SizedBox(height: AppSpacing.s20),

            OutlinedButton.icon(
              onPressed: onGoogleTap,
              icon: SvgPicture.asset("assets/icons/google.svg", height: 20,fit: BoxFit.contain,),
              label: const Text("Sign in with Google",style: TextStyle(color: Colors.black54),),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(double.infinity, 55),
                side: const BorderSide(color: Colors.black12,),
              ),
            ),

            const SizedBox(height: AppSpacing.s20),
            Row(
              children: [
                const Expanded(
                  child: Divider(thickness: 1),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "or continue with email",
                    style: TextStyle(color: Colors.black54, fontSize: 10),
                  ),
                ),
                const Expanded(
                  child: Divider(thickness: 1),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.s20),


            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                prefixIcon: const Icon(Icons.email_outlined,color: Colors.black38,size: 20,),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.5,color: Colors.black54),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black54),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.s20),

            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton(
                onPressed: onContinueTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


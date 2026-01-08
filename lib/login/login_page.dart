import 'package:builder/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../auth/google_auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = GoogleAuthService();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF5F7FF),
              Color(0xFFF2ECFF),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Row(
            children: [
              /// LEFT CONTENT
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Image.network("https://cdn.shopify.com/s/files/1/0734/7155/7942/files/AppDrop_Black_Logo.png?v=1766657135",fit: BoxFit.contain,height: 40,),
                    const SizedBox(height: 15),
                    const Text(
                      "Build Amazing Apps\nwith AppBuilder",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "1000+ Brands & 100M+ Users Trust AppBuilder",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 40),

                    /// Brand placeholders
                    Row(
                      children: const [
                        BrandText("boAt"),
                        SizedBox(width: 20),
                        BrandText("mCaffeine"),
                        SizedBox(width: 20),
                        BrandText("Mamaearth"),
                        SizedBox(width: 20),
                        BrandText("Nykaa"),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/Link.svg"),
                        SvgPicture.asset("assets/icons/Link-1.svg"),
                        SvgPicture.asset("assets/icons/Link-2.svg"),
                        SvgPicture.asset("assets/icons/Link-3.svg"),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),

              /// RIGHT LOGIN CARD
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 380,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 25,
                          offset: const Offset(5, 10),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "For secure access, please enter your details below.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xcc000000),fontWeight: FontWeight.w500,fontSize: 12),
                        ),
                        const SizedBox(height: 30),

                        /// GOOGLE BUTTON
                        OutlinedButton.icon(
                          onPressed: ()  async {
                            final user = await authService.signInWithGoogle();

                            if (user != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DashboardLayout(
                                    name: user.displayName ?? "",
                                    email: user.email ?? "",
                                    photo: user.photoURL ?? "",
                                  ),
                                ),
                              );
                            }
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/google.svg",
                            height: 20,fit: BoxFit.contain,
                          ),
                          label: const Text("Sign in with Google",style: TextStyle(color: Colors.black54),),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            minimumSize: const Size(double.infinity, 55),
                            side: const BorderSide(color: Colors.black12,),
                          ),
                        ),

                        const SizedBox(height: 25),
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

                        const SizedBox(height: 25),

                        /// EMAIL FIELD
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

                        const SizedBox(height: 20),

                        /// CONTINUE BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DashboardLayout(
                                    name: "",
                                    email: "",
                                    photo: "",
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6A00),
                              //minimumSize: Size(double.infinity, 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// TERMS
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 10,
                              height: 1.8,
                              color: Colors.black54,
                            ),
                            children: [
                              TextSpan(text: "By signing up, you agree to our ",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500)),
                              TextSpan(
                                text: "Terms of Service",
                                style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),
                              ),
                              TextSpan(text: " and ",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500)),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),
                              ),
                              TextSpan(text: ".\nNeed help? ",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500)),
                              TextSpan(
                                text: "Get in touch.",
                                style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Brand text widget
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




enum AuthStep {
  email,
  password,
  otp,
  forgotPassword,
  forgotOtp,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthStep step = AuthStep.email;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;
  List<String> otp = List.filled(6, "");
  int otpTimer = 30;

  void goBack() {
    setState(() {
      if (step == AuthStep.password) step = AuthStep.email;
      else if (step == AuthStep.otp) step = AuthStep.password;
      else if (step == AuthStep.forgotPassword) step = AuthStep.password;
      else if (step == AuthStep.forgotOtp) step = AuthStep.forgotPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F5),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.08),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (step != AuthStep.email)
                  TextButton.icon(
                    onPressed: goBack,
                    icon: const Icon(Icons.arrow_back, size: 18),
                    label: const Text("Back"),
                  ),

                const SizedBox(height: 16),

                if (step == AuthStep.email) emailStep(),
                if (step == AuthStep.password) passwordStep(),
                if (step == AuthStep.otp) otpStep(),
                if (step == AuthStep.forgotPassword) forgotPasswordStep(),
                if (step == AuthStep.forgotOtp) forgotOtpStep(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- EMAIL STEP ----------------
  Widget emailStep() {
    return Column(
      children: [
        title("Welcome Back",
            "For secure access, please enter your details below."),

        const SizedBox(height: 24),

        googleButton(),

        const SizedBox(height: 24),
        divider(),

        const SizedBox(height: 24),

        textField(
          controller: emailController,
          hint: "example@email.com",
          icon: Icons.mail_outline,
        ),

        const SizedBox(height: 20),

        primaryButton("Continue", () {
          setState(() => step = AuthStep.password);
        }),

        legalText(),
      ],
    );
  }

  // ---------------- PASSWORD STEP ----------------
  Widget passwordStep() {
    return Column(
      children: [
        title("Enter Password", emailController.text),

        const SizedBox(height: 24),

        TextField(
          controller: passwordController,
          obscureText: !showPassword,
          decoration: InputDecoration(
            hintText: "Enter your password",
            suffixIcon: IconButton(
              icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() => showPassword = !showPassword);
              },
            ),
          ),
        ),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              setState(() => step = AuthStep.forgotPassword);
            },
            child: const Text("Forgot Password?"),
          ),
        ),

        primaryButton("Continue", () {
          setState(() => step = AuthStep.otp);
        }),

        legalText(),
      ],
    );
  }

  // ---------------- OTP STEP ----------------
  Widget otpStep() {
    return Column(
      children: [
        title("Verify Your Identity",
            "Enter the 6-digit code sent to ${emailController.text}"),

        const SizedBox(height: 20),

        otpBoxes(),

        const SizedBox(height: 16),

        Text(
          otpTimer > 0 ? "Resend code in 0:$otpTimer" : "Resend OTP",
          style: const TextStyle(fontSize: 14),
        ),

        legalText(),
      ],
    );
  }

  // ---------------- FORGOT PASSWORD ----------------
  Widget forgotPasswordStep() {
    return Column(
      children: [
        title("Password Assistance",
            "Enter your email to receive reset code"),

        const SizedBox(height: 24),

        textField(
          controller: emailController,
          hint: "example@email.com",
          icon: Icons.mail_outline,
        ),

        const SizedBox(height: 20),

        primaryButton("Send Reset Code", () {
          setState(() => step = AuthStep.forgotOtp);
        }),

        legalText(),
      ],
    );
  }

  // ---------------- FORGOT OTP ----------------
  Widget forgotOtpStep() {
    return otpStep();
  }

  // ---------------- COMMON WIDGETS ----------------
  Widget title(String title, String subtitle) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget googleButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png",
        height: 20,
      ),
      label: const Text("Sign in with Google"),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }

  Widget divider() {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("or continue with email"),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget textField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget primaryButton(String text, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF76B0A),
        ),
        child: Text(text),
      ),
    );
  }

  Widget otpBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (i) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 48,
          height: 48,
          child: TextField(
            maxLength: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(counterText: ""),
          ),
        );
      }),
    );
  }

  Widget legalText() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: const [
          Text(
            "By signing up, you agree to our Terms of Service and Privacy Policy.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            "Need help? Get in touch.",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/firebase/firebase_services.dart';
import 'package:trendy_app/core/utils/app_assets.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/utils/app_icons.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/core/utils/app_validators.dart';
import 'package:trendy_app/core/utils/dialogs/app_dialogs.dart';
import 'package:trendy_app/core/widgets/custom_elvated_button.dart';
import 'package:trendy_app/core/widgets/custom_text_button.dart';
import 'package:trendy_app/core/widgets/custom_text_form_field.dart';
import 'package:trendy_app/providers/get_user_data_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSecurePassword = true;

  final bool isSelceted = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    // final GetUserDataProvider getUserDataProvider = Provider.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(AppAssets.appLogo),
              SizedBox(height: 20.h),
              Text(appLocalizations.welcome_Back, style: textTheme.titleMedium),
              SizedBox(height: 20.h),
              Form(
                key: _formKey,
                child: Padding(
                  padding: REdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    spacing: 15.h,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        validator: (value) =>
                            AppValidators.validateEmail(value, context),
                        controller: _emailController,
                        hintText: appLocalizations.email,
                        prefixIcon: Image.asset(AppIcons.email),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      CustomTextFormField(
                        validator: (value) =>
                            AppValidators.validatePassword(value, context),
                        obscureText: isSecurePassword,
                        controller: _passwordController,
                        hintText: appLocalizations.password,
                        prefixIcon: Image.asset(AppIcons.lock),
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: onPasswordIconClicked,
                          icon: Icon(
                            isSecurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          textTheme: textTheme,
                          text: appLocalizations.forgot_password,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.fogetPassword,
                            );
                          },
                        ),
                      ),

                      CustomElvatedButton(
                        text: appLocalizations.login,
                        onPressed: login,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            appLocalizations.create_an_account,
                            style: textTheme.bodySmall,
                          ),
                          CustomTextButton(
                            textTheme: textTheme,
                            text: appLocalizations.register,
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.register,
                              );
                            },
                          ),
                        ],
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          appLocalizations.or_continue_with,
                          style: textTheme.bodySmall,
                        ),
                      ),

                      Image.asset(
                        AppIcons.google,
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPasswordIconClicked() {
    setState(() {
      isSecurePassword = !isSecurePassword;
    });
  }

  void login() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      AppDialogs.showLoadingDialog(context);
      UserCredential userCredential = await FirebaseServices.login(
        _emailController.text,
        _passwordController.text,
      );
      if (userCredential.user!.emailVerified) {
        AppDialogs.hideDialog(context);
        AppDialogs.showDialogMessgage('Login Successfully', Colors.green);
        Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
      } else {
        AppDialogs.hideDialog(context);
        AppDialogs.showDialogMessgage('Please Verify Your Email', Colors.green);
      }
    } on FirebaseAuthException {
      AppDialogs.hideDialog(context);
      AppDialogs.showDialogMessgage('Wrong Email Or Password', AppColors.red);
    } catch (ex) {
      AppDialogs.hideDialog(context);
      AppDialogs.showDialogMessgage('Failed To Login', AppColors.red);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';
import 'package:trendy_app/core/utils/app_icons.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/core/utils/app_validators.dart';
import 'package:trendy_app/core/widgets/custom_elvated_button.dart';
import 'package:trendy_app/core/widgets/custom_text_button.dart';
import 'package:trendy_app/core/widgets/custom_text_form_field.dart';

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(AppAssets.appLogo),
              SizedBox(height: 25.h),
              Text(appLocalizations.welcome_Back, style: textTheme.titleMedium),
              SizedBox(height: 25.h),
              Form(
                key: _formKey,
                child: Padding(
                  padding: REdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
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
                      SizedBox(height: 25.h),
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
                      SizedBox(height: 5.h),
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
                      SizedBox(height: 20.h),
                      CustomElvatedButton(
                        text: appLocalizations.login,
                        onPressed: () {
                          if (_formKey.currentState?.validate() == false)return;
                        },
                      ),
                      SizedBox(height: 10.h),
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
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          appLocalizations.or_continue_with,
                          style: textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(height: 15.h),
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
}

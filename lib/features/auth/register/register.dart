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

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isSecurePassword = true;
  bool isSecureRePassword = true;
  final bool isSelceted = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
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
              Text(
                appLocalizations.create_account,
                style: textTheme.titleMedium,
              ),
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
                            AppValidators.validateName(value, context),
                        controller: _nameController,
                        hintText: appLocalizations.name,
                        prefixIcon: Image.asset(AppIcons.person),
                        keyboardType: TextInputType.name,
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
                      SizedBox(height: 25.h),
                      CustomTextFormField(
                        validator: (value) =>
                            AppValidators.validateRePassword(value, context),
                        obscureText: isSecureRePassword,
                        controller: _rePasswordController,
                        hintText: appLocalizations.confirm_password,
                        prefixIcon: Image.asset(AppIcons.lock),
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: onRePasswordIconClicked,
                          icon: Icon(
                            isSecureRePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      CustomElvatedButton(
                        text: appLocalizations.create_account,
                        onPressed: () {
                          if (_formKey.currentState?.validate() == false)return;                  
                        },
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            appLocalizations.i_already_have_an_account,
                            style: textTheme.bodySmall,
                          ),
                          CustomTextButton(
                            textTheme: textTheme,
                            text: appLocalizations.login,
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.login,
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

  void onRePasswordIconClicked() {
    setState(() {
      isSecureRePassword = !isSecureRePassword;
    });
  }

  void onPasswordIconClicked() {
    setState(() {
      isSecurePassword = !isSecurePassword;
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:trendy_app/models/user_model.dart';

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
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
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
              SizedBox(height: 20.h),
              Text(
                appLocalizations.create_account,
                style: textTheme.titleMedium,
              ),
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
                            AppValidators.validateName(value, context),
                        controller: _nameController,
                        hintText: appLocalizations.name,
                        prefixIcon: Image.asset(AppIcons.person),
                        keyboardType: TextInputType.name,
                      ),
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
                            AppValidators.validatePhoneNumber(value, context),
                        controller: _phoneNumberController,
                        hintText: appLocalizations.phone_number,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: AppColors.black.withAlpha(120),
                        ),
                        keyboardType: TextInputType.name,
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
                            color: AppColors.black.withAlpha(120),
                          ),
                        ),
                      ),
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
                            color: AppColors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      CustomElvatedButton(
                        text: appLocalizations.create_account,
                        onPressed: createAccount,
                      ),
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

  void createAccount() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      AppDialogs.showLoadingDialog(context);
      UserCredential userCredential = await FirebaseServices.register(
        _emailController.text,
        _passwordController.text,
      );
      await FirebaseServices.addUserToFireStore(
        UserModel(
          name: _nameController.text,
          email: _emailController.text,
          phoneNumber: _phoneNumberController.text,
          id: userCredential.user!.uid,
        ),
      );
      AppDialogs.hideDialog(context);
      AppDialogs.showDialogMessgage(
        'Account Created Successfully',
        Colors.green,
      );
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } on FirebaseAuthException catch (ex) {
      AppDialogs.hideDialog(context);
      if (ex.code == 'email-already-in-use') {
        AppDialogs.showDialogMessgage('Email Is Already Use', AppColors.red);
      }
    } catch (ex) {
      AppDialogs.hideDialog(context);
      AppDialogs.showDialogMessgage('Failed To Register', AppColors.red);
    }
  }
}

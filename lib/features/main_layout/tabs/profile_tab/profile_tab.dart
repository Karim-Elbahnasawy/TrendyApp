import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/utils/app_constants.dart';
import 'package:trendy_app/core/utils/app_icons.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/core/widgets/custom_icon.dart';
import 'package:trendy_app/core/widgets/custom_text_form_field.dart';
import 'package:trendy_app/providers/language_provider.dart';
import 'package:trendy_app/providers/theme_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            spacing: 20.h,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            //  Text(
            //              appLocalizations.profile,
            //              style: Theme.of(context).textTheme.titleLarge,
            //            ),

          CircleAvatar(radius: 60,
          backgroundColor: AppColors.grey,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(64),
            child: Image.asset(AppAssets.avatar,fit: BoxFit.fill)),
          ),
                //  Container(
               
                //    width: 120,
                //    height: 120,
                //    decoration: BoxDecoration(
                //      borderRadius: BorderRadius.all(Radius.circular(16)),
                //      border: Border.all(color: AppColors.grey,width: 1.5),
                //      image: DecorationImage(image: AssetImage(AppAssets.shirt),fit: BoxFit.fill)
                //    ),
                  
                //  ),
                 CustomTextFormField(hintText: appLocalizations.name,prefixIcon: Icon(Icons.person),),
                 CustomTextFormField(hintText: appLocalizations.email,prefixIcon: Icon(Icons.email),),
                 CustomTextFormField(hintText: appLocalizations.phone,prefixIcon: Icon(Icons.phone),),
                
                 Row(
                   children: [
                     CustomElvatedButtonRow(appLocalizations: appLocalizations, text: appLocalizations.edit_profile, icon: Icons.edit_outlined, onPressed: () {  },),
                    SizedBox(width: 8.w),
                    CustomElvatedButtonRow(appLocalizations: appLocalizations, text: appLocalizations.logout, icon: Icons.logout, onPressed: () { 
                      FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(context, AppRoutes.login);

                     },),
                   ],
                 ),


              
          
            ],
          ),
        ),
      ),
    );
  }
}

class CustomElvatedButtonRow extends StatelessWidget {
  const CustomElvatedButtonRow({
    super.key,
    required this.appLocalizations, required this.text, required this.icon, required this.onPressed,
  });

  final AppLocalizations appLocalizations;
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(

        
       style: ElevatedButton.styleFrom(
        elevation: 5,
        
        
         backgroundColor: AppColors.pink,
         foregroundColor: AppColors.white,
         shape:RoundedRectangleBorder(
           borderRadius: BorderRadiusGeometry.circular(16.r)
         )
       ),
       onPressed: onPressed, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [
           Text(text,style: Theme.of(context).textTheme.displayMedium,),
          SizedBox(width: 10.w),
           Icon(icon,size: 25),
       ],
      ),),
    );
  }
}

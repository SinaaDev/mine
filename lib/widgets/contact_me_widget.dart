import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widgets/social_cards_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../viewModels/portfolio_view_model.dart';

class ContactMeWidget extends StatelessWidget {
  final GlobalKey contactMeSectionKey;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final websiteController = TextEditingController();
  final messageController = TextEditingController();

  ContactMeWidget({super.key, required this.contactMeSectionKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: (ResponsiveBreakpoints.of(context).isDesktop) ? 100 : 30,
          vertical: 40),
      child: Column(
        key: contactMeSectionKey,
        children: [
          (ResponsiveBreakpoints.of(context).isDesktop)
              ? Row(
                  children: [
                    Expanded(
                      child: getTextFields(context),
                    ),
                    const Gap(100),
                    Expanded(child: getLabel(context)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getLabel(context),
                    const Gap(20),
                    getTextFields(context)
                  ],
                )
        ],
      ),
    );
  }

  Widget getLabel(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "Let's ",
                style: Theme.of(context).textTheme.headlineLarge),
            TextSpan(
                text: "talk ", style: Theme.of(context).textTheme.labelLarge),
            TextSpan(
                text: "for\n",
                style: Theme.of(context).textTheme.headlineLarge),
            TextSpan(
                text: "Something special\n",
                style: Theme.of(context).textTheme.headlineLarge),
            const TextSpan(
              text: "\n",
            ),
            TextSpan(
                text:
                    "I seek to push the limits of creativity to create high-engaging, user-friendly, and beautiful mobile apps for the users\n",
                style: Theme.of(context).textTheme.labelSmall),
          ]),
        ),
        Wrap(
          children: [
            const Icon(
              Icons.email,
              size: 27,
            ),
            const Gap(20),
            Text(' alisina.haidari2004@gmail.com',
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const Gap(10),
        Wrap(
          children: [
            const Icon(
              Icons.phone,
              size: 27,
            ),
            const Gap(20),
            Text(' +93748890991 & +93728251552', style: Theme.of(context).textTheme.titleMedium)
          ],
        )
      ],
    );
  }

  Widget getTextFields(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          // name text field
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: AppStrings.nameFieldHintText,
              errorBorder: OutlineInputBorder(),
              focusedErrorBorder: OutlineInputBorder()
            ),
            validator: (value) {
              if(value!.isEmpty){
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const Gap(15),

          // email text field
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: AppStrings.emailFieldHintText,
                errorBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder()
            ),
            validator: (value) {
              if(value!.isEmpty){
                return 'Please enter your email';
              }
              if(!value.contains('@gmail.com')){
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const Gap(15),

          // website text field
          TextFormField(
            controller: websiteController,
            decoration: const InputDecoration(
              hintText: AppStrings.websiteFieldHintText,
            ),
          ),
          const Gap(15),

          // message text field
          TextFormField(
            controller: messageController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: AppStrings.messageFieldHintText,
                errorBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder()
            ),
            validator: (value) {
              if(value!.isEmpty){
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const Gap(15),

          // button and social cards
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        Map<String, dynamic> templateParams = {
                          'from_name': nameController.text,
                          'from_email': emailController.text,
                          'from_web': websiteController.text,
                          'message': messageController.text
                        };
                        context.read<PortfolioViewModel>().sendEmail(templateParams);
                      }
                    },
                    child: const Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          AppStrings.contactMeButtonText,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(flex: 3, child: SocialCardsWidget())
            ],
          ),
        ],
      ),
    );
  }
}

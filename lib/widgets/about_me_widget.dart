import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeWidget extends StatelessWidget {
  final GlobalKey aboutSectionKey;

  const AboutMeWidget({super.key, required this.aboutSectionKey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 980;
        return Column(
          key: aboutSectionKey,
          children: [
            Wrap(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "About ",
                        style: Theme.of(context).textTheme.headlineMedium),
                    TextSpan(
                        text: "Me ",
                        style: Theme.of(context).textTheme.headlineLarge),
                  ]),
                ),
              ],
            ),
            const Gap(100),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Gap(90),
                Flexible(
                  child: Text('Crafting your vision into reality',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                const Gap(90)
              ],
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Gap(90),
                Flexible(
                  child: Text(AppStrings.aboutMeText,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.black54)),
                ),
                const Gap(50)
              ],
            ),
            const Gap(60),
            (!ResponsiveBreakpoints.of(context).isDesktop)
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: aboutMe('Experience', AppStrings.experienceText, context),
                )
                : const SizedBox.shrink(),
            (!ResponsiveBreakpoints.of(context).isDesktop)
                ?const Gap(80)
            :const SizedBox.shrink(),
            Row(
              children: [
                const Gap(90),
                Flexible(
                    child: aboutMe('Education', AppStrings.educationText, context)),
                const Gap(24),
                (ResponsiveBreakpoints.of(context).isDesktop)
                    ? Flexible(child: aboutMe('Experience', AppStrings.experienceText, context))
                    : const SizedBox.shrink(),
                const Gap(40),
              ],
            ),
            const Gap(80),
            (isDesktop)
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                      rateText('2+ years', 'Professional experience', context),
                      rateText('5', 'Projects delivered', context),
                      rateText('99 %', 'Success on projects ', context),
                      rateText('10+', 'Satisfied clients ', context),
                                ],
                              ),
                ):
                Wrap(
                  children:[ Column(
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Gap(30),
                      rateText('2+ years', 'Professional experience', context),
                      rateText('5', 'Projects delivered', context),
                        const Gap(30),
                    ],),
                    const Gap(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Gap(30),
                      rateText('99 %', 'Success on projects ', context),
                      rateText('10+', 'Satisfied clients   ', context),
                        const Gap(30),
                    ],)
                  ],),]
                ),
          ],
        );
      },
    );
  }

  Widget rateText(String title, String body, BuildContext context) {
    return SizedBox(
      height: 100,
      width: 200,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 20,
                width: 1,
                color: Colors.black,
              ),
              const Gap(4),
              Container(
                height: 40,
                width: 1,
                color: Colors.black38,
              ),
            ],
          ),
          const Gap(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineLarge),
              const Gap(8),
              Text(body,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black54))
            ],
          ),
        ],
      ),
    );
  }

  Widget aboutMe(String title, String body, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        const Gap(12),
        Text(
          body,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}

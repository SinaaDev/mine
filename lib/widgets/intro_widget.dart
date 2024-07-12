import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/widgets/profile_picture_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../viewModels/portfolio_view_model.dart';

class IntroWidget extends StatelessWidget {
  final GlobalKey homeGlobalKey;
  const IntroWidget({super.key, required this.homeGlobalKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: homeGlobalKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (ResponsiveBreakpoints.of(context).isDesktop)
            ? const Gap(200)
            : const Gap(90),
        (!ResponsiveBreakpoints.of(context).isDesktop)
            ? const Center(
                child: ProfilePictureWidget(),
              )
            : const SizedBox.shrink(),
        Row(
          children: [
            (ResponsiveBreakpoints.of(context).isDesktop)
                ? const Gap(100)
                : const Gap(30),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromLeft(
                                duration: const Duration(seconds: 4)),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "Hello I'm ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                              TextSpan(
                                  text: "Alisina Haidari.\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              const TextSpan(text: "\n"),
                              TextSpan(
                                  text: "Mid-Senior ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                              TextSpan(
                                  text: "Flutter ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              TextSpan(
                                  text: "Developer\n",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              const TextSpan(text: "\n"),
                              TextSpan(
                                  text: "Based In ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium),
                              TextSpan(
                                  text: "Afghanistan.\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              const TextSpan(text: "\n"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  WidgetAnimator(
                    incomingEffect:
                        WidgetTransitionEffects.incomingSlideInFromLeft(
                            duration: const Duration(seconds: 4)),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final bool isDesktop = constraints.maxWidth > 768;
                        return SizedBox(
                          width: (isDesktop)
                              ? constraints.maxWidth * 0.6
                              : constraints.maxWidth * 0.92,
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  style: Theme.of(context).textTheme.labelSmall,
                                  text: AppStrings.introSummary,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(10),
                  WidgetAnimator(
                    incomingEffect:
                       WidgetTransitionEffects.incomingSlideInFromLeft(
                       duration: const Duration(seconds: 4)),
                    child: SizedBox(
                    width: 150,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<PortfolioViewModel>().downloadResume();
                      },
                      label: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Resume"),
                          Gap(5),
                          Icon(Icons.download_outlined)
                        ],
                      ),
                    ),
                  ),),
                  const Gap(30),

                ],
              ),
            ),
            (ResponsiveBreakpoints.of(context).isDesktop)
                ? const Flexible(child: ProfilePictureWidget())
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}

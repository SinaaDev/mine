import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NavbarWidget extends StatelessWidget {
  final Function(GlobalKey key) scrollToSection;
  final GlobalKey homeSectionKey;
  final GlobalKey skillSectionKey;
  final GlobalKey aboutSectionKey;
  final GlobalKey projectSectionKey;
  final GlobalKey contactMeSectionKey;

  const NavbarWidget({
    super.key,
    required this.scrollToSection,
    required this.skillSectionKey,
    required this.aboutSectionKey,
    required this.projectSectionKey,
    required this.contactMeSectionKey,
    required this.homeSectionKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                AppStrings.navBarTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Lottie.asset('assets/lotties/verified.json',width: 32,renderCache: RenderCache.drawingCommands)
            ],
          ),
          (ResponsiveBreakpoints.of(context).isDesktop)
              ? desktopRow()
              : const SizedBox.shrink(),
          (ResponsiveBreakpoints.of(context).isDesktop)
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 27,
                  )),
        ],
      ),
    );
  }

  Widget desktopRow() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            scrollToSection(homeSectionKey);
          },
          child: const Text(
            "Home",
          ),
        ),
        const Gap(30),
        TextButton(
          onPressed: () {
            scrollToSection(aboutSectionKey);
          },
          child: const Text(
            "About Me",
          ),
        ),
        const Gap(30),
        TextButton(
          onPressed: () {
            scrollToSection(skillSectionKey);
          },
          child: const Text("Skills"),
        ),
        const Gap(30),
        TextButton(
          onPressed: () {
            scrollToSection(projectSectionKey);
          },
          child: const Text(
            "Projects",
          ),
        ),
        const Gap(30),
        TextButton(
          onPressed: () {
            scrollToSection(contactMeSectionKey);
          },
          child: const Text(
            "Contact Me",
          ),
        ),
      ],
    );
  }
}

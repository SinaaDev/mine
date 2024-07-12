import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../viewModels/portfolio_view_model.dart';
import '../wrappers/svg_image_loader.dart';

class SkillsWidget extends StatelessWidget {
  final GlobalKey skillSectionKey;
   SkillsWidget({super.key, required this.skillSectionKey});


  List<String> librariesList = [
    'Material Design',
    'Cupertino Design',
    'Flutter Animations',
    'HTTP Networking',
    'Data Caching',
    'State Management',
    'Bloc',
    'Redux',
    'Provider',
    'Hive',
    'Dio',
    'Lottie Animations',
    'Shimmer effects',
    'lint',
    'get_it',
    'Deep link',
    'Firebase auth',
    'Firebase cloud',
    'Google fonts',
    'Flutter SVG',
    'Image Network Cache'
  ];

  List<String> knowledgeList = [
    'Software Development',
    'Clean Architecture',
    'Clean Code',
    'Dependency Injection',
    'Exception Handing',
    'Testing',
    'SOLID Principle',
    'Responsive Design',
    'MVVM Design Pattern',
    'Repository Design Pattern',
    'TDD',
    'Object-Oriented Programming',
    'procedural Programming',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              key: skillSectionKey,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "My ",
                        style: Theme.of(context).textTheme.headlineMedium),
                    TextSpan(
                        text: "Skills ",
                        style: Theme.of(context).textTheme.headlineLarge),
                  ]),
                ),
              ],
            ),
            // !ResponsiveBreakpoints.of(context).isDesktop ? mobileScrollingAnimation(context) : const SizedBox.shrink(),
            Row(
              children: [
                const Gap(20),
                Expanded(
                    flex: 2,
                    child: Consumer<PortfolioViewModel>(builder: (_,viewModel,__){
                      return FlutterCarousel.builder(itemCount: viewModel.skillData.length, itemBuilder: (context,index,pageViewIndex) =>Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgImageLoader(assetName: viewModel.skillData[index].skillIcons, fit: BoxFit.contain,width: (ResponsiveBreakpoints.of(context).isDesktop) ? MediaQuery.of(context).size.width * 0.024 : MediaQuery.of(context).size.width * 0.1,),
                            const Gap(10),
                            Text(viewModel.skillData[index].skillName,style: Theme.of(context).textTheme.titleSmall,),
                          ],
                        ),
                      ), options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.3,
                          autoPlay: true,
                          viewportFraction: 0.2,
                          initialPage: 3,
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayInterval: const Duration(milliseconds: 1600),
                          enlargeCenterPage: true,
                          pageSnapping: false,
                          enableInfiniteScroll: true,
                          floatingIndicator: false
                      ));
                    },)
                ),
                (ResponsiveBreakpoints.of(context).isDesktop) ? Expanded(child: mobileScrollingAnimation(context)) : const SizedBox.shrink(),
              ],
            ),


            (!ResponsiveBreakpoints.of(context).isDesktop)
                ?
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text('Tools and Libraries',style: Theme.of(context).textTheme.headlineMedium,),
            )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (ResponsiveBreakpoints.of(context).isDesktop) ? const Gap(90): const SizedBox.shrink(),
                (ResponsiveBreakpoints.of(context).isDesktop) ?
                Flexible(
                    child: Text('Tools and Libraries',style: Theme.of(context).textTheme.headlineMedium,)) : const SizedBox.shrink(),
                const Gap(100),
                Flexible(
                  flex: 2,
                    child: Wrap(children: librariesList.map((e) => item(e, context),).toList())),
                const Gap(90),
              ],
            ),

            const Gap(100),


            (!ResponsiveBreakpoints.of(context).isDesktop)
                ?
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text('Industry Knowledge',style: Theme.of(context).textTheme.headlineMedium,),
            )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (ResponsiveBreakpoints.of(context).isDesktop) ? const Gap(90): const SizedBox.shrink(),
                (ResponsiveBreakpoints.of(context).isDesktop) ?
                Flexible(child: Text('Industry Knowledge',style: Theme.of(context).textTheme.headlineMedium,)) : const SizedBox.shrink(),
                const Gap(100),
                Flexible(
                  flex: 2,
                    child: Wrap(children: knowledgeList.map((e) => item(e, context),).toList())),
                const Gap(90),
              ],
            ),

            const Gap(120)
          ],
        );
      },
    );
  }
  Widget mobileScrollingAnimation(BuildContext context){
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Lottie.asset("assets/lotties/mobile.json",fit: BoxFit.contain,renderCache: RenderCache.drawingCommands),
    );
  }
}

Widget item(String title,BuildContext context){
  return Container(
    margin: const EdgeInsets.only(left: 10,top: 10),
    padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(100)
    ),
    child: Text(title,style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.black87),),
  );
}
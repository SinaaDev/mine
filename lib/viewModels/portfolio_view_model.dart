import 'package:flutter/material.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart';
import 'dart:ui_web' as ui;
import '../models/project_data.dart';
import '../models/skill_data.dart';
import '../models/social_data.dart';
import 'package:emailjs/emailjs.dart' as emailjs;

class PortfolioViewModel extends ChangeNotifier {
  bool _isProjectViewLimited = true;
  List<SocialData> socialData = [
    SocialData(
        socialLink: "https://instagram.com/alisina.haidari_",
        iconPath: Assets.instagramIcon,
        color: Colors.white),
    SocialData(
        socialLink: "https://linkedin.com/in/alisina-haidari-85826027b",
        iconPath: Assets.linkedInIcon,
        color: Colors.white),
    SocialData(
        socialLink: "https://github.com/SinaaDev",
        iconPath: Assets.githubIcon,
        color: Colors.white),
    SocialData(
        socialLink: "https://x.com/AlisinaHaidari7",
        iconPath: Assets.twitterIcon,
        color: Colors.white),
  ];
  List<SkillData> skillData = [
    SkillData(skillName: "Flutter", skillIcons: Assets.flutterIcon),
    SkillData(skillName: "Dart", skillIcons: Assets.dartIcon),
    SkillData(skillName: "Firebase", skillIcons: Assets.firebaseIcon),
    SkillData(skillName: "Rest API", skillIcons: Assets.restApiIcon),
    SkillData(skillName: "Postman", skillIcons: Assets.postmanIcon),
    SkillData(skillName: "Java", skillIcons: Assets.javaIcon),
    SkillData(skillName: "C", skillIcons: Assets.c),
    SkillData(skillName: "Github", skillIcons: Assets.githubIcon),
    SkillData(skillName: "Git", skillIcons: Assets.gitIcon),
    SkillData(skillName: "MySQL", skillIcons: Assets.mysqlIcon),
    SkillData(skillName: "Figma", skillIcons: Assets.figmaIcon),
  ];

  List<ProjectData> projectData = [
    ProjectData(
        projectName: "Waste Swift",
        projectDescription:
            'WasteSwift is an innovative mobile application designed to revolutionize waste management in communities and cities. Our user-friendly platform empowers individuals, households, and businesses to manage their waste efficiently and sustainably.',
        projectLink: "https://github.com/SinaaDev",
        projectPicture: Assets.wasteSwiftAppPicture,
        projectTechStacks: [
          Assets.flutterIcon,
          Assets.dartIcon,
          Assets.restApiIcon,
          Assets.mongoDbIcon,
          Assets.postmanIcon
        ]),

    ProjectData(
        projectName: "Tasky",
        projectDescription:
            "Tasky is a powerful task management app designed to streamline your workflow and boost productivity. With an intuitive interface and robust online backend, Tasky helps you manage tasks efficiently, whether you're an individual, a team, or a large organization.",
        projectLink: "https://github.com/SinaaDev/tasky",
        projectPicture: Assets.taskAppPicture,
        projectTechStacks: [
          Assets.flutterIcon,
          Assets.dartIcon,
          Assets.restApiIcon,
        ]),

    ProjectData(
        projectName: "Weather App",
        projectDescription:
            "This WeatherApp is a modern, user-friendly mobile application designed to provide real-time weather updates and forecasts. Built using Flutter and adhering to clean architecture principles, WeatherApp ensures a robust, maintainable, and scalable codebase. The app leverages a reliable weather API to fetch and display accurate weather information for various locations worldwide.",
        projectLink: "https://github.com/SinaaDev/weather_app_clean_arctechture",
        projectPicture: Assets.weatherAppPicture,
        projectTechStacks: [
          Assets.flutterIcon,
          Assets.dartIcon,
          Assets.restApiIcon,
        ]),

    ProjectData(
        projectName: "CoinMarketCap",
        projectDescription:
            "CoinMarketCap is a powerful and intuitive mobile application designed for cryptocurrency enthusiasts and investors who need up-to-the-minute updates on the latest market trends. Whether you're a seasoned trader or just starting your crypto journey, CryptoTrack offers the tools you need to stay informed and make smart investment decisions.",
        projectLink: "https://github.com/SinaaDev/Crypto_Exchange",
        projectPicture: Assets.cryptoAppPicture,
        projectTechStacks: [
          Assets.flutterIcon,
          Assets.dartIcon,
          Assets.restApiIcon,
        ]),

    ProjectData(
        projectName: "VillaLux",
        projectDescription:
            "VillaLux is a premier villa booking app designed to offer you a seamless and sophisticated experience in finding and booking the perfect villa for your next vacation. With a modern and elegant interface, VillaLux caters to travelers seeking luxury, comfort, and convenience for their getaway.",
        projectLink: "https://github.com/SinaaDev/holiday_booking_app_ui",
        projectPicture: Assets.villaAppPicture,
        projectTechStacks: [
          Assets.flutterIcon,
          Assets.dartIcon,
        ]),

    ProjectData(
        projectName: "Nova",
        projectDescription:
            "A clone of NOVA Ai app using Flutter",
        projectLink: "https://github.com/SinaaDev/nova_ai_clone",
        projectPicture: Assets.novaAppPicture,
        projectTechStacks: [
          Assets.flutterIcon,
          Assets.dartIcon,
        ]),

    ProjectData(
        projectName: "QuizMaster",
        projectDescription:
            "QuizMaster is your go-to destination for all things trivia! With a diverse range of quiz categories and a powerful backend API, this app offers an engaging and educational experience for quiz enthusiasts of all levels.",
        projectLink: "https://github.com/SinaaDev/advanced_quizapp",
        projectPicture: Assets.quizAppPicture,
        projectTechStacks: [
          Assets.flutterIcon,
          Assets.dartIcon,
          Assets.restApiIcon
        ]),


  ];

  bool get isProjectViewLimited => _isProjectViewLimited;

  set setIsProjectViewLimited(bool value) {
    _isProjectViewLimited = value;
    notifyListeners();
  }

  void setSocialContainerColor(Color color, int index) {
    socialData[index].color = color;
    notifyListeners();
  }

  void downloadResume() {
    HTMLAnchorElement()
      ..href = ui.AssetManager().getAssetUrl(Assets.myResume)
      ..download = "Resume.pdf"
      ..click();
  }

  Future<void> launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  Future<void> sendEmail(dynamic templateParams)async {
        try {
      await emailjs.send(
        'service_9c71bnm',
        'template_hxykayi',
        templateParams,
        const emailjs.Options(
          publicKey: 'YoF5-d_iy04RkzBaj',
          privateKey: 'fgFqq6FONWplTwMahf8br',
        ),
      );
      print('SUCCESS!');
    } catch (error) {
      print('$error');
    }
  }

}

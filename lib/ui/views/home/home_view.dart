import 'package:flutter/material.dart';
import 'package:portfolio/ui/views/home/sections/footer_section.dart';
import 'package:portfolio/ui/views/home/sections/header_section.dart';
import 'package:portfolio/ui/views/home/sections/skills_section.dart';
import 'package:portfolio/ui/views/home/sections/testimony_section.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:portfolio/ui/common/ui_helpers.dart';
import 'sections/about_section.dart';
import 'sections/projects_section.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final projectsKey = GlobalKey();
  final homeKey = GlobalKey();
  final testimonyKey = GlobalKey();
  final skillsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double arcShape = getResponsiveSize(context) / 30;

    double imageHeight =
        (screenWidth(context) < 800 ? screenWidth(context) : 350) / 2;
    double imageHeightOtherProjects =
        (screenWidth(context) < 300 ? screenWidth(context) : 300) / 2;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) => Column(
            children: [
              /// This is the header section
              HeaderSection(
                homeKey: homeKey,
                projectsKey: projectsKey,
                skillsKey: skillsKey,
                testimonyKey: testimonyKey,
                contactKey: contactKey,
              ),
              Expanded(
                child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        /// This is the about section
                        AboutSection(
                          homeKey: homeKey,
                          arcShape: arcShape,
                          screenwidth: sizingInformation.screenSize.width,
                        ),
                        verticalSpaceLarge,

                        /// This is the project section
                        ProjectsSection(
                          projectsKey: projectsKey,
                          imageHeight: imageHeight,
                          imageHeightOtherProjects: imageHeightOtherProjects,
                        ),
                        verticalSpaceLarge,

                        /// This is the experience section
                        SkillsAndExperienceSection(
                          skillsKey: skillsKey,
                          screeenWidth: sizingInformation.screenSize.width,
                        ),
                        verticalSpaceLarge,

                        /// This is the testimony section
                        TestimonySection(serviceKey: testimonyKey),
                        verticalSpaceMassive,

                        /// This is the footer section
                        FooterSection(
                          contactKey: contactKey,
                        ),

                        verticalSpaceMedium,
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

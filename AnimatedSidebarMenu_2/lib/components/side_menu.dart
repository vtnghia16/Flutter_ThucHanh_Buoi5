// ignore_for_file: use_key_in_widget_constructors

import 'package:untitled/models/rive_asset.dart';
import 'package:untitled/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'info_card.dart';
import 'side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black, // Màu nền đen
        child: Column(
          children: [
          const InfoCard(
          name: "Abu Anwar",
          profession: "Pro Player Valorant",
        ),
        Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Browse".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            ...sideMenus.map(
            (menu) => SideMenuTile(
        menu: menu,
        riveonInit: (artboard) {
          StateMachineController controller =
          RiveUtils.getRiveController(artboard,
              stateMachineName: menu.stateMachineName);
          menu.input = controller.findSMI("active") as SMIBool;
        },
        press: () {
          menu.input!.change(true);
          Future.delayed(const Duration(seconds: 1), () {
            menu.input!.change(false);
          });
          setState(() {
            selectedMenu = menu;
          });
        },
        isActive: selectedMenu == menu,
      ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
    child: Text(
    "History".toUpperCase(),
    style: Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: Colors.white70),
    ),
    ),
    ...sideMenu2.map(
    (menu) => SideMenuTile(
    menu: menu,riveonInit: (artboard) {
      StateMachineController controller =
      RiveUtils.getRiveController(artboard,
          stateMachineName: menu.stateMachineName);
      menu.input = controller.findSMI("active") as SMIBool;
    },
      press: () {
        menu.input!.change(true);
        Future.delayed(const Duration(seconds: 1), () {
          menu.input!.change(false);
        });
        setState(() {
          selectedMenu = menu;
        });
      },
      isActive: selectedMenu == menu,
    ),
    ),
                  ],
              ),
            ),
        ),
          ],
        ),
      ),
    );
  }
}
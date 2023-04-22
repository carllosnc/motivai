import 'package:flutter/material.dart';

import '/domain/domain.dart';
import '/core/core.dart';

import './components/bottom_sheet_component.dart';
import 'components/card_list_component.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Folder>(
      valueListenable: HomeController.instance.category,
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ProjectColors.main,
            title: Text('Motivai  •  ${value.name.capitalize()}'),
          ),
          body: Container(
            color: ProjectColors.main,
            child: CardListComponent(path: value.path),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ButtonSheetComponent();
                },
              );
            },
            backgroundColor: Colors.white,
            label: const Text(
              'CATEGORIAS',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: ProjectColors.font,
              ),
            ),
          ),
        );
      },
    );
  }
}

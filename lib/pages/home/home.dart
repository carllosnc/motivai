import 'package:flutter/material.dart';
import 'components/bottom-sheet.component.dart';
import 'components/card-list.component.dart';
import '../../domain/entities/folder.dart';
import '../../core/utils/colors.dart';
import 'home_controller.dart';
import '../../core/extensions/string.extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<FolderModel>(
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

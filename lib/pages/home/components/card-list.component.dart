import 'package:flutter/material.dart';
import '../../../domain/entities/image.dart';
import './card.component.dart';
import '../../../data/repositories/images.repository.dart';

class CardListComponent extends StatefulWidget {
  final String path;

  const CardListComponent({required this.path, super.key});

  @override
  State<CardListComponent> createState() => _CardListComponentState();
}

class _CardListComponentState extends State<CardListComponent> {
  final ScrollController _controller = ScrollController();
  final ImagesRepository imagesRepository = ImagesRepository();

  scrollUp() {
    if (_controller.hasClients) {
      _controller.animateTo(0,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  Widget showCards(
      AsyncSnapshot<List<ImageModel>> snapshot, BuildContext context) {
    List<Widget> cards = [];

    // has data
    if (snapshot.hasData) {
      var images = snapshot.data;

      images!.shuffle();

      for (var item in images) {
        cards.add(
          Align(
            alignment: Alignment.center,
            child: AppCard(image: item.secureUrl),
          ),
        );
      }

      return ListView(
        controller: _controller,
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 76),
        children: cards,
      );
    }

    if (snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.error, color: Colors.white, size: 60),
            SizedBox(height: 10),
            Text(
              'Ooops, o carregamento falhou!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    // loading
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  // render widget
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
      future: imagesRepository.getImages(
        path: widget.path,
      ),
      builder: (context, snapshot) {
        scrollUp();
        return showCards(
          snapshot,
          context,
        );
      },
    );
  }
}

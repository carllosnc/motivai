import 'package:flutter/material.dart';
import '../models/image.dart';
import '../services/cloudinary.dart';
import 'app_card.dart';

class CardList extends StatefulWidget {
  final String path;

  const CardList({
    required this.path,
    super.key
  });

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {

  final ScrollController _controller = ScrollController();

  scrollUp(){
    if(_controller.hasClients){
      _controller.animateTo(
        0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeIn
      );
    }
  }

  Future<List<ImageModel>> fetchImages() async{
    var cloudinary = Cloudinary();

    scrollUp();

    var res = await cloudinary.getImages(path: widget.path);

    List<ImageModel> images = (res.data['resources'] as List).map((item) => ImageModel.fromJson(item)).toList();

    return images;
  }

  Widget showCards(AsyncSnapshot<List<ImageModel>> snapshot, BuildContext context){
    List<Widget> cards = [];

    // has data
    if(snapshot.hasData) {
      var images = snapshot.data;
      images!.shuffle();

      for(var item in images){
        cards.add(
          Align(
            alignment: Alignment.center,
            child: AppCard(image: item.secureUrl)
          )
        );
      }

      return ListView(
        controller: _controller,
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 76),
        children: cards,
      );
    }

    // has some error
    if(snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.error, color: Colors.white, size: 60),
            SizedBox(height: 10),
            Text('Ooops, o carregamento falhou!', style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700
              )
            ),
          ],
        )
      );
    }

    // loading
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(child: CircularProgressIndicator(
        color: Colors.white
      ))
    );
  }

  // render widget
  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<ImageModel>>(
      future: fetchImages(),
      builder: (context, snapshot){
        return showCards(snapshot, context);
      },
    );
  }

}

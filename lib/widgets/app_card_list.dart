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

  Future<List<ImageModel>> fetchImages() async{
    var cloudinary = Cloudinary();

    var res = await cloudinary.getImages(path: widget.path);

    List<ImageModel> images = (res.data['resources'] as List).map((item) => ImageModel.fromJson(item)).toList();

    return images;
  }

  Widget showCards(AsyncSnapshot<List<ImageModel>> snapshot, BuildContext context){
    List<Widget> cards = [];

    if(snapshot.hasData) {
      var images = snapshot.data;
      images!.shuffle();

      for(var item in images){
        cards.add(AppCard(image: item.secureUrl));
      }

      return ListView(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 76),
        children: cards,
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(child: CircularProgressIndicator(
        color: Colors.white
      ))
    );
  }

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

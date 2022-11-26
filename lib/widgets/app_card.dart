import 'package:flutter/material.dart';
import 'package:motivai/utils/colors.dart';
import 'package:transparent_image/transparent_image.dart';

class AppCard extends StatelessWidget {
  final String image;

  const AppCard({
    this.image = '',
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [

            SizedBox(
              child: FadeInImage.memoryNetwork(
                fadeInDuration: const Duration(milliseconds: 100),
                placeholder: kTransparentImage,
                image: image,
                width: 1000,
                fit: BoxFit.fitHeight
              ),
            ),

            const SizedBox(height: 5),

            MaterialButton(
              minWidth: double.infinity,
              height: 50,
              color: ProjectColors.main,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              onPressed: (){},
              child: const Text(
                'Compartilhar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                )
              )
            )
          ],
        ),
      )
    );

  }
}

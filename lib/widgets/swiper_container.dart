import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:taller/models/photos.dart';

class SwiperContainer extends StatelessWidget {
  const SwiperContainer({super.key, required this.photos});

  final List<Photos> photos;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    if(photos.isEmpty){
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator()
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: photos.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.77,
        itemHeight: size.height * 0.42,
        itemBuilder: (context, index) {

          final photo=photos[index];
          
          print("${photo.url}.jpg");
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: photo),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage("${photo.url}.jpg"),
                fit: BoxFit.fill
              ),
            ),
          );
        },
      )
    );
  }
}
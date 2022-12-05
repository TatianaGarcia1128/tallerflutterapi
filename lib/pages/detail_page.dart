import 'package:flutter/material.dart';
import 'package:taller/models/models.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
   final Photos photo=ModalRoute.of(context)?.settings.arguments as Photos;

    return Scaffold( 
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(photo: photo),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(photo: photo),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),

            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  
  const _CustomAppBar({super.key, required this.photo});
  final Photos photo;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(      
      backgroundColor: const Color.fromARGB(255, 58, 61, 78),
      expandedHeight: 200,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(
            photo.title,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage("${photo.url}.jpg"),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key, required this.photo});
  final Photos photo;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme=Theme.of(context).textTheme;
    final size=MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage("${photo.url}.jpg"),
              height: 150,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width -170),
                child: Text(photo.title, style: textTheme.headline6, overflow: TextOverflow.ellipsis, maxLines: 6),
              ),
              Text(photo.albumId.toString(), style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
              Row(children: [
                const Icon(Icons.photo_album_outlined, size: 15, color: Colors.deepPurple), 
                const SizedBox(width: 5),
                Text(photo.id.toString(), style: textTheme.caption)
              ])
            ])
        ]
      ),
    );
  }
} 

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: const Text("Nostrud cupidatat irure nulla fugiat commodo voluptate reprehenderit nostrud. Voluptate ad est velit Lorem cupidatat sit eiusmod voluptate aute. Sint anim irure culpa sint deserunt officia labore non incididunt in veniam non excepteur proident. Laboris cupidatat magna ullamco consequat laborum incididunt minim consectetur exercitation in eu officia.", textAlign: TextAlign.justify
      ),
    );
  }
}
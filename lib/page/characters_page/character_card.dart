import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.data});

  final Character data;

  @override
  Widget build(BuildContext context) {
    final themeData = CupertinoTheme.of(context);
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: themeData.barBackgroundColor,
        child: DefaultTextStyle(
          style: const TextStyle(),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(
                  data.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CupertinoListTile(
                        title: Text(
                          data.name,
                          textAlign: TextAlign.start,
                          style: themeData.textTheme.textStyle.copyWith(
                              fontSize:
                                  themeData.textTheme.textStyle.fontSize! * 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${data.status} - ${data.species}',
                            style: themeData.textTheme.textStyle),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Flexible(
                      child: CupertinoListTile(
                        title:
                        Text('Last known location:'),
                        subtitle: Text(data.location.name),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Flexible(
                          child: CupertinoListTile(
                            title: Text('First seen in:'),
                            subtitle: Text(data.episode.first),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

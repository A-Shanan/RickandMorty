import 'package:bloc_training/constants/my_colors.dart';
import 'package:bloc_training/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(
            color: MyColors.myYellow,
          ),
        ),
        background: Hero(
            tag: character.id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2.3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo(
                        "Species: ",
                        character.species,
                      ),
                      buildDivider(248),
                      characterInfo(
                        "Status: ",
                        character.statusIfDeadOrAlive,
                      ),
                      buildDivider(258),
                      characterInfo(
                        "Gender: ",
                        character.gender,
                      ),
                      buildDivider(253.5),
                      characterInfo(
                        "Origin: ",
                        character.originName,
                      ),
                      buildDivider(265),
                      characterInfo(
                        "Location: ",
                        character.locationName,
                      ),
                      buildDivider(241),
                      characterInfo(
                        "Episods: ",
                        character.episode.length.toString(),
                      ),
                      buildDivider(241),
                      characterInfo(
                        "Type: ",
                        character.type.isNotEmpty ? character.type : "Unknown",
                      ),
                      buildDivider(241),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 350,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

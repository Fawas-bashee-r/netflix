import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/presantation/search/widgets/search_result.dart';
import 'package:netflix/presantation/search/widgets/title.dart';

import '../../../core/constant.dart';

//const imageUrl =
//  "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/1inZm0xxXrpRfN0LxwE2TXzyLN6.jpg";

class SearchIdle extends StatelessWidget {
  SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "Top Searches",
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(
                child: Text("Error Occured"),
              );
            } else if (state.idleList.isEmpty) {
              return Center(
                child: Text("List is empty"),
              );
            }
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItem(
                      title: movie.title ?? "No title provided",
                      imageUrl: "$imageUrls${movie.posterPath}",
                    );
                  }),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: state.idleList.length),
            );
          },
        ),
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItem({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 80,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          )),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(title,
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w600)),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 17,
            child: Icon(
              CupertinoIcons.play_fill,
              size: 17,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movioo/logic/cubit/app_cubit.dart';
import 'package:movioo/logic/cubit/app_state.dart';
import 'package:movioo/logic/network/end_point.dart';
import 'package:movioo/model/movie_model.dart';
import 'package:movioo/shared/colors.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    Key? key,
    required this.image,
    required this.id,
  }) : super(key: key);
  List<String> cato = ["Crime", "Action", "Thriller"];
  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getmovie(id),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);

            return Scaffold(
              backgroundColor: maincolor,
              body: state is GetMovieSuccessState
                  ? SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 450,
                                  width: double.infinity,
                                  child: Image(
                                    image: NetworkImage(
                                        IMAGE + cubit.detailModel!.posterPath!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: 450,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Colors.transparent, maincolor],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(cubit.detailModel!.originalTitle!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Wrap(
                                          direction: Axis.horizontal,
                                          runSpacing: 10,
                                          spacing: 8,
                                          children: List.generate(
                                              cubit.detailModel!.genres!.length,
                                              (index) => Container(
                                                  height: 22,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.grey
                                                          .withOpacity(0.2)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Center(
                                                        child: Text(
                                                            cubit
                                                                .detailModel!
                                                                .genres![index]
                                                                .name!,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .fade)),
                                                  ))),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(cubit.detailModel!.releaseDate!,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                      ]),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.all(50),
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                          child: Icon(Icons.arrow_back))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      (cubit.detailModel!.voteAverage! / 2)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.amber),
                                        ),
                                        onPressed: () {},
                                        child: Text("Watch Now")),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Overview",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(cubit.detailModel!.overview!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Production companies",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    child: ListView.separated(
                                      itemCount: cubit.detailModel!
                                          .productionCompanies!.length,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: 5,
                                        );
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return cubit
                                                    .detailModel!
                                                    .productionCompanies![index]
                                                    .logoPath! !=
                                                ""
                                            ? Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(IMAGE +
                                                            cubit
                                                                .detailModel!
                                                                .productionCompanies![
                                                                    index]
                                                                .logoPath!),
                                                        fit: BoxFit.contain)))
                                            : Container();
                                      },
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ]),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: Colors.amber,
                    )),
            );
          }),
    );
  }
}

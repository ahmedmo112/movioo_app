import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movioo/logic/cubit/app_cubit.dart';
import 'package:movioo/logic/cubit/app_state.dart';
import 'package:movioo/module/HomeScreen/shimmer_screen.dart';
import 'package:movioo/module/SearchScreen/search_screen.dart';
import 'package:movioo/shared/colors.dart';
import 'package:movioo/shared/component.dart';
import 'package:movioo/shared/my_component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  bool test = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getMovieData(),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var data = AppCubit.get(context);
            return Scaffold(
                backgroundColor: maincolor,
                body: state is! GetUpcomingMovieLoadingState
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Welcome Back,\nAhmed",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  InkWell(
                                    onTap: () {
                                      navigateTo(context, SearchScreen());
                                    },
                                    child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.35),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                            child: Icon(Icons.search))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              HomeSliderWidget(
                                images: data.slider!,
                                text: data.text!,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text("Popular movie",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(
                                height: 20,
                              ),
                              SectionWidget(
                                  moviedate: data.popularMovieList!,
                                  data: data),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Top Rated",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 20,
                              ),
                              SectionWidget(
                                  moviedate: data.topRatedMovieList!,
                                  data: data),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text("Upcoming",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 20,
                              ),
                              SectionWidget(
                                  moviedate: data.upcomingMovieList!,
                                  data: data),
                            ],
                          ),
                        ),
                      )
                    : LoadingDataScreen());
          }),
    );
  }
}

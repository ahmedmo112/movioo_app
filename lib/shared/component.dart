import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movioo/logic/cubit/app_cubit.dart';
import 'package:movioo/logic/network/end_point.dart';
import 'package:movioo/model/movie_model.dart';
import 'package:movioo/module/MovieDetailes/detail_screen.dart';
import 'package:movioo/shared/colors.dart';
import 'package:movioo/shared/my_component.dart';
import 'package:shimmer/shimmer.dart';

class SectionWidget extends StatelessWidget {
   SectionWidget({ Key? key,required this.moviedate,required this.data,}) : super(key: key);
  final List<Results> moviedate;
  final AppCubit data;
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 230,
                child: ListView.separated(
                  itemCount: moviedate.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics() ,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20,) ;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: ()async{

                        // data.getmovie(moviedate[index].id!);
                        
                        navigateTo(context, DetailScreen(image: moviedate[index].posterPath!,id: moviedate[index].id!,));
                      },
                      child: SectionItemBuilder(movieName: moviedate[index].originalTitle! ,image: IMAGE+moviedate[index].posterPath!,rate: moviedate[index].voteAverage!,));
                  },
                ),
              );
  }
}

class SectionItemBuilder extends StatelessWidget {
   SectionItemBuilder({ Key? key,required this.movieName, required this.image,required this.rate }) : super(key: key);
  final String movieName;
  final String image;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Column(
                      children: [
                        Container(
                          width: 115,
                          height: 155, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
                          ),
                          ),
                       const SizedBox(height: 6,),
        
                      Container(
                        width: 115,
                        child: Text(
                          movieName,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))
                        ),
                      // Text("rating",style: TextStyle(fontSize: 13,)),
                      RatingBarIndicator(
                        itemBuilder: (context,index)=>Icon(Icons.star_rate,color: Colors.amber),
                        rating: double.parse(rate)/2,
                        itemSize: 18,
                        ),
        
                        
                      ],
                    ) ;
  }
}

class HomeSliderWidget extends StatelessWidget {
   HomeSliderWidget({ Key? key,required this.images,required this.text }) : super(key: key);
  final List<String> images;
  final List<String> text;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
                items: images.map((e) =>Stack(
                  children: [
                    Container(
                      margin:const EdgeInsets.all( 10),
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(17),
                        image: DecorationImage(image: NetworkImage(IMAGE+e),fit: BoxFit.cover)
                      )
                      ),
                      Container(
                      margin:const EdgeInsets.all( 10),
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(17),
                        gradient: const LinearGradient(
                          colors: [Colors.transparent,Colors.transparent,maincolor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      ),
                     Align(
                       alignment: Alignment.bottomLeft,
                       child: Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Text(text[images.indexOf(e)],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
                       )),
                      
                  ],
                ),
                  ).toList(),
                 options: CarouselOptions(
                   height: 190,
                   initialPage: 0,
                   viewportFraction: 1.0,
                   enableInfiniteScroll: true,
                   autoPlay: true,
                   autoPlayInterval: const Duration(seconds: 5),
                   autoPlayAnimationDuration:const Duration(seconds: 1),
                   autoPlayCurve: Curves.fastOutSlowIn,
                   scrollDirection: Axis.horizontal,

                 )
                 );
  }
}


Widget costumshimmer(double hight, double width,double radius){
  return  Shimmer.fromColors(
                      baseColor: Colors.grey.shade800,
                      highlightColor: Colors.grey.shade700,
                      child:Container(
                        height: hight,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(radius)
                        )
                        )
                    );
}

class ShimmerHomeSliderWidget extends StatelessWidget {
   ShimmerHomeSliderWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: costumshimmer(190, double.infinity,17),
    );
  }
}


class ShimmerSectionWidget extends StatelessWidget {
   ShimmerSectionWidget({ Key? key,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 230,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics() ,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20,) ;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                        children: [
                         costumshimmer(155, 115, 15),
                         const SizedBox(height: 6,),
                        costumshimmer(25, 115, 4),
                         const SizedBox(height: 6,),
                        costumshimmer(20, 90, 4),   
                        ],
                      );
                  },
                ),
              );
  }
}
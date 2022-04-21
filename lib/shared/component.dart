import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movioo/module/MovieDetailes/detail_screen.dart';
import 'package:movioo/shared/colors.dart';
import 'package:movioo/shared/my_component.dart';

class SectionWidget extends StatelessWidget {
   SectionWidget({ Key? key,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 220,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics() ,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20,) ;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return SectionItemBuilder(movieName: "Movie Movie Spider Man Man $index",image: "https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",);
                  },
                ),
              );
  }
}

class SectionItemBuilder extends StatelessWidget {
   SectionItemBuilder({ Key? key,required this.movieName, required this.image }) : super(key: key);
  final String movieName;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, DetailScreen());
      },
      child: Column(
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
                        Text("rating",style: TextStyle(fontSize: 13,)),
          
                          
                        ],
                      ),
    ) ;
  }
}

class HomeSliderWidget extends StatelessWidget {
   HomeSliderWidget({ Key? key }) : super(key: key);
  List<String> images =["https://image.tmdb.org/t/p/w500/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg","https://image.tmdb.org/t/p/w500/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg","https://image.tmdb.org/t/p/w500/5P8SmMzSNYikXpxil6BYzJ16611.jpg"];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
                items: images.map((e) =>Stack(
                  children: [
                    Container(
                      margin:const EdgeInsets.all( 10),
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(17),
                        image: DecorationImage(image: NetworkImage(e),fit: BoxFit.cover)
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
                         child: Text("Spider Mann YA MAN",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                       )),
                      
                  ],
                ),
                  ).toList(),
                 options: CarouselOptions(
                   height: 170,
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
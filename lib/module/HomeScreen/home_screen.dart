import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:movioo/shared/colors.dart';
import 'package:movioo/shared/component.dart';
import 'package:movioo/shared/my_component.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({ Key? key }) : super(key: key);

  var textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Welcome Back,\nAhmed",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,)),
                  Icon(Icons.menu,size: 25,)
                ],
              ),
              const SizedBox(height: 20,),
              HomeSliderWidget(),
              // defaultFormField(
              //   controller: textEditingController,
              //    type: TextInputType.text,
              //     validate: (value){},
              //       suffix: Icons.search,
              //       ),
              const SizedBox(height: 20,),
              
              const Text("Popular movie",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
              const SizedBox(height: 20,),
              SectionWidget(),
              const SizedBox(height: 10,),
              const Text("Poplur movie",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              const SizedBox(height: 20,),
              Container(
                height: 200,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics() ,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20,) ;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          width: 115,
                          height: 135, 
                          color: Colors.red,
                          ),
                       const SizedBox(height: 10,),
        
                      Text("Movie name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
        
                        
                      ],
                    ) ;
                  },
                ),
              ),
               const SizedBox(height: 10,),
              const Text("Poplur movie",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              const SizedBox(height: 20,),
              Container(
                height: 200,
                child: ListView.separated(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics() ,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 20,) ;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          width: 115,
                          height: 135, 
                          color: Colors.red,
                          ),
                       const SizedBox(height: 10,),
        
                      Text("Movie name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
        
                        
                      ],
                    ) ;
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
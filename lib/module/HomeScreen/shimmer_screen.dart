import 'package:flutter/material.dart';
import 'package:movioo/shared/component.dart';

class LoadingDataScreen extends StatelessWidget {
  const LoadingDataScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Welcome Back,\nAhmed",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    InkWell(
                onTap: () {
                
                },
                child: Container(
                    
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Icon(Icons.search))),
              ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ShimmerHomeSliderWidget(),
               
                const SizedBox(
                  height: 20,
                ),
    
                const Text("Popular movie",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 20,
                ),
                ShimmerSectionWidget(),

                const SizedBox(
                  height: 10,
                ),
                const Text("Top Rated",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 20,
                ),
                ShimmerSectionWidget(),

                const SizedBox(
                  height: 10,
                ),
                const Text("Upcoming",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 20,
                ),
                ShimmerSectionWidget(),

              ],
            ),
          ),
        );
  }
}
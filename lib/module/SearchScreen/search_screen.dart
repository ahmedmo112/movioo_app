import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movioo/shared/colors.dart';
import 'package:movioo/shared/my_component.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({ Key? key }) : super(key: key);


  var textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(child: Icon(Icons.arrow_back))),
                ),
                 defaultFormField(
                    controller: textEditingController,
                     type: TextInputType.text,
                      validate: (value){},
                        suffix: Icons.search,
                        ),
                        SizedBox(height: 40,),
                Expanded(
                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20,);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return  
                        
                         Container(
                          height: 130,
                          width: double.infinity,
                          
                          child: Row(
                            children: [
                              Container(
                                height: 130,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg"),fit: BoxFit.cover)
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Spider Mann YA MAN",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                      )
                                      ),
                                      SizedBox(height: 20,),
                                     RatingBarIndicator(
                          itemBuilder: (context,index)=>Icon(Icons.star_rate,color: Colors.amber),
                          rating: 4.1,
                          itemSize: 18,
                          ),
                                      SizedBox(height: 10,),
                                      Text("2021-12-15",
                      style:
                          TextStyle(fontSize: 12,color: Colors.grey )),
                                ],
                              )
                            ],
                          ),
                        
                      );
                    },
                  ),
                ),
          ],
        ),
      )
    );
  }
}
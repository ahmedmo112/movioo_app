import 'package:flutter/material.dart';
import 'package:movioo/shared/colors.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          Stack(
          children: [
            Container(
              height: 450,
              width: double.infinity,
              
                  child:Image(image: NetworkImage("https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg"),fit: BoxFit.cover,),
            ),
              Container(
                    height:450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                            colors: [Colors.transparent,maincolor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ), 
                    ),
                  
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        Text("Spider Mann YA MAN",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                         SizedBox(height: 10,),

                        Text("Crime-Action-Thriller",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey.withOpacity(0.4))),

                        // Container(
                        //   height: 30,
                        //   child: ListView.separated(
                        //     itemCount: 3,
                        //     scrollDirection: Axis.horizontal,
                        //     separatorBuilder: (BuildContext context, int index) {
                        //       return SizedBox(width: 5,);
                        //     },
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Container(
                        //         height: 20,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(10),
                        //           color: Colors.grey.withOpacity(0.2)
                        //         ),
                        //         child: Padding(
                        //           padding: const EdgeInsets.symmetric(horizontal: 5),
                        //           child: Center(child: Text("Action")),
                        //         )
                        //       );
                        //     },
                        //   ),
                        // ),
                      ]
                    ),
                  ),
                  
                  
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  
                  children: [
                    Icon(Icons.star,color: Colors.amber,size: 20,),
                   SizedBox(width: 5,),
                    Text("7.8",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500)),
                   SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.amber),
                        ),
                        onPressed: (){},
                         child: Text("Watch Now")
                         ),
                    ),
                  ],
                ),

              ),

             

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("overview",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                    SizedBox(height: 10,),
                    Text("In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey)),

                    
                  ],
                )),
              ),

          ]
        ),
      ),
    );
  }
}
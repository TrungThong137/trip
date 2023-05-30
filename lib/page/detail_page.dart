import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip/cubit/app_cubit.dart';
import 'package:trip/cubit/app_cubit_state.dart';
import 'package:trip/widget/app_button.dart';
import 'package:trip/widget/reponsiveButton.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStars = 3;
  int selectedIndex=-1;
  ScrollController controller = ScrollController();
  bool closeTopController=false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1_DO0jQ_sLFzW6oCkJnhCAe3NnTt_wlV_QQ&usqp=CAU'),
                        fit: BoxFit.cover
                      )
                    ),
                  )
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          BlocProvider.of<AppCubits>(context).goHome();
                        }, 
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  )
                ),
                Positioned(
                  top: 310,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const[
                            Text(
                              "Yosemite",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                              ),
                            ),
                            Text(
                              "\$ 250",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: const[
                            Icon(Icons.location_on, color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text(
                              "USA, California", 
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            // select star
                            Wrap(
                              children: List.generate(5, (index) => InkWell(
                                onTap: (){
                                  setState(() {
                                    gottenStars=index+1;
                                  });
                                },
                                child: Icon(
                                  Icons.star,
                                  color:index<gottenStars? Colors.yellow : Colors.grey,
                                ),
                              )),
                            ),
                            Text(
                              "($gottenStars.0)",
                              style: const TextStyle(
                                color: Colors.blueAccent
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 25,),
                        Text(
                          "People",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text(
                          "Number of people in your group",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Wrap(
                          children: List.generate(5, (index) =>
                            InkWell(
                              onTap: (){
                                setState(() {
                                  selectedIndex=index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: ApppButton(
                                  size: 50,
                                  color:selectedIndex==index? Colors.white:Colors.black,
                                  background:selectedIndex==index?Colors.black: Colors.grey.withOpacity(0.3),
                                  borderColor:selectedIndex==index? Colors.black:Colors.grey.withOpacity(0.3),
                                  text: (index+1).toString(),
                                ),
                              ),
                            )),
                        ),
                        const SizedBox(height: 20,),
                        Text(
                          "Descriptions",
                          style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8)
                          ),
                        ),

                        Text(
                          "Partez à la conquête de montagnes gigantesques, triomphez de redoutables machines et percez le mystère d'une terrible menace qui plane sur le monde d'Horizon en vous plongeant dans une nouvelle avent",
                          style: TextStyle(
                            fontSize: 16, 
                            color: Colors.black.withOpacity(0.3)
                          ),
                        )
                      ],
                    ),
                  )
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: const[
                      ApppButton(
                        color: Colors.deepPurple, 
                        background: Colors.white, 
                        size: 60, 
                        borderColor: Colors.deepPurple,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(width: 20,),
                      ReponsiveButton(
                        isReponsive: true,
                      ),
                    ],
                  )
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
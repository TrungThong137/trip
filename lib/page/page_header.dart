import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip/cubit/app_cubit.dart';
import 'package:trip/widget/reponsiveButton.dart';

class PageHeader extends StatefulWidget {
  const PageHeader({super.key});

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> {

  List images=[
    'https://pbs.twimg.com/media/FvXCzy_aYAEpH_9?format=jpg&name=medium',
    'https://img.freepik.com/free-vector/hand-drawn-hello-summer-with-van-palm-trees_23-2148527532.jpg?size=626&ext=jpg',
    'https://img.freepik.com/premium-vector/luggage-travel-3d-realistic-art-style-pastel-color-vector-illustration_67590-1138.jpg?size=626&ext=jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(images[index]),
                fit: BoxFit.fill
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 170, left: 10, right: 20),
              child: Row(
                children: [
                  Column(
                    children: List.generate(3, (indexDots) => 
                      Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        width: 8,
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index==indexDots?Colors.blue: Colors.blue.withOpacity(0.3)
                        ),
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 500, left: 280),
                    child: GestureDetector(
                      onTap: (){
                        BlocProvider.of<AppCubits>(context).getData();
                      },
                      child: const ReponsiveButton(
                        width: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
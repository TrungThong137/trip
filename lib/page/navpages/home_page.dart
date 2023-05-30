import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip/cubit/app_cubit.dart';
import 'package:trip/cubit/app_cubit_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imagess=[
    'https://pbs.twimg.com/media/FvXCzy_aYAEpH_9?format=jpg&name=medium',
    'https://img.freepik.com/free-vector/hand-drawn-hello-summer-with-van-palm-trees_23-2148527532.jpg?size=626&ext=jpg',
    'https://img.freepik.com/premium-vector/luggage-travel-3d-realistic-art-style-pastel-color-vector-illustration_67590-1138.jpg?size=626&ext=jpg'
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1_DO0jQ_sLFzW6oCkJnhCAe3NnTt_wlV_QQ&usqp=CAU',
    'https://pbs.twimg.com/media/FvXCzy_aYAEpH_9?format=jpg&name=medium',
    'https://img.freepik.com/free-vector/hand-drawn-hello-summer-with-van-palm-trees_23-2148527532.jpg?size=626&ext=jpg',
    'https://img.freepik.com/premium-vector/luggage-travel-3d-realistic-art-style-pastel-color-vector-illustration_67590-1138.jpg?size=626&ext=jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is LoadedState){
            var info= state.places;
            return  SingleChildScrollView(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 70, left: 20),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                BlocProvider.of<AppCubits>(context).getStart();
                              });
                            },
                            icon: const Icon(Icons.menu, size: 30, color: Colors.black54,)
                          ),
                          Expanded(child: Container()),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)
                            ),
                          )
                        ],
                      ),
                    ),
              
                    const SizedBox(height: 40,),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    // tab bar
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: EdgeInsets.only(left: 20, right: 20),
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(
                          color: Colors.blue, 
                          radius: 4
                        ),
                        tabs: [
                          Tab(text: "Places",),
                          Tab(text: "Inspiration",),
                          Tab(text: "Emotions",),
                        ],
                      ),
                    ),
              // tab bar view
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 300,
                      width: double.maxFinite,
                      child:  TabBarView(
                        children: [
                          ListView.builder(
                            itemCount: imagess.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: (){
                                BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15, top: 10),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(imagess[index]),
                                    fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text("Hi"),
                          const Text("Hi"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                          Text(
                            "Explore more",
                            style: TextStyle(
                              fontSize: 22
                            ),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Container(
                      height: 100,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        itemCount: imagess.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(imagess[index]),
                                    fit: BoxFit.fill
                                  )
                                ),
                              ),
                              const Text(
                                "Kayaking",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54
                                ),
                              )
                            ],
                          ),
                        );
                        }
                      ),
                    )
                  ],
                ),
              ),
            );
          }else{
            return Container();
          }
        },
      )
    );
  }
}


class CircleTabIndicator extends Decoration{
  final Color color;
  final double radius;
  const CircleTabIndicator({
    required this.color,
    required this.radius
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onchange]){
    return _CirclePainter(color: color, radius: radius);
  } 
}

class _CirclePainter extends BoxPainter{
  final Color color;
  final double radius;
  const _CirclePainter({
    required this.color,
    required this.radius
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration){
    Paint paint =Paint();
    paint.color=color;
    paint.isAntiAlias=true;
    final Offset circleOffset= Offset(configuration.size!.width/2 - radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, paint);
  }
}
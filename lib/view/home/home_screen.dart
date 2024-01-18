import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac_demo/bloc/bloc.dart';
import 'package:prac_demo/states/states.dart';
import 'package:prac_demo/utils/constants.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lost & Found"),
        centerTitle: true,
        leading: Image.asset('assets/images/menu.png'),
        actions: [
          IconButton(onPressed: () {
            
          },icon: Icon(Icons.add,size: 30),),
          Constants.sPacewidth(10)
        ],
      ),
      body: BlocBuilder<ApiBloc,AppState>(
        builder: (context, state) {
          if(state is InitState){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is DataState){
            return ListView.builder(shrinkWrap: true,itemCount:state.data!.length,itemBuilder: (context, index) {
              return FadeInUp(
                duration: Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(fit: BoxFit.fill,image: NetworkImage(state.data![index].image.toString()))
                            ),
                          ),
                          Constants.sPacewidth(10),
                          Expanded(
                            child: Column(
                
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.data![index].category.toString(),style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w500)),
                                Text(state.data![index].description.toString(),maxLines: 1,overflow: TextOverflow.ellipsis),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\$ "+state.data![index].price.toString(),maxLines: 1,overflow: TextOverflow.ellipsis),
                                    Text("Rating :"+state.data![index].rating!.count.toString(),maxLines: 1,overflow: TextOverflow.ellipsis),
                
                                  ],
                                ),
                
                              ],
                            ),
                          )
                
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },);
          }
          else{
            return Center(child: Text("Something went wrong"),);
          }
        },
      )
    );
  }
}

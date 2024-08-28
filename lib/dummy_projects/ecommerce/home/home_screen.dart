import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwad_two/dummy_projects/ecommerce/home/cubit/home_cubit.dart';
import 'package:rwad_two/dummy_projects/ecommerce/home/model/BannerModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Icon(Icons.pin_drop_rounded),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Current Location"),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.green,
                      )
                    ],
                  ),
                  Text(
                    "Monofia, Menouf",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  List<BannerData>? bannerData = cubit.bannerModel.data;
                  if (state is HomeBannerLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CarouselSlider(
                      items: List.generate(
                          bannerData?.length ?? 0,
                          (i) => Container(
                                height: 150,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    bannerData?[i].image ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                      options: CarouselOptions(
                        height: 150,
                        aspectRatio: 16 / 9,
                        viewportFraction: .9,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        // autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Product Pack",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final productData = cubit.productModel.data?.data;
                  if (state is HomeProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 220,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: productData?.length ?? 0,
                        separatorBuilder: (c, i) => SizedBox(
                              width: 20,
                            ),
                        itemBuilder: (c, i) => Container(
                              padding: EdgeInsets.all(10),
                              width: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Image.network(
                                          productData?[i].image ?? "")),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: 100,
                                            child: Text(
                                              productData?[i].name ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: 100,
                                            child: Text(
                                              productData?[i].description ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${productData?[i].price}\$",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "${productData?[i].oldPrice}\$",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Spacer(),
                                      FloatingActionButton(
                                        backgroundColor: Colors.green,
                                        mini: true,
                                        shape: const CircleBorder(),
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Product Pack",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final productData = cubit.productModel.data?.data;
                  if (state is HomeProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 220,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: productData?.length ?? 0,
                        separatorBuilder: (c, i) => SizedBox(
                              width: 20,
                            ),
                        itemBuilder: (c, i) => Container(
                              padding: EdgeInsets.all(10),
                              width: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      child: Image.network(
                                          productData?[i].image ?? "")),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: 100,
                                            child: Text(
                                              productData?[i].name ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: 100,
                                            child: Text(
                                              productData?[i].description ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${productData?[i].price}\$",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "${productData?[i].oldPrice}\$",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Spacer(),
                                      FloatingActionButton(
                                        backgroundColor: Colors.green,
                                        mini: true,
                                        shape: const CircleBorder(),
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

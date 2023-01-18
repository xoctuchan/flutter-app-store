import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_imput_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex=0;

  final List<Widget> _demo= [
    const SliderImage(image: 'assets/1.jpg'),
    const SliderImage(image: 'assets/2.jpg'),
    const SliderImage(image: 'assets/3.jpg'),
    const SliderImage(image: 'assets/4.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map <String, String> formValues ={};
    return Scaffold(
      bottomNavigationBar: 
        const BottomNavigationOptions(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 23, 27),
        //leading: const Image(image: AssetImage('assets/logo.png')),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Image(image: AssetImage('assets/logo.png')),
            Text('FIT', style: TextStyle(color: Color(0xff00C9F8), fontWeight: FontWeight.bold),),
            Text('PRO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: 
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child:Column(
            children: [
              CustomInputField(inputType: TextInputType.name, hintText: 'Buscar', formProperty: 'buscar', formValues: formValues),
              SizedBox(height: 10,),
              Container(
                height: 200,
                width: double.infinity,
                child: PageView(
                  children: _demo,
                  onPageChanged: (index){
                      setState(() {
                        pageIndex=index;
                      });
                  }
                ),
              ),
              SizedBox(height: 10,),
              CarouselIndicator(
                count: _demo.length,
                index: pageIndex,
                color: Colors.grey,
                activeColor: Colors.blue,
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Text('All Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey.shade700)),
                    Expanded(child: Container()),
                    Text('See all', style: TextStyle( color: Colors.blue, fontSize: 12))
                  ],
                )
              ),
              SizedBox(height: 40,),
              Container(
                height: 85,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                      ButtonCategory(text: 'Category 1', icon: Icons.shop_two),
                      ButtonCategory(text: 'Category 2', icon: Icons.shop),
                      ButtonCategory(text: 'Category 3', icon: Icons.shop),
                      ButtonCategory(text: 'Category 4', icon: Icons.shop),
                      ButtonCategory(text: 'Category 5', icon: Icons.shop),
                      ButtonCategory(text: 'Category 6', icon: Icons.shop),
                      ButtonCategory(text: 'Category 7', icon: Icons.shop),
                      ButtonCategory(text: 'Category 8', icon: Icons.shop),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                  children: [
                    Text('Popular Products', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey.shade700)),
                    Expanded(child: Container()),
                    Text('See all', style: TextStyle( color: Colors.blue, fontSize: 12))
                  ],
                )
              ),
            ],
        )
      )
    );
  }
}

class BottomNavigationOptions extends StatelessWidget {
  const BottomNavigationOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
      ),
    ]
      );
  }
}

class SliderImage extends StatelessWidget {
  final String image;
  const SliderImage({
    Key? key, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image( image:AssetImage(image), fit: BoxFit.cover,)
    );
  }
}

class ButtonCategory extends StatelessWidget {
  final String text;
  final IconData icon;

  const ButtonCategory({
    Key? key, 
    required this.text, 
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey.shade300,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Icon(icon, color: Colors.blue, size: 30,),
          ),
          Text(text, style: TextStyle(color: Colors.blue), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
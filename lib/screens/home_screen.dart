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
    const SliderImage(image: 'assets/camiseta.jpg'),
    const SliderImage(image: 'assets/otra2.jpg'),
    const SliderImage(image: 'assets/otra3.jpg'),
    const SliderImage(image: 'assets/4.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map <String, String> formValues ={};
    //final IconData fitness_center = IconData(0xe28d, fontFamily: 'MaterialIcons');
    //final IconData crown = IconData(0xe844, fontFamily: 'MyFlutterApp', fontPackage: null);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 23, 27),
        //leading: const Image(image: AssetImage('assets/logo.png')),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Image(image: AssetImage('assets/logo.png')),
            Text('FIT', style: TextStyle(color: Color(0xff00C9F8), fontWeight: FontWeight.bold),),
            Text('PRO APP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: 
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child:CustomScrollView(
          slivers: [
            SliverList(delegate: 
              SliverChildListDelegate([
              CustomInputField(inputType: TextInputType.name, hintText: 'Buscar', formProperty: 'buscar', formValues: formValues),
              const SizedBox(height: 10,),
              Container(
                //color: Colors.red,
                height: 300,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: PageView(
                  children: _demo,
                  onPageChanged: (index){
                      setState(() {
                        pageIndex=index;
                      });
                  }
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: CarouselIndicator(
                  count: _demo.length,
                  index: pageIndex,
                  color: Colors.grey,
                  activeColor: const Color(0xff03ADD4),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey.shade700)),
                  Expanded(child: Container()),
                  const Text('See all', style: TextStyle( color: Color(0xff03ADD4), fontSize: 12))
                ],
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: 85,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index){
                    return const ButtonCategory(text: 'Running', icon: Icons.run_circle);
                  },
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Text('Popular Products', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey.shade700)),
                  Expanded(child: Container()),
                  const Text('See all', style: TextStyle( color: Color(0xff03ADD4), fontSize: 12))
                ],
              ),
              const SizedBox(height: 10,),
              SizedBox(
                //color: Colors.red,
                height: 200,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(_, int index) {
                    return const PopularProduct(image: 'assets/otra2.jpg', text: 'Descripcion producto');
                  },
                ),
              ),

            ])
            )
          ],
        ),
      ),
      bottomNavigationBar: 
        const BottomNavigationOptions(),
    );
  }
}

class PopularProduct extends StatelessWidget {
  final String image;
  final String text;
  const PopularProduct({
    Key? key, 
    required this.image, 
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 180,
          width: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image( image:AssetImage(image), fit: BoxFit.cover,)
          )
        ),
        Text(text, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
      ],
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
        icon: Icon(Icons.home, color: Color(0xff03ADD4)),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.grid_view),
        label: 'Categories',
      ),
      /* BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined),
        label: 'School',
      ),*/
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: 'Profile',
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image( image:AssetImage(image), fit: BoxFit.cover,)
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey.shade300,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Icon(icon, color: const Color(0xff03ADD4), size: 50,),
          ),
          Text(text, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
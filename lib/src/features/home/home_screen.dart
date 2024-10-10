import 'package:flutter/material.dart';
import 'package:pdp_imtihon_modul_seven/src/common/model/food_model.dart';
import 'package:pdp_imtihon_modul_seven/src/common/router/app_router.dart';
import 'package:pdp_imtihon_modul_seven/src/features/home/data/home_repository.dart';
import 'package:pdp_imtihon_modul_seven/src/features/home/widgets/food_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FoodModel> foodData = [];
  IHomeRepository homeRepository = ImpHomeRepository();

  Future<List<FoodModel>?> getFoods() async {
    List<FoodModel>? food = await homeRepository.getData(context);
    return food;
  }

  void getFood() async {
    List<FoodModel>? food = await getFoods();

    await Future.delayed(const Duration(seconds: 1));

    if (food == null) {
      return;
    }

    foodData.addAll(food);
  }

  @override
  void initState() {
    getFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey.shade300,
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.search);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black,
                    fixedSize: const Size(56, 56),
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    fixedSize: const Size(56, 56),
                  ),
                  icon: const Icon(
                    Icons.menu,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),

            /// Text
            Text(
              "Popular Burgers",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 25),

            /// Menu
            for (int i = 0; i < foodData.length; i += 2)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FoodMenu(
                        title: foodData[i].strMeal,
                        subtitle: foodData[i].strCategory,
                        sum: foodData[i].idMeal,
                        photo: foodData[i].strMealThumb,
                      ),
                      FoodMenu(
                        title: foodData[i + 1].strMeal,
                        subtitle: foodData[i + 1].strCategory,
                        sum: foodData[i + 1].idMeal,
                        photo: foodData[i + 1].strMealThumb,
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

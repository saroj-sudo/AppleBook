import 'package:applebook/model/character.dart';
import 'package:applebook/model/dummyData.dart';

class MenuItem {
  String title;
  String image;
  String appBarName;
  List<Character> listOf;

  MenuItem({
    this.title,
    this.image,
    this.listOf,
    this.appBarName,
  });
}

List<MenuItem> menuItems = [
  MenuItem(
      image: 'assets/images/menu_icons/english.jpg', listOf: englishCharacters),
  MenuItem(
      image: 'assets/images/menu_icons/nepali.jpg', listOf: nepalialphabets),
  MenuItem(image: 'assets/images/menu_icons/bird.png', listOf: birds),
  MenuItem(
      image: 'assets/images/menu_icons/vegetables.jpg', listOf: vegetables),
  MenuItem(image: 'assets/images/menu_icons/car.jpg', listOf: transportation),
  MenuItem(image: 'assets/images/menu_icons/flower.jpg', listOf: flowers),
  MenuItem(image: 'assets/images/menu_icons/fruits.jpg', listOf: fruits),
  MenuItem(image: 'assets/images/menu_icons/insects.jpg', listOf: insects),
  MenuItem(image: 'assets/images/menu_icons/body part.jpg', listOf: bodyparts),
  MenuItem(image: 'assets/images/menu_icons/animals.jpg', listOf: wildanimals),
  MenuItem(image: 'assets/images/menu_icons/dog.jpg', listOf: domesticanimals),
  MenuItem(image: 'assets/images/menu_icons/math-1.jpg')
];

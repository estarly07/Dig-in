import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:dig_in/presentation/models/category_model.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  List<CategoryModel> list = [
    CategoryModel(idCategory: 0,image : "https://comboypizza.com/pereira/wp-content/uploads/sites/3/revslider/slider11.png",name: "Pizza"),
    CategoryModel(idCategory: 1,image : "https://monsterburguer.com/wp-content/uploads/2022/10/burguer4.png",name: "Burger"),
    CategoryModel(idCategory: 2,image : "https://sushilight.com/wp-content/uploads/2019/05/Ebi-tempura.png",name: "Sushi"),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) =>
            _ItemCategory(
              heigth:  size.height * 0.1,
              categoryModel: list[index],
              marginLeft: size.width*0.05,
              isSelect: list[index].idCategory == 0,
            ),
        ));
  }
}

class _ItemCategory extends StatelessWidget {
  final double heigth;
  final CategoryModel categoryModel;
  final double marginLeft;
  final bool isSelect;
  const _ItemCategory({
    Key? key,
    required this.heigth,
    required this.categoryModel,
    required this.marginLeft,
    required this.isSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      child: CustomCard(
        backgroundColor: isSelect? Colors.orange.shade900 : Colors.white,
        cornerRadius: heigth,
        elevation: 5,
        shadowColor: Colors.black,
        widget: Padding(
          padding: const EdgeInsets.symmetric(vertical:2.0,horizontal: 8.0),
          child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: [
                CustomCard(
                    widget: Padding(
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(heigth),
                        child: FadeInImage(
                            placeholder: const AssetImage("assets/images/no_image.jpg"),
                            fadeOutDuration: const Duration(seconds: 1),
                            image: NetworkImage(categoryModel.image),
                            fit: BoxFit.cover,
                            height: heigth * 0.5,
                            width:  heigth * 0.5,
                          ),
                      ),
                    ),
                    shadowColor: Colors.black,
                    elevation: 5,
                    backgroundColor: Colors.white,
                    cornerRadius: heigth),
                CustomText(
                    text: categoryModel.name,
                    withBold: false,
                    textColor: isSelect? Colors.white : Colors.black,
                    fontSize: 15)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

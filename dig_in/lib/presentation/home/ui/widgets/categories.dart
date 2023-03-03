import 'package:dig_in/domain/models/category_model.dart';
import 'package:dig_in/presentation/global/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key,required this.categories,required this.wait}) : super(key: key);
  final List<CategoryModel> categories;
  final bool wait;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return 
    wait? CircularProgressIndicator():
     SizedBox(
        height: size.height * 0.1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) =>
            _ItemCategory(
              heigth:  size.height * 0.1,
              categoryModel: categories[index],
              marginLeft: size.width*0.05,
              isSelect: categories[index].idCategory == 0,
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

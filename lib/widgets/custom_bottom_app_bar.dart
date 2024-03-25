import 'package:flutter/material.dart';
import 'package:joybox/core/app_export.dart';

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      type: BottomBarEnum.Home,
      isSelected: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFrame,
      activeIcon: ImageConstant.imgFrame,
      type: BottomBarEnum.Frame,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFrameWhiteA700,
      activeIcon: ImageConstant.imgFrameWhiteA700,
      type: BottomBarEnum.Framewhitea700,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearch,
      activeIcon: ImageConstant.imgSearch,
      type: BottomBarEnum.Search,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13.h),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black, // Change background color to black
        child: SizedBox(
          height: 60, // Increase the height of the bottom navigation bar
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  bottomMenuList.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        for (var element in bottomMenuList) {
                          element.isSelected = false;
                        }
                        bottomMenuList[index].isSelected = true;
                        widget.onChanged?.call(bottomMenuList[index].type);
                        setState(() {});
                      },
                      child: bottomMenuList[index].isSelected
                          ? CustomImageView(
                              imagePath: bottomMenuList[index].activeIcon,
                              height: 20.v,
                              width: 21.h,
                              color: appTheme.whiteA700,
                            )
                          : CustomImageView(
                              imagePath: bottomMenuList[index].icon,
                              height: 21.adaptSize,
                              width: 21.adaptSize,
                              color: appTheme.whiteA700,
                            ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Frame,
  Framewhitea700,
  Search,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isSelected = false,
  });

  final String icon;
  final String activeIcon;
  final BottomBarEnum type;
  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

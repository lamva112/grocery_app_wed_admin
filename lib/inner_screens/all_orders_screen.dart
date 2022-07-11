import 'package:flutter/material.dart';
import 'package:grocery_app_wed_admin/controllers/MenuController.dart';
import 'package:grocery_app_wed_admin/responsive.dart';
import 'package:grocery_app_wed_admin/services/utils.dart';
import 'package:grocery_app_wed_admin/widgets/header.dart';
import 'package:grocery_app_wed_admin/widgets/orders_list.dart';
import 'package:grocery_app_wed_admin/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      key: context.read<MenuController>().getOrdersScaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Header(
                        fct: () {
                          context.read<MenuController>().controlAllOrder();
                        },
                        title: 'All Orders',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: OrdersList(),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

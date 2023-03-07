import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sindion/assets/widgets/appbar_with_drawer.dart';
import 'package:sindion/utils/functions.dart';
import 'package:sindion/utils/my_theme.dart';
import 'package:sindion/view_model/auth.dart';
import 'package:sindion/views/home/widgets/summary/Summary.dart';
import 'package:sindion/views/home/widgets/add_request.dart';
import 'package:sindion/views/home/widgets/evaluation/card.dart';
import 'package:sindion/views/home/widgets/header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AuthVM authProvider = Provider.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: createAppbarWithDrawer(logoutFunction: () {
        authProvider.logout(context: context);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSnackBar(
              context: context, text: 'Floating action button pressed');
        },
        child: const Icon(Icons.add_to_photos_rounded),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          const Header(),
          SizedBox(
            height: 5.h,
          ),
          const AddRequest(),
          const EvaluationSummary(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        height: 1.h,
                        color: Colors.transparent,
                      ),
                  padding: EdgeInsets.only(top: 5.h),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => EvaluationCard()))
        ],
      ),
    );
  }
}

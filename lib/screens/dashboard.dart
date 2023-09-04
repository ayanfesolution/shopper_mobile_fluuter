import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:termii_app/utils/component/padded.dart';
import 'package:termii_app/utils/component/text_field.dart';
import 'package:termii_app/utils/dimensions.dart';

class DashboardScreen extends StatefulHookWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var search = useTextEditingController();
    return Scaffold(
      body: Padded(
        child: Column(
          children: [
            Gap(getScreenHeight(70)),
            Row(
              children: [Image.asset('assets/images/profile.png')],
            ),
            CustomTextField(
              controller: search,
              hintText: 'Search',
              title: '',
            ),
            Image.asset('assets/images/Frame 256.png')
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: getScreenHeight(83),
        padding: EdgeInsets.only(
            top: getScreenHeight(12), bottom: getScreenHeight(22)),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(),
      ),
    );
  }
}

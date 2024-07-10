import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

AppBar get appBar {
  return AppBar(
    title: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Row(
            children: [
              Text(
                'Protfolio',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              ElevatedButton(onPressed: (){}, child: Text('About Me'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white,elevation: 0,),
              ),
              Gap(24),
              ElevatedButton(onPressed: (){}, child: Text('Skills')),
              Gap(24),
              ElevatedButton(onPressed: (){}, child: Text('Projects')),
              Gap(24),
              ElevatedButton(onPressed: (){}, child: Text('Contact Me')),
              Spacer(),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: ElevatedButton(onPressed: (){}, child: Text('Resume'),

                ),
              ),
            ],
          );
        }
        else{
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              'Protfolio',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.more_horiz)
          ],);
        }
      },
    ),
  );
}

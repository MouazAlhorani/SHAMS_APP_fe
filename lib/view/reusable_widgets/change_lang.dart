import 'package:fe_lw_shams/controller/direction_provider.dart';
import 'package:fe_lw_shams/services/lang_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          context.read<DirectionProvider>().toggleDirection();
          String lang = context.read<DirectionProvider>().textDirection ==
                  TextDirection.rtl
              ? 'ar'
              : 'en';
          await LangService.load(lang);
        },
        child: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(
              context.watch<DirectionProvider>().textDirection ==
                      TextDirection.rtl
                  ? 'assets/images/syria-f.jpg'
                  : 'assets/images/usa-f.png'),
        ),
      ),
    );
  }
}

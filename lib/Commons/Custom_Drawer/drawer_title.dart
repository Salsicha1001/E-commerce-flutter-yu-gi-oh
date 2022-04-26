import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTitle extends StatelessWidget {
  const DrawerTitle(
      { this.iconData,  this.title,  this.page});
  final IconData iconData;
  final String title;
  final int page;
  @override
  Widget build(BuildContext context) {
    final int curlPage = context.watch<PageManager>().page;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                iconData,
                size: 32,
                color:
                    curlPage == page ? Color.fromARGB(255, 64, 28, 223) : null,
              ),
            ),
            const SizedBox(width: 32),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: curlPage == page
                      ? Color.fromARGB(255, 64, 28, 223)
                      : null),
            )
          ],
        ),
      ),
    );
  }
}

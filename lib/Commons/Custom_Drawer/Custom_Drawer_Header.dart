import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(21, 24, 16, 8),
      height: 180,
      child: Consumer<UserManager>(builder: (_, userManager, __) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "E-COMMERCE \n YU-GI-OH",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              Text(
                LocaleProvider.of(context).welcome +
                    ' ${userManager.user.name ?? ''}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (userManager.isLoggedIn) {
                    userManager.logout();
                  } else {
                    Navigator.of(context).pushNamed("/login");
                  }
                },
                child: Column(
                  children: [
                    // ignore: sdk_version_ui_as_code
                    if (userManager.isLoggedIn == false) ...[
                      Text(
                        LocaleProvider.of(context).login_register,
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ] else ...[
                      Text(
                        LocaleProvider.of(context).logout,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ],
                ),
              )
            ]);
      }),
    );
  }
}

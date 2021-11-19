import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends StatelessWidget {
  final String company, websiteUrl, role, description, imageUrl;
  final Widget detailedPage;

  ProjectWidget(this.company, this.websiteUrl, this.role, this.description,
      this.imageUrl, this.detailedPage);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: company,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchURL(websiteUrl);
                        },
                      style: Theme.of(context).textTheme.headline2),
                ])),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  role,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => detailedPage)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor)),
                    child: Text(
                      'Read More',
                      style: Theme.of(context).textTheme.bodyText1,
                    ))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            // Image.asset(
            //   imageUrl,
            //   height: MediaQuery.of(context).size.width * 0.2,
            //   width: MediaQuery.of(context).size.width * 0.2,
            //   fit: BoxFit.fill,
            // )
            Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(230, 10, 20, 80),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 5),
                    )
                  ],
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        imageUrl,
                      ))),
            )
          ],
        ));
  }
}

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

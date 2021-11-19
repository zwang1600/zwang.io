import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text:
                    "My name is Zuo Wang and I am a undergraduate student at the University of Washington. I am currently studying ",
                style: Theme.of(context).textTheme.bodyText1),
            TextSpan(
                text: "Human Centered Design & Engineering",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchURL("https://www.hcde.washington.edu/");
                  },
                style: Theme.of(context).textTheme.bodyText2),
            TextSpan(
                text: " with a focus on Computer Science.\n\n\n",
                style: Theme.of(context).textTheme.bodyText1),
            TextSpan(
                text:
                    "I enjoy any type of interactive designs. And I'm extremely passionate about app development and front-end UI design.",
                style: Theme.of(context).textTheme.bodyText1),
          ])),
        ),
        const SizedBox(width: 50,),
        Container(
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: const BoxDecoration(
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
                    "assets/images/profile.jpeg",
                  ))),
        )
      ],
    );
  }
}

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

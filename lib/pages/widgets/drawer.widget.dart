import 'package:flutter/material.dart';
import 'package:emsi_portail/pages/widgets/drawer.header.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // Function to open URLs
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const MyDrawerHeader(),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).iconTheme.color,
                ),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "");
                },
                title: Text(
                  "Home",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(
                  Icons.book,
                  color: Color(0xFF258754),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "/cours");
                },
                title: Text(
                  "Cours",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: Icon(
                  Icons.assignment,
                  color: Theme.of(context).iconTheme.color,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "/exames");
                },
                title: Text(
                  "Exames",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: Icon(
                  Icons.calendar_month,
                  color: Theme.of(context).iconTheme.color,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "/calendar");
                },
                title: Text(
                  "Emploi",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Divider(height: 2),
              ListTile(
                leading: Icon(
                  Icons.content_paste_rounded,
                  color: Theme.of(context).iconTheme.color,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "/planning-control");
                },
                title: Text(
                  "Les Controles",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          // Social Media Icons and Copyright at the bottom
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.facebook),
                      color: Colors.blue,
                      onPressed: () {
                        _launchURL("https://web.facebook.com/emsi.ma");
                      },
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                      color: Colors.blueAccent,
                      onPressed: () {
                        _launchURL(
                            "https://www.linkedin.com/school/ecole-marocaine-des-sciences-de-l'ing%C3%A9nieur");
                      },
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      color: Colors.purple,
                      onPressed: () {
                        _launchURL("https://www.instagram.com/p/C84z8lHINZg/");
                      },
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.youtube),
                      color: Colors.red,
                      onPressed: () {
                        _launchURL("https://www.youtube.com/@ecolemarocainedessciencesd4736");
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "© 2025 ÉCOLE MAROCAINE DES SCIENCES DE L'INGÉNIEUR\nTous droits réservés.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

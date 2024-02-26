import 'dart:io';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:dqed1/news.dart';
import 'package:dqed1/news_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';
import 'package:whatsapp_stickers_plus/exceptions.dart';
import 'package:whatsapp_stickers_plus/whatsapp_stickers.dart';

import 'pp_screen.dart';
import 'tou_screen.dart';

late PageController _pageController;
int currentPage = 0;
bool ableToCallShareWindow = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: PageView(
                  onPageChanged: (value) => setState(() {
                    currentPage = value;
                  }),
                  controller: _pageController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                              ...List.generate(16, (index) {
                                return Builder(builder: (ctx) {
                                  return GestureDetector(
                                      onTap: () async {
                                        if (ableToCallShareWindow) {
                                          ableToCallShareWindow = false;
                                          final box = ctx.findRenderObject()
                                              as RenderBox?;
                                          String copiedFilePath =
                                              await copyAssetToDevice(
                                                  'assets/${index + 1}.webp');
                                          await Share.shareXFiles(
                                            [XFile(copiedFilePath)],
                                            sharePositionOrigin: box!
                                                    .localToGlobal(
                                                        Offset.zero) &
                                                box.size,
                                          ).whenComplete(() {
                                            deleteFile(copiedFilePath);
                                            ableToCallShareWindow = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Image.asset(
                                          'assets/${index + 1}.webp',
                                          height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4 -
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  10,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4 -
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  10,
                                        ),
                                      ));
                                });
                              }),
                              Container(
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                  leading: const Icon(
                                      Icons.info_outline_rounded,
                                      color: Colors.black),
                                  title: Text(
                                    'Save to Photos, Notes or Files and drag onto the chat to drop as sticker',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text('or',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.red)),
                          const SizedBox(height: 15),
                          FittedBox(
                            child: CupertinoButton(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.redAccent,
                                onPressed: () => uploadStickers(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/whatsapp.svg'),
                                    Text('Import to Whatsapp',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(color: Colors.white)),
                                  ],
                                )),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    ListView.builder(
                        itemCount: newsList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (_) => NewsDetails(
                                          news: newsList[index],
                                          index: index,
                                        ))),
                            child: ListTile(
                              leading: Hero(
                                tag: 'item$index',
                                child: Image.network(newsList[index].imageLink,
                                    width: 100, height: 100, fit: BoxFit.cover),
                              ),
                              title: Text(
                                newsList[index].title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                newsList[index].content,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing:
                                  const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          );
                        }),
                    Center(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(right: 16, top: 20, left: 16),
                      child: Column(
                        children: [
                          Builder(builder: (ctx) {
                            return CupertinoButton(
                              onPressed: () async {
                                if (ableToCallShareWindow) {
                                  ableToCallShareWindow = false;
                                  final box =
                                      ctx.findRenderObject() as RenderBox?;
                                  await Share.shareWithResult(
                                    'Check out these stickers! https://apps.apple.com/us/app/1win-top-cars/id6478486898',
                                    sharePositionOrigin:
                                        box!.localToGlobal(Offset.zero) &
                                            box.size,
                                  ).whenComplete(() {
                                    ableToCallShareWindow = true;
                                  });
                                }
                              },
                              padding: EdgeInsets.zero,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: ListTile(
                                  leading: const Icon(Icons.ios_share_rounded,
                                      color: Colors.red),
                                  title: Text(
                                    'Share with friends',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_rounded),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 10),
                          Builder(builder: (context) {
                            return CupertinoButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Rdxa(
                                        url:
                                            'https://docs.google.com/document/d/1vyQw02IaSd1VaAYMZMB541QGDM3AUV8zu5T9VLKLV6A/edit?usp=sharing'),
                                  ),
                                );
                              },
                              padding: EdgeInsets.zero,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: ListTile(
                                  leading: const Icon(
                                      Icons.privacy_tip_outlined,
                                      color: Colors.red),
                                  title: Text(
                                    'Privacy Policy',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_rounded),
                                ),
                              ),
                            );
                          }),
                          const SizedBox(height: 10),
                          Builder(builder: (context) {
                            return CupertinoButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Rdxa(
                                        url:
                                            'https://docs.google.com/document/d/158ifpAhv2I3Nhqf8PQz1imlGTcXf4EQPw-nW6lIUOCc/edit?usp=sharing'),
                                  ),
                                );
                              },
                              padding: EdgeInsets.zero,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: ListTile(
                                  leading: const Icon(Icons.list_alt_rounded,
                                      color: Colors.red),
                                  title: Text(
                                    'Terms of Use',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  trailing: const Icon(
                                      Icons.arrow_forward_ios_rounded),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                          child: Icon(Icons.arrow_back,
                              color: currentPage == 0
                                  ? Colors.black
                                  : Colors.white),
                          onPressed: () {
                            if (currentPage != 0) {
                              setState(() {
                                currentPage--;
                              });
                            }
                            _pageController.animateToPage(currentPage,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.ease);
                          }),
                      Text(
                          currentPage == 0
                              ? 'Stickers'
                              : currentPage == 1
                                  ? 'News'
                                  : 'Settings',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w900)),
                      CupertinoButton(
                          child: Icon(Icons.arrow_forward,
                              color: currentPage == 2
                                  ? Colors.black
                                  : Colors.white),
                          onPressed: () {
                            if (currentPage < 2) {
                              setState(() {
                                currentPage++;
                              });
                            }
                            _pageController.animateToPage(currentPage,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.ease);
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,
                          color: currentPage == 0 ? Colors.red : Colors.white),
                      Icon(Icons.circle,
                          color: currentPage == 1 ? Colors.red : Colors.white),
                      Icon(Icons.circle,
                          color: currentPage == 2 ? Colors.red : Colors.white),
                    ],
                  )
                ],
              ),
              // CupertinoButton(
              //   color: Colors.red,
              //   onPressed: () => Navigator.push(context,
              //       CupertinoPageRoute(builder: (_) => const StickersScreen())),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset('assets/7.webp', width: 100, height: 100),
              //       Text('Stickers',
              //           style: Theme.of(context).textTheme.bodyLarge),
              //     ],
              //   ),
              // ),
              // CupertinoButton(
              //   color: Colors.red,
              //   onPressed: () => Navigator.push(context,
              //       CupertinoPageRoute(builder: (_) => const NewsScreen())),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Icon(
              //         Icons.newspaper_rounded,
              //         size: 100,
              //       ),
              //       Text('News', style: Theme.of(context).textTheme.bodyLarge),
              //     ],
              //   ),
              // ),
              // CupertinoButton(
              //   color: Colors.red,
              //   onPressed: () => Navigator.push(context,
              //       CupertinoPageRoute(builder: (_) => const SettingsScreen())),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Icon(
              //         Icons.settings_rounded,
              //         size: 100,
              //       ),
              //       Text('Settings',
              //           style: Theme.of(context).textTheme.bodyLarge),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> copyAssetToDevice(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final List<int> bytes = data.buffer.asUint8List();
    final String tempPath = (await getTemporaryDirectory()).path;
    final String fileName = path.basename(assetPath);
    final File file = File('$tempPath/$fileName');
    await file.writeAsBytes(bytes);
    return file.path;
  }

  Future<void> deleteFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      print('Error while deleting file: $e');
    }
  }

  uploadStickers() async {
    const stickerAssets = {
      'assets/1.webp': ['😀'],
      'assets/2.webp': ['😃'],
      'assets/3.webp': ['😄'],
      'assets/4.webp': ['😁'],
      'assets/5.webp': ['😆'],
      'assets/6.webp': ['🥹'],
      'assets/7.webp': ['😅'],
      'assets/8.webp': ['😂'],
      'assets/9.webp': ['🤣'],
      'assets/10.webp': ['🥲'],
      'assets/11.webp': ['😌'],
      'assets/12.webp': ['😊'],
      'assets/13.webp': ['😇'],
      'assets/14.webp': ['🙂'],
      'assets/15.webp': ['🙃'],
      'assets/16.webp': ['😉'],
    };

    var stickerPack = WhatsappStickers(
      identifier: 'lionsTeamWhatsAppStickers',
      name: 'Car Stickers',
      publisher: 'Lion\'s Team Stickers',
      trayImageFileName: WhatsappStickerImage.fromAsset('assets/tray.png'),
      publisherWebsite: '',
      privacyPolicyWebsite: '',
      licenseAgreementWebsite: '',
    );

    stickerAssets.forEach((sticker, emojis) {
      stickerPack.addSticker(WhatsappStickerImage.fromAsset(sticker), emojis);
    });

    try {
      await stickerPack.sendToWhatsApp();
    } on WhatsappStickersException catch (e) {
      print(e.cause);
    }
  }
}


class Rdxa extends StatelessWidget {
  final String url;

  const Rdxa({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
      ),
    );
  }
}
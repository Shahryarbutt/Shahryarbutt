// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_translation_app/controller/conversationdb.dart';
import 'package:the_translation_app/controller/fav_db.dart';
import 'package:the_translation_app/model/conversationM.dart';
import 'package:the_translation_app/model/favouriteModel.dart';

import '../../model/Colors.dart';

class Favorite extends StatefulWidget {
  String data;
  Favorite({super.key, required this.data});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> with TickerProviderStateMixin {
  Favoritedb? dbHrt;
  ConversationDb? dbHrt2;
  late Future<List<FavoriteM>> hrtlist;
  late Future<List<ConversationM>> hrtlist2;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    dbHrt = Favoritedb();
    dbHrt2 = ConversationDb();
    load();
    load2();
  }

  load() async {
    hrtlist = dbHrt!.getbmilist();
  }

  load2() async {
    hrtlist2 = dbHrt2!.getbmilist();
  }

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: CColors().appbar,
        centerTitle: true,
        title: Text('Saved'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: FutureBuilder(
                  future: hrtlist,
                  builder: (context, AsyncSnapshot<List<FavoriteM>> snapshot) {
                    var data = snapshot.data;

                    if (data == null) {
                      return const Center(child: Text('not data found'));
                    } else {
                      var datalenght = data.length;
                      if (datalenght == 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 300,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                'No Record Found'.tr,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontFamily: 'Popins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            )
                          ],
                        );
                      } else {
                        return ListView.builder(
                            controller: _controller,
                            // reverse: true,
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, right: 12, left: 12),
                                child: Dismissible(
                                    direction: DismissDirection.endToStart,
                                    key: ValueKey<int>(
                                        snapshot.data![index].id!),
                                    child: InkWell(
                                      onTap: () {
                                        widget.data =
                                            snapshot.data![index].text1;
                                      },
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: 35,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey)),
                                                      child: Center(
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .first,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: 35,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey)),
                                                      child: Center(
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .second,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12.0),
                                                    child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            dbHrt!.delete(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .id!);
                                                            hrtlist = dbHrt!
                                                                .getbmilist();
                                                            snapshot.data!
                                                                .remove(snapshot
                                                                        .data![
                                                                    index]);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                  backgroundColor:
                                                                      CColors()
                                                                          .cardbgcolors,
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  margin: const EdgeInsetsDirectional
                                                                          .only(
                                                                      bottom:
                                                                          80,
                                                                      start: 80,
                                                                      end: 80),
                                                                  content: Text(
                                                                    'Removed from favorite'
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: CColors()
                                                                            .appbar),
                                                                  )),
                                                            );
                                                          });
                                                        },
                                                        child: const Icon(
                                                            Icons.favorite)),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 8),
                                                child: Text(
                                                  snapshot.data![index].text1,
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 12),
                                                child: Text(
                                                  snapshot.data![index].text,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                              );
                            });
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}

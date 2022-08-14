
import 'package:events_digital14/helper_class/globals.dart';
import 'package:events_digital14/model/events/events.dart';
import 'package:flutter/material.dart';
import 'package:events_digital14/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../custom_class/networking/api_constants.dart';


class EventsViewModel {

  List<EventsObj> eventsList = [];
  bool isApiRunning = false, isLoadMore = true;
  int page = 1;
  String searchTxt = "";

  getEvents(BuildContext context) async {

    try {

      isApiRunning = true;

      Map<String, dynamic> parameters = {};
      parameters["client_id"] = Globals.clientId;
      parameters["q"] = searchTxt;
      parameters["page"] = page.toString();

      var response = await Provider.of<APIProvider>(context, listen: false)
      .getDataObject(API.events, parameters);

      print("response1212");
      print(response);

      if(response["status"] != null) {
        if(response["status"].toString().toLowerCase() == "error") {
          return Future.error(response["message"]);
        }
      }

      EventsList obj = EventsList.fromJson(response);

      List<EventsObj> items = obj.events ?? [];

      if(items.isNotEmpty) {
        isLoadMore = true;
      }
      else {
        isLoadMore = false;
      }

      if(page == 1) {
        eventsList = [];
        eventsList = items;
      }
      else {
        eventsList.addAll(obj.events ?? []);
      }

      if(page == 5) {
        isLoadMore = false;
      }
      isApiRunning = false;

      return eventsList;
    }
    catch (e) {
      return Future.error(e.toString());
    }
  }

  getFavourites() async {

    final prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('favourites');

    Globals.favList = [];
    if(items != null) {
      Globals.favList = items;
    }
  }

  removeFavourites(int eId) async {

    if(eId == 0) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    Globals.favList.remove(eId.toString());
    prefs.setStringList("favourites", Globals.favList);
  }

  setFavourites(int eId) async {

    if(eId == 0) {
      return;
    }
    final prefs = await SharedPreferences.getInstance();

    Globals.favList.add(eId.toString());
    print(Globals.favList);
    prefs.setStringList("favourites", Globals.favList);
  }

}
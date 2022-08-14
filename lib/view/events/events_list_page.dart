
import 'package:events_digital14/custom_class/components/button_widget.dart';
import 'package:events_digital14/custom_class/components/text_widget.dart';
import 'package:events_digital14/helper_class/colors.dart';
import 'package:events_digital14/helper_class/size_config.dart';
import 'package:events_digital14/helper_class/utility.dart';
import 'package:events_digital14/model/events/events.dart';
import 'package:events_digital14/view/events/event_detail_page.dart';
import 'package:events_digital14/view_model/events/events_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:events_digital14/custom_class/components/text_field_widget.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper_class/globals.dart';


class EventsListPage extends StatefulWidget {

  const EventsListPage({Key? key,}) : super(key: key);

  @override
  State<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {

  TextEditingController txtSearchController = TextEditingController();

  EventsViewModel eventsViewModel = EventsViewModel();

  bool isFocus = false;

  @override
  void initState() {

    txtSearchController.addListener(_searchTextValue);

    eventsViewModel.eventsList = [];
    eventsViewModel.isApiRunning = false;
    eventsViewModel.page = 1;
    eventsViewModel.searchTxt = "";
    eventsViewModel.getFavourites();

    // getEvents();

    super.initState();
  }

  @override
  void dispose() {
    txtSearchController.dispose();
    super.dispose();
  }

  _searchTextValue() {
    print(txtSearchController.text);
    if(txtSearchController.text.length > 2 || txtSearchController.text.isEmpty) {
      eventsViewModel.searchTxt = txtSearchController.text;
      eventsViewModel.page = 1;
      getEvents();
    }
  }

  getEvents() async {
    await eventsViewModel.getEvents(
      context,
    );

    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          createTopSearchBar(),
          createListView(),
        ],
      ),
    );
  }

  createTopSearchBar() {
    return Container(
      color: AppColors.primaryColor,
      height: 112,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          horizontalSpace(context, 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Focus(
                child: SearchTextFieldWidget(
                  txtController: txtSearchController,
                ),
                onFocusChange: (focus) {
                  if(focus) {
                    isFocus = true;
                  }
                  else {
                    isFocus = false;
                  }
                },
              ),
            ),
          ),
          horizontalSpace(context, 8),
          isFocus == true ? TextButtonWidget(
            text: "Cancel",
            onPressed: () {
              print("45454");
              isFocus = false;
              txtSearchController.text = "";
              FocusManager.instance.primaryFocus?.unfocus();
            },
            textColor: AppColors.whiteColor,
            fontSize: 18,
          ) : const Text(""),
          horizontalSpace(context, 8),
        ],
      ),
    );
  }

  createListView() {

    if(eventsViewModel.eventsList.isEmpty && eventsViewModel.isLoadMore) {

      getEvents();

      return const Expanded(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }

    return createEventsListContainer();
  }

  createEventsListContainer() {

    return Expanded(
      child: MediaQuery.removePadding(
        context: context, removeTop: true,
        child: ListView.separated(
          physics: const RangeMaintainingScrollPhysics(),
          itemCount: eventsViewModel.isLoadMore ? eventsViewModel.eventsList.length + 1 : eventsViewModel.eventsList.length,
          itemBuilder: (BuildContext context, int index) {

            if(!eventsViewModel.isApiRunning && eventsViewModel.isLoadMore && index == eventsViewModel.eventsList.length) {
              eventsViewModel.page += 1;
              getEvents();
              return const SizedBox(height: 40, child: Center(child: CupertinoActivityIndicator(),),);
            }

            EventsObj eventObj = eventsViewModel.eventsList[index];

            DateTime tempDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(eventObj.datetimeUtc ?? "");

            return InkWell(
              child: Row(
                children: [
                  horizontalSpace(context, 16),
                  SizedBox(
                    height: 85, width: 85,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 6, left: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SizedBox(
                              height: 75, width: 75,
                              child: eventObj.performers![0].image != null ?
                              Image.network(eventObj.performers![0].image!, fit: BoxFit.cover,) :
                              Container(color: AppColors.greyColor.withOpacity(0.2),),
                            ),
                          ),
                        ),
                        Globals.favList.contains(eventObj.id.toString()) ? const Positioned(
                          top: 0, left: 0,
                          child: Icon(Icons.favorite, color: Colors.red,),
                        ) : Container(),
                      ],
                    ),
                  ),
                  horizontalSpace(context, 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        verticalSpace(context, 12),
                        TextWidget(
                          text: eventObj.title ?? "",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        verticalSpace(context, 4),
                        TextWidget(
                          text: "${eventObj.venue?.nameV2 ?? ""}, ${eventObj.venue?.state ?? ""}",
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                          fontSize: 16,
                        ),
                        verticalSpace(context, 4),
                        TextWidget(
                          text: DateFormat("EEE, dd MMM yyyy hh:mm a").format(tempDate),
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                          fontSize: 16,
                        ),
                        verticalSpace(context, 12),
                      ],
                    ),
                  ),
                  horizontalSpace(context, 16),
                ],
              ),
              onTap: () {
                // navigateToNextScreen(context, EventDetailPage(selectedObj: eventObj,));
                navigateToScreenWithCallback(
                  context,
                  EventDetailPage(selectedObj: eventObj,),
                  onCallbackReceived: (value) {
                    if(value == "refresh") {
                      setState((){});
                    }
                  },
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(color: AppColors.greyColor,);
          },
        ),
      ),
    );
  }
}
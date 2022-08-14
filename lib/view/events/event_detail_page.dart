import 'package:events_digital14/helper_class/colors.dart';
import 'package:events_digital14/helper_class/globals.dart';
import 'package:events_digital14/helper_class/size_config.dart';
import 'package:events_digital14/helper_class/utility.dart';
import 'package:events_digital14/model/events/events.dart';
import 'package:events_digital14/view_model/events/events_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../custom_class/components/text_widget.dart';

class EventDetailPage extends StatefulWidget {

  const EventDetailPage({Key? key, required this.selectedObj}) : super(key: key);

  final EventsObj selectedObj;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {

  EventsObj? eventObj;
  bool isFavourite = false;

  EventsViewModel eventsViewModel = EventsViewModel();


  @override
  void initState() {
    eventObj = widget.selectedObj;

    if(Globals.favList.contains(eventObj?.id.toString())) {
      isFavourite = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          createTopBar(),
          Container(
            height: 1,
            width: SizeConfig.screenHeight,
            color: AppColors.greyColor,
            margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
          ),
          createDetailContainer(),
        ],
      ),
    );
  }

  createTopBar() {
    return Container(
      height: 100,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(top: 36, bottom: 8, left: 8, right: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              navigateToPrevScreen(context, "refresh");
            },
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryColor,),
          ),
          horizontalSpace(context, 4),
          Expanded(
            child: TextWidget(
              text: eventObj?.shortTitle ?? "",
              fontWeight: FontWeight.bold,
              fontSize: 24,
              maxLines: 2,
            ),
          ),
          horizontalSpace(context, 4),
          IconButton(
            onPressed: () {
              isFavourite = !isFavourite;
              setState((){});
              if(!isFavourite) {
                eventsViewModel.removeFavourites(eventObj?.id ?? 0);
              }
              else {
                eventsViewModel.setFavourites(eventObj?.id ?? 0);
              }
            },
            icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border,
              color: isFavourite ? Colors.red : AppColors.greyColor, size: 28,),
          ),
        ],
      ),
    );
  }

  createDetailContainer() {

    DateTime tempDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(eventObj?.datetimeUtc ?? "");

    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: SizeConfig.screenWidth - 16,
                  height: SizeConfig.screenHeight * 0.32,
                  child: eventObj?.performers![0].image != null ?
                  Image.network(eventObj!.performers![0].image!, fit: BoxFit.cover,) :
                  Container(color: AppColors.greyColor.withOpacity(0.2),),
                ),
              ),
              verticalSpace(context, 24),
              TextWidget(
                text: DateFormat("EEE, dd MMM yyyy hh:mm a").format(tempDate),
                fontWeight: FontWeight.bold,
                fontSize: 22,
                maxLines: 2,
              ),
              verticalSpace(context, 12),
              TextWidget(
                text: "${eventObj?.venue?.nameV2 ?? ""}, ${eventObj?.venue?.state ?? ""}",
                fontWeight: FontWeight.w400,
                color: AppColors.greyColor,
                fontSize: 20,
              ),
              verticalSpace(context, 8),
            ],
          ),
        ),
      ),
    );
  }
}
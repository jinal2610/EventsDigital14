class EventsList {
  final List<EventsObj>? events;
  final Meta? meta;

  EventsList({
    this.events,
    this.meta,
  });

  EventsList.fromJson(Map<String, dynamic> json)
      : events = (json['events'] as List?)?.map((dynamic e) => EventsObj.fromJson(e as Map<String,dynamic>)).toList(),
        meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'events' : events?.map((e) => e.toJson()).toList(),
    'meta' : meta?.toJson()
  };
}

class EventsObj {
  final String? type;
  final int? id;
  final String? datetimeUtc;
  final Venue? venue;
  final bool? datetimeTbd;
  final List<Performers>? performers;
  final bool? isOpen;
  final List<dynamic>? links;
  final String? datetimeLocal;
  final bool? timeTbd;
  final String? shortTitle;
  final String? visibleUntilUtc;
  // final Stats? stats;
  // final List<Taxonomies>? taxonomies;
  final String? url;
  // final int? score;
  final String? announceDate;
  // final String? createdAt;
  final bool? dateTbd;
  final String? title;
  // final int? popularity;
  final String? description;
  final String? status;
  // final dynamic accessMethod;
  // final dynamic eventPromotion;
  // final Announcements? announcements;
  // final bool? conditional;
  // final dynamic enddatetimeUtc;
  // final List<dynamic>? themes;
  // final List<dynamic>? domainInformation;

  EventsObj({
    this.type,
    this.id,
    this.datetimeUtc,
    this.venue,
    this.datetimeTbd,
    this.performers,
    this.isOpen,
    this.links,
    this.datetimeLocal,
    this.timeTbd,
    this.shortTitle,
    this.visibleUntilUtc,
    // this.stats,
    // this.taxonomies,
    this.url,
    // this.score,
    this.announceDate,
    // this.createdAt,
    this.dateTbd,
    this.title,
    // this.popularity,
    this.description,
    this.status,
    // this.accessMethod,
    // this.eventPromotion,
    // this.announcements,
    // this.conditional,
    // this.enddatetimeUtc,
    // this.themes,
    // this.domainInformation,
  });

  EventsObj.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        id = json['id'] as int?,
        datetimeUtc = json['datetime_utc'] as String?,
        venue = (json['venue'] as Map<String,dynamic>?) != null ? Venue.fromJson(json['venue'] as Map<String,dynamic>) : null,
        datetimeTbd = json['datetime_tbd'] as bool?,
        performers = (json['performers'] as List?)?.map((dynamic e) => Performers.fromJson(e as Map<String,dynamic>)).toList(),
        isOpen = json['is_open'] as bool?,
        links = json['links'] as List?,
        datetimeLocal = json['datetime_local'] as String?,
        timeTbd = json['time_tbd'] as bool?,
        shortTitle = json['short_title'] as String?,
        visibleUntilUtc = json['visible_until_utc'] as String?,
        // stats = (json['stats'] as Map<String,dynamic>?) != null ? Stats.fromJson(json['stats'] as Map<String,dynamic>) : null,
        // taxonomies = (json['taxonomies'] as List?)?.map((dynamic e) => Taxonomies.fromJson(e as Map<String,dynamic>)).toList(),
        url = json['url'] as String?,
        // score = json['score'] as int?,
        announceDate = json['announce_date'] as String?,
        // createdAt = json['created_at'] as String?,
        dateTbd = json['date_tbd'] as bool?,
        title = json['title'] as String?,
        // popularity = json['popularity'] as int?,
        description = json['description'] as String?,
        status = json['status'] as String?;
        // accessMethod = json['access_method'],
        // eventPromotion = json['event_promotion'],
        // announcements = (json['announcements'] as Map<String,dynamic>?) != null ? Announcements.fromJson(json['announcements'] as Map<String,dynamic>) : null,
        // conditional = json['conditional'] as bool?,
        // enddatetimeUtc = json['enddatetime_utc'],
        // themes = json['themes'] as List?,
        // domainInformation = json['domain_information'] as List?;

  Map<String, dynamic> toJson() => {
    'type' : type,
    'id' : id,
    'datetime_utc' : datetimeUtc,
    'venue' : venue?.toJson(),
    'datetime_tbd' : datetimeTbd,
    'performers' : performers?.map((e) => e.toJson()).toList(),
    'is_open' : isOpen,
    'links' : links,
    'datetime_local' : datetimeLocal,
    'time_tbd' : timeTbd,
    'short_title' : shortTitle,
    'visible_until_utc' : visibleUntilUtc,
    // 'stats' : stats?.toJson(),
    // 'taxonomies' : taxonomies?.map((e) => e.toJson()).toList(),
    'url' : url,
    // 'score' : score,
    'announce_date' : announceDate,
    // 'created_at' : createdAt,
    'date_tbd' : dateTbd,
    'title' : title,
    // 'popularity' : popularity,
    'description' : description,
    'status' : status,
    // 'access_method' : accessMethod,
    // 'event_promotion' : eventPromotion,
    // 'announcements' : announcements?.toJson(),
    // 'conditional' : conditional,
    // 'enddatetime_utc' : enddatetimeUtc,
    // 'themes' : themes,
    // 'domain_information' : domainInformation
  };
}

class Venue {
  final String? state;
  final String? nameV2;
  final String? postalCode;
  final String? name;
  final List<dynamic>? links;
  final String? timezone;
  final String? url;
  // final int? score;
  final Location? location;
  final String? address;
  final String? country;
  final bool? hasUpcomingEvents;
  // final int? numUpcomingEvents;
  final String? city;
  final String? slug;
  final String? extendedAddress;
  // final int? id;
  // final int? popularity;
  final dynamic accessMethod;
  // final int? metroCode;
  // final int? capacity;
  final String? displayLocation;

  Venue({
    this.state,
    this.nameV2,
    this.postalCode,
    this.name,
    this.links,
    this.timezone,
    this.url,
    // this.score,
    this.location,
    this.address,
    this.country,
    this.hasUpcomingEvents,
    // this.numUpcomingEvents,
    this.city,
    this.slug,
    this.extendedAddress,
    // this.id,
    // this.popularity,
    this.accessMethod,
    // this.metroCode,
    // this.capacity,
    this.displayLocation,
  });

  Venue.fromJson(Map<String, dynamic> json)
      : state = json['state'] as String?,
        nameV2 = json['name_v2'] as String?,
        postalCode = json['postal_code'] as String?,
        name = json['name'] as String?,
        links = json['links'] as List?,
        timezone = json['timezone'] as String?,
        url = json['url'] as String?,
        // score = json['score'] as int?,
        location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null,
        address = json['address'] as String?,
        country = json['country'] as String?,
        hasUpcomingEvents = json['has_upcoming_events'] as bool?,
        // numUpcomingEvents = json['num_upcoming_events'] as int?,
        city = json['city'] as String?,
        slug = json['slug'] as String?,
        extendedAddress = json['extended_address'] as String?,
        // id = json['id'] as int?,
        // popularity = json['popularity'] as int?,
        accessMethod = json['access_method'],
        // metroCode = json['metro_code'] as int?,
        // capacity = json['capacity'] as int?,
        displayLocation = json['display_location'] as String?;

  Map<String, dynamic> toJson() => {
    'state' : state,
    'name_v2' : nameV2,
    'postal_code' : postalCode,
    'name' : name,
    'links' : links,
    'timezone' : timezone,
    'url' : url,
    // 'score' : score,
    'location' : location?.toJson(),
    'address' : address,
    'country' : country,
    'has_upcoming_events' : hasUpcomingEvents,
    // 'num_upcoming_events' : numUpcomingEvents,
    'city' : city,
    'slug' : slug,
    'extended_address' : extendedAddress,
    // 'id' : id,
    // 'popularity' : popularity,
    'access_method' : accessMethod,
    // 'metro_code' : metroCode,
    // 'capacity' : capacity,
    'display_location' : displayLocation
  };
}

class Location {
  final double? lat;
  final double? lon;

  Location({
    this.lat,
    this.lon,
  });

  Location.fromJson(Map<String, dynamic> json)
      : lat = json['lat'] as double?,
        lon = json['lon'] as double?;

  Map<String, dynamic> toJson() => {
    'lat' : lat,
    'lon' : lon
  };
}

class Performers {
  final String? type;
  final String? name;
  final String? image;
  final int? id;
  final Images? images;
  final dynamic divisions;
  final bool? hasUpcomingEvents;
  final bool? primary;
  // final Stats? stats;
  // final List<Taxonomies>? taxonomies;
  final String? imageAttribution;
  final String? url;
  // final int? score;
  final String? slug;
  final dynamic homeVenueId;
  final String? shortName;
  // final int? numUpcomingEvents;
  final dynamic colors;
  final String? imageLicense;
  // final int? popularity;
  final dynamic location;
  final String? imageRightsMessage;

  Performers({
    this.type,
    this.name,
    this.image,
    this.id,
    this.images,
    this.divisions,
    this.hasUpcomingEvents,
    this.primary,
    // this.stats,
    // this.taxonomies,
    this.imageAttribution,
    this.url,
    // this.score,
    this.slug,
    this.homeVenueId,
    this.shortName,
    // this.numUpcomingEvents,
    this.colors,
    this.imageLicense,
    // this.popularity,
    this.location,
    this.imageRightsMessage,
  });

  Performers.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        id = json['id'] as int?,
        images = (json['images'] as Map<String,dynamic>?) != null ? Images.fromJson(json['images'] as Map<String,dynamic>) : null,
        divisions = json['divisions'],
        hasUpcomingEvents = json['has_upcoming_events'] as bool?,
        primary = json['primary'] as bool?,
        // stats = (json['stats'] as Map<String,dynamic>?) != null ? Stats.fromJson(json['stats'] as Map<String,dynamic>) : null,
        // taxonomies = (json['taxonomies'] as List?)?.map((dynamic e) => Taxonomies.fromJson(e as Map<String,dynamic>)).toList(),
        imageAttribution = json['image_attribution'] as String?,
        url = json['url'] as String?,
        // score = json['score'] as int?,
        slug = json['slug'] as String?,
        homeVenueId = json['home_venue_id'],
        shortName = json['short_name'] as String?,
        // numUpcomingEvents = json['num_upcoming_events'] as int?,
        colors = json['colors'],
        imageLicense = json['image_license'] as String?,
        // popularity = json['popularity'] as int?,
        location = json['location'],
        imageRightsMessage = json['image_rights_message'] as String?;

  Map<String, dynamic> toJson() => {
    'type' : type,
    'name' : name,
    'image' : image,
    'id' : id,
    'images' : images?.toJson(),
    'divisions' : divisions,
    'has_upcoming_events' : hasUpcomingEvents,
    'primary' : primary,
    // 'stats' : stats?.toJson(),
    // 'taxonomies' : taxonomies?.map((e) => e.toJson()).toList(),
    'image_attribution' : imageAttribution,
    'url' : url,
    // 'score' : score,
    'slug' : slug,
    'home_venue_id' : homeVenueId,
    'short_name' : shortName,
    // 'num_upcoming_events' : numUpcomingEvents,
    'colors' : colors,
    'image_license' : imageLicense,
    // 'popularity' : popularity,
    'location' : location,
    'image_rights_message' : imageRightsMessage
  };
}

class Images {
  final String? huge;

  Images({
    this.huge,
  });

  Images.fromJson(Map<String, dynamic> json)
      : huge = json['huge'] as String?;

  Map<String, dynamic> toJson() => {
    'huge' : huge
  };
}

class Meta {
  final int? total;
  final int? took;
  final int? page;
  final int? perPage;
  final dynamic geolocation;

  Meta({
    this.total,
    this.took,
    this.page,
    this.perPage,
    this.geolocation,
  });

  Meta.fromJson(Map<String, dynamic> json)
      : total = json['total'] as int?,
        took = json['took'] as int?,
        page = json['page'] as int?,
        perPage = json['per_page'] as int?,
        geolocation = json['geolocation'];

  Map<String, dynamic> toJson() => {
    'total' : total,
    'took' : took,
    'page' : page,
    'per_page' : perPage,
    'geolocation' : geolocation
  };
}
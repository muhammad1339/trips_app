import 'dart:convert';

class TripModel {
    final List<Trip>? trips;

    TripModel({
        this.trips,
    });

    factory TripModel.fromJson(String str) => TripModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TripModel.fromMap(Map<String, dynamic> json) => TripModel(
        trips: json["trips"] == null ? [] : List<Trip>.from(json["trips"]!.map((x) => Trip.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "trips": trips == null ? [] : List<dynamic>.from(trips!.map((x) => x.toMap())),
    };
}

class Trip {
    final String? id;
    final String? status;
    final String? title;
    final Dates? dates;
    final List<Participant>? participants;
    final int? unfinishedTasks;
    final String? coverImage;

    Trip({
        this.id,
        this.status,
        this.title,
        this.dates,
        this.participants,
        this.unfinishedTasks,
        this.coverImage,
    });

    factory Trip.fromJson(String str) => Trip.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Trip.fromMap(Map<String, dynamic> json) => Trip(
        id: json["id"],
        status: json["status"],
        title: json["title"],
        dates: json["dates"] == null ? null : Dates.fromMap(json["dates"]),
        participants: json["participants"] == null ? [] : List<Participant>.from(json["participants"]!.map((x) => Participant.fromMap(x))),
        unfinishedTasks: json["unfinished_tasks"],
        coverImage: json["cover_image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "title": title,
        "dates": dates?.toMap(),
        "participants": participants == null ? [] : List<dynamic>.from(participants!.map((x) => x.toMap())),
        "unfinished_tasks": unfinishedTasks,
        "cover_image": coverImage,
    };
}

class Dates {
    final String? start;
    final String? end;

    Dates({
        this.start,
        this.end,
    });

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        start: json["start"],
        end: json["end"],
    );

    Map<String, dynamic> toMap() => {
        "start": start,
        "end": end,
    };
}

class Participant {
    final String? name;
    final String? avatarUrl;

    Participant({
        this.name,
        this.avatarUrl,
    });

    factory Participant.fromJson(String str) => Participant.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Participant.fromMap(Map<String, dynamic> json) => Participant(
        name: json["name"],
        avatarUrl: json["avatar_url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "avatar_url": avatarUrl,
    };
}

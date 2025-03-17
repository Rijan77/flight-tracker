class Model {
  Pagination? pagination;
  List<Data>? data;

  Model({this.pagination, this.data});

  Model.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? limit;
  int? offset;
  int? count;
  int? total;

  Pagination({this.limit, this.offset, this.count, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['offset'] = offset;
    data['count'] = count;
    data['total'] = total;
    return data;
  }
}

class Data {
  String? flightDate;
  String? flightStatus;
  Departure? departure;
  Arrival? arrival;
  Airline? airline;
  Flight? flight;
  dynamic aircraft;
  dynamic live;
  double? price;

  Data(
      {this.flightDate,
        this.flightStatus,
        this.departure,
        this.arrival,
        this.airline,
        this.flight,
        this.aircraft,
        this.live,
        this.price,
      });

  Data copyWith({double? price}) {
    return Data(
      flightDate: flightDate,
      flightStatus: flightStatus,
      departure: departure,
      arrival: arrival,
      airline: airline,
      flight: flight,
      aircraft: aircraft,
      live: live,
      price: price ?? this.price, // Add this field
    );
  }

  Data.fromJson(Map<String, dynamic> json) {
    flightDate = json['flight_date'];
    flightStatus = json['flight_status'];
    departure = json['departure'] != null
        ? Departure.fromJson(json['departure'])
        : null;
    arrival =
    json['arrival'] != null ?  Arrival.fromJson(json['arrival']) : null;
    airline =
    json['airline'] != null ?  Airline.fromJson(json['airline']) : null;
    flight =
    json['flight'] != null ?  Flight.fromJson(json['flight']) : null;
    aircraft = json['aircraft'];
    live = json['live'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['flight_date'] = flightDate;
    data['flight_status'] = flightStatus;
    if (departure != null) {
      data['departure'] = departure!.toJson();
    }
    if (arrival != null) {
      data['arrival'] = arrival!.toJson();
    }
    if (airline != null) {
      data['airline'] = airline!.toJson();
    }
    if (flight != null) {
      data['flight'] = flight!.toJson();
    }
    data['aircraft'] = aircraft;
    data['live'] = live;
    return data;
  }
}

class Departure {
  String? airport;
  String? timezone;
  String? country;
  String? iata;
  String? icao;
  String? terminal;
  String? gate;
  int? delay;
  String? scheduled;
  String? estimated;
  dynamic actual;
  dynamic estimatedRunway;
  dynamic actualRunway;

  Departure(
      {this.airport,
        this.country,
        this.timezone,
        this.iata,
        this.icao,
        this.terminal,
        this.gate,
        this.delay,
        this.scheduled,
        this.estimated,
        this.actual,
        this.estimatedRunway,
        this.actualRunway});

  Departure.fromJson(Map<String, dynamic> json) {
    airport = json['airport'];
    country =json ['country'];
    timezone = json['timezone'];
    iata = json['iata'];
    icao = json['icao'];
    terminal = json['terminal'];
    gate = json['gate'];
    delay = json['delay'];
    scheduled = json['scheduled'];
    estimated = json['estimated'];
    actual = json['actual'];
    estimatedRunway = json['estimated_runway'];
    actualRunway = json['actual_runway'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airport'] = airport;
    data['country'] = country;
    data['timezone'] = timezone;
    data['iata'] = iata;
    data['icao'] = icao;
    data['terminal'] = terminal;
    data['gate'] = gate;
    data['delay'] = delay;
    data['scheduled'] = scheduled;
    data['estimated'] = estimated;
    data['actual'] = actual;
    data['estimated_runway'] = estimatedRunway;
    data['actual_runway'] = actualRunway;
    return data;
  }
}

class Arrival {
  String? airport;
  String? timezone;
  String? iata;
  String? icao;
  String? terminal;
  String? gate;
  String? baggage;
  int? delay;
  String? scheduled;
  dynamic estimated;
  dynamic actual;
  dynamic estimatedRunway;
  dynamic actualRunway;

  Arrival(
      {this.airport,
        this.timezone,
        this.iata,
        this.icao,
        this.terminal,
        this.gate,
        this.baggage,
        this.delay,
        this.scheduled,
        this.estimated,
        this.actual,
        this.estimatedRunway,
        this.actualRunway});

  Arrival.fromJson(Map<String, dynamic> json) {
    airport = json['airport'];
    timezone = json['timezone'];
    iata = json['iata'];
    icao = json['icao'];
    terminal = json['terminal'];
    gate = json['gate'];
    baggage = json['baggage'];
    delay = json['delay'];
    scheduled = json['scheduled'];
    estimated = json['estimated'];
    actual = json['actual'];
    estimatedRunway = json['estimated_runway'];
    actualRunway = json['actual_runway'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airport'] = airport;
    data['timezone'] = timezone;
    data['iata'] = iata;
    data['icao'] = icao;
    data['terminal'] = terminal;
    data['gate'] = gate;
    data['baggage'] = baggage;
    data['delay'] = delay;
    data['scheduled'] = scheduled;
    data['estimated'] = estimated;
    data['actual'] = actual;
    data['estimated_runway'] = estimatedRunway;
    data['actual_runway'] = actualRunway;
    return data;
  }
}

class Airline {
  String? name;
  String? iata;
  String? icao;

  Airline({this.name, this.iata, this.icao});

  Airline.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iata = json['iata'];
    icao = json['icao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['iata'] = iata;
    data['icao'] = icao;
    return data;
  }
}

class Flight {
  String? number;
  String? iata;
  String? icao;
  Codeshared? codeshared;

  Flight({this.number, this.iata, this.icao, this.codeshared});

  Flight.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    iata = json['iata'];
    icao = json['icao'];
    codeshared = json['codeshared'] != null
        ? new Codeshared.fromJson(json['codeshared'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['iata'] = iata;
    data['icao'] = icao;
    if (this.codeshared != null) {
      data['codeshared'] = codeshared!.toJson();
    }
    return data;
  }
}

class Codeshared {
  String? airlineName;
  String? airlineIata;
  String? airlineIcao;
  String? flightNumber;
  String? flightIata;
  String? flightIcao;

  Codeshared(
      {this.airlineName,
        this.airlineIata,
        this.airlineIcao,
        this.flightNumber,
        this.flightIata,
        this.flightIcao});

  Codeshared.fromJson(Map<String, dynamic> json) {
    airlineName = json['airline_name'];
    airlineIata = json['airline_iata'];
    airlineIcao = json['airline_icao'];
    flightNumber = json['flight_number'];
    flightIata = json['flight_iata'];
    flightIcao = json['flight_icao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airline_name'] = airlineName;
    data['airline_iata'] = airlineIata;
    data['airline_icao'] = airlineIcao;
    data['flight_number'] = flightNumber;
    data['flight_iata'] = flightIata;
    data['flight_icao'] = flightIcao;
    return data;
  }
}


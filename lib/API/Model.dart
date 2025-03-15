class Model {
  Model({
    required this.pagination,
    required this.data,
  });

  Model.fromJson(Map<String, dynamic> json)
      : pagination = Pagination.fromJson(json['pagination']),
        data = (json['data'] as List).map((v) => Data.fromJson(v)).toList();

  final Pagination pagination;
  final List<Data> data;

  Model copyWith({
    Pagination? pagination,
    List<Data>? data,
  }) =>
      Model(
        pagination: pagination ?? this.pagination,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    return {
      'pagination': pagination.toJson(),
      'data': data.map((v) => v.toJson()).toList(),
    };
  }
}

class Data {
  Data({
    required this.flightDate,
    required this.flightStatus,
    required this.departure,
    required this.arrival,
    required this.airline,
    required this.flight,
    this.aircraft,
    this.live,
  });

  Data.fromJson(Map<String, dynamic> json)
      : flightDate = json['flight_date']?.toString() ?? 'Unknown',
        flightStatus = json['flight_status']?.toString() ?? 'Unknown',
        departure = Departure.fromJson(json['departure']),
        arrival = Arrival.fromJson(json['arrival']),
        airline = Airline.fromJson(json['airline']),
        flight = Flight.fromJson(json['flight']),
        aircraft = json['aircraft']?.toString(),
        live = json['live']?.toString() {
    print('Parsed Data: flightDate=$flightDate, flightStatus=$flightStatus, aircraft=$aircraft, live=$live');
  }

  final String flightDate;
  final String flightStatus;
  final Departure departure;
  final Arrival arrival;
  final Airline airline;
  final Flight flight;
  final String? aircraft;
  final String? live;

  Data copyWith({
    String? flightDate,
    String? flightStatus,
    Departure? departure,
    Arrival? arrival,
    Airline? airline,
    Flight? flight,
    String? aircraft,
    String? live,
  }) =>
      Data(
        flightDate: flightDate ?? this.flightDate,
        flightStatus: flightStatus ?? this.flightStatus,
        departure: departure ?? this.departure,
        arrival: arrival ?? this.arrival,
        airline: airline ?? this.airline,
        flight: flight ?? this.flight,
        aircraft: aircraft ?? this.aircraft,
        live: live ?? this.live,
      );

  Map<String, dynamic> toJson() {
    return {
      'flight_date': flightDate,
      'flight_status': flightStatus,
      'departure': departure.toJson(),
      'arrival': arrival.toJson(),
      'airline': airline.toJson(),
      'flight': flight.toJson(),
      'aircraft': aircraft,
      'live': live,
    };
  }
}

class Flight {
  Flight({
    required this.number,
    required this.iata,
    required this.icao,
    this.codeshared,
  });

  Flight.fromJson(Map<String, dynamic> json)
      : number = int.tryParse(json['number']?.toString() ?? '0') ?? 0,
        iata = json['iata']?.toString() ?? 'Unknown',
        icao = json['icao']?.toString() ?? 'Unknown',
        codeshared = json['codeshared']?.toString();

  final int number;
  final String iata;
  final String icao;
  final String? codeshared;

  Flight copyWith({
    int? number,
    String? iata,
    String? icao,
    String? codeshared,
  }) =>
      Flight(
        number: number ?? this.number,
        iata: iata ?? this.iata,
        icao: icao ?? this.icao,
        codeshared: codeshared ?? this.codeshared,
      );

  Map<String, dynamic> toJson() {
    return {
      'number': number.toString(),
      'iata': iata,
      'icao': icao,
      'codeshared': codeshared,
    };
  }
}

class Airline {
  Airline({
    required this.name,
    required this.iata,
    required this.icao,
  });

  Airline.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        iata = json['iata'],
        icao = json['icao'];

  final String name;
  final String iata;
  final String icao;

  Airline copyWith({
    String? name,
    String? iata,
    String? icao,
  }) =>
      Airline(
        name: name ?? this.name,
        iata: iata ?? this.iata,
        icao: icao ?? this.icao,
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iata': iata,
      'icao': icao,
    };
  }
}

class Arrival {
  Arrival({
    required this.airport,
    this.timezone, // Make timezone nullable
    required this.iata,
    required this.icao,
    required this.terminal,
    this.gate,
    this.baggage,
    this.delay,
    required this.scheduled,
    this.estimated,
    this.actual,
    this.estimatedRunway,
    this.actualRunway,
  });

  Arrival.fromJson(Map<String, dynamic> json)
      : airport = json['airport']?.toString() ?? 'Unknown',
        timezone = json['timezone']?.toString()?? "Unknown", // Handle null
        iata = json['iata']?.toString() ?? 'Unknown',
        icao = json['icao']?.toString() ?? 'Unknown',
        terminal = json['terminal']?.toString() ?? 'Unknown',
        gate = json['gate']?.toString(),
        baggage = json['baggage']?.toString(),
        delay = json['delay']?.toString(),
        scheduled = json['scheduled']?.toString() ?? 'Unknown',
        estimated = json['estimated']?.toString(),
        actual = json['actual']?.toString(),
        estimatedRunway = json['estimated_runway']?.toString(),
        actualRunway = json['actual_runway']?.toString() {
    print('Parsed Arrival: airport=$airport, timezone=$timezone, iata=$iata, icao=$icao, terminal=$terminal, gate=$gate, baggage=$baggage, delay=$delay, scheduled=$scheduled, estimated=$estimated, actual=$actual, estimatedRunway=$estimatedRunway, actualRunway=$actualRunway');
  }

  final String? airport;
  final String? timezone; // Make timezone nullable
  final String? iata;
  final String? icao;
  final String? terminal;
  final String? gate;
  final String? baggage;
  final String? delay;
  final String? scheduled;
  final String? estimated;
  final String? actual;
  final String? estimatedRunway;
  final String? actualRunway;

  Arrival copyWith({
    String? airport,
    String? timezone,
    String? iata,
    String? icao,
    String? terminal,
    String? gate,
    String? baggage,
    String? delay,
    String? scheduled,
    String? estimated,
    String? actual,
    String? estimatedRunway,
    String? actualRunway,
  }) =>
      Arrival(
        airport: airport ?? this.airport,
        timezone: timezone ?? this.timezone,
        iata: iata ?? this.iata,
        icao: icao ?? this.icao,
        terminal: terminal ?? this.terminal,
        gate: gate ?? this.gate,
        baggage: baggage ?? this.baggage,
        delay: delay ?? this.delay,
        scheduled: scheduled ?? this.scheduled,
        estimated: estimated ?? this.estimated,
        actual: actual ?? this.actual,
        estimatedRunway: estimatedRunway ?? this.estimatedRunway,
        actualRunway: actualRunway ?? this.actualRunway,
      );

  Map<String, dynamic> toJson() {
    return {
      'airport': airport,
      'timezone': timezone,
      'iata': iata,
      'icao': icao,
      'terminal': terminal,
      'gate': gate,
      'baggage': baggage,
      'delay': delay,
      'scheduled': scheduled,
      'estimated': estimated,
      'actual': actual,
      'estimated_runway': estimatedRunway,
      'actual_runway': actualRunway,
    };
  }
}

class Departure {
  Departure({
    required this.airport,
    this.timezone, // Make timezone nullable
    required this.iata,
    required this.icao,
    this.terminal,
    this.gate,
    this.delay,
    required this.scheduled,
    this.estimated,
    this.actual,
    this.estimatedRunway,
    this.actualRunway,
  });

  Departure.fromJson(Map<String, dynamic> json)
      : airport = json['airport']?.toString() ?? 'Unknown',
        timezone = json['timezone']?.toString()?? "Unknown", // Handle null
        iata = json['iata']?.toString() ?? 'Unknown',
        icao = json['icao']?.toString() ?? 'Unknown',
        terminal = json['terminal']?.toString(),
        gate = json['gate']?.toString(),
        delay = json['delay']?.toString(),
        scheduled = json['scheduled']?.toString() ?? 'Unknown',
        estimated = json['estimated']?.toString(),
        actual = json['actual']?.toString(),
        estimatedRunway = json['estimated_runway']?.toString(),
        actualRunway = json['actual_runway']?.toString() {
    print('Parsed Departure: airport=$airport, timezone=$timezone, iata=$iata, icao=$icao, terminal=$terminal, gate=$gate, delay=$delay, scheduled=$scheduled, estimated=$estimated, actual=$actual, estimatedRunway=$estimatedRunway, actualRunway=$actualRunway');
  }

  final String airport;
  final String? timezone; // Make timezone nullable
  final String? iata;
  final String? icao;
  final String? terminal;
  final String? gate;
  final String? delay;
  final String scheduled;
  final String? estimated;
  final String? actual;
  final String? estimatedRunway;
  final String? actualRunway;

  Departure copyWith({
    String? airport,
    String? timezone,
    String? iata,
    String? icao,
    String? terminal,
    String? gate,
    String? delay,
    String? scheduled,
    String? estimated,
    String? actual,
    String? estimatedRunway,
    String? actualRunway,
  }) =>
      Departure(
        airport: airport ?? this.airport,
        timezone: timezone ?? this.timezone,
        iata: iata ?? this.iata,
        icao: icao ?? this.icao,
        terminal: terminal ?? this.terminal,
        gate: gate ?? this.gate,
        delay: delay ?? this.delay,
        scheduled: scheduled ?? this.scheduled,
        estimated: estimated ?? this.estimated,
        actual: actual ?? this.actual,
        estimatedRunway: estimatedRunway ?? this.estimatedRunway,
        actualRunway: actualRunway ?? this.actualRunway,
      );

  Map<String, dynamic> toJson() {
    return {
      'airport': airport,
      'timezone': timezone,
      'iata': iata,
      'icao': icao,
      'terminal': terminal,
      'gate': gate,
      'delay': delay,
      'scheduled': scheduled,
      'estimated': estimated,
      'actual': actual,
      'estimated_runway': estimatedRunway,
      'actual_runway': actualRunway,
    };
  }
}

class Pagination {
  Pagination({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  Pagination.fromJson(Map<String, dynamic> json)
      : limit = json['limit'],
        offset = json['offset'],
        count = json['count'],
        total = json['total'];

  final num limit;
  final num offset;
  final num count;
  final num total;

  Pagination copyWith({
    num? limit,
    num? offset,
    num? count,
    num? total,
  }) =>
      Pagination(
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        count: count ?? this.count,
        total: total ?? this.total,
      );

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'offset': offset,
      'count': count,
      'total': total,
    };
  }
}

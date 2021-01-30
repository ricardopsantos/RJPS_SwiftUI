//
//  Created by Ricardo Santos
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

//swiftlint:disable file_length

import Foundation
import Combine
//
import AppWeatherDomain
import BaseDomain
import Utils

public class FetcherWeatherMock {
    private let session: URLSession
    public init(session: URLSession = .shared) {
        self.session = session
    }
}

extension FetcherWeatherMock: APIWeatherProtocol {
    public func weeklyWeatherForecast(request: WeatherRequestDto.WeeklyWeatherForecast, cache: CachePolicy) -> AnyPublisher<WeatherResponseDto.WeeklyForecastEntity, APIError> {
        let data = Data(weeklyWeatherForecastMock.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data)
            .decode(type: WeatherResponseDto.WeeklyForecastEntity.self, decoder: decoder)
            .mapError { error in
                DevTools.log(error: "Error : \(error)")
            return .parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
    public func currentWeatherForecast(request: WeatherRequestDto.CurrentWeatherForecast, cache: CachePolicy) -> AnyPublisher<WeatherResponseDto.CurrentWeatherForecastEntity, APIError> {
        let data = Data(currentWeatherForecastMock.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data).decode(type: WeatherResponseDto.CurrentWeatherForecastEntity.self, decoder: decoder).mapError { error in
            DevTools.log(error: "Error : \(error)")
            return .parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
}

private let currentWeatherForecastMock = """
{
  "coord": {
    "lon": -9.13,
    "lat": 38.72
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 28.46,
    "feels_like": 24.88,
    "temp_min": 27.78,
    "temp_max": 30,
    "pressure": 1010,
    "humidity": 40
  },
  "visibility": 10000,
  "wind": {
    "speed": 6.7,
    "deg": 320
  },
  "clouds": {
    "all": 0
  },
  "dt": 1596648377,
  "sys": {
    "type": 1,
    "id": 6901,
    "country": "PT",
    "sunrise": 1596606102,
    "sunset": 1596656594
  },
  "timezone": 3600,
  "id": 2267057,
  "name": "Lisbon",
  "cod": 200
}
"""

private let weeklyWeatherForecastMock = """
{
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1596650400,
      "main": {
        "temp": 27.15,
        "feels_like": 23.63,
        "temp_min": 25.77,
        "temp_max": 27.15,
        "pressure": 1010,
        "sea_level": 1011,
        "grnd_level": 1001,
        "humidity": 44,
        "temp_kf": 1.38
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 6.75,
        "deg": 334
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-05 18:00:00"
    },
    {
      "dt": 1596661200,
      "main": {
        "temp": 22.79,
        "feels_like": 21.12,
        "temp_min": 21.23,
        "temp_max": 22.79,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1002,
        "humidity": 57,
        "temp_kf": 1.56
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 4.1,
        "deg": 354
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-05 21:00:00"
    },
    {
      "dt": 1596672000,
      "main": {
        "temp": 20.34,
        "feels_like": 19.61,
        "temp_min": 19.79,
        "temp_max": 20.34,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1002,
        "humidity": 68,
        "temp_kf": 0.55
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 2.96,
        "deg": 344
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-06 00:00:00"
    },
    {
      "dt": 1596682800,
      "main": {
        "temp": 19.21,
        "feels_like": 19.3,
        "temp_min": 19.14,
        "temp_max": 19.21,
        "pressure": 1011,
        "sea_level": 1011,
        "grnd_level": 1001,
        "humidity": 76,
        "temp_kf": 0.07
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 2.11,
        "deg": 341
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-06 03:00:00"
    },
    {
      "dt": 1596693600,
      "main": {
        "temp": 18.58,
        "feels_like": 19.72,
        "temp_min": 18.58,
        "temp_max": 18.58,
        "pressure": 1011,
        "sea_level": 1011,
        "grnd_level": 1001,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 0.91,
        "deg": 350
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-06 06:00:00"
    },
    {
      "dt": 1596704400,
      "main": {
        "temp": 22.54,
        "feels_like": 23.1,
        "temp_min": 22.54,
        "temp_max": 22.54,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1002,
        "humidity": 62,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 1.45,
        "deg": 3
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-06 09:00:00"
    },
    {
      "dt": 1596715200,
      "main": {
        "temp": 26.3,
        "feels_like": 26.28,
        "temp_min": 26.3,
        "temp_max": 26.3,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1002,
        "humidity": 45,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.55,
        "deg": 282
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-06 12:00:00"
    },
    {
      "dt": 1596726000,
      "main": {
        "temp": 28.65,
        "feels_like": 27.64,
        "temp_min": 28.65,
        "temp_max": 28.65,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1002,
        "humidity": 44,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 3.85,
        "deg": 286
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-06 15:00:00"
    },
    {
      "dt": 1596736800,
      "main": {
        "temp": 24.86,
        "feels_like": 22.75,
        "temp_min": 24.86,
        "temp_max": 24.86,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1002,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 5.57,
        "deg": 325
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-06 18:00:00"
    },
    {
      "dt": 1596747600,
      "main": {
        "temp": 20.81,
        "feels_like": 19.98,
        "temp_min": 20.81,
        "temp_max": 20.81,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1004,
        "humidity": 71,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 3.68,
        "deg": 339
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-06 21:00:00"
    },
    {
      "dt": 1596758400,
      "main": {
        "temp": 19.26,
        "feels_like": 19.43,
        "temp_min": 19.26,
        "temp_max": 19.26,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1005,
        "humidity": 79,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 2.34,
        "deg": 352
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-07 00:00:00"
    },
    {
      "dt": 1596769200,
      "main": {
        "temp": 18.49,
        "feels_like": 19.09,
        "temp_min": 18.49,
        "temp_max": 18.49,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1004,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.94,
        "deg": 11
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-07 03:00:00"
    },
    {
      "dt": 1596780000,
      "main": {
        "temp": 17.99,
        "feels_like": 18.65,
        "temp_min": 17.99,
        "temp_max": 17.99,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1005,
        "humidity": 90,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 3
      },
      "wind": {
        "speed": 2.07,
        "deg": 350
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-07 06:00:00"
    },
    {
      "dt": 1596790800,
      "main": {
        "temp": 21.55,
        "feels_like": 20.9,
        "temp_min": 21.55,
        "temp_max": 21.55,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1007,
        "humidity": 70,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 6
      },
      "wind": {
        "speed": 3.68,
        "deg": 357
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-07 09:00:00"
    },
    {
      "dt": 1596801600,
      "main": {
        "temp": 26.54,
        "feels_like": 24.7,
        "temp_min": 26.54,
        "temp_max": 26.54,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1008,
        "humidity": 49,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 3
      },
      "wind": {
        "speed": 4.91,
        "deg": 338
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-07 12:00:00"
    },
    {
      "dt": 1596812400,
      "main": {
        "temp": 26.6,
        "feels_like": 23.56,
        "temp_min": 26.6,
        "temp_max": 26.6,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1007,
        "humidity": 52,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 7.14,
        "deg": 328
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-07 15:00:00"
    },
    {
      "dt": 1596823200,
      "main": {
        "temp": 23.78,
        "feels_like": 20.33,
        "temp_min": 23.78,
        "temp_max": 23.78,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1007,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 8.07,
        "deg": 337
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-07 18:00:00"
    },
    {
      "dt": 1596834000,
      "main": {
        "temp": 20.22,
        "feels_like": 18.42,
        "temp_min": 20.22,
        "temp_max": 20.22,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1009,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 6,
        "deg": 346
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-07 21:00:00"
    },
    {
      "dt": 1596844800,
      "main": {
        "temp": 19.08,
        "feels_like": 18.29,
        "temp_min": 19.08,
        "temp_max": 19.08,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1009,
        "humidity": 89,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 4.66,
        "deg": 347
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-08 00:00:00"
    },
    {
      "dt": 1596855600,
      "main": {
        "temp": 18.53,
        "feels_like": 18.37,
        "temp_min": 18.53,
        "temp_max": 18.53,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1008,
        "humidity": 89,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 7
      },
      "wind": {
        "speed": 3.44,
        "deg": 345
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-08 03:00:00"
    },
    {
      "dt": 1596866400,
      "main": {
        "temp": 18.16,
        "feels_like": 18.11,
        "temp_min": 18.16,
        "temp_max": 18.16,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1009,
        "humidity": 90,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 7
      },
      "wind": {
        "speed": 3.18,
        "deg": 335
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-08 06:00:00"
    },
    {
      "dt": 1596877200,
      "main": {
        "temp": 21.41,
        "feels_like": 20.88,
        "temp_min": 21.41,
        "temp_max": 21.41,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1009,
        "humidity": 70,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 2
      },
      "wind": {
        "speed": 3.43,
        "deg": 336
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-08 09:00:00"
    },
    {
      "dt": 1596888000,
      "main": {
        "temp": 25.56,
        "feels_like": 23.18,
        "temp_min": 25.56,
        "temp_max": 25.56,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1009,
        "humidity": 51,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 5.54,
        "deg": 327
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-08 12:00:00"
    },
    {
      "dt": 1596898800,
      "main": {
        "temp": 25.58,
        "feels_like": 22.35,
        "temp_min": 25.58,
        "temp_max": 25.58,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1008,
        "humidity": 50,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 6.61,
        "deg": 320
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-08 15:00:00"
    },
    {
      "dt": 1596909600,
      "main": {
        "temp": 23.05,
        "feels_like": 19.49,
        "temp_min": 23.05,
        "temp_max": 23.05,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1007,
        "humidity": 59,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 7.18,
        "deg": 328
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-08 18:00:00"
    },
    {
      "dt": 1596920400,
      "main": {
        "temp": 19.33,
        "feels_like": 18.1,
        "temp_min": 19.33,
        "temp_max": 19.33,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1008,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 4.69,
        "deg": 335
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-08 21:00:00"
    },
    {
      "dt": 1596931200,
      "main": {
        "temp": 18.49,
        "feels_like": 18.3,
        "temp_min": 18.49,
        "temp_max": 18.49,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1007,
        "humidity": 89,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 3.47,
        "deg": 327
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-09 00:00:00"
    },
    {
      "dt": 1596942000,
      "main": {
        "temp": 18.27,
        "feels_like": 17.77,
        "temp_min": 18.27,
        "temp_max": 18.27,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1006,
        "humidity": 89,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "clouds": {
        "all": 17
      },
      "wind": {
        "speed": 3.78,
        "deg": 328
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-09 03:00:00"
    },
    {
      "dt": 1596952800,
      "main": {
        "temp": 18.06,
        "feels_like": 17.89,
        "temp_min": 18.06,
        "temp_max": 18.06,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1006,
        "humidity": 89,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 22
      },
      "wind": {
        "speed": 3.2,
        "deg": 330
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-09 06:00:00"
    },
    {
      "dt": 1596963600,
      "main": {
        "temp": 20.53,
        "feels_like": 20.15,
        "temp_min": 20.53,
        "temp_max": 20.53,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1006,
        "humidity": 76,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 43
      },
      "wind": {
        "speed": 3.46,
        "deg": 331
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-09 09:00:00"
    },
    {
      "dt": 1596974400,
      "main": {
        "temp": 24.52,
        "feels_like": 22.93,
        "temp_min": 24.52,
        "temp_max": 24.52,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1006,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 26
      },
      "wind": {
        "speed": 4.95,
        "deg": 320
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-09 12:00:00"
    },
    {
      "dt": 1596985200,
      "main": {
        "temp": 24.37,
        "feels_like": 20.87,
        "temp_min": 24.37,
        "temp_max": 24.37,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1005,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 2
      },
      "wind": {
        "speed": 7.61,
        "deg": 321
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-09 15:00:00"
    },
    {
      "dt": 1596996000,
      "main": {
        "temp": 21.49,
        "feels_like": 17.68,
        "temp_min": 21.49,
        "temp_max": 21.49,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1005,
        "humidity": 70,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 8.16,
        "deg": 336
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-09 18:00:00"
    },
    {
      "dt": 1597006800,
      "main": {
        "temp": 18.3,
        "feels_like": 15.85,
        "temp_min": 18.3,
        "temp_max": 18.3,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1006,
        "humidity": 84,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 6.1,
        "deg": 346
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-09 21:00:00"
    },
    {
      "dt": 1597017600,
      "main": {
        "temp": 17.59,
        "feels_like": 15.48,
        "temp_min": 17.59,
        "temp_max": 17.59,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1005,
        "humidity": 87,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 5.53,
        "deg": 339
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-10 00:00:00"
    },
    {
      "dt": 1597028400,
      "main": {
        "temp": 17.27,
        "feels_like": 14.9,
        "temp_min": 17.27,
        "temp_max": 17.27,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1004,
        "humidity": 87,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 5
      },
      "wind": {
        "speed": 5.73,
        "deg": 339
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-08-10 03:00:00"
    },
    {
      "dt": 1597039200,
      "main": {
        "temp": 17.68,
        "feels_like": 15.77,
        "temp_min": 17.68,
        "temp_max": 17.68,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1004,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 20
      },
      "wind": {
        "speed": 5.1,
        "deg": 339
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-10 06:00:00"
    },
    {
      "dt": 1597050000,
      "main": {
        "temp": 20.02,
        "feels_like": 17.85,
        "temp_min": 20.02,
        "temp_max": 20.02,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1004,
        "humidity": 74,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 61
      },
      "wind": {
        "speed": 5.53,
        "deg": 337
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-10 09:00:00"
    },
    {
      "dt": 1597060800,
      "main": {
        "temp": 22.96,
        "feels_like": 20.43,
        "temp_min": 22.96,
        "temp_max": 22.96,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1004,
        "humidity": 61,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 37
      },
      "wind": {
        "speed": 5.93,
        "deg": 322
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-10 12:00:00"
    },
    {
      "dt": 1597071600,
      "main": {
        "temp": 22.84,
        "feels_like": 19.43,
        "temp_min": 22.84,
        "temp_max": 22.84,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1003,
        "humidity": 63,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 7.4,
        "deg": 319
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-08-10 15:00:00"
    }
  ],
  "city": {
    "id": 2267057,
    "name": "Lisbon",
    "coord": {
      "lat": 38.7167,
      "lon": -9.1333
    },
    "country": "PT",
    "population": 9999,
    "timezone": 3600,
    "sunrise": 1596606103,
    "sunset": 1596656595
  }
}
"""

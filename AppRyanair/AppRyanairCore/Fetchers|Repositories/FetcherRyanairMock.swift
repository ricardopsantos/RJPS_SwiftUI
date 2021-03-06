//
//  Created by Ricardo Santos on 19/08/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

//swiftlint:disable file_length

import Foundation
import Combine
//
import BaseDomain
import AppRyanairDomain
import Utils

public class FetcherRyanairMock {
    public init() { }
}

// MARK: - APIRyanairProtocol

extension FetcherRyanairMock: APIRyanairProtocol {
    public func stations(request: RequestDto.Stations, cache: CachePolicy) -> AnyPublisher<ResponseDto.Stations, APIError> {
        let data = Data(stationsMock.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data)
            .decode(type: ResponseDto.Stations.self, decoder: decoder)
            .mapError { error in
                DevTools.log(error: "Error : \(error)")
            return .parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }

    public func availability(request: RequestDto.Availability, cache: CachePolicy) -> AnyPublisher<ResponseDto.Availability, APIError> {
        let data = Data(availabilityMock.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data)
            .decode(type: ResponseDto.Availability.self, decoder: decoder)
            .mapError { error in
                DevTools.log(error: "Error : \(error)")
            return .parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
}

private let availabilityMock = """
{
  "termsOfUse": "https://www.ryanair.com/ie/en/corporate/terms-of-use=AGREED",
  "currency": "EUR",
  "currPrecision": 2,
  "routeGroup": "UKP",
  "tripType": "OTHER",
  "upgradeType": "PLUS",
  "trips": [
    {
      "origin": "DUB",
      "originName": "Dublin ",
      "destination": "STN",
      "destinationName": "London (Stansted)",
      "routeGroup": "UKP",
      "tripType": "OTHER",
      "upgradeType": "PLUS",
      "dates": [
        {
          "dateOut": "2021-08-06T00:00:00.000",
          "flights": [
            {
              "faresLeft": -1,
              "flightKey": "FR~ 202~ ~~DUB~08/06/2021 06:25~STN~08/06/2021 07:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YHAVYP55GA4FQ7UUVGCYKLC244PG4OKUG4ZMHCYDUYA6BPU6X526UD6XQMDO6GGM2D3SSGAMH5WWYX63R67RPIP5ROAQHCYCD22TO7TWF37VTCVJ4PNDZEM2GNZWQT2QQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 202",
                  "time": [
                    "2021-08-06T06:25:00.000",
                    "2021-08-06T07:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-06T05:25:00.000Z",
                    "2021-08-06T06:50:00.000Z"
                  ],
                  "duration": "01:25"
                }
              ],
              "flightNumber": "FR 202",
              "time": [
                "2021-08-06T06:25:00.000",
                "2021-08-06T07:50:00.000"
              ],
              "timeUTC": [
                "2021-08-06T05:25:00.000Z",
                "2021-08-06T06:50:00.000Z"
              ],
              "duration": "01:25"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 206~ ~~DUB~08/06/2021 08:20~STN~08/06/2021 09:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6XXYFAQZG3NWJH4UZRGYTFZB7RVRKDTOBNS6RL72DY4R7LG5IZ53OA5EXXWPLEAS565O64735S773F6P7B2YAKJV4XIWJIE3RUSZLACSK3RF43ZVYIHSS7RXPTRCWU6UEQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 206",
                  "time": [
                    "2021-08-06T08:20:00.000",
                    "2021-08-06T09:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-06T07:20:00.000Z",
                    "2021-08-06T08:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 206",
              "time": [
                "2021-08-06T08:20:00.000",
                "2021-08-06T09:40:00.000"
              ],
              "timeUTC": [
                "2021-08-06T07:20:00.000Z",
                "2021-08-06T08:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~2272~ ~~DUB~08/06/2021 11:55~STN~08/06/2021 13:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6VHN42FFGEPOBXNARKJGLUZ5ODKDKEDVHCU2N4SBNOMGNRBWF46MWYAFEMVL2XAURJ7CGCUZRKIEDNYYKIZQE2HKUYG5DWRFR5APRHYLY365DWDQW6ZLO4H2JVFY3INOLQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 2272",
                  "time": [
                    "2021-08-06T11:55:00.000",
                    "2021-08-06T13:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-06T10:55:00.000Z",
                    "2021-08-06T12:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 2272",
              "time": [
                "2021-08-06T11:55:00.000",
                "2021-08-06T13:15:00.000"
              ],
              "timeUTC": [
                "2021-08-06T10:55:00.000Z",
                "2021-08-06T12:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 294~ ~~DUB~08/06/2021 15:30~STN~08/06/2021 16:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6ZFSB7DJ6XB6S4QFI4UWSFFH77WCKT2BGWABITLEDDIDT67LFNH4AFQEU43C62NFEP3QYFQQSBUO2ELWUWH7225NDRTFONDNXRINCZU75F2UONWTRWH6ADNEW45JW5JLPQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 294",
                  "time": [
                    "2021-08-06T15:30:00.000",
                    "2021-08-06T16:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-06T14:30:00.000Z",
                    "2021-08-06T15:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 294",
              "time": [
                "2021-08-06T15:30:00.000",
                "2021-08-06T16:50:00.000"
              ],
              "timeUTC": [
                "2021-08-06T14:30:00.000Z",
                "2021-08-06T15:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 211~ ~~DUB~08/06/2021 16:30~STN~08/06/2021 17:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6X2CAC4XAINI7CBOWQYMY2QGKPEMRRZPFUG7GOGL2PNCCY52AA3VJTYQLSY2USCFQ5PIQFP4DDF6TUQ3UOUCQW7S7U25OARBFVJCXAM45ELPRXJFWWVNVSSCS4OZW3CR3Q",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 211",
                  "time": [
                    "2021-08-06T16:30:00.000",
                    "2021-08-06T17:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-06T15:30:00.000Z",
                    "2021-08-06T16:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 211",
              "time": [
                "2021-08-06T16:30:00.000",
                "2021-08-06T17:50:00.000"
              ],
              "timeUTC": [
                "2021-08-06T15:30:00.000Z",
                "2021-08-06T16:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 288~ ~~DUB~08/06/2021 18:55~STN~08/06/2021 20:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6RQYWH7UF4NXWFAFGXJU7FJFTJQDZLRRSXVMO4APH5GJT6QH3LEZVHRXW2TYBMAZWZ3664U4MCFROJ3H6PMWMYNKNJ3E4AHH2VJGGOLHLU4XRKUXHYNGBSKQ2QBGNMHCFQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 288",
                  "time": [
                    "2021-08-06T18:55:00.000",
                    "2021-08-06T20:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-06T17:55:00.000Z",
                    "2021-08-06T19:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 288",
              "time": [
                "2021-08-06T18:55:00.000",
                "2021-08-06T20:15:00.000"
              ],
              "timeUTC": [
                "2021-08-06T17:55:00.000Z",
                "2021-08-06T19:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 272~ ~~DUB~08/06/2021 20:20~STN~08/06/2021 21:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YY4IDFZKVDM7TTICTPX7U7TUHKTDWFQZ6E36PIPZHHAB2CDREXE46EPHB3WZH46T36LQGJHWZDLR4RAF7QAWLG7AU6KG5HJBDSUVRJYQKJBJSSUMYGAV6IM4COR6ZC24Q",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 272",
                  "time": [
                    "2021-08-06T20:20:00.000",
                    "2021-08-06T21:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-06T19:20:00.000Z",
                    "2021-08-06T20:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 272",
              "time": [
                "2021-08-06T20:20:00.000",
                "2021-08-06T21:40:00.000"
              ],
              "timeUTC": [
                "2021-08-06T19:20:00.000Z",
                "2021-08-06T20:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 298~ ~~DUB~08/06/2021 21:55~STN~08/06/2021 23:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6QT6QBIKVUREPIW2VHICKKO3C4KVIHIKHWPCZGE3LUT4ZGD6OJB6WVE3J42HCXVSOYQDQVEX7UJW6HGHFXXQONKU76XHOZMEXIF2P47A7LNMUTN34ZAJB24WFVI3GKRQJQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 298",
                  "time": [
                    "2021-08-06T21:55:00.000",
                    "2021-08-06T23:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-06T20:55:00.000Z",
                    "2021-08-06T22:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 298",
              "time": [
                "2021-08-06T21:55:00.000",
                "2021-08-06T23:15:00.000"
              ],
              "timeUTC": [
                "2021-08-06T20:55:00.000Z",
                "2021-08-06T22:15:00.000Z"
              ],
              "duration": "01:20"
            }
          ]
        },
        {
          "dateOut": "2021-08-07T00:00:00.000",
          "flights": [
            {
              "faresLeft": -1,
              "flightKey": "FR~ 202~ ~~DUB~08/07/2021 06:25~STN~08/07/2021 07:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YHAVYP55GA4FQ7UUVGCYKLC245OP5KJNWF6WQPNFRRDEU7HWBT4QRHSMR4W5YLQ5NM4YNJP4KWPONQYCMWUW5BUUWCLW4QRIC7IX46XW3BI4HSZDKG3CWST7UW24IZ3MQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 202",
                  "time": [
                    "2021-08-07T06:25:00.000",
                    "2021-08-07T07:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-07T05:25:00.000Z",
                    "2021-08-07T06:50:00.000Z"
                  ],
                  "duration": "01:25"
                }
              ],
              "flightNumber": "FR 202",
              "time": [
                "2021-08-07T06:25:00.000",
                "2021-08-07T07:50:00.000"
              ],
              "timeUTC": [
                "2021-08-07T05:25:00.000Z",
                "2021-08-07T06:50:00.000Z"
              ],
              "duration": "01:25"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 206~ ~~DUB~08/07/2021 08:20~STN~08/07/2021 09:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6XXYFAQZG3NWJH4UZRGYTFZB7RV6FSNWXQBMKLO2SYHM6FVHVG65IMRN65NFRULZOCACDNDUU3OKUXFJ46P3DM2JQAZIC2ZPSSZJ2YBSX2R5QWB6ITSGORD5XNJLOTVOFA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 206",
                  "time": [
                    "2021-08-07T08:20:00.000",
                    "2021-08-07T09:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-07T07:20:00.000Z",
                    "2021-08-07T08:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 206",
              "time": [
                "2021-08-07T08:20:00.000",
                "2021-08-07T09:40:00.000"
              ],
              "timeUTC": [
                "2021-08-07T07:20:00.000Z",
                "2021-08-07T08:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~2272~ ~~DUB~08/07/2021 11:55~STN~08/07/2021 13:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6VHN42FFGEPOBXNARKJGLUZ5ODK76QTIMEQVJ2LKIOZ3ARN6UZVPD7YIDXTRRJY6HOHZUGQWBHS3W3EDZ63E2255YP6BKANOADU5YLRL4TCT3ILJEHK4RNB4YMUUJRCG6Q",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 2272",
                  "time": [
                    "2021-08-07T11:55:00.000",
                    "2021-08-07T13:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-07T10:55:00.000Z",
                    "2021-08-07T12:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 2272",
              "time": [
                "2021-08-07T11:55:00.000",
                "2021-08-07T13:15:00.000"
              ],
              "timeUTC": [
                "2021-08-07T10:55:00.000Z",
                "2021-08-07T12:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 294~ ~~DUB~08/07/2021 13:55~STN~08/07/2021 15:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6ZFSB7DJ6XB6S4QFI4UWSFFH77WXSPF3VXZGCX7QUAMJRN2WCWQCHUM5XXTDHMVGYSX4UPSQ6Y7IWIBQ7VFZM4XJ5P3UBEHKWY47IA4NKJL5NPVDIO7RJO63E6SJE4YPGQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 294",
                  "time": [
                    "2021-08-07T13:55:00.000",
                    "2021-08-07T15:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-07T12:55:00.000Z",
                    "2021-08-07T14:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 294",
              "time": [
                "2021-08-07T13:55:00.000",
                "2021-08-07T15:15:00.000"
              ],
              "timeUTC": [
                "2021-08-07T12:55:00.000Z",
                "2021-08-07T14:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 211~ ~~DUB~08/07/2021 15:40~STN~08/07/2021 17:00~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6X2CAC4XAINI7CBOWQYMY2QGKPE66ARFMEOQFOQ4MQLKYKE772QDJTL5V5SN2JOCI73IH4UELFWV6OHFA7VP3E2HNHEFROWIFAHOIYO4XPH6XCYZKL5YWQFS5XKFANF6KA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 211",
                  "time": [
                    "2021-08-07T15:40:00.000",
                    "2021-08-07T17:00:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-07T14:40:00.000Z",
                    "2021-08-07T16:00:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 211",
              "time": [
                "2021-08-07T15:40:00.000",
                "2021-08-07T17:00:00.000"
              ],
              "timeUTC": [
                "2021-08-07T14:40:00.000Z",
                "2021-08-07T16:00:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 288~ ~~DUB~08/07/2021 17:15~STN~08/07/2021 18:35~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6RQYWH7UF4NXWFAFGXJU7FJFTJRETYUGHATNV3X2I64SWCCMXI3BTVQGQNDY62PP4AUQQK3TFGNVPERRZ4SKBL6R5SC5V57XIZNFJYIAWCMG5QJVW3GNKDBG7ATCNYZM5A",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 288",
                  "time": [
                    "2021-08-07T17:15:00.000",
                    "2021-08-07T18:35:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-07T16:15:00.000Z",
                    "2021-08-07T17:35:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 288",
              "time": [
                "2021-08-07T17:15:00.000",
                "2021-08-07T18:35:00.000"
              ],
              "timeUTC": [
                "2021-08-07T16:15:00.000Z",
                "2021-08-07T17:35:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 272~ ~~DUB~08/07/2021 20:20~STN~08/07/2021 21:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YY4IDFZKVDM7TTICTPX7U7TUHK7FR6AZ46KASBFJCNTOEC23MUFIHELOJZ4S6K6LJNXKRMS7JO776LMIETLOLTNTHVCSNQI5W6LPWPLGDN7DKSP2XGFD5APAZ7KNUURRQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 272",
                  "time": [
                    "2021-08-07T20:20:00.000",
                    "2021-08-07T21:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-07T19:20:00.000Z",
                    "2021-08-07T20:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 272",
              "time": [
                "2021-08-07T20:20:00.000",
                "2021-08-07T21:40:00.000"
              ],
              "timeUTC": [
                "2021-08-07T19:20:00.000Z",
                "2021-08-07T20:40:00.000Z"
              ],
              "duration": "01:20"
            }
          ]
        },
        {
          "dateOut": "2021-08-08T00:00:00.000",
          "flights": [
            {
              "faresLeft": -1,
              "flightKey": "FR~ 202~ ~~DUB~08/08/2021 06:25~STN~08/08/2021 07:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YHAVYP55GA4FQ7UUVGCYKLC245DBQRSLL7TL2R6E5SUKZMSJGX3V3WSI7EHXATIND3VN4XMQCXKE6ZTLTSND557AKTDO6AY5OLN2MXJEV4MVGGZ2EGBE5R7FFBVVCL6WQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 202",
                  "time": [
                    "2021-08-08T06:25:00.000",
                    "2021-08-08T07:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-08T05:25:00.000Z",
                    "2021-08-08T06:50:00.000Z"
                  ],
                  "duration": "01:25"
                }
              ],
              "flightNumber": "FR 202",
              "time": [
                "2021-08-08T06:25:00.000",
                "2021-08-08T07:50:00.000"
              ],
              "timeUTC": [
                "2021-08-08T05:25:00.000Z",
                "2021-08-08T06:50:00.000Z"
              ],
              "duration": "01:25"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~2272~ ~~DUB~08/08/2021 11:50~STN~08/08/2021 13:10~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6VHN42FFGEPOBXNARKJGLUZ5ODLPXOHIGPWIKE63WWCP3YKA5TUUEMZOJ5HQ7ITB5Y7F52DKTWQAO4WXLW6575QEYOME2EOZLHXRJCGWEGWGCEV36GJ46CAVG7QPW7CWSA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 2272",
                  "time": [
                    "2021-08-08T11:50:00.000",
                    "2021-08-08T13:10:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-08T10:50:00.000Z",
                    "2021-08-08T12:10:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 2272",
              "time": [
                "2021-08-08T11:50:00.000",
                "2021-08-08T13:10:00.000"
              ],
              "timeUTC": [
                "2021-08-08T10:50:00.000Z",
                "2021-08-08T12:10:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 294~ ~~DUB~08/08/2021 15:30~STN~08/08/2021 16:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6ZFSB7DJ6XB6S4QFI4UWSFFH77XSR57F3233XUAGDZVOBO4N3FE2Q4BDHXVVEFMUDJOYTFAWFQ7WILFPDFHL62YNUWPYZY3CQ4PG3DCTD2CNUYMCBU63OAJLAFRZ5H7N6A",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 294",
                  "time": [
                    "2021-08-08T15:30:00.000",
                    "2021-08-08T16:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-08T14:30:00.000Z",
                    "2021-08-08T15:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 294",
              "time": [
                "2021-08-08T15:30:00.000",
                "2021-08-08T16:50:00.000"
              ],
              "timeUTC": [
                "2021-08-08T14:30:00.000Z",
                "2021-08-08T15:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 211~ ~~DUB~08/08/2021 16:30~STN~08/08/2021 17:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6X2CAC4XAINI7CBOWQYMY2QGKPEBP2XBBVELHM6Y7D4O5YLHZLXJEOBBRG6C5KTTNSWL5J27GV2JI2YRFCJYC4TOQFNRNAERIWEXWCBXTXWT3E2JRFSZT57QXRGLGMP2GA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 211",
                  "time": [
                    "2021-08-08T16:30:00.000",
                    "2021-08-08T17:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-08T15:30:00.000Z",
                    "2021-08-08T16:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 211",
              "time": [
                "2021-08-08T16:30:00.000",
                "2021-08-08T17:50:00.000"
              ],
              "timeUTC": [
                "2021-08-08T15:30:00.000Z",
                "2021-08-08T16:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 288~ ~~DUB~08/08/2021 18:55~STN~08/08/2021 20:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6RQYWH7UF4NXWFAFGXJU7FJFTJRKE4CLKQDWJAHPYRA2VXEUXK5WZZ3R7IGZJBWY34KLGQWPOCLDARIU5X53VNULRH4JV74DJ4FECSIWXBXTG6DAYV6FJPCQ3N7XXQYX5Q",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 288",
                  "time": [
                    "2021-08-08T18:55:00.000",
                    "2021-08-08T20:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-08T17:55:00.000Z",
                    "2021-08-08T19:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 288",
              "time": [
                "2021-08-08T18:55:00.000",
                "2021-08-08T20:15:00.000"
              ],
              "timeUTC": [
                "2021-08-08T17:55:00.000Z",
                "2021-08-08T19:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 272~ ~~DUB~08/08/2021 20:20~STN~08/08/2021 21:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YY4IDFZKVDM7TTICTPX7U7TUHKMSXXWEE64KV6QXOJNR3QFGBABTEAWGRGW5PM5T474KEHE2TK7QXHF3QCP4SWQQ4LBJCV4PKT7ANPESOG4YQFFEP5YE4MNTZ3T3LHWLA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 272",
                  "time": [
                    "2021-08-08T20:20:00.000",
                    "2021-08-08T21:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-08T19:20:00.000Z",
                    "2021-08-08T20:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 272",
              "time": [
                "2021-08-08T20:20:00.000",
                "2021-08-08T21:40:00.000"
              ],
              "timeUTC": [
                "2021-08-08T19:20:00.000Z",
                "2021-08-08T20:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 298~ ~~DUB~08/08/2021 21:55~STN~08/08/2021 23:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6QT6QBIKVUREPIW2VHICKKO3C4KGHRZ3BQ3LRG2EMX5N67MVL7PRLNE5SCB67AA66GNF24RXJQIMSBMERHKCQX3GGBL75J7SKQW6QZXKOOBUVUJMRR3FO7Q2V2LU3PGXSA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 298",
                  "time": [
                    "2021-08-08T21:55:00.000",
                    "2021-08-08T23:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-08T20:55:00.000Z",
                    "2021-08-08T22:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 298",
              "time": [
                "2021-08-08T21:55:00.000",
                "2021-08-08T23:15:00.000"
              ],
              "timeUTC": [
                "2021-08-08T20:55:00.000Z",
                "2021-08-08T22:15:00.000Z"
              ],
              "duration": "01:20"
            }
          ]
        },
        {
          "dateOut": "2021-08-09T00:00:00.000",
          "flights": [
            {
              "faresLeft": -1,
              "flightKey": "FR~ 202~ ~~DUB~08/09/2021 06:25~STN~08/09/2021 07:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YHAVYP55GA4FQ7UUVGCYKLC245JQ2ZUBTRY7KGDSNVTZQC5S5G7ON7O4UTVCCYBMNBJCWZ4AO52VRFCLCH263KDVLZRGD56Y6C573O7AV3GUB27NW272SMZDKSPJE5CGQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 202",
                  "time": [
                    "2021-08-09T06:25:00.000",
                    "2021-08-09T07:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-09T05:25:00.000Z",
                    "2021-08-09T06:50:00.000Z"
                  ],
                  "duration": "01:25"
                }
              ],
              "flightNumber": "FR 202",
              "time": [
                "2021-08-09T06:25:00.000",
                "2021-08-09T07:50:00.000"
              ],
              "timeUTC": [
                "2021-08-09T05:25:00.000Z",
                "2021-08-09T06:50:00.000Z"
              ],
              "duration": "01:25"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 206~ ~~DUB~08/09/2021 08:20~STN~08/09/2021 09:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6XXYFAQZG3NWJH4UZRGYTFZB7RUTQJU3QK5JRTCXY2J5FNPNNTFXBRPTUNGJPIQG3TCDG522H4AMGWET5EYQ5L25TSUTK5TC7B2RXZGK3RY7PN7WBOXRJGQK5ZADETDMCA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 206",
                  "time": [
                    "2021-08-09T08:20:00.000",
                    "2021-08-09T09:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-09T07:20:00.000Z",
                    "2021-08-09T08:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 206",
              "time": [
                "2021-08-09T08:20:00.000",
                "2021-08-09T09:40:00.000"
              ],
              "timeUTC": [
                "2021-08-09T07:20:00.000Z",
                "2021-08-09T08:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~2272~ ~~DUB~08/09/2021 11:55~STN~08/09/2021 13:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6VHN42FFGEPOBXNARKJGLUZ5ODLPJESRNRZLF54RCVW6NVLWX273NI6BCVUL4CZJY2WWEDTV4BO7I36224U3FELRCLQTHRNLXKF3ZSW7VEJMQIZTDC6EJYBBYYQVUV7ORQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 2272",
                  "time": [
                    "2021-08-09T11:55:00.000",
                    "2021-08-09T13:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-09T10:55:00.000Z",
                    "2021-08-09T12:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 2272",
              "time": [
                "2021-08-09T11:55:00.000",
                "2021-08-09T13:15:00.000"
              ],
              "timeUTC": [
                "2021-08-09T10:55:00.000Z",
                "2021-08-09T12:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 294~ ~~DUB~08/09/2021 15:30~STN~08/09/2021 16:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6ZFSB7DJ6XB6S4QFI4UWSFFH77WJU37TSFRUTVMKDJXR7NABENJF2T5WPCJWIRAU75WKPKLH54N5WLCNC4RTPFTRH2QUSXFKU4WGC62ACZ3SUC4GZV5KGEVY3AJCJVJFSA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 294",
                  "time": [
                    "2021-08-09T15:30:00.000",
                    "2021-08-09T16:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-09T14:30:00.000Z",
                    "2021-08-09T15:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 294",
              "time": [
                "2021-08-09T15:30:00.000",
                "2021-08-09T16:50:00.000"
              ],
              "timeUTC": [
                "2021-08-09T14:30:00.000Z",
                "2021-08-09T15:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 211~ ~~DUB~08/09/2021 16:30~STN~08/09/2021 17:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6X2CAC4XAINI7CBOWQYMY2QGKPFRVFBYW4JN6HMJ4ITB6N3GNSHCZCTVHTBEPEBZFCZ7BUM4SRW4CMFQL3UIXESVCG3TGNY2LKC36VFX4F3VYIDMSMOU3DSPBTLYLUFCJQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 211",
                  "time": [
                    "2021-08-09T16:30:00.000",
                    "2021-08-09T17:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-09T15:30:00.000Z",
                    "2021-08-09T16:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 211",
              "time": [
                "2021-08-09T16:30:00.000",
                "2021-08-09T17:50:00.000"
              ],
              "timeUTC": [
                "2021-08-09T15:30:00.000Z",
                "2021-08-09T16:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 288~ ~~DUB~08/09/2021 18:55~STN~08/09/2021 20:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6RQYWH7UF4NXWFAFGXJU7FJFTJRKC6OCW7ONVW4SKL4FOPS57TIISM5U62OMY2RBEWBELMWN3THYLRBBAUYBJQUVX4I6AEYTT3UJOE5SZ32ZETTICQMB37SXOMFGW3IJYA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 288",
                  "time": [
                    "2021-08-09T18:55:00.000",
                    "2021-08-09T20:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-09T17:55:00.000Z",
                    "2021-08-09T19:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 288",
              "time": [
                "2021-08-09T18:55:00.000",
                "2021-08-09T20:15:00.000"
              ],
              "timeUTC": [
                "2021-08-09T17:55:00.000Z",
                "2021-08-09T19:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 272~ ~~DUB~08/09/2021 20:20~STN~08/09/2021 21:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YY4IDFZKVDM7TTICTPX7U7TUHKU3FFJLTHAEN3LRZZ6BTGONOCFEQSYRCHB7WP42YYNTUGGQU2R5KUAKUTUSKQ4DL5KKJ4DUUUKYTTN5QOD4VCD6GTERU3QMDSA5LRJ3A",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 272",
                  "time": [
                    "2021-08-09T20:20:00.000",
                    "2021-08-09T21:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-09T19:20:00.000Z",
                    "2021-08-09T20:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 272",
              "time": [
                "2021-08-09T20:20:00.000",
                "2021-08-09T21:40:00.000"
              ],
              "timeUTC": [
                "2021-08-09T19:20:00.000Z",
                "2021-08-09T20:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 298~ ~~DUB~08/09/2021 21:55~STN~08/09/2021 23:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6QT6QBIKVUREPIW2VHICKKO3C4L543P6JKBGQ3WAGGIJCBHMHU5FPJZN7I7QYWYDTQ5AQZZVPVGZSFZ6BM4SL27JW55ZRRR7WUJ5PJ7TEIQRR37NZHKOGT66EWACWKRCLQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 298",
                  "time": [
                    "2021-08-09T21:55:00.000",
                    "2021-08-09T23:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-09T20:55:00.000Z",
                    "2021-08-09T22:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 298",
              "time": [
                "2021-08-09T21:55:00.000",
                "2021-08-09T23:15:00.000"
              ],
              "timeUTC": [
                "2021-08-09T20:55:00.000Z",
                "2021-08-09T22:15:00.000Z"
              ],
              "duration": "01:20"
            }
          ]
        },
        {
          "dateOut": "2021-08-10T00:00:00.000",
          "flights": [
            {
              "faresLeft": -1,
              "flightKey": "FR~ 202~ ~~DUB~08/10/2021 06:25~STN~08/10/2021 07:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YHAVYP55GA4FQ7UUVGCYKLC244KI2QPZ5HMLWASIIFOCYMUJPOGGW4LC4OEI4NM2FHYAQL2Y3MOTNAKWT3UG7N5QZLOTS3TETY5QFLKXUABWRSCHVSJR5T5W24DZCYHIQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 202",
                  "time": [
                    "2021-08-10T06:25:00.000",
                    "2021-08-10T07:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-10T05:25:00.000Z",
                    "2021-08-10T06:50:00.000Z"
                  ],
                  "duration": "01:25"
                }
              ],
              "flightNumber": "FR 202",
              "time": [
                "2021-08-10T06:25:00.000",
                "2021-08-10T07:50:00.000"
              ],
              "timeUTC": [
                "2021-08-10T05:25:00.000Z",
                "2021-08-10T06:50:00.000Z"
              ],
              "duration": "01:25"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 206~ ~~DUB~08/10/2021 08:15~STN~08/10/2021 09:35~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6XXYFAQZG3NWJH4UZRGYTFZB7RU33LA5YSIAPLAN4WZNRZZHW6VO3TT5JJ2OFZIVXYOAIJ3YY5QC2LVWGSRT6TRVEGGH3OAGBGLNW7GXZM2WGWEXNUXOIUYCYAZCCMBSQQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 206",
                  "time": [
                    "2021-08-10T08:15:00.000",
                    "2021-08-10T09:35:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-10T07:15:00.000Z",
                    "2021-08-10T08:35:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 206",
              "time": [
                "2021-08-10T08:15:00.000",
                "2021-08-10T09:35:00.000"
              ],
              "timeUTC": [
                "2021-08-10T07:15:00.000Z",
                "2021-08-10T08:35:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 294~ ~~DUB~08/10/2021 15:30~STN~08/10/2021 16:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6ZFSB7DJ6XB6S4QFI4UWSFFH77WL4EXXC7XHRWACDS5RVMZN6VXQPIJE3LYEAMXIVXONNYIWHJRJQUQD3B4ZMC2A3RA2GYKAE6DU7PIRKJ3JXFXNY3HEKTBSEU7ZFSEBTQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 294",
                  "time": [
                    "2021-08-10T15:30:00.000",
                    "2021-08-10T16:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-10T14:30:00.000Z",
                    "2021-08-10T15:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 294",
              "time": [
                "2021-08-10T15:30:00.000",
                "2021-08-10T16:50:00.000"
              ],
              "timeUTC": [
                "2021-08-10T14:30:00.000Z",
                "2021-08-10T15:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 211~ ~~DUB~08/10/2021 16:30~STN~08/10/2021 17:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6X2CAC4XAINI7CBOWQYMY2QGKPEKFAGMHK3VD4AKTI5KJU34T7RQGGVQHUMJQUJQPMLSJMQDI75LQGFDFYQ3ACQPNGITAJWCDSBNNT3K4QSMYI6BDVAJDYIJDBZKKYWPBQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 211",
                  "time": [
                    "2021-08-10T16:30:00.000",
                    "2021-08-10T17:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-10T15:30:00.000Z",
                    "2021-08-10T16:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 211",
              "time": [
                "2021-08-10T16:30:00.000",
                "2021-08-10T17:50:00.000"
              ],
              "timeUTC": [
                "2021-08-10T15:30:00.000Z",
                "2021-08-10T16:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 288~ ~~DUB~08/10/2021 18:55~STN~08/10/2021 20:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6RQYWH7UF4NXWFAFGXJU7FJFTJQYVCJUGULIYBNQYF2ALKOTSW2RDS2UC75HS5KO6QKFEFWRLJGGOK3QOAZYRBUEGBACMWPHCBFUCSZ4RYDL7UV54GBUKY5YDX6AOXMUPA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 288",
                  "time": [
                    "2021-08-10T18:55:00.000",
                    "2021-08-10T20:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-10T17:55:00.000Z",
                    "2021-08-10T19:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 288",
              "time": [
                "2021-08-10T18:55:00.000",
                "2021-08-10T20:15:00.000"
              ],
              "timeUTC": [
                "2021-08-10T17:55:00.000Z",
                "2021-08-10T19:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 272~ ~~DUB~08/10/2021 20:20~STN~08/10/2021 21:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YY4IDFZKVDM7TTICTPX7U7TUHLXWTE2UVTOER5RCFFGNYTGJAFWWEONH3RJP2WGPCSUO4TX7TICQOW2WS2P6YLRO4OA2NMTLJ4ADVTSVCXGEO2XHLRGDATVYMA7LEW2UA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 272",
                  "time": [
                    "2021-08-10T20:20:00.000",
                    "2021-08-10T21:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-10T19:20:00.000Z",
                    "2021-08-10T20:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 272",
              "time": [
                "2021-08-10T20:20:00.000",
                "2021-08-10T21:40:00.000"
              ],
              "timeUTC": [
                "2021-08-10T19:20:00.000Z",
                "2021-08-10T20:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 298~ ~~DUB~08/10/2021 21:55~STN~08/10/2021 23:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6QT6QBIKVUREPIW2VHICKKO3C4L5GKDEO5GEVUPWFE5XKFA72G6I2LII4H7TGH5ACT323EMNRAO5XGWR4TF252OJY6LB4JXIXXQUK2DZI76UMLNPYU3CQSJXYFLIQP77FQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 298",
                  "time": [
                    "2021-08-10T21:55:00.000",
                    "2021-08-10T23:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-10T20:55:00.000Z",
                    "2021-08-10T22:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 298",
              "time": [
                "2021-08-10T21:55:00.000",
                "2021-08-10T23:15:00.000"
              ],
              "timeUTC": [
                "2021-08-10T20:55:00.000Z",
                "2021-08-10T22:15:00.000Z"
              ],
              "duration": "01:20"
            }
          ]
        },
        {
          "dateOut": "2021-08-11T00:00:00.000",
          "flights": [
            {
              "faresLeft": -1,
              "flightKey": "FR~ 202~ ~~DUB~08/11/2021 06:25~STN~08/11/2021 07:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YHAVYP55GA4FQ7UUVGCYKLC2447ZONZLVSIEG4C4HXAD5XLSBPLOUSVRARGSKGWYA2BBRFYRVYLZCW2R26Q6NO26Q4EB65GJIFMJMLUD7DYXXKFHBCV26ALNOZQYNOKLQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 202",
                  "time": [
                    "2021-08-11T06:25:00.000",
                    "2021-08-11T07:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-11T05:25:00.000Z",
                    "2021-08-11T06:50:00.000Z"
                  ],
                  "duration": "01:25"
                }
              ],
              "flightNumber": "FR 202",
              "time": [
                "2021-08-11T06:25:00.000",
                "2021-08-11T07:50:00.000"
              ],
              "timeUTC": [
                "2021-08-11T05:25:00.000Z",
                "2021-08-11T06:50:00.000Z"
              ],
              "duration": "01:25"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 206~ ~~DUB~08/11/2021 08:20~STN~08/11/2021 09:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6XXYFAQZG3NWJH4UZRGYTFZB7RVHRFMUJAGEVA7CKBMW6F4RGQXTKWTDOEGUT7PXM7ROTUH72JATP7NJDX3Q7JVL2AUGKR6LPXO2WIWDPBTV4FV7AQ5BNARNRHFURNRG7A",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 206",
                  "time": [
                    "2021-08-11T08:20:00.000",
                    "2021-08-11T09:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-11T07:20:00.000Z",
                    "2021-08-11T08:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 206",
              "time": [
                "2021-08-11T08:20:00.000",
                "2021-08-11T09:40:00.000"
              ],
              "timeUTC": [
                "2021-08-11T07:20:00.000Z",
                "2021-08-11T08:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~2272~ ~~DUB~08/11/2021 11:55~STN~08/11/2021 13:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6VHN42FFGEPOBXNARKJGLUZ5ODLVQUPAHSDHMCKOLMOIHQ2FMXJMCEEY7CFOAIFHMEPDOENQLMNBNNRWEQC5QXSO2ZY6F3VQ3EI32TXC7SR4G3DVCHVANXMQLBTAXTQEHQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 2272",
                  "time": [
                    "2021-08-11T11:55:00.000",
                    "2021-08-11T13:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-11T10:55:00.000Z",
                    "2021-08-11T12:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 2272",
              "time": [
                "2021-08-11T11:55:00.000",
                "2021-08-11T13:15:00.000"
              ],
              "timeUTC": [
                "2021-08-11T10:55:00.000Z",
                "2021-08-11T12:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 294~ ~~DUB~08/11/2021 15:30~STN~08/11/2021 16:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6ZFSB7DJ6XB6S4QFI4UWSFFH77WN7XADTCMM5TVDO45EBBSUOG7I4YMDAADL66YVCQQ3NFSHMUAG4DVL6CVT62T6KDCIG33OIC3XCEH2UGEE7IXM7ES7IQZVNJ3TARL7DQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 294",
                  "time": [
                    "2021-08-11T15:30:00.000",
                    "2021-08-11T16:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-11T14:30:00.000Z",
                    "2021-08-11T15:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 294",
              "time": [
                "2021-08-11T15:30:00.000",
                "2021-08-11T16:50:00.000"
              ],
              "timeUTC": [
                "2021-08-11T14:30:00.000Z",
                "2021-08-11T15:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 211~ ~~DUB~08/11/2021 16:30~STN~08/11/2021 17:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6X2CAC4XAINI7CBOWQYMY2QGKPEW64OCLXTRYZIMNL7H4Q4BL6PA5Y4CBBOOVUEK4RLPB3GUCOF733D7MPYSNI4HBZO6HZ6OJKFY7JNTEIPICSQ6JCHSWK6UDJBC5VLU5Q",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 211",
                  "time": [
                    "2021-08-11T16:30:00.000",
                    "2021-08-11T17:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-11T15:30:00.000Z",
                    "2021-08-11T16:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 211",
              "time": [
                "2021-08-11T16:30:00.000",
                "2021-08-11T17:50:00.000"
              ],
              "timeUTC": [
                "2021-08-11T15:30:00.000Z",
                "2021-08-11T16:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 288~ ~~DUB~08/11/2021 18:25~STN~08/11/2021 19:45~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6RQYWH7UF4NXWFAFGXJU7FJFTJQYIRPEUIU5VLF7T4WD3U422EKU7FGQR4WSUVXKPKUAWZZWUZBIUBQQHBUESONKFDHN3ASYWF6VSQQILIKLWPHD7ITHJL3PQKKLQJXU4A",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 288",
                  "time": [
                    "2021-08-11T18:25:00.000",
                    "2021-08-11T19:45:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-11T17:25:00.000Z",
                    "2021-08-11T18:45:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 288",
              "time": [
                "2021-08-11T18:25:00.000",
                "2021-08-11T19:45:00.000"
              ],
              "timeUTC": [
                "2021-08-11T17:25:00.000Z",
                "2021-08-11T18:45:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 272~ ~~DUB~08/11/2021 20:20~STN~08/11/2021 21:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YY4IDFZKVDM7TTICTPX7U7TUHLVMJQ2X2VDP4ZP3OKPHTX4PIK54LA4HWIXFWOZBDC4JZJ24LSPBMQEGHPU65AZ5YK6B6NCS6CJNKH4M5ZT3OZDGSLUI7IBW3YJQTW5LQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 272",
                  "time": [
                    "2021-08-11T20:20:00.000",
                    "2021-08-11T21:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-11T19:20:00.000Z",
                    "2021-08-11T20:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 272",
              "time": [
                "2021-08-11T20:20:00.000",
                "2021-08-11T21:40:00.000"
              ],
              "timeUTC": [
                "2021-08-11T19:20:00.000Z",
                "2021-08-11T20:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 298~ ~~DUB~08/11/2021 21:55~STN~08/11/2021 23:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6QT6QBIKVUREPIW2VHICKKO3C4KNHFAG2PYSXNMVYTBVL5TJDVTW7T26MGITD4Y7CXLRPKSB3VICFZKJTLSZLELHTUHRKCX4TTHCR5WAD7VV4NGMKXYMYKDU6MSR64DWKQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 298",
                  "time": [
                    "2021-08-11T21:55:00.000",
                    "2021-08-11T23:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-11T20:55:00.000Z",
                    "2021-08-11T22:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 298",
              "time": [
                "2021-08-11T21:55:00.000",
                "2021-08-11T23:15:00.000"
              ],
              "timeUTC": [
                "2021-08-11T20:55:00.000Z",
                "2021-08-11T22:15:00.000Z"
              ],
              "duration": "01:20"
            }
          ]
        },
        {
          "dateOut": "2021-08-12T00:00:00.000",
          "flights": [
            {
              "faresLeft": -1,
              "flightKey": "FR~ 202~ ~~DUB~08/12/2021 06:25~STN~08/12/2021 07:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YHAVYP55GA4FQ7UUVGCYKLC245TZER2UYCU3JNTPXU5B6NXQWJRVE6XMFHHFIMVMOGRZ4HHVTSAHNFX76ZWVCZZOSPNUWO3Y2KZHYIHH3KWLIDMIGVQH64SVBNEX2EMYA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 202",
                  "time": [
                    "2021-08-12T06:25:00.000",
                    "2021-08-12T07:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-12T05:25:00.000Z",
                    "2021-08-12T06:50:00.000Z"
                  ],
                  "duration": "01:25"
                }
              ],
              "flightNumber": "FR 202",
              "time": [
                "2021-08-12T06:25:00.000",
                "2021-08-12T07:50:00.000"
              ],
              "timeUTC": [
                "2021-08-12T05:25:00.000Z",
                "2021-08-12T06:50:00.000Z"
              ],
              "duration": "01:25"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 206~ ~~DUB~08/12/2021 08:20~STN~08/12/2021 09:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6XXYFAQZG3NWJH4UZRGYTFZB7RU3ASDAUKFMXLQOHKQJSIMDYTTRP67FVON5UJLECBIBZAQONEVHZ6LM65JKTE72Y4GHK4QMYLMR7PFRXAJHDC3T3H4SIPEH7AFUTF5YDQ",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 206",
                  "time": [
                    "2021-08-12T08:20:00.000",
                    "2021-08-12T09:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-12T07:20:00.000Z",
                    "2021-08-12T08:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 206",
              "time": [
                "2021-08-12T08:20:00.000",
                "2021-08-12T09:40:00.000"
              ],
              "timeUTC": [
                "2021-08-12T07:20:00.000Z",
                "2021-08-12T08:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~2272~ ~~DUB~08/12/2021 11:55~STN~08/12/2021 13:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6VHN42FFGEPOBXNARKJGLUZ5ODKH4JYG6ZVHXLVMG6ZQFQ4TJGGCG2WJ6LFN3UYP5BJHRRLSGCM2RBE2PNU5ZFOO625JAXTS34TYN57E5BSBUJQN3ZXEJGG2KXNK5NA3SA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 2272",
                  "time": [
                    "2021-08-12T11:55:00.000",
                    "2021-08-12T13:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-12T10:55:00.000Z",
                    "2021-08-12T12:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 2272",
              "time": [
                "2021-08-12T11:55:00.000",
                "2021-08-12T13:15:00.000"
              ],
              "timeUTC": [
                "2021-08-12T10:55:00.000Z",
                "2021-08-12T12:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 294~ ~~DUB~08/12/2021 15:30~STN~08/12/2021 16:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6ZFSB7DJ6XB6S4QFI4UWSFFH77WNCF6EPKQM2VPN4SQK4XGCM67JI7FOZOXJMS5L77244Y5DPYVCYQ4KS2BVP6WAGT52KZQVMYN2DIQPBWZFAKYLE4ZO5MN7C5FHWMZD5A",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 294",
                  "time": [
                    "2021-08-12T15:30:00.000",
                    "2021-08-12T16:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-12T14:30:00.000Z",
                    "2021-08-12T15:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 294",
              "time": [
                "2021-08-12T15:30:00.000",
                "2021-08-12T16:50:00.000"
              ],
              "timeUTC": [
                "2021-08-12T14:30:00.000Z",
                "2021-08-12T15:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 211~ ~~DUB~08/12/2021 16:30~STN~08/12/2021 17:50~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6X2CAC4XAINI7CBOWQYMY2QGKPESJXHNVTVG56DPFV6NGAUHCHBBTVPLPHKOFTUWS527HIKLPAEWO5F2PTLHQ6SCAVHVS2QLS7CQ3IVF3GTWT2LXAJAQTQDLRNMJVD3FNA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 211",
                  "time": [
                    "2021-08-12T16:30:00.000",
                    "2021-08-12T17:50:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-12T15:30:00.000Z",
                    "2021-08-12T16:50:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 211",
              "time": [
                "2021-08-12T16:30:00.000",
                "2021-08-12T17:50:00.000"
              ],
              "timeUTC": [
                "2021-08-12T15:30:00.000Z",
                "2021-08-12T16:50:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 288~ ~~DUB~08/12/2021 18:55~STN~08/12/2021 20:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6RQYWH7UF4NXWFAFGXJU7FJFTJRM6OLULV7VQMNPIMRT7K2JEMMOQ44OXITTKVNUMIUGUGAXCD654J3JYE7PMPTSVPLERMS7N2LD4BKBN5EFSBUWZFUMM2GS4LEZAA7O4A",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 288",
                  "time": [
                    "2021-08-12T18:55:00.000",
                    "2021-08-12T20:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-12T17:55:00.000Z",
                    "2021-08-12T19:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 288",
              "time": [
                "2021-08-12T18:55:00.000",
                "2021-08-12T20:15:00.000"
              ],
              "timeUTC": [
                "2021-08-12T17:55:00.000Z",
                "2021-08-12T19:15:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 272~ ~~DUB~08/12/2021 20:20~STN~08/12/2021 21:40~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6YY4IDFZKVDM7TTICTPX7U7TUHLWGGOKMHWCCNKDKJWI3SLOEJYJ3UFS5UDW54U7O3XOWAJJEFHZBAUZEJKFU4EALU6PTZRCBYF6WLV6KCWHQHCA2DW3O3XS36S6QLIQQA",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 272",
                  "time": [
                    "2021-08-12T20:20:00.000",
                    "2021-08-12T21:40:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-12T19:20:00.000Z",
                    "2021-08-12T20:40:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 272",
              "time": [
                "2021-08-12T20:20:00.000",
                "2021-08-12T21:40:00.000"
              ],
              "timeUTC": [
                "2021-08-12T19:20:00.000Z",
                "2021-08-12T20:40:00.000Z"
              ],
              "duration": "01:20"
            },
            {
              "faresLeft": -1,
              "flightKey": "FR~ 298~ ~~DUB~08/12/2021 21:55~STN~08/12/2021 23:15~~",
              "infantsLeft": 18,
              "regularFare": {
                "fareKey": "YWSHSDKP5AFHTRVXE7ZY2M45RJ5Y7YQNMWKPBPXRC5PVZVZQYR6QT6QBIKVUREPIW2VHICKKO3C4LEQ36KZQSCZSYSKF53QIB6UMNFCVFAHBHAANQUMIVIF3FZPT4AX52MT3LDN7OI4WPBCION22WCYJ2GRRJTBLZQJ4KOUWOMLUUZVPWE3A",
                "fareClass": "S",
                "fares": [
                  {
                    "type": "ADT",
                    "amount": 210.87,
                    "count": 1,
                    "hasDiscount": true,
                    "publishedFare": 256.47,
                    "discountInPercent": 21,
                    "hasPromoDiscount": false,
                    "discountAmount": 0
                  }
                ]
              },
              "operatedBy": "",
              "segments": [
                {
                  "segmentNr": 0,
                  "origin": "DUB",
                  "destination": "STN",
                  "flightNumber": "FR 298",
                  "time": [
                    "2021-08-12T21:55:00.000",
                    "2021-08-12T23:15:00.000"
                  ],
                  "timeUTC": [
                    "2021-08-12T20:55:00.000Z",
                    "2021-08-12T22:15:00.000Z"
                  ],
                  "duration": "01:20"
                }
              ],
              "flightNumber": "FR 298",
              "time": [
                "2021-08-12T21:55:00.000",
                "2021-08-12T23:15:00.000"
              ],
              "timeUTC": [
                "2021-08-12T20:55:00.000Z",
                "2021-08-12T22:15:00.000Z"
              ],
              "duration": "01:20"
            }
          ]
        }
      ]
    }
  ],
  "serverTimeUTC": "2020-08-20T11:14:12.262Z"
}
"""

private let stationsMock = """
{
  "stations": [
    {
      "code": "AAL",
      "name": "Aalborg",
      "alternateName": null,
      "alias": [
        "aalborg"
      ],
      "countryCode": "DK",
      "countryName": "Denmark",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DK",
      "latitude": "570535N",
      "longitude": "0095100E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "STN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AAL_v2.png"
    },
    {
      "code": "AAR",
      "name": "Aarhus",
      "alternateName": null,
      "alias": [
        "aarhus"
      ],
      "countryCode": "DK",
      "countryName": "Denmark",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DK",
      "latitude": "561800N",
      "longitude": "0103708E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AAR_v2.png"
    },
    {
      "code": "ABC",
      "name": "Schedule Test ABC",
      "alternateName": null,
      "alias": [
        "schedule",
        "test",
        "abc"
      ],
      "countryCode": "IE",
      "countryName": "Ireland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IE",
      "latitude": "385655N",
      "longitude": "0015149W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "NSD",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ABC_v2.png"
    },
    {
      "code": "ABZ",
      "name": "Aberdeen",
      "alternateName": null,
      "alias": [
        "aberdeen"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "571215N",
      "longitude": "0021153W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ABZ_v2.png"
    },
    {
      "code": "ACE",
      "name": "Lanzarote",
      "alternateName": null,
      "alias": [
        "lanzarote"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES2",
      "latitude": "285615N",
      "longitude": "0133613W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BFS",
          "group": "CANARY"
        },
        {
          "code": "BGY",
          "group": "CANARY"
        },
        {
          "code": "BHX",
          "group": "CANARY"
        },
        {
          "code": "BLQ",
          "group": "CANARY"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": "CANARY"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CRL",
          "group": "CANARY"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DUB",
          "group": "CANARY"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "CANARY"
        },
        {
          "code": "EIN",
          "group": "CANARY"
        },
        {
          "code": "EMA",
          "group": "CANARY"
        },
        {
          "code": "FCO",
          "group": "CANARY"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GLA",
          "group": "CANARY"
        },
        {
          "code": "HHN",
          "group": "CANARY"
        },
        {
          "code": "LBA",
          "group": "CANARY"
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "LPL",
          "group": "CANARY"
        },
        {
          "code": "LTN",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": "CANARY"
        },
        {
          "code": "NCL",
          "group": "CANARY"
        },
        {
          "code": "NOC",
          "group": "CANARY"
        },
        {
          "code": "NRN",
          "group": "CANARY"
        },
        {
          "code": "ORK",
          "group": "CANARY"
        },
        {
          "code": "PIK",
          "group": "CANARY"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "SDR",
          "group": "DOMESTIC"
        },
        {
          "code": "SNN",
          "group": "CANARY"
        },
        {
          "code": "STN",
          "group": "CANARY"
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SXF",
          "group": "CANARY"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        },
        {
          "code": "ZAZ",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ACE_v2.png"
    },
    {
      "code": "ADB",
      "name": "Adnan Menderes",
      "alternateName": null,
      "alias": [
        "adnan",
        "menderes"
      ],
      "countryCode": "TR",
      "countryName": "Turkey",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "TR",
      "latitude": "381700N",
      "longitude": "0270900E",
      "mobileBoardingPass": false,
      "markets": [],
      "notices": null
    },
    {
      "code": "AGA",
      "name": "Agadir",
      "alternateName": null,
      "alias": [
        "agadir"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "301952N",
      "longitude": "0092434W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "EIN",
          "group": "ETHNIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "NRN",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AGA_v2.png"
    },
    {
      "code": "AGH",
      "name": "Angelholm",
      "alternateName": null,
      "alias": [
        "angelholm"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "561735N",
      "longitude": "0125145E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AGH_v2.png"
    },
    {
      "code": "AGP",
      "name": "Malaga",
      "alternateName": null,
      "alias": [
        "malaga"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "364018N",
      "longitude": "0042953W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ABZ",
          "group": "LEISURE"
        },
        {
          "code": "AMS",
          "group": null
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BFS",
          "group": "LEISURE"
        },
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLL",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": "LEISURE"
        },
        {
          "code": "BOH",
          "group": "LEISURE"
        },
        {
          "code": "BRE",
          "group": "LEISURE"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BRU",
          "group": "LEISURE"
        },
        {
          "code": "BTS",
          "group": "LEISURE"
        },
        {
          "code": "BUD",
          "group": "LEISURE"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CGN",
          "group": "LEISURE"
        },
        {
          "code": "CPH",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DTM",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "EXT",
          "group": null
        },
        {
          "code": "FCO",
          "group": "LEISURE"
        },
        {
          "code": "FKB",
          "group": "LEISURE"
        },
        {
          "code": "FMM",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GLA",
          "group": "LEISURE"
        },
        {
          "code": "GOT",
          "group": "LEISURE"
        },
        {
          "code": "HAM",
          "group": "LEISURE"
        },
        {
          "code": "HAU",
          "group": "LEISURE"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "IBZ",
          "group": "DOMESTIC"
        },
        {
          "code": "KRK",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MRS",
          "group": "LEISURE"
        },
        {
          "code": "NCL",
          "group": "LEISURE"
        },
        {
          "code": "NOC",
          "group": "LEISURE"
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "NUE",
          "group": "LEISURE"
        },
        {
          "code": "NYO",
          "group": "LEISURE"
        },
        {
          "code": "ORK",
          "group": "LEISURE"
        },
        {
          "code": "PIK",
          "group": "LEISURE"
        },
        {
          "code": "PMI",
          "group": "DOMESTIC"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SDR",
          "group": "DOMESTIC"
        },
        {
          "code": "SEN",
          "group": null
        },
        {
          "code": "SNN",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SXF",
          "group": "LEISURE"
        },
        {
          "code": "TRF",
          "group": "LEISURE"
        },
        {
          "code": "TSF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VST",
          "group": "LEISURE"
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AGP_v2.png"
    },
    {
      "code": "AHO",
      "name": "Alghero",
      "alternateName": null,
      "alias": [
        "alghero"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "403752N",
      "longitude": "0081719E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": "DOMESTIC"
        },
        {
          "code": "BTS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "DTM",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FMM",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AHO_v2.png"
    },
    {
      "code": "AJA",
      "name": "Campo Dell Oro",
      "alternateName": null,
      "alias": [
        "campo",
        "dell",
        "oro"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "415527N",
      "longitude": "0084811E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "ALC",
      "name": "Alicante",
      "alternateName": null,
      "alias": [
        "alicante"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "381700N",
      "longitude": "0003400W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ABZ",
          "group": "LEISURE"
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BFS",
          "group": "LEISURE"
        },
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLL",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": "LEISURE"
        },
        {
          "code": "BOH",
          "group": "LEISURE"
        },
        {
          "code": "BRE",
          "group": "LEISURE"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BRU",
          "group": "LEISURE"
        },
        {
          "code": "BVA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "CGN",
          "group": "LEISURE"
        },
        {
          "code": "CIY",
          "group": null
        },
        {
          "code": "CPH",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FCO",
          "group": "LEISURE"
        },
        {
          "code": "FKB",
          "group": "LEISURE"
        },
        {
          "code": "FMM",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GDN",
          "group": "LEISURE"
        },
        {
          "code": "GLA",
          "group": "LEISURE"
        },
        {
          "code": "GOT",
          "group": "LEISURE"
        },
        {
          "code": "HAM",
          "group": "LEISURE"
        },
        {
          "code": "HAU",
          "group": "LEISURE"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "KIR",
          "group": "LEISURE"
        },
        {
          "code": "KRK",
          "group": "LEISURE"
        },
        {
          "code": "KUN",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LGW",
          "group": "LEISURE"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MST",
          "group": "LEISURE"
        },
        {
          "code": "MXP",
          "group": "LEISURE"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "NCL",
          "group": "LEISURE"
        },
        {
          "code": "NOC",
          "group": "LEISURE"
        },
        {
          "code": "NQY",
          "group": "LEISURE"
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "NUE",
          "group": "LEISURE"
        },
        {
          "code": "NYO",
          "group": "LEISURE"
        },
        {
          "code": "ORK",
          "group": "LEISURE"
        },
        {
          "code": "PED",
          "group": null
        },
        {
          "code": "PIK",
          "group": "LEISURE"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "POZ",
          "group": "LEISURE"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SEN",
          "group": null
        },
        {
          "code": "SKG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SNN",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SXF",
          "group": "LEISURE"
        },
        {
          "code": "TRF",
          "group": "LEISURE"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VST",
          "group": "LEISURE"
        },
        {
          "code": "VXO",
          "group": "LEISURE"
        },
        {
          "code": "WAW",
          "group": null
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ALC_v2.png"
    },
    {
      "code": "AMM",
      "name": "Amman Jordan",
      "alternateName": "Amman",
      "alias": [
        "amman",
        "jordan"
      ],
      "countryCode": "JO",
      "countryName": "Jordan",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "JO",
      "latitude": "314300N",
      "longitude": "0360000E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "BLQ",
          "group": null
        },
        {
          "code": "BRU",
          "group": null
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "OTP",
          "group": null
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VNO",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AMM_v2.png"
    },
    {
      "code": "AMS",
      "name": "Amsterdam",
      "alternateName": null,
      "alias": [
        "amsterdam"
      ],
      "countryCode": "NL",
      "countryName": "Netherlands",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NL",
      "latitude": "521830N",
      "longitude": "0044605E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "DUB",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AMS_v2.png"
    },
    {
      "code": "ANG",
      "name": "Angoulême",
      "alternateName": null,
      "alias": [
        "angouleme"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "454400N",
      "longitude": "0001300E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ANG_v2.png"
    },
    {
      "code": "AOC",
      "name": "Altenburg",
      "alternateName": null,
      "alias": [
        "altenburg"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "505900N",
      "longitude": "0122700E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AOC_v2.png"
    },
    {
      "code": "AOI",
      "name": "Ancona",
      "alternateName": null,
      "alias": [
        "ancona"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "433700N",
      "longitude": "0132137E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "HHN",
          "group": null
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AOI_v2.png"
    },
    {
      "code": "AQJ",
      "name": "Aqaba Jordan",
      "alternateName": "Aqaba",
      "alias": [
        "aqaba",
        "jordan"
      ],
      "countryCode": "JO",
      "countryName": "Jordan",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "JO",
      "latitude": "293700N",
      "longitude": "0350100E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "CIA",
          "group": null
        },
        {
          "code": "SOF",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AQJ_v2.png"
    },
    {
      "code": "ARN",
      "name": "Arlanda",
      "alternateName": null,
      "alias": [
        "arlanda"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "593943N",
      "longitude": "0175602E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CFE",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ARN_v2.png"
    },
    {
      "code": "ARW",
      "name": "Arad",
      "alternateName": null,
      "alias": [
        "arad"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "461100N",
      "longitude": "0211600E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ARW_v2.png"
    },
    {
      "code": "ATH",
      "name": "Athens",
      "alternateName": null,
      "alias": [
        "athens"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "375611N",
      "longitude": "0235640E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "AGP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ALC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "AQJ",
          "group": null
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLL",
          "group": null
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "BTS",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "FKB",
          "group": null
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "HER",
          "group": null
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "JMK",
          "group": "DOMESTIC"
        },
        {
          "code": "JTR",
          "group": "DOMESTIC"
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "LCJ",
          "group": null
        },
        {
          "code": "LPP",
          "group": null
        },
        {
          "code": "MAD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OTP",
          "group": "CITY"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSR",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "RZE",
          "group": null
        },
        {
          "code": "SKG",
          "group": "DOMESTIC"
        },
        {
          "code": "SOF",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TPS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "VNO",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        },
        {
          "code": "WMI",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": null
        },
        {
          "code": "ZAZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ATH_v2.png"
    },
    {
      "code": "AXD",
      "name": "Alexandropoulis",
      "alternateName": null,
      "alias": [
        "alexandropoulis"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "405121N",
      "longitude": "0255723E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AXD_v2.png"
    },
    {
      "code": "AYT",
      "name": "Antalya",
      "alternateName": null,
      "alias": [
        "antalya"
      ],
      "countryCode": "TR",
      "countryName": "Turkey",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "TR",
      "latitude": "365420N",
      "longitude": "0304726E",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/AYT_v2.png"
    },
    {
      "code": "BBU",
      "name": "Baneasa",
      "alternateName": null,
      "alias": [
        "baneasa"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "443000N",
      "longitude": "0260600E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "OTP",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BBU_v2.png"
    },
    {
      "code": "BCN",
      "name": "Barcelona",
      "alternateName": "Barcelona T2",
      "alias": [
        "barcelona",
        "t2"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "411749N",
      "longitude": "0020442E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "DOMESTIC"
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "CITY",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CFU",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CGN",
          "group": "CITY"
        },
        {
          "code": "CIY",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FAO",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "FCO",
          "group": "CITY"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "GLA",
          "group": null
        },
        {
          "code": "HAM",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "DOMESTIC"
        },
        {
          "code": "KBP",
          "group": null,
          "pendingApproval": true
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": "DOMESTIC"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "LUX",
          "group": null
        },
        {
          "code": "MAH",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MLA",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ]
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NDR",
          "group": "ETHNIC"
        },
        {
          "code": "NYO",
          "group": "LEISURE"
        },
        {
          "code": "OPO",
          "group": "DOMESTIC"
        },
        {
          "code": "PDL",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PIK",
          "group": "LEISURE"
        },
        {
          "code": "PMI",
          "group": "DOMESTIC"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "POZ",
          "group": "CITY"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SDR",
          "group": "DOMESTIC"
        },
        {
          "code": "SKG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SOF",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TER",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TFN",
          "group": "DOMESTIC"
        },
        {
          "code": "TFS",
          "group": "DOMESTIC"
        },
        {
          "code": "TRN",
          "group": "CITY"
        },
        {
          "code": "VCE",
          "group": "CITY_GOLD"
        },
        {
          "code": "VGO",
          "group": "DOMESTIC"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLL",
          "group": "DOMESTIC"
        },
        {
          "code": "VNO",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": null,
          "stops": []
        },
        {
          "code": "XRY",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BCN_v2.png"
    },
    {
      "code": "BDS",
      "name": "Brindisi",
      "alternateName": null,
      "alias": [
        "brindisi"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "403938N",
      "longitude": "0175653E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ALC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": "DOMESTIC"
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "BUD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BVA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CGN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "FCO",
          "group": "DOMESTIC"
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "HAM",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "OPO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "SCQ",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TRN",
          "group": "DOMESTIC"
        },
        {
          "code": "TSF",
          "group": "DOMESTIC"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VNO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "VRN",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BDS_v2.png"
    },
    {
      "code": "BER",
      "name": "Berlin (Brandenburg)",
      "alternateName": null,
      "alias": [
        "berlin",
        "brandenburg"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "522201N",
      "longitude": "0133001E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BER_v2.png"
    },
    {
      "code": "BES",
      "name": "Brest",
      "alternateName": null,
      "alias": [
        "brest"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "482650N",
      "longitude": "0042514W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "MRS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "SEN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BES_v2.png"
    },
    {
      "code": "BEY",
      "name": "Beirut",
      "alternateName": "Beirut International",
      "alias": [
        "beirut",
        "international"
      ],
      "countryCode": "LB",
      "countryName": "Lebanon",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "LB",
      "latitude": "334846N",
      "longitude": "0352925E",
      "mobileBoardingPass": false,
      "markets": [],
      "notices": null
    },
    {
      "code": "BFS",
      "name": "Belfast International",
      "alternateName": "Belfast",
      "alias": [
        "belfast",
        "international"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "543912N",
      "longitude": "0061329W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "FAO",
          "group": null
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "POZ",
          "group": null,
          "stops": []
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BFS_v2.png"
    },
    {
      "code": "BGY",
      "name": "Milan Bergamo",
      "alternateName": "Milan (Bergamo)",
      "alias": [
        "milan",
        "bergamo"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "454008N",
      "longitude": "0094201E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AHO",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": "CITY_GOLD"
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "BFS",
          "group": "CITY"
        },
        {
          "code": "BLL",
          "group": "CITY"
        },
        {
          "code": "BOD",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRE",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "DOMESTIC"
        },
        {
          "code": "BRQ",
          "group": "CITY"
        },
        {
          "code": "BRS",
          "group": "CITY"
        },
        {
          "code": "BTS",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CGN",
          "group": "CITY"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIY",
          "group": null
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CRV",
          "group": "DOMESTIC"
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "CITY_GOLD"
        },
        {
          "code": "EFL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "EMA",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": "CITY",
          "stops": [
            {
              "code": "OPO"
            }
          ]
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GDN",
          "group": "CITY"
        },
        {
          "code": "GOT",
          "group": "CITY"
        },
        {
          "code": "HAM",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "INI",
          "group": "CITY"
        },
        {
          "code": "KRK",
          "group": "CITY"
        },
        {
          "code": "LDE",
          "group": "CITY"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LPP",
          "group": "CITY"
        },
        {
          "code": "LUX",
          "group": "CITY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NOC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NUE",
          "group": "CITY"
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "OMR",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "ORK",
          "group": "LEISURE"
        },
        {
          "code": "OSR",
          "group": "CITY"
        },
        {
          "code": "OTP",
          "group": "CITY"
        },
        {
          "code": "PDL",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PDV",
          "group": "CITY"
        },
        {
          "code": "PFO",
          "group": "LEISURE"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "DOMESTIC"
        },
        {
          "code": "POZ",
          "group": "CITY"
        },
        {
          "code": "PRG",
          "group": "CITY"
        },
        {
          "code": "PSR",
          "group": "DOMESTIC"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RIX",
          "group": "CITY"
        },
        {
          "code": "SCQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "SDR",
          "group": "CITY"
        },
        {
          "code": "SEN",
          "group": null
        },
        {
          "code": "SKG",
          "group": "CITY_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": "DOMESTIC"
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TER",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TLL",
          "group": "CITY"
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "TNG",
          "group": "ETHNIC"
        },
        {
          "code": "TPS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "TRF",
          "group": "CITY_GOLD"
        },
        {
          "code": "TSR",
          "group": "CITY"
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VGO",
          "group": "CITY"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VIT",
          "group": null
        },
        {
          "code": "VLC",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": "CITY"
        },
        {
          "code": "ZAZ",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BGY_v2.png"
    },
    {
      "code": "BHD",
      "name": "Belfast City",
      "alternateName": null,
      "alias": [
        "belfast",
        "city"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "543700N",
      "longitude": "0055300W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BHD_v2.png"
    },
    {
      "code": "BHX",
      "name": "Birmingham",
      "alternateName": null,
      "alias": [
        "birmingham"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "522711N",
      "longitude": "0014447W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BTS",
          "group": "ETHNIC"
        },
        {
          "code": "BZG",
          "group": "ETHNIC"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "KTW",
          "group": "ETHNIC"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "OPO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PGF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "VRN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BHX_v2.png"
    },
    {
      "code": "BIO",
      "name": "Bilbao",
      "alternateName": null,
      "alias": [
        "bilbao"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "431810N",
      "longitude": "0025518W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "SEN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BIO_v2.png"
    },
    {
      "code": "BIQ",
      "name": "Biarritz",
      "alternateName": null,
      "alias": [
        "biarritz"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "432811N",
      "longitude": "0013122W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BIQ_v2.png"
    },
    {
      "code": "BJV",
      "name": "Bodrum",
      "alternateName": "Milas",
      "alias": [
        "bodrum",
        "milas"
      ],
      "countryCode": "TR",
      "countryName": "Turkey",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "TR",
      "latitude": "371500N",
      "longitude": "0274100E",
      "mobileBoardingPass": false,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BJV_v2.png"
    },
    {
      "code": "BLK",
      "name": "Blackpool",
      "alternateName": null,
      "alias": [
        "blackpool"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "534619N",
      "longitude": "0030210W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BLK_v2.png"
    },
    {
      "code": "BLL",
      "name": "Billund",
      "alternateName": null,
      "alias": [
        "billund"
      ],
      "countryCode": "DK",
      "countryName": "Denmark",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DK",
      "latitude": "554418N",
      "longitude": "0090900E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        },
        {
          "code": "SXF",
          "group": null
        },
        {
          "code": "VLC",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BLL_v2.png"
    },
    {
      "code": "BLQ",
      "name": "Bologna",
      "alternateName": null,
      "alias": [
        "bologna"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "443151N",
      "longitude": "0111749E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE"
        },
        {
          "code": "AHO",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE"
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": "CITY_GOLD"
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": "DOMESTIC"
        },
        {
          "code": "BOD",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "DOMESTIC"
        },
        {
          "code": "BRS",
          "group": "CITY"
        },
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "EDI",
          "group": "CITY"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "JMK",
          "group": null
        },
        {
          "code": "KRK",
          "group": "CITY"
        },
        {
          "code": "KUN",
          "group": null
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "OTP",
          "group": "CITY"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "DOMESTIC"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "RHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SKG",
          "group": "CITY_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": "DOMESTIC"
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TPS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "VGO",
          "group": "CITY"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BLQ_v2.png"
    },
    {
      "code": "BNX",
      "name": "Banja Luka",
      "alternateName": null,
      "alias": [
        "banja",
        "luka"
      ],
      "countryCode": "BA",
      "countryName": "Bosnia and Herzegovina",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "BA",
      "latitude": "445600N",
      "longitude": "0171800E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": null
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "NYO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BNX_v2.png"
    },
    {
      "code": "BOD",
      "name": "Bordeaux",
      "alternateName": null,
      "alias": [
        "bordeaux"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "444946N",
      "longitude": "0004252W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "ORK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "VLC",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BOD_v2.png"
    },
    {
      "code": "BOH",
      "name": "Bournemouth",
      "alternateName": null,
      "alias": [
        "bournemouth"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "504650N",
      "longitude": "0015013W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BOH_v2.png"
    },
    {
      "code": "BOJ",
      "name": "Burgas",
      "alternateName": null,
      "alias": [
        "burgas"
      ],
      "countryCode": "BG",
      "countryName": "Bulgaria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "BG",
      "latitude": "423411N",
      "longitude": "0273055E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "HHN",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "KUN",
          "group": null
        },
        {
          "code": "NRN",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "RIX",
          "group": null
        },
        {
          "code": "RZE",
          "group": null
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BOJ_v2.png"
    },
    {
      "code": "BRE",
      "name": "Bremen",
      "alternateName": null,
      "alias": [
        "bremen"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "530248N",
      "longitude": "0084724E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NYO",
          "group": "CITY_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TLL",
          "group": "ETHNIC"
        },
        {
          "code": "TMP",
          "group": "CITY_GOLD"
        },
        {
          "code": "TPS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TSF",
          "group": "CITY"
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "ZAD",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BRE_v2.png"
    },
    {
      "code": "BRI",
      "name": "Bari",
      "alternateName": null,
      "alias": [
        "bari"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "410817N",
      "longitude": "0164554E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": "DOMESTIC"
        },
        {
          "code": "BRE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "BVA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CAG",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "CGN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "FCO",
          "group": "DOMESTIC"
        },
        {
          "code": "FKB",
          "group": "CITY_GOLD"
        },
        {
          "code": "GOA",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "HAM",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "LPL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MST",
          "group": "CITY"
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NUE",
          "group": "CITY_GOLD"
        },
        {
          "code": "OPO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "SCQ",
          "group": null
        },
        {
          "code": "SKG",
          "group": "CITY",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TRN",
          "group": "DOMESTIC"
        },
        {
          "code": "TRS",
          "group": "DOMESTIC"
        },
        {
          "code": "TSF",
          "group": "DOMESTIC"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VLC",
          "group": "CITY_GOLD"
        },
        {
          "code": "VNO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BRI_v2.png"
    },
    {
      "code": "BRQ",
      "name": "Brno",
      "alternateName": null,
      "alias": [
        "brno"
      ],
      "countryCode": "CZ",
      "countryName": "Czech Republic",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "CZ",
      "latitude": "490905N",
      "longitude": "0164140E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BRQ_v2.png"
    },
    {
      "code": "BRS",
      "name": "Bristol",
      "alternateName": null,
      "alias": [
        "bristol"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "512254N",
      "longitude": "0024232W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "BRI",
          "group": null
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "BZR",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "EGC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GNB",
          "group": null
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "KUN",
          "group": "ETHNIC"
        },
        {
          "code": "LIG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "NOC",
          "group": "UKP_GOLD"
        },
        {
          "code": "NTE",
          "group": null
        },
        {
          "code": "OPO",
          "group": null
        },
        {
          "code": "OTP",
          "group": "ETHNIC"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "POZ",
          "group": "ETHNIC"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RZE",
          "group": "ETHNIC"
        },
        {
          "code": "SNN",
          "group": null
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SVQ",
          "group": "LEISURE"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "VCE",
          "group": "CITY_GOLD"
        },
        {
          "code": "VLC",
          "group": "LEISURE"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BRS_v2.png"
    },
    {
      "code": "BRU",
      "name": "Brussels",
      "alternateName": null,
      "alias": [
        "brussels"
      ],
      "countryCode": "BE",
      "countryName": "Belgium",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "BE",
      "latitude": "505405N",
      "longitude": "0042904E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ]
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "FCO",
          "group": "CITY"
        },
        {
          "code": "LCA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MXP",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "PDL",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TSF",
          "group": "CITY"
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BRU_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "BSL",
      "name": "Basel",
      "alternateName": null,
      "alias": [
        "basel"
      ],
      "countryCode": "CH",
      "countryName": "Switzerland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "CH",
      "latitude": "473524N",
      "longitude": "0073148E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BSL_v2.png"
    },
    {
      "code": "BTS",
      "name": "Bratislava",
      "alternateName": null,
      "alias": [
        "bratislava"
      ],
      "countryCode": "SK",
      "countryName": "Slovakia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SK",
      "latitude": "481000N",
      "longitude": "0171300E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": "CITY"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BHX",
          "group": "ETHNIC"
        },
        {
          "code": "BLQ",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DLM",
          "group": null
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "ETHNIC"
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "INI",
          "group": "ETHNIC"
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "LBA",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "ETHNIC"
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "OPO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "SKG",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "VDA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BTS_v2.png"
    },
    {
      "code": "BUD",
      "name": "Budapest",
      "alternateName": "Budapest T2B",
      "alias": [
        "budapest",
        "t2b"
      ],
      "countryCode": "HU",
      "countryName": "Hungary",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "HU",
      "latitude": "472600N",
      "longitude": "0191400E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE"
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": "CITY"
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLL",
          "group": "ETHNIC"
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": "ETHNIC"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EMA",
          "group": "ETHNIC"
        },
        {
          "code": "FMM",
          "group": "ETHNIC"
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "ETHNIC"
        },
        {
          "code": "MLA",
          "group": "LEISURE"
        },
        {
          "code": "MRS",
          "group": null
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NUE",
          "group": "ETHNIC"
        },
        {
          "code": "OPO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "PFO",
          "group": "LEISURE"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "PSR",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "SDR",
          "group": null
        },
        {
          "code": "SKG",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SXF",
          "group": "ETHNIC"
        },
        {
          "code": "TMP",
          "group": "ETHNIC"
        },
        {
          "code": "TSF",
          "group": "CITY"
        },
        {
          "code": "VDA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VLC",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BUD_v2.png",
      "airportShopping": true
    },
    {
      "code": "BVA",
      "name": "Paris Beauvais",
      "alternateName": "Paris (Beauvais)",
      "alias": [
        "paris",
        "beauvais"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "492721N",
      "longitude": "0020645E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": "CITY_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "BTS",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BZR",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "CAG",
          "group": "CITY_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FSC",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "GRO",
          "group": "CITY_GOLD"
        },
        {
          "code": "KRK",
          "group": "CITY"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "NDR",
          "group": "ETHNIC"
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "OUD",
          "group": "ETHNIC"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RBA",
          "group": "ETHNIC"
        },
        {
          "code": "SKG",
          "group": "CITY_GOLD"
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TNG",
          "group": "ETHNIC"
        },
        {
          "code": "TSF",
          "group": "CITY"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": "CITY"
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ZAZ",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BVA_v2.png"
    },
    {
      "code": "BVE",
      "name": "Brive",
      "alternateName": "Brive (Souillac)",
      "alias": [
        "brive",
        "souillac"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "450853N",
      "longitude": "0012825E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BVE_v2.png"
    },
    {
      "code": "BZG",
      "name": "Bydgoszcz",
      "alternateName": null,
      "alias": [
        "bydgoszcz"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "530548N",
      "longitude": "0175843E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BHX",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "GLA",
          "group": "ETHNIC"
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "LTN",
          "group": null
        },
        {
          "code": "NRN",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BZG_v2.png"
    },
    {
      "code": "BZR",
      "name": "Beziers",
      "alternateName": null,
      "alias": [
        "beziers"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "431927N",
      "longitude": "0032116E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BVA",
          "group": "DOMESTIC"
        },
        {
          "code": "EDI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LTN",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/BZR_v2.png"
    },
    {
      "code": "CAG",
      "name": "Cagliari",
      "alternateName": null,
      "alias": [
        "cagliari"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "391450N",
      "longitude": "0090322E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "AGP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ALC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BCN",
          "group": "CITY",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": "DOMESTIC"
        },
        {
          "code": "BRE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRI",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "BTS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BUD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BVA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CIA",
          "group": "DOMESTIC"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "CUF",
          "group": "DOMESTIC"
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "FKB",
          "group": "LEISURE"
        },
        {
          "code": "GRO",
          "group": "CITY"
        },
        {
          "code": "HAM",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "IBZ",
          "group": "LEISURE",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "NUE",
          "group": "LEISURE",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OPO",
          "group": null
        },
        {
          "code": "PMF",
          "group": "DOMESTIC"
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "SCQ",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "SVQ",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TPS",
          "group": "DOMESTIC"
        },
        {
          "code": "TSF",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "VLC",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "VRN",
          "group": "DOMESTIC"
        },
        {
          "code": "WMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CAG_v2.png"
    },
    {
      "code": "CCF",
      "name": "Carcassonne",
      "alternateName": null,
      "alias": [
        "carcassonne"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "431300N",
      "longitude": "0021900E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "GLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "ORK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CCF_v2.png"
    },
    {
      "code": "CDT",
      "name": "Castellon (Valencia)",
      "alternateName": "Castellon",
      "alias": [
        "castellon",
        "valencia"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "395900N",
      "longitude": "0000300W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CDT_v2.png"
    },
    {
      "code": "CFE",
      "name": "Clermont",
      "alternateName": null,
      "alias": [
        "clermont"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "454709N",
      "longitude": "0031003E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ARN",
          "group": null
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CFE_v2.png"
    },
    {
      "code": "CFU",
      "name": "Corfu",
      "alternateName": null,
      "alias": [
        "corfu"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "393607N",
      "longitude": "0195442E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BTS",
          "group": "LEISURE"
        },
        {
          "code": "BUD",
          "group": "LEISURE"
        },
        {
          "code": "CGN",
          "group": "LEISURE"
        },
        {
          "code": "CIA",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FCO",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "KTW",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "POZ",
          "group": "LEISURE"
        },
        {
          "code": "PSA",
          "group": "LEISURE"
        },
        {
          "code": "RZE",
          "group": "LEISURE"
        },
        {
          "code": "SEN",
          "group": null
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TSF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VNO",
          "group": null
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CFU_v2.png"
    },
    {
      "code": "CGN",
      "name": "Cologne",
      "alternateName": "Cologne (Bonn)",
      "alias": [
        "cologne",
        "bonn"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "505157N",
      "longitude": "0070834E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AQJ",
          "group": null
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": null
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY",
          "stops": [
            {
              "code": "DUS"
            }
          ]
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXF",
          "group": "DOMESTIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "VIT",
          "group": null
        },
        {
          "code": "VLC",
          "group": "CITY_GOLD"
        },
        {
          "code": "VNO",
          "group": null
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CGN_v2.png"
    },
    {
      "code": "CHQ",
      "name": "Chania",
      "alternateName": "Crete (Chania)",
      "alias": [
        "chania",
        "crete"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "353154N",
      "longitude": "0240859E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": "LEISURE"
        },
        {
          "code": "BRE",
          "group": "LEISURE"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FCO",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GLA",
          "group": "LEISURE"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "KRK",
          "group": "LEISURE"
        },
        {
          "code": "KTW",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "PFO",
          "group": "DOMESTIC"
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "PSA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SKG",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "WAW",
          "group": "LEISURE"
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CHQ_v2.png"
    },
    {
      "code": "CIA",
      "name": "Rome Ciampino",
      "alternateName": "Rome (Ciampino)",
      "alias": [
        "rome",
        "ciampino"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "414758N",
      "longitude": "0123550E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AQJ",
          "group": null
        },
        {
          "code": "ATH",
          "group": "CITY"
        },
        {
          "code": "BLL",
          "group": "CITY"
        },
        {
          "code": "BOD",
          "group": "CITY"
        },
        {
          "code": "BTS",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "DOMESTIC"
        },
        {
          "code": "CFU",
          "group": "LEISURE"
        },
        {
          "code": "CGN",
          "group": "CITY"
        },
        {
          "code": "CIY",
          "group": "DOMESTIC"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "CITY"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "EMA",
          "group": "CITY"
        },
        {
          "code": "FKB",
          "group": "CITY"
        },
        {
          "code": "GOT",
          "group": "CITY"
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "KRK",
          "group": "CITY"
        },
        {
          "code": "LDE",
          "group": "CITY"
        },
        {
          "code": "LIS",
          "group": "CITY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NUE",
          "group": "CITY"
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "OTP",
          "group": "CITY"
        },
        {
          "code": "PFO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PIK",
          "group": "CITY"
        },
        {
          "code": "PMI",
          "group": "LEISURE"
        },
        {
          "code": "PRG",
          "group": "CITY"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RBA",
          "group": "ETHNIC"
        },
        {
          "code": "SCQ",
          "group": null
        },
        {
          "code": "SDR",
          "group": "CITY"
        },
        {
          "code": "SKG",
          "group": "CITY_GOLD"
        },
        {
          "code": "SOF",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TRF",
          "group": null
        },
        {
          "code": "TRS",
          "group": null
        },
        {
          "code": "VLC",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CIA_v2.png"
    },
    {
      "code": "CIY",
      "name": "Comiso",
      "alternateName": null,
      "alias": [
        "comiso"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "365930N",
      "longitude": "0143625E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": null
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "CIA",
          "group": "DOMESTIC"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "FCO",
          "group": "DOMESTIC"
        },
        {
          "code": "HHN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MXP",
          "group": "DOMESTIC"
        },
        {
          "code": "NRN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "TRN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CIY_v2.png"
    },
    {
      "code": "CLJ",
      "name": "Cluj",
      "alternateName": "Cluj Airport",
      "alias": [
        "cluj",
        "airport"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "464700N",
      "longitude": "0234100E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "SEN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CLJ_v2.png"
    },
    {
      "code": "CND",
      "name": "Constanta",
      "alternateName": null,
      "alias": [
        "constanta"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "442100N",
      "longitude": "0282900E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CND_v2.png"
    },
    {
      "code": "CPH",
      "name": "Copenhagen",
      "alternateName": "Copenhagen T2",
      "alias": [
        "copenhagen",
        "t2"
      ],
      "countryCode": "DK",
      "countryName": "Denmark",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DK",
      "latitude": "553629N",
      "longitude": "0123800E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "CGN",
          "group": "CITY"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "CITY"
        },
        {
          "code": "KUN",
          "group": "ETHNIC"
        },
        {
          "code": "LPL",
          "group": null
        },
        {
          "code": "LTN",
          "group": "CITY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CPH_v2.png"
    },
    {
      "code": "CQM",
      "name": "Ciudad Real",
      "alternateName": null,
      "alias": [
        "ciudad",
        "real"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "385137N",
      "longitude": "0035933W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CQM_v2.png"
    },
    {
      "code": "CRA",
      "name": "Craiova",
      "alternateName": null,
      "alias": [
        "craiova"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "441908N",
      "longitude": "0235311E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CRA_v2.png"
    },
    {
      "code": "CRL",
      "name": "Brussels Charleroi",
      "alternateName": "Brussels (Charleroi)",
      "alias": [
        "brussels",
        "charleroi"
      ],
      "countryCode": "BE",
      "countryName": "Belgium",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "BE",
      "latitude": "502733N",
      "longitude": "0042714E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGA",
          "group": "ETHNIC"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AOI",
          "group": "CITY_GOLD"
        },
        {
          "code": "ATH",
          "group": "CITY_GOLD"
        },
        {
          "code": "BCN",
          "group": "CITY_GOLD"
        },
        {
          "code": "BDS",
          "group": "CITY_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BIQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BNX",
          "group": null
        },
        {
          "code": "BOD",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "BTS",
          "group": "ETHNIC"
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "CAG",
          "group": "CITY_GOLD"
        },
        {
          "code": "CCF",
          "group": "CITY_GOLD"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CIY",
          "group": "CITY_GOLD"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "CITY_GOLD"
        },
        {
          "code": "EGC",
          "group": "CITY_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FNI",
          "group": "CITY"
        },
        {
          "code": "FSC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GLA",
          "group": "CITY_GOLD"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LEI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LIG",
          "group": null
        },
        {
          "code": "LIS",
          "group": "CITY"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LRH",
          "group": "CITY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "MPL",
          "group": "CITY"
        },
        {
          "code": "MRS",
          "group": "CITY_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NDR",
          "group": "ETHNIC"
        },
        {
          "code": "NYO",
          "group": "CITY_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "OTP",
          "group": "ETHNIC"
        },
        {
          "code": "OUD",
          "group": "ETHNIC"
        },
        {
          "code": "PDV",
          "group": "ETHNIC"
        },
        {
          "code": "PEG",
          "group": "CITY_GOLD"
        },
        {
          "code": "PGF",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "PRG",
          "group": "ETHNIC"
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "PSR",
          "group": "CITY_GOLD"
        },
        {
          "code": "PUY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RBA",
          "group": "ETHNIC"
        },
        {
          "code": "RDZ",
          "group": "CITY_GOLD"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "RJK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SDR",
          "group": "CITY_GOLD"
        },
        {
          "code": "SKG",
          "group": "CITY_GOLD"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "SUF",
          "group": "CITY_GOLD",
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TGD",
          "group": "ETHNIC"
        },
        {
          "code": "TLS",
          "group": "CITY"
        },
        {
          "code": "TNG",
          "group": "ETHNIC"
        },
        {
          "code": "TRN",
          "group": "CITY"
        },
        {
          "code": "TSF",
          "group": "CITY_GOLD"
        },
        {
          "code": "VAR",
          "group": null
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VLL",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "VRN",
          "group": "CITY_GOLD"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ZAZ",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CRL_v2.png"
    },
    {
      "code": "CRV",
      "name": "Crotone",
      "alternateName": null,
      "alias": [
        "crotone"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "385948N",
      "longitude": "0170445E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CRV_v2.png"
    },
    {
      "code": "CSO",
      "name": "Magdeburg (Cochstedt)",
      "alternateName": null,
      "alias": [
        "magdeburg",
        "cochstedt"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "515121N",
      "longitude": "0112505E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CSO_v2.png"
    },
    {
      "code": "CTA",
      "name": "Catania",
      "alternateName": "Catania (Fontanarossa)",
      "alias": [
        "catania",
        "fontanarossa"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "372800N",
      "longitude": "0150350E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null
        },
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "ALC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": "DOMESTIC"
        },
        {
          "code": "BRE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "BRU",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ]
        },
        {
          "code": "BTS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BUD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EIN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "EMA",
          "group": null
        },
        {
          "code": "FCO",
          "group": "DOMESTIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "MXP",
          "group": "DOMESTIC"
        },
        {
          "code": "PEG",
          "group": "DOMESTIC"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TRN",
          "group": "DOMESTIC"
        },
        {
          "code": "TRS",
          "group": "DOMESTIC"
        },
        {
          "code": "TSF",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "VNO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CTA_v2.png"
    },
    {
      "code": "CUF",
      "name": "Cuneo",
      "alternateName": null,
      "alias": [
        "cuneo"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "443251N",
      "longitude": "0073723E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CAG",
          "group": "DOMESTIC_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CUF_v2.png"
    },
    {
      "code": "CWL",
      "name": "Cardiff",
      "alternateName": null,
      "alias": [
        "cardiff"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "512351N",
      "longitude": "0032048W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/CWL_v2.png"
    },
    {
      "code": "DBV",
      "name": "Dubrovnik",
      "alternateName": null,
      "alias": [
        "dubrovnik"
      ],
      "countryCode": "HR",
      "countryName": "Croatia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "HR",
      "latitude": "423348N",
      "longitude": "0181555E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DBV_v2.png"
    },
    {
      "code": "DLE",
      "name": "Dole",
      "alternateName": null,
      "alias": [
        "dole"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "470300N",
      "longitude": "0052600E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DLE_v2.png"
    },
    {
      "code": "DLM",
      "name": "Dalaman",
      "alternateName": null,
      "alias": [
        "dalaman"
      ],
      "countryCode": "TR",
      "countryName": "Turkey",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "TR",
      "latitude": "364300N",
      "longitude": "0284700E",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "DUB",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DLM_v2.png"
    },
    {
      "code": "DNR",
      "name": "Dinard",
      "alternateName": null,
      "alias": [
        "dinard"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "483516N",
      "longitude": "0020501W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "EMA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DNR_v2.png"
    },
    {
      "code": "DOL",
      "name": "Deauville",
      "alternateName": null,
      "alias": [
        "deauville"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "492146N",
      "longitude": "0000951E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DOL_v2.png"
    },
    {
      "code": "DRS",
      "name": "Dresden",
      "alternateName": "Dresden Airport",
      "alias": [
        "dresden",
        "airport"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "510800N",
      "longitude": "0134600E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DRS_v2.png"
    },
    {
      "code": "DSA",
      "name": "Doncaster",
      "alternateName": null,
      "alias": [
        "doncaster"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "532831N",
      "longitude": "0010014W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DSA_v2.png"
    },
    {
      "code": "DTM",
      "name": "Dortmund",
      "alternateName": null,
      "alias": [
        "dortmund"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "513100N",
      "longitude": "0073600E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AHO",
          "group": "LEISURE"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SKG",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DTM_v2.png"
    },
    {
      "code": "DUB",
      "name": "Dublin",
      "alternateName": "Dublin T1",
      "alias": [
        "dublin",
        "t1"
      ],
      "countryCode": "IE",
      "countryName": "Ireland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IE",
      "latitude": "532517N",
      "longitude": "0061612W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AAR",
          "group": null
        },
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AMS",
          "group": "CITY"
        },
        {
          "code": "ATH",
          "group": "LEISURE"
        },
        {
          "code": "BCN",
          "group": "CITY_GOLD"
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BHX",
          "group": "UKP_GOLD"
        },
        {
          "code": "BIO",
          "group": null
        },
        {
          "code": "BIQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRE",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "BRS",
          "group": "UKP_GOLD"
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "BSL",
          "group": "CITY"
        },
        {
          "code": "BTS",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "BZG",
          "group": "ETHNIC"
        },
        {
          "code": "CCF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CGN",
          "group": "CITY"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DLM",
          "group": null
        },
        {
          "code": "EDI",
          "group": "UKP_GOLD"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "EMA",
          "group": "UKP_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FCO",
          "group": "CITY"
        },
        {
          "code": "FMM",
          "group": "CITY_GOLD"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GLA",
          "group": "UKP_GOLD"
        },
        {
          "code": "GNB",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HAM",
          "group": "CITY"
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "LEISURE"
        },
        {
          "code": "INN",
          "group": null
        },
        {
          "code": "KRK",
          "group": "ETHNIC",
          "stops": []
        },
        {
          "code": "KTW",
          "group": "ETHNIC"
        },
        {
          "code": "KUN",
          "group": "ETHNIC"
        },
        {
          "code": "LBA",
          "group": "UKP_GOLD"
        },
        {
          "code": "LCJ",
          "group": "ETHNIC"
        },
        {
          "code": "LEI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LGW",
          "group": "UKP_GOLD"
        },
        {
          "code": "LIS",
          "group": "CITY"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "UKP_GOLD"
        },
        {
          "code": "LRH",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LTN",
          "group": "UKP_GOLD"
        },
        {
          "code": "LUX",
          "group": null
        },
        {
          "code": "LUZ",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "UKP_GOLD"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MUC",
          "group": null
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NCE",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NCL",
          "group": "UKP_GOLD"
        },
        {
          "code": "NTE",
          "group": "CITY_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "OTP",
          "group": "CITY"
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PIS",
          "group": "CITY"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "POZ",
          "group": "ETHNIC"
        },
        {
          "code": "PRG",
          "group": "CITY"
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RDZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RIX",
          "group": "CITY"
        },
        {
          "code": "RZE",
          "group": "ETHNIC"
        },
        {
          "code": "SDR",
          "group": "CITY_GOLD"
        },
        {
          "code": "SEN",
          "group": null
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "UKP_GOLD"
        },
        {
          "code": "STR",
          "group": null
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "SZG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SZZ",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TLL",
          "group": "CITY"
        },
        {
          "code": "TRN",
          "group": "LEISURE"
        },
        {
          "code": "TSF",
          "group": "CITY_GOLD"
        },
        {
          "code": "TUF",
          "group": "CITY_GOLD"
        },
        {
          "code": "VGO",
          "group": "CITY_GOLD"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "LEISURE"
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        },
        {
          "code": "ZAD",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DUB_v2.png"
    },
    {
      "code": "DUS",
      "name": "Dusseldorf Int.",
      "alternateName": "Düsseldorf",
      "alias": [
        "dusseldorf",
        "int"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "511652N",
      "longitude": "0064510E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null
        },
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "ALC",
          "group": null
        },
        {
          "code": "CFU",
          "group": null
        },
        {
          "code": "FAO",
          "group": null
        },
        {
          "code": "FUE",
          "group": null
        },
        {
          "code": "HER",
          "group": null
        },
        {
          "code": "IBZ",
          "group": null
        },
        {
          "code": "INN",
          "group": null
        },
        {
          "code": "KGS",
          "group": null
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "TFS",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/DUS_v2.png"
    },
    {
      "code": "EBJ",
      "name": "Esbjerg",
      "alternateName": null,
      "alias": [
        "esbjerg"
      ],
      "countryCode": "DK",
      "countryName": "Denmark",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DK",
      "latitude": "553135N",
      "longitude": "0083309E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/EBJ_v2.png"
    },
    {
      "code": "EBU",
      "name": "St. Etienne",
      "alternateName": null,
      "alias": [
        "st",
        "etienne"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "453229N",
      "longitude": "0041749E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/EBU_v2.png"
    },
    {
      "code": "EDI",
      "name": "Edinburgh",
      "alternateName": null,
      "alias": [
        "edinburgh"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "555655N",
      "longitude": "0032101W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": "LEISURE"
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BOD",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BRI",
          "group": null
        },
        {
          "code": "BTS",
          "group": "ETHNIC"
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "BZR",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CAG",
          "group": "LEISURE"
        },
        {
          "code": "CCF",
          "group": null
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DUB",
          "group": "UKP"
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FKB",
          "group": null
        },
        {
          "code": "FMM",
          "group": "CITY"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GNB",
          "group": null
        },
        {
          "code": "GOT",
          "group": "CITY"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HAM",
          "group": null
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "KTW",
          "group": "ETHNIC"
        },
        {
          "code": "KUN",
          "group": "ETHNIC"
        },
        {
          "code": "LDY",
          "group": null
        },
        {
          "code": "LIS",
          "group": null
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MPL",
          "group": null
        },
        {
          "code": "MRS",
          "group": "LEISURE"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NTE",
          "group": null
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "PIS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "POZ",
          "group": "ETHNIC"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "PSA",
          "group": "LEISURE"
        },
        {
          "code": "RIX",
          "group": null
        },
        {
          "code": "SDR",
          "group": "LEISURE"
        },
        {
          "code": "SOF",
          "group": null
        },
        {
          "code": "STN",
          "group": "DOMESTIC"
        },
        {
          "code": "SVQ",
          "group": null,
          "stops": []
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "SZZ",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TLL",
          "group": "ETHNIC"
        },
        {
          "code": "TLS",
          "group": null
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "VGO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VLC",
          "group": null
        },
        {
          "code": "WMI",
          "group": "ETHNIC",
          "stops": []
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/EDI_v2.png"
    },
    {
      "code": "EFL",
      "name": "Kefalonia",
      "alternateName": null,
      "alias": [
        "kefalonia"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "380712N",
      "longitude": "0203002E",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "PSA",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/EFL_v2.png"
    },
    {
      "code": "EGC",
      "name": "Bergerac",
      "alternateName": null,
      "alias": [
        "bergerac"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "445100N",
      "longitude": "0002900E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "EMA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LPL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/EGC_v2.png"
    },
    {
      "code": "EIN",
      "name": "Eindhoven",
      "alternateName": null,
      "alias": [
        "eindhoven"
      ],
      "countryCode": "NL",
      "countryName": "Netherlands",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NL",
      "latitude": "512712N",
      "longitude": "0052320E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AAR",
          "group": null
        },
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGA",
          "group": "ETHNIC"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BDS",
          "group": "CITY_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CTA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MRS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MXP",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "OMR",
          "group": null
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RBA",
          "group": null
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RIX",
          "group": null
        },
        {
          "code": "SKG",
          "group": null
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TNG",
          "group": null
        },
        {
          "code": "TSF",
          "group": "CITY_GOLD"
        },
        {
          "code": "VLC",
          "group": null
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/EIN_v2.png"
    },
    {
      "code": "EMA",
      "name": "East Midlands",
      "alternateName": null,
      "alias": [
        "east",
        "midlands"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "524948N",
      "longitude": "0011946W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "CCF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DNR",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "EGC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HHN",
          "group": null
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LCJ",
          "group": "ETHNIC"
        },
        {
          "code": "LIG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAH",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NOC",
          "group": "UKP_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "PSA",
          "group": "LEISURE"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "RZE",
          "group": "ETHNIC"
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SVQ",
          "group": "LEISURE"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TSF",
          "group": "CITY_GOLD"
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/EMA_v2.png"
    },
    {
      "code": "ERF",
      "name": "Erfurt",
      "alternateName": "Erfurt Airport",
      "alias": [
        "erfurt",
        "airport"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "505847N",
      "longitude": "0105729E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ERF_v2.png"
    },
    {
      "code": "ESU",
      "name": "Essaouira",
      "alternateName": null,
      "alias": [
        "essaouira"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "312411N",
      "longitude": "0094117W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "NRN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ESU_v2.png"
    },
    {
      "code": "ETM",
      "name": "Eilat Ramon",
      "alternateName": null,
      "alias": [
        "eilat",
        "ramon"
      ],
      "countryCode": "IL",
      "countryName": "Israel",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "IL",
      "latitude": "294325N",
      "longitude": "0350041E",
      "mobileBoardingPass": false,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ETM_v2.png"
    },
    {
      "code": "EVN",
      "name": "Yerevan - Zvartnots",
      "alternateName": "Yerevan-Zvartnots",
      "alias": [
        "yerevan",
        "zvartnots"
      ],
      "countryCode": "AM",
      "countryName": "Armenia",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "AM",
      "latitude": "400900N",
      "longitude": "0442400E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "EXT",
      "name": "Exeter",
      "alternateName": null,
      "alias": [
        "exeter"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "504403N",
      "longitude": "0032518W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "NAP",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/EXT_v2.png"
    },
    {
      "code": "FAO",
      "name": "Faro",
      "alternateName": null,
      "alias": [
        "faro"
      ],
      "countryCode": "PT",
      "countryName": "Portugal",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PT1",
      "latitude": "370052N",
      "longitude": "0075815W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ABZ",
          "group": "LEISURE"
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BFS",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY",
          "stops": [
            {
              "code": "OPO"
            }
          ]
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BOH",
          "group": "LEISURE"
        },
        {
          "code": "BRE",
          "group": "LEISURE"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BRU",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BVA",
          "group": "LEISURE"
        },
        {
          "code": "CGN",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "CWL",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FMM",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "HAM",
          "group": "LEISURE"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "KIR",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "LTN",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "NCL",
          "group": "LEISURE"
        },
        {
          "code": "NOC",
          "group": "LEISURE"
        },
        {
          "code": "NQY",
          "group": "LEISURE"
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "NUE",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "NYO",
          "group": "LEISURE"
        },
        {
          "code": "OPO",
          "group": "DOMESTIC"
        },
        {
          "code": "ORK",
          "group": "LEISURE"
        },
        {
          "code": "PIK",
          "group": "LEISURE"
        },
        {
          "code": "RIX",
          "group": null,
          "stops": []
        },
        {
          "code": "SEN",
          "group": null
        },
        {
          "code": "SNN",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SXF",
          "group": null
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FAO_v2.png"
    },
    {
      "code": "FCO",
      "name": "Rome Fiumicino",
      "alternateName": "Rome (Fiumicino) T3",
      "alias": [
        "rome",
        "fiumicino",
        "t3"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "414801N",
      "longitude": "0121420E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE"
        },
        {
          "code": "ALC",
          "group": "LEISURE"
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": "DOMESTIC"
        },
        {
          "code": "BRI",
          "group": "DOMESTIC"
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "CFU",
          "group": "LEISURE"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIY",
          "group": "DOMESTIC"
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "PMO",
          "group": "DOMESTIC"
        },
        {
          "code": "SVQ",
          "group": "CITY"
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FCO_v2.png"
    },
    {
      "code": "FDH",
      "name": "Friedrichshafen",
      "alternateName": null,
      "alias": [
        "friedrichshafen"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "474002N",
      "longitude": "0093045E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FDH_v2.png"
    },
    {
      "code": "FEZ",
      "name": "Fez",
      "alternateName": null,
      "alias": [
        "fez"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "335600N",
      "longitude": "0045800W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BCN",
          "group": "ETHNIC"
        },
        {
          "code": "BES",
          "group": null
        },
        {
          "code": "BGY",
          "group": "ETHNIC"
        },
        {
          "code": "BOD",
          "group": null
        },
        {
          "code": "BRE",
          "group": null
        },
        {
          "code": "BVA",
          "group": "ETHNIC"
        },
        {
          "code": "CFE",
          "group": null
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "DLE",
          "group": "ETHNIC"
        },
        {
          "code": "EIN",
          "group": "ETHNIC"
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "FNI",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "ETHNIC"
        },
        {
          "code": "HHN",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "ETHNIC"
        },
        {
          "code": "MRS",
          "group": "ETHNIC"
        },
        {
          "code": "NRN",
          "group": "ETHNIC"
        },
        {
          "code": "NTE",
          "group": "ETHNIC"
        },
        {
          "code": "PSA",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXB",
          "group": null
        },
        {
          "code": "TLS",
          "group": "ETHNIC"
        },
        {
          "code": "TRN",
          "group": null
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "TUF",
          "group": null
        },
        {
          "code": "VLC",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FEZ_v2.png"
    },
    {
      "code": "FKB",
      "name": "Karlsruhe / Baden-Baden",
      "alternateName": "Baden-Baden",
      "alias": [
        "karlsruhe",
        "baden"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "484646N",
      "longitude": "0080450E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "CAG",
          "group": "LEISURE"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LIS",
          "group": null
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "SKG",
          "group": "LEISURE"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": "CITY_GOLD"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "TPS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FKB_v2.png"
    },
    {
      "code": "FMM",
      "name": "Memmingen",
      "alternateName": null,
      "alias": [
        "memmingen"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "475933N",
      "longitude": "0101437E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BNX",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "EDI",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ]
        },
        {
          "code": "LWO",
          "group": null
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "OMR",
          "group": null
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "SKG",
          "group": null
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "WMI",
          "group": null
        },
        {
          "code": "ZAD",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FMM_v2.png"
    },
    {
      "code": "FMO",
      "name": "Münster",
      "alternateName": "Munster",
      "alias": [
        "munster"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "520805N",
      "longitude": "0074105E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "PMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FMO_v2.png"
    },
    {
      "code": "FNI",
      "name": "Nimes",
      "alternateName": "Nîmes",
      "alias": [
        "nimes"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "434500N",
      "longitude": "0042500E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "LTN",
          "group": "CITY"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FNI_v2.png"
    },
    {
      "code": "FRA",
      "name": "Frankfurt International",
      "alternateName": null,
      "alias": [
        "frankfurt",
        "international"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "500220N",
      "longitude": "0083414E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null
        },
        {
          "code": "AGA",
          "group": null
        },
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "ALC",
          "group": null
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BCN",
          "group": null
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "CFU",
          "group": null
        },
        {
          "code": "CHQ",
          "group": null
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "EFL",
          "group": null
        },
        {
          "code": "FAO",
          "group": null
        },
        {
          "code": "GRO",
          "group": null
        },
        {
          "code": "GVA",
          "group": null
        },
        {
          "code": "JMK",
          "group": null
        },
        {
          "code": "JTR",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LIS",
          "group": null
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MAD",
          "group": null
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MJV",
          "group": null
        },
        {
          "code": "MRS",
          "group": null
        },
        {
          "code": "OPO",
          "group": null
        },
        {
          "code": "PEG",
          "group": null
        },
        {
          "code": "PGF",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "PSA",
          "group": null
        },
        {
          "code": "PUY",
          "group": null
        },
        {
          "code": "RJK",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "VLC",
          "group": null
        },
        {
          "code": "ZAD",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FRA_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "FRL",
      "name": "Bologna (Forli)",
      "alternateName": null,
      "alias": [
        "bologna",
        "forli"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "441144N",
      "longitude": "0120411E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FRL_v2.png"
    },
    {
      "code": "FSC",
      "name": "Figari",
      "alternateName": null,
      "alias": [
        "figari"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "413000N",
      "longitude": "0090600E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BVA",
          "group": "DOMESTIC"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FSC_v2.png"
    },
    {
      "code": "FUE",
      "name": "Fuerteventura",
      "alternateName": null,
      "alias": [
        "fuerteventura"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES2",
      "latitude": "282709N",
      "longitude": "0135149W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BGY",
          "group": "CANARY"
        },
        {
          "code": "BHX",
          "group": "CANARY"
        },
        {
          "code": "BRE",
          "group": "CANARY"
        },
        {
          "code": "CRL",
          "group": "CANARY"
        },
        {
          "code": "DUB",
          "group": "CANARY"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "CANARY"
        },
        {
          "code": "EMA",
          "group": "CANARY"
        },
        {
          "code": "LBA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "CANARY"
        },
        {
          "code": "LTN",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": "CANARY"
        },
        {
          "code": "NRN",
          "group": "CANARY"
        },
        {
          "code": "PIK",
          "group": "CANARY"
        },
        {
          "code": "PSA",
          "group": "CANARY"
        },
        {
          "code": "SNN",
          "group": "CANARY"
        },
        {
          "code": "STN",
          "group": "CANARY"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXF",
          "group": "CANARY"
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "WMI",
          "group": "CANARY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/FUE_v2.png"
    },
    {
      "code": "GDN",
      "name": "Gdansk",
      "alternateName": "Gdańsk",
      "alias": [
        "gdansk"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "542241N",
      "longitude": "0182803E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AAR",
          "group": null
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BFS",
          "group": "ETHNIC"
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BHX",
          "group": "ETHNIC"
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "CFU",
          "group": null
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EDI",
          "group": "ETHNIC"
        },
        {
          "code": "EFL",
          "group": null
        },
        {
          "code": "HER",
          "group": null
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "KGS",
          "group": null
        },
        {
          "code": "KRK",
          "group": "DOMESTIC"
        },
        {
          "code": "LBA",
          "group": "ETHNIC"
        },
        {
          "code": "MAN",
          "group": "ETHNIC"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NCL",
          "group": "ETHNIC"
        },
        {
          "code": "NYO",
          "group": "ETHNIC"
        },
        {
          "code": "ORK",
          "group": "ETHNIC"
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "TRF",
          "group": "ETHNIC"
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VXO",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GDN_v2.png"
    },
    {
      "code": "GLA",
      "name": "Glasgow",
      "alternateName": "Glasgow T2",
      "alias": [
        "glasgow",
        "t2"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "555200N",
      "longitude": "0042600W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": null
        },
        {
          "code": "BZG",
          "group": "ETHNIC"
        },
        {
          "code": "CCF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LDY",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "LIS",
          "group": "CITY"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": null
        },
        {
          "code": "PLQ",
          "group": "ETHNIC"
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "DOMESTIC"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "VLC",
          "group": "LEISURE"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GLA_v2.png"
    },
    {
      "code": "GNB",
      "name": "Grenoble",
      "alternateName": null,
      "alias": [
        "grenoble"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "452146N",
      "longitude": "0051947E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GNB_v2.png"
    },
    {
      "code": "GOA",
      "name": "Genoa",
      "alternateName": null,
      "alias": [
        "genoa"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "442448N",
      "longitude": "0085015E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRI",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GOA_v2.png"
    },
    {
      "code": "GOT",
      "name": "Göteborg Landvetter",
      "alternateName": "Gottenburg Landvetter",
      "alias": [
        "goteborg",
        "landvetter",
        "gottenburg"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "574000N",
      "longitude": "0121700E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "EDI",
          "group": "CITY"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "MLA",
          "group": "LEISURE"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GOT_v2.png"
    },
    {
      "code": "GPA",
      "name": "Patras",
      "alternateName": null,
      "alias": [
        "patras"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "380904N",
      "longitude": "0212532E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GPA_v2.png"
    },
    {
      "code": "GRO",
      "name": "Barcelona Girona",
      "alternateName": "Girona (Barcelona)",
      "alias": [
        "barcelona",
        "girona"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "415403N",
      "longitude": "0024538E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BFS",
          "group": "LEISURE"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BOH",
          "group": "LEISURE"
        },
        {
          "code": "BRE",
          "group": "LEISURE"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BTS",
          "group": "LEISURE"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EDI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FKB",
          "group": "LEISURE"
        },
        {
          "code": "FMM",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "KRK",
          "group": "LEISURE"
        },
        {
          "code": "KUN",
          "group": null
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "LTN",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MST",
          "group": "LEISURE"
        },
        {
          "code": "NCL",
          "group": "LEISURE"
        },
        {
          "code": "NDR",
          "group": "ETHNIC"
        },
        {
          "code": "NOC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "OMR",
          "group": "CITY"
        },
        {
          "code": "ORK",
          "group": "LEISURE"
        },
        {
          "code": "PIK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "POZ",
          "group": "LEISURE"
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "PSR",
          "group": "CITY"
        },
        {
          "code": "RBA",
          "group": "ETHNIC"
        },
        {
          "code": "RIX",
          "group": null
        },
        {
          "code": "SKG",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "TLL",
          "group": "CITY"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "WRO",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GRO_v2.png"
    },
    {
      "code": "GRQ",
      "name": "Groningen",
      "alternateName": null,
      "alias": [
        "groningen"
      ],
      "countryCode": "NL",
      "countryName": "Netherlands",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NL",
      "latitude": "530713N",
      "longitude": "0063432E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GRQ_v2.png"
    },
    {
      "code": "GRX",
      "name": "Granada",
      "alternateName": null,
      "alias": [
        "granada"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "371119N",
      "longitude": "0034638W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GRX_v2.png"
    },
    {
      "code": "GRZ",
      "name": "Graz",
      "alternateName": null,
      "alias": [
        "graz"
      ],
      "countryCode": "AT",
      "countryName": "Austria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "AT",
      "latitude": "465937N",
      "longitude": "0152624E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "PMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GRZ_v2.png"
    },
    {
      "code": "GSE",
      "name": "Gothenburg City",
      "alternateName": null,
      "alias": [
        "gothenburg",
        "city"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "574606N",
      "longitude": "0115204E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/GSE_v2.png"
    },
    {
      "code": "HAJ",
      "name": "Hannover",
      "alternateName": null,
      "alias": [
        "hannover"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "522740N",
      "longitude": "0094106E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "PMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/HAJ_v2.png"
    },
    {
      "code": "HAM",
      "name": "Hamburg",
      "alternateName": null,
      "alias": [
        "hamburg"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "533749N",
      "longitude": "0095918E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "TRF",
          "group": null
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "VLC",
          "group": null
        },
        {
          "code": "VRN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/HAM_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "HAU",
      "name": "Haugesund",
      "alternateName": null,
      "alias": [
        "haugesund"
      ],
      "countryCode": "NO",
      "countryName": "Norway",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NO",
      "latitude": "592038N",
      "longitude": "0051253E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/HAU_v2.png"
    },
    {
      "code": "HEL",
      "name": "Helsinki",
      "alternateName": "Helsinki-Vantaa Airport",
      "alias": [
        "helsinki",
        "vantaa",
        "airport"
      ],
      "countryCode": "FI",
      "countryName": "Finland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FI",
      "latitude": "601932N",
      "longitude": "0245818E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "HER",
      "name": "Heraklion Crete",
      "alternateName": null,
      "alias": [
        "heraklion",
        "crete"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "352023N",
      "longitude": "0251049E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/HER_v2.png"
    },
    {
      "code": "HHN",
      "name": "Frankfurt Hahn",
      "alternateName": "Frankfurt (Hahn)",
      "alias": [
        "frankfurt",
        "hahn"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "495700N",
      "longitude": "0071600E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AOI",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "CAG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CFU",
          "group": "LEISURE"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CIY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "EDI",
          "group": "CITY_GOLD"
        },
        {
          "code": "EMA",
          "group": null
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KIR",
          "group": "CITY_GOLD"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MPL",
          "group": "CITY_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NDR",
          "group": "ETHNIC"
        },
        {
          "code": "NQY",
          "group": "CITY_GOLD"
        },
        {
          "code": "PDL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "PSR",
          "group": "CITY_GOLD"
        },
        {
          "code": "PUY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "SCQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TNG",
          "group": "ETHNIC"
        },
        {
          "code": "TPS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "TRF",
          "group": "CITY"
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "XRY",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/HHN_v2.png"
    },
    {
      "code": "HRK",
      "name": "Kharkiv International",
      "alternateName": "Kharkov Airport",
      "alias": [
        "kharkiv",
        "international",
        "kharkov",
        "airport"
      ],
      "countryCode": "UA",
      "countryName": "Ukraine",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "UA",
      "latitude": "495600N",
      "longitude": "0361700E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/HRK_v2.png"
    },
    {
      "code": "HUY",
      "name": "Humberside",
      "alternateName": null,
      "alias": [
        "humberside"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "533500N",
      "longitude": "0002100W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/HUY_v2.png"
    },
    {
      "code": "IBZ",
      "name": "Ibiza",
      "alternateName": null,
      "alias": [
        "ibiza"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "385225N",
      "longitude": "0012222E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "DOMESTIC"
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": "LEISURE"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BUD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CAG",
          "group": "LEISURE",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CGN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FCO",
          "group": "LEISURE"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MRS",
          "group": "LEISURE"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "PIK",
          "group": "LEISURE"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSA",
          "group": "LEISURE"
        },
        {
          "code": "PSR",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SXF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TRN",
          "group": "LEISURE"
        },
        {
          "code": "TSF",
          "group": "LEISURE"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/IBZ_v2.png"
    },
    {
      "code": "ILD",
      "name": "Lleida",
      "alternateName": null,
      "alias": [
        "lleida"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "414341N",
      "longitude": "0003207E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ILD_v2.png"
    },
    {
      "code": "INI",
      "name": "Nis",
      "alternateName": null,
      "alias": [
        "nis"
      ],
      "countryCode": "RS",
      "countryName": "Serbia",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "RS",
      "latitude": "432002N",
      "longitude": "0215106E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BTS",
          "group": "ETHNIC"
        },
        {
          "code": "NRN",
          "group": "ETHNIC"
        },
        {
          "code": "NYO",
          "group": null
        },
        {
          "code": "SXF",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/INI_v2.png"
    },
    {
      "code": "INN",
      "name": "Innsbruck",
      "alternateName": null,
      "alias": [
        "innsbruck"
      ],
      "countryCode": "AT",
      "countryName": "Austria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "AT",
      "latitude": "471537N",
      "longitude": "0112038E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/INN_v2.png"
    },
    {
      "code": "INV",
      "name": "Inverness",
      "alternateName": null,
      "alias": [
        "inverness"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "573233N",
      "longitude": "0040254W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/INV_v2.png"
    },
    {
      "code": "JKG",
      "name": "Jonkoping (Axamo)",
      "alternateName": null,
      "alias": [
        "jonkoping",
        "axamo"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "574531N",
      "longitude": "0140419E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/JKG_v2.png"
    },
    {
      "code": "JMK",
      "name": "Mykonos",
      "alternateName": null,
      "alias": [
        "mykonos"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "372606N",
      "longitude": "0252053E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/JMK_v2.png"
    },
    {
      "code": "JSI",
      "name": "Skiathos",
      "alternateName": "Alex. Papadiamantis",
      "alias": [
        "skiathos",
        "alex",
        "papadiamantis"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "391038N",
      "longitude": "0233013E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "JTR",
      "name": "Santorini",
      "alternateName": null,
      "alias": [
        "santorini"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "362357N",
      "longitude": "0252846E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": "DOMESTIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/JTR_v2.png"
    },
    {
      "code": "KBP",
      "name": "Kyiv",
      "alternateName": "Kyiv - Borispol TF",
      "alias": [
        "kyiv",
        "borispol",
        "tf",
        "kiev",
        "boryspil"
      ],
      "countryCode": "UA",
      "countryName": "Ukraine",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "UA",
      "latitude": "502100N",
      "longitude": "0305500E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": null,
          "pendingApproval": true
        },
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "BZG",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "NYO",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "STN",
          "group": null,
          "pendingApproval": true
        },
        {
          "code": "SXF",
          "group": null
        },
        {
          "code": "VNO",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KBP_v2.png"
    },
    {
      "code": "KGS",
      "name": "Kos",
      "alternateName": null,
      "alias": [
        "kos"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "364736N",
      "longitude": "0270530E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KGS_v2.png"
    },
    {
      "code": "KHE",
      "name": "Kherson",
      "alternateName": "Kherson Airport",
      "alias": [
        "kherson",
        "airport"
      ],
      "countryCode": "UA",
      "countryName": "Ukraine",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "UA",
      "latitude": "464024N",
      "longitude": "0323053E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "KID",
      "name": "Kristianstad",
      "alternateName": null,
      "alias": [
        "kristianstad"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "555510N",
      "longitude": "0140520E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KID_v2.png"
    },
    {
      "code": "KIR",
      "name": "Kerry",
      "alternateName": null,
      "alias": [
        "kerry"
      ],
      "countryCode": "IE",
      "countryName": "Ireland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IE",
      "latitude": "521051N",
      "longitude": "0093126W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "LTN",
          "group": "UKP_GOLD"
        },
        {
          "code": "STN",
          "group": "UKP_GOLD"
        },
        {
          "code": "SXF",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KIR_v2.png"
    },
    {
      "code": "KLR",
      "name": "Kalmar",
      "alternateName": null,
      "alias": [
        "kalmar"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "564106N",
      "longitude": "0161714E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KLR_v2.png"
    },
    {
      "code": "KLU",
      "name": "Klagenfurt",
      "alternateName": null,
      "alias": [
        "klagenfurt"
      ],
      "countryCode": "AT",
      "countryName": "Austria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "AT",
      "latitude": "463835N",
      "longitude": "0142030E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KLU_v2.png"
    },
    {
      "code": "KLX",
      "name": "Kalamata",
      "alternateName": null,
      "alias": [
        "kalamata"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "370406N",
      "longitude": "0220132E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "VIE",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KLX_v2.png"
    },
    {
      "code": "KRK",
      "name": "Krakow",
      "alternateName": null,
      "alias": [
        "krakow"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "500500N",
      "longitude": "0194700E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BCN",
          "group": null
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BFS",
          "group": "ETHNIC"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BHX",
          "group": "ETHNIC"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BOH",
          "group": "ETHNIC"
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "DTM",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "ETHNIC",
          "stops": []
        },
        {
          "code": "EDI",
          "group": "ETHNIC"
        },
        {
          "code": "EIN",
          "group": "ETHNIC"
        },
        {
          "code": "EMA",
          "group": "ETHNIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GDN",
          "group": "DOMESTIC"
        },
        {
          "code": "GLA",
          "group": null
        },
        {
          "code": "GOT",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "LBA",
          "group": "ETHNIC"
        },
        {
          "code": "LDE",
          "group": "CITY"
        },
        {
          "code": "LIS",
          "group": null
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "ETHNIC"
        },
        {
          "code": "LWO",
          "group": null
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "ETHNIC"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MMX",
          "group": null
        },
        {
          "code": "MRS",
          "group": null
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NUE",
          "group": null
        },
        {
          "code": "NYO",
          "group": "ETHNIC"
        },
        {
          "code": "OPO",
          "group": "LEISURE"
        },
        {
          "code": "PFO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "PSR",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "SNN",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXF",
          "group": null
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "TRF",
          "group": "ETHNIC"
        },
        {
          "code": "TSF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VAR",
          "group": null
        },
        {
          "code": "VDA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KRK_v2.png"
    },
    {
      "code": "KSC",
      "name": "Kosice",
      "alternateName": "Barca",
      "alias": [
        "kosice",
        "barca"
      ],
      "countryCode": "SK",
      "countryName": "Slovakia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SK",
      "latitude": "484000N",
      "longitude": "0211500E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "SEN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KSC_v2.png"
    },
    {
      "code": "KSD",
      "name": "Karlstad",
      "alternateName": null,
      "alias": [
        "karlstad"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "592649N",
      "longitude": "0132029E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KSD_v2.png"
    },
    {
      "code": "KTW",
      "name": "Katowice",
      "alternateName": null,
      "alias": [
        "katowice"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "502900N",
      "longitude": "0190500E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "AYT",
          "group": null
        },
        {
          "code": "BCN",
          "group": null
        },
        {
          "code": "BHX",
          "group": "ETHNIC"
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EDI",
          "group": "ETHNIC"
        },
        {
          "code": "GPA",
          "group": null
        },
        {
          "code": "HAM",
          "group": null
        },
        {
          "code": "HER",
          "group": null
        },
        {
          "code": "KGS",
          "group": null
        },
        {
          "code": "LCA",
          "group": null
        },
        {
          "code": "MXP",
          "group": null
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "TIA",
          "group": null
        },
        {
          "code": "VAR",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        },
        {
          "code": "ZTH",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KTW_v2.png"
    },
    {
      "code": "KUN",
      "name": "Kaunas",
      "alternateName": null,
      "alias": [
        "kaunas"
      ],
      "countryCode": "LT",
      "countryName": "Lithuania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "LT",
      "latitude": "545752N",
      "longitude": "0240429E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BLQ",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "CPH",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EDI",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": null
        },
        {
          "code": "LTN",
          "group": "ETHNIC"
        },
        {
          "code": "MXP",
          "group": null
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "PFO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RMI",
          "group": null
        },
        {
          "code": "SNN",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "VDA",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/KUN_v2.png"
    },
    {
      "code": "KUT",
      "name": "Kutaisi",
      "alternateName": null,
      "alias": [
        "kutaisi"
      ],
      "countryCode": "GE",
      "countryName": "Georgia",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "GE",
      "latitude": "421459N",
      "longitude": "0423715E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "KVA",
      "name": "Kavala International",
      "alternateName": "Megas Alexandros",
      "alias": [
        "kavala",
        "international",
        "megas",
        "alexandros"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "405448N",
      "longitude": "0243709E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "LBA",
      "name": "Leeds Bradford",
      "alternateName": null,
      "alias": [
        "leeds",
        "bradford"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "535155N",
      "longitude": "0013917W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BTS",
          "group": "ETHNIC"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LIG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TSF",
          "group": "CITY_GOLD"
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LBA_v2.png"
    },
    {
      "code": "LBC",
      "name": "Hamburg (Lübeck)",
      "alternateName": null,
      "alias": [
        "hamburg",
        "lubeck"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "534819N",
      "longitude": "0104309E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LBC_v2.png"
    },
    {
      "code": "LBG",
      "name": "Le Bourget",
      "alternateName": null,
      "alias": [
        "le",
        "bourget"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "485819N",
      "longitude": "0022633E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LBG_v2.png"
    },
    {
      "code": "LCA",
      "name": "Larnaca",
      "alternateName": null,
      "alias": [
        "larnaca"
      ],
      "countryCode": "CY",
      "countryName": "Cyprus",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "CY",
      "latitude": "345230N",
      "longitude": "0333729E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRU",
          "group": "LEISURE"
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LCA_v2.png"
    },
    {
      "code": "LCJ",
      "name": "Lodz",
      "alternateName": null,
      "alias": [
        "lodz"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "514319N",
      "longitude": "0192354E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EMA",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LCJ_v2.png"
    },
    {
      "code": "LDE",
      "name": "Lourdes",
      "alternateName": null,
      "alias": [
        "lourdes"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "431055N",
      "longitude": "0000013W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "KRK",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LDE_v2.png"
    },
    {
      "code": "LDY",
      "name": "Derry",
      "alternateName": null,
      "alias": [
        "derry"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "550236N",
      "longitude": "0070912W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "GLA",
          "group": "DOMESTIC"
        },
        {
          "code": "LPL",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LDY_v2.png"
    },
    {
      "code": "LEI",
      "name": "Almeria",
      "alternateName": null,
      "alias": [
        "almeria"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "365040N",
      "longitude": "0022220W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "STN",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LEI_v2.png"
    },
    {
      "code": "LEJ",
      "name": "Leipzig",
      "alternateName": null,
      "alias": [
        "leipzig"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "512557N",
      "longitude": "0121430E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LEJ_v2.png"
    },
    {
      "code": "LGW",
      "name": "London Gatwick",
      "alternateName": "London (Gatwick)",
      "alias": [
        "london",
        "gatwick"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "510853N",
      "longitude": "0001148W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "ORK",
          "group": "UKP_GOLD"
        },
        {
          "code": "SNN",
          "group": "UKP_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LGW_v2.png"
    },
    {
      "code": "LIG",
      "name": "Limoges",
      "alternateName": null,
      "alias": [
        "limoges"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "455139N",
      "longitude": "0011049E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": null
        },
        {
          "code": "EMA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LIG_v2.png"
    },
    {
      "code": "LIL",
      "name": "Lille",
      "alternateName": null,
      "alias": [
        "lille"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "503352N",
      "longitude": "0030517E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "MRS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LIL_v2.png"
    },
    {
      "code": "LIS",
      "name": "Lisbon",
      "alternateName": "Lisbon T1",
      "alias": [
        "lisbon",
        "t1"
      ],
      "countryCode": "PT",
      "countryName": "Portugal",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PT1",
      "latitude": "384655N",
      "longitude": "0090800W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRE",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CGN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DTM",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "FKB",
          "group": null
        },
        {
          "code": "FMM",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ]
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GLA",
          "group": "CITY"
        },
        {
          "code": "HAM",
          "group": "CITY"
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LUX",
          "group": "CITY"
        },
        {
          "code": "MAD",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "MXP",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NRN",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OPO",
          "group": "DOMESTIC"
        },
        {
          "code": "PDL",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "PMI",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TER",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "TLS",
          "group": "CITY"
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ]
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LIS_v2.png"
    },
    {
      "code": "LNZ",
      "name": "Linz",
      "alternateName": null,
      "alias": [
        "linz"
      ],
      "countryCode": "AT",
      "countryName": "Austria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "AT",
      "latitude": "481400N",
      "longitude": "0141115E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LNZ_v2.png"
    },
    {
      "code": "LPA",
      "name": "Gran Canaria",
      "alternateName": null,
      "alias": [
        "gran",
        "canaria"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES2",
      "latitude": "275555N",
      "longitude": "0152312W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null
        },
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CANARY"
        },
        {
          "code": "BHX",
          "group": "CANARY"
        },
        {
          "code": "BLQ",
          "group": "CANARY"
        },
        {
          "code": "BOH",
          "group": "CANARY"
        },
        {
          "code": "BRI",
          "group": null
        },
        {
          "code": "BRS",
          "group": "CANARY"
        },
        {
          "code": "BUD",
          "group": "CANARY"
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "CGN",
          "group": "CANARY"
        },
        {
          "code": "CRL",
          "group": "CANARY"
        },
        {
          "code": "DUB",
          "group": "CANARY"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "CANARY"
        },
        {
          "code": "EIN",
          "group": "CANARY"
        },
        {
          "code": "EMA",
          "group": "CANARY"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GLA",
          "group": "CANARY"
        },
        {
          "code": "HAM",
          "group": "CANARY"
        },
        {
          "code": "HHN",
          "group": "CANARY"
        },
        {
          "code": "KRK",
          "group": "CANARY"
        },
        {
          "code": "LBA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "CANARY"
        },
        {
          "code": "LTN",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": "CANARY"
        },
        {
          "code": "MXP",
          "group": "CANARY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NRN",
          "group": "CANARY"
        },
        {
          "code": "NYO",
          "group": "CANARY"
        },
        {
          "code": "OPO",
          "group": "CANARY"
        },
        {
          "code": "ORK",
          "group": "CANARY"
        },
        {
          "code": "PIK",
          "group": "CANARY"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CANARY"
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "STN",
          "group": "CANARY"
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SXF",
          "group": "CANARY"
        },
        {
          "code": "TRF",
          "group": "CANARY"
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        },
        {
          "code": "WMI",
          "group": "CANARY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LPA_v2.png"
    },
    {
      "code": "LPL",
      "name": "Liverpool",
      "alternateName": null,
      "alias": [
        "liverpool"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "532018N",
      "longitude": "0025200W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BRI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CPH",
          "group": null
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "EGC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LDY",
          "group": "DOMESTIC"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MXP",
          "group": null
        },
        {
          "code": "NOC",
          "group": "UKP_GOLD"
        },
        {
          "code": "OPO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ORK",
          "group": "UKP_GOLD"
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "POZ",
          "group": "ETHNIC"
        },
        {
          "code": "PRG",
          "group": "ETHNIC"
        },
        {
          "code": "PSA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SDR",
          "group": null
        },
        {
          "code": "SNN",
          "group": "UKP"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "SZZ",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "VLC",
          "group": null
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LPL_v2.png"
    },
    {
      "code": "LPP",
      "name": "Lappeenranta",
      "alternateName": null,
      "alias": [
        "lappeenranta"
      ],
      "countryCode": "FI",
      "countryName": "Finland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FI",
      "latitude": "610246N",
      "longitude": "0280924E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LPP_v2.png"
    },
    {
      "code": "LRH",
      "name": "La Rochelle",
      "alternateName": null,
      "alias": [
        "la",
        "rochelle"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "461050N",
      "longitude": "0011109W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "ORK",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LRH_v2.png"
    },
    {
      "code": "LRT",
      "name": "Lorient",
      "alternateName": null,
      "alias": [
        "lorient"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "474540N",
      "longitude": "0032621W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LRT_v2.png"
    },
    {
      "code": "LTN",
      "name": "London Luton",
      "alternateName": "London (Luton)",
      "alias": [
        "london",
        "luton"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "515300N",
      "longitude": "0002106W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "BZG",
          "group": null
        },
        {
          "code": "BZR",
          "group": "CITY_GOLD"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FNI",
          "group": "CITY_GOLD"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KIR",
          "group": "UKP_GOLD"
        },
        {
          "code": "KUN",
          "group": "ETHNIC"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NOC",
          "group": "UKP_GOLD"
        },
        {
          "code": "RAK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RZE",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LTN_v2.png"
    },
    {
      "code": "LUX",
      "name": "Luxembourg",
      "alternateName": null,
      "alias": [
        "luxembourg"
      ],
      "countryCode": "LU",
      "countryName": "Luxembourg",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "LU",
      "latitude": "493740N",
      "longitude": "0061224E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LUX_v2.png"
    },
    {
      "code": "LUZ",
      "name": "Lublin",
      "alternateName": null,
      "alias": [
        "lublin"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "511419N",
      "longitude": "0224248E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LUZ_v2.png"
    },
    {
      "code": "LWN",
      "name": "Gyumri – Shirak",
      "alternateName": "Shirak Airport",
      "alias": [
        "gyumri",
        "shirak",
        "airport"
      ],
      "countryCode": "AM",
      "countryName": "Armenia",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "AM",
      "latitude": "404300N",
      "longitude": "0435000E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "LWO",
      "name": "Lviv",
      "alternateName": "Snilow",
      "alias": [
        "lviv",
        "snilow"
      ],
      "countryCode": "UA",
      "countryName": "Ukraine",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "UA",
      "latitude": "494900N",
      "longitude": "0235100E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "NRN",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LWO_v2.png"
    },
    {
      "code": "LYS",
      "name": "Lyon",
      "alternateName": "Lyon Satolas",
      "alias": [
        "lyon",
        "satolas"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "454332N",
      "longitude": "0050454E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/LYS_v2.png"
    },
    {
      "code": "MAD",
      "name": "Madrid",
      "alternateName": "Madrid T1",
      "alias": [
        "madrid",
        "t1"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "402820N",
      "longitude": "0033348W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BHX",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "CITY"
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "BTS",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "CITY_GOLD"
        },
        {
          "code": "CGN",
          "group": "CITY"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "GLA",
          "group": null
        },
        {
          "code": "HAM",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "DOMESTIC"
        },
        {
          "code": "KRK",
          "group": "CITY"
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": "DOMESTIC"
        },
        {
          "code": "LUX",
          "group": "CITY"
        },
        {
          "code": "MAH",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NCL",
          "group": "CITY"
        },
        {
          "code": "NUE",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": "DOMESTIC"
        },
        {
          "code": "OTP",
          "group": "CITY"
        },
        {
          "code": "OZZ",
          "group": null
        },
        {
          "code": "PMI",
          "group": "DOMESTIC"
        },
        {
          "code": "PMO",
          "group": "CITY_GOLD"
        },
        {
          "code": "POZ",
          "group": "CITY"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "PSR",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RBA",
          "group": "ETHNIC"
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SOF",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFN",
          "group": "DOMESTIC"
        },
        {
          "code": "TFS",
          "group": "DOMESTIC"
        },
        {
          "code": "TLS",
          "group": "CITY"
        },
        {
          "code": "TNG",
          "group": "ETHNIC"
        },
        {
          "code": "TPS",
          "group": "CITY",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VNO",
          "group": "CITY"
        },
        {
          "code": "VRN",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MAD_v2.png"
    },
    {
      "code": "MAH",
      "name": "Menorca",
      "alternateName": "Mahon",
      "alias": [
        "menorca",
        "mahon"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "395141N",
      "longitude": "0041255E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        },
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MAH_v2.png"
    },
    {
      "code": "MAN",
      "name": "Manchester",
      "alternateName": "Manchester T1",
      "alias": [
        "manchester",
        "t1"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "532112N",
      "longitude": "0021636W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGA",
          "group": null
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BCN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BDS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BFS",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BIQ",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "BRI",
          "group": null
        },
        {
          "code": "BTS",
          "group": "ETHNIC"
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "BZR",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "CCF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HAM",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LEI",
          "group": null
        },
        {
          "code": "LIG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LIS",
          "group": "CITY"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NUE",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": null
        },
        {
          "code": "PDL",
          "group": null
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "PSR",
          "group": null
        },
        {
          "code": "REU",
          "group": "LEISURE"
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "RZE",
          "group": "ETHNIC"
        },
        {
          "code": "SNN",
          "group": "UKP_GOLD"
        },
        {
          "code": "STR",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TRF",
          "group": "CITY"
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MAN_v2.png"
    },
    {
      "code": "MBX",
      "name": "Maribor",
      "alternateName": null,
      "alias": [
        "maribor"
      ],
      "countryCode": "SI",
      "countryName": "Slovenia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SI",
      "latitude": "463300N",
      "longitude": "0153900E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MBX_v2.png"
    },
    {
      "code": "MJV",
      "name": "Murcia",
      "alternateName": null,
      "alias": [
        "murcia"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "374629N",
      "longitude": "0004840W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BOH",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LTN",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "PIK",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MJV_v2.png"
    },
    {
      "code": "MLA",
      "name": "Malta",
      "alternateName": null,
      "alias": [
        "malta"
      ],
      "countryCode": "MT",
      "countryName": "Malta",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "MT",
      "latitude": "355114N",
      "longitude": "0142859E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ABZ",
          "group": null
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ]
        },
        {
          "code": "BFS",
          "group": null
        },
        {
          "code": "BGY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BLQ",
          "group": "LEISURE"
        },
        {
          "code": "BOH",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BRI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "BUD",
          "group": "LEISURE"
        },
        {
          "code": "BVA",
          "group": null
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CGN",
          "group": "LEISURE"
        },
        {
          "code": "CIA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CRL",
          "group": null
        },
        {
          "code": "CTA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "EXT",
          "group": null
        },
        {
          "code": "FCO",
          "group": "LEISURE"
        },
        {
          "code": "FKB",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "GDN",
          "group": "LEISURE"
        },
        {
          "code": "GOT",
          "group": "LEISURE"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LPL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LTN",
          "group": "LEISURE"
        },
        {
          "code": "MAD",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MRS",
          "group": "LEISURE"
        },
        {
          "code": "NAP",
          "group": "LEISURE"
        },
        {
          "code": "NUE",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NYO",
          "group": "LEISURE"
        },
        {
          "code": "OPO",
          "group": null
        },
        {
          "code": "PIK",
          "group": "LEISURE"
        },
        {
          "code": "POZ",
          "group": "LEISURE"
        },
        {
          "code": "PSA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSR",
          "group": null
        },
        {
          "code": "RIX",
          "group": null
        },
        {
          "code": "SKG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SVQ",
          "group": "LEISURE"
        },
        {
          "code": "SXF",
          "group": "LEISURE"
        },
        {
          "code": "TLL",
          "group": null
        },
        {
          "code": "TLS",
          "group": "LEISURE"
        },
        {
          "code": "TRN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "TSF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VNO",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MLA_v2.png"
    },
    {
      "code": "MME",
      "name": "Durham Tees",
      "alternateName": null,
      "alias": [
        "durham",
        "tees"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "543100N",
      "longitude": "0012500W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MME_v2.png"
    },
    {
      "code": "MMX",
      "name": "Malmo",
      "alternateName": "Malmö",
      "alias": [
        "malmo"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "553140N",
      "longitude": "0132207E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "KRK",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MMX_v2.png"
    },
    {
      "code": "MPL",
      "name": "Montpellier",
      "alternateName": null,
      "alias": [
        "montpellier"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "433451N",
      "longitude": "0035803E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "HHN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MPL_v2.png"
    },
    {
      "code": "MRS",
      "name": "Marseille",
      "alternateName": "Marseille T2",
      "alias": [
        "marseille",
        "t2"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "432608N",
      "longitude": "0051259E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BES",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": "CITY_GOLD",
          "onlyPrintedBoardingPass": true
        },
        {
          "code": "EDI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "EIN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "CITY_GOLD"
        },
        {
          "code": "FCO",
          "group": "CITY"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LIL",
          "group": "DOMESTIC"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NDR",
          "group": "ETHNIC"
        },
        {
          "code": "NTE",
          "group": "DOMESTIC"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "OTP",
          "group": null
        },
        {
          "code": "OUD",
          "group": "ETHNIC"
        },
        {
          "code": "PIS",
          "group": "DOMESTIC"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RBA",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": null,
          "onlyPrintedBoardingPass": true
        },
        {
          "code": "TNG",
          "group": "ETHNIC"
        },
        {
          "code": "TUF",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "VLC",
          "group": "CITY_GOLD"
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MRS_v2.png"
    },
    {
      "code": "MST",
      "name": "Maastricht",
      "alternateName": null,
      "alias": [
        "maastricht"
      ],
      "countryCode": "NL",
      "countryName": "Netherlands",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NL",
      "latitude": "505440N",
      "longitude": "0054625E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MST_v2.png"
    },
    {
      "code": "MUC",
      "name": "Munich",
      "alternateName": "Munich International",
      "alias": [
        "munich",
        "international"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "482114N",
      "longitude": "0114710E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MUC_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "MXP",
      "name": "Milan Malpensa",
      "alternateName": "Milan Malpensa T1",
      "alias": [
        "milan",
        "malpensa",
        "t1"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "453748N",
      "longitude": "0084323E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE"
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "CIY",
          "group": "DOMESTIC"
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "KUN",
          "group": null
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": null
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "OTP",
          "group": "CITY"
        },
        {
          "code": "PMO",
          "group": "DOMESTIC"
        },
        {
          "code": "SOF",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": "DOMESTIC"
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VLC",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/MXP_v2.png"
    },
    {
      "code": "NAP",
      "name": "Naples",
      "alternateName": null,
      "alias": [
        "naples"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "405304N",
      "longitude": "0141727E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BCN",
          "group": null
        },
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "BLQ",
          "group": null
        },
        {
          "code": "BRE",
          "group": null
        },
        {
          "code": "BRS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "CFU",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "CGN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CPH",
          "group": null
        },
        {
          "code": "CRL",
          "group": null
        },
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "EDI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "EMA",
          "group": null
        },
        {
          "code": "EXT",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "HAM",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "HHN",
          "group": null
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "KUN",
          "group": null
        },
        {
          "code": "LIS",
          "group": null
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MAD",
          "group": null
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": "LEISURE"
        },
        {
          "code": "NYO",
          "group": null
        },
        {
          "code": "OPO",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "SKG",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TLS",
          "group": null
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VLC",
          "group": null
        },
        {
          "code": "VNO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "WMI",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        },
        {
          "code": "ZAZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NAP_v2.png"
    },
    {
      "code": "NCE",
      "name": "Nice",
      "alternateName": "Nice T1",
      "alias": [
        "nice",
        "t1"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "433950N",
      "longitude": "0071303E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NCE_v2.png"
    },
    {
      "code": "NCL",
      "name": "Newcastle",
      "alternateName": null,
      "alias": [
        "newcastle"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "550216N",
      "longitude": "0014112W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NCL_v2.png"
    },
    {
      "code": "NDR",
      "name": "Nador",
      "alternateName": null,
      "alias": [
        "nador"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "345921N",
      "longitude": "0030140W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BCN",
          "group": "ETHNIC"
        },
        {
          "code": "BVA",
          "group": "ETHNIC"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "ETHNIC"
        },
        {
          "code": "HHN",
          "group": "ETHNIC"
        },
        {
          "code": "MRS",
          "group": "ETHNIC"
        },
        {
          "code": "NRN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NDR_v2.png"
    },
    {
      "code": "NNN",
      "name": "Natalia Test",
      "alternateName": null,
      "alias": [
        "natalia",
        "test"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "522610N",
      "longitude": "0205618E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "NOC",
      "name": "Knock",
      "alternateName": null,
      "alias": [
        "knock"
      ],
      "countryCode": "IE",
      "countryName": "Ireland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IE",
      "latitude": "535437N",
      "longitude": "0084907W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BRS",
          "group": "UKP_GOLD"
        },
        {
          "code": "EMA",
          "group": "UKP_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LPL",
          "group": "UKP_GOLD"
        },
        {
          "code": "LTN",
          "group": "UKP_GOLD"
        },
        {
          "code": "STN",
          "group": "UKP_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NOC_v2.png"
    },
    {
      "code": "NQY",
      "name": "Newquay Cornwall",
      "alternateName": "Newquay",
      "alias": [
        "newquay",
        "cornwall"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "502626N",
      "longitude": "0045943W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HHN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NQY_v2.png"
    },
    {
      "code": "NRK",
      "name": "Norrköping",
      "alternateName": null,
      "alias": [
        "norrkoping"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "583500N",
      "longitude": "0161500E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NRK_v2.png"
    },
    {
      "code": "NRN",
      "name": "Dusseldorf Weeze",
      "alternateName": "Düsseldorf (Weeze)",
      "alias": [
        "dusseldorf",
        "weeze"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "513620N",
      "longitude": "0060900E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGA",
          "group": "ETHNIC"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AOI",
          "group": "CITY_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BIO",
          "group": "CITY"
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "BZG",
          "group": "ETHNIC"
        },
        {
          "code": "BZR",
          "group": "CITY_GOLD"
        },
        {
          "code": "CAG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CIY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "EDI",
          "group": "CITY_GOLD"
        },
        {
          "code": "ESU",
          "group": null
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "INI",
          "group": "ETHNIC"
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LWO",
          "group": null
        },
        {
          "code": "NDR",
          "group": null
        },
        {
          "code": "NYO",
          "group": "CITY_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "OUD",
          "group": "ETHNIC"
        },
        {
          "code": "PDL",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "PSR",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RBA",
          "group": null
        },
        {
          "code": "SDR",
          "group": "CITY_GOLD"
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TLL",
          "group": "ETHNIC"
        },
        {
          "code": "TNG",
          "group": "ETHNIC"
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NRN_v2.png"
    },
    {
      "code": "NSD",
      "name": "Newskies Test",
      "alternateName": null,
      "alias": [
        "newskies",
        "test"
      ],
      "countryCode": "IE",
      "countryName": "Ireland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IE",
      "latitude": "532517N",
      "longitude": "0061612W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ABC",
          "group": null
        }
      ],
      "notices": null
    },
    {
      "code": "NTE",
      "name": "Nantes",
      "alternateName": null,
      "alias": [
        "nantes"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "470930N",
      "longitude": "0013635W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "MRS",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NTE_v2.png"
    },
    {
      "code": "NUE",
      "name": "Nuremberg",
      "alternateName": null,
      "alias": [
        "nuremberg"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "492955N",
      "longitude": "0110401E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "CAG",
          "group": "LEISURE",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "FAO",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "PMO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "SKG",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NUE_v2.png"
    },
    {
      "code": "NWI",
      "name": "Norwich",
      "alternateName": null,
      "alias": [
        "norwich"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "524100N",
      "longitude": "0011700E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NWI_v2.png"
    },
    {
      "code": "NYO",
      "name": "Stockholm Skavsta",
      "alternateName": null,
      "alias": [
        "stockholm",
        "skavsta"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "584706N",
      "longitude": "0165525E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BNX",
          "group": null
        },
        {
          "code": "BRE",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "BZR",
          "group": "CITY_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "CITY"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": "LEISURE"
        },
        {
          "code": "FMM",
          "group": "CITY"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "INI",
          "group": null
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LPA",
          "group": "CANARY_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NRN",
          "group": "CITY_GOLD"
        },
        {
          "code": "OPO",
          "group": null
        },
        {
          "code": "PFO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "RHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RJK",
          "group": "ETHNIC"
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY_GOLD"
        },
        {
          "code": "TGD",
          "group": null
        },
        {
          "code": "TSF",
          "group": "CITY_GOLD"
        },
        {
          "code": "VLC",
          "group": null
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/NYO_v2.png"
    },
    {
      "code": "ODS",
      "name": "Odesa International",
      "alternateName": "Odessa-Central",
      "alias": [
        "odesa",
        "international",
        "odessa",
        "central"
      ],
      "countryCode": "UA",
      "countryName": "Ukraine",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "UA",
      "latitude": "462600N",
      "longitude": "0304100E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ODS_v2.png"
    },
    {
      "code": "OLB",
      "name": "Olbia",
      "alternateName": null,
      "alias": [
        "olbia"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "405355N",
      "longitude": "0093104E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OLB_v2.png"
    },
    {
      "code": "OMR",
      "name": "Oradea",
      "alternateName": null,
      "alias": [
        "oradea"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "470139N",
      "longitude": "0215411E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "GRO",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OMR_v2.png"
    },
    {
      "code": "OPO",
      "name": "Porto",
      "alternateName": null,
      "alias": [
        "porto"
      ],
      "countryCode": "PT",
      "countryName": "Portugal",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PT1",
      "latitude": "411428N",
      "longitude": "0084045W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BOD",
          "group": "CITY"
        },
        {
          "code": "BRE",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "BTS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BUD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "CCF",
          "group": "CITY"
        },
        {
          "code": "CFE",
          "group": "CITY"
        },
        {
          "code": "CGN",
          "group": "CITY"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DLE",
          "group": "CITY"
        },
        {
          "code": "DTM",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "CITY"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": "DOMESTIC"
        },
        {
          "code": "FKB",
          "group": "CITY"
        },
        {
          "code": "FMM",
          "group": "CITY"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "HAM",
          "group": "CITY"
        },
        {
          "code": "KRK",
          "group": "LEISURE"
        },
        {
          "code": "LIL",
          "group": "CITY"
        },
        {
          "code": "LIS",
          "group": "DOMESTIC"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "LRH",
          "group": "CITY"
        },
        {
          "code": "LRT",
          "group": "CITY"
        },
        {
          "code": "LUX",
          "group": "CITY"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "MXP",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NUE",
          "group": "CITY"
        },
        {
          "code": "NYO",
          "group": null
        },
        {
          "code": "PDL",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "PIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "SKG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXB",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TER",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY_GOLD"
        },
        {
          "code": "TUF",
          "group": "CITY"
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        },
        {
          "code": "XCR",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OPO_v2.png"
    },
    {
      "code": "ORK",
      "name": "Cork",
      "alternateName": null,
      "alias": [
        "cork"
      ],
      "countryCode": "IE",
      "countryName": "Ireland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IE",
      "latitude": "515029N",
      "longitude": "0082928W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BOD",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CCF",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LGW",
          "group": "UKP_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "UKP_GOLD"
        },
        {
          "code": "LRH",
          "group": "LEISURE"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "UKP_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ORK_v2.png"
    },
    {
      "code": "OSD",
      "name": "Froesoe",
      "alternateName": null,
      "alias": [
        "froesoe"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "631155N",
      "longitude": "0142940E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OSD_v2.png"
    },
    {
      "code": "OSI",
      "name": "Osijek",
      "alternateName": null,
      "alias": [
        "osijek"
      ],
      "countryCode": "HR",
      "countryName": "Croatia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "HR",
      "latitude": "452749N",
      "longitude": "0184834E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OSI_v2.png"
    },
    {
      "code": "OSL",
      "name": "Oslo",
      "alternateName": null,
      "alias": [
        "oslo"
      ],
      "countryCode": "NO",
      "countryName": "Norway",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NO",
      "latitude": "601200N",
      "longitude": "0110500E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OSL_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "OSR",
      "name": "Ostrava",
      "alternateName": null,
      "alias": [
        "ostrava"
      ],
      "countryCode": "CZ",
      "countryName": "Czech Republic",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "CZ",
      "latitude": "494148N",
      "longitude": "0180656E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OSR_v2.png"
    },
    {
      "code": "OST",
      "name": "Ostend",
      "alternateName": null,
      "alias": [
        "ostend"
      ],
      "countryCode": "BE",
      "countryName": "Belgium",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "BE",
      "latitude": "511159N",
      "longitude": "0025149E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OST_v2.png"
    },
    {
      "code": "OTP",
      "name": "Bucharest",
      "alternateName": null,
      "alias": [
        "bucharest"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "443400N",
      "longitude": "0260600E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": "CITY_GOLD"
        },
        {
          "code": "BBU",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MRS",
          "group": null
        },
        {
          "code": "MXP",
          "group": "CITY"
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PMO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": "ETHNIC"
        },
        {
          "code": "TSR",
          "group": "DOMESTIC"
        },
        {
          "code": "VIE",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OTP_v2.png"
    },
    {
      "code": "OUD",
      "name": "Oujda",
      "alternateName": null,
      "alias": [
        "oujda"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "344700N",
      "longitude": "0015600W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BVA",
          "group": "ETHNIC"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "MRS",
          "group": "ETHNIC"
        },
        {
          "code": "NRN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OUD_v2.png"
    },
    {
      "code": "OVD",
      "name": "Asturias",
      "alternateName": null,
      "alias": [
        "asturias"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "433400N",
      "longitude": "0060200W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OVD_v2.png"
    },
    {
      "code": "OZZ",
      "name": "Ouarzazate",
      "alternateName": null,
      "alias": [
        "ouarzazate"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "305500N",
      "longitude": "0065500W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "MAD",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/OZZ_v2.png"
    },
    {
      "code": "PAD",
      "name": "Paderborn",
      "alternateName": null,
      "alias": [
        "paderborn"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "513654N",
      "longitude": "0083716E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "PMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PAD_v2.png"
    },
    {
      "code": "PDL",
      "name": "Ponta Delgada",
      "alternateName": null,
      "alias": [
        "ponta",
        "delgada"
      ],
      "countryCode": "PT",
      "countryName": "Portugal",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PT2",
      "latitude": "374450N",
      "longitude": "0254055W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRU",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "LIS",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "NRN",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OPO",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PDL_v2.png"
    },
    {
      "code": "PDV",
      "name": "Plovdiv",
      "alternateName": null,
      "alias": [
        "plovdiv"
      ],
      "countryCode": "BG",
      "countryName": "Bulgaria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "BG",
      "latitude": "420404N",
      "longitude": "0245103E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PDV_v2.png"
    },
    {
      "code": "PED",
      "name": "Pardubice",
      "alternateName": null,
      "alias": [
        "pardubice"
      ],
      "countryCode": "CZ",
      "countryName": "Czech Republic",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "CZ",
      "latitude": "500048N",
      "longitude": "0154419E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PED_v2.png"
    },
    {
      "code": "PEG",
      "name": "Perugia",
      "alternateName": null,
      "alias": [
        "perugia"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "430550N",
      "longitude": "0123037E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PEG_v2.png"
    },
    {
      "code": "PFO",
      "name": "Paphos",
      "alternateName": null,
      "alias": [
        "paphos"
      ],
      "countryCode": "CY",
      "countryName": "Cyprus",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "CY",
      "latitude": "344305N",
      "longitude": "0322909E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "BOH",
          "group": null
        },
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "BUD",
          "group": "LEISURE"
        },
        {
          "code": "CHQ",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "CIA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "KRK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "KUN",
          "group": "LEISURE"
        },
        {
          "code": "LPL",
          "group": null
        },
        {
          "code": "NYO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "OTP",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "RIX",
          "group": null
        },
        {
          "code": "SKG",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "SOF",
          "group": null
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "TLL",
          "group": null
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PFO_v2.png"
    },
    {
      "code": "PGF",
      "name": "Perpignan",
      "alternateName": null,
      "alias": [
        "perpignan"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "424427N",
      "longitude": "0025218E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PGF_v2.png"
    },
    {
      "code": "PIK",
      "name": "Glasgow Prestwick",
      "alternateName": "Glasgow (Prestwick)",
      "alias": [
        "glasgow",
        "prestwick"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "553011N",
      "longitude": "0043432W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BCN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FUE",
          "group": "CANARY_GOLD"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RZE",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PIK_v2.png"
    },
    {
      "code": "PIS",
      "name": "Poitiers",
      "alternateName": null,
      "alias": [
        "poitiers"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "463510N",
      "longitude": "0001823E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MRS",
          "group": "DOMESTIC"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PIS_v2.png"
    },
    {
      "code": "PLQ",
      "name": "Palanga",
      "alternateName": null,
      "alias": [
        "palanga"
      ],
      "countryCode": "LT",
      "countryName": "Lithuania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "LT",
      "latitude": "555700N",
      "longitude": "0210500E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "GLA",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PLQ_v2.png"
    },
    {
      "code": "PMF",
      "name": "Parma",
      "alternateName": null,
      "alias": [
        "parma"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "444920N",
      "longitude": "0101743E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CAG",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PMF_v2.png"
    },
    {
      "code": "PMI",
      "name": "Palma de Mallorca",
      "alternateName": "Mallorca",
      "alias": [
        "palma",
        "de",
        "mallorca"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "393306N",
      "longitude": "0024420E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "DOMESTIC"
        },
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BLL",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": "LEISURE"
        },
        {
          "code": "BOH",
          "group": "LEISURE"
        },
        {
          "code": "BRE",
          "group": "LEISURE"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BRU",
          "group": "LEISURE"
        },
        {
          "code": "BSL",
          "group": null
        },
        {
          "code": "BTS",
          "group": "LEISURE"
        },
        {
          "code": "BVA",
          "group": "LEISURE"
        },
        {
          "code": "CGN",
          "group": "LEISURE"
        },
        {
          "code": "CIA",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DTM",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FKB",
          "group": "LEISURE"
        },
        {
          "code": "FMM",
          "group": "LEISURE"
        },
        {
          "code": "FMO",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GOT",
          "group": "LEISURE"
        },
        {
          "code": "GRZ",
          "group": null
        },
        {
          "code": "HAJ",
          "group": null
        },
        {
          "code": "HAM",
          "group": "LEISURE"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "INN",
          "group": null
        },
        {
          "code": "KRK",
          "group": "LEISURE"
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "KUN",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LNZ",
          "group": null
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "LUX",
          "group": null
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MRS",
          "group": "LEISURE"
        },
        {
          "code": "MUC",
          "group": null
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NCL",
          "group": "LEISURE"
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "NUE",
          "group": null
        },
        {
          "code": "NYO",
          "group": "LEISURE"
        },
        {
          "code": "OPO",
          "group": "DOMESTIC"
        },
        {
          "code": "ORK",
          "group": "LEISURE"
        },
        {
          "code": "PAD",
          "group": null
        },
        {
          "code": "PIK",
          "group": "LEISURE"
        },
        {
          "code": "POZ",
          "group": "LEISURE"
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SDR",
          "group": "DOMESTIC"
        },
        {
          "code": "SEN",
          "group": null
        },
        {
          "code": "SNN",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "STR",
          "group": null
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "SXB",
          "group": null
        },
        {
          "code": "SXF",
          "group": "LEISURE"
        },
        {
          "code": "SZG",
          "group": null
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        },
        {
          "code": "VLL",
          "group": null
        },
        {
          "code": "WAW",
          "group": "LEISURE"
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        },
        {
          "code": "WRO",
          "group": "LEISURE"
        },
        {
          "code": "ZAZ",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PMI_v2.png"
    },
    {
      "code": "PMO",
      "name": "Palermo",
      "alternateName": null,
      "alias": [
        "palermo"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "381055N",
      "longitude": "0130558E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "AGP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ALC",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": "DOMESTIC"
        },
        {
          "code": "BRE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "BRU",
          "group": null,
          "stops": [
            {
              "code": "FCO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "BVA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CFU",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CGN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "CRL",
          "group": null
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EMA",
          "group": null
        },
        {
          "code": "FCO",
          "group": "DOMESTIC"
        },
        {
          "code": "FMM",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HAM",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "MXP",
          "group": "DOMESTIC"
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NUE",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "OPO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OTP",
          "group": "LEISURE"
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "SKG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": "LEISURE"
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TRN",
          "group": "DOMESTIC"
        },
        {
          "code": "TSF",
          "group": "DOMESTIC"
        },
        {
          "code": "VLC",
          "group": null
        },
        {
          "code": "VNO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "VRN",
          "group": "DOMESTIC"
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PMO_v2.png"
    },
    {
      "code": "POZ",
      "name": "Poznan",
      "alternateName": "Poznań",
      "alias": [
        "poznan"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "522453N",
      "longitude": "0164943E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BFS",
          "group": null,
          "stops": []
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLL",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "CDT",
          "group": null
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": null
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EDI",
          "group": "ETHNIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GPA",
          "group": null
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HER",
          "group": null
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "KGS",
          "group": null
        },
        {
          "code": "LPL",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PMI",
          "group": "LEISURE"
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "SKG",
          "group": null
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "SXF",
          "group": null
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "TRF",
          "group": null
        },
        {
          "code": "VAR",
          "group": null
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "ZTH",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/POZ_v2.png"
    },
    {
      "code": "PRG",
      "name": "Prague",
      "alternateName": null,
      "alias": [
        "prague"
      ],
      "countryCode": "CZ",
      "countryName": "Czech Republic",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "CZ",
      "latitude": "500603N",
      "longitude": "0141536E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "ALC",
          "group": null
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BCN",
          "group": null
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": null
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "BVA",
          "group": null
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LPL",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": null
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OPO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSA",
          "group": null
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": []
        },
        {
          "code": "TPS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PRG_v2.png"
    },
    {
      "code": "PSA",
      "name": "Pisa",
      "alternateName": null,
      "alias": [
        "pisa"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "434058N",
      "longitude": "0102344E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AHO",
          "group": "DOMESTIC"
        },
        {
          "code": "BDS",
          "group": "DOMESTIC"
        },
        {
          "code": "BLL",
          "group": "CITY_GOLD"
        },
        {
          "code": "BRI",
          "group": "DOMESTIC"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CAG",
          "group": "DOMESTIC"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIY",
          "group": "DOMESTIC"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CRV",
          "group": "DOMESTIC"
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "LEISURE"
        },
        {
          "code": "EFL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GDN",
          "group": "CITY"
        },
        {
          "code": "GOT",
          "group": "CITY"
        },
        {
          "code": "GRO",
          "group": "CITY_GOLD"
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "CITY"
        },
        {
          "code": "LBA",
          "group": "LEISURE"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "PIK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "DOMESTIC"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SOF",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": "DOMESTIC"
        },
        {
          "code": "SVQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TPS",
          "group": "DOMESTIC"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "WMI",
          "group": "CITY"
        },
        {
          "code": "WRO",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PSA_v2.png"
    },
    {
      "code": "PSR",
      "name": "Pescara",
      "alternateName": null,
      "alias": [
        "pescara"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "422614N",
      "longitude": "0141114E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BUD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "GRO",
          "group": "CITY_GOLD"
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MAD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "WMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PSR_v2.png"
    },
    {
      "code": "PUF",
      "name": "Pau",
      "alternateName": null,
      "alias": [
        "pau"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "432248N",
      "longitude": "0002507W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PUF_v2.png"
    },
    {
      "code": "PUY",
      "name": "Pula",
      "alternateName": null,
      "alias": [
        "pula"
      ],
      "countryCode": "HR",
      "countryName": "Croatia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "HR",
      "latitude": "445330N",
      "longitude": "0135525E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "TXL",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/PUY_v2.png"
    },
    {
      "code": "PVK",
      "name": "Preveza - Aktion",
      "alternateName": "Aktion",
      "alias": [
        "preveza",
        "aktion"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "385532N",
      "longitude": "0204555E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "RAK",
      "name": "Marrakesh",
      "alternateName": null,
      "alias": [
        "marrakesh"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "313630N",
      "longitude": "0080218W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BCN",
          "group": "ETHNIC"
        },
        {
          "code": "BGY",
          "group": "ETHNIC"
        },
        {
          "code": "BOD",
          "group": null
        },
        {
          "code": "BRU",
          "group": null
        },
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "BVA",
          "group": "ETHNIC"
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "CIA",
          "group": "ETHNIC"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DLE",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EIN",
          "group": "ETHNIC"
        },
        {
          "code": "FKB",
          "group": "ETHNIC"
        },
        {
          "code": "FMM",
          "group": "ETHNIC"
        },
        {
          "code": "FNI",
          "group": null
        },
        {
          "code": "HAM",
          "group": null
        },
        {
          "code": "HHN",
          "group": "ETHNIC"
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "LTN",
          "group": "LEISURE"
        },
        {
          "code": "MAD",
          "group": "ETHNIC"
        },
        {
          "code": "MRS",
          "group": "ETHNIC"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NRN",
          "group": "ETHNIC"
        },
        {
          "code": "NUE",
          "group": null
        },
        {
          "code": "NYO",
          "group": null
        },
        {
          "code": "OPO",
          "group": "ETHNIC"
        },
        {
          "code": "PGF",
          "group": null
        },
        {
          "code": "PIS",
          "group": "ETHNIC"
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "PSA",
          "group": "ETHNIC"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "SDR",
          "group": null
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "STR",
          "group": null
        },
        {
          "code": "SVQ",
          "group": "ETHNIC"
        },
        {
          "code": "SXF",
          "group": null
        },
        {
          "code": "TRF",
          "group": null
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "TUF",
          "group": "ETHNIC"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "ETHNIC"
        },
        {
          "code": "XCR",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RAK_v2.png"
    },
    {
      "code": "RBA",
      "name": "Rabat",
      "alternateName": null,
      "alias": [
        "rabat"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "340300N",
      "longitude": "0064525W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BVA",
          "group": "ETHNIC"
        },
        {
          "code": "CIA",
          "group": "ETHNIC"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "GRO",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "ETHNIC"
        },
        {
          "code": "MRS",
          "group": "ETHNIC"
        },
        {
          "code": "NRN",
          "group": null
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SVQ",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RBA_v2.png"
    },
    {
      "code": "RDZ",
      "name": "Rodez",
      "alternateName": null,
      "alias": [
        "rodez"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "442200N",
      "longitude": "0023100E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RDZ_v2.png"
    },
    {
      "code": "REU",
      "name": "Barcelona Reus",
      "alternateName": "Reus (Barcelona)",
      "alias": [
        "barcelona",
        "reus"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "410900N",
      "longitude": "0011010E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": "LEISURE"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "LPL",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "ORK",
          "group": "LEISURE"
        },
        {
          "code": "SEN",
          "group": null
        },
        {
          "code": "SNN",
          "group": null
        },
        {
          "code": "STN",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/REU_v2.png"
    },
    {
      "code": "RHO",
      "name": "Rhodes",
      "alternateName": null,
      "alias": [
        "rhodes"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "362420N",
      "longitude": "0280510E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "LEISURE"
        },
        {
          "code": "BLQ",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "KUN",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "NYO",
          "group": "LEISURE"
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "PSA",
          "group": "LEISURE"
        },
        {
          "code": "RZE",
          "group": null
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RHO_v2.png"
    },
    {
      "code": "RIX",
      "name": "Riga",
      "alternateName": null,
      "alias": [
        "riga"
      ],
      "countryCode": "LV",
      "countryName": "Latvia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "LV",
      "latitude": "565530N",
      "longitude": "0235820E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRE",
          "group": "ETHNIC"
        },
        {
          "code": "CGN",
          "group": "ETHNIC"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "EMA",
          "group": "ETHNIC"
        },
        {
          "code": "FAO",
          "group": null,
          "stops": []
        },
        {
          "code": "GLA",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": null
        },
        {
          "code": "HHN",
          "group": "ETHNIC"
        },
        {
          "code": "LBA",
          "group": "ETHNIC"
        },
        {
          "code": "MAN",
          "group": "ETHNIC"
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RIX_v2.png"
    },
    {
      "code": "RJK",
      "name": "Rijeka",
      "alternateName": null,
      "alias": [
        "rijeka"
      ],
      "countryCode": "HR",
      "countryName": "Croatia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "HR",
      "latitude": "451257N",
      "longitude": "0143406E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "NYO",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "TXL",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RJK_v2.png"
    },
    {
      "code": "RLG",
      "name": "Rostock",
      "alternateName": null,
      "alias": [
        "rostock"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "535505N",
      "longitude": "0121642E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RLG_v2.png"
    },
    {
      "code": "RMI",
      "name": "Rimini",
      "alternateName": null,
      "alias": [
        "rimini"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "440110N",
      "longitude": "0123634E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "KUN",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RMI_v2.png"
    },
    {
      "code": "RMU",
      "name": "Murcia International",
      "alternateName": "Murcia Intl",
      "alias": [
        "murcia",
        "international",
        "intl"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "374736N",
      "longitude": "0010825W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RMU_v2.png"
    },
    {
      "code": "RNS",
      "name": "Rennes",
      "alternateName": null,
      "alias": [
        "rennes"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "480407N",
      "longitude": "0014353W",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RNS_v2.png"
    },
    {
      "code": "RVN",
      "name": "Rovaniemi",
      "alternateName": null,
      "alias": [
        "rovaniemi"
      ],
      "countryCode": "FI",
      "countryName": "Finland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FI",
      "latitude": "663347N",
      "longitude": "0254936E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RVN_v2.png"
    },
    {
      "code": "RYG",
      "name": "Oslo (Rygge)",
      "alternateName": null,
      "alias": [
        "oslo",
        "rygge"
      ],
      "countryCode": "NO",
      "countryName": "Norway",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NO",
      "latitude": "592244N",
      "longitude": "0104708E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RYG_v2.png"
    },
    {
      "code": "RZE",
      "name": "Rzeszow",
      "alternateName": "Rzeszów",
      "alias": [
        "rzeszow"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "500700N",
      "longitude": "0220100E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EMA",
          "group": "ETHNIC"
        },
        {
          "code": "LTN",
          "group": "ETHNIC"
        },
        {
          "code": "MAN",
          "group": "ETHNIC"
        },
        {
          "code": "PIK",
          "group": "ETHNIC"
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/RZE_v2.png"
    },
    {
      "code": "SCQ",
      "name": "Santiago",
      "alternateName": null,
      "alias": [
        "santiago"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "425347N",
      "longitude": "0082455W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "AGP",
          "group": "DOMESTIC"
        },
        {
          "code": "ALC",
          "group": "DOMESTIC"
        },
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": null
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "CIA",
          "group": null
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "LPA",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "PMI",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC"
        },
        {
          "code": "TFS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SCQ_v2.png"
    },
    {
      "code": "SDR",
      "name": "Santander",
      "alternateName": null,
      "alias": [
        "santander"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "432545N",
      "longitude": "0034935W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "DOMESTIC"
        },
        {
          "code": "AGP",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "CITY_GOLD"
        },
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "EDI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LPL",
          "group": null
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "PMI",
          "group": "DOMESTIC"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        },
        {
          "code": "SXF",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "VLC",
          "group": "DOMESTIC_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SDR_v2.png"
    },
    {
      "code": "SEN",
      "name": "London Southend",
      "alternateName": "Southend",
      "alias": [
        "london",
        "southend"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "513422N",
      "longitude": "0004205E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "ALC",
          "group": null
        },
        {
          "code": "BES",
          "group": null
        },
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "BIO",
          "group": null
        },
        {
          "code": "CFU",
          "group": null
        },
        {
          "code": "CLJ",
          "group": null
        },
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "FAO",
          "group": null
        },
        {
          "code": "KSC",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "REU",
          "group": null
        },
        {
          "code": "VCE",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SEN_v2.png"
    },
    {
      "code": "SFT",
      "name": "Skelleftea",
      "alternateName": null,
      "alias": [
        "skelleftea"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "643730N",
      "longitude": "0210442E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SFT_v2.png"
    },
    {
      "code": "SKG",
      "name": "Thessaloniki",
      "alternateName": null,
      "alias": [
        "thessaloniki"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "403111N",
      "longitude": "0225815E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ATH",
          "group": "DOMESTIC"
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRE",
          "group": "LEISURE"
        },
        {
          "code": "BRI",
          "group": "CITY",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BTS",
          "group": null
        },
        {
          "code": "BUD",
          "group": "LEISURE"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CHQ",
          "group": "DOMESTIC"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": "LEISURE"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "DTM",
          "group": "LEISURE"
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "FKB",
          "group": "LEISURE"
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "GOT",
          "group": "LEISURE"
        },
        {
          "code": "GRO",
          "group": "LEISURE"
        },
        {
          "code": "HAM",
          "group": "LEISURE"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "MLA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "NUE",
          "group": null
        },
        {
          "code": "NYO",
          "group": "LEISURE"
        },
        {
          "code": "OPO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PFO",
          "group": "DOMESTIC"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SXF",
          "group": "LEISURE"
        },
        {
          "code": "WAW",
          "group": null
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SKG_v2.png"
    },
    {
      "code": "SNN",
      "name": "Shannon",
      "alternateName": null,
      "alias": [
        "shannon"
      ],
      "countryCode": "IE",
      "countryName": "Ireland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IE",
      "latitude": "524207N",
      "longitude": "0085529W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "KUN",
          "group": "ETHNIC"
        },
        {
          "code": "LGW",
          "group": "UKP_GOLD"
        },
        {
          "code": "LPL",
          "group": "UKP"
        },
        {
          "code": "MAN",
          "group": "UKP_GOLD"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "REU",
          "group": null
        },
        {
          "code": "STN",
          "group": "UKP_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SNN_v2.png"
    },
    {
      "code": "SOB",
      "name": "Balaton",
      "alternateName": null,
      "alias": [
        "balaton"
      ],
      "countryCode": "HU",
      "countryName": "Hungary",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "HU",
      "latitude": "464110N",
      "longitude": "0170933E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SOB_v2.png"
    },
    {
      "code": "SOF",
      "name": "Sofia",
      "alternateName": null,
      "alias": [
        "sofia"
      ],
      "countryCode": "BG",
      "countryName": "Bulgaria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "BG",
      "latitude": "424142N",
      "longitude": "0232430E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AQJ",
          "group": null
        },
        {
          "code": "ATH",
          "group": "CITY"
        },
        {
          "code": "BCN",
          "group": "CITY_GOLD"
        },
        {
          "code": "BHX",
          "group": "ETHNIC"
        },
        {
          "code": "CDT",
          "group": "ETHNIC"
        },
        {
          "code": "CGN",
          "group": "ETHNIC"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EIN",
          "group": "ETHNIC"
        },
        {
          "code": "FKB",
          "group": "ETHNIC"
        },
        {
          "code": "FMM",
          "group": "ETHNIC"
        },
        {
          "code": "GLA",
          "group": "ETHNIC"
        },
        {
          "code": "HAM",
          "group": "ETHNIC"
        },
        {
          "code": "LPL",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "CITY_GOLD"
        },
        {
          "code": "MXP",
          "group": "CITY_GOLD"
        },
        {
          "code": "NYO",
          "group": "ETHNIC"
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "SXF",
          "group": "ETHNIC"
        },
        {
          "code": "TSF",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SOF_v2.png"
    },
    {
      "code": "SPU",
      "name": "Split",
      "alternateName": null,
      "alias": [
        "split"
      ],
      "countryCode": "HR",
      "countryName": "Croatia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "HR",
      "latitude": "433130N",
      "longitude": "0161732E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SPU_v2.png"
    },
    {
      "code": "STN",
      "name": "London Stansted",
      "alternateName": "London (Stansted)",
      "alias": [
        "london",
        "stansted"
      ],
      "countryCode": "GB",
      "countryName": "United Kingdom",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GB",
      "latitude": "515300N",
      "longitude": "0001400E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AAL",
          "group": null
        },
        {
          "code": "AAR",
          "group": "CITY"
        },
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AHO",
          "group": "CITY_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AOI",
          "group": "CITY_GOLD"
        },
        {
          "code": "ATH",
          "group": "CITY"
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": "CITY"
        },
        {
          "code": "BFS",
          "group": null
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BIQ",
          "group": "CITY"
        },
        {
          "code": "BLL",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BOD",
          "group": "CITY"
        },
        {
          "code": "BRE",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "CITY"
        },
        {
          "code": "BRQ",
          "group": "ETHNIC"
        },
        {
          "code": "BSL",
          "group": "CITY"
        },
        {
          "code": "BTS",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BVE",
          "group": "CITY_GOLD"
        },
        {
          "code": "BZG",
          "group": "ETHNIC"
        },
        {
          "code": "BZR",
          "group": null
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "CCF",
          "group": "CITY_GOLD"
        },
        {
          "code": "CDT",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CFE",
          "group": "CITY_GOLD"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CGN",
          "group": "CITY",
          "stops": [
            {
              "code": "DUS"
            }
          ]
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CIY",
          "group": "CITY_GOLD"
        },
        {
          "code": "CPH",
          "group": null
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DLE",
          "group": "CITY"
        },
        {
          "code": "DNR",
          "group": "CITY"
        },
        {
          "code": "DTM",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "UKP_GOLD"
        },
        {
          "code": "EDI",
          "group": "DOMESTIC"
        },
        {
          "code": "EFL",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "EGC",
          "group": "CITY_GOLD"
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FEZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FKB",
          "group": "CITY"
        },
        {
          "code": "FMM",
          "group": "CITY"
        },
        {
          "code": "FNI",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "GLA",
          "group": "DOMESTIC"
        },
        {
          "code": "GNB",
          "group": "CITY_GOLD"
        },
        {
          "code": "GOA",
          "group": "CITY"
        },
        {
          "code": "GOT",
          "group": "CITY"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HAM",
          "group": "CITY"
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "INN",
          "group": null
        },
        {
          "code": "KBP",
          "group": null,
          "pendingApproval": true
        },
        {
          "code": "KIR",
          "group": "UKP_GOLD"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "KTW",
          "group": "ETHNIC"
        },
        {
          "code": "KUN",
          "group": "ETHNIC"
        },
        {
          "code": "LCJ",
          "group": "ETHNIC"
        },
        {
          "code": "LDE",
          "group": "CITY_GOLD"
        },
        {
          "code": "LEI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LEJ",
          "group": "CITY"
        },
        {
          "code": "LIG",
          "group": "CITY_GOLD"
        },
        {
          "code": "LIS",
          "group": "CITY"
        },
        {
          "code": "LNZ",
          "group": "CITY"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LRH",
          "group": "CITY_GOLD"
        },
        {
          "code": "LUX",
          "group": "CITY"
        },
        {
          "code": "LUZ",
          "group": "ETHNIC"
        },
        {
          "code": "LWO",
          "group": null
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MJV",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "MXP",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NCE",
          "group": null
        },
        {
          "code": "NOC",
          "group": "UKP_GOLD"
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "NTE",
          "group": null
        },
        {
          "code": "NUE",
          "group": "CITY"
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "ORK",
          "group": "UKP_GOLD"
        },
        {
          "code": "OSL",
          "group": "CITY"
        },
        {
          "code": "OSR",
          "group": "ETHNIC"
        },
        {
          "code": "OTP",
          "group": "CITY"
        },
        {
          "code": "PDL",
          "group": "LEISURE"
        },
        {
          "code": "PDV",
          "group": "ETHNIC"
        },
        {
          "code": "PED",
          "group": null
        },
        {
          "code": "PEG",
          "group": "CITY_GOLD"
        },
        {
          "code": "PFO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PGF",
          "group": "CITY_GOLD"
        },
        {
          "code": "PIS",
          "group": "CITY"
        },
        {
          "code": "PLQ",
          "group": "ETHNIC"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "CITY_GOLD"
        },
        {
          "code": "POZ",
          "group": "ETHNIC"
        },
        {
          "code": "PRG",
          "group": "CITY"
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "PSR",
          "group": "CITY_GOLD"
        },
        {
          "code": "PUY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RBA",
          "group": "LEISURE"
        },
        {
          "code": "REU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RHO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RIX",
          "group": "CITY"
        },
        {
          "code": "RJK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RMI",
          "group": "CITY"
        },
        {
          "code": "RZE",
          "group": "ETHNIC"
        },
        {
          "code": "SCQ",
          "group": "CITY"
        },
        {
          "code": "SDR",
          "group": "CITY"
        },
        {
          "code": "SKG",
          "group": "CITY"
        },
        {
          "code": "SNN",
          "group": "UKP_GOLD"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "SUF",
          "group": "CITY_GOLD"
        },
        {
          "code": "SVQ",
          "group": "LEISURE"
        },
        {
          "code": "SXB",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "SZG",
          "group": "CITY_GOLD"
        },
        {
          "code": "SZY",
          "group": "ETHNIC"
        },
        {
          "code": "SZZ",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TGD",
          "group": "ETHNIC"
        },
        {
          "code": "TLL",
          "group": "CITY"
        },
        {
          "code": "TLS",
          "group": "CITY_GOLD"
        },
        {
          "code": "TRF",
          "group": "CITY"
        },
        {
          "code": "TRN",
          "group": "CITY"
        },
        {
          "code": "TRS",
          "group": "CITY"
        },
        {
          "code": "TSF",
          "group": "CITY"
        },
        {
          "code": "TUF",
          "group": "CITY"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VLC",
          "group": "LEISURE"
        },
        {
          "code": "VLL",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "VRN",
          "group": "CITY"
        },
        {
          "code": "VST",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": "ETHNIC"
        },
        {
          "code": "XRY",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ZAZ",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/STN_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "STR",
      "name": "Stuttgart",
      "alternateName": null,
      "alias": [
        "stuttgart"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "484124N",
      "longitude": "0091319E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "RAK",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/STR_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "SUF",
      "name": "Lamezia",
      "alternateName": null,
      "alias": [
        "lamezia"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "385430N",
      "longitude": "0161430E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ALC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": "DOMESTIC"
        },
        {
          "code": "BRE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRS",
          "group": null
        },
        {
          "code": "BUD",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CFU",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CGN",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CRL",
          "group": "CITY",
          "stops": [
            {
              "code": "BGY"
            }
          ]
        },
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "EMA",
          "group": null
        },
        {
          "code": "FKB",
          "group": "CITY_GOLD"
        },
        {
          "code": "HAM",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MAD",
          "group": null
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MXP",
          "group": "DOMESTIC"
        },
        {
          "code": "NRN",
          "group": "CITY"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "PRG",
          "group": null,
          "stops": []
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "SKG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "TSF",
          "group": "DOMESTIC"
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "ZAZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SUF_v2.png"
    },
    {
      "code": "SVG",
      "name": "Sola",
      "alternateName": null,
      "alias": [
        "sola"
      ],
      "countryCode": "NO",
      "countryName": "Norway",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NO",
      "latitude": "585247N",
      "longitude": "0053805E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SVG_v2.png"
    },
    {
      "code": "SVQ",
      "name": "Seville",
      "alternateName": null,
      "alias": [
        "seville"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "372505N",
      "longitude": "0055335W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "ALC",
          "group": "DOMESTIC"
        },
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BOD",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "CITY"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "CITY"
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": null
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null,
          "stops": []
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FCO",
          "group": "CITY"
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "FKB",
          "group": null
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": null
        },
        {
          "code": "HAM",
          "group": null
        },
        {
          "code": "IBZ",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LPA",
          "group": "DOMESTIC"
        },
        {
          "code": "LUX",
          "group": null
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": "LEISURE"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "MXP",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NTE",
          "group": null
        },
        {
          "code": "OPO",
          "group": null
        },
        {
          "code": "PMI",
          "group": "DOMESTIC"
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "RBA",
          "group": null
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SXF",
          "group": "LEISURE"
        },
        {
          "code": "TFS",
          "group": "DOMESTIC"
        },
        {
          "code": "TLS",
          "group": null
        },
        {
          "code": "TNG",
          "group": null
        },
        {
          "code": "TSF",
          "group": "CITY"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VIT",
          "group": null
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        },
        {
          "code": "VLL",
          "group": null
        },
        {
          "code": "VRN",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SVQ_v2.png"
    },
    {
      "code": "SXB",
      "name": "Strasbourg",
      "alternateName": null,
      "alias": [
        "strasbourg"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "483200N",
      "longitude": "0073800E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SXB_v2.png"
    },
    {
      "code": "SXF",
      "name": "Berlin Schönefeld",
      "alternateName": "Berlin (Schonefeld) TD",
      "alias": [
        "berlin",
        "schonefeld",
        "td"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "522200N",
      "longitude": "0133000E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "CANARY"
        },
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": "CITY"
        },
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BFS",
          "group": "CITY"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLL",
          "group": null
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "CITY_GOLD"
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CGN",
          "group": "DOMESTIC"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": "CITY_GOLD"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "CITY"
        },
        {
          "code": "EMA",
          "group": "CITY"
        },
        {
          "code": "FAO",
          "group": null
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GLA",
          "group": "CITY"
        },
        {
          "code": "IBZ",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "INI",
          "group": "ETHNIC"
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "KIR",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "OPO",
          "group": "CITY"
        },
        {
          "code": "OTP",
          "group": "ETHNIC"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "PSR",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "RIX",
          "group": "ETHNIC"
        },
        {
          "code": "SDR",
          "group": "CITY_GOLD"
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SOF",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SVQ",
          "group": "LEISURE"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TGD",
          "group": "ETHNIC"
        },
        {
          "code": "TLS",
          "group": "CITY"
        },
        {
          "code": "TSF",
          "group": "CITY"
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VLC",
          "group": "CITY_GOLD"
        },
        {
          "code": "VNO",
          "group": "ETHNIC"
        },
        {
          "code": "VRN",
          "group": null
        },
        {
          "code": "ZAD",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SXF_v2.png"
    },
    {
      "code": "SZG",
      "name": "Salzburg",
      "alternateName": null,
      "alias": [
        "salzburg"
      ],
      "countryCode": "AT",
      "countryName": "Austria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "AT",
      "latitude": "474735N",
      "longitude": "0130020E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SZG_v2.png"
    },
    {
      "code": "SZY",
      "name": "Olsztyn - Mazury",
      "alternateName": "Olsztyn-Mazury",
      "alias": [
        "olsztyn",
        "mazury"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "522610N",
      "longitude": "0205618E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "STN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SZY_v2.png"
    },
    {
      "code": "SZZ",
      "name": "Szczecin",
      "alternateName": null,
      "alias": [
        "szczecin"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "533500N",
      "longitude": "0145400E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EDI",
          "group": "ETHNIC"
        },
        {
          "code": "LPL",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "WAW",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/SZZ_v2.png"
    },
    {
      "code": "TBS",
      "name": "Tbilisi",
      "alternateName": null,
      "alias": [
        "tbilisi"
      ],
      "countryCode": "GE",
      "countryName": "Georgia",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "GE",
      "latitude": "414000N",
      "longitude": "0445700E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TBS_v2.png"
    },
    {
      "code": "TER",
      "name": "Terceira Lajes",
      "alternateName": "Lajes",
      "alias": [
        "terceira",
        "lajes"
      ],
      "countryCode": "PT",
      "countryName": "Portugal",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PT2",
      "latitude": "384524N",
      "longitude": "0270539W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "LIS",
          "group": "DOMESTIC"
        },
        {
          "code": "OPO",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TER_v2.png"
    },
    {
      "code": "TFN",
      "name": "Tenerife North",
      "alternateName": "Tenerife (North)",
      "alias": [
        "tenerife",
        "north"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES2",
      "latitude": "282858N",
      "longitude": "0162030W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TFN_v2.png"
    },
    {
      "code": "TFS",
      "name": "Tenerife South",
      "alternateName": "Tenerife (South)",
      "alias": [
        "tenerife",
        "south"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES2",
      "latitude": "280240N",
      "longitude": "0163421W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BFS",
          "group": "CANARY"
        },
        {
          "code": "BGY",
          "group": "CANARY"
        },
        {
          "code": "BHX",
          "group": "CANARY"
        },
        {
          "code": "BLQ",
          "group": "CANARY"
        },
        {
          "code": "BOH",
          "group": "CANARY"
        },
        {
          "code": "BRE",
          "group": "CANARY"
        },
        {
          "code": "BRI",
          "group": null
        },
        {
          "code": "BRS",
          "group": "CANARY"
        },
        {
          "code": "BVA",
          "group": "CANARY"
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "CGN",
          "group": "CANARY"
        },
        {
          "code": "CIA",
          "group": null
        },
        {
          "code": "CPH",
          "group": "CANARY"
        },
        {
          "code": "CRL",
          "group": "CANARY"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "CWL",
          "group": "CANARY"
        },
        {
          "code": "DUB",
          "group": "CANARY"
        },
        {
          "code": "DUS",
          "group": null
        },
        {
          "code": "EDI",
          "group": "CANARY"
        },
        {
          "code": "EIN",
          "group": "CANARY"
        },
        {
          "code": "EMA",
          "group": "CANARY"
        },
        {
          "code": "FMM",
          "group": "CANARY"
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "FUE",
          "group": null
        },
        {
          "code": "HHN",
          "group": "CANARY"
        },
        {
          "code": "KRK",
          "group": "CANARY"
        },
        {
          "code": "LBA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "CANARY"
        },
        {
          "code": "LTN",
          "group": "CANARY"
        },
        {
          "code": "MAD",
          "group": "DOMESTIC"
        },
        {
          "code": "MAN",
          "group": "CANARY"
        },
        {
          "code": "MRS",
          "group": null
        },
        {
          "code": "MXP",
          "group": "CANARY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NCL",
          "group": "CANARY"
        },
        {
          "code": "NOC",
          "group": "CANARY"
        },
        {
          "code": "NRN",
          "group": "CANARY"
        },
        {
          "code": "NYO",
          "group": "CANARY"
        },
        {
          "code": "OPO",
          "group": "CANARY"
        },
        {
          "code": "ORK",
          "group": "CANARY"
        },
        {
          "code": "PIK",
          "group": "CANARY"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CANARY"
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "SDR",
          "group": "DOMESTIC"
        },
        {
          "code": "SNN",
          "group": "CANARY"
        },
        {
          "code": "STN",
          "group": "CANARY"
        },
        {
          "code": "SUF",
          "group": null
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SXF",
          "group": "CANARY"
        },
        {
          "code": "TRF",
          "group": "CANARY"
        },
        {
          "code": "TSF",
          "group": "CANARY"
        },
        {
          "code": "TXL",
          "group": null
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VIT",
          "group": null
        },
        {
          "code": "VLC",
          "group": "DOMESTIC"
        },
        {
          "code": "WMI",
          "group": "CANARY"
        },
        {
          "code": "WRO",
          "group": "CANARY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TFS_v2.png"
    },
    {
      "code": "TGD",
      "name": "Podgorica",
      "alternateName": null,
      "alias": [
        "podgorica"
      ],
      "countryCode": "ME",
      "countryName": "Montenegro",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "ME",
      "latitude": "422130N",
      "longitude": "0191507E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "NYO",
          "group": null
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "SXF",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TGD_v2.png"
    },
    {
      "code": "TGM",
      "name": "Targu Mures",
      "alternateName": null,
      "alias": [
        "targu",
        "mures"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "463200N",
      "longitude": "0243200E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TGM_v2.png"
    },
    {
      "code": "TIA",
      "name": "Rinas",
      "alternateName": null,
      "alias": [
        "rinas"
      ],
      "countryCode": "AL",
      "countryName": "Albania",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "AL",
      "latitude": "412501N",
      "longitude": "0194300E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TIA_v2.png"
    },
    {
      "code": "TIV",
      "name": "Tivat",
      "alternateName": null,
      "alias": [
        "tivat"
      ],
      "countryCode": "ME",
      "countryName": "Montenegro",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "ME",
      "latitude": "422413N",
      "longitude": "0184332E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null
    },
    {
      "code": "TKU",
      "name": "Turku T2",
      "alternateName": null,
      "alias": [
        "turku",
        "t2"
      ],
      "countryCode": "FI",
      "countryName": "Finland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FI",
      "latitude": "603051N",
      "longitude": "0221614E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TKU_v2.png"
    },
    {
      "code": "TLL",
      "name": "Tallinn",
      "alternateName": null,
      "alias": [
        "tallinn"
      ],
      "countryCode": "EE",
      "countryName": "Estonia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "EE",
      "latitude": "592448N",
      "longitude": "0244957E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BRE",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "CITY_GOLD"
        },
        {
          "code": "MLA",
          "group": null
        },
        {
          "code": "NRN",
          "group": "ETHNIC"
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TLL_v2.png"
    },
    {
      "code": "TLN",
      "name": "Toulon",
      "alternateName": null,
      "alias": [
        "toulon"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "430600N",
      "longitude": "0060900E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TLN_v2.png"
    },
    {
      "code": "TLS",
      "name": "Toulouse",
      "alternateName": null,
      "alias": [
        "toulouse"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "433749N",
      "longitude": "0012154E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "FEZ",
          "group": "ETHNIC"
        },
        {
          "code": "LIS",
          "group": "CITY_GOLD"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "WMI",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TLS_v2.png"
    },
    {
      "code": "TLV",
      "name": "Tel Aviv",
      "alternateName": null,
      "alias": [
        "tel",
        "aviv"
      ],
      "countryCode": "IL",
      "countryName": "Israel",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "IL",
      "latitude": "320044N",
      "longitude": "0345257E",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "FCO",
          "group": null
        },
        {
          "code": "FKB",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "KUN",
          "group": null
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TLV_v2.png"
    },
    {
      "code": "TMP",
      "name": "Tampere",
      "alternateName": null,
      "alias": [
        "tampere"
      ],
      "countryCode": "FI",
      "countryName": "Finland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FI",
      "latitude": "612504N",
      "longitude": "0233712E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRE",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TMP_v2.png"
    },
    {
      "code": "TNG",
      "name": "Tangier",
      "alternateName": null,
      "alias": [
        "tangier"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "354300N",
      "longitude": "0055500W",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BGY",
          "group": "ETHNIC"
        },
        {
          "code": "BVA",
          "group": "ETHNIC"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "HHN",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "ETHNIC"
        },
        {
          "code": "MRS",
          "group": "ETHNIC"
        },
        {
          "code": "NRN",
          "group": "ETHNIC"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "VLC",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TNG_v2.png"
    },
    {
      "code": "TNL",
      "name": "Ternopol",
      "alternateName": null,
      "alias": [
        "ternopol"
      ],
      "countryCode": "UA",
      "countryName": "Ukraine",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "UA",
      "latitude": "493400N",
      "longitude": "0253600E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TNL_v2.png"
    },
    {
      "code": "TPS",
      "name": "Trapani",
      "alternateName": null,
      "alias": [
        "trapani"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "375443N",
      "longitude": "0122936E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "DOMESTIC"
        },
        {
          "code": "BLQ",
          "group": "DOMESTIC"
        },
        {
          "code": "BRE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CAG",
          "group": "DOMESTIC"
        },
        {
          "code": "FKB",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HHN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MAD",
          "group": "CITY",
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PRG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSA",
          "group": "DOMESTIC"
        },
        {
          "code": "VNO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TPS_v2.png"
    },
    {
      "code": "TRF",
      "name": "Oslo Torp",
      "alternateName": "Oslo (Torp)",
      "alias": [
        "oslo",
        "torp"
      ],
      "countryCode": "NO",
      "countryName": "Norway",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "NO",
      "latitude": "591100N",
      "longitude": "0101600E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "CIA",
          "group": null
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        },
        {
          "code": "HAM",
          "group": null
        },
        {
          "code": "HHN",
          "group": "CITY"
        },
        {
          "code": "KRK",
          "group": "ETHNIC"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "MAN",
          "group": "CITY"
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        },
        {
          "code": "TFS",
          "group": "CANARY_GOLD"
        },
        {
          "code": "WMI",
          "group": "ETHNIC"
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TRF_v2.png"
    },
    {
      "code": "TRN",
      "name": "Turin",
      "alternateName": null,
      "alias": [
        "turin"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "451209N",
      "longitude": "0073858E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "CITY"
        },
        {
          "code": "BDS",
          "group": "DOMESTIC"
        },
        {
          "code": "BRI",
          "group": "DOMESTIC"
        },
        {
          "code": "CIY",
          "group": null
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "VLC",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TRN_v2.png"
    },
    {
      "code": "TRS",
      "name": "Trieste",
      "alternateName": null,
      "alias": [
        "trieste"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "454939N",
      "longitude": "0132820E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRI",
          "group": "DOMESTIC"
        },
        {
          "code": "CIA",
          "group": null
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "VLC",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TRS_v2.png"
    },
    {
      "code": "TSF",
      "name": "Venice Treviso",
      "alternateName": "Venice (Treviso)",
      "alias": [
        "venice",
        "treviso"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "453903N",
      "longitude": "0121152E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BDS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "BRE",
          "group": "CITY"
        },
        {
          "code": "BRI",
          "group": "DOMESTIC"
        },
        {
          "code": "BRU",
          "group": "CITY"
        },
        {
          "code": "BUD",
          "group": "CITY"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "CTA",
          "group": "DOMESTIC"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EIN",
          "group": "CITY"
        },
        {
          "code": "EMA",
          "group": "CITY"
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "HAM",
          "group": null
        },
        {
          "code": "IBZ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KRK",
          "group": "LEISURE"
        },
        {
          "code": "LBA",
          "group": "CITY"
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MAN",
          "group": null
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NYO",
          "group": "CITY"
        },
        {
          "code": "PMO",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "SOF",
          "group": "CITY"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SUF",
          "group": "DOMESTIC"
        },
        {
          "code": "SVQ",
          "group": "CITY"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "VLC",
          "group": "CITY"
        },
        {
          "code": "VNO",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TSF_v2.png"
    },
    {
      "code": "TSR",
      "name": "Timisoara",
      "alternateName": null,
      "alias": [
        "timisoara"
      ],
      "countryCode": "RO",
      "countryName": "Romania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "RO",
      "latitude": "454900N",
      "longitude": "0212000E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "OTP",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TSR_v2.png"
    },
    {
      "code": "TTU",
      "name": "Tétouan",
      "alternateName": "Sania Ramel",
      "alias": [
        "tetouan",
        "sania",
        "ramel"
      ],
      "countryCode": "MA",
      "countryName": "Morocco",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "MA",
      "latitude": "353500N",
      "longitude": "0051900W",
      "mobileBoardingPass": false,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TTU_v2.png"
    },
    {
      "code": "TUF",
      "name": "Tours Loire Valley",
      "alternateName": "Tours",
      "alias": [
        "tours",
        "loire",
        "valley"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "472542N",
      "longitude": "0004339E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "DUB",
          "group": "CITY_GOLD"
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "MRS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TUF_v2.png"
    },
    {
      "code": "TXL",
      "name": "Berlin Tegel",
      "alternateName": "BerlinTegel",
      "alias": [
        "berlin",
        "tegel",
        "berlintegel"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "523338N",
      "longitude": "0131744E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null
        },
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "ALC",
          "group": null
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BRI",
          "group": null
        },
        {
          "code": "CFU",
          "group": null
        },
        {
          "code": "FAO",
          "group": null
        },
        {
          "code": "FUE",
          "group": null
        },
        {
          "code": "GRO",
          "group": null
        },
        {
          "code": "HER",
          "group": null
        },
        {
          "code": "IBZ",
          "group": null
        },
        {
          "code": "KGS",
          "group": null
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MXP",
          "group": null
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "PUY",
          "group": null
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "RJK",
          "group": null
        },
        {
          "code": "TFS",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/TXL_v2.png"
    },
    {
      "code": "VAR",
      "name": "Varna",
      "alternateName": null,
      "alias": [
        "varna"
      ],
      "countryCode": "BG",
      "countryName": "Bulgaria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "BG",
      "latitude": "431355N",
      "longitude": "0274930E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "CRL",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "WAW",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VAR_v2.png"
    },
    {
      "code": "VBS",
      "name": "Verona (Brescia)",
      "alternateName": null,
      "alias": [
        "verona",
        "brescia"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "452544N",
      "longitude": "0101950E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VBS_v2.png"
    },
    {
      "code": "VCE",
      "name": "Venice M.Polo",
      "alternateName": "Venice (Marco Polo)",
      "alias": [
        "venice",
        "m",
        "polo",
        "marco"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "453019N",
      "longitude": "0122107E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "CITY_GOLD"
        },
        {
          "code": "BRS",
          "group": "CITY"
        },
        {
          "code": "SEN",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VCE_v2.png"
    },
    {
      "code": "VDA",
      "name": "Ovda",
      "alternateName": "Eilat",
      "alias": [
        "ovda",
        "eilat"
      ],
      "countryCode": "IL",
      "countryName": "Israel",
      "countryAlias": null,
      "countryGroupCode": "1",
      "countryGroupName": "non EU/EEA",
      "timeZoneCode": "IL",
      "latitude": "295600N",
      "longitude": "0345650E",
      "mobileBoardingPass": false,
      "markets": [
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "BRE",
          "group": null
        },
        {
          "code": "BTS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "BUD",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CRL",
          "group": null
        },
        {
          "code": "FKB",
          "group": null
        },
        {
          "code": "GDN",
          "group": null
        },
        {
          "code": "HHN",
          "group": null
        },
        {
          "code": "KRK",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "KUN",
          "group": "LEISURE"
        },
        {
          "code": "NRN",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "PRG",
          "group": null
        },
        {
          "code": "SXF",
          "group": null
        },
        {
          "code": "WMI",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VDA_v2.png"
    },
    {
      "code": "VGO",
      "name": "Vigo",
      "alternateName": null,
      "alias": [
        "vigo"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "421335N",
      "longitude": "0083740W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "DUB",
          "group": "CITY"
        },
        {
          "code": "EDI",
          "group": "LEISURE_GOLD"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VGO_v2.png"
    },
    {
      "code": "VIE",
      "name": "Vienna",
      "alternateName": null,
      "alias": [
        "vienna"
      ],
      "countryCode": "AT",
      "countryName": "Austria",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "AT",
      "latitude": "480640N",
      "longitude": "0163330E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": null
        },
        {
          "code": "AGP",
          "group": null
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "BCN",
          "group": null
        },
        {
          "code": "BDS",
          "group": null
        },
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "BLQ",
          "group": null
        },
        {
          "code": "BVA",
          "group": null
        },
        {
          "code": "CHQ",
          "group": null
        },
        {
          "code": "CPH",
          "group": null
        },
        {
          "code": "DUB",
          "group": null
        },
        {
          "code": "FAO",
          "group": null
        },
        {
          "code": "FCO",
          "group": null
        },
        {
          "code": "FUE",
          "group": null
        },
        {
          "code": "IBZ",
          "group": null
        },
        {
          "code": "JTR",
          "group": null
        },
        {
          "code": "KLX",
          "group": null
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LCA",
          "group": null
        },
        {
          "code": "LPA",
          "group": null
        },
        {
          "code": "MAD",
          "group": null
        },
        {
          "code": "OTP",
          "group": null
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "PSA",
          "group": null
        },
        {
          "code": "RAK",
          "group": null
        },
        {
          "code": "STN",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "TFS",
          "group": null
        },
        {
          "code": "VLC",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VIE_v2.png"
    },
    {
      "code": "VIT",
      "name": "Vitoria (Basque Country)",
      "alternateName": "Vitoria (Bilbao)",
      "alias": [
        "vitoria",
        "basque",
        "country",
        "bilbao"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "425247N",
      "longitude": "0024345W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BGY",
          "group": null
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "TFS",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VIT_v2.png"
    },
    {
      "code": "VLC",
      "name": "Valencia",
      "alternateName": null,
      "alias": [
        "valencia"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "392925N",
      "longitude": "0002843W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLL",
          "group": null
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BOD",
          "group": null
        },
        {
          "code": "BRE",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BRI",
          "group": "CITY"
        },
        {
          "code": "BRS",
          "group": "LEISURE"
        },
        {
          "code": "BRU",
          "group": "LEISURE"
        },
        {
          "code": "BTS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BUD",
          "group": null
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": "CITY"
        },
        {
          "code": "CGN",
          "group": "CITY"
        },
        {
          "code": "CIA",
          "group": "CITY"
        },
        {
          "code": "CPH",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CRA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EIN",
          "group": null
        },
        {
          "code": "EMA",
          "group": "LEISURE"
        },
        {
          "code": "FAO",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "FEZ",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HAM",
          "group": null
        },
        {
          "code": "IBZ",
          "group": "DOMESTIC"
        },
        {
          "code": "KRK",
          "group": null
        },
        {
          "code": "LIS",
          "group": null,
          "stops": [
            {
              "code": "OPO"
            }
          ]
        },
        {
          "code": "LPA",
          "group": "DOMESTIC"
        },
        {
          "code": "LPL",
          "group": null
        },
        {
          "code": "MAH",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MRS",
          "group": "CITY"
        },
        {
          "code": "MXP",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "NYO",
          "group": null
        },
        {
          "code": "OPO",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "PMI",
          "group": "DOMESTIC"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "PRG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PSA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        },
        {
          "code": "SCQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SDR",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "SVQ",
          "group": "DOMESTIC"
        },
        {
          "code": "SXF",
          "group": "CITY"
        },
        {
          "code": "TFS",
          "group": "DOMESTIC_GOLD"
        },
        {
          "code": "TNG",
          "group": null
        },
        {
          "code": "TRN",
          "group": "CITY"
        },
        {
          "code": "TRS",
          "group": "CITY"
        },
        {
          "code": "TSF",
          "group": "CITY"
        },
        {
          "code": "VIE",
          "group": null
        },
        {
          "code": "VNO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "WMI",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VLC_v2.png"
    },
    {
      "code": "VLL",
      "name": "Valladolid",
      "alternateName": null,
      "alias": [
        "valladolid"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "414222N",
      "longitude": "0045107W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VLL_v2.png"
    },
    {
      "code": "VNO",
      "name": "Vilnius",
      "alternateName": null,
      "alias": [
        "vilnius"
      ],
      "countryCode": "LT",
      "countryName": "Lithuania",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "LT",
      "latitude": "543800N",
      "longitude": "0251700E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BCN",
          "group": "CITY_GOLD"
        },
        {
          "code": "BDS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BHX",
          "group": "ETHNIC"
        },
        {
          "code": "BRE",
          "group": "ETHNIC"
        },
        {
          "code": "BRI",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "CFU",
          "group": null
        },
        {
          "code": "CGN",
          "group": null
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "CTA",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "HHN",
          "group": "ETHNIC"
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "LBA",
          "group": "ETHNIC"
        },
        {
          "code": "LPL",
          "group": "ETHNIC"
        },
        {
          "code": "LTN",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "CITY_GOLD"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "NUE",
          "group": null
        },
        {
          "code": "OSL",
          "group": "ETHNIC"
        },
        {
          "code": "PMO",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "SXF",
          "group": "ETHNIC"
        },
        {
          "code": "TPS",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "VLC",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VNO_v2.png"
    },
    {
      "code": "VOL",
      "name": "Volos",
      "alternateName": null,
      "alias": [
        "volos"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "391311N",
      "longitude": "0224740E",
      "mobileBoardingPass": false,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VOL_v2.png"
    },
    {
      "code": "VRN",
      "name": "Verona",
      "alternateName": null,
      "alias": [
        "verona"
      ],
      "countryCode": "IT",
      "countryName": "Italy",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "IT",
      "latitude": "452347N",
      "longitude": "0105317E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BDS",
          "group": "DOMESTIC"
        },
        {
          "code": "BHX",
          "group": "LEISURE"
        },
        {
          "code": "CAG",
          "group": "DOMESTIC"
        },
        {
          "code": "CRL",
          "group": "CITY"
        },
        {
          "code": "HAM",
          "group": null
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "PMO",
          "group": "DOMESTIC"
        },
        {
          "code": "STN",
          "group": "CITY"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "SXF",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VRN_v2.png"
    },
    {
      "code": "VST",
      "name": "Stockholm Västerås",
      "alternateName": "Stockholm Vasteras",
      "alias": [
        "stockholm",
        "vasteras"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "593521N",
      "longitude": "0163750E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "CITY"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VST_v2.png"
    },
    {
      "code": "VXO",
      "name": "Växjö Småland",
      "alternateName": "Smaland (Vaxjo)",
      "alias": [
        "vaxjo",
        "smaland"
      ],
      "countryCode": "SE",
      "countryName": "Sweden",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "SE",
      "latitude": "565600N",
      "longitude": "0144400E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "GDN",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/VXO_v2.png"
    },
    {
      "code": "WAW",
      "name": "Warsaw (Chopin)",
      "alternateName": null,
      "alias": [
        "warsaw",
        "chopin"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "521000N",
      "longitude": "0205800E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ALC",
          "group": null
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "AYT",
          "group": null
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "CHQ",
          "group": "LEISURE"
        },
        {
          "code": "CTA",
          "group": null
        },
        {
          "code": "HER",
          "group": null
        },
        {
          "code": "KGS",
          "group": null
        },
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "LCA",
          "group": null
        },
        {
          "code": "MAH",
          "group": null
        },
        {
          "code": "PFO",
          "group": null
        },
        {
          "code": "PMI",
          "group": "LEISURE"
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "SKG",
          "group": null
        },
        {
          "code": "SPU",
          "group": null
        },
        {
          "code": "SZZ",
          "group": "DOMESTIC"
        },
        {
          "code": "TIA",
          "group": null
        },
        {
          "code": "TLN",
          "group": null
        },
        {
          "code": "VAR",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/WAW_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "WMI",
      "name": "Warsaw Modlin",
      "alternateName": "Warsaw (Modlin)",
      "alias": [
        "warsaw",
        "modlin"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "522704N",
      "longitude": "0203906E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "AMM",
          "group": null
        },
        {
          "code": "ATH",
          "group": "CITY_GOLD"
        },
        {
          "code": "BCN",
          "group": "CITY_GOLD"
        },
        {
          "code": "BFS",
          "group": "ETHNIC"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BHX",
          "group": "ETHNIC"
        },
        {
          "code": "BLQ",
          "group": "CITY"
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CAG",
          "group": null
        },
        {
          "code": "CFU",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CGN",
          "group": "ETHNIC"
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EDI",
          "group": "ETHNIC",
          "stops": []
        },
        {
          "code": "EIN",
          "group": "ETHNIC"
        },
        {
          "code": "EMA",
          "group": "ETHNIC"
        },
        {
          "code": "FAO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FKB",
          "group": null
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "FUE",
          "group": "CANARY"
        },
        {
          "code": "GLA",
          "group": "ETHNIC"
        },
        {
          "code": "GOT",
          "group": "ETHNIC"
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "KIR",
          "group": null
        },
        {
          "code": "LBA",
          "group": "ETHNIC"
        },
        {
          "code": "LIS",
          "group": "LEISURE"
        },
        {
          "code": "LPA",
          "group": "CANARY"
        },
        {
          "code": "LPL",
          "group": "ETHNIC"
        },
        {
          "code": "LWO",
          "group": null
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "ETHNIC"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NCL",
          "group": "ETHNIC"
        },
        {
          "code": "NYO",
          "group": "ETHNIC"
        },
        {
          "code": "OPO",
          "group": "LEISURE"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PSA",
          "group": "CITY_GOLD"
        },
        {
          "code": "PSR",
          "group": null
        },
        {
          "code": "RMI",
          "group": null
        },
        {
          "code": "SKG",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SNN",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "SVQ",
          "group": null
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TLS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "TRF",
          "group": "ETHNIC"
        },
        {
          "code": "TSF",
          "group": null
        },
        {
          "code": "VDA",
          "group": null
        },
        {
          "code": "VLC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "WRO",
          "group": "DOMESTIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/WMI_v2.png"
    },
    {
      "code": "WRO",
      "name": "Wroclaw",
      "alternateName": null,
      "alias": [
        "wroclaw"
      ],
      "countryCode": "PL",
      "countryName": "Poland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "PL",
      "latitude": "510600N",
      "longitude": "0165300E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "AGP",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ALC",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "ATH",
          "group": null
        },
        {
          "code": "BCN",
          "group": null,
          "stops": []
        },
        {
          "code": "BFS",
          "group": "ETHNIC"
        },
        {
          "code": "BGY",
          "group": "CITY"
        },
        {
          "code": "BLQ",
          "group": "CITY_GOLD"
        },
        {
          "code": "BOJ",
          "group": null
        },
        {
          "code": "BRS",
          "group": "ETHNIC"
        },
        {
          "code": "BVA",
          "group": "CITY"
        },
        {
          "code": "CFU",
          "group": null
        },
        {
          "code": "CHQ",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CIA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "ETHNIC"
        },
        {
          "code": "DUB",
          "group": "ETHNIC"
        },
        {
          "code": "EDI",
          "group": null
        },
        {
          "code": "EFL",
          "group": null
        },
        {
          "code": "EMA",
          "group": "ETHNIC"
        },
        {
          "code": "FAO",
          "group": null
        },
        {
          "code": "GDN",
          "group": "DOMESTIC"
        },
        {
          "code": "GLA",
          "group": "ETHNIC"
        },
        {
          "code": "GRO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "HER",
          "group": null
        },
        {
          "code": "KBP",
          "group": null
        },
        {
          "code": "KGS",
          "group": null
        },
        {
          "code": "KIR",
          "group": null
        },
        {
          "code": "LBA",
          "group": null
        },
        {
          "code": "LIS",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "LPL",
          "group": "ETHNIC"
        },
        {
          "code": "MAD",
          "group": "CITY"
        },
        {
          "code": "MAN",
          "group": "ETHNIC"
        },
        {
          "code": "MLA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "MXP",
          "group": "CITY"
        },
        {
          "code": "NAP",
          "group": null
        },
        {
          "code": "NCL",
          "group": "ETHNIC"
        },
        {
          "code": "ORK",
          "group": "ETHNIC"
        },
        {
          "code": "PMI",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "PMO",
          "group": null
        },
        {
          "code": "PSA",
          "group": "CITY"
        },
        {
          "code": "RHO",
          "group": null
        },
        {
          "code": "SNN",
          "group": "ETHNIC"
        },
        {
          "code": "STN",
          "group": "ETHNIC"
        },
        {
          "code": "TFS",
          "group": "CANARY"
        },
        {
          "code": "TGD",
          "group": null
        },
        {
          "code": "TLV",
          "group": null
        },
        {
          "code": "TRF",
          "group": null
        },
        {
          "code": "WMI",
          "group": "DOMESTIC"
        },
        {
          "code": "ZTH",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/WRO_v2.png"
    },
    {
      "code": "XCR",
      "name": "Paris Vatry",
      "alternateName": "Paris (Vatry)",
      "alias": [
        "paris",
        "vatry"
      ],
      "countryCode": "FR",
      "countryName": "France",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "FR",
      "latitude": "484604N",
      "longitude": "0041204E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "OPO",
          "group": "CITY_GOLD"
        },
        {
          "code": "RAK",
          "group": "ETHNIC"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/XCR_v2.png"
    },
    {
      "code": "XRY",
      "name": "Jerez",
      "alternateName": null,
      "alias": [
        "jerez"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "364441N",
      "longitude": "0060336W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BCN",
          "group": "DOMESTIC"
        },
        {
          "code": "HHN",
          "group": "LEISURE"
        },
        {
          "code": "STN",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/XRY_v2.png"
    },
    {
      "code": "ZAD",
      "name": "Zadar",
      "alternateName": null,
      "alias": [
        "zadar"
      ],
      "countryCode": "HR",
      "countryName": "Croatia",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "HR",
      "latitude": "440552N",
      "longitude": "0152124E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "BRE",
          "group": null
        },
        {
          "code": "BVA",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "CRL",
          "group": "LEISURE"
        },
        {
          "code": "DUB",
          "group": "LEISURE"
        },
        {
          "code": "FKB",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "FMM",
          "group": null
        },
        {
          "code": "FRA",
          "group": null
        },
        {
          "code": "GOT",
          "group": "LEISURE"
        },
        {
          "code": "MAN",
          "group": "LEISURE"
        },
        {
          "code": "MRS",
          "group": "LEISURE"
        },
        {
          "code": "NRN",
          "group": "LEISURE"
        },
        {
          "code": "NYO",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "STN",
          "group": "LEISURE_GOLD"
        },
        {
          "code": "SXF",
          "group": "LEISURE"
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ZAD_v2.png"
    },
    {
      "code": "ZAZ",
      "name": "Zaragoza",
      "alternateName": null,
      "alias": [
        "zaragoza"
      ],
      "countryCode": "ES",
      "countryName": "Spain",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "ES1",
      "latitude": "413958N",
      "longitude": "0010230W",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "ACE",
          "group": "DOMESTIC"
        },
        {
          "code": "ATH",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "BGY",
          "group": "CITY_GOLD"
        },
        {
          "code": "BVA",
          "group": "CITY_GOLD"
        },
        {
          "code": "CRL",
          "group": "CITY_GOLD"
        },
        {
          "code": "NAP",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        },
        {
          "code": "PMI",
          "group": null
        },
        {
          "code": "STN",
          "group": "CITY_GOLD"
        },
        {
          "code": "SUF",
          "group": null,
          "stops": [
            {
              "code": "BGY"
            }
          ],
          "onlyConnecting": true
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ZAZ_v2.png"
    },
    {
      "code": "ZQW",
      "name": "Zweibrucken",
      "alternateName": null,
      "alias": [
        "zweibrucken"
      ],
      "countryCode": "DE",
      "countryName": "Germany",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "DE",
      "latitude": "491234N",
      "longitude": "0072402E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ZQW_v2.png"
    },
    {
      "code": "ZRH",
      "name": "Zurich",
      "alternateName": null,
      "alias": [
        "zurich"
      ],
      "countryCode": "CH",
      "countryName": "Switzerland",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "CH",
      "latitude": "472730N",
      "longitude": "0083306E",
      "mobileBoardingPass": true,
      "markets": [],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ZRH_v2.png",
      "ecoFriendly": true
    },
    {
      "code": "ZTH",
      "name": "Zakynthos",
      "alternateName": "Zakinthos",
      "alias": [
        "zakynthos",
        "zakinthos"
      ],
      "countryCode": "GR",
      "countryName": "Greece",
      "countryAlias": null,
      "countryGroupCode": "0",
      "countryGroupName": "EU/EEA",
      "timeZoneCode": "GR",
      "latitude": "374503N",
      "longitude": "0205303E",
      "mobileBoardingPass": true,
      "markets": [
        {
          "code": "KTW",
          "group": null
        },
        {
          "code": "POZ",
          "group": null
        },
        {
          "code": "WRO",
          "group": null
        }
      ],
      "notices": null,
      "tripCardImageUrl": "https://assets.ryanair.com/resources/ui/mobile/stations/ZTH_v2.png"
    }
  ]
}
"""

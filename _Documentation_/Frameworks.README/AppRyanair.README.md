#  App.Ryanair

## About

Design Pattern : MVVM

### Others

* Use of Combine for FRP
* UI - `App.Ryanair.UI.framework` - separated from business  - `App.Ryanair.core.framework` - for better modularity and code re-use

## Features

### Search by:

* Origin station 
* Destination station 
* Adults 
* Teen 
* Children

---

### Airports auto-complete

See `Previews/Form.Autocomplete.png`

---

### Cache (of 60m) support (for repeated calls)

```
switch cache {
case .ignoringCache: return apiSubscriber
case .cacheElseLoad: return cacheSubscriberFailSafe
case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
case .cacheDontLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
```

---

### Extra: API with cached values

See `FetcherRyanair.swift`

---

### Mock suport

See `FetcherRyanairMock.swift`

```swift
extension FetcherRyanairMock: APIRyanairProtocol {
    public func stations(request: RyanairRequestDto.Stations, cache: CachePolicy) -> AnyPublisher<RyanairResponseDto.Stations, APIError> {
        let data = Data(stationsMock.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data)
            .decode(type: RyanairResponseDto.Stations.self, decoder: decoder)
            .mapError { error in
                os_log("Error : \(error)", type: .error)
            return .parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }

    public func availability(request: RyanairRequestDto.Availability, cache: CachePolicy) -> AnyPublisher<RyanairResponseDto.Availability, APIError> {
        let data = Data(availabilityMock.utf8)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data)
            .decode(type: RyanairResponseDto.Availability.self, decoder: decoder)
            .mapError { error in
                os_log("Error : \(error)", type: .error)
            return .parsing(description: error.localizedDescription)
        }.eraseToAnyPublisher()
    }
}
```

---

### Internet connection fail safe

* If theres no internet connection, the app will wait 300s and retry the request. (will return cache value anyway if available)
* UI changes if there is no internet connection. See `Previews/Form.Internet.1.png`

```swift
public extension URLSession {
    static var defaultForConnectivity: URLSession {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 300
        return URLSession(configuration: config)
    }
}
```

---

### UI Testing (auto-complete airport)

```swift
func testSuggestions() {
    let app = XCUIApplication()
    app.launch()

    // Wait some seconds for launch
    XCTAssertTrue(app.waitForExistence(timeout: 1))

    let txtOrigin = app.textFields["TextField.origin"]
    if txtOrigin.exists {
        txtOrigin.tap()
        txtOrigin.typeText("DU")
    }

    XCTAssertTrue(app.tables.staticTexts["DUB : Dublin"].waitForExistence(timeout: 1))
}
```

---

### Dark mode support

See `Previews.DarkMode.png`

---

### Screen Previews

Screen previews for faster development. 

__With real data__

```swift
struct RyanairView1_PreviewProvider1: PreviewProvider {
    static var previews: some View {
        RyanairView1Builder.buildView()
    }
}
```

__With mock data__

```swift
struct RyanairView1_PreviewProvider2: PreviewProvider {
    static var previews: some View {
        RyanairView1Builder.buildMockView()
    }
}
```

See `Preview.Mock.png` (with real mock data) and `Preview.Multiple.png`

## To do

### Map all `RyanairResponseDto` objects

Map all `RyanairResponseDto` objects into mirror  `Model` objects so that the ViewModel dont know `RyanairResponseDto` objects

---

### DDD

See [Domain driven design](https://en.wikipedia.org/wiki/Domain-driven_design)


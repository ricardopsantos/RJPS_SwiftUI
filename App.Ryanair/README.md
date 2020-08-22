#  App.Ryanair

## About

Design Pattern : MVVM

### Others

* Use of Combine for reacting UI
* UI (`App.Ryanair.framework`) separated from business (`App.Ryanair.core.framework`) for better modularity and code re-use

## Features

### Search

* Origin station 
* Destination station 
* Adults 
* Teen 
* Children

### Airports auto-complete

See `Previews/Form.Autocomplete.png`

### Extra : Cache (of 60m) support (for repeated calls)

```
switch cache {
case .ignoringCache: return apiSubscriber
case .cacheElseLoad: return cacheSubscriberFailSafe
case .cacheAndLoad : return Publishers.Merge(cacheSubscriberFailable, apiSubscriber).eraseToAnyPublisher()
case .cacheDontLoad: return cacheSubscriberFailable.eraseToAnyPublisher()
```

### Extra: API with cached values

See `FetcherRyanair.swift`

### Extra: Mock suport

See `FetcherRyanairMock.swift`

### Extra: Internet connection fail safe

* If theres no internet connection, the app will wait 300s and retry the request. (will return cache value anyway if available)
* UI changes if there is no internet connection. See `Previews/Form.Internet.1.png`

```
public extension URLSession {
    static var defaultForConnectivity: URLSession {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.timeoutIntervalForResource = 300
        return URLSession(configuration: config)
    }
}
```

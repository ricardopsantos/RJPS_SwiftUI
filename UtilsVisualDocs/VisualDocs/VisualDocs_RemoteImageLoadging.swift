//
//  Created by Ricardo Santos on 04/09/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class LoadUrlImage: ObservableObject {
    @Published var data = Data()
    init(imageURL: String) {
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        if let data = cache.cachedResponse(for: request)?.data {
            self.data = data
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, _) in
                if let data = data, let response = response {
                let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        self.data = data
                    }
                }
            }).resume()
        }
    }
}

struct RemoteImageLoadging: View {
    @ObservedObject var url: LoadUrlImage

    init(imageUrl: String) {
        url = LoadUrlImage(imageURL: imageUrl)
    }

    var body: some View {
          Image(uiImage: UIImage(data: self.url.data) ?? UIImage())
    }
}

// MARK: - Preview

struct VisualDocs_RemoteImageLoadging_PreviewProvider: PreviewProvider {
    static var previews: some View {
        RemoteImageLoadging(imageUrl: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FfDm8JdCAPeM%2Fmaxresdefault.jpg&f=1&nofb=1")
    }
}

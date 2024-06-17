import SwiftUI

public struct AsyncImageViewBuilder<Content: View>: View {
    let url: URL
    let content: (AsyncImagePhase) -> Content
    var modifiers: (Image) -> Image = { $0 }

    public init?(urlString: String, @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        guard let movieURL = URL(string: urlString) else {
            return nil
        }
        self.url = movieURL
        self.content = content
    }

    public var body: some View {
        
        VStack {
            AsyncImage(url: url, content: content)
        }
        .onAppear {
            // Load and cache the image using URLSession
            let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
            URLSession.shared.dataTask(with: request) { data, response, _ in
                if let data = data, let response = response {
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: request)
                }
            }.resume()
        }
    }
}

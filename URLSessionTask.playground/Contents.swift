import UIKit

enum NetworkError: Error {
    case connectionTimeout
    case serverError
    case networkUnavailable
    case inavalidURL
}

func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest) 
    guard let url = urlRequest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print(NetworkError.connectionTimeout.localizedDescription)
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print(response.statusCode)
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString ?? "")
        }
    } .resume()
}

let urlApi = "https://cat-fact.herokuapp.com"
getData(urlRequest: urlApi)

var components = URLComponents()
components.scheme = "https"
components.host = "cat-fact.herokuapp.com"
components.path = ""

let urlComponents = components.string ?? ""
getData(urlRequest: urlComponents)

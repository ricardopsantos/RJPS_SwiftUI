//
//  Agent.swift
//  UglySwiftUIApp
//
//  Created by Ricardo Santos on 28/07/2020.
//  Copyright © 2020 Ricardo P Santos. All rights reserved.
//

import Foundation

struct BasicNetworkAgent {

    struct TaskEntry: Codable {
        let userId: Int
        let `id`: Int
        let title: String
        let completed: Bool
    }

    static func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            _ = error
            if let data = data {
                if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
                    DispatchQueue.main.async {
                        print(response)
                    }
                    return
                }
            }
        }.resume()
    }
}

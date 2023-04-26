//
//  Network.swift
//  Sudoku
//
//  Created by Raphael Ferezin Kitahara on 23/03/23.
//

import SwiftUI

//class Network: ObservableObject {
//    @Published var boardInfo: [NewBoard] = []
//    
//    func getUsers() {
//        guard let url = URL(string: "https://sudoku-api.vercel.app/api/dosuku?query=newboard(limit:1){grids{value}}") else { fatalError("Missing URL") }
//
//        let urlRequest = URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUsers = try JSONDecoder().decode([NewBoard].self, from: data)
//                        self.boardInfo = decodedUsers
//                        print(decodedUsers)
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//
//        dataTask.resume()
//    }
//}
//
//

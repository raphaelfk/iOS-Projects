//
//  APITests.swift
//  Sudoku
//
//  Created by Raphael Ferezin Kitahara on 24/03/23.
//

import Foundation

struct NewBoard: Codable, Identifiable {
    var id = UUID()
    var grids: [Griddd]
    var results: String
    var message: String
}

struct Griddd: Codable {
    var value: [[Int]] = [
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0],
                            [0,0,0,0,0,0,0,0,0]
                        ]
    var solution: [[Int]] = [
                                [0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0]
                            ]
    var dificulty: String = ""
}

struct ApiBoard: Codable {
    var value: [[Int]]
    var solution: [[Int]]
}

class Api {
    func getData() {
        guard let url = URL(string: "https://sudoku-api.vercel.app/api/dosuku?query=%7Bnewboard(limit:1)%7Bgrids%7Bvalue,solution,difficulty%7D,results,message%7D%7D") else {
                        print("Invalid URL")
                        return
                }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUsers = try JSONDecoder().decode([NewBoard].self, from: data)
//                        self.users = decodedUsers
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
                    
        }

//        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//        guard let data = data, error == nil else {
//            print("Error: \(error?.localizedDescription ?? "Unknown error")")
//            return
//            }
//
//            if let response = try? JSONDecoder().decode(NewBoard.self, from: data) {
//                DispatchQueue.main.async {
//                    print(response.message)
//                    // self.responseData = "Title: \(response.title)"
//                }
//            }
//        }.resume()
    }
    
}

struct Response: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

//class Api {
//    func getBoard() {
//        let urlString = "https://sudoku-api.vercel.app/api/dosuku?query=%7Bnewboard(limit:1)%7Bgrids%7Bvalue,solution,difficulty%7D,results,message%7D%7D"
//        if let url = NSURL(string: urlString) {
//            do {
//                print("sim")
//
//            } catch {
//
//            }
//        } else {
//            print("nao")
//        }
        
//         let session = URLSession.shared
//        let board = session.dataTask(with: url!) { (data, response, error) in
//            if error == nil && data != nil {
//                // parse JSON
//                let decoder = JSONDecoder()
//
//                do {
//                    let newBoard = try decoder.decode(NewBoard.self, from: data!)
//                    print(newBoard)
//                }
//                catch {
//                    print("Error in JSON parsing")
//                }
//
//
//            }
//        }
//
//         make the API call
//         board.resume()
//        
//    }
//}

//class apiCall {
//    func getUserComments(completion:@escaping (NewBoard) -> ()) {
//        guard let url = URL(string: "https://sudoku-api.vercel.app/api/dosuku?query={newboard(limit:1){grids{value,solution,difficulty},results,message}}") else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, _, _) in
//            let comments = try! JSONDecoder().decode(NewBoard.self, from: data!)
//            print(comments)
//
//            DispatchQueue.main.async {
//                completion(comments)
//            }
//        }
//        .resume()
//    }
//}

// "https://sudoku-api.vercel.app/api/dosuku?query={newboard(limit:1){grids{value,solution,difficulty},results,message}}"
//{
//    "newboard": {
//        "grids": [
//            {
//                "value": [
//                    [ 0,4,9,0,0,0,1,0,0],
//                    [ 3,5,0,0,0,1,9,0,6],
//                    [0,0,6,0,9,0,0,7,0],
//                    [0,0,1,0,3,0,4,0,0],
//                    [9,8,4,5,0,2,0,0,0],
//                    [6,2,0,0,4,9,0,8,0],
//                    [0,0,2,0,5,0,8,0,0],
//                    [4,0,0,3,6,8,2,0,1],
//                    [0,0,0,0,0,4,0,9,0]
//                ],
//
//                "solution": [
//                    //
//                ],
//
//                "difficulty": "Medium"
//            }
//        ],
//        "results": 1,
//        "message": "All Ok"
//    }
//}

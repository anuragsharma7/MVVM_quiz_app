//
//  QuestionViewModel.swift
//  MVVM_Quiz_app
//
//  Created by Anurag Sharma on 14/12/22.
//

import Foundation

class QuestionViewModel {
    private var sourceUrl = URL(string: "https://quiz-68112-default-rtdb.firebaseio.com/quiz.json")
    
    var questionModel: DataModel?
    
    func getAllTheQuestions(completion: @escaping () -> ()) {
        URLSession.shared.dataTask(with: sourceUrl!) { [weak self] (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                let questionModelResponse = try! decoder.decode(DataModel.self, from: data)
                
                print(questionModelResponse)
                self?.questionModel = questionModelResponse
                completion()
            }
            
        }.resume()
    }
}

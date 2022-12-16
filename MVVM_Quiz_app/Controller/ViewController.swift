//
//  ViewController.swift
//  MVVM_Quiz_app
//
//  Created by Anurag Sharma on 14/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quizTableView: UITableView!
    
    //create two variable, 1 view model and 2nd model
    
    var viewModel = QuestionViewModel()
    var questionData: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quizTableView.dataSource = self
        quizTableView.delegate = self
        
        viewModel.getAllTheQuestions { [weak self] in
            self?.questionData = self?.viewModel.questionModel
            DispatchQueue.main.async {
                self?.quizTableView.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionData?.data?.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = questionData?.data?.questions?[indexPath.row].question
        return cell
    }
    
    
}


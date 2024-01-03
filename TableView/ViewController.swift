//
//  ViewController.swift
//  TableView
//
//  Created by Mac on 05/12/23.
//

import UIKit

class ViewController: UIViewController{
   

    @IBOutlet weak var studentTableView: UITableView!
    
    var studentNames = ["Gajanan" , "Harsha" , "Arjun" ,"Aryan" , "Rutik" , "Shailesh" , "Ashitosh" , "Soham" , "Mahesh"]
      
      override func viewDidLoad() {
          super.viewDidLoad()
          initializeTableView()
      }
      func initializeTableView()
      {
          studentTableView.dataSource = self
          studentTableView.delegate = self
      }
  }
  extension ViewController : UITableViewDelegate
  {
      func numberOfSections(in tableView: UITableView) -> Int {
          1
      }
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          100.0
      }
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete
          {
              studentTableView.beginUpdates()
              studentTableView.deleteRows(at: [indexPath], with: .fade)
              studentNames.remove(at: indexPath.row)
              studentTableView.endUpdates()
          }
      }
      
      
      
  }

  extension ViewController : UITableViewDataSource
  {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          studentNames.count
         
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
      
          let BasicCell = self.studentTableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath) 

          if indexPath.row % 2 == 0{
              BasicCell.backgroundColor = .orange
          }
          else
          {
              BasicCell.backgroundColor = .blue
          }
          
          BasicCell.textLabel?.text = studentNames[indexPath.row]
          return BasicCell
      }
      
      
  }

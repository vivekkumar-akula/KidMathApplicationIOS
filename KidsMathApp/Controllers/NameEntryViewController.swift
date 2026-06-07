//
//  NameEntryViewController.swift
//  KidsMathApp
//
//  Created by Vanam, Lalith Koushik on 10/16/25.
//

import UIKit

class NameEntryViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startTapped(
        _ sender: UIButton
    ) {
        guard let name = nameTextField.text?.trimmingCharacters(
            in: .whitespaces
        ),
              !name.isEmpty else {
            return
        }
        UserDefaults.standard
            .set(
                name,
                forKey: "userName"
            )
        performSegue(
            withIdentifier: "toMainTabBar",
            sender: self
        )
    }
    
    override func viewDidAppear(
        _ animated: Bool
    ) {
        super.viewDidAppear(
            animated
        )
        // Allow using another name anytime: just clear to type again
        nameTextField.text = ""
        nameTextField
            .becomeFirstResponder()
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

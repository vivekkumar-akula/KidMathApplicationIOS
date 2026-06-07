//
//  PracticeModeSetupViewController.swift
//  KidsMathApp
//
//  Created by Vanam, Lalith Koushik on 10/16/25.
//

import UIKit

class PracticeModeSetupViewController: UIViewController {

    @IBOutlet weak var difficultyControl: UISegmentedControl!
    private(
        set
    ) var selectedOperation: String = "+"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func opTapped(
        _ sender: UIButton
    ) {
        selectedOperation = sender
            .title(
                for: .normal
            ) ?? "+"
    }
    
    @IBAction func startTapped(
        _ sender: UIButton
    ) {
        performSegue(
            withIdentifier: "startPracticeGame",
            sender: self
        )
    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier == "startPracticeGame",
           let vc = segue.destination as? PracticeGameViewController {
               vc.operation = selectedOperation
              vc.difficulty = difficultyControl
                .titleForSegment(
                    at: difficultyControl.selectedSegmentIndex
                ) ?? "Easy"
            }
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

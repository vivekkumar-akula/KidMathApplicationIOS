//
//  ChallengeModeSetupViewController.swift
//  KidsMathApp
//
//  Created by Vanam, Lalith Koushik on 10/16/25.
//

import UIKit

class ChallengeModeSetupViewController: UIViewController {

    @IBOutlet weak var timerSwitch: UISwitch!
    @IBOutlet weak var difficultyControl: UISegmentedControl!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    
    private(set) var selectedOperation: String = "+"
    private(set) var selectedDifficulty: String = "Easy"
    private var selectedSeconds: Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerSlider.minimumValue = 10
        timerSlider.maximumValue = 120
        timerSlider.value = 60
        timerLabel.text = "60 sec"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func timerSwitchChanged(_ sender: UISwitch) {
        timerSlider.isEnabled = sender.isOn
        timerLabel.isEnabled = sender.isOn
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        selectedSeconds = Int(sender.value)
        timerLabel.text = "\(selectedSeconds) sec"
    }
    
    
    @IBAction func opTapped(_ sender: UIButton) {
        selectedOperation = sender.title(for: .normal) ?? "+"
    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "startChallengeGame", sender: self)
    }
    
    @IBAction func difficultyChanged(_ sender: UISegmentedControl) {
        selectedDifficulty = sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "Easy"
    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
            if segue.identifier == "startChallengeGame",
               let vc = segue.destination as? ChallengeGameViewController {
                vc.operation = selectedOperation
                vc.difficulty = selectedDifficulty
                vc.totalSeconds = timerSwitch.isOn ? selectedSeconds : 0
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

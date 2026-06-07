//
//  ChallengeGameViewController.swift
//  KidsMathApp
//
//  Created by Vanam, Lalith Koushik on 10/16/25.
//

import UIKit
import PencilKit

class ChallengeGameViewController: UIViewController {
    
    @IBOutlet weak var scratchContainer: UIView!
    private var canvas: PKCanvasView?
    
    var operation: String = "+"
    var difficulty: String = "Easy"
    var totalSeconds: Int = 60

    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            if canvas == nil {
                canvas = attachScratchpad(into: scratchContainer)
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

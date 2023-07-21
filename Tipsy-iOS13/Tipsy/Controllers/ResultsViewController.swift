//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mac on 21/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalValue: String?
    var tipCount: Double?
    var stepperCount: Double?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalValue
        settingsLabel.text = "Split between \(String(format: "%.0f", stepperCount!)) people, with \((tipCount ?? 0.0) * 100)% tip."
        print(totalLabel.text)
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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

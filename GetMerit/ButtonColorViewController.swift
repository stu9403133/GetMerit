//
//  ButtonColorViewController.swift
//  GetMerit
//
//  Created by stu on 2023/12/5.
//

import UIKit

class ButtonColorViewController: UIViewController {

    var colorSet: ButtonColor!
    
    @IBOutlet weak var redIndex: UISlider!
    @IBOutlet weak var greenIndex: UISlider!
    @IBOutlet weak var blueIndex: UISlider!
    @IBOutlet weak var alphaIndex: UISlider!
    @IBOutlet weak var segmantedControll: UISegmentedControl!
    @IBOutlet weak var buttonColor: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSilderUI()
        updateButtonColor()
        // Do any additional setup after loading the view.
    }
    
    func updateSilderUI() {
        redIndex.value = Float(colorSet.red)
        greenIndex.value = Float(colorSet.green)
        blueIndex.value = Float(colorSet.blue)
        alphaIndex.value = Float(colorSet.alpha)
    }
    
    func updateButtonColor() {
        buttonColor.tintColor = UIColor(red: CGFloat(redIndex.value), green: CGFloat(greenIndex.value), blue: CGFloat(blueIndex.value), alpha: CGFloat(alphaIndex.value))
    }
    
    @IBAction func ColorChange(_ sender: Any) {
        updateButtonColor()
    }
  
    
    @IBAction func RandomColor(_ sender: Any) {
        redIndex.setValue(.random(in: (0.1...1)), animated: true)
        greenIndex.setValue(.random(in: (0.1...1)), animated: true)
        blueIndex.setValue(.random(in: (0.1...1)), animated: true)
        alphaIndex.setValue(.random(in: (0.4...1)), animated: true)
        
        updateButtonColor()
    }
    
    @IBAction func changePage(_ sender: Any) {
        if segmantedControll.selectedSegmentIndex == 0{
            buttonColor.image = UIImage(named: "wooden_fish")
        }
        else if segmantedControll.selectedSegmentIndex == 1 {
            buttonColor.image = UIImage(named: "bell")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let redIndex = CGFloat(redIndex.value)
        let greenIndex = CGFloat(greenIndex.value)
        let blueIndex = CGFloat(blueIndex.value)
        let alphaIndex = CGFloat(alphaIndex.value)
        colorSet = ButtonColor(red: redIndex, green: greenIndex, blue: blueIndex, alpha: alphaIndex)
    }
    

}

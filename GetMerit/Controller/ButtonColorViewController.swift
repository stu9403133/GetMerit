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
    
    @IBOutlet weak var randomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSilderUI()
        updateButtonUI()
    }
    
    func updateSilderUI() {
        redIndex.value = Float(colorSet.red)
        greenIndex.value = Float(colorSet.green)
        blueIndex.value = Float(colorSet.blue)
        alphaIndex.value = Float(colorSet.alpha)
    }
    
    //更新顏色並儲存
    func updateButtonUI() {
        // 調整顏色
        buttonColor.tintColor = UIColor(red: CGFloat(redIndex.value), green: CGFloat(greenIndex.value), blue: CGFloat(blueIndex.value), alpha: CGFloat(alphaIndex.value))
       
        //儲存顏色
        do{
            setColor()
            let data = try JSONEncoder().encode(colorSet)
            UserDefaults.standard.set(data, forKey: "buttonColor")
            print("save successed", colorSet!)
        } catch {
            return print("Encode failed")
        }
        //發送notification 傳遞顏色數值到上一頁
        NotificationCenter.default.post(name: ColorNotifactionName.name, object: nil, userInfo: [ColorNotifactionName.notificationKey : colorSet!])
        
    }
    
    func setColor(){
        let redIndex = CGFloat(redIndex.value)
        let greenIndex = CGFloat(greenIndex.value)
        let blueIndex = CGFloat(blueIndex.value)
        let alphaIndex = CGFloat(alphaIndex.value)
        colorSet = ButtonColor(red: redIndex, green: greenIndex, blue: blueIndex, alpha: alphaIndex)
    }
    
    
    
    @IBAction func ColorChange(_ sender: Any) {
        updateButtonUI()
    }
    
    
    @IBAction func RandomColor(_ sender: Any) {
        redIndex.setValue(.random(in: (0.1...1)), animated: true)
        greenIndex.setValue(.random(in: (0.1...1)), animated: true)
        blueIndex.setValue(.random(in: (0.1...1)), animated: true)
        alphaIndex.setValue(.random(in: (0.4...1)), animated: true)
        updateButtonUI()
    }
    
    
    @IBAction func changePage(_ sender: Any) {
        if segmantedControll.selectedSegmentIndex == 0{
            buttonColor.image = UIImage(named: "wooden_fish")
        }
        else if segmantedControll.selectedSegmentIndex == 1 {
            buttonColor.image = UIImage(named: "bell")
        }
    }
        
    

    
    
}

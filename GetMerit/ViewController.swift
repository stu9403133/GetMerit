//
//  ViewController.swift
//  GetMerit
//
//  Created by stu on 2023/11/29.
//

import UIKit

class ViewController: UIViewController {
    //顯示總攻得數目的label
    @IBOutlet weak var totalMerit: UILabel!
    
    //發出聲音的三條線動畫
    @IBOutlet weak var soundImageView: UIImageView!
    
    //切換敲擊圖片的segment control
    @IBOutlet weak var selectedSegment: UISegmentedControl!
    
    //敲擊的button（木魚或鐘的圖片）
    @IBOutlet weak var muyuBell: UIButton!
   
    //+1的圖片
    @IBOutlet weak var plusOneImageView: UIImageView!
    
    //木魚敲擊次數
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //設定起始畫面
        muyuBell.imageView?.image = UIImage(named: "wooden_fish")
        plusOneImageView.isHidden = true
        soundImageView.isHidden = true
        
        
    }
    
    @IBAction func touchWoodenFish(_ sender: Any) {
        //點一下木魚數字跟著加1
        score = score + 1
        totalMerit.text = "\(score)"
        plusOneImageView.isHidden = false
        soundImageView.isHidden = false
        
        //宣告＋1的動畫
        let plusOneAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .linear){
            self.plusOneImageView.frame.origin.y -= 5
        }
        
        //問peter什麼意思
        plusOneAnimator.addCompletion
        {
            (position) in
            if position == .end {
                self.plusOneImageView.isHidden = true
                self.plusOneImageView.frame.origin.y += 5
            }
        }
        
        //宣告聲音的動畫
        let soundAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .linear)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.soundImageView.isHidden = true
        }
        plusOneAnimator.startAnimation()
    }
    
    @IBAction func restart(_ sender: Any) {
        
        score = 0
        totalMerit.text = "0"
        
    }
    
    @IBAction func changePage(_ sender: Any) {
        
        
        muyuBell.setImage(UIImage(named: "bell"), for: .selected)
        
        if selectedSegment.selectedSegmentIndex == 0 {
            muyuBell.setImage(UIImage(named: "wooden_fish"), for: .normal)
        } else if selectedSegment.selectedSegmentIndex == 1 {
            muyuBell.setImage(UIImage(named: "bell"), for: .normal)

        }
    }
}

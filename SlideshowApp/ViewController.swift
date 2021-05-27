//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 落合矩久 on 2021/05/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startstopButton: UIButton!
    @IBOutlet weak var slideimage: UIImageView!
    @IBOutlet weak var nextimage: UIButton!
    @IBOutlet weak var backimage: UIButton!
    
    var imageIndex = 0
    //// 配列に指定するindex番号を宣言
   //初期値
    
    var timer : Timer!
    // スライドショーに使用するタイマーを宣言
    
    let images = [UIImage(named: "image1.jpeg"), UIImage(named: "image2.jpg"), UIImage(named: "image3.jpg"),UIImage(named: "image4.jpg")]
    // スライドショーさせる画像の配列を宣言
    //image1,image2,image3,image4 = 0,1,2,3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       

        slideimage.image = images[imageIndex]
        //起動時にimage1(0)の画像を表示
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        
           let ExpansionViewController: ExpansionViewController = segue.destination as! ExpansionViewController
           
           ExpansionViewController.x = slideimage.image
        
    }
    
    
    
    @IBAction func ontap(_ sender: Any) {
        
        if self.timer != nil {
            self.timer.invalidate()
                    self.timer = nil
                    
                    startstopButton.setTitle("再生", for: .normal)
                    
                    nextimage.isEnabled = true
                    backimage.isEnabled = true
        }
        
        performSegue(withIdentifier: "result", sender: nil)
        
    }
        
    
        
    

    @IBAction func nextimage(_ sender: Any) {
        
        if self.timer != nil {
            
        } else if imageIndex == images.count-1 {
            //images.count-1は　配列.数-1の意味
                   imageIndex = 0
        } else {
                   imageIndex += 1
        }
        
        slideimage.image = images[imageIndex]
    }
    
    
    @IBAction func backimage(_ sender: Any) {
        
        if self.timer != nil {
            
        } else if imageIndex == 0 {
                   imageIndex = 3
        } else {
                   imageIndex -= 1
        }
        slideimage.image = images[imageIndex]
    }
    
    
    
    
    @IBAction func startstop(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            startstopButton.setTitle("停止", for: .normal)
            
            nextimage.isEnabled = false
            backimage.isEnabled = false
            
            
        } else {
            self.timer.invalidate()
            self.timer = nil
            
            startstopButton.setTitle("再生", for: .normal)
            
            nextimage.isEnabled = true
            backimage.isEnabled = true
        }
        
        
    }
    
    @objc func changeImage() {
        
        if imageIndex == images.count-1 {
            //images.count-1は　配列.数-1の意味
                   imageIndex = 0
        } else {
                   imageIndex += 1
        }
        slideimage.image = images[imageIndex]
            
    }
    
    
    
    @IBAction func unwind (_ segue: UIStoryboardSegue) {
    }
    
    
}


//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 落合矩久 on 2021/05/20.
//

import UIKit

class ExpansionViewController: UIViewController {
    
    @IBOutlet weak var expansionimage: UIImageView!
    
    var x: UIImage!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        expansionimage.image = x
        
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

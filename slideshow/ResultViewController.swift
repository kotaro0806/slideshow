//
//  ResultViewController.swift
//  slideshow
//
//  Created by 浅川晃太郎 on 2021/02/05.
//  Copyright © 2021 kotaro.asakawa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView:
    UIScrollView!
    
    var selectedImg: UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedImg

        imageView.contentMode = UIView.ContentMode.scaleAspectFit
       
        // Do any additional setup after loading the view.
    }
    //override func viewDidAppear(_ animated: Bool) {
        //scrollView.delegate = self
        //scrollView.maximumZoomScale = 8.0
        //scrollView.minimumZoomScale = 1.0}


    //func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    //return imageView}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

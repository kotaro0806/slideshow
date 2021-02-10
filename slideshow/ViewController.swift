//
//  ViewController.swift
//  slideshow
//
//  Created by 浅川晃太郎 on 2021/02/05.
//  Copyright © 2021 kotaro.asakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!

    @IBAction func onPrev(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1

        // 表示している画像の番号を元に画像を表示する
        displayImage()

    }
    
    
    
    @IBAction func onNext(_ sender: Any) {
        // 表示している画像の番号を1増やす
               dispImageNo += 1

               // 表示している画像の番号を元に画像を表示する
               displayImage()
    }
    
     @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onNext), userInfo: nil, repeats: true)

            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
        }
    }

    
    var timer: Timer!


    /// 表示している画像の番号
    var dispImageNo = 0

    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {

        // 画像の名前の配列
        let imageNameArray = [
            "ミセス１",
            "ミセス２",
            "ミセス３",
            "ミセス４",
            "ミセス５",
            "ミセス６",
            "ミセス７",
            "ミセス８",
        ]
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }

        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }


        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]

        // 画像を読み込み
        let image = UIImage(named: name)

        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         let image = UIImage(named: "ミセス１")
         imageView.image = image
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var selectedImage : UIImage?
    
    @IBAction func onTapImage(_ sender: Any) {
        selectedImage = UIImage(named: imageNameArray[])
        if selectedImage != nil
        {
        
        performSegue(withIdentifier: "result", sender: nil)
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){

        if (segue.identifier == "toSubViewController"){

            let resultVC: ResultViewController = (segue.destination as? ResultViewController)!

                resultVC.selectedImg = selectedImage

        }

    }
    
    @IBAction func unwind(_ segue:
        UIStoryboardSegue) {
    }

}


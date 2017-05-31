//
//  ViewController.swift
//  TempButton
//
//  Created by Kaira Support on 31/05/17.
//  Copyright © 2017 Kaira Software Pvt Ltd. All rights reserved.
//

import UIKit

class ButtonsCVCell: UICollectionViewCell {
    @IBOutlet weak var IBbtnTemp: UIButton!
}

class ViewController: UIViewController {
    var arrayOfTemp = [Int]()
    var isSelected = [Bool]()
    var intRandomlyIndex = 2
    var intCountButtons = 0
    
    @IBOutlet weak var IBclvTempButtons: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
}

//MARK : Other Method
extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSelected.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonsCVCell", for: indexPath) as! ButtonsCVCell
        cell.IBbtnTemp.backgroundColor = UIColor.lightGray
        cell.IBbtnTemp.setTitleColor(UIColor.white, for: .normal)
        cell.IBbtnTemp.addTarget(self, action: #selector(self.btnClickedTemp(sender:)), for: .touchUpInside)
        cell.IBbtnTemp.tag = indexPath.row
        cell.IBbtnTemp.isUserInteractionEnabled = false
        if isSelected[indexPath.row] == true {
            cell.IBbtnTemp.isUserInteractionEnabled = true
            cell.IBbtnTemp.backgroundColor = UIColor.darkGray
        } else {
            cell.IBbtnTemp.isUserInteractionEnabled = false
        }
        return cell
    }
    
    func btnClickedTemp(sender:UIButton) {
        self.setLoop(index: sender.tag)
    }
    
    func setLoop(index : Int = 0) {
        if arrayOfTemp.count > 0 {
           let randomIndex = Int(arc4random_uniform(UInt32(isSelected.count)))
            if self.isSelected[randomIndex] == false {
            self.isSelected[randomIndex] = true
            self.IBclvTempButtons.reloadData()
            } else {
                for i in 0..<isSelected.count {
                    if isSelected[i] == true {
                    } else {
                        self.setLoop(index: index)
                        break
                    }
                }
            }
        }
    }
}

//MARK : Other Method
extension ViewController {
    func setView() {
        for i in 0..<intCountButtons {
            self.isSelected.append(false)
            self.arrayOfTemp.append(i)
        }
        let randomIndex = Int(arc4random_uniform(UInt32(isSelected.count)))
        self.isSelected[randomIndex] = true
        self.arrayOfTemp.remove(at: randomIndex)
        self.IBclvTempButtons.reloadData()
    }
}

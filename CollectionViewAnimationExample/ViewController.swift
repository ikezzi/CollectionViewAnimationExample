//
//  ViewController.swift
//  CollectionViewAnimationExample
//
//  Created by Kazuhiro Ikeda on 2017/06/08.
//  Copyright © 2017年 ikezzi. All rights reserved.
//

import UIKit

 class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet private weak var collectionView: UICollectionView!
    let colors: [UIColor] = [.green, .blue, .yellow, .red, .purple]
    let duration: Double = 0.5
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let originFrame = cell.contentView.frame
        cell.contentView.frame = CGRect(x: originFrame.size.width / 2,
                                        y: originFrame.size.height / 2,
                                        width: 0,
                                        height: 0)
        cell.contentView.alpha = 0
        cell.contentView.backgroundColor = colors[indexPath.row]
        let delay = duration * Double(indexPath.row)
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: .curveEaseIn,
                       animations: {
                           cell.contentView.frame = originFrame
                           cell.contentView.alpha = 1.0
                       },
                       completion: nil)
        return cell
    }

}


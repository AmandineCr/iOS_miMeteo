//
//  ForecastCell.swift
//  miMeteo
//
//  Created by etudiant on 09/12/2020.
//  Copyright © 2020 etudiant. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var forecasts = [Forecast]()
    let cellID = "SingleDataCell"
    
    func setup(forecasts: [Forecast]) {
        self.forecasts = forecasts
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let forecast = forecasts[indexPath.item]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? SingleDataCell {
            cell.setup(forecast: forecast)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}

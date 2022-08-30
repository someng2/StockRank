//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by 백소망 on 2022/08/30.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    // ui compenent 연결하자
    
    // ui component에 데이터를 업데이트 하는 코드를 넣자
      
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        diffLabel.text = "\(stock.diff)%"
        
//        let color: UIColor
//        if (stock.diff > 0) {
//            color = UIColor.systemRed
//        } else {
//            color = UIColor.systemBlue
//        }
//        diffLabel.textColor = color
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal     // 세자리씩 끊어
        numberFormatter.maximumFractionDigits = 0   // 소수점 몇째자리까지
        
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
}

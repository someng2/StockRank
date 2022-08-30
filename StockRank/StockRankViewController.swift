//
//  StockRankViewController.swift
//  StockRank
//
//  Created by 백소망 on 2022/08/29.
//

import UIKit

class StockRankViewController: UIViewController {

    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // Data, Presentation, Layout
    // Data - 어떤 데이터? -> stockList
    // Presentation - 셀을 어떻게 표현?
    // Layout - 셀을 어떻게 배치할꺼야?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension StockRankViewController: UICollectionViewDataSource {
    // 데이터 몇개 들어오는지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    // 셀을 어떻게 표현할 건지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 재사용 가능한 cell을 가져옴
        // cell은 UICollectionViewCell인데 StockRankCollectionViewCell일 경우를 사용
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        return cell
    }
}

// 셀을 어떻게 배치할것인지
extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView
        // height = 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}

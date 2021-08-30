//
//  CollectionViewController.swift
//  testAppForMDH
//
//  Created by Жеребцов Данил on 29.08.2021.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class CollectionVC: UIViewController  {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchedText = ""
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setCollectionView()
        fetchPhotos {
            self.collectionView.reloadData()
        }
        
    }
    
    func fetchPhotos(completion: (() -> Void)? = nil) {
        let url = "https://api.unsplash.com/search/photos?page=1&query=\(searchedText)&per_page=100&client_id=ci_MiWyly6c2gnkm690-xIAFkWnGejnivGgtalZ-rII"
        AF.request(url, method: .get).validate().responseData { (response ) in
            switch response.result {
            
            case .success(_):
                guard let data = response.data else { return }
                guard let json = try? JSON(data: data) else { return }
                let photosJSON = json["results"]
                self.model.photos = photosJSON.arrayValue.compactMap { Photo(json: $0)}
                completion?()
          
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}




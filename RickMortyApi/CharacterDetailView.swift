//
//  CharacterDetailView.swift
//  RickMortyApi
//
//  Created by Yuliia Khrupina on 6/26/22.
//

import Foundation
import UIKit
import Kingfisher

class CharacterDetailView: UIViewController {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var species: UILabel!
    
    var character: Character? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = "Name: \(character?.name ?? "")"
        gender.text = "Gender: \(character?.gender ?? "")"
        origin.text = "Origin: \(character?.getOriginName() ?? "")"
        status.text = "Status: \(character?.status ?? "")"
        species.text = "Species: \(character?.species ?? "")"
        
        guard let url = URL.init(string: character?.image ?? "") else {
                        return
                    }
        icon.kf.setImage(with: url)
    }
}

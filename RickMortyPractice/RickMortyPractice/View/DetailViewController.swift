//
//  DetailViewController.swift
//  MVPProject
//
//  Created by Шермат Эшеров on 29/7/22.
//

import UIKit
import Kingfisher
import SnapKit


class DetailViewController: UIViewController {
    
    private lazy var detailViewModel: DetailViewModel = {
        return DetailViewModel()
    }()
    
    
    private lazy var characterImage: UIImageView = {
        let imageV = UIImageView()
        imageV.layer.cornerRadius = 14
        imageV.layer.masksToBounds = true
        imageV.contentMode = .scaleToFill
        return imageV
    }()
    
    private lazy var characterName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textColor = UIColor(red: 8/255, green: 175/255, blue: 199/255, alpha: 2)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var characterStatus: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var characterSpecies: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var characterGender: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var characterOrigine: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var characterLocation: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var firstPilot: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        binder()
        setupConstraint()
        
    }
}


extension DetailViewController{
    func setupConstraint(){
        view.backgroundColor = .white
        
        let elements = [characterName, characterImage, characterGender, characterStatus, characterOrigine, characterLocation, characterSpecies, firstPilot]
        for element in elements {
            view.addSubview(element)
        }
        characterImage.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(50)
            make.height.equalTo(320)
        }
        
        characterName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(characterImage.snp.bottom).offset(30)
            make.width.equalTo(250)
        }
        
        characterStatus.snp.makeConstraints { make in
            make.leading.equalTo(50)
            make.top.equalTo(characterName.snp.bottom).offset(15)
            make.width.equalTo(250)
        }
        
        characterSpecies.snp.makeConstraints { make in
            make.leading.equalTo(50)
            make.top.equalTo(characterStatus.snp.bottom).offset(15)
            make.width.equalTo(250)
        }
        
        characterGender.snp.makeConstraints { make in
            make.leading.equalTo(50)
            make.top.equalTo(characterSpecies.snp.bottom).offset(15)
            make.width.equalTo(250)
        }
        
        characterOrigine.snp.makeConstraints { make in
            make.leading.equalTo(50)
            make.top.equalTo(characterGender.snp.bottom).offset(15)
            make.width.equalTo(250)
        }
        
        characterLocation.snp.makeConstraints { make in
            make.leading.equalTo(50)
            make.top.equalTo(characterOrigine.snp.bottom).offset(15)
            make.width.equalTo(250)
        }
        
        firstPilot.snp.makeConstraints { make in
            make.leading.equalTo(50)
            make.top.equalTo(characterLocation.snp.bottom).offset(15)
            make.width.equalTo(270)
        }

    }
    
    
    func fetchId(id: String){
        detailViewModel.indx = id
    }
    
    func binder(){
        detailViewModel.shareData()
        detailViewModel.items.bind { datas in
            DispatchQueue.main.async { [self] in
                characterImage.kf.indicatorType = .activity
                characterImage.kf.setImage(with: URL(string: datas.image), placeholder: nil, options: nil, completionHandler: nil)
                
                characterName.text = datas.name
                characterStatus.text = "Status: \(datas.status.capitalized)"
                characterSpecies.text = "Species: \(datas.species.capitalized)"
                characterGender.text = "Gender: \(datas.gender.capitalized)"
                characterOrigine.text = "Origine: \(datas.origin.name.capitalized)"
                characterLocation.text = "Location: \(datas.location.name.capitalized)"
            }
        }
    }
}


//
//  DetailController.swift
//  LibrariesProject
//
//  Created by Amir on 08.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import SDWebImage

class DetailController: UIViewController {
    
    /// ImageView for hero image & size for it
    private var heroImageView = UIImageView(roundCorners: true, cornerRadius: 10)
    private var heroImageViewSize = CGSize(width: 120, height: 120)
    
    /// Labels for hero data
    private let nameLabel = UILabel(fontSize: 19, textColor: .black)
    private let heightLabel = UILabel(textColor: .black)
    private let massLabel = UILabel(textColor: .black)
    private let genderLabel = UILabel(textColor: .black)
    private let homeworldLabel = UILabel(textColor: .black)
    private let wikiLabel = UILabel(textColor: .black)
    private let speciesLabel = UILabel(textColor: .black)
    private let hairColorLabel = UILabel(textColor: .black)
    private let eyeColorLabel = UILabel(textColor: .black)
    private let skinColorLabel = UILabel(textColor: .black)
    
    /// Basic indentation for elements
    private let interval: CGFloat = 20
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initConstraints()
        view.backgroundColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeFromParent()
    }    
    
    /// Method, that set hero data to UI elements
    /// - Parameter hero: passed entity
    func configure(with hero: Hero) {
       
        guard let url = URL(string: hero.image) else { return }
        
        heroImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "loading"))
        
        title = hero.name
        
        nameLabel.text = hero.name
        heightLabel.text = hero.height == nil ? "No height" : "Height: \(hero.height!)"
        massLabel.text = hero.mass == nil ? "No mass" : "Mass: \(hero.mass!)"
        genderLabel.text = "Gender: " + hero.gender
        homeworldLabel.text = "Homeworld: " + (hero.homeworld ?? "No homeworld")
        wikiLabel.text = "Wiki: " + hero.wiki
        speciesLabel.text = "Species: " + hero.species
        hairColorLabel.text = "Hair color: " + (hero.hairColor ?? "No hair color")
        eyeColorLabel.text = "Eye color: " + (hero.eyeColor ?? "No eye color")
        skinColorLabel.text = "Skin color: " + (hero.skinColor ?? "No skin color")
    }
    
    /// Method, that initialize all UI elements & add constraints to them
    private func initConstraints() {
        
        view.addSubview(heroImageView)
        view.addSubview(nameLabel)
        
        view.addSubview(heightLabel)
        view.addSubview(massLabel)
        view.addSubview(genderLabel)
        view.addSubview(homeworldLabel)
        view.addSubview(wikiLabel)
        view.addSubview(speciesLabel)
        view.addSubview(hairColorLabel)
        view.addSubview(eyeColorLabel)
        view.addSubview(skinColorLabel)
        
        let stack = UIStackView(views: [heightLabel,
                                        massLabel,
                                        genderLabel,
                                        homeworldLabel,
                                        wikiLabel,
                                        speciesLabel,
                                        hairColorLabel,
                                        eyeColorLabel,
                                        skinColorLabel],
                                axis: .vertical,
                                spacing: 0)
        stack.distribution = .fillProportionally
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            heroImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: interval),
            heroImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heroImageView.widthAnchor.constraint(equalToConstant: heroImageViewSize.width),
            heroImageView.heightAnchor.constraint(equalToConstant: heroImageViewSize.height),
            
            nameLabel.centerXAnchor.constraint(equalTo: heroImageView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: interval / 2),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            stack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: interval),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: interval),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -interval),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -interval)
        ])
    }
}

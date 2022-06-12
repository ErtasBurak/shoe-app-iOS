//
//  ImageCell.swift
//  iOSCaseStudy
//

//

import UIKit

class ImageCell: UITableViewCell {
    
    var shoeImageView = UIImageView()
    var shoeTitleLabel = UILabel()
    var shoeDescriptionLabel = UILabel()
    var shoePriceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(shoeImageView)
        addSubview(shoeTitleLabel)
        addSubview(shoeDescriptionLabel)
        addSubview(shoePriceLabel)
        
        configureImageView()
        configureTitleLabel()
        configureDescriptionLabel()
        configurePriceLabel()
        
        setImageConstraints()
        setTitleConstraints()
        setDescriptionConstraints()
        setPriceConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(shoe:Shoe){
        shoeImageView.image = shoe.image
        shoeTitleLabel.text = shoe.product
        shoeDescriptionLabel.text = shoe.description
        shoePriceLabel.text = shoe.price
    }
    
    func configureImageView(){
        shoeImageView.layer.cornerRadius = 10
        shoeImageView.clipsToBounds = true
    }
    
    func configureTitleLabel(){
        shoeTitleLabel.numberOfLines = 0
        shoeTitleLabel.adjustsFontSizeToFitWidth = true
        shoeTitleLabel.font = UIFont.italicSystemFont(ofSize: 18)
    }
    
    func configureDescriptionLabel(){
        shoeDescriptionLabel.numberOfLines = 0
        shoeDescriptionLabel.clipsToBounds = true
        shoeDescriptionLabel.font = shoeDescriptionLabel.font.withSize(12)
    }
    
    func configurePriceLabel(){
        shoePriceLabel.numberOfLines = 0
        shoePriceLabel.clipsToBounds = true
        shoePriceLabel.textColor = UIColor.black
        shoePriceLabel.font = shoePriceLabel.font.withSize(12)
        shoePriceLabel.font = UIFont.italicSystemFont(ofSize: 12)
    }
    
    func setImageConstraints(){
        shoeImageView.translatesAutoresizingMaskIntoConstraints = false
        shoeImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        shoeImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
        shoeImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        shoeImageView.widthAnchor.constraint(equalTo: shoeImageView.heightAnchor,multiplier: 16/9).isActive = true
    }
    
    func setTitleConstraints(){
        shoeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        shoeTitleLabel.centerYAnchor.constraint(equalTo: shoeDescriptionLabel.topAnchor,constant: 15).isActive = true
        shoeTitleLabel.leadingAnchor.constraint(equalTo: shoeImageView.trailingAnchor,constant: 20).isActive = true
        shoeTitleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        shoeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12).isActive = true
    }
    
    func setDescriptionConstraints(){
        shoeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        shoeDescriptionLabel.centerYAnchor.constraint(equalTo: shoeTitleLabel.bottomAnchor,constant: 20).isActive = true
        shoeDescriptionLabel.leadingAnchor.constraint(equalTo: shoeImageView.trailingAnchor,constant: 20).isActive = true
        shoeDescriptionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        shoeDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12).isActive = true
        
    }
    
    func setPriceConstraints(){
        shoePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        shoePriceLabel.centerYAnchor.constraint(equalTo: shoeTitleLabel.bottomAnchor,constant: 50).isActive = true
        shoePriceLabel.leadingAnchor.constraint(equalTo: shoeImageView.trailingAnchor,constant: 20).isActive = true
        shoePriceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        shoePriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12).isActive = true
        
    }
    
}

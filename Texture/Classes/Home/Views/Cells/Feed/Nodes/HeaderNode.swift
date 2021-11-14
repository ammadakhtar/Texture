//
//  HeaderCell.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

final class HeaderNode: BaseNode {
    
    // MARK: - Variables
    
    var nameTextNode = ASTextNode()
    var menuButtonNode = ASButtonNode()
    var profileImage = ASImageNode()
    
    // MARK: - Init
    
    override init() {
        super.init()
        setup()
    }
    
    // MARK: - LayoutSpec
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let leftPadding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0),
            child: profileImage)
        
        let iconSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .end,
            alignItems: .end,
            children: [menuButtonNode])
        
        let rightPadding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16),
            child: iconSpec)
        rightPadding.style.flexGrow = 1
        
        let headerNodeSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10,
            justifyContent: .start,
            alignItems: .center,
            children: [leftPadding, nameTextNode, rightPadding])
        return headerNodeSpec
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        profileImage.image = UIImage(named: "profile")
        profileImage.cornerRoundingType = .precomposited
        profileImage.cornerRadius = 35/2
        profileImage.style.preferredSize = CGSize(width: 35, height: 35)
        
        nameTextNode.attributedText = NSAttributedString(
            string: "Ammad Akhtar",
            attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17),
                         NSAttributedString.Key.foregroundColor: UIColor.label]
        )
        
        menuButtonNode.setImage(UIImage(named: "elipse"), for: .normal)
        menuButtonNode.tintColor = .white
        menuButtonNode.style.preferredSize = CGSize(width: 10, height: 10)
    }
}


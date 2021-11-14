//
//  StoryNode.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

class StoryNode: BaseCellNode {
    
    // MARK: - Variables
    
    var imageNode = ASImageNode()
    var nameNode = ASTextNode()
    
    // MARK: - Init
    
    override init() {
        super.init()
        setup()
    }
    
    // MARK: - LayoutSpec
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .center, children: [imageNode, nameNode])
    }
    
    
    // MARK: - Private Methods
    
    func populate(name: String, isWatched: Bool) {
        nameNode.attributedText = NSAttributedString(string: name, attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10)])
        imageNode.image = UIImage(named: "profile")
        let colour = isWatched ? UIColor.lightGray : UIColor.red
        imageNode.imageModificationBlock = ASImageNodeRoundBorderModificationBlock(5.0, colour)
    }
    
    private func setup() {
        nameNode.maximumNumberOfLines = 1
        imageNode.style.preferredSize = CGSize(width: 63, height: 63)
        imageNode.cornerRoundingType = .precomposited
        imageNode.cornerRadius = 63/2
    }
}

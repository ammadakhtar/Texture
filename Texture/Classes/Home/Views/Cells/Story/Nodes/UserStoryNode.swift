//
//  UserStoryNode.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

final class UserStoryNode: StoryNode {
    
    // MARK: - Variables
    
    var addButton = ASButtonNode()
    
    // MARK: - Init
    
    override init() {
        super.init()
        setupNodes()
    }
    
    // MARK: - LayoutSpec
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let cornerSpec = ASCornerLayoutSpec(child: imageNode, corner: addButton, location: .bottomRight)
        // Slightly shift center of badge inside of avatar.
        cornerSpec.offset = CGPoint(x: -10, y: -10)
        return ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .center, children: [cornerSpec, nameNode])
    }

    private func setupNodes() {
        addButton.backgroundColor = UIColor.purple
        addButton.setTitle("+", with: UIFont.boldSystemFont(ofSize: 15), with: .white, for: .normal)
        addButton.borderColor = UIColor.white.cgColor
        addButton.borderWidth = 1.5
        addButton.style.preferredSize = CGSize(width: 20, height: 20)
        addButton.cornerRadius = 20/2
        
        imageNode.image = UIImage(named: "profile")
        nameNode.attributedText = NSAttributedString(string: "Ammad", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 10)])
    }
}

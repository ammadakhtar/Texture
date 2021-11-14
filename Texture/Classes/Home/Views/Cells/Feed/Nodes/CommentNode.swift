//
//  CommentNode.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

class CommentNode: BaseNode {
    
    var imageNode = ASImageNode()
    var nameTextNode = ASTextNode()
    var commentTextNode = ASTextNode()
    
    override init() {
        super.init()
        setupNode()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let hStack = ASStackLayoutSpec(direction: .vertical, spacing: 6, justifyContent: .start, alignItems: .stretch, children: [nameTextNode, commentTextNode])
        hStack.style.flexShrink = 1
        hStack.style.flexGrow = 1
        let layoutSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 6, justifyContent: .start, alignItems: .stretch, children: [imageNode, hStack])
        
        return ASInsetLayoutSpec(insets: .init(top: 10, left: 10, bottom: 10, right: 10), child: layoutSpec)
        
    }
    
    private func setupNode() {
        imageNode.style.preferredSize = CGSize(width: 20, height: 20)
        imageNode.cornerRoundingType = .precomposited
        imageNode.cornerRadius = 20/2
        
        commentTextNode.attributedText = NSAttributedString(string: "This is an amazing framework that just lets you add nodes and expands based on the content. Never deal with constraints and gone are the days of ugly scrollView has ambiguous content lol", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.label])
        nameTextNode.attributedText = NSAttributedString(string: "Cool Dev", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor : UIColor.label])
        imageNode.image = UIImage(named: "profile")
    }
}

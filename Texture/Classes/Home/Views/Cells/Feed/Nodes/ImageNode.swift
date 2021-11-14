//
//  ImageNode.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

final class ImageNode: BaseNode {
    
    // MARK: - Variables
    
    var imageNode = ASNetworkImageNode()
    
    // MARK: - Init
    
    override init() {
        super.init()
        imageNode.style.preferredSize.width = UIScreen.main.bounds.width
        populate()
    }
    
    // MARK: - LayoutSpec
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: imageNode)
    }
    
    // MARK: - Private Method
    
    private func populate() {
        imageNode.url = URL(string: "https://picsum.photos/200/300")
        // the idea here is to have some sort of aspect ratio provided in json so each image will have a different height
        imageNode.style.preferredSize.height = UIScreen.main.bounds.width * CGFloat(1.0)
        imageNode.style.preferredSize.width = UIScreen.main.bounds.width
    }
}

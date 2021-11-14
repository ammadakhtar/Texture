//
//  ViewController.swift
//  Texture
//
//  Created by Ammad Akhtar on 14/11/2021.
//

import AsyncDisplayKit

class HomeViewController: ASDKViewController<BaseNode> {

    // MARK: - Variables
    
    var homeNode: HomeNode!
    
    // MARK: - Init
    
    override init() {
        super.init(node: BaseNode())
        homeNode = HomeNode()
        self.node.addSubnode(homeNode)
        node.layoutSpecBlock = { (node, constrainedSize) in
            return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: self.homeNode)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    // MARK: - Private Methods
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = "Texture iOS"
    }
}


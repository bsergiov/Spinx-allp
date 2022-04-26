//
//  WebViewController.swift
//  Spinx allp
//
//  Created by SV on 26.04.2022.
//

import WebKit


class WebViewController: UIViewController {

    // MARK: - Public Properties
    var statusWork: Int!
    
    
    // MARK: - Private Properties
    private var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        loadWebvie()
    }
    
    // MARK: - Private Methodes
    private func loadWebvie() {
        let urlString = statusWork == 0
        ? DataManager.urlPolicyString
        : DataManager.urlTermsString
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webview.load(request)
    }
}

// MARK: - Setup View
extension WebViewController {
    private func setupView() {
        webview = WKWebView()
        view.addSubview(webview)
    }
}

// MARK: - Setup Constraints
extension WebViewController {
    private func setupConstraints() {
        webview.frame = view.frame
        
    }
}

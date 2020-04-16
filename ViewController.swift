//
//  ViewController.swift
//  XcodeWebView1
//
//  Created by MEVREN on 14.05.2018.
//  Copyright © 2018 Urolojik Cerrahi Dernegi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    //@IBOutlet weak var webView: WKWebView!
    var webView: WKWebView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.viewController = self
              
        setupWebView()
        let url = URL(string: "http://mkontak.konak.bel.tr/")
        let request = URLRequest(url:url!)
        webView.load(request)
        
    }
    
    func loadRequest(deviceTokenString : String)
    {
        let deviceid = UIDevice.current.identifierForVendor!.uuidString
        //print("====== device id =======")
        //print(deviceid)
        
        
        if(deviceTokenString != ""){
            let url = URL(string: "http://mkontak.konak.bel.tr/?device=ios&deviceid=" + deviceid + "&devicetoken=" + deviceTokenString)
            let request = URLRequest(url:url!)
            webView.load(request)
        }else{
            
          let url = URL(string: "http://mkontak.konak.bel.tr")
            let request = URLRequest(url:url!)
            webView.load(request)
        }
    }
    
    func setupWebView() {
        let webConfiguration = WKWebViewConfiguration()
        
        webView = WKWebView(frame:.zero , configuration: webConfiguration)
        webView.uiDelegate = self
        //view = webView
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":webView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":webView]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


//
//  ViewController.swift
//  Swift_MapView
//
//  Created by Junji on 2015/01/05.
//  Copyright (c) 2015年 Junji Yamamoto. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , MKMapViewDelegate {
    
    //マップビュー
    var swiftMapView : MKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //マップビュー生成
        swiftMapView = makeMapView(self.view.frame)
        self.view.addSubview(swiftMapView!)
        
        //緯度経度の設定
        var cordinate = CLLocationCoordinate2D (latitude: 35.707527, longitude: 139.760857)
        
        //ズームの設定
        var span = MKCoordinateSpan (latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        //緯度経度とズームの配置
        var region = MKCoordinateRegion (center: cordinate, span: span)
        swiftMapView?.setRegion(region, animated: true)
    }

    //マップビュー作成
    func makeMapView(frame: CGRect) ->MKMapView
    {
        let mapView = MKMapView()
        self.view.frame = frame
        mapView.mapType = MKMapType.Standard//マップタイプの設定
        mapView.autoresizingMask =
            UIViewAutoresizing.FlexibleTopMargin |
            UIViewAutoresizing.FlexibleBottomMargin |
            UIViewAutoresizing.FlexibleLeftMargin |
            UIViewAutoresizing.FlexibleRightMargin |
            UIViewAutoresizing.FlexibleWidth |
            UIViewAutoresizing.FlexibleHeight
        mapView.delegate = self
        return mapView
    }
    
    //マップロード成功時
    func mapViewDidFinishLoadingMap(mapView: MKMapView!) {
        
        println("マップロード成功")
    }
    //マップロード失敗時
    func mapViewDidFailLoadingMap(mapView: MKMapView!, withError error: NSError!) {
        println("マップロード失敗")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


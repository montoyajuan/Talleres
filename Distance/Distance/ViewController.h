//
//  ViewController.h
//  Distance
//
//  Created by Juan Felipe Montoya Gómez on 7/19/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) MKPolyline *routeLine;
@end

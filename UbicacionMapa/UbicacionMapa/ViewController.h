//
//  ViewController.h
//  UbicacionMapa
//
//  Created by Juan Felipe Montoya Gómez on 7/18/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

@interface ViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate,UISearchBarDelegate>
{
    CLLocationManager * locationManager;
}

@property (strong, nonatomic) IBOutlet MKMapView *worldView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *mapType;



- (IBAction)changeMapType:(id)sender;

-(void) findLocation;
-(void) findLocation:(CLLocation*)loc;
@end

//
//  ViewController.m
//  Distance
//
//  Created by Juan Felipe Montoya Gómez on 7/19/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"
#import "DisplayMap.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_mapView setMapType:MKMapTypeHybrid];
    [_mapView setZoomEnabled:YES];
    [_mapView setScrollEnabled:YES];
    
    MKCoordinateRegion region;
    
    region.center.latitude = 4.60971;
    region.center.longitude = -74.08175;
    
    region.span.latitudeDelta = 20;
    region.span.latitudeDelta = 20;
    
    [_mapView setRegion:region];
    
    DisplayMap *pin= [[DisplayMap alloc]init];
    pin.title = @"Bogota";
    pin.subtitle = @"Capital";
    pin.coordinate = region.center;
    
    [_mapView addAnnotation:pin ];
    
    DisplayMap *pin2= [[DisplayMap alloc]init];
    pin2.title = @"Manizales";
    pin2.subtitle = @"Caldas";
    pin2.coordinate = CLLocationCoordinate2DMake(5.07,-75.52056);
    
    [_mapView addAnnotation:pin2 ];
    
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:pin.coordinate.latitude longitude:pin.coordinate.longitude];
    CLLocation *loc2 = [[CLLocation alloc]initWithLatitude:pin2.coordinate.latitude longitude:pin2.coordinate.longitude];
    
    CLLocationDistance distance = [loc distanceFromLocation:loc2];
    
    NSLog(@"Distancia en metros: %f y en millas: %f", distance, distance*0.000621371192);
    
    MKMapPoint * pointsArray = malloc(sizeof(CLLocationCoordinate2D)*2);
    
    pointsArray[0] = MKMapPointForCoordinate(pin.coordinate);
    pointsArray[1] = MKMapPointForCoordinate(pin2.coordinate);
    
    _routeLine = [MKPolyline polylineWithPoints:pointsArray count:2];
    [_mapView addOverlay:_routeLine];
    
    
    //MKOverlayView *overlayView = nil;
    
    /*
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapViewTapped:)];
    [_mapView addGestureRecognizer:tapRecognizer];
    */
    
}

-(MKOverlayView *) mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    MKOverlayView *overlayView = nil;
    MKPolylineView * routelineView = [[MKPolylineView alloc] initWithPolyline:_routeLine ];
    routelineView.strokeColor = [UIColor redColor];
    routelineView.lineWidth = 5;
    overlayView = routelineView;
    
    return overlayView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)mapViewTapped:(UITapGestureRecognizer *)recognizer
{
    CGPoint pointTappedInMapView = [recognizer locationInView:_mapView];
    CLLocationCoordinate2D geoCoordinatesTapped = [_mapView convertPoint:pointTappedInMapView toCoordinateFromView:_mapView];
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            /* equivalent to touchesBegan:withEvent: */
            break;
            
        case UIGestureRecognizerStateChanged:
            /* equivalent to touchesMoved:withEvent: */
            break;
            
        case UIGestureRecognizerStateEnded:
            /* equivalent to touchesEnded:withEvent: */
            break;
            
        case UIGestureRecognizerStateCancelled:
            /* equivalent to touchesCancelled:withEvent: */
            break;
            
        default:
            break;
    }
}
@end

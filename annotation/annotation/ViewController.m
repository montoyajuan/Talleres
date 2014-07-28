//
//  ViewController.m
//  annotation
//
//  Created by Juan Felipe Montoya Gómez on 7/19/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"
#import "FlagView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D coord1;
    coord1.latitude = 4.60971;
    coord1.longitude = -74.08175;
    MapPoint * punto1 = [[MapPoint alloc] initWithCoordinate:coord1 title:@"Bogotá"];
    [_mapView addAnnotation:punto1];
    
    CLLocationCoordinate2D coord2;
    coord2.latitude = 5.07;
    coord2.longitude = -75.52056;
    MapPoint * punto2 = [[MapPoint alloc] initWithCoordinate:coord2 title:@"Manizales"];
    [_mapView addAnnotation:punto2];
    
    CLLocationCoordinate2D coord3;
    coord3.latitude = 6.21667;
    coord3.longitude = -75.5667;
    MapPoint * punto3 = [[MapPoint alloc] initWithCoordinate:coord3 title:@"Medellín"];
    [_mapView addAnnotation:punto3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    
    MKCoordinateRegion region;
    
    region.center.latitude = 4.60971;
    region.center.longitude =-74.08175;
    
    region.span.latitudeDelta = 5;
    region.span.longitudeDelta = 5;
    
    [_mapView setRegion:region animated:YES];
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
        
    MKAnnotationView * annotationView;
    FlagView *viewFlag = [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:self options:nil] objectAtIndex:0];
    annotationView = (MKAnnotationView*) viewFlag;
    MapPoint * point = annotation;
    [viewFlag setTitle:point.title];
    
    //CGRect annotationViewFrame = annotationView.frame;
    //Centrar
    
    return annotationView;
}

-(void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
}
@end

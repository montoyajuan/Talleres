//
//  ViewController.m
//  UbicacionMapa
//
//  Created by Juan Felipe Montoya Gómez on 7/18/14.
//  Copyright (c) 2014 mobilemontoya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc] init ];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
    
    [_worldView setShowsUserLocation:YES];
    
    
    if (_mapType.selectedSegmentIndex == 0)
    {
        self.worldView.mapType = MKMapTypeStandard;
    }
    else if (_mapType.selectedSegmentIndex == 1)
    {
        self.worldView.mapType = MKMapTypeSatellite;
    }
    else if (_mapType.selectedSegmentIndex == 2)
    {
        self.worldView.mapType = MKMapTypeHybrid;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView*) mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    CLLocationCoordinate2D loc = [userLocation coordinate];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    [_worldView setRegion:region animated:YES];
}


- (IBAction)changeMapType:(id)sender {
    
    if (_mapType.selectedSegmentIndex == 0)
    {
        self.worldView.mapType = MKMapTypeStandard;
    }
    else if (_mapType.selectedSegmentIndex == 1)
    {
        self.worldView.mapType = MKMapTypeSatellite;
    }
    else if (_mapType.selectedSegmentIndex == 2)
    {
        self.worldView.mapType = MKMapTypeHybrid;
    }
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations    {
    
    CLLocation * newLocation = [locations lastObject];
    CLLocation * oldLocation;
    
    if (locations.count > 1)
    {
        oldLocation = [locations objectAtIndex:locations.count-2];
    }
    else
    {
        oldLocation = nil;
    }
    [self findLocation:newLocation];
}

-(void) findLocation{
    
}

-(void) findLocation:(CLLocation*)loc{
    
    CLLocationCoordinate2D cood = [loc coordinate];
    
    MapPoint *mp=[[MapPoint alloc] initWithCoordinate:cood title:@"Nuevo Punto"];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cood, 10, 10);
    
    [_worldView setRegion:region animated:YES];
    [_worldView addAnnotation:mp];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSArray * location = [searchBar.text componentsSeparatedByString:@","];
    if (location.count >= 2)
    {
    CLLocation * LocationAtual = [[CLLocation alloc] initWithLatitude:[ [location objectAtIndex:0] floatValue] longitude:[[location objectAtIndex:1] floatValue]];
    
    [self findLocation:LocationAtual];
    }
}
@end

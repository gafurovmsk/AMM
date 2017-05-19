//
//  AMMMapViewController.m
//  ATMMachineMap
//
//  Created by Nik on 16.05.17.
//  Copyright © 2017 Gafurov. All rights reserved.
//

#import "AMMMapViewController.h"
#import "ATMMachine.h"
@import MapKit;

const CLLocationDistance regionRadius = 8000;

@interface AMMMapViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) MKMapView *mapView;
@end

@implementation AMMMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.view.backgroundColor = UIColor.whiteColor;
  
  self.mapView = [MKMapView new];
  self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:self.mapView];
  self.mapView.delegate = self;
  
  
  self.locationManager = [CLLocationManager new];
  self.locationManager.delegate = self;
  

  if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
    [self.locationManager requestAlwaysAuthorization];
  } else {
    [self.locationManager requestWhenInUseAuthorization];
  }

  self.mapView.showsUserLocation = YES;
  [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];

  
  CLLocation *currentLocation = [self.locationManager location];
  
   CLLocation *initialLocation = [[CLLocation alloc]initWithLatitude: 21.282778 longitude:-157.829444];

  ATMMachine *currentAnnot = [[ATMMachine alloc]initWithTitle:@"I'm here!" location: @"dunno location" bank:@"dunno bank" andCoords:currentLocation.coordinate];
 
  // adding the annotation(s)
 // [self.mapView addAnnotation:currentAnnot];
  
 
  // seting current region. map does not move without this
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, regionRadius * 2, regionRadius * 2)];
  
  
  
  
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id ) annotation{
  
 // need to add  checking input - annotation varible class
  // checking of existing dequeued view for annotation
  
  MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
  annView.pinTintColor = [UIColor blueColor];
  annView.animatesDrop=TRUE;
  annView.canShowCallout = YES;
  annView.calloutOffset = CGPointMake(-5, 5);
  return annView;
  
}


@end





//UIEdgeInsets edges = UIEdgeInsetsMake(20, 0, 0, 0);
//[self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
//  make.edges.equalTo(self.view).with.insets(edges);
//}];

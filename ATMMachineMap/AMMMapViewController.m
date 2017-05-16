//
//  AMMMapViewController.m
//  ATMMachineMap
//
//  Created by Nik on 16.05.17.
//  Copyright © 2017 Gafurov. All rights reserved.
//

#import "AMMMapViewController.h"
#import "ATMMachine.h"
@import Masonry;
@import MapKit;

@interface AMMMapViewController () <MKMapViewDelegate>
@property (nonatomic,strong) MKMapView *mapView;
@end

@implementation AMMMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.view.backgroundColor = UIColor.whiteColor;
  
  self.mapView = [MKMapView new];
  //self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:self.mapView];
  UIEdgeInsets edges = UIEdgeInsetsMake(20, 0, 0, 0);
  [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view).with.insets(edges);
  }];
  
  self.mapView.delegate = self;
  
 // self.mapView.showsUserLocation = YES;
  [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
  
  
  CLLocation *initialLocation = [[CLLocation alloc]initWithLatitude: 21.282778 longitude:-157.829444];
  CLLocationDistance regionRagidus = 5000;

  ATMMachine *annot = [[ATMMachine alloc]initWithTitle:@"Some title" location:@"Russia" bank:@"Russian Bank" andCoords:initialLocation.coordinate];
 
  // adding the annotation(s)
  [self.mapView addAnnotation:annot];
  
 
  // seting current region. map does not move without this
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRagidus * 2, regionRagidus * 2)];
  
  
  
  
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

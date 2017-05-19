//
//  AMMMapViewController.m
//  ATMMachineMap
//
//  Created by Nik on 16.05.17.
//  Copyright © 2017 Gafurov. All rights reserved.
//

#import "AMMMapViewController.h"
#import "ATMMachine.h"
#import "APIManager.h"
@import MapKit;
@import GooglePlaces;

const CLLocationDistance regionRadius = 8000;

@interface AMMMapViewController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic,strong) MKMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) GMSPlacesClient *placesClient;
@property (nonatomic,strong) NSString *nameText;
@property (nonatomic,strong) NSString *addressText;
@property (nonatomic,strong) APIManager *apiManager;
@property (nonatomic,strong) NSArray<ATMMachine*>* list;

@end

@implementation AMMMapViewController



- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = UIColor.whiteColor;
  
  [self addingMap];
  [self currentLocation];
  
  self.mapView.showsUserLocation = YES;
  [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
  
  self.apiManager = [APIManager new];
  
  self.list = [NSArray new];
  
  // adding the annotation(s)
  //[self.mapView addAnnotation:currentAnnot];
  
}

-(void)addingMap {
  self.mapView = [MKMapView new];
  self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:self.mapView];
  self.mapView.delegate = self;
}

-(void)currentLocation{
  self.locationManager = [CLLocationManager new];
  self.locationManager.delegate = self;
  self.locationManager.distanceFilter = kCLDistanceFilterNone;
  self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
  
  if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
    [self.locationManager requestAlwaysAuthorization];
  } else {
    [self.locationManager requestWhenInUseAuthorization];
  }
  
  [self.locationManager startUpdatingLocation];
  
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  
  self.list = [self.apiManager shareListOfATMMachines:[locations objectAtIndex:0] andRadius:regionRadius];
  
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
  
  //   self.placesClient = [GMSPlacesClient sharedClient];
  //   [self getCurrentPlaceOfUser];
}

-(void)getCurrentPlaceOfUser {
  
  [_placesClient currentPlaceWithCallback:^(GMSPlaceLikelihoodList *placeLikelihoodList, NSError *error){
    if (error != nil) {
      NSLog(@"Pick Place error %@", [error localizedDescription]);
      return;
    }
    
    self.nameText = @"No current place";
    self.addressText = @"";
    
    if (placeLikelihoodList != nil) {
      GMSPlace *place = [[[placeLikelihoodList likelihoods] firstObject] place];
      if (place != nil) {
        self.nameText = place.name;
        self.addressText = [[place.formattedAddress componentsSeparatedByString:@", "]
                            componentsJoinedByString:@"\n"];
      }
    }
  }];
  
}

@end

//UIEdgeInsets edges = UIEdgeInsetsMake(20, 0, 0, 0);
//[self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
//  make.edges.equalTo(self.view).with.insets(edges);
//}];

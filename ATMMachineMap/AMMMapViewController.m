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
@import GooglePlaces;

<<<<<<< HEAD
const CLLocationDistance regionRadius = 8000;

@interface AMMMapViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *locationManager;
=======
@interface AMMMapViewController () <MKMapViewDelegate,CLLocationManagerDelegate>
>>>>>>> d45e017f7c08b321a3104f36d6b643a472598e1f
@property (nonatomic,strong) MKMapView *mapView;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) GMSPlacesClient *placesClient;
@property (nonatomic,strong) NSString *nameText;
@property (nonatomic,strong) NSString *addressText;

@end

@implementation AMMMapViewController



- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD
  
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
  
=======

    self.view.backgroundColor = UIColor.whiteColor;
    
    self.mapView = [MKMapView new];
    //self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mapView];
    UIEdgeInsets edges = UIEdgeInsetsMake(20, 0, 0, 0);
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(edges);
    }];
    
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
    
    
 //   self.placesClient = [GMSPlacesClient sharedClient];
 //   [self getCurrentPlaceOfUser];
 
    
    //CLLocationCoordinate2D userLocation = [[[self.mapView userLocation] location] coordinate];
    CLLocation *initialLocation = [[CLLocation alloc]initWithLatitude: 21.282778 longitude:-157.829444];
    //CLLocationDistance regionRagidus = 5000;
    ATMMachine *annot = [[ATMMachine alloc]initWithTitle:@"Some title" location:@"Russia" bank:@"Russian Bank" andCoords:initialLocation.coordinate];
    
    // adding the annotation(s)
    
   // [self.mapView addAnnotation: ];
   [self.mapView addAnnotation:annot];
    
    
    // seting current region. map does not move without this
    //[self.mapView setRegion:MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, regionRagidus * 2, regionRagidus * 2)];
    
    
    
    
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

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id ) annotation{
    
    // need to add  checking input - annotation varible class
    // checking of existing dequeued view for annotation
    
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
    annView.pinTintColor = [UIColor blueColor];
    annView.animatesDrop=TRUE;
    annView.canShowCallout = YES;
    annView.calloutOffset = CGPointMake(-5, 5);
    
    return annView;
>>>>>>> d45e017f7c08b321a3104f36d6b643a472598e1f
}


@end





//UIEdgeInsets edges = UIEdgeInsetsMake(20, 0, 0, 0);
//[self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
//  make.edges.equalTo(self.view).with.insets(edges);
//}];

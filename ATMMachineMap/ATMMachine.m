//
//  ATMMachine.m
//  ATMMachineMap
//
//  Created by Nik on 16.05.17.
//  Copyright © 2017 Gafurov. All rights reserved.
//

#import "ATMMachine.h"
@import MapKit;

@interface ATMMachine () <MKAnnotation>

@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle; // location
@property (nonatomic,strong) NSString * bank;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end

@implementation ATMMachine

-(instancetype)initWithTitle:(NSString*)title location:(NSString *)location bank:(NSString *)bank andCoords:(CLLocationCoordinate2D) coords{
  
  self = [super init];
  if (!self) return nil;
  
  _title = title;
  _subtitle = location;
  _bank = bank;
  _coordinate = coords;
  return self;
}



@end

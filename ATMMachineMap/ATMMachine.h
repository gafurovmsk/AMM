//
//  ATMMachine.h
//  ATMMachineMap
//
//  Created by Nik on 16.05.17.
//  Copyright © 2017 Gafurov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface ATMMachine : NSObject

-(instancetype)initWithTitle:(NSString*)title location:(NSString *)location bank:(NSString *)bank andCoords:(CLLocationCoordinate2D)coords;

@end

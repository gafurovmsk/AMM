//
//  APIManager.h
//  ATMMachineMap
//
//  Created by Nik on 16.05.17.
//  Copyright © 2017 Gafurov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;
@class ATMMachine;

@interface APIManager : NSObject

-(NSArray<ATMMachine *> *)shareListOfATMMachines:(CLLocation*)location andRadius:(double) radius;



@end

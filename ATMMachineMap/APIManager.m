//
//  APIManager.m
//  ATMMachineMap
//
//  Created by Nik on 16.05.17.
//  Copyright © 2017 Gafurov. All rights reserved.
//

#import "APIManager.h"
#import "ATMMachine.h"
@import AFNetworking;


NSString * baseURLString = @"https://maps.googleapis.com/maps/api/place/nearbysearch/json?type=atm&key=AIzaSyB7lNwiN2oLUrzPvf62ZuWbif3_kUM3Mbo";


@interface APIManager ()

@property (nonatomic,strong) NSArray<ATMMachine*>* atmMachineList;
//@property (nonatomic,strong) NSString *baseURLString;

@end

@implementation APIManager

-(NSArray<ATMMachine *> *)shareListOfATMMachines:(CLLocation*)location andRadius:(double) radius{
  
  self.atmMachineList = [NSArray new];
  
  
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
  AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
  
  NSString *url = [self makeStringForRequest:location andRadius:radius];
  
  [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    NSLog(@"haha");
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    NSLog(@"too bad");
  }];
  
  
  
  
  return self.atmMachineList;
  
}


-(NSString *)makeStringForRequest:(CLLocation *)location andRadius:(double) radius{
  
  int rad = round(radius);
  
  NSString *currentRequestString = [NSString stringWithFormat:@"%@&radius=%d&location=%f,%f",baseURLString,rad,location.coordinate.latitude,location.coordinate.longitude];
  
  return currentRequestString;
  
}


//NSURLSessionDownloadTask *downloadTask = [manager
 //                                         downloadTaskWithRequest:request
 //                                         progress:nil
 //                                         destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, //NSURLResponse * _Nonnull response){
  //                                          NSLog(@"responsed object:::::: n/ %@ ",response);
  //                                          return targetPath;
  //                                        }completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
//                                            NSLog(@"loh loh loh %@",error.description);
//                                          }];
//[downloadTask resume];




@end

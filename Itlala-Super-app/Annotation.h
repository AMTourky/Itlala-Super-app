//
//  Annotation.h
//  Shoft_0.1
//
//  Created by Abdelhameed Tourky on 10/31/12.
//  Copyright (c) 2012 ISS Holding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic, readwrite, assign) CLLocationCoordinate2D cord;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, assign) int category;
@property (nonatomic, retain) NSDictionary *report;
@property (nonatomic, assign) int index;

@end

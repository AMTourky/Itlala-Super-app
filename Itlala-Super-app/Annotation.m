//
//  Annotation.m
//  Shoft_0.1
//
//  Created by Abdelhameed Tourky on 10/31/12.
//  Copyright (c) 2012 ISS Holding. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

@synthesize cord = _cord;
@synthesize title = _title;

- (CLLocationCoordinate2D)coordinate
{
//    CLLocationCoordinate2D cord = CLLocationCoordinate2DMake(12.2, 23.1);
//    coordinate.latitude = [self.latitude doubleValue];
//    coordinate.longitude = [self.longitude doubleValue];
    return _cord;
}
- (NSString *)title
{
    return _title;
}
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    NSLog(@"draggable");
    _cord = newCoordinate;
}
// optional
//- (NSString *)subtitle
//{
//    return _date;
//}

//- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
//{
//    NSLog(@"draggable");
//    _cord = newCoordinate;
//}

@end

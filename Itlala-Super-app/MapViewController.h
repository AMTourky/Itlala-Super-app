//
//  MapViewController.h
//  Itlala-Super-app
//
//  Created by Abdelhameed Tourky on 9/27/13.
//  Copyright (c) 2013 AMTourky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "Employee.h"
#import "UIImageView+UIImageView_LazyLoad.h"
@interface MapViewController : UIViewController

@property (nonatomic, strong) PFGeoPoint *location;
@property (nonatomic, strong) Employee *employee;
@property (nonatomic, strong) IBOutlet MKMapView * mapView;
@property (nonatomic, strong) IBOutlet UIImageView * imageView;
@property (nonatomic, strong) IBOutlet UITextField * fullNameField;
@property (nonatomic, strong) IBOutlet UITextField * emailField;

@end

//
//  MapViewController.m
//  Itlala-Super-app
//
//  Created by Abdelhameed Tourky on 9/27/13.
//  Copyright (c) 2013 AMTourky. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"map point: %f", self.location.latitude);
    Annotation *annot = [[Annotation alloc] init];
    annot.coordinate = CLLocationCoordinate2DMake(self.location.longitude, self.location.latitude);
    [self.mapView addAnnotation:annot];
    
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(self.location.longitude, self.location.latitude) animated:YES];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(self.location.longitude, self.location.latitude), 10000, 10000);
    [self.mapView setRegion:viewRegion animated:YES];
    
    
    
    self.fullNameField.text = self.employee.fullName;
    self.emailField.text = self.employee.email;
    [self.imageView loadImageFromFile:self.employee.imageFile];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

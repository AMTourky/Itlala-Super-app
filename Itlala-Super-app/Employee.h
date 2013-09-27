//
//  Employee.h
//  Itlala-Super-app
//
//  Created by Abdelhameed Tourky on 9/27/13.
//  Copyright (c) 2013 AMTourky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Employee : NSObject

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) PFGeoPoint *location;
@property (nonatomic, strong) PFFile *imageFile;

@end

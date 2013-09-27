//
//  UIImageView+UIImageView_LazyLoad.h
//  Shoft_0.1
//
//  Created by Abdelhameed Tourky on 11/13/12.
//  Copyright (c) 2012 ISS Holding. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Parse/Parse.h>

@interface UIImageView (UIImageView_LazyLoad)


-(void) loadImageFromFile:(PFFile*)file;

@end

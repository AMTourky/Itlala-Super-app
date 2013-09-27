//
//  HomeViewController.h
//  Itlala-Super-app
//
//  Created by Abdelhameed Tourky on 9/27/13.
//  Copyright (c) 2013 AMTourky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "UIImageView+UIImageView_LazyLoad.h"
#import "MapViewController.h"

@interface HomeViewController : UITableViewController

@property (nonatomic, strong) NSArray *employees;

@end

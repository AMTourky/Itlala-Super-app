//
//  LoginViewController.h
//  Itlala-Super-app
//
//  Created by Abdelhameed Tourky on 9/27/13.
//  Copyright (c) 2013 AMTourky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import <Parse/Parse.h>
#import "Employee.h"
#import "Reachability.h"

@interface LoginViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationBarDelegate>


@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *logRegSwitcher;
@property (nonatomic, strong) IBOutlet UITextField *fullNameField;
@property (nonatomic, strong) IBOutlet UITextField *userNameField;
@property (nonatomic, strong) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) IBOutlet UITextField *emailField;
@property (nonatomic, strong) IBOutlet UIButton *picButton;
@property (nonatomic, strong) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, assign) BOOL isLocating;
@property (nonatomic, strong) Employee *employee;
@property (nonatomic, strong) NSMutableArray *employeesArray;

-(IBAction) go:(id)sender;
-(IBAction) logRegSwitch:(id)sender;
-(void) proceed;
-(IBAction) imageSelected:(id)sender;
-(void) messageWithTitle:(NSString*) title message:(NSString*)message;

@end

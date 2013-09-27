//
//  LoginViewController.m
//  Itlala-Super-app
//
//  Created by Abdelhameed Tourky on 9/27/13.
//  Copyright (c) 2013 AMTourky. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(void) messageWithTitle:(NSString*) title message:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(IBAction) go:(id)sender
{
    if([Reachability checkConnectionIsWorking])
    {
        NSLog(@"goo");
        if(self.isLogin)
        {
            NSLog(@"login");
            //        just check don't add
            PFQuery *query = [PFQuery queryWithClassName:@"Employee"];
            [query whereKey:@"userName" equalTo:self.userNameField.text];
            [query whereKey:@"password" equalTo:self.passwordField.text];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error) {
                    // The find succeeded.
                    NSLog(@"Successfully retrieved %d objects.", objects.count);
                    // Do something with the found objects
                    //                for (PFObject *object in objects) {
                    //                    NSLog(@"got user: %@", [object objectForKey:@"userName"]);
                    //                }
                    if(objects.count >= 1)
                        [self proceed];
                    else
                    {
                        [self messageWithTitle:@"sorry!!" message:@"user name or password is/are incorrect"];
                    }
                } else {
                    // Log details of the failure
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
        else
        {
            //        add new emplyee
            
            NSLog(@"Register");
            
            self.employee.fullName = self.fullNameField.text;
            self.employee.userName = self.userNameField.text;
            self.employee.password = self.passwordField.text;
            self.employee.email = self.emailField.text;
            
            NSData *imageData = UIImagePNGRepresentation(self.imgView.image);
            PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
            self.employee.imageFile = imageFile;
            
            if(self.employee.location)
            {
                NSLog(@"save user");
                PFObject *empObj = [PFObject objectWithClassName:@"Employee"];
                [empObj setObject:self.employee.fullName forKey:@"fullName"];
                [empObj setObject:self.employee.userName forKey:@"userName"];
                [empObj setObject:self.employee.password forKey:@"password"];
                [empObj setObject:self.employee.email forKey:@"email"];
                [empObj setObject:self.employee.location forKey:@"location"];
                [empObj setObject:self.employee.imageFile forKey:@"imageFile"];
                PFQuery *query = [PFQuery queryWithClassName:@"Employee"];
                [query whereKey:@"userName" equalTo:self.userNameField.text];
                [query whereKey:@"password" equalTo:self.passwordField.text];
                [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    if (!error) {
                        // The find succeeded.
                        NSLog(@"Successfully retrieved %d objects.", objects.count);
                        // Do something with the found objects
                        //                for (PFObject *object in objects) {
                        //                    NSLog(@"got user: %@", [object objectForKey:@"userName"]);
                        //                }
                        if(objects.count == 0)
                        {
                            [empObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                if(!error)
                                {
                                    [self proceed];
                                }
                            }];
                        }
                        else
                        {
                            [self messageWithTitle:@"sorry!!" message:@"user name already exists"];
                        }
                    } else {
                        // Log details of the failure
                        NSLog(@"Error: %@ %@", error, [error userInfo]);
                    }
                }];
                
            }
        }
    }
}

-(void) proceed
{
    //    get the emplyees then navigate
    PFQuery *query = [PFQuery queryWithClassName:@"Employee"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d objects.", objects.count);
            // Do something with the found objects
            self.employeesArray = [[NSMutableArray alloc] init];
            for (PFObject *object in objects) {
                Employee *emp = [[Employee alloc] init];
                emp.fullName = [object objectForKey:@"fullName"];
                emp.userName = [object objectForKey:@"userName"];
                emp.email = [object objectForKey:@"email"];
                emp.location = [object objectForKey:@"location"];
                emp.imageFile = [object objectForKey:@"imageFile"];
                [self.employeesArray addObject:emp];
                NSLog(@"got location: lat: %f and long %f", emp.location.latitude, emp.location.longitude );
            }
            [self performSegueWithIdentifier:@"LOGIN_SEGUE" sender:self];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    //
    //    [self performSegueWithIdentifier:@"LOGIN_SEGUE" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //populate emplyees
    HomeViewController *homeVC = segue.destinationViewController;
    homeVC.employees = self.employeesArray;
    
}
-(IBAction) logRegSwitch:(id)sender
{
    NSLog(@"switch");
    if([self.logRegSwitcher.title isEqualToString:@"Register"])
    {
        //login stuff
        self.logRegSwitcher.title = @"Login";
        self.fullNameField.hidden = NO;
        self.emailField.hidden = NO;
        self.picButton.hidden = NO;
        self.imgView.hidden = NO;
        self.addressLabel.hidden = NO;
        self.isLogin = NO;
        
        if (!self.isLocating && !self.employee.location)
        {
            [self.indicator startAnimating];
            self.isLocating = YES;
            NSLog(@"location will start");
            [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
                self.isLocating = NO;
                if (!error) {
                    NSLog(@"location is: %f, %f", geoPoint.latitude, geoPoint.longitude);
                    self.addressLabel.text = @"located successfuly";
                    [self.indicator stopAnimating];
                    self.employee.location = geoPoint;
                }
                else
                {
                    NSLog(@"error is: %@",[error description]);
                }
            }];
        }
    }
    else
    {
        //register stuff
        self.logRegSwitcher.title = @"Register";
        self.fullNameField.hidden = YES;
        self.emailField.hidden = YES;
        self.picButton.hidden = YES;
        self.imgView.hidden = YES;
        self.addressLabel.hidden = YES;
        self.isLogin = YES;
        [self.indicator stopAnimating];
        
    }
}

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
    self.isLogin = YES;
    self.isLocating = NO;
    self.employee = [[Employee alloc] init];
    self.employeesArray = [[NSMutableArray alloc] initWithCapacity:10];
	// Do any additional setup after loading the view.
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"didFinishPickingMediaWithInfo: %@",[info description]);
    [self dismissModalViewControllerAnimated:YES];
    self.imgView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"imagePickerControllerDidCancel");
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction) imageSelected:(id)sender
{
    NSLog(@"imageSelected");
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"choose image source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"camera", @"gallery", nil ];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"action index: %i",buttonIndex);
    if(buttonIndex == 0)
    {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePickerController.delegate = self;
        self.imagePickerController.showsCameraControls = YES;
        [self presentModalViewController:_imagePickerController animated:YES];
    }
    if(buttonIndex == 1)
    {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.delegate = self;
        [self presentModalViewController:self.imagePickerController animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  UIImageView+UIImageView_LazyLoad.m
//  Shoft_0.1
//
//  Created by Abdelhameed Tourky on 11/13/12.
//  Copyright (c) 2012 ISS Holding. All rights reserved.
//

#import "UIImageView+UIImageView_LazyLoad.h"

@implementation UIImageView (UIImageView_LazyLoad)



-(void) loadImageFromFile:(PFFile*)file
{
//    NSLog(@"lazy load image from file");
    [file getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
//        NSLog(@"loaded ");
        if (!error) {
//            NSLog(@"      successfully");
            UIImage *image = [UIImage imageWithData:imageData];
            if(image)
                [self setImage:image];
            
        }
    }];
    
}
//- (void) connectionDidFinishLoading:(NSURLConnection *)connection withResult:(NSString*)res andData:(NSData*)data fromURL:(NSString*)url
//{
//    NSLog(@"LazyLoad: DidFinishLoading");
//    UIImage * img = [UIImage imageWithData:data];
//    UIImage * bigImg = [UIImage imageWithData:data];
//    NSLog(@"img height is %f and width is %f",img.size.height, img.size.width);
//    img = [ListMapViewController scale:img toSize:CGSizeMake(50.0f, 50.0f)];
//    bigImg = [ListMapViewController scale:bigImg toSize:CGSizeMake(280.0f, 160.0f)];
//    NSLog(@"img now height is %f and width is %f",img.size.height, img.size.width);
//    NSLog(@"got the image and will cach it with key: %@",[NSString stringWithFormat:@"%i",[self tag]]);
//    if(img != nil)
//    {
//        [ListMapViewController addImageToDictionary:img withKey:[NSString stringWithFormat:@"%i",[self tag]]];
//        [ListMapViewController addImageToDictionary:bigImg withKey:[NSString stringWithFormat:@"big%i",[self tag]]];
//    }
//    [self setImage:img];
////    [img release];
////    [bigImg release];
//}


@end

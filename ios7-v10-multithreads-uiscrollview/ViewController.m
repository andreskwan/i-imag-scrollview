//
//  ViewController.m
//  ios7-v10-multithreads-uiscrollview
//
//  Created by Andres Kwan on 11/25/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
        ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.apple.com/v/iphone-5s/gallery/a/images/download/%@.jpg",segue.identifier]];
        ivc.title = segue.identifier;
    }
}
 
@end

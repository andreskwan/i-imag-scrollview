//
//  ImageViewController.m
//  ios7-v10-multithreads-uiscrollview
//
//  Created by Andres Kwan on 11/25/14.
//  Copyright (c) 2014 Kwan Castle. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *imageView;
//image where being display
@property (nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ImageViewController

#pragma mark - Properties
-(UIImageView *)imageView
{
    if (!_imageView) _imageView = [[UIImageView alloc]init];
    return _imageView;
}

-(void)setImageURL:(NSURL *)imageURL
{
    _imageURL = imageURL;
    //if this is URL in the internet is going to block the main queue!
    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
}

//we dont use a instance variable to store it!
//don't need to be synthesize
- (UIImage *) image
{
    return self.imageView.image;
}


- (void)setImage:(UIImage *)image
{
    //there are other things to initialize an image
    //
    self.imageView.image = image;
    [self.imageView sizeToFit];
    //any time we change the image we need to set the content size
    //if self.image is nil, this might cause problems
    self.scrollView.contentSize =
        self.image ? self.image.size : CGSizeZero;

}

//could be set after setImage!!!
//prepare for segue
//is call before the outlets are set!!!
- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    _scrollView.minimumZoomScale = 0.1;
    _scrollView.maximumZoomScale = 1.0;
    _scrollView.delegate = self;
    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
}

#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
#pragma mark - Life Cycle methods
-(void)viewDidLoad
{
    [super viewDidLoad];
    //but this means that we need
    //self.imageView lazy instantiated
    //if this variable at this stage is empty
    [self.scrollView  addSubview:self.imageView];
}
@end

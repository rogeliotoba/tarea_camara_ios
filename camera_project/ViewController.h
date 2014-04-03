//
//  ViewController.h
//  camera_project
//
//  Created by Rogelio Torres on 01/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MobileCoreServices/MobileCoreServices.h"


@interface ViewController : UIViewController <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *buttonNewPhoto;
@property (weak, nonatomic) IBOutlet UIButton *buttonPickPhoto;
@property (weak, nonatomic) IBOutlet UIButton *buttonPickPhotoPressed;

@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;
@property (strong, nonatomic) NSString *str_lastChosenMediaType;
@property (strong, nonatomic) UIImage *img_CurrentImage;
@property (strong, nonatomic) NSURL *url_moviewURL;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
- (IBAction)btnSharePressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;

- (IBAction)buttonNewPhotoPressed:(id)sender;
- (IBAction)buttonPickPhotoPressed2:(id)sender;

@end

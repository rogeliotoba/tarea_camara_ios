//
//  ViewController.m
//  camera_project
//
//  Created by Rogelio Torres on 01/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import "ViewController.h"
UIImage *chosenImage;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.imageView.contentMode = UIViewContentModeScaleToFill;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSharePressed:(id)sender {
    NSString                    *initalTextString;
    NSArray                     *activityItems;
    UIImage                     *imageScreen;
    UIActivityViewController    *activityViewController;
    
    imageScreen = self.imageView.image;
    initalTextString = @"Hola desde mi clase de iOS en la UAG =)";
    
    activityItems = @[imageScreen, initalTextString];
    
    //Init activity view controller
    activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    activityViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    
    
    [self presentViewController:activityViewController animated:YES completion:nil];
}

- (IBAction)buttonNewPhotoPressed:(id)sender {
    [self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}
- (IBAction)buttonPickPhotoPressed2:(id)sender {
    [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark UIImagePickerController delegate methods
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.str_lastChosenMediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([self.str_lastChosenMediaType isEqual:(NSString *) kUTTypeImage])
    {
        self.imageView.image = [info objectForKey:UIImagePickerControllerEditedImage];
        
        if(self.img2.image!=NULL) self.img3.image=self.img2.image;
        if(self.img1.image!=NULL) self.img2.image = self.img1.image;
        
        self.img1.image = [info objectForKey:UIImagePickerControllerEditedImage];
        
        
        chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
    }
    
    else if ([self.str_lastChosenMediaType isEqual:(NSString *) kUTTypeMovie])
    {
        self.url_moviewURL = [info objectForKey:UIImagePickerControllerMediaURL];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark UIImagePickerController delegate methods

#pragma mark -

-(void)getMediaFromSource: (UIImagePickerControllerSourceType)sourceType
{
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.mediaTypes = mediaTypes;
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)updateDisplay
{
    if([self.str_lastChosenMediaType isEqual:(NSString *) kUTTypeImage])
    {
        self.imageView.hidden = NO;
        self.moviePlayerController.view.hidden = YES;
    }
    else if ([self.str_lastChosenMediaType isEqual:(NSString *) kUTTypeMovie])
    {
        [self.moviePlayerController.view removeFromSuperview];
        self.moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:self.url_moviewURL];
        self.moviePlayerController.view.frame = self.imageView.frame;
        self.moviePlayerController.view.clipsToBounds = YES;
        self.imageView.hidden = YES;
    }
}

@end

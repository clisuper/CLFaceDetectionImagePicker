//
//  ViewController.m
//  CLFaceDetectionImagePicker
//
//  Created by Caesar on 10/12/2014.
//  Copyright (c) 2014 Caesar. All rights reserved.
//

#import "ViewController.h"
#import "CLFaceDetectionImagePickerViewController.h"

@interface ViewController ()<CLFaceDetectionImagePickerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *statusInfo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) CLFaceDetectionImagePickerViewController *imagePickerViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setImageView:(UIImageView *)imageView
{
    _imageView = imageView;
    
}


//Logic start
-(CLFaceDetectionImagePickerViewController *)imagePickerViewController
{
    if(!_imagePickerViewController){
        _imagePickerViewController = [CLFaceDetectionImagePickerViewController new];
        _imagePickerViewController.delegate = self;
    }
    return _imagePickerViewController;
}
- (IBAction)didTriggerFaceDetectionImagePicker:(id)sender {
    
    [self presentViewController:self.imagePickerViewController animated:YES completion:nil];
}


#pragma CLFaceDetectionImagePickerDelegate
// Optional!!! Set The Face Detection Behavior Attributes
-(NSDictionary *)faceDetectionBehaviorAttributes
{
    return @{
             CLFaceDetectionTimes : @2,                 //Total times for capture clear detected face images to prevent user shake their heads in purpose
             CLFaceDetectionSquareImageName : @"CameraSqaure", //Different FaceDetection Square Image. try to use "squarePNG" for different image
             CLTotalDetectCountDownSecond : @5,        //Total waiting time, after this value, the picker will auto closed no matter it get face detected or not.
             CLCameraPosition : [NSNumber numberWithInteger:CLCaptureDevicePositionFront] //Which camera try to use, Front or back.  CLCaptureDevicePositionBack or CLCaptureDevicePositionFront
             };
}

//After getting data callback
-(void)CLFaceDetectionImagePickerDidDismiss:(NSData *)data blnSuccess:(BOOL)blnSuccess
{
    self.statusInfo.text = (blnSuccess)?@"Success":@"Failed";
    
    if(data){
        self.imageView.image = [UIImage imageWithData:data];
        self.imageView.hidden = NO;
    }else{
        self.imageView.hidden = YES;
    }
}

@end

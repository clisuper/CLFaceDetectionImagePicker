//
//  ViewController.m
//  CLFaceDetectionImagePicker
//
//  Created by Caesar on 10/12/2014.
//  Copyright (c) 2014 Caesar. All rights reserved.
//

#import "ViewController.h"
#import "CLFaceDetectionImagePickerViewController.h"

@interface ViewController ()<DPLiveImagePickerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *statusInfo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) DPLiveImagePickerViewController *imagePickerViewController;
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

-(DPLiveImagePickerViewController *)imagePickerViewController
{
    if(!_imagePickerViewController){
        _imagePickerViewController = [[UIStoryboard storyboardWithName:@"DPLiveImage" bundle:nil] instantiateViewControllerWithIdentifier:@"DPLiveImagePickerViewController"];
        _imagePickerViewController.delegate = self;
    }
    return _imagePickerViewController;
}
- (IBAction)didTriggerFaceDetectionImagePicker:(id)sender {
    
    [self presentViewController:self.imagePickerViewController animated:YES completion:nil];
}


#pragma DPLiveImagePickerDelegate
-(void)DPLiveImagePickerDidDismiss:(NSData *)data blnSuccess:(BOOL)blnSuccess
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

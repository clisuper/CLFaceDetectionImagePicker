# CLFaceDetectionImagePicker (NOT OPENCV!!!)

CLFaceDetectionImagePicker is a clean and so-easy-to-use ImagePicker meant to do live face detection. 
It will draw a square if any face is detected in the camera as below and take photo automatically if the face detection is passed.


![alt tag](https://github.com/clisuper/CLFaceDetectionImagePicker/blob/master/screenshot.png)

## Installation
* Drag the `CLFaceDetectionImagePickerSourceCode` folder into your project.


## Demo Usage

**Please download all of the files in the repo and run it directly to have a look.**

**Use CLFaceDetectionImagePicker wisely! Lights in front of the camera will affect the accuracy of face detection.**


## Initialize 
Using CLFaceDetectionImagePicker in your app will usually look as simple as this :


```objective-c

_imagePickerViewController = [CLFaceDetectionImagePickerViewController new];
_imagePickerViewController.delegate = self;

//Show the ImagePicker
[self presentViewController:self.imagePickerViewController animated:YES completion:nil];

```

## Delegate

After the imagePicker take photo or dismiss without detecting any face, it will fire CLFaceDetectionImagePickerDidDismiss delegate function as below which you need to apply

```objective-c
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
```

## Customisation

**Please be aware customisation delegate function is optional, if u do not apply it, it will just fire the default value.

Using CLFaceDetectionImagePickerDelegate to customise the behaviour

Following customisation key is allowed

-CLTotalDetectCountDownSecond;    //Total length of waiting period for face detection - Default: 10

-CLFaceDetectionSquareImageName;  //Image name for the face detection square image    - Default: CameraSquare

-CLFaceDetectionTimes;            //Continually detecting face times, this will be helpful to make sure the people are not shaking his head by purpose       - Default: 5

-CLCameraPosition;                //Choose which camera you want to use, CLCaptureDevicePositionBack or CLCaptureDevicePositionFront  -Default: CLCaptureDevicePositionFront



You need to fire below delegate function to apply your customisation
```objective-c

// Optional!!! Set The Face Detection Behavior Attributes
-(NSDictionary *)faceDetectionBehaviorAttributes
{
    return @{
        CLFaceDetectionTimes : @10,                 //Total times for capture clear detected face images to prevent user shake their heads in purpose
        CLFaceDetectionSquareImageName : @"CameraSqaure", //Different FaceDetection Square Image. try to use "squarePNG" for different image
        CLTotalDetectCountDownSecond : @12,        //Total waiting time, after this value, the picker will auto closed no matter it get face detected or not.
        CLCameraPosition : [NSNumber numberWithInteger:CLCaptureDevicePositionFront] //Which camera try to use, Front or back.  CLCaptureDevicePositionBack or CLCaptureDevicePositionFront
    };
}

```



## Credits

CLFaceDetectionImagePicker is brought to you by [Caesar Li]
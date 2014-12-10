//
//  CLFaceDetectionViewController.h
//
//  Created by caesar on 26/02/14.
//

#import <UIKit/UIKit.h>

// Keys for customize the pickerView behavior
extern NSString *const CLTotalDetectCountDownSecond;    //Total length of waiting period for face detection - Default: 20
extern NSString *const CLFaceDetectionSquareImageName;  //Image name for the face detection square image    - Default: CameraSquare
extern NSString *const CLFaceDetectionTimes;            //Continually detecting face times, this will be helpful to make sure the people are not shaking his head by purpose in order to give u a not-clear image       - Default: 5

@protocol CLFaceDetectionImagePickerDelegate <NSObject>

-(NSDictionary *)faceDetectionBehaviorAttributes;       //Optional Function, Set the FaceDetectionPlugin behavior attributes by using above keys

-(void)CLFaceDetectionImagePickerDidDismiss: (NSData *)data blnSuccess:(BOOL)blnSuccess; 

@end




@interface CLFaceDetectionImagePickerViewController : UIViewController

@property (nonatomic, weak) id<CLFaceDetectionImagePickerDelegate> delegate;
@end

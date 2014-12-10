//
//  CLFaceDetectionViewController.h
//
//  Created by caesar on 26/02/14.
//

#import <UIKit/UIKit.h>
@protocol CLFaceDetectionImagePickerDelegate <NSObject>
-(void)CLFaceDetectionImagePickerDidDismiss: (NSData *)data blnSuccess:(BOOL)blnSuccess;
@end
@interface CLFaceDetectionImagePickerViewController : UIViewController

@property (nonatomic, weak) id<CLFaceDetectionImagePickerDelegate> delegate;
@end

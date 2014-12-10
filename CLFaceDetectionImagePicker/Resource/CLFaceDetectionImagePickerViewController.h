//
//  CLFaceDetectionViewController.h
//
//  Created by cli on 26/02/14.
//

#import <UIKit/UIKit.h>
@protocol DPLiveImagePickerDelegate <NSObject>
-(void)DPLiveImagePickerDidDismiss: (NSData *)data blnSuccess:(BOOL)blnSuccess;
@end
@interface DPLiveImagePickerViewController : UIViewController

@property (nonatomic, weak) id<DPLiveImagePickerDelegate> delegate;
@end

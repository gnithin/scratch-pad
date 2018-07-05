#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SCPBase : NSObject

+ (NSURLSessionDataTask *)makeReqFor:(NSString *)url withResponseCallback:(void(^)(id, NSError *))callback;

@end

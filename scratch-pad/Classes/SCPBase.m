#import "SCPBase.h"
@import AFNetworking;
@import MNetJSONModeller;

@implementation SCPBase

static AFHTTPSessionManager *managerInstance;
+ (AFHTTPSessionManager *)getManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager]
                                         initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.responseSerializer.acceptableContentTypes =
        [NSSet setWithObjects:@"application/json", @"text/plain", @"image/gif", @"application/xml", @"text/xml",
         @"text/html", @"text/json", @"text/javascript", nil];
        [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        managerInstance = manager;
    });
    return managerInstance;
}


+ (NSURLSessionDataTask *)makeReqFor:(NSString *)url withResponseCallback:(void(^)(id, NSError *))callback{
    AFHTTPSessionManager *manager = [self getManager];
    NSLog(@"Making request for log - %@", url);
    return [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *jsonError;
        id parsedResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON parsing error %@", jsonError);
        }
        callback([MNJMManager toJSONStr:parsedResponse], nil);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@ %@", task, error);
        callback(nil, error);
    }];
}

@end

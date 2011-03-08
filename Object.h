#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Property.h>

@interface Object: NSObject {
    NSMutableArray* properties;
}
-(BOOL) conforms:(Protocol*)proto;
-(void) addProp:(Property*)property;
-(id) init;
@end

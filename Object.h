#import <Foundation/NSObject.h>
#import <Foundation/NSArray.h>
#import <Property.h>

@interface Object: NSObject {
    NSMutableArray* properties;
}
-(BOOL) conforms:(id)proto;
-(void) addProperty:(Property*)property;
@end

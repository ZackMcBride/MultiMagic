#import "MMState.h"

@interface MMState ()

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, assign) MCSessionState state;

@end

@implementation MMState

- (instancetype)initWithPeerID:(MCPeerID *)peerID state:(MCSessionState)state {
    self = [super init];
    if (self) {
        _peerID = peerID;
        _state = state;
    }
    return self;
}

@end

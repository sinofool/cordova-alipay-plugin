var exec = require('cordova/exec');

exports.initAppScheme = function(scheme, success, error) {
    exec(success, error, "AlipayPlugin", "initAppScheme", [scheme]);
};

exports.callAlipaySDK = function(orderStr, success, error) {
    exec(success, error, "AlipayPlugin", "callAlipaySDK", [orderStr]);
};

package com.sinofool.cordova.plugins.alipay;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

import android.app.Activity;

import com.alipay.sdk.app.PayTask;

public class AlipayPlugin extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("callAlipaySDK")) {
            final Activity activity = this.cordova.getActivity();
            final String payStr = args.getString(0);
            Runnable run = new Runnable() {
                @Override
                public void run() {
                    PayTask task = new PayTask(activity);
                    // System.out.println("PAYPAY: " + task.getVersion());
                    String pay = task.pay(payStr);
                    // System.out.println("PAYPAY: " + pay);
                }
            };
            Thread th = new Thread(run);
            th.setDaemon(true);
            th.start();
            callbackContext.success();
            return true;
        }
        callbackContext.error("Unknown action " + action);
        return false;
    }
}

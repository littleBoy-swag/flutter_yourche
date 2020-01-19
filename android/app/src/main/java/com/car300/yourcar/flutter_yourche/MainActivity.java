package com.car300.yourcar.flutter_yourche;

import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private String CHANNEL = "com.car300.yourcar";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler((methodCall, result) -> {
            switch (methodCall.method) {
                case "diaCall":
                    String phoneNum = methodCall.argument("phone_num");
                    Intent phoneIntent = new Intent(Intent.ACTION_DIAL);
                    phoneIntent.setData(Uri.parse("tel:" + phoneNum));
                    startActivity(phoneIntent);
                    result.success("OK");
                    break;
                case "rate":
                    try {
                        Uri uri = Uri.parse("market://details?id=" + getPackageName());
                        Intent rateIntent = new Intent(Intent.ACTION_VIEW, uri);
                        rateIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        startActivity(rateIntent);
                        result.success("OK");
                    } catch (Exception e) {
                        Toast.makeText(this, "您的手机未检测到应用商店，无法评分", Toast.LENGTH_SHORT).show();
                        result.success("手机未检测到应用商店，无法评分");
                    }
                    break;
                case "go2NotificationSettings":
                    try {
                        jump2NotifySettings();
                        result.success(true);
                    }catch (Exception e) {
                        result.success(false);
                    }
                    break;
                case "isNotificationEnable":

                    break;
                default:
                    result.notImplemented();
            }
        });

    }

    private void jump2NotifySettings() {
        Intent intent = new Intent();
        if (Build.VERSION.SDK_INT > Build.VERSION_CODES.N_MR1) {
            intent.setAction( "android.settings.APP_NOTIFICATION_SETTINGS");
            intent.putExtra("android.provider.extra.APP_PACKAGE", getPackageName());
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) { //21
            intent.setAction("android.settings.APP_NOTIFICATION_SETTINGS");
            intent.putExtra("app_package", getPackageName());
            intent.putExtra("app_uid", getApplicationInfo().uid);
        } else if (Build.VERSION.SDK_INT == Build.VERSION_CODES.KITKAT) { //19
            intent.setAction(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
            intent.addCategory(Intent.CATEGORY_DEFAULT);
            intent.setData(Uri.parse("package:$packageName"));
        }
        startActivity(intent);
    }

}

# Flutter ProGuard rules
# flutter build apk/ipa will automatically add the flutter proguard rules

# Stripe Android SDK rules
-keep class com.stripe.android.** { *; }
-keep class com.stripe.android.pushProvisioning.** { *; }
-keep class com.reactnativestripesdk.** { *; }
-dontwarn com.stripe.android.**
-dontwarn com.reactnativestripesdk.**

# Keep Stripe push provisioning related classes
-keep class com.stripe.android.pushProvisioning.PushProvisioningActivity
-keep class com.stripe.android.pushProvisioning.PushProvisioningActivity$* { *; }
-keep class com.stripe.android.pushProvisioning.PushProvisioningActivityStarter
-keep class com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$* { *; }
-keep class com.stripe.android.pushProvisioning.PushProvisioningEphemeralKeyProvider { *; }

# Keep generic signatures
-keepattributes InnerClasses
-keepattributes EnclosingMethod
-keepattributes Exceptions
-keepattributes LineNumberTable

# Keep Kotlin coroutines
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-keepclassmembernames class kotlinx.coroutines.DisposableHandle {
    void dispose();
}

# Keep Flutter classes
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-dontwarn io.flutter.**

# Keep Gson
-dontwarn sun.misc.**
-keep class * implements com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

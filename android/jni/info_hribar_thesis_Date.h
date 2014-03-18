/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class info_hribar_thesis_Date */

#ifndef _Included_info_hribar_thesis_Date
#define _Included_info_hribar_thesis_Date
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     info_hribar_thesis_Date
 * Method:    init
 * Signature: (III)V
 */
JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_init
  (JNIEnv *, jobject, jint, jint, jint);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    setDate
 * Signature: (III)V
 */
JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_setDate
  (JNIEnv *, jobject, jint, jint, jint);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    setYear
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_setYear
  (JNIEnv *, jobject, jint);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    setMonth
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_setMonth
  (JNIEnv *, jobject, jint);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    setDay
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_setDay
  (JNIEnv *, jobject, jint);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    getYear
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_info_hribar_thesis_Date_getYear
  (JNIEnv *, jobject);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    getMonth
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_info_hribar_thesis_Date_getMonth
  (JNIEnv *, jobject);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    getDay
 * Signature: ()I
 */
JNIEXPORT jint JNICALL Java_info_hribar_thesis_Date_getDay
  (JNIEnv *, jobject);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    addDays
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_addDays
  (JNIEnv *, jobject, jint);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    addMonths
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_addMonths
  (JNIEnv *, jobject, jint);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    addYears
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_addYears
  (JNIEnv *, jobject, jint);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    toString
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_info_hribar_thesis_Date_toString
  (JNIEnv *, jobject);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    isBefore
 * Signature: (Linfo/hribar/thesis/Date;)Z
 */
JNIEXPORT jboolean JNICALL Java_info_hribar_thesis_Date_isBefore
  (JNIEnv *, jobject, jobject);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    isAfter
 * Signature: (Linfo/hribar/thesis/Date;)Z
 */
JNIEXPORT jboolean JNICALL Java_info_hribar_thesis_Date_isAfter
  (JNIEnv *, jobject, jobject);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    isEqual
 * Signature: (Linfo/hribar/thesis/Date;)Z
 */
JNIEXPORT jboolean JNICALL Java_info_hribar_thesis_Date_isEqual
  (JNIEnv *, jobject, jobject);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    isLastDay
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_info_hribar_thesis_Date_isLastDay
  (JNIEnv *, jobject);

/*
 * Class:     info_hribar_thesis_Date
 * Method:    getWeekday
 * Signature: ()Linfo/hribar/thesis/Weekday;
 */
JNIEXPORT jobject JNICALL Java_info_hribar_thesis_Date_getWeekday
  (JNIEnv *, jobject);

#ifdef __cplusplus
}
#endif
#endif

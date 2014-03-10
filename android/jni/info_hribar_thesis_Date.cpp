#include "info_hribar_thesis_Date.h"
#include "Date.cpp"
#include "handle.h"

using namespace Thesis;

JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_init(JNIEnv *env, jobject obj, jint year, jint month, jint day) {
	Date *date = new Date(year, month, day);
	setHandle(env, obj, date);
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_setDate(JNIEnv *env, jobject obj, jint year, jint month, jint day) {
	Date *date = getHandle<Date>(env, obj);
	date->setDate(year, month, day);
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_setYear(JNIEnv *env, jobject obj, jint year) {
	Date *date = getHandle<Date>(env, obj);
	date->setYear(year);
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_setMonth(JNIEnv *env, jobject obj, jint month) {
	Date *date = getHandle<Date>(env, obj);
	date->setMonth(month);
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_setDay(JNIEnv *env, jobject obj, jint day) {
	Date *date = getHandle<Date>(env, obj);
	date->setDay(day);
}

JNIEXPORT jint JNICALL Java_info_hribar_thesis_Date_getYear(JNIEnv *env, jobject obj) {
	Date *date = getHandle<Date>(env, obj);
	return date->getYear();
}

JNIEXPORT jint JNICALL Java_info_hribar_thesis_Date_getMonth(JNIEnv *env, jobject obj) {
	Date *date = getHandle<Date>(env, obj);
	return date->getMonth();
}

JNIEXPORT jint JNICALL Java_info_hribar_thesis_Date_getDay(JNIEnv *env, jobject obj) {
	Date *date = getHandle<Date>(env, obj);
	return date->getDay();
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_addDays(JNIEnv *env, jobject obj, jint days) {
	Date *date = getHandle<Date>(env, obj);
	date->addDays(days);
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_addMonths(JNIEnv *env, jobject obj, jint months) {
	Date *date = getHandle<Date>(env, obj);
	date->addMonths(months);
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Date_addYears(JNIEnv *env, jobject obj, jint years) {
	Date *date = getHandle<Date>(env, obj);
	date->addYears(years);
}

JNIEXPORT jstring JNICALL Java_info_hribar_thesis_Date_toString(JNIEnv *env, jobject obj) {
	Date *date = getHandle<Date>(env, obj);
	return env->NewStringUTF(date->toString().c_str());
}

Date getDate(JNIEnv *env, jobject date) {
	jclass dateCls = env->GetObjectClass(date);
	jmethodID mGetYear = env->GetMethodID(dateCls, "getYear", "()I");
	jmethodID mGetMonth = env->GetMethodID(dateCls, "getMonth", "()I");
	jmethodID mGetDay = env->GetMethodID(dateCls, "getDay", "()I");
	jint year = env->CallIntMethod(date, mGetYear);
	jint month = env->CallIntMethod(date, mGetMonth);
	jint day = env->CallIntMethod(date, mGetDay);
	return Date(year, month, day);
}

JNIEXPORT jboolean JNICALL Java_info_hribar_thesis_Date_isBefore(JNIEnv *env, jobject obj, jobject compare) {
	Date *date = getHandle<Date>(env, obj);
	return date->isBefore(getDate(env, compare));
}

JNIEXPORT jboolean JNICALL Java_info_hribar_thesis_Date_isAfter(JNIEnv *env, jobject obj, jobject compare) {
	Date *date = getHandle<Date>(env, obj);
	return date->isAfter(getDate(env, compare));
}

JNIEXPORT jboolean JNICALL Java_info_hribar_thesis_Date_isEqual(JNIEnv *env, jobject obj, jobject compare) {
	Date *date = getHandle<Date>(env, obj);
	return date->isEqual(getDate(env, compare));
}

JNIEXPORT jboolean JNICALL Java_info_hribar_thesis_Date_isLastDay(JNIEnv *env, jobject obj) {
	Date *date = getHandle<Date>(env, obj);
	return date->isLastDay();
}

/*jobject
Java_info_hribar_thesis_Date_getWeekday(JNIEnv *env, jobject obj) {
	Date *date = getHandle<Date>(env, obj);
	return date->getWeekday();
}*/
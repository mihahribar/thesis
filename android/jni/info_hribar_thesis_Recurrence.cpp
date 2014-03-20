#include "info_hribar_thesis_Recurrence.h"
#include "Recurrence.cpp"
#include "Date.cpp"
#include "handle.h"

#include <string>

using namespace Thesis;

JNIEXPORT void JNICALL Java_info_hribar_thesis_Recurrence_init(JNIEnv *env, jobject obj, jobject freq, jobject start) {
	Recurrence *rec = new Recurrence(Monthly, new Date(2014,1,1));
	setHandle(env, obj, rec);
}

JNIEXPORT jobject JNICALL Java_info_hribar_thesis_Recurrence_daysInRange(JNIEnv *env, jobject obj, jobject from, jobject to) {

}

JNIEXPORT jobject JNICALL Java_info_hribar_thesis_Recurrence_getStart(JNIEnv *env, jobject obj) {

}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Recurrence_setStart(JNIEnv *env, jobject obj, jobject start) {

}

JNIEXPORT jobject JNICALL Java_info_hribar_thesis_Recurrence_getUntil(JNIEnv *env, jobject obj) {

}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Recurrence_setUntil(JNIEnv *env, jobject obj, jobject until) {

}

JNIEXPORT jobject JNICALL Java_info_hribar_thesis_Recurrence_getFrequency(JNIEnv *env, jobject obj) {

}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Recurrence_setFrequency(JNIEnv *env, jobject obj, jobject freq) {

}

JNIEXPORT jint JNICALL Java_info_hribar_thesis_Recurrence_getInterval(JNIEnv *env, jobject obj) {
	Recurrence *rec = getHandle<Recurrence>(env, obj);
	return rec->getInterval();
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Recurrence_setInterval(JNIEnv *env, jobject obj, jint interval) {
	Recurrence *rec = getHandle<Recurrence>(env, obj);
	return rec->setInterval(interval);
}

JNIEXPORT jint JNICALL Java_info_hribar_thesis_Recurrence_getCount(JNIEnv *env, jobject obj) {
	Recurrence *rec = getHandle<Recurrence>(env, obj);
	return rec->getCount();
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Recurrence_setCount(JNIEnv *env, jobject obj, jint count) {
	Recurrence *rec = getHandle<Recurrence>(env, obj);
	return rec->setCount(count);
}

JNIEXPORT jstring JNICALL Java_info_hribar_thesis_Recurrence_getByDay(JNIEnv *env, jobject obj) {
	Recurrence *rec = getHandle<Recurrence>(env, obj);
	return env->NewStringUTF(rec->getByDay().c_str());
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Recurrence_setByDay(JNIEnv *env, jobject obj, jstring byday) {
	const char *str = env->GetStringUTFChars(byday, NULL);
	std::string sbyday(str);
	Recurrence *rec = getHandle<Recurrence>(env, obj);
	rec->setByDay(sbyday);
	env->ReleaseStringUTFChars(byday, str);
}

JNIEXPORT jstring JNICALL Java_info_hribar_thesis_Recurrence_getByMonthDay(JNIEnv *env, jobject obj) {
	Recurrence *rec = getHandle<Recurrence>(env, obj);
	return env->NewStringUTF(rec->getByMonthDay().c_str());
}

JNIEXPORT void JNICALL Java_info_hribar_thesis_Recurrence_setByMonthDay(JNIEnv *env, jobject obj, jstring bymonthday) {

}

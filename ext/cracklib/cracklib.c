#include <stdio.h>
#include <crack.h>
#include "ruby.h"

void Init_cracklib();
VALUE rb_mCracklib;
VALUE rb_cCheck;
VALUE rb_eInvalidPassword;

static VALUE
inspect_error(VALUE self){

  return Qnil;
}
static VALUE
validate_password(VALUE self, VALUE password) {
  const char * dict = RSTRING_PTR(rb_iv_get(self, "@dictpath"));
  int dictpath_empty = NIL_P(password);
  if(dictpath_empty) {
    rb_raise(rb_eInvalidPassword, "is empty");
  }
  const char * passwd = RSTRING_PTR(password);
  const char *cracklib_reason;

  if((cracklib_reason = FascistCheck(passwd, dict)) != NULL){
    rb_raise(rb_eInvalidPassword, "%s", cracklib_reason);
  } else {
    return Qtrue;
  }
}

static VALUE
init_cracklib(VALUE self, VALUE dictpath){
  int dictpath_empty = NIL_P(dictpath);
  if(dictpath_empty) {
    rb_raise(rb_eArgError, "dictpath is empty");
  }
  long dictpath_len = RSTRING_LEN(dictpath);
  if(dictpath_len == 0){
    rb_raise(rb_eArgError, "dictpath is empty");
  }
  rb_iv_set(self, "@dictpath", dictpath);



  return self;
}

void Init_cracklib() {
  rb_mCracklib = rb_define_module("Cracklib");
  rb_eInvalidPassword = rb_define_class_under(rb_mCracklib, "InvalidPasswordError", rb_eStandardError);
  rb_define_method(rb_eInvalidPassword, "inspect", inspect_error, 0);
  rb_cCheck = rb_define_class_under(rb_mCracklib, "Check", rb_cObject);
  rb_define_method(rb_cCheck, "initialize", init_cracklib, 1);
  rb_define_method(rb_cCheck, "valid?", validate_password, 1);

}

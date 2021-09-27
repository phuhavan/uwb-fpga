/* Include files */

#include "blascompat32.h"
#include "uwb_hw_cosim_sfun.h"
#include "c2_uwb_hw_cosim.h"
#define CHARTINSTANCE_CHARTNUMBER      (chartInstance->chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER   (chartInstance->instanceNumber)
#include "uwb_hw_cosim_sfun_debug_macros.h"

/* Type Definitions */

/* Named Constants */
#define CALL_EVENT                     (-1)

/* Variable Declarations */

/* Variable Definitions */
static const char * c2_debug_family_names[5] = { "nargin", "nargout", "Nsync",
  "Si", "SYNC" };

/* Function Declarations */
static void initialize_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance);
static void initialize_params_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance);
static void enable_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance);
static void disable_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance);
static void c2_update_debugger_state_c2_uwb_hw_cosim
  (SFc2_uwb_hw_cosimInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c2_uwb_hw_cosim
  (SFc2_uwb_hw_cosimInstanceStruct *chartInstance);
static void set_sim_state_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_st);
static void finalize_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance);
static void sf_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct *chartInstance);
static void initSimStructsc2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance);
static void init_script_number_translation(uint32_T c2_machineNumber, uint32_T
  c2_chartNumber);
static const mxArray *c2_sf_marshallOut(void *chartInstanceVoid, void *c2_inData);
static void c2_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct *chartInstance,
  const mxArray *c2_SYNC, const char_T *c2_identifier, int8_T c2_y[31744]);
static void c2_b_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct *chartInstance,
  const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId, int8_T c2_y[31744]);
static void c2_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static const mxArray *c2_b_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static const mxArray *c2_c_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static const mxArray *c2_d_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static real_T c2_c_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId);
static void c2_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static void c2_check_forloop_overflow_error(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance);
static const mxArray *c2_e_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static int32_T c2_d_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId);
static void c2_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static uint8_T c2_e_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_b_is_active_c2_uwb_hw_cosim, const char_T
  *c2_identifier);
static uint8_T c2_f_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId);
static void init_dsm_address_info(SFc2_uwb_hw_cosimInstanceStruct *chartInstance);

/* Function Definitions */
static void initialize_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance)
{
  chartInstance->c2_sfEvent = CALL_EVENT;
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
  chartInstance->c2_is_active_c2_uwb_hw_cosim = 0U;
}

static void initialize_params_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance)
{
}

static void enable_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance)
{
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
}

static void disable_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance)
{
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
}

static void c2_update_debugger_state_c2_uwb_hw_cosim
  (SFc2_uwb_hw_cosimInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c2_uwb_hw_cosim
  (SFc2_uwb_hw_cosimInstanceStruct *chartInstance)
{
  const mxArray *c2_st;
  const mxArray *c2_y = NULL;
  int32_T c2_i0;
  int8_T c2_u[31744];
  const mxArray *c2_b_y = NULL;
  uint8_T c2_hoistedGlobal;
  uint8_T c2_b_u;
  const mxArray *c2_c_y = NULL;
  int8_T (*c2_SYNC)[31744];
  c2_SYNC = (int8_T (*)[31744])ssGetOutputPortSignal(chartInstance->S, 1);
  c2_st = NULL;
  c2_st = NULL;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_createcellarray(2), FALSE);
  for (c2_i0 = 0; c2_i0 < 31744; c2_i0++) {
    c2_u[c2_i0] = (*c2_SYNC)[c2_i0];
  }

  c2_b_y = NULL;
  sf_mex_assign(&c2_b_y, sf_mex_create("y", c2_u, 2, 0U, 1U, 0U, 2, 1, 31744),
                FALSE);
  sf_mex_setcell(c2_y, 0, c2_b_y);
  c2_hoistedGlobal = chartInstance->c2_is_active_c2_uwb_hw_cosim;
  c2_b_u = c2_hoistedGlobal;
  c2_c_y = NULL;
  sf_mex_assign(&c2_c_y, sf_mex_create("y", &c2_b_u, 3, 0U, 0U, 0U, 0), FALSE);
  sf_mex_setcell(c2_y, 1, c2_c_y);
  sf_mex_assign(&c2_st, c2_y, FALSE);
  return c2_st;
}

static void set_sim_state_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_st)
{
  const mxArray *c2_u;
  int8_T c2_iv0[31744];
  int32_T c2_i1;
  int8_T (*c2_SYNC)[31744];
  c2_SYNC = (int8_T (*)[31744])ssGetOutputPortSignal(chartInstance->S, 1);
  chartInstance->c2_doneDoubleBufferReInit = TRUE;
  c2_u = sf_mex_dup(c2_st);
  c2_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c2_u, 0)), "SYNC",
                      c2_iv0);
  for (c2_i1 = 0; c2_i1 < 31744; c2_i1++) {
    (*c2_SYNC)[c2_i1] = c2_iv0[c2_i1];
  }

  chartInstance->c2_is_active_c2_uwb_hw_cosim = c2_e_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c2_u, 1)),
     "is_active_c2_uwb_hw_cosim");
  sf_mex_destroy(&c2_u);
  c2_update_debugger_state_c2_uwb_hw_cosim(chartInstance);
  sf_mex_destroy(&c2_st);
}

static void finalize_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance)
{
}

static void sf_c2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct *chartInstance)
{
  int32_T c2_i2;
  int32_T c2_i3;
  int32_T c2_i4;
  int32_T c2_i5;
  int8_T c2_Nsync[16];
  int32_T c2_i6;
  int8_T c2_Si[1984];
  uint32_T c2_debug_family_var_map[5];
  real_T c2_nargin = 2.0;
  real_T c2_nargout = 1.0;
  int8_T c2_SYNC[31744];
  int32_T c2_i7;
  int8_T c2_A[16];
  int32_T c2_i8;
  int8_T c2_B[1984];
  int32_T c2_kidx;
  int32_T c2_j1;
  int32_T c2_b_j1;
  int32_T c2_j2;
  int32_T c2_b_j2;
  int32_T c2_a;
  int8_T c2_b_a;
  int8_T c2_b;
  int32_T c2_i9;
  int8_T c2_y;
  int32_T c2_i10;
  int8_T (*c2_b_SYNC)[31744];
  int8_T (*c2_b_Si)[1984];
  int8_T (*c2_b_Nsync)[16];
  c2_b_SYNC = (int8_T (*)[31744])ssGetOutputPortSignal(chartInstance->S, 1);
  c2_b_Si = (int8_T (*)[1984])ssGetInputPortSignal(chartInstance->S, 1);
  c2_b_Nsync = (int8_T (*)[16])ssGetInputPortSignal(chartInstance->S, 0);
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 1U, chartInstance->c2_sfEvent);
  for (c2_i2 = 0; c2_i2 < 16; c2_i2++) {
    _SFD_DATA_RANGE_CHECK((real_T)(*c2_b_Nsync)[c2_i2], 0U);
  }

  for (c2_i3 = 0; c2_i3 < 1984; c2_i3++) {
    _SFD_DATA_RANGE_CHECK((real_T)(*c2_b_Si)[c2_i3], 1U);
  }

  for (c2_i4 = 0; c2_i4 < 31744; c2_i4++) {
    _SFD_DATA_RANGE_CHECK((real_T)(*c2_b_SYNC)[c2_i4], 2U);
  }

  chartInstance->c2_sfEvent = CALL_EVENT;
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 1U, chartInstance->c2_sfEvent);
  for (c2_i5 = 0; c2_i5 < 16; c2_i5++) {
    c2_Nsync[c2_i5] = (*c2_b_Nsync)[c2_i5];
  }

  for (c2_i6 = 0; c2_i6 < 1984; c2_i6++) {
    c2_Si[c2_i6] = (*c2_b_Si)[c2_i6];
  }

  sf_debug_symbol_scope_push_eml(0U, 5U, 5U, c2_debug_family_names,
    c2_debug_family_var_map);
  sf_debug_symbol_scope_add_eml_importable(&c2_nargin, 0U, c2_d_sf_marshallOut,
    c2_b_sf_marshallIn);
  sf_debug_symbol_scope_add_eml_importable(&c2_nargout, 1U, c2_d_sf_marshallOut,
    c2_b_sf_marshallIn);
  sf_debug_symbol_scope_add_eml(c2_Nsync, 2U, c2_c_sf_marshallOut);
  sf_debug_symbol_scope_add_eml(c2_Si, 3U, c2_b_sf_marshallOut);
  sf_debug_symbol_scope_add_eml_importable(c2_SYNC, 4U, c2_sf_marshallOut,
    c2_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 4);
  for (c2_i7 = 0; c2_i7 < 16; c2_i7++) {
    c2_A[c2_i7] = c2_Nsync[c2_i7];
  }

  for (c2_i8 = 0; c2_i8 < 1984; c2_i8++) {
    c2_B[c2_i8] = c2_Si[c2_i8];
  }

  c2_kidx = 0;
  c2_check_forloop_overflow_error(chartInstance);
  for (c2_j1 = 1; c2_j1 < 17; c2_j1++) {
    c2_b_j1 = c2_j1;
    c2_check_forloop_overflow_error(chartInstance);
    for (c2_j2 = 1; c2_j2 < 1985; c2_j2++) {
      c2_b_j2 = c2_j2;
      c2_a = c2_kidx + 1;
      c2_kidx = c2_a;
      c2_b_a = c2_A[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK(
        "", (real_T)c2_b_j1), 1, 16, 2, 0) - 1];
      c2_b = c2_B[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK("",
        (real_T)c2_b_j2), 1, 1984, 2, 0) - 1];
      c2_i9 = c2_b_a * c2_b;
      if (c2_i9 > 127) {
        c2_i9 = 127;
      } else {
        if (c2_i9 < -128) {
          c2_i9 = -128;
        }
      }

      c2_y = (int8_T)c2_i9;
      c2_SYNC[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK("",
        (real_T)c2_kidx), 1, 31744, 1, 0) - 1] = c2_y;
    }
  }

  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, -4);
  sf_debug_symbol_scope_pop();
  for (c2_i10 = 0; c2_i10 < 31744; c2_i10++) {
    (*c2_b_SYNC)[c2_i10] = c2_SYNC[c2_i10];
  }

  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 1U, chartInstance->c2_sfEvent);
  sf_debug_check_for_state_inconsistency(_uwb_hw_cosimMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
}

static void initSimStructsc2_uwb_hw_cosim(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance)
{
}

static void init_script_number_translation(uint32_T c2_machineNumber, uint32_T
  c2_chartNumber)
{
}

static const mxArray *c2_sf_marshallOut(void *chartInstanceVoid, void *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_i11;
  int8_T c2_b_inData[31744];
  int32_T c2_i12;
  int8_T c2_u[31744];
  const mxArray *c2_y = NULL;
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  for (c2_i11 = 0; c2_i11 < 31744; c2_i11++) {
    c2_b_inData[c2_i11] = (*(int8_T (*)[31744])c2_inData)[c2_i11];
  }

  for (c2_i12 = 0; c2_i12 < 31744; c2_i12++) {
    c2_u[c2_i12] = c2_b_inData[c2_i12];
  }

  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", c2_u, 2, 0U, 1U, 0U, 2, 1, 31744),
                FALSE);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, FALSE);
  return c2_mxArrayOutData;
}

static void c2_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct *chartInstance,
  const mxArray *c2_SYNC, const char_T *c2_identifier, int8_T c2_y[31744])
{
  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_SYNC), &c2_thisId, c2_y);
  sf_mex_destroy(&c2_SYNC);
}

static void c2_b_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct *chartInstance,
  const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId, int8_T c2_y[31744])
{
  int8_T c2_iv1[31744];
  int32_T c2_i13;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_iv1, 1, 2, 0U, 1, 0U, 2, 1,
                31744);
  for (c2_i13 = 0; c2_i13 < 31744; c2_i13++) {
    c2_y[c2_i13] = c2_iv1[c2_i13];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_SYNC;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  int8_T c2_y[31744];
  int32_T c2_i14;
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)chartInstanceVoid;
  c2_SYNC = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_SYNC), &c2_thisId, c2_y);
  sf_mex_destroy(&c2_SYNC);
  for (c2_i14 = 0; c2_i14 < 31744; c2_i14++) {
    (*(int8_T (*)[31744])c2_outData)[c2_i14] = c2_y[c2_i14];
  }

  sf_mex_destroy(&c2_mxArrayInData);
}

static const mxArray *c2_b_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_i15;
  int8_T c2_b_inData[1984];
  int32_T c2_i16;
  int8_T c2_u[1984];
  const mxArray *c2_y = NULL;
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  for (c2_i15 = 0; c2_i15 < 1984; c2_i15++) {
    c2_b_inData[c2_i15] = (*(int8_T (*)[1984])c2_inData)[c2_i15];
  }

  for (c2_i16 = 0; c2_i16 < 1984; c2_i16++) {
    c2_u[c2_i16] = c2_b_inData[c2_i16];
  }

  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", c2_u, 2, 0U, 1U, 0U, 2, 1, 1984),
                FALSE);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, FALSE);
  return c2_mxArrayOutData;
}

static const mxArray *c2_c_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_i17;
  int8_T c2_b_inData[16];
  int32_T c2_i18;
  int8_T c2_u[16];
  const mxArray *c2_y = NULL;
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  for (c2_i17 = 0; c2_i17 < 16; c2_i17++) {
    c2_b_inData[c2_i17] = (*(int8_T (*)[16])c2_inData)[c2_i17];
  }

  for (c2_i18 = 0; c2_i18 < 16; c2_i18++) {
    c2_u[c2_i18] = c2_b_inData[c2_i18];
  }

  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", c2_u, 2, 0U, 1U, 0U, 2, 1, 16), FALSE);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, FALSE);
  return c2_mxArrayOutData;
}

static const mxArray *c2_d_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  real_T c2_u;
  const mxArray *c2_y = NULL;
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  c2_u = *(real_T *)c2_inData;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", &c2_u, 0, 0U, 0U, 0U, 0), FALSE);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, FALSE);
  return c2_mxArrayOutData;
}

static real_T c2_c_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  real_T c2_y;
  real_T c2_d0;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_d0, 1, 0, 0U, 0, 0U, 0);
  c2_y = c2_d0;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void c2_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_nargout;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  real_T c2_y;
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)chartInstanceVoid;
  c2_nargout = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_c_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_nargout), &c2_thisId);
  sf_mex_destroy(&c2_nargout);
  *(real_T *)c2_outData = c2_y;
  sf_mex_destroy(&c2_mxArrayInData);
}

const mxArray *sf_c2_uwb_hw_cosim_get_eml_resolved_functions_info(void)
{
  const mxArray *c2_nameCaptureInfo;
  c2_ResolvedFunctionInfo c2_info[10];
  c2_ResolvedFunctionInfo (*c2_b_info)[10];
  const mxArray *c2_m0 = NULL;
  int32_T c2_i19;
  c2_ResolvedFunctionInfo *c2_r0;
  c2_nameCaptureInfo = NULL;
  c2_nameCaptureInfo = NULL;
  c2_b_info = (c2_ResolvedFunctionInfo (*)[10])c2_info;
  (*c2_b_info)[0].context = "";
  (*c2_b_info)[0].name = "kron";
  (*c2_b_info)[0].dominantType = "int8";
  (*c2_b_info)[0].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c2_b_info)[0].fileTimeLo = 1286800840U;
  (*c2_b_info)[0].fileTimeHi = 0U;
  (*c2_b_info)[0].mFileTimeLo = 0U;
  (*c2_b_info)[0].mFileTimeHi = 0U;
  (*c2_b_info)[1].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c2_b_info)[1].name = "eml_index_class";
  (*c2_b_info)[1].dominantType = "";
  (*c2_b_info)[1].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_class.m";
  (*c2_b_info)[1].fileTimeLo = 1323148978U;
  (*c2_b_info)[1].fileTimeHi = 0U;
  (*c2_b_info)[1].mFileTimeLo = 0U;
  (*c2_b_info)[1].mFileTimeHi = 0U;
  (*c2_b_info)[2].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c2_b_info)[2].name = "eml_index_times";
  (*c2_b_info)[2].dominantType = "coder.internal.indexInt";
  (*c2_b_info)[2].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_times.m";
  (*c2_b_info)[2].fileTimeLo = 1286800780U;
  (*c2_b_info)[2].fileTimeHi = 0U;
  (*c2_b_info)[2].mFileTimeLo = 0U;
  (*c2_b_info)[2].mFileTimeHi = 0U;
  (*c2_b_info)[3].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_times.m";
  (*c2_b_info)[3].name = "eml_index_class";
  (*c2_b_info)[3].dominantType = "";
  (*c2_b_info)[3].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_class.m";
  (*c2_b_info)[3].fileTimeLo = 1323148978U;
  (*c2_b_info)[3].fileTimeHi = 0U;
  (*c2_b_info)[3].mFileTimeLo = 0U;
  (*c2_b_info)[3].mFileTimeHi = 0U;
  (*c2_b_info)[4].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c2_b_info)[4].name = "eml_scalar_eg";
  (*c2_b_info)[4].dominantType = "int8";
  (*c2_b_info)[4].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_scalar_eg.m";
  (*c2_b_info)[4].fileTimeLo = 1286800796U;
  (*c2_b_info)[4].fileTimeHi = 0U;
  (*c2_b_info)[4].mFileTimeLo = 0U;
  (*c2_b_info)[4].mFileTimeHi = 0U;
  (*c2_b_info)[5].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c2_b_info)[5].name = "eml_int_forloop_overflow_check";
  (*c2_b_info)[5].dominantType = "";
  (*c2_b_info)[5].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m";
  (*c2_b_info)[5].fileTimeLo = 1332147072U;
  (*c2_b_info)[5].fileTimeHi = 0U;
  (*c2_b_info)[5].mFileTimeLo = 0U;
  (*c2_b_info)[5].mFileTimeHi = 0U;
  (*c2_b_info)[6].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m!eml_int_forloop_overflow_check_helper";
  (*c2_b_info)[6].name = "intmax";
  (*c2_b_info)[6].dominantType = "char";
  (*c2_b_info)[6].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/intmax.m";
  (*c2_b_info)[6].fileTimeLo = 1311237316U;
  (*c2_b_info)[6].fileTimeHi = 0U;
  (*c2_b_info)[6].mFileTimeLo = 0U;
  (*c2_b_info)[6].mFileTimeHi = 0U;
  (*c2_b_info)[7].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c2_b_info)[7].name = "eml_index_plus";
  (*c2_b_info)[7].dominantType = "double";
  (*c2_b_info)[7].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m";
  (*c2_b_info)[7].fileTimeLo = 1286800778U;
  (*c2_b_info)[7].fileTimeHi = 0U;
  (*c2_b_info)[7].mFileTimeLo = 0U;
  (*c2_b_info)[7].mFileTimeHi = 0U;
  (*c2_b_info)[8].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m";
  (*c2_b_info)[8].name = "eml_index_class";
  (*c2_b_info)[8].dominantType = "";
  (*c2_b_info)[8].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_class.m";
  (*c2_b_info)[8].fileTimeLo = 1323148978U;
  (*c2_b_info)[8].fileTimeHi = 0U;
  (*c2_b_info)[8].mFileTimeLo = 0U;
  (*c2_b_info)[8].mFileTimeHi = 0U;
  (*c2_b_info)[9].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c2_b_info)[9].name = "mtimes";
  (*c2_b_info)[9].dominantType = "int8";
  (*c2_b_info)[9].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mtimes.m";
  (*c2_b_info)[9].fileTimeLo = 1289498092U;
  (*c2_b_info)[9].fileTimeHi = 0U;
  (*c2_b_info)[9].mFileTimeLo = 0U;
  (*c2_b_info)[9].mFileTimeHi = 0U;
  sf_mex_assign(&c2_m0, sf_mex_createstruct("nameCaptureInfo", 1, 10), FALSE);
  for (c2_i19 = 0; c2_i19 < 10; c2_i19++) {
    c2_r0 = &c2_info[c2_i19];
    sf_mex_addfield(c2_m0, sf_mex_create("nameCaptureInfo", c2_r0->context, 15,
      0U, 0U, 0U, 2, 1, strlen(c2_r0->context)), "context", "nameCaptureInfo",
                    c2_i19);
    sf_mex_addfield(c2_m0, sf_mex_create("nameCaptureInfo", c2_r0->name, 15, 0U,
      0U, 0U, 2, 1, strlen(c2_r0->name)), "name", "nameCaptureInfo", c2_i19);
    sf_mex_addfield(c2_m0, sf_mex_create("nameCaptureInfo", c2_r0->dominantType,
      15, 0U, 0U, 0U, 2, 1, strlen(c2_r0->dominantType)), "dominantType",
                    "nameCaptureInfo", c2_i19);
    sf_mex_addfield(c2_m0, sf_mex_create("nameCaptureInfo", c2_r0->resolved, 15,
      0U, 0U, 0U, 2, 1, strlen(c2_r0->resolved)), "resolved", "nameCaptureInfo",
                    c2_i19);
    sf_mex_addfield(c2_m0, sf_mex_create("nameCaptureInfo", &c2_r0->fileTimeLo,
      7, 0U, 0U, 0U, 0), "fileTimeLo", "nameCaptureInfo", c2_i19);
    sf_mex_addfield(c2_m0, sf_mex_create("nameCaptureInfo", &c2_r0->fileTimeHi,
      7, 0U, 0U, 0U, 0), "fileTimeHi", "nameCaptureInfo", c2_i19);
    sf_mex_addfield(c2_m0, sf_mex_create("nameCaptureInfo", &c2_r0->mFileTimeLo,
      7, 0U, 0U, 0U, 0), "mFileTimeLo", "nameCaptureInfo", c2_i19);
    sf_mex_addfield(c2_m0, sf_mex_create("nameCaptureInfo", &c2_r0->mFileTimeHi,
      7, 0U, 0U, 0U, 0), "mFileTimeHi", "nameCaptureInfo", c2_i19);
  }

  sf_mex_assign(&c2_nameCaptureInfo, c2_m0, FALSE);
  sf_mex_emlrtNameCapturePostProcessR2012a(&c2_nameCaptureInfo);
  return c2_nameCaptureInfo;
}

static void c2_check_forloop_overflow_error(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance)
{
}

static const mxArray *c2_e_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_u;
  const mxArray *c2_y = NULL;
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  c2_u = *(int32_T *)c2_inData;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", &c2_u, 6, 0U, 0U, 0U, 0), FALSE);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, FALSE);
  return c2_mxArrayOutData;
}

static int32_T c2_d_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  int32_T c2_y;
  int32_T c2_i20;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_i20, 1, 6, 0U, 0, 0U, 0);
  c2_y = c2_i20;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void c2_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_b_sfEvent;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  int32_T c2_y;
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)chartInstanceVoid;
  c2_b_sfEvent = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_b_sfEvent),
    &c2_thisId);
  sf_mex_destroy(&c2_b_sfEvent);
  *(int32_T *)c2_outData = c2_y;
  sf_mex_destroy(&c2_mxArrayInData);
}

static uint8_T c2_e_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_b_is_active_c2_uwb_hw_cosim, const char_T
  *c2_identifier)
{
  uint8_T c2_y;
  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_f_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c2_b_is_active_c2_uwb_hw_cosim), &c2_thisId);
  sf_mex_destroy(&c2_b_is_active_c2_uwb_hw_cosim);
  return c2_y;
}

static uint8_T c2_f_emlrt_marshallIn(SFc2_uwb_hw_cosimInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  uint8_T c2_y;
  uint8_T c2_u0;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_u0, 1, 3, 0U, 0, 0U, 0);
  c2_y = c2_u0;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void init_dsm_address_info(SFc2_uwb_hw_cosimInstanceStruct *chartInstance)
{
}

/* SFunction Glue Code */
void sf_c2_uwb_hw_cosim_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(659304914U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1537916613U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(294687864U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(883952970U);
}

mxArray *sf_c2_uwb_hw_cosim_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1,1,5,
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateString("OFwybuaWjM1nOMaRpu8qCB");
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,2,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(16);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(4));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(1984);
      mxSetField(mxData,1,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(4));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,1,"type",mxType);
    }

    mxSetField(mxData,1,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"inputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"parameters",mxCreateDoubleMatrix(0,0,
                mxREAL));
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,1,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(31744);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(4));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"outputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"locals",mxCreateDoubleMatrix(0,0,mxREAL));
  }

  return(mxAutoinheritanceInfo);
}

static const mxArray *sf_get_sim_state_info_c2_uwb_hw_cosim(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x2'type','srcId','name','auxInfo'{{M[1],M[7],T\"SYNC\",},{M[8],M[0],T\"is_active_c2_uwb_hw_cosim\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 2, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c2_uwb_hw_cosim_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
    chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *) ((ChartInfoStruct *)
      (ssGetUserData(S)))->chartInstance;
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (_uwb_hw_cosimMachineNumber_,
           2,
           1,
           1,
           3,
           0,
           0,
           0,
           0,
           0,
           &(chartInstance->chartNumber),
           &(chartInstance->instanceNumber),
           ssGetPath(S),
           (void *)S);
        if (chartAlreadyPresent==0) {
          /* this is the first instance */
          init_script_number_translation(_uwb_hw_cosimMachineNumber_,
            chartInstance->chartNumber);
          sf_debug_set_chart_disable_implicit_casting
            (_uwb_hw_cosimMachineNumber_,chartInstance->chartNumber,1);
          sf_debug_set_chart_event_thresholds(_uwb_hw_cosimMachineNumber_,
            chartInstance->chartNumber,
            0,
            0,
            0);
          _SFD_SET_DATA_PROPS(0,1,1,0,"Nsync");
          _SFD_SET_DATA_PROPS(1,1,1,0,"Si");
          _SFD_SET_DATA_PROPS(2,2,0,1,"SYNC");
          _SFD_STATE_INFO(0,0,2);
          _SFD_CH_SUBSTATE_COUNT(0);
          _SFD_CH_SUBSTATE_DECOMP(0);
        }

        _SFD_CV_INIT_CHART(0,0,0,0);

        {
          _SFD_CV_INIT_STATE(0,0,0,0,0,0,NULL,NULL);
        }

        _SFD_CV_INIT_TRANS(0,0,NULL,NULL,0,NULL);

        /* Initialization of MATLAB Function Model Coverage */
        _SFD_CV_INIT_EML(0,1,1,0,0,0,0,0,0,0,0);
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,64);
        _SFD_TRANS_COV_WTS(0,0,0,1,0);
        if (chartAlreadyPresent==0) {
          _SFD_TRANS_COV_MAPS(0,
                              0,NULL,NULL,
                              0,NULL,NULL,
                              1,NULL,NULL,
                              0,NULL,NULL);
        }

        {
          unsigned int dimVector[2];
          dimVector[0]= 1;
          dimVector[1]= 16;
          _SFD_SET_DATA_COMPILED_PROPS(0,SF_INT8,2,&(dimVector[0]),0,0,0,0.0,1.0,
            0,0,(MexFcnForType)c2_c_sf_marshallOut,(MexInFcnForType)NULL);
        }

        {
          unsigned int dimVector[2];
          dimVector[0]= 1;
          dimVector[1]= 1984;
          _SFD_SET_DATA_COMPILED_PROPS(1,SF_INT8,2,&(dimVector[0]),0,0,0,0.0,1.0,
            0,0,(MexFcnForType)c2_b_sf_marshallOut,(MexInFcnForType)NULL);
        }

        {
          unsigned int dimVector[2];
          dimVector[0]= 1;
          dimVector[1]= 31744;
          _SFD_SET_DATA_COMPILED_PROPS(2,SF_INT8,2,&(dimVector[0]),0,0,0,0.0,1.0,
            0,0,(MexFcnForType)c2_sf_marshallOut,(MexInFcnForType)
            c2_sf_marshallIn);
        }

        {
          int8_T (*c2_Nsync)[16];
          int8_T (*c2_Si)[1984];
          int8_T (*c2_SYNC)[31744];
          c2_SYNC = (int8_T (*)[31744])ssGetOutputPortSignal(chartInstance->S, 1);
          c2_Si = (int8_T (*)[1984])ssGetInputPortSignal(chartInstance->S, 1);
          c2_Nsync = (int8_T (*)[16])ssGetInputPortSignal(chartInstance->S, 0);
          _SFD_SET_DATA_VALUE_PTR(0U, *c2_Nsync);
          _SFD_SET_DATA_VALUE_PTR(1U, *c2_Si);
          _SFD_SET_DATA_VALUE_PTR(2U, *c2_SYNC);
        }
      }
    } else {
      sf_debug_reset_current_state_configuration(_uwb_hw_cosimMachineNumber_,
        chartInstance->chartNumber,chartInstance->instanceNumber);
    }
  }
}

static const char* sf_get_instance_specialization()
{
  return "6cZwVwvWXDFh7Vmo1T63mD";
}

static void sf_opaque_initialize_c2_uwb_hw_cosim(void *chartInstanceVar)
{
  chart_debug_initialization(((SFc2_uwb_hw_cosimInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*)
    chartInstanceVar);
  initialize_c2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c2_uwb_hw_cosim(void *chartInstanceVar)
{
  enable_c2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c2_uwb_hw_cosim(void *chartInstanceVar)
{
  disable_c2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c2_uwb_hw_cosim(void *chartInstanceVar)
{
  sf_c2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*) chartInstanceVar);
}

extern const mxArray* sf_internal_get_sim_state_c2_uwb_hw_cosim(SimStruct* S)
{
  ChartInfoStruct *chartInfo = (ChartInfoStruct*) ssGetUserData(S);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[4];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_raw2high");
  prhs[1] = mxCreateDoubleScalar(ssGetSFuncBlockHandle(S));
  prhs[2] = (mxArray*) get_sim_state_c2_uwb_hw_cosim
    ((SFc2_uwb_hw_cosimInstanceStruct*)chartInfo->chartInstance);/* raw sim ctx */
  prhs[3] = (mxArray*) sf_get_sim_state_info_c2_uwb_hw_cosim();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 4, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  mxDestroyArray(prhs[3]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_raw2high'.\n");
  }

  return plhs[0];
}

extern void sf_internal_set_sim_state_c2_uwb_hw_cosim(SimStruct* S, const
  mxArray *st)
{
  ChartInfoStruct *chartInfo = (ChartInfoStruct*) ssGetUserData(S);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[4];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_high2raw");
  prhs[1] = mxCreateDoubleScalar(ssGetSFuncBlockHandle(S));
  prhs[2] = mxDuplicateArray(st);      /* high level simctx */
  prhs[3] = (mxArray*) sf_get_sim_state_info_c2_uwb_hw_cosim();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 4, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  mxDestroyArray(prhs[3]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_high2raw'.\n");
  }

  set_sim_state_c2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*)
    chartInfo->chartInstance, mxDuplicateArray(plhs[0]));
  mxDestroyArray(plhs[0]);
}

static const mxArray* sf_opaque_get_sim_state_c2_uwb_hw_cosim(SimStruct* S)
{
  return sf_internal_get_sim_state_c2_uwb_hw_cosim(S);
}

static void sf_opaque_set_sim_state_c2_uwb_hw_cosim(SimStruct* S, const mxArray *
  st)
{
  sf_internal_set_sim_state_c2_uwb_hw_cosim(S, st);
}

static void sf_opaque_terminate_c2_uwb_hw_cosim(void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc2_uwb_hw_cosimInstanceStruct*) chartInstanceVar)->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
    }

    finalize_c2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*) chartInstanceVar);
    free((void *)chartInstanceVar);
    ssSetUserData(S,NULL);
  }

  unload_uwb_hw_cosim_optimization_info();
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c2_uwb_hw_cosim(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  if (sf_machine_global_initializer_called()) {
    initialize_params_c2_uwb_hw_cosim((SFc2_uwb_hw_cosimInstanceStruct*)
      (((ChartInfoStruct *)ssGetUserData(S))->chartInstance));
  }
}

static void mdlSetWorkWidths_c2_uwb_hw_cosim(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    mxArray *infoStruct = load_uwb_hw_cosim_optimization_info();
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(S,sf_get_instance_specialization(),infoStruct,
      2);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,sf_rtw_info_uint_prop(S,sf_get_instance_specialization(),
                infoStruct,2,"RTWCG"));
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop(S,
      sf_get_instance_specialization(),infoStruct,2,
      "gatewayCannotBeInlinedMultipleTimes"));
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,sf_get_instance_specialization(),
        infoStruct,2,2);
      sf_mark_chart_reusable_outputs(S,sf_get_instance_specialization(),
        infoStruct,2,1);
    }

    sf_set_rtw_dwork_info(S,sf_get_instance_specialization(),infoStruct,2);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(583939254U));
  ssSetChecksum1(S,(1554200926U));
  ssSetChecksum2(S,(2495629220U));
  ssSetChecksum3(S,(622298406U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
  ssSupportsMultipleExecInstances(S,1);
}

static void mdlRTW_c2_uwb_hw_cosim(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c2_uwb_hw_cosim(SimStruct *S)
{
  SFc2_uwb_hw_cosimInstanceStruct *chartInstance;
  chartInstance = (SFc2_uwb_hw_cosimInstanceStruct *)malloc(sizeof
    (SFc2_uwb_hw_cosimInstanceStruct));
  memset(chartInstance, 0, sizeof(SFc2_uwb_hw_cosimInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway = sf_opaque_gateway_c2_uwb_hw_cosim;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c2_uwb_hw_cosim;
  chartInstance->chartInfo.terminateChart = sf_opaque_terminate_c2_uwb_hw_cosim;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c2_uwb_hw_cosim;
  chartInstance->chartInfo.disableChart = sf_opaque_disable_c2_uwb_hw_cosim;
  chartInstance->chartInfo.getSimState = sf_opaque_get_sim_state_c2_uwb_hw_cosim;
  chartInstance->chartInfo.setSimState = sf_opaque_set_sim_state_c2_uwb_hw_cosim;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c2_uwb_hw_cosim;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c2_uwb_hw_cosim;
  chartInstance->chartInfo.mdlStart = mdlStart_c2_uwb_hw_cosim;
  chartInstance->chartInfo.mdlSetWorkWidths = mdlSetWorkWidths_c2_uwb_hw_cosim;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->S = S;
  ssSetUserData(S,(void *)(&(chartInstance->chartInfo)));/* register the chart instance with simstruct */
  init_dsm_address_info(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  sf_opaque_init_subchart_simstructs(chartInstance->chartInfo.chartInstance);
  chart_debug_initialization(S,1);
}

void c2_uwb_hw_cosim_method_dispatcher(SimStruct *S, int_T method, void *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c2_uwb_hw_cosim(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c2_uwb_hw_cosim(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c2_uwb_hw_cosim(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c2_uwb_hw_cosim_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}

/* Include files */

#include "blascompat32.h"
#include "uwb_hw_cosim_kintex_sfun.h"
#include "c1_uwb_hw_cosim_kintex.h"
#define CHARTINSTANCE_CHARTNUMBER      (chartInstance->chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER   (chartInstance->instanceNumber)
#include "uwb_hw_cosim_kintex_sfun_debug_macros.h"

/* Type Definitions */

/* Named Constants */
#define CALL_EVENT                     (-1)

/* Variable Declarations */

/* Variable Definitions */
static const char * c1_debug_family_names[5] = { "nargin", "nargout", "Ci",
  "deltaL", "Si" };

/* Function Declarations */
static void initialize_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance);
static void initialize_params_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance);
static void enable_c1_uwb_hw_cosim_kintex(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance);
static void disable_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance);
static void c1_update_debugger_state_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance);
static void set_sim_state_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance, const mxArray *c1_st);
static void finalize_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance);
static void sf_c1_uwb_hw_cosim_kintex(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance);
static void initSimStructsc1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance);
static void init_script_number_translation(uint32_T c1_machineNumber, uint32_T
  c1_chartNumber);
static const mxArray *c1_sf_marshallOut(void *chartInstanceVoid, void *c1_inData);
static void c1_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_Si, const char_T *c1_identifier, int8_T
  c1_y[1984]);
static void c1_b_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  int8_T c1_y[1984]);
static void c1_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData);
static const mxArray *c1_b_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData);
static const mxArray *c1_c_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData);
static const mxArray *c1_d_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData);
static real_T c1_c_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void c1_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData);
static void c1_check_forloop_overflow_error
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance);
static const mxArray *c1_e_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData);
static int32_T c1_d_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void c1_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData);
static uint8_T c1_e_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_uwb_hw_cosim_kintex, const
  char_T *c1_identifier);
static uint8_T c1_f_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId);
static void init_dsm_address_info(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance)
{
  chartInstance->c1_sfEvent = CALL_EVENT;
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
  chartInstance->c1_is_active_c1_uwb_hw_cosim_kintex = 0U;
}

static void initialize_params_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance)
{
}

static void enable_c1_uwb_hw_cosim_kintex(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance)
{
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
}

static void disable_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance)
{
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
}

static void c1_update_debugger_state_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance)
{
}

static const mxArray *get_sim_state_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance)
{
  const mxArray *c1_st;
  const mxArray *c1_y = NULL;
  int32_T c1_i0;
  int8_T c1_u[1984];
  const mxArray *c1_b_y = NULL;
  uint8_T c1_hoistedGlobal;
  uint8_T c1_b_u;
  const mxArray *c1_c_y = NULL;
  int8_T (*c1_Si)[1984];
  c1_Si = (int8_T (*)[1984])ssGetOutputPortSignal(chartInstance->S, 1);
  c1_st = NULL;
  c1_st = NULL;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_createcellarray(2), FALSE);
  for (c1_i0 = 0; c1_i0 < 1984; c1_i0++) {
    c1_u[c1_i0] = (*c1_Si)[c1_i0];
  }

  c1_b_y = NULL;
  sf_mex_assign(&c1_b_y, sf_mex_create("y", c1_u, 2, 0U, 1U, 0U, 2, 1, 1984),
                FALSE);
  sf_mex_setcell(c1_y, 0, c1_b_y);
  c1_hoistedGlobal = chartInstance->c1_is_active_c1_uwb_hw_cosim_kintex;
  c1_b_u = c1_hoistedGlobal;
  c1_c_y = NULL;
  sf_mex_assign(&c1_c_y, sf_mex_create("y", &c1_b_u, 3, 0U, 0U, 0U, 0), FALSE);
  sf_mex_setcell(c1_y, 1, c1_c_y);
  sf_mex_assign(&c1_st, c1_y, FALSE);
  return c1_st;
}

static void set_sim_state_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance, const mxArray *c1_st)
{
  const mxArray *c1_u;
  int8_T c1_iv0[1984];
  int32_T c1_i1;
  int8_T (*c1_Si)[1984];
  c1_Si = (int8_T (*)[1984])ssGetOutputPortSignal(chartInstance->S, 1);
  chartInstance->c1_doneDoubleBufferReInit = TRUE;
  c1_u = sf_mex_dup(c1_st);
  c1_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 0)), "Si",
                      c1_iv0);
  for (c1_i1 = 0; c1_i1 < 1984; c1_i1++) {
    (*c1_Si)[c1_i1] = c1_iv0[c1_i1];
  }

  chartInstance->c1_is_active_c1_uwb_hw_cosim_kintex = c1_e_emlrt_marshallIn
    (chartInstance, sf_mex_dup(sf_mex_getcell(c1_u, 1)),
     "is_active_c1_uwb_hw_cosim_kintex");
  sf_mex_destroy(&c1_u);
  c1_update_debugger_state_c1_uwb_hw_cosim_kintex(chartInstance);
  sf_mex_destroy(&c1_st);
}

static void finalize_c1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance)
{
}

static void sf_c1_uwb_hw_cosim_kintex(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance)
{
  int32_T c1_i2;
  int32_T c1_i3;
  int32_T c1_i4;
  int32_T c1_i5;
  int8_T c1_Ci[31];
  int32_T c1_i6;
  int8_T c1_deltaL[64];
  uint32_T c1_debug_family_var_map[5];
  real_T c1_nargin = 2.0;
  real_T c1_nargout = 1.0;
  int8_T c1_Si[1984];
  int32_T c1_i7;
  int8_T c1_A[31];
  int32_T c1_i8;
  int8_T c1_B[64];
  int32_T c1_kidx;
  int32_T c1_j1;
  int32_T c1_b_j1;
  int32_T c1_j2;
  int32_T c1_b_j2;
  int32_T c1_a;
  int8_T c1_b_a;
  int8_T c1_b;
  int32_T c1_i9;
  int8_T c1_y;
  int32_T c1_i10;
  int8_T (*c1_b_Si)[1984];
  int8_T (*c1_b_deltaL)[64];
  int8_T (*c1_b_Ci)[31];
  c1_b_deltaL = (int8_T (*)[64])ssGetInputPortSignal(chartInstance->S, 1);
  c1_b_Si = (int8_T (*)[1984])ssGetOutputPortSignal(chartInstance->S, 1);
  c1_b_Ci = (int8_T (*)[31])ssGetInputPortSignal(chartInstance->S, 0);
  _sfTime_ = (real_T)ssGetT(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
  for (c1_i2 = 0; c1_i2 < 31; c1_i2++) {
    _SFD_DATA_RANGE_CHECK((real_T)(*c1_b_Ci)[c1_i2], 0U);
  }

  for (c1_i3 = 0; c1_i3 < 1984; c1_i3++) {
    _SFD_DATA_RANGE_CHECK((real_T)(*c1_b_Si)[c1_i3], 1U);
  }

  for (c1_i4 = 0; c1_i4 < 64; c1_i4++) {
    _SFD_DATA_RANGE_CHECK((real_T)(*c1_b_deltaL)[c1_i4], 2U);
  }

  chartInstance->c1_sfEvent = CALL_EVENT;
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
  for (c1_i5 = 0; c1_i5 < 31; c1_i5++) {
    c1_Ci[c1_i5] = (*c1_b_Ci)[c1_i5];
  }

  for (c1_i6 = 0; c1_i6 < 64; c1_i6++) {
    c1_deltaL[c1_i6] = (*c1_b_deltaL)[c1_i6];
  }

  sf_debug_symbol_scope_push_eml(0U, 5U, 5U, c1_debug_family_names,
    c1_debug_family_var_map);
  sf_debug_symbol_scope_add_eml_importable(&c1_nargin, 0U, c1_d_sf_marshallOut,
    c1_b_sf_marshallIn);
  sf_debug_symbol_scope_add_eml_importable(&c1_nargout, 1U, c1_d_sf_marshallOut,
    c1_b_sf_marshallIn);
  sf_debug_symbol_scope_add_eml(c1_Ci, 2U, c1_c_sf_marshallOut);
  sf_debug_symbol_scope_add_eml(c1_deltaL, 3U, c1_b_sf_marshallOut);
  sf_debug_symbol_scope_add_eml_importable(c1_Si, 4U, c1_sf_marshallOut,
    c1_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, 4);
  for (c1_i7 = 0; c1_i7 < 31; c1_i7++) {
    c1_A[c1_i7] = c1_Ci[c1_i7];
  }

  for (c1_i8 = 0; c1_i8 < 64; c1_i8++) {
    c1_B[c1_i8] = c1_deltaL[c1_i8];
  }

  c1_kidx = 0;
  c1_check_forloop_overflow_error(chartInstance);
  for (c1_j1 = 1; c1_j1 < 32; c1_j1++) {
    c1_b_j1 = c1_j1;
    c1_check_forloop_overflow_error(chartInstance);
    for (c1_j2 = 1; c1_j2 < 65; c1_j2++) {
      c1_b_j2 = c1_j2;
      c1_a = c1_kidx + 1;
      c1_kidx = c1_a;
      c1_b_a = c1_A[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK(
        "", (real_T)c1_b_j1), 1, 31, 2, 0) - 1];
      c1_b = c1_B[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK("",
        (real_T)c1_b_j2), 1, 64, 2, 0) - 1];
      c1_i9 = c1_b_a * c1_b;
      if (c1_i9 > 127) {
        c1_i9 = 127;
      } else {
        if (c1_i9 < -128) {
          c1_i9 = -128;
        }
      }

      c1_y = (int8_T)c1_i9;
      c1_Si[_SFD_EML_ARRAY_BOUNDS_CHECK("", (int32_T)_SFD_INTEGER_CHECK("",
        (real_T)c1_kidx), 1, 1984, 1, 0) - 1] = c1_y;
    }
  }

  _SFD_EML_CALL(0U, chartInstance->c1_sfEvent, -4);
  sf_debug_symbol_scope_pop();
  for (c1_i10 = 0; c1_i10 < 1984; c1_i10++) {
    (*c1_b_Si)[c1_i10] = c1_Si[c1_i10];
  }

  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 0U, chartInstance->c1_sfEvent);
  sf_debug_check_for_state_inconsistency(_uwb_hw_cosim_kintexMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
}

static void initSimStructsc1_uwb_hw_cosim_kintex
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance)
{
}

static void init_script_number_translation(uint32_T c1_machineNumber, uint32_T
  c1_chartNumber)
{
}

static const mxArray *c1_sf_marshallOut(void *chartInstanceVoid, void *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_i11;
  int8_T c1_b_inData[1984];
  int32_T c1_i12;
  int8_T c1_u[1984];
  const mxArray *c1_y = NULL;
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  for (c1_i11 = 0; c1_i11 < 1984; c1_i11++) {
    c1_b_inData[c1_i11] = (*(int8_T (*)[1984])c1_inData)[c1_i11];
  }

  for (c1_i12 = 0; c1_i12 < 1984; c1_i12++) {
    c1_u[c1_i12] = c1_b_inData[c1_i12];
  }

  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", c1_u, 2, 0U, 1U, 0U, 2, 1, 1984),
                FALSE);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, FALSE);
  return c1_mxArrayOutData;
}

static void c1_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_Si, const char_T *c1_identifier, int8_T
  c1_y[1984])
{
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_Si), &c1_thisId, c1_y);
  sf_mex_destroy(&c1_Si);
}

static void c1_b_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId,
  int8_T c1_y[1984])
{
  int8_T c1_iv1[1984];
  int32_T c1_i13;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), c1_iv1, 1, 2, 0U, 1, 0U, 2, 1,
                1984);
  for (c1_i13 = 0; c1_i13 < 1984; c1_i13++) {
    c1_y[c1_i13] = c1_iv1[c1_i13];
  }

  sf_mex_destroy(&c1_u);
}

static void c1_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData)
{
  const mxArray *c1_Si;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  int8_T c1_y[1984];
  int32_T c1_i14;
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)chartInstanceVoid;
  c1_Si = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_Si), &c1_thisId, c1_y);
  sf_mex_destroy(&c1_Si);
  for (c1_i14 = 0; c1_i14 < 1984; c1_i14++) {
    (*(int8_T (*)[1984])c1_outData)[c1_i14] = c1_y[c1_i14];
  }

  sf_mex_destroy(&c1_mxArrayInData);
}

static const mxArray *c1_b_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_i15;
  int8_T c1_b_inData[64];
  int32_T c1_i16;
  int8_T c1_u[64];
  const mxArray *c1_y = NULL;
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  for (c1_i15 = 0; c1_i15 < 64; c1_i15++) {
    c1_b_inData[c1_i15] = (*(int8_T (*)[64])c1_inData)[c1_i15];
  }

  for (c1_i16 = 0; c1_i16 < 64; c1_i16++) {
    c1_u[c1_i16] = c1_b_inData[c1_i16];
  }

  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", c1_u, 2, 0U, 1U, 0U, 2, 1, 64), FALSE);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, FALSE);
  return c1_mxArrayOutData;
}

static const mxArray *c1_c_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_i17;
  int8_T c1_b_inData[31];
  int32_T c1_i18;
  int8_T c1_u[31];
  const mxArray *c1_y = NULL;
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  for (c1_i17 = 0; c1_i17 < 31; c1_i17++) {
    c1_b_inData[c1_i17] = (*(int8_T (*)[31])c1_inData)[c1_i17];
  }

  for (c1_i18 = 0; c1_i18 < 31; c1_i18++) {
    c1_u[c1_i18] = c1_b_inData[c1_i18];
  }

  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", c1_u, 2, 0U, 1U, 0U, 2, 1, 31), FALSE);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, FALSE);
  return c1_mxArrayOutData;
}

static const mxArray *c1_d_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  real_T c1_u;
  const mxArray *c1_y = NULL;
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  c1_u = *(real_T *)c1_inData;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", &c1_u, 0, 0U, 0U, 0U, 0), FALSE);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, FALSE);
  return c1_mxArrayOutData;
}

static real_T c1_c_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  real_T c1_y;
  real_T c1_d0;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_d0, 1, 0, 0U, 0, 0U, 0);
  c1_y = c1_d0;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void c1_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData)
{
  const mxArray *c1_nargout;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  real_T c1_y;
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)chartInstanceVoid;
  c1_nargout = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_c_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_nargout), &c1_thisId);
  sf_mex_destroy(&c1_nargout);
  *(real_T *)c1_outData = c1_y;
  sf_mex_destroy(&c1_mxArrayInData);
}

const mxArray *sf_c1_uwb_hw_cosim_kintex_get_eml_resolved_functions_info(void)
{
  const mxArray *c1_nameCaptureInfo;
  c1_ResolvedFunctionInfo c1_info[10];
  c1_ResolvedFunctionInfo (*c1_b_info)[10];
  const mxArray *c1_m0 = NULL;
  int32_T c1_i19;
  c1_ResolvedFunctionInfo *c1_r0;
  c1_nameCaptureInfo = NULL;
  c1_nameCaptureInfo = NULL;
  c1_b_info = (c1_ResolvedFunctionInfo (*)[10])c1_info;
  (*c1_b_info)[0].context = "";
  (*c1_b_info)[0].name = "kron";
  (*c1_b_info)[0].dominantType = "int8";
  (*c1_b_info)[0].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c1_b_info)[0].fileTimeLo = 1286800840U;
  (*c1_b_info)[0].fileTimeHi = 0U;
  (*c1_b_info)[0].mFileTimeLo = 0U;
  (*c1_b_info)[0].mFileTimeHi = 0U;
  (*c1_b_info)[1].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c1_b_info)[1].name = "eml_index_class";
  (*c1_b_info)[1].dominantType = "";
  (*c1_b_info)[1].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_class.m";
  (*c1_b_info)[1].fileTimeLo = 1323148978U;
  (*c1_b_info)[1].fileTimeHi = 0U;
  (*c1_b_info)[1].mFileTimeLo = 0U;
  (*c1_b_info)[1].mFileTimeHi = 0U;
  (*c1_b_info)[2].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c1_b_info)[2].name = "eml_index_times";
  (*c1_b_info)[2].dominantType = "coder.internal.indexInt";
  (*c1_b_info)[2].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_times.m";
  (*c1_b_info)[2].fileTimeLo = 1286800780U;
  (*c1_b_info)[2].fileTimeHi = 0U;
  (*c1_b_info)[2].mFileTimeLo = 0U;
  (*c1_b_info)[2].mFileTimeHi = 0U;
  (*c1_b_info)[3].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_times.m";
  (*c1_b_info)[3].name = "eml_index_class";
  (*c1_b_info)[3].dominantType = "";
  (*c1_b_info)[3].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_class.m";
  (*c1_b_info)[3].fileTimeLo = 1323148978U;
  (*c1_b_info)[3].fileTimeHi = 0U;
  (*c1_b_info)[3].mFileTimeLo = 0U;
  (*c1_b_info)[3].mFileTimeHi = 0U;
  (*c1_b_info)[4].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c1_b_info)[4].name = "eml_scalar_eg";
  (*c1_b_info)[4].dominantType = "int8";
  (*c1_b_info)[4].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_scalar_eg.m";
  (*c1_b_info)[4].fileTimeLo = 1286800796U;
  (*c1_b_info)[4].fileTimeHi = 0U;
  (*c1_b_info)[4].mFileTimeLo = 0U;
  (*c1_b_info)[4].mFileTimeHi = 0U;
  (*c1_b_info)[5].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c1_b_info)[5].name = "eml_int_forloop_overflow_check";
  (*c1_b_info)[5].dominantType = "";
  (*c1_b_info)[5].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m";
  (*c1_b_info)[5].fileTimeLo = 1332147072U;
  (*c1_b_info)[5].fileTimeHi = 0U;
  (*c1_b_info)[5].mFileTimeLo = 0U;
  (*c1_b_info)[5].mFileTimeHi = 0U;
  (*c1_b_info)[6].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_int_forloop_overflow_check.m!eml_int_forloop_overflow_check_helper";
  (*c1_b_info)[6].name = "intmax";
  (*c1_b_info)[6].dominantType = "char";
  (*c1_b_info)[6].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/intmax.m";
  (*c1_b_info)[6].fileTimeLo = 1311237316U;
  (*c1_b_info)[6].fileTimeHi = 0U;
  (*c1_b_info)[6].mFileTimeLo = 0U;
  (*c1_b_info)[6].mFileTimeHi = 0U;
  (*c1_b_info)[7].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c1_b_info)[7].name = "eml_index_plus";
  (*c1_b_info)[7].dominantType = "double";
  (*c1_b_info)[7].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m";
  (*c1_b_info)[7].fileTimeLo = 1286800778U;
  (*c1_b_info)[7].fileTimeHi = 0U;
  (*c1_b_info)[7].mFileTimeLo = 0U;
  (*c1_b_info)[7].mFileTimeHi = 0U;
  (*c1_b_info)[8].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_plus.m";
  (*c1_b_info)[8].name = "eml_index_class";
  (*c1_b_info)[8].dominantType = "";
  (*c1_b_info)[8].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_index_class.m";
  (*c1_b_info)[8].fileTimeLo = 1323148978U;
  (*c1_b_info)[8].fileTimeHi = 0U;
  (*c1_b_info)[8].mFileTimeLo = 0U;
  (*c1_b_info)[8].mFileTimeHi = 0U;
  (*c1_b_info)[9].context =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/kron.m";
  (*c1_b_info)[9].name = "mtimes";
  (*c1_b_info)[9].dominantType = "int8";
  (*c1_b_info)[9].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mtimes.m";
  (*c1_b_info)[9].fileTimeLo = 1289498092U;
  (*c1_b_info)[9].fileTimeHi = 0U;
  (*c1_b_info)[9].mFileTimeLo = 0U;
  (*c1_b_info)[9].mFileTimeHi = 0U;
  sf_mex_assign(&c1_m0, sf_mex_createstruct("nameCaptureInfo", 1, 10), FALSE);
  for (c1_i19 = 0; c1_i19 < 10; c1_i19++) {
    c1_r0 = &c1_info[c1_i19];
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", c1_r0->context, 15,
      0U, 0U, 0U, 2, 1, strlen(c1_r0->context)), "context", "nameCaptureInfo",
                    c1_i19);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", c1_r0->name, 15, 0U,
      0U, 0U, 2, 1, strlen(c1_r0->name)), "name", "nameCaptureInfo", c1_i19);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", c1_r0->dominantType,
      15, 0U, 0U, 0U, 2, 1, strlen(c1_r0->dominantType)), "dominantType",
                    "nameCaptureInfo", c1_i19);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", c1_r0->resolved, 15,
      0U, 0U, 0U, 2, 1, strlen(c1_r0->resolved)), "resolved", "nameCaptureInfo",
                    c1_i19);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", &c1_r0->fileTimeLo,
      7, 0U, 0U, 0U, 0), "fileTimeLo", "nameCaptureInfo", c1_i19);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", &c1_r0->fileTimeHi,
      7, 0U, 0U, 0U, 0), "fileTimeHi", "nameCaptureInfo", c1_i19);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", &c1_r0->mFileTimeLo,
      7, 0U, 0U, 0U, 0), "mFileTimeLo", "nameCaptureInfo", c1_i19);
    sf_mex_addfield(c1_m0, sf_mex_create("nameCaptureInfo", &c1_r0->mFileTimeHi,
      7, 0U, 0U, 0U, 0), "mFileTimeHi", "nameCaptureInfo", c1_i19);
  }

  sf_mex_assign(&c1_nameCaptureInfo, c1_m0, FALSE);
  sf_mex_emlrtNameCapturePostProcessR2012a(&c1_nameCaptureInfo);
  return c1_nameCaptureInfo;
}

static void c1_check_forloop_overflow_error
  (SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance)
{
}

static const mxArray *c1_e_sf_marshallOut(void *chartInstanceVoid, void
  *c1_inData)
{
  const mxArray *c1_mxArrayOutData = NULL;
  int32_T c1_u;
  const mxArray *c1_y = NULL;
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)chartInstanceVoid;
  c1_mxArrayOutData = NULL;
  c1_u = *(int32_T *)c1_inData;
  c1_y = NULL;
  sf_mex_assign(&c1_y, sf_mex_create("y", &c1_u, 6, 0U, 0U, 0U, 0), FALSE);
  sf_mex_assign(&c1_mxArrayOutData, c1_y, FALSE);
  return c1_mxArrayOutData;
}

static int32_T c1_d_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  int32_T c1_y;
  int32_T c1_i20;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_i20, 1, 6, 0U, 0, 0U, 0);
  c1_y = c1_i20;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void c1_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c1_mxArrayInData, const char_T *c1_varName, void *c1_outData)
{
  const mxArray *c1_b_sfEvent;
  const char_T *c1_identifier;
  emlrtMsgIdentifier c1_thisId;
  int32_T c1_y;
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)chartInstanceVoid;
  c1_b_sfEvent = sf_mex_dup(c1_mxArrayInData);
  c1_identifier = c1_varName;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_d_emlrt_marshallIn(chartInstance, sf_mex_dup(c1_b_sfEvent),
    &c1_thisId);
  sf_mex_destroy(&c1_b_sfEvent);
  *(int32_T *)c1_outData = c1_y;
  sf_mex_destroy(&c1_mxArrayInData);
}

static uint8_T c1_e_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_b_is_active_c1_uwb_hw_cosim_kintex, const
  char_T *c1_identifier)
{
  uint8_T c1_y;
  emlrtMsgIdentifier c1_thisId;
  c1_thisId.fIdentifier = c1_identifier;
  c1_thisId.fParent = NULL;
  c1_y = c1_f_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c1_b_is_active_c1_uwb_hw_cosim_kintex), &c1_thisId);
  sf_mex_destroy(&c1_b_is_active_c1_uwb_hw_cosim_kintex);
  return c1_y;
}

static uint8_T c1_f_emlrt_marshallIn(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance, const mxArray *c1_u, const emlrtMsgIdentifier *c1_parentId)
{
  uint8_T c1_y;
  uint8_T c1_u0;
  sf_mex_import(c1_parentId, sf_mex_dup(c1_u), &c1_u0, 1, 3, 0U, 0, 0U, 0);
  c1_y = c1_u0;
  sf_mex_destroy(&c1_u);
  return c1_y;
}

static void init_dsm_address_info(SFc1_uwb_hw_cosim_kintexInstanceStruct
  *chartInstance)
{
}

/* SFunction Glue Code */
void sf_c1_uwb_hw_cosim_kintex_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(347103978U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(119072650U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(135535368U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(561787363U);
}

mxArray *sf_c1_uwb_hw_cosim_kintex_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1,1,5,
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateString("84JkJ4q3DfpOAw6Y0e6zcB");
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,2,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(31);
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
      pr[1] = (double)(64);
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
      pr[1] = (double)(1984);
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

static const mxArray *sf_get_sim_state_info_c1_uwb_hw_cosim_kintex(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x2'type','srcId','name','auxInfo'{{M[1],M[5],T\"Si\",},{M[8],M[0],T\"is_active_c1_uwb_hw_cosim_kintex\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 2, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c1_uwb_hw_cosim_kintex_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
    chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *) ((ChartInfoStruct
      *)(ssGetUserData(S)))->chartInstance;
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (_uwb_hw_cosim_kintexMachineNumber_,
           1,
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
          init_script_number_translation(_uwb_hw_cosim_kintexMachineNumber_,
            chartInstance->chartNumber);
          sf_debug_set_chart_disable_implicit_casting
            (_uwb_hw_cosim_kintexMachineNumber_,chartInstance->chartNumber,1);
          sf_debug_set_chart_event_thresholds(_uwb_hw_cosim_kintexMachineNumber_,
            chartInstance->chartNumber,
            0,
            0,
            0);
          _SFD_SET_DATA_PROPS(0,1,1,0,"Ci");
          _SFD_SET_DATA_PROPS(1,2,0,1,"Si");
          _SFD_SET_DATA_PROPS(2,1,1,0,"deltaL");
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
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,62);
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
          dimVector[1]= 31;
          _SFD_SET_DATA_COMPILED_PROPS(0,SF_INT8,2,&(dimVector[0]),0,0,0,0.0,1.0,
            0,0,(MexFcnForType)c1_c_sf_marshallOut,(MexInFcnForType)NULL);
        }

        {
          unsigned int dimVector[2];
          dimVector[0]= 1;
          dimVector[1]= 1984;
          _SFD_SET_DATA_COMPILED_PROPS(1,SF_INT8,2,&(dimVector[0]),0,0,0,0.0,1.0,
            0,0,(MexFcnForType)c1_sf_marshallOut,(MexInFcnForType)
            c1_sf_marshallIn);
        }

        {
          unsigned int dimVector[2];
          dimVector[0]= 1;
          dimVector[1]= 64;
          _SFD_SET_DATA_COMPILED_PROPS(2,SF_INT8,2,&(dimVector[0]),0,0,0,0.0,1.0,
            0,0,(MexFcnForType)c1_b_sf_marshallOut,(MexInFcnForType)NULL);
        }

        {
          int8_T (*c1_Ci)[31];
          int8_T (*c1_Si)[1984];
          int8_T (*c1_deltaL)[64];
          c1_deltaL = (int8_T (*)[64])ssGetInputPortSignal(chartInstance->S, 1);
          c1_Si = (int8_T (*)[1984])ssGetOutputPortSignal(chartInstance->S, 1);
          c1_Ci = (int8_T (*)[31])ssGetInputPortSignal(chartInstance->S, 0);
          _SFD_SET_DATA_VALUE_PTR(0U, *c1_Ci);
          _SFD_SET_DATA_VALUE_PTR(1U, *c1_Si);
          _SFD_SET_DATA_VALUE_PTR(2U, *c1_deltaL);
        }
      }
    } else {
      sf_debug_reset_current_state_configuration
        (_uwb_hw_cosim_kintexMachineNumber_,chartInstance->chartNumber,
         chartInstance->instanceNumber);
    }
  }
}

static const char* sf_get_instance_specialization()
{
  return "FUNaBuYntr5xC54F6pBuS";
}

static void sf_opaque_initialize_c1_uwb_hw_cosim_kintex(void *chartInstanceVar)
{
  chart_debug_initialization(((SFc1_uwb_hw_cosim_kintexInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c1_uwb_hw_cosim_kintex
    ((SFc1_uwb_hw_cosim_kintexInstanceStruct*) chartInstanceVar);
  initialize_c1_uwb_hw_cosim_kintex((SFc1_uwb_hw_cosim_kintexInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_enable_c1_uwb_hw_cosim_kintex(void *chartInstanceVar)
{
  enable_c1_uwb_hw_cosim_kintex((SFc1_uwb_hw_cosim_kintexInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_disable_c1_uwb_hw_cosim_kintex(void *chartInstanceVar)
{
  disable_c1_uwb_hw_cosim_kintex((SFc1_uwb_hw_cosim_kintexInstanceStruct*)
    chartInstanceVar);
}

static void sf_opaque_gateway_c1_uwb_hw_cosim_kintex(void *chartInstanceVar)
{
  sf_c1_uwb_hw_cosim_kintex((SFc1_uwb_hw_cosim_kintexInstanceStruct*)
    chartInstanceVar);
}

extern const mxArray* sf_internal_get_sim_state_c1_uwb_hw_cosim_kintex(SimStruct*
  S)
{
  ChartInfoStruct *chartInfo = (ChartInfoStruct*) ssGetUserData(S);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[4];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_raw2high");
  prhs[1] = mxCreateDoubleScalar(ssGetSFuncBlockHandle(S));
  prhs[2] = (mxArray*) get_sim_state_c1_uwb_hw_cosim_kintex
    ((SFc1_uwb_hw_cosim_kintexInstanceStruct*)chartInfo->chartInstance);/* raw sim ctx */
  prhs[3] = (mxArray*) sf_get_sim_state_info_c1_uwb_hw_cosim_kintex();/* state var info */
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

extern void sf_internal_set_sim_state_c1_uwb_hw_cosim_kintex(SimStruct* S, const
  mxArray *st)
{
  ChartInfoStruct *chartInfo = (ChartInfoStruct*) ssGetUserData(S);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[4];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_high2raw");
  prhs[1] = mxCreateDoubleScalar(ssGetSFuncBlockHandle(S));
  prhs[2] = mxDuplicateArray(st);      /* high level simctx */
  prhs[3] = (mxArray*) sf_get_sim_state_info_c1_uwb_hw_cosim_kintex();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 4, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  mxDestroyArray(prhs[3]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_high2raw'.\n");
  }

  set_sim_state_c1_uwb_hw_cosim_kintex((SFc1_uwb_hw_cosim_kintexInstanceStruct*)
    chartInfo->chartInstance, mxDuplicateArray(plhs[0]));
  mxDestroyArray(plhs[0]);
}

static const mxArray* sf_opaque_get_sim_state_c1_uwb_hw_cosim_kintex(SimStruct*
  S)
{
  return sf_internal_get_sim_state_c1_uwb_hw_cosim_kintex(S);
}

static void sf_opaque_set_sim_state_c1_uwb_hw_cosim_kintex(SimStruct* S, const
  mxArray *st)
{
  sf_internal_set_sim_state_c1_uwb_hw_cosim_kintex(S, st);
}

static void sf_opaque_terminate_c1_uwb_hw_cosim_kintex(void *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc1_uwb_hw_cosim_kintexInstanceStruct*) chartInstanceVar
      )->S;
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
    }

    finalize_c1_uwb_hw_cosim_kintex((SFc1_uwb_hw_cosim_kintexInstanceStruct*)
      chartInstanceVar);
    free((void *)chartInstanceVar);
    ssSetUserData(S,NULL);
  }

  unload_uwb_hw_cosim_kintex_optimization_info();
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc1_uwb_hw_cosim_kintex((SFc1_uwb_hw_cosim_kintexInstanceStruct*)
    chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c1_uwb_hw_cosim_kintex(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  if (sf_machine_global_initializer_called()) {
    initialize_params_c1_uwb_hw_cosim_kintex
      ((SFc1_uwb_hw_cosim_kintexInstanceStruct*)(((ChartInfoStruct *)
         ssGetUserData(S))->chartInstance));
  }
}

static void mdlSetWorkWidths_c1_uwb_hw_cosim_kintex(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    mxArray *infoStruct = load_uwb_hw_cosim_kintex_optimization_info();
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(S,sf_get_instance_specialization(),infoStruct,
      1);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,sf_rtw_info_uint_prop(S,sf_get_instance_specialization(),
                infoStruct,1,"RTWCG"));
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop(S,
      sf_get_instance_specialization(),infoStruct,1,
      "gatewayCannotBeInlinedMultipleTimes"));
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,sf_get_instance_specialization(),
        infoStruct,1,2);
      sf_mark_chart_reusable_outputs(S,sf_get_instance_specialization(),
        infoStruct,1,1);
    }

    sf_set_rtw_dwork_info(S,sf_get_instance_specialization(),infoStruct,1);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(4035871812U));
  ssSetChecksum1(S,(3890229200U));
  ssSetChecksum2(S,(994396620U));
  ssSetChecksum3(S,(2287067365U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
  ssSupportsMultipleExecInstances(S,1);
}

static void mdlRTW_c1_uwb_hw_cosim_kintex(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c1_uwb_hw_cosim_kintex(SimStruct *S)
{
  SFc1_uwb_hw_cosim_kintexInstanceStruct *chartInstance;
  chartInstance = (SFc1_uwb_hw_cosim_kintexInstanceStruct *)malloc(sizeof
    (SFc1_uwb_hw_cosim_kintexInstanceStruct));
  memset(chartInstance, 0, sizeof(SFc1_uwb_hw_cosim_kintexInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.terminateChart =
    sf_opaque_terminate_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.enableChart = sf_opaque_enable_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.mdlStart = mdlStart_c1_uwb_hw_cosim_kintex;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c1_uwb_hw_cosim_kintex;
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

void c1_uwb_hw_cosim_kintex_method_dispatcher(SimStruct *S, int_T method, void
  *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c1_uwb_hw_cosim_kintex(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c1_uwb_hw_cosim_kintex(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c1_uwb_hw_cosim_kintex(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c1_uwb_hw_cosim_kintex_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}

// Copyright (c) 2019 The Chromium Embedded Framework Authors. All rights
// reserved. Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.
//
// ---------------------------------------------------------------------------
//
// This file was generated by the CEF translator tool. If making changes by
// hand only do so within the body of existing method and function
// implementations. See the translator.README.txt file in the tools directory
// for more information.
//
// $hash=2b46b666c9d57fb722a9b4c2650a99042a4e558e$
//

#ifndef CEF_LIBCEF_DLL_CTOCPP_PRINT_SETTINGS_CTOCPP_H_
#define CEF_LIBCEF_DLL_CTOCPP_PRINT_SETTINGS_CTOCPP_H_
#pragma once

#if !defined(WRAPPING_CEF_SHARED)
#error This file can be included wrapper-side only
#endif

#include "include/capi/cef_print_settings_capi.h"
#include "include/cef_print_settings.h"
#include "libcef_dll/ctocpp/ctocpp_ref_counted.h"

// Wrap a C structure with a C++ class.
// This class may be instantiated and accessed wrapper-side only.
class CefPrintSettingsCToCpp
    : public CefCToCppRefCounted<CefPrintSettingsCToCpp,
                                 CefPrintSettings,
                                 cef_print_settings_t> {
 public:
  CefPrintSettingsCToCpp();

  // CefPrintSettings methods.
  bool IsValid() OVERRIDE;
  bool IsReadOnly() OVERRIDE;
  CefRefPtr<CefPrintSettings> Copy() OVERRIDE;
  void SetOrientation(bool landscape) OVERRIDE;
  bool IsLandscape() OVERRIDE;
  void SetPrinterPrintableArea(const CefSize& physical_size_device_units,
                               const CefRect& printable_area_device_units,
                               bool landscape_needs_flip) OVERRIDE;
  void SetDeviceName(const CefString& name) OVERRIDE;
  CefString GetDeviceName() OVERRIDE;
  void SetDPI(int dpi) OVERRIDE;
  int GetDPI() OVERRIDE;
  void SetPageRanges(const PageRangeList& ranges) OVERRIDE;
  size_t GetPageRangesCount() OVERRIDE;
  void GetPageRanges(PageRangeList& ranges) OVERRIDE;
  void SetSelectionOnly(bool selection_only) OVERRIDE;
  bool IsSelectionOnly() OVERRIDE;
  void SetCollate(bool collate) OVERRIDE;
  bool WillCollate() OVERRIDE;
  void SetColorModel(ColorModel model) OVERRIDE;
  ColorModel GetColorModel() OVERRIDE;
  void SetCopies(int copies) OVERRIDE;
  int GetCopies() OVERRIDE;
  void SetDuplexMode(DuplexMode mode) OVERRIDE;
  DuplexMode GetDuplexMode() OVERRIDE;
};

#endif  // CEF_LIBCEF_DLL_CTOCPP_PRINT_SETTINGS_CTOCPP_H_

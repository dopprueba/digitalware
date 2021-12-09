unit DopServidorDCom_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 8/12/2021 10:08:25 p. m. from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Dop Proy\ProyMultiCapa\ProyServidorDcom\DopServidorDCom (1)
// LIBID: {FD7F339D-F1AC-462F-9826-6A3E8A9ED88A}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (midas.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, Midas, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  DopServidorDComMajorVersion = 1;
  DopServidorDComMinorVersion = 0;

  LIBID_DopServidorDCom: TGUID = '{FD7F339D-F1AC-462F-9826-6A3E8A9ED88A}';

  IID_IServidorDCom: TGUID = '{1516CF5B-3AB0-4E2D-B806-406AC8F44568}';
  CLASS_ServidorDCom: TGUID = '{D09B6709-AA0A-43E4-A13D-EAD183B45958}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IServidorDCom = interface;
  IServidorDComDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  ServidorDCom = IServidorDCom;


// *********************************************************************//
// Interface: IServidorDCom
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1516CF5B-3AB0-4E2D-B806-406AC8F44568}
// *********************************************************************//
  IServidorDCom = interface(IAppServer)
    ['{1516CF5B-3AB0-4E2D-B806-406AC8F44568}']
    function grabar(input: OleVariant; var menssalida: OleVariant): SYSINT; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IServidorDComDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1516CF5B-3AB0-4E2D-B806-406AC8F44568}
// *********************************************************************//
  IServidorDComDisp = dispinterface
    ['{1516CF5B-3AB0-4E2D-B806-406AC8F44568}']
    function grabar(input: OleVariant; var menssalida: OleVariant): SYSINT; dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer;
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer;
                           Options: Integer; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoServidorDCom provides a Create and CreateRemote method to
// create instances of the default interface IServidorDCom exposed by
// the CoClass ServidorDCom. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoServidorDCom = class
    class function Create: IServidorDCom;
    class function CreateRemote(const MachineName: string): IServidorDCom;
  end;

implementation

uses System.Win.ComObj;

class function CoServidorDCom.Create: IServidorDCom;
begin
  Result := CreateComObject(CLASS_ServidorDCom) as IServidorDCom;
end;

class function CoServidorDCom.CreateRemote(const MachineName: string): IServidorDCom;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServidorDCom) as IServidorDCom;
end;

end.


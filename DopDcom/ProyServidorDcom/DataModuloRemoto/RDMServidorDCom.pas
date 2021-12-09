unit RDMServidorDCom;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  System.IniFiles,
  System.Math,
  Vcl.Forms, Variants,
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, DopServidorDCom_TLB, StdVcl,
  Data.FMTBcd, Data.DB, Data.DBXCommon, Data.SqlExpr,
  Datasnap.Provider, Data.DBXMSSQL;

type
  TServidorDCom = class(TRemoteDataModule, IServidorDCom)
    sqlqBuscaTodo: TSQLQuery;
    dspBuscaTodo: TDataSetProvider;
    sqlConnect: TSQLConnection;
    sqlqDinamico: TSQLQuery;
    dspDinamico: TDataSetProvider;
    procedure RemoteDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
      var
        trans: TDBXTransaction;

      function conectar(sqlConn: TSQLConnection; driver, server: string; database, user, password,
        libName, libVendor: string; var mens: string): Boolean;
      function obtenerFecha(): string;
      procedure transStar();
      procedure transCommit();
      procedure transRollback();

      procedure variantToStringlist(const datos: OleVariant; list: TStrings);
      procedure variantToStream(const datos: OleVariant; stream: TStream);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function grabar(input: OleVariant; var menssalida: OleVariant): Integer; stdcall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses VistaMenu;

function TServidorDCom.conectar(sqlConn: TSQLConnection; driver, server: string; database, user,
  password, libName, libVendor: string; var mens: string): Boolean;
begin
  //driver := 'Firebird', 'MSSQL'
  //LibraryName := 'dbxfb.dll', dbxmss.dll
  //VendorLib := 'fbclient.dll', sqlncli10.dll

  Result := False; //Suponer que no se puede conectar.

  try
    With sqlConn do
    begin
      if Connected then
        Connected := False;

      DriverName := driver;
      Params.Clear;
      Params.Values['HostName'] := server;
      //Params.Values['Database'] := server +':'+ database;
      Params.Values['Database'] := database;
      Params.Values['User_Name'] := user;
      Params.Values['Password'] := password;
      Params.Values['LibraryName'] := libName;
      Params.Values['VendorLib'] := libVendor;

      Connected := True;
    end;

    Result := True;
  except
    on E: Exception do
    begin
      mens := E.Message;
    end;
  end;
end;

function TServidorDCom.obtenerFecha: string;
begin
  Result := FormatDateTime('yyyy/MM/dd HH:mm:ss', Now);
end;

procedure TServidorDCom.RemoteDataModuleCreate(Sender: TObject);
var
  dirAplic, mens, aux: string;
  dbDriver, dbServer, dbName, dbUser, dbPassword, dbLibName, dbLibProv: string;
  strList: TStringList;
  ini: TIniFile;
begin
  dirAplic := ExtractFilePath(Application.ExeName);
  strList := TStringList.Create;
  strList.NameValueSeparator := '=';

  try
    ini := TIniFile.Create(dirAplic + 'config.ini');

    // Archivo de config.
    dbDriver := ini.ReadString('DB', 'driver', 'XXXDRIVER');
    dbServer := ini.ReadString('DB', 'servidor', 'LOCALHOST');
    dbName := ini.ReadString('DB', 'nombre', 'XXXDB');
    dbUser := ini.ReadString('DB', 'usuario', 'XXXUSUARIO');
    dbPassword := ini.ReadString('DB', 'clave', 'XXXCLAVE');
    dbLibName := ini.ReadString('DB', 'libreriaNombre', 'XXXLIBNAME');
    dbLibProv := ini.ReadString('DB', 'libreriaProv', 'XXXLIBPROV');

    strList.Add(Concat(obtenerFecha(), Chr(9), 'DB. Iniciar conexión.'));
    if conectar(SQLConnect, dbDriver, dbServer, dbName, dbUser, dbPassword,
      dbLibName, dbLibProv, mens) then
    begin
      strList.Add(Concat(obtenerFecha(), Chr(9), 'DB. Conectado.'));
    end
    else
    begin
      strList.Add(Concat(obtenerFecha(), Chr(9), 'DB. Error: ', mens));
    end;
  except
    on E: Exception do
    begin
      strList.Add(Concat(obtenerFecha(), Chr(9), 'sql server, ', E.Message));
    end;
  end;

  strList.SaveToFile(dirAplic + 'log_' +
    FormatDateTime('yyyyMMdd_HHmmss', Now) + '.txt');
  strList.Free;
end;

procedure TServidorDCom.transCommit;
begin
  SQLConnect.CommitFreeAndNil(trans);
end;

procedure TServidorDCom.transRollback;
begin
  SQLConnect.RollbackFreeAndNil(trans);
end;

procedure TServidorDCom.transStar;
begin
  trans := SQLConnect.BeginTransaction;
end;

class procedure TServidorDCom.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TServidorDCom.variantToStream(const datos: OleVariant;
  stream: TStream);
var
  p: Pointer;
begin
  p := VarArrayLock(datos);

  try
    Stream.Write(p^, VarArrayHighBound(datos, 1) + 1); //assuming low bound = 0.
  finally
    VarArrayUnlock(datos);
  end;
end;

procedure TServidorDCom.variantToStringlist(const datos: OleVariant;
  list: TStrings);
var
  stream: TStream;
begin
  stream := TMemoryStream.Create;

  try
    VariantToStream(datos, stream);
    stream.Seek(0, soFromBeginning);
    list.LoadFromStream(stream);
  finally
    stream.Free;
  end;
end;

function TServidorDCom.grabar(input: OleVariant; var menssalida: OleVariant): integer;
var
  aux: Integer;
  list: TStringList;
begin
  Result := 1; //Suponer error.
  list := TStringList.Create;

  try
    variantToStringlist(input, list);
    transStar();

    with sqlqDinamico do
    begin
      Close;
      SQL.Clear;
      SQL.Add('exec cliente_crear :ident, :tipoIdent, :nomb, :nombRep, ');
      SQL.Add('  :telef, :email, :nombCont, :vrActivo, :vrPasivo, :vrPatrim ');
      ParamByName('ident').AsString := list[0];
      ParamByName('tipoIdent').AsString := list[1];
      ParamByName('nomb').AsString := list[2];
      ParamByName('nombRep').AsString := list[3];
      ParamByName('telef').AsString := list[4];
      ParamByName('email').AsString := list[5];
      ParamByName('nombCont').AsString := list[6];
      ParamByName('vrActivo').AsCurrency := StrToCurr(list[7]);
      ParamByName('vrPasivo').AsCurrency := StrToCurr(list[8]);
      ParamByName('vrPatrim').AsCurrency := StrToCurr(list[9]);
      ExecSQL;
    end;

    transCommit();
    menssalida := 'OK';
    Result := 0;
  except
    on E: Exception do
    begin
      transRollback();
      menssalida := Concat(Self.ClassName,  ' (grabar): ', E.Message);
    end;
  end;

  list.Free;
end;

initialization
  TComponentFactory.Create(ComServer, TServidorDCom,
    Class_ServidorDCom, ciMultiInstance, tmApartment);
end.

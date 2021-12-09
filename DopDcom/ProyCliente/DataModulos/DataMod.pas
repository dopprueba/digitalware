unit DataMod;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect;

{
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect, Datasnap.Win.SConnect, Soap.SOAPConn;
}

type
  TDataMod1 = class(TDataModule)
    cds: TClientDataSet;
    ds: TDataSource;
    DCOMConnect: TDCOMConnection;
    cdsDinam: TClientDataSet;
    dsDinam: TDataSource;
    cdsid: TIntegerField;
    cdsidentif: TStringField;
    cdstipo_identif: TStringField;
    cdsnombre: TStringField;
    cdsnombre_repres_legal: TStringField;
    cdstelefono: TStringField;
    cdsemail: TStringField;
    cdsnombre_contacto: TStringField;
    cdsvr_activo: TFMTBCDField;
    cdsvr_pasivo: TFMTBCDField;
    cdsvr_patrim: TFMTBCDField;
    cdsDinamid: TIntegerField;
    cdsDinamidentif: TStringField;
    cdsDinamtipo_identif: TStringField;
    cdsDinamnombre: TStringField;
    cdsDinamnombre_repres_legal: TStringField;
    cdsDinamtelefono: TStringField;
    cdsDinamemail: TStringField;
    cdsDinamnombre_contacto: TStringField;
    cdsDinamvr_activo: TFMTBCDField;
    cdsDinamvr_pasivo: TFMTBCDField;
    cdsDinamvr_patrim: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    function mostrarDcomEstadoConex(): string;
    procedure cargarTextoSql(textoSql: string);
  end;

var
  DataMod1: TDataMod1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataMod1 }

procedure TDataMod1.cargarTextoSql(textoSql: string);
begin
  cdsDinam.CommandText := '';
  cdsDinam.CommandText := textoSql;
end;

function TDataMod1.mostrarDcomEstadoConex;
begin
  if DCOMConnect.Connected then
    Result := 'Desconectar'
  else
    Result := 'Conectar'

end;


end.

unit VistaConsultar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons;

type
  TFVistaConsultar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbg: TDBGrid;
    ds: TDataSource;
    btnAceptar: TBitBtn;
    btnSalir: TBitBtn;
    labCant: TLabel;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function mostrar(): Boolean;
    procedure limpiar();
    procedure cerrar();
  end;

var
  FVistaConsultar: TFVistaConsultar;

implementation

{$R *.dfm}

uses DataMod;

{ TFVistaConsultar }

procedure TFVistaConsultar.btnAceptarClick(Sender: TObject);
begin
  if not dbg.DataSource.DataSet.IsEmpty then
    ModalResult := mrOk;
end;

procedure TFVistaConsultar.btnSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFVistaConsultar.cerrar;
begin
  FVistaConsultar.ds.DataSet.Close;
end;

procedure TFVistaConsultar.limpiar;
begin
  if FVistaConsultar.ds.DataSet.Active then
    TClientDataSet(FVistaConsultar.ds.DataSet).EmptyDataSet;
end;

function TFVistaConsultar.mostrar(): Boolean;
begin
  Result := False;

  dbg.DataSource := nil;
  ds.DataSet.Close;
  ds.DataSet.Open;
  labCant.Caption := Format('Cant: %d', [ds.DataSet.RecordCount]);

  if ds.DataSet.IsEmpty then
  begin
    ShowMessage('Consulta sin datos.');
  end
  else
  begin
    dbg.DataSource := ds;

    if ShowModal = mrOk then
    begin
      dbg.DataSource := nil;
      Result := True;
    end;
  end;
end;

end.

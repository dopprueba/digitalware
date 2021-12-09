unit VistaConfigDcom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFVistaConfigDcom = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    editDcomComputerName: TEdit;
    Label3: TLabel;
    editDcomServerGuid: TEdit;
    Label2: TLabel;
    editDcomServerName: TEdit;
    Panel2: TPanel;
    btnConectar: TBitBtn;
    btnSalir: TBitBtn;
    btnCompName: TBitBtn;
    btnServerGuid: TBitBtn;
    btnServerName: TBitBtn;
    procedure btnConectarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnCompNameClick(Sender: TObject);
    procedure btnServerGuidClick(Sender: TObject);
    procedure btnServerNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function conectar(): Boolean;
  end;

var
  FVistaConfigDcom: TFVistaConfigDcom;

implementation

{$R *.dfm}

uses DataMod;

procedure TFVistaConfigDcom.btnCompNameClick(Sender: TObject);
begin
  DataMod1.DCOMConnect.ComputerName := editDcomComputerName.Text;
end;

procedure TFVistaConfigDcom.btnConectarClick(Sender: TObject);
begin
  conectar();
end;

procedure TFVistaConfigDcom.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFVistaConfigDcom.btnServerGuidClick(Sender: TObject);
begin
  DataMod1.DCOMConnect.ServerGUID := editDcomServerGuid.Text;
end;

procedure TFVistaConfigDcom.btnServerNameClick(Sender: TObject);
begin
  DataMod1.DCOMConnect.ServerName := editDcomServerName.Text;
end;

function TFVistaConfigDcom.conectar: Boolean;
begin
  //Desar1-DXE4
  //ServidorDatosP1.ServidorDCOM
  //Desar1-DXE4.ServidorDatosP1.ServidorDCOM
  Result := False;

  DataMod1.DCOMConnect.Connected := not DataMod1.DCOMConnect.Connected;
  btnConectar.Caption := DataMod1.mostrarDcomEstadoConex();

  if DataMod1.DCOMConnect.Connected then
    Result := True;
end;

end.

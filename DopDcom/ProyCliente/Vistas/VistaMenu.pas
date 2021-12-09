unit VistaMenu;

interface

uses
  Midaslib,
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TFVistaMenu = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConfigDCom: TBitBtn;
    mostrarClienteBtn: TBitBtn;
    btnSalir: TBitBtn;
    Memo1: TMemo;
    procedure mostrarClienteBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfigDComClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVistaMenu: TFVistaMenu;

implementation

{$R *.dfm}

uses DataMod, VistaCliente, VistaConfigDcom;

procedure TFVistaMenu.btnConfigDComClick(Sender: TObject);
begin
  FVistaConfigDcom.ShowModal;
end;

procedure TFVistaMenu.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFVistaMenu.FormCreate(Sender: TObject);
begin
  Caption := Concat(Application.Title, ' v20210628');
end;

procedure TFVistaMenu.FormShow(Sender: TObject);
begin
  if FVistaConfigDcom.conectar() then
    FVistaCliente.Show;
end;

procedure TFVistaMenu.mostrarClienteBtnClick(Sender: TObject);
begin
  FVistaCliente.Show;
end;

end.

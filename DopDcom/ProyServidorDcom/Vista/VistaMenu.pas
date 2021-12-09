unit VistaMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    btnSalir: TBitBtn;
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses RDMServidorDCom;

procedure TForm1.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := Concat(Application.Title, ' v20210628');

  Memo1.Lines.Add('Aplic Servidor (DCom), Módulo Datos Remoto y Conex DB.');
  Memo1.Lines.Add(FormatDateTime('yyyy/mm/dd HH:mm:ss', Now));
end;

end.

unit VistaMenu;

interface

uses
  System.Math,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFVistaMenu = class(TForm)
    Panel1: TPanel;
    edtNro: TEdit;
    memoSerie: TMemo;
    Label1: TLabel;
    Panel2: TPanel;
    btnCalcular: TBitBtn;
    btnSalir: TBitBtn;
    procedure btnCalcularClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure serieFibonacci(nro2, nro1, nro: integer);
  end;

var
  FVistaMenu: TFVistaMenu;

implementation

{$R *.dfm}

{ TFVistaMenu }

procedure TFVistaMenu.btnCalcularClick(Sender: TObject);
var
  aux: Integer;
begin
  memoSerie.Clear;
  Application.ProcessMessages;

  if edtNro.Text = '' then
  begin
    ShowMessage('Digite nro.');
  end
  else
  begin
    aux := strToint(edtNro.Text);

    if InRange(aux, 1, 20) then
      serieFibonacci(0, 1, aux)
    else
      ShowMessage('Digite nro entre 1 y 20');
  end;

  edtNro.SetFocus;
end;

procedure TFVistaMenu.btnSalirClick(Sender: TObject);
begin
  Close;
end;


procedure TFVistaMenu.serieFibonacci(nro2, nro1, nro: integer);
var
  actual: integer;
begin
  if length(memoSerie.Text) > 0 then
    memoSerie.Lines.Text := memoSerie.Text + ', ' + intTostr(nro1)
  else
    memoSerie.Lines.Text := intTostr(nro1);

  if nro > 1 then
  begin
    actual := nro2 + nro1;
    nro := nro - 1;
    serieFibonacci(nro1, actual, nro);
  end;
end;

end.

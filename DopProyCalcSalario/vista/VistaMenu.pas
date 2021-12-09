unit VistaMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnCalcular: TBitBtn;
    btnSalir: TBitBtn;
    Label1: TLabel;
    edtNomb: TEdit;
    Label2: TLabel;
    edtHorasTrab: TEdit;
    Memo1: TMemo;
    procedure btnSalirClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
    function calcSalario(ht: Real): Real;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnCalcularClick(Sender: TObject);
var
  aux: Real;
begin
  if (length(edtNomb.Text) > 0) and (length(edtHorasTrab.Text) > 0) then
  begin
    Memo1.Lines.Clear;
    aux := StrToFloat(edtHorasTrab.Text);
    aux := calcSalario(aux);
    Memo1.Text := Format('Al empleado %s se le debe pagar la suma de %m pesos',
      [edtNomb.Text, aux]);
  end
  else
  begin
    showMessage('Faltan datos por digigar.');
  end;
end;

procedure TForm2.btnSalirClick(Sender: TObject);
begin
  Close;
end;

function TForm2.calcSalario(ht: Real): Real;
const
  TOP_HORAS_TRAB = 35;
  VR_HORA_NORMAL = 15000;
  VR_HORA_EXTRA = 19000;
var
  cantHorasExt: Real;
begin
  cantHorasExt := ht - TOP_HORAS_TRAB;

  if cantHorasExt > 0 then
    Result := (VR_HORA_NORMAL * TOP_HORAS_TRAB) + (VR_HORA_EXTRA * cantHorasExt)
  else
    Result := (VR_HORA_NORMAL * ht);
end;

end.

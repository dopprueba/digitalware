program DopServidorDCom;

uses
  Vcl.Forms,
  VistaMenu in 'Vista\VistaMenu.pas' {Form1},
  DopServidorDCom_TLB in 'DopServidorDCom_TLB.pas',
  RDMServidorDCom in 'DataModuloRemoto\RDMServidorDCom.pas' {ServidorDCom: TRemoteDataModule} {ServidorDCom: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

program DopCliente;

uses
  Vcl.Forms,
  VistaCliente in 'vistas\VistaCliente.pas' {FVistaCliente},
  DataMod in 'DataModulos\DataMod.pas' {DataMod1: TDataModule},
  VistaMenu in 'Vistas\VistaMenu.pas' {FVistaMenu},
  VistaConsultar in 'Vistas\VistaConsultar.pas' {FVistaConsultar},
  VistaConfigDcom in 'Vistas\VistaConfigDcom.pas' {FVistaConfigDcom};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFVistaMenu, FVistaMenu);
  Application.CreateForm(TDataMod1, DataMod1);
  Application.CreateForm(TFVistaCliente, FVistaCliente);
  Application.CreateForm(TFVistaConsultar, FVistaConsultar);
  Application.CreateForm(TFVistaConfigDcom, FVistaConfigDcom);
  Application.Run;
end.

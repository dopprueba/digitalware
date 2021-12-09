unit VistaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TFVistaCliente = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    btnEditar: TBitBtn;
    btnBorrar: TBitBtn;
    btnLimpiar: TBitBtn;
    btnSalir: TBitBtn;
    edtIdentif: TEdit;
    edtNomb: TEdit;
    edtNombRepresLegal: TEdit;
    edtTelef: TEdit;
    edtEmail: TEdit;
    btnBuscar: TSpeedButton;
    cbTipoIdentif: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNombCont: TEdit;
    Label7: TLabel;
    edtVrActivo: TEdit;
    Label8: TLabel;
    edtVrPasivo: TEdit;
    Label9: TLabel;
    edtVrPatrim: TEdit;
    btnGrabar: TBitBtn;
    cdsTipoIdentif: TClientDataSet;
    cdsTipoIdentifCod: TStringField;
    cdsTipoIdentifNomb: TStringField;
    procedure btnSalirClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure edtIdentifExit(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
  private
    { Private declarations }
    function stringlistToVariant(list: TStrings): OleVariant;
    function streamToVariant(stream: TStream): OleVariant;

    procedure crearTipoIdentif();
    procedure cargarTipoIdentif();

    procedure setEnabled(ecampos: Array of TComponent; eopcion: Boolean);
    procedure limpiar(todo: Boolean); overload;
    procedure limpiar(ecampos: Array of TComponent); overload;
    function validarLlenos(ecampos: Array Of TComponent): Boolean;
  public
    { Public declarations }
    id: Integer;
    procedure desactivarBotones();
    procedure llenarCds(identif: string);
    function aplicarCambios(): Boolean;
  end;

var
  FVistaCliente: TFVistaCliente;

implementation

{$R *.dfm}

uses DataMod, VistaConsultar;

const
  DIALOG_ERROR = 'Error.';
  DIALOG_FD = 'Faltan datos por digitar.';

function TFVistaCliente.aplicarCambios(): Boolean;
var
  cantError: Integer;
begin
  Result := False; //Suponer error.

  cantError := DataMod1.cdsDinam.ApplyUpdates(0);

  if cantError = 0 then
  begin
    btnLimpiar.OnClick(btnLimpiar);
    Result := True;
  end
  else
  begin
    ShowMessage(Concat(DIALOG_ERROR, ' ', IntToStr(cantError)));
  end;
end;

procedure TFVistaCliente.btnLimpiarClick(Sender: TObject);
begin
  limpiar(True);
  desactivarBotones();

  if Sender <> nil then
  begin
    if Sender is TBitBtn then
    begin
      edtIdentif.SetFocus;
    end;
  end;
end;

procedure TFVistaCliente.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFVistaCliente.cargarTipoIdentif;
begin
  cdsTipoIdentif.First;
  while not cdsTipoIdentif.Eof do
  begin
    cbTipoIdentif.Items.Add(cdsTipoIdentifNomb.AsString);

    cdsTipoIdentif.Next;
  end;
end;

procedure TFVistaCliente.crearTipoIdentif;
begin
  cdsTipoIdentif.AppendRecord(['RC', 'Registro Civil']);
  cdsTipoIdentif.AppendRecord(['TI', 'Tarjeta Identidad']);
  cdsTipoIdentif.AppendRecord(['CC', 'Cédula Ciudadanía']);
  cdsTipoIdentif.AppendRecord(['PA', 'Pasaporte']);
  cdsTipoIdentif.AppendRecord(['MSI', 'Menor Sin Identificación']);
  cdsTipoIdentif.AppendRecord(['ASI', 'Adulto Sin Identificación']);
end;

procedure TFVistaCliente.desactivarBotones;
begin
  setEnabled([btnGrabar, btnEditar, btnBorrar], False);
end;

procedure TFVistaCliente.btnBorrarClick(Sender: TObject);
begin
  if validarLlenos([edtIdentif]) then
  begin
    DataMod1.cdsDinam.Delete;
    aplicarCambios();
  end
  else
  begin
    ShowMessage(DIALOG_FD);
  end;
end;

procedure TFVistaCliente.btnBuscarClick(Sender: TObject);
begin
  FVistaConsultar.ds.DataSet.Close;

  if FVistaConsultar.mostrar() then
  begin
    edtIdentif.SetFocus;
    edtIdentif.Text := DataMod1.cdsidentif.AsString;
    SelectNext(ActiveControl, True, True);
  end;

  FVistaConsultar.limpiar();
  FVistaConsultar.cerrar();
end;

procedure TFVistaCliente.btnEditarClick(Sender: TObject);
begin
  if validarLlenos([edtIdentif, cbTipoIdentif, edtNomb, edtVrActivo,
    edtVrPasivo, edtVrPatrim]) then
  begin
    llenarCds(edtIdentif.Text);
    aplicarCambios();
  end
  else
  begin
    ShowMessage(DIALOG_FD);
  end;
end;

procedure TFVistaCliente.btnGrabarClick(Sender: TObject);
var
  r: SmallInt;
  list: TStringList;
  ov: OleVariant;
  mensSalida: Variant;
  tipoIdent: string;
begin
  if validarLlenos([edtIdentif, cbTipoIdentif, edtNomb, edtVrActivo,
    edtVrPasivo, edtVrPatrim]) then
  begin
    //Obtener tipo ident.
    cdsTipoIdentif.RecNo := cbTipoIdentif.ItemIndex + 1;
    tipoIdent := cdsTipoIdentifCod.AsString;

    //Agregar datos a la lista.
    list := TStringList.Create;
    list.Add(edtIdentif.Text);
    list.Add(tipoIdent);
    list.Add(edtNomb.Text);
    list.Add(edtNombRepresLegal.Text);
    list.Add(edtTelef.Text);
    list.Add(edtEmail.Text);
    list.Add(edtNombCont.Text);
    list.Add(edtVrActivo.Text);
    list.Add(edtVrPasivo.Text);
    list.Add(edtVrPatrim.Text);

    try
      ov := stringlistToVariant(list);
      r := DataMod1.DCOMConnect.AppServer.grabar(ov, mensSalida);

      if r = 0 then
      begin
        btnLimpiar.OnClick(btnLimpiar);
      end
      else
      begin
        ShowMessage(Concat(DIALOG_ERROR, ' ', mensSalida));
      end;
    except
      on E: Exception do
      begin
        ShowMessage(Concat(DIALOG_ERROR, ' ', E.Message));
      end;
    end;

    list.Free;
  end
  else
  begin
    ShowMessage(DIALOG_FD);
  end;
end;

procedure TFVistaCliente.edtIdentifExit(Sender: TObject);
var
  r: ShortInt;
begin
  tedit(Sender).Text := Trim(tedit(Sender).Text);
  limpiar(False);
  desactivarBotones();

  if tedit(Sender).Text <> '' then
  begin
    try
      DataMod1.cdsDinam.Close;
      DataMod1.cargarTextoSql('select * from cliente where identif = :p0');
      DataMod1.cdsDinam.Params[0].AsString := edtIdentif.Text;
      DataMod1.cdsDinam.Open;

      if DataMod1.cdsDinam.IsEmpty then
      begin
        btnGrabar.Enabled := True;
      end
      else
      begin
        id := DataMod1.cdsDinamid.AsInteger;

        if cdsTipoIdentif.Locate(cdsTipoIdentifCod.FieldName,
          DataMod1.cdsDinamtipo_identif.AsString, [loCaseInsensitive]) then
        begin
          cbTipoIdentif.ItemIndex := cdsTipoIdentif.RecNo - 1;
        end;

        edtNomb.Text := DataMod1.cdsDinamnombre.AsString;
        edtNombRepresLegal.Text := DataMod1.cdsDinamnombre_repres_legal.AsString;
        edtTelef.Text := DataMod1.cdsDinamtelefono.AsString;
        edtEmail.Text := DataMod1.cdsDinamemail.AsString;
        edtNombCont.Text := DataMod1.cdsDinamnombre_contacto.AsString;
        edtVrActivo.Text := DataMod1.cdsDinamvr_activo.AsString;
        edtVrPasivo.Text := DataMod1.cdsDinamvr_pasivo.AsString;
        edtVrPatrim.Text := DataMod1.cdsDinamvr_patrim.AsString;

        btnEditar.Enabled := True;
        btnBorrar.Enabled := True;
      end;
    except
      on E: Exception do
      begin
        ShowMessage(Concat(DIALOG_ERROR, ' ', E.Message));
      end;
    end;
  end;
end;

procedure TFVistaCliente.FormCreate(Sender: TObject);
begin
  cdsTipoIdentif.CreateDataSet;

  crearTipoIdentif();
  cargarTipoIdentif();

  cbTipoIdentif.ItemIndex := 0;
end;



procedure TFVistaCliente.limpiar(todo: Boolean);
begin
  limpiar([edtNomb, edtNombRepresLegal, edtTelef, edtEmail, edtNombCont,
    edtVrActivo, edtVrPasivo, edtVrPatrim]);

  if todo then
  begin
    limpiar([edtIdentif]);
  end;
end;

procedure TFVistaCliente.limpiar(ecampos: array of TComponent);
var
  i : Word;
Begin
  for i := 0 to High(ecampos) Do
  Begin
    If (ecampos[I] Is TEdit) Then
      TEdit(ecampos[I]).Clear;

    If (ecampos[I] Is TComboBox) Then
      TComboBox(ecampos[I]).Text := '';

    If (ecampos[I] Is TMemo) Then
      TMemo(ecampos[I]).Text := '';

    if (ecampos[I] Is TClientDataSet) Then
    begin
      if TClientDataSet(ecampos[I]).Active then
        TClientDataSet(ecampos[I]).EmptyDataSet;
    end;
  End;
end;

procedure TFVistaCliente.llenarCds;
begin
  if DataMod1.cdsDinam.Locate(DataMod1.cdsDinamidentif.FieldName, identif,
    [loCaseInsensitive]) then
  begin
    DataMod1.cdsDinam.Edit;
  end
  else
  begin
    DataMod1.cdsDinam.Append;
    DataMod1.cdsDinamid.AsInteger := 0;
    DataMod1.cdsDinamidentif.AsString := identif;
  end;

  cdsTipoIdentif.RecNo := cbTipoIdentif.ItemIndex + 1;
  DataMod1.cdsDinamtipo_identif.AsString := cdsTipoIdentifCod.AsString;
  DataMod1.cdsDinamnombre.AsString := edtNomb.Text;
  DataMod1.cdsDinamnombre_repres_legal.AsString := edtNombRepresLegal.Text;
  DataMod1.cdsDinamtelefono.AsString := edtTelef.Text;
  DataMod1.cdsDinamemail.AsString := edtEmail.Text;
  DataMod1.cdsDinamnombre_contacto.AsString := edtNombCont.Text;
  DataMod1.cdsDinamvr_activo.AsCurrency := StrToFloat(edtVrActivo.Text);
  DataMod1.cdsDinamvr_pasivo.AsCurrency := StrToFloat(edtVrPasivo.Text);
  DataMod1.cdsDinamvr_patrim.AsCurrency := StrToFloat(edtVrPatrim.Text);
  DataMod1.cdsDinam.Post;
end;

procedure TFVistaCliente.setEnabled(ecampos: array of TComponent;
  eopcion: Boolean);
var
  i: Byte;
begin
  for I := 0 to high(ecampos) Do
  Begin
    if (ecampos[I] Is TEdit) Then
      TEdit(ecampos[I]).Enabled := eopcion;

    if (ecampos[I] Is TMemo) Then
      TMemo(ecampos[I]).Enabled := eopcion;

    if (ecampos[I] Is TComboBox) Then
      TComboBox(ecampos[I]).Enabled := eopcion;

    if (ecampos[I] Is TSpeedButton) Then
      TSpeedButton(ecampos[I]).Enabled := eopcion;

    if (ecampos[I] Is TBitBtn) Then
      TBitBtn(ecampos[I]).Enabled := eopcion;

    if (ecampos[I] Is TButton) Then
      TButton(ecampos[I]).Enabled := eopcion;

    if (ecampos[I] Is TLabel) Then
      TLabel(ecampos[I]).Enabled := eopcion;
  end;
end;

function TFVistaCliente.streamToVariant(stream: TStream): OleVariant;
var
  p: Pointer;
begin
  Result := VarArrayCreate([0, stream.Size - 1], varByte);
  p := VarArrayLock(Result);

  try
    stream.Position := 0;
    stream.Read(p^, stream.Size);
  finally
    VarArrayUnlock(Result);
  end;
end;

function TFVistaCliente.stringlistToVariant(list: TStrings): OleVariant;
var
  stream: TStream;
begin
  stream := TMemoryStream.Create;

  try
    list.SaveToStream(stream);
    stream.Seek(0, soFromBeginning);
    Result := StreamToVariant(stream);
  finally
    stream.Free;
  end;
end;


function TFVistaCliente.validarLlenos(ecampos: array of TComponent): Boolean;
var
  i : Word;

  procedure PonerFoco(compon: TWinControl);
  var
    componAux : TWinControl;
  begin
    componAux := compon;
  end;
begin
  //Método para verificar si hay controles vacíos .

  Result := True; //Suponer q los campos están llenos.

  try
    for I := 0 to high(ecampos) Do
    begin
      if (ecampos[I] Is TEdit) Then
      begin
        if Trim(TEdit(ecampos[I]).Text) = '' then
        begin
          Result := False;

          PonerFoco(TEdit(ecampos[I]));

          if TEdit(ecampos[I]).CanFocus then
            TEdit(ecampos[I]).SetFocus;
          Break;
        end;
      end;

      if (ecampos[I] Is TMemo) Then
      begin
        if Trim(TMemo(ecampos[I]).Text) = '' then
        begin
          Result := False;
          if TMemo(ecampos[I]).CanFocus then
            TMemo(ecampos[I]).SetFocus;
          Break;
        end;
      end;

      if (ecampos[I] Is TComboBox) Then
      begin
        if Trim(TComboBox(ecampos[I]).Text) = '' then
        begin
          Result := False;
          if TComboBox(ecampos[I]).CanFocus then
            TComboBox(ecampos[I]).SetFocus;
          Break;
        end;
      end;
    end; //fin for
  except
    Result := True;
  end;
end;

end.

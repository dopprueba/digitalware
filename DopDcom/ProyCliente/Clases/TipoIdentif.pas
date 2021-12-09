unit TipoIdentif;

interface

type
  TTipoIdentif = class(TObject)
    private
      cod: string;
      nomb: string;
    public
      constructor Create(cod, nomb: string);

      function getCod(): string;
      procedure setCod(cod: string);
      function getNomb(): string;
      procedure setNomb(nomb: string);
  end;


implementation

{ TTipoIdentif }

constructor TTipoIdentif.Create(cod, nomb: string);
begin
  inherited Create;

  Self.cod := cod;
  Self.nomb := nomb;
end;

function TTipoIdentif.getCod: string;
begin
  Result := Self.cod;
end;

function TTipoIdentif.getNomb: string;
begin
  Result := Self.nomb;
end;

procedure TTipoIdentif.setCod(cod: string);
begin
  Self.cod := cod;
end;

procedure TTipoIdentif.setNomb(nomb: string);
begin
  Self.nomb := nomb;
end;

end.

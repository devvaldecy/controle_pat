unit udm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset, ZAbstractRODataset;

type

  { TDM }

  TDM = class(TDataModule)
    Conexao: TZConnection;
    DSuser: TDataSource;
    DSsetor: TDataSource;
    DsConsultasetor: TDataSource;
    zQconsultasetor: TZQuery;
    zQconsultasetorEMAIL: TZRawStringField;
    zQconsultasetorID: TZIntegerField;
    zQconsultasetorNOME: TZRawStringField;
    zQsetor: TZQuery;
    zQsetorEMAIL: TZRawStringField;
    zQsetorID: TZIntegerField;
    zQsetorNOME: TZRawStringField;
    qrUSER: TZQuery;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.


unit udm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset, ZAbstractRODataset;

type

  { TDM }

  TDM = class(TDataModule)
    Conexao: TZConnection;
    DSsetor: TDataSource;
    DsConsultasetor: TDataSource;
    zQconsultasetor: TZQuery;
    zQsetor: TZQuery;
    zQsetorEMAIL: TZRawStringField;
    zQsetorID: TZIntegerField;
    zQsetorNOME: TZRawStringField;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.


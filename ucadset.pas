unit ucadset;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, DBCtrls, DBGrids, Buttons, Menus, udm;

type

  { Tf_cadastrossetor }

  Tf_cadastrossetor = class(TForm)
    BtnPesquisar: TBitBtn;
    BtnNovo: TBitBtn;
    BtnSalvar: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnDeletar: TBitBtn;
    BtnCancelar: TBitBtn;
    BitBtn6: TBitBtn;
    CbEscolha: TComboBox;
    DBGrid1: TDBGrid;
    EdtDescricao: TEdit;
    EdtConsultar: TEdit;
    EdtCodigo: TEdit;
    EdtNome: TEdit;
    EdtEmail: TEdit;
    Label1: TLabel;
    LblRegistros: TLabel;
    LblEscolher: TLabel;
    LblDados: TLabel;
    LblCodigo: TLabel;
    LblNome: TLabel;
    LblEmail: TLabel;
    MenuItem1: TMenuItem;
    PnlCenTop: TPanel;
    PnlCenButton: TPanel;
    PgControle: TPageControl;
    PnlLest: TPanel;
    PnlTop: TPanel;
    PopupMenu1: TPopupMenu;
    TabLancar: TTabSheet;
    TabConsultar: TTabSheet;
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure LblRegistrosClick(Sender: TObject);
  private
    procedure limparedits;
    procedure Habilitar;
  public

  end;

var
  f_cadastrossetor: Tf_cadastrossetor;

implementation

{$R *.lfm}

{ Tf_cadastrossetor }

procedure Tf_cadastrossetor.FormCreate(Sender: TObject);
begin

end;

procedure Tf_cadastrossetor.FormKeyPress(Sender: TObject; var Key: char);
begin
if key=#13 then begin
SelectNext(ActiveControl as TWinControl,True,True);
key:=#0;
end;
end;

procedure Tf_cadastrossetor.LblRegistrosClick(Sender: TObject);
begin

end;

procedure Tf_cadastrossetor.limparedits;
begin
  EdtCodigo.Clear;
  EdtNome.Clear;
  EdtEmail.Clear;
  EdtDescricao.clear;
  EdtCodigo.SetFocus;
end;

procedure Tf_cadastrossetor.Habilitar;
begin
  // Habilitar Botões
  BtnAlterar.Enabled   :=True;
  BtnDeletar.Enabled   :=True;
  BtnCancelar.Enabled  :=True;
  BtnPesquisar.Enabled :=True;
  BtnSalvar.Enabled    :=True;
end;

procedure Tf_cadastrossetor.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg ( 'Confirma saida da Janela ?' ,  'Deseja executar?' , mtConfirmation ,
                [ mbYes , mbNo ] , 0 )  = mrYes
    then  {Execute resto do programa}
 Close;
end;

procedure Tf_cadastrossetor.DBGrid1CellClick(Column: TColumn);
begin
  // Lançar dados no edits
  if PgControle.ActivePage = TabConsultar then
  Begin
  PgControle.ActivePage := TabLancar;
  end;
  TabConsultar.Caption:= 'Editando Registros...';
  EdtCodigo.Text    := IntToStr(DBGrid1.Columns[0].Field.Value);
  EdtNome.Text      := DBGrid1.Columns[1].Field.Value;
  EdtEmail.Text     := DBGrid1.Columns[2].Field.Value;
  EdtDescricao.Text := DBGrid1.Columns[1].Field.Value;
end;

procedure Tf_cadastrossetor.DBGrid1DblClick(Sender: TObject);
begin
 //EdtDescricao.Text   := DBGrid1.Columns[1].Field.Value;
end;

procedure Tf_cadastrossetor.EdtConsultarChange(Sender: TObject);
begin
 if EdtConsultar.Text = '' then
  begin
  ShowMessage('Campos não podem ser vazio...');
  EdtConsultar.SetFocus;
  end
  Else
  Begin
  with dm.zQconsultasetor do
  begin
  Close;
  SQL.Clear;
  case CbEscolha.ItemIndex of
  0: Begin
  SQL.Add('Select * from setor where id = ' + EdtConsultar.Text);
  EdtConsultar.SetFocus;
  end;
  2: begin
  SQL.Add('Select * from setor where nome LIKE ' + QuotedStr( '%' + EdtConsultar.Text + '%' ));
  EdtConsultar.SetFocus;
  end;

  3: begin
  SQL.Add('Select * from setor order by id');
  EdtConsultar.SetFocus;
  end;
  end;
  Open;
  LblRegistros.Caption := IntToStr(RecordCount);
  if RecordCount = 0 then
  ShowMessage('Registro não encontrado .... ');
  Habilitar;
  end;
  end;
end;

procedure Tf_cadastrossetor.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
 with dm.zQsetor do
 begin
 Active:=false;
 Close;
 sql.Clear;
 end;
end;

procedure Tf_cadastrossetor.BtnSalvarClick(Sender: TObject);
begin
  if EdtCodigo.Text = '' then
    begin
    ShowMessage('Campo vazio preenchar pra continuar');
    EdtCodigo.SetFocus;
    end
  Else
  Begin
    with dm.zQsetor do
    begin
      Close;
      Sql.Clear;
      SQL.Add('INSERT INTO setor');
      SQL.Add('(id, nome, email)');
      SQL.Add('values (:pid, :pnome, :pemail)');
      ParamByName('pid').AsString    := EdtCodigo.text;
      ParamByName('pnome').AsString := EdtNome.Text;
      ParamByName('pemail').AsString := EdtEmail.Text;
      ExecSQL;
      ShowMessage('Registro inserido com sucesso....');
      limparedits;
   end;
end;
end;

procedure Tf_cadastrossetor.BtnNovoClick(Sender: TObject);
begin
  PgControle.ActivePage := TabLancar;
  TabConsultar.Caption  := 'Novos Registros...';
  BtnPesquisar.Enabled  := True;
  BtnSalvar.Enabled     := True;
  BtnCancelar.Enabled   := True;
  EdtDescricao.clear;
  limparedits;
  EdtCodigo.SetFocus;
end;

procedure Tf_cadastrossetor.BtnPesquisarClick(Sender: TObject);
begin
  PgControle.ActivePage := TabConsultar;
  BtnSalvar.Enabled     := False;
  EdtConsultar.SetFocus;
end;

procedure Tf_cadastrossetor.BtnAlterarClick(Sender: TObject);
begin
  with dm.zQsetor do
    begin
      Close;
      Sql.Clear;
      sql.add ('update setor set id =:pid where nome =:pnome email =:pemail');
      ParamByName('pid').AsString    := EdtCodigo.text;
      ParamByName('pnome').AsString := EdtNome.Text;
      ParamByName('pemail').AsString := EdtEmail.Text;
      ExecSQL;
      ShowMessage('Registro Alterado com sucesso....');
      limparedits;
      EdtCodigo.SetFocus;
   end;
end;

procedure Tf_cadastrossetor.BtnCancelarClick(Sender: TObject);
begin
  limparedits;
  LblRegistros.Caption:='';
  EdtCodigo.SetFocus;
  TabConsultar.Caption:= 'Consultar Registros...';
end;

end.


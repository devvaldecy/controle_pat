unit ulogin;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { Tf_login }

  Tf_login = class(TForm)
    btnLogin: TBitBtn;
    btnReset: TBitBtn;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    imgLogo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbLdigitos: TLabel;
    Panel1: TPanel;
    pnlCentro: TPanel;
    pnlLest: TPanel;
    Shape1: TShape;
    btnFechar: TSpeedButton;
    Shape2: TShape;
    Shape3: TShape;
    procedure btnFecharClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure edtSenhaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure imgLogoClick(Sender: TObject);

    procedure LimpaCampos;

  private

  public

  end;

var
  f_login: Tf_login;

implementation

uses udm, uprincipal;

{$R *.lfm}

{ Tf_login }

procedure Tf_login.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tf_login.btnLoginClick(Sender: TObject);
begin
  if ((edtUsuario.Text ='')and(edtSenha.Text ='')) then
    begin
    ShowMessage('OPS! os campos estão vázios');

    edtUsuario.SetFocus;
     Abort;
    end;
    DM.qrUSER.Close;
    DM.qrUSER.SQL.Clear; // Adicionei esta linha para limpar o SQL
    DM.qrUSER.SQL.Add('Select * from usuarios');
    DM.qrUSER.SQL.Add(' WHERE login = ' + QuotedStr(edtUsuario.Text) + ' AND senha = ' + QuotedStr(edtSenha.Text));
    DM.qrUSER.Open;
    f_principal.LblUser.Caption := f_login.edtUsuario.Text;
    if DM.qrUSER.IsEmpty then
    begin
    ShowMessage('Usuário ou senha inválida(o)');
    LimpaCampos;
    edtUsuario.SetFocus;
    Abort;
    end;
  begin
   f_principal := Tf_principal.Create(Self);
  try
    f_principal.ShowModal;
  finally
    FreeAndNil(f_principal);
  end;
  end;
end;

procedure Tf_login.btnResetClick(Sender: TObject);
begin
  LimpaCampos;
end;

procedure Tf_login.edtSenhaChange(Sender: TObject);
begin
    lbLdigitos.Caption := IntToStr(Length(EdtSenha.Text));
    if Length(edtSenha.Text) = 10 then
    ShowMessage('A senha é de apenas 7 digitos');
end;

procedure Tf_login.FormKeyPress(Sender: TObject; var Key: char);
begin
    if key=#13 then begin
    SelectNext(ActiveControl as TWinControl,True,True);
    key:=#0;
end;
end;

procedure Tf_login.imgLogoClick(Sender: TObject);
begin

end;

procedure Tf_login.LimpaCampos;
begin
  edtUsuario.Clear;
  edtSenha.Clear;
  edtUsuario.SetFocus;
end;

end.


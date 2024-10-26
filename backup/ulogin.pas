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
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure imgLogoClick(Sender: TObject);

    procedure LimpaCampos;

  private

  public

  end;

var
  f_login: Tf_login;

implementation

{$R *.lfm}

{ Tf_login }

procedure Tf_login.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tf_login.btnLoginClick(Sender: TObject);
begin
  if (edtUsuario.Text = '')and (edtSenha.Text = '')  then
  ShowMessage('Campos vazios não pode ficar...');
  edtUsuario.SetFocus;
end;

procedure Tf_login.btnResetClick(Sender: TObject);
begin
  LimpaCampos;
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


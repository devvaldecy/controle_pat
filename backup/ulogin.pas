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
    Panel1: TPanel;
    pnlCentro: TPanel;
    pnlLest: TPanel;
    Shape1: TShape;
    btnFechar: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
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

end.


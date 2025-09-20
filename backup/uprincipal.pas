unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  ComCtrls, StdCtrls, ucadset, usobre, ulogin;

type

  { Tf_principal }

  Tf_principal = class(TForm)
    BitBtn1: TBitBtn;
    BtnSobre: TBitBtn;
    BtnClientes: TBitBtn;
    BntSetor: TBitBtn;
    BntEmpresa: TBitBtn;
    BtnSair: TBitBtn;
    BtnTransferir: TBitBtn;
    BtnFornecedores: TBitBtn;
    BtnEquipamentos: TBitBtn;
    BtnConfiguracoes: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    ImgLogo: TImage;
    Label1: TLabel;
    LblUser: TLabel;
    Panel1: TPanel;
    pnldireita: TPanel;
    PnlConteiner: TPanel;
    PnlLogo: TPanel;
    PnlLest: TPanel;
    PnlTop: TPanel;
    StatusBar1: TStatusBar;
    Tmtrelogio: TTimer;
    procedure BtnSobreClick(Sender: TObject);
    procedure BntSetorClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure TmtrelogioTimer(Sender: TObject);
  private

  public

  end;

var
  f_principal: Tf_principal;

implementation

{$R *.lfm}

{ Tf_principal }

procedure Tf_principal.BntSetorClick(Sender: TObject);
begin
    f_cadastrossetor := Tf_cadastrossetor.Create(Self);
  try
    f_cadastrossetor.ShowModal;
  finally
    FreeAndNil(f_cadastrossetor);
  end;

end;

procedure Tf_principal.BtnSobreClick(Sender: TObject);
begin
  f_sobre := Tf_sobre.Create(Self);
  try
    f_sobre.ShowModal;
  finally
    FreeAndNil(f_sobre);
  end;
end;

procedure Tf_principal.BtnSairClick(Sender: TObject);
begin
  if MessageDlg ( 'Confirma saida do sistema ?' ,  'Deseja executar?' , mtConfirmation ,
                 [ mbYes , mbNo ] , 0 )  = mrYes
    then  {Execute resto do programa}
  Application.Terminate;
end;

procedure Tf_principal.TmtrelogioTimer(Sender: TObject);
begin
  StatusBar1.Panels [1].Text := 'Controle de Tombamentos Empresárial .....';
  Statusbar1.Panels [2].Text := 'Data Servidor.: '+datetostr(date);// para data
  statusbar1.Panels [3].Text := 'Hora Servidor.: '+timetostr(now);//para hora
  StatusBar1.Panels [5].Text := 'Ip Local.: 127.0.0.1';
  StatusBar1.Panels [6].Text := 'Registro.: Associação Teresinense de Ensino S/C LTDA';
end;
end.


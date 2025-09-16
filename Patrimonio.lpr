program Patrimonio;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, uprincipal, ucadset, udm, zcomponent, ulogin, u_cadpadrao
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tf_login, f_login);
  Application.CreateForm(Tf_principal, f_principal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tf_cadpadrao, f_cadpadrao);
  Application.CreateForm(Tf_cadastrossetor, f_cadastrossetor);
  Application.Run;
end.


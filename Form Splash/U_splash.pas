unit U_splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TFrm_Splas = class(TForm)
    shp1: TShape;
    pb1: TProgressBar;
    tmr1: TTimer;
    lbl_1: TLabel;
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Splas: TFrm_Splas;

implementation

uses
  U_Utama;

{$R *.dfm}

procedure TFrm_Splas.tmr1Timer(Sender: TObject);
begin
  pb1.Position:=pb1.Position+10;
  if pb1.Position=pb1.Max then
  begin
    tmr1.Enabled:=False;
    Frm_utama.Show;
    Frm_Splas.Hide;
  end;
end;

end.

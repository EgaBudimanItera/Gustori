unit U_LabaRugi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, OleCtrls,
  Crystal_TLB;

type
  TFrm_cetakLR = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    grp3: TGroupBox;
    btn_Bsimpan: TBitBtn;
    btn_Bkeluar: TBitBtn;
    cb_tahun: TComboBox;
    crystlrprt_1: TCrystalReport;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure edt_namapenggunaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_passwordKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btn_BtambahClick(Sender: TObject);
    procedure cb_tahunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BsimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_cetakLR: TFrm_cetakLR;

implementation

uses
  U_Utama, ADODB;

{$R *.dfm}

procedure TFrm_cetakLR.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_cetakLR.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_laporanlr.TabVisible:=False;
end;

procedure TFrm_cetakLR.edt_namapenggunaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in['0'..'9',#13,#8]) then key:=#0;
end;

procedure TFrm_cetakLR.edt_passwordKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9']) then key:=#0;
end;

procedure TFrm_cetakLR.FormShow(Sender: TObject);
var
  tahun:Integer;
begin
  with Frm_Utama do
  begin
    cb_tahun.Clear;
    tahun:=StrToInt(FormatDateTime('yyyy',now));
    for tahun:=tahun-10 to tahun+10 do
      cb_tahun.Items.Add(IntToStr(tahun)) ;
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=100-5;
  end;
end;

procedure TFrm_cetakLR.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_cetakLR.cb_tahunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_cetakLR.btn_BsimpanClick(Sender: TObject);
begin
  with crystlrprt_1 do
  begin
    ReportFileName:='Laporan/LabaRugi.rpt';
    SelectionFormula:='{vw_lr.tahun}='''+cb_tahun.Text+'''';
    Destination:=crptToWindow;
    //ReportTitle:=FormatDateTime('mmmm',IncMonth(Now,1))  ;
    WindowState:=crptMaximized;
    RetrieveDataFiles;
    Action:=1;
  end;
end;

end.

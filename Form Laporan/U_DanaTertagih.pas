unit U_DanaTertagih;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,DateUtils,StrUtils,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls,
  OleCtrls, Crystal_TLB;

type
  TFrm_cetakDanaTertagih = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    grp3: TGroupBox;
    btn_Bsimpan: TBitBtn;
    btn_Bkeluar: TBitBtn;
    dtp_awal: TDateTimePicker;
    grp2: TGroupBox;
    dtp_akhir: TDateTimePicker;
    crystlrprt_1: TCrystalReport;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
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
  Frm_cetakDanaTertagih: TFrm_cetakDanaTertagih;

implementation

uses
  U_Utama, ADODB;

{$R *.dfm}

procedure TFrm_cetakDanaTertagih.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_cetakDanaTertagih.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_laporandanatertagih.TabVisible:=False;
end;

procedure TFrm_cetakDanaTertagih.FormShow(Sender: TObject);
var
  tahun:Integer;
begin
  with Frm_Utama do
  begin
    dtp_awal.Date:=startofthemonth(now);
    dtp_akhir.Date:=endofthemonth(Now);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=100-5;
  end;
end;

procedure TFrm_cetakDanaTertagih.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_cetakDanaTertagih.cb_tahunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_cetakDanaTertagih.btn_BsimpanClick(Sender: TObject);
begin
 with crystlrprt_1 do
  begin
    ReportFileName:='Laporan/DanaTertagih.rpt';
    SelectionFormula:='{vw_simpanan.status}='''+'Simpanan'+''' and {vw_simpanan.tglsimpan} >= date('+FormatDateTime('yyyy,mm,dd',dtp_awal.Date)+')'+
                      ' and {vw_simpanan.tglsimpan} <= date('+FormatDateTime('yyyy,mm,dd',dtp_akhir.Date)+')' ;
    Destination:=crptToWindow;
   // ReportTitle:=FormatDateTime('mmmm',IncMonth(Now,1))  ;
    WindowState:=crptMaximized;
    RetrieveDataFiles;
    Action:=1;
  end;
end;

end.

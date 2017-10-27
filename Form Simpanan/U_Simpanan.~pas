unit U_Simpanan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,DateUtils,
  ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Dialogs, jpeg;

type
  TFrm_simpanan = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp5: TGroupBox;
    tb_tagihan: TDBGrid;
    grp3: TGroupBox;
    btn_Btambah: TBitBtn;
    btn_Bsimpan: TBitBtn;
    btn_Bkeluar: TBitBtn;
    grp4: TGroupBox;
    edt_cari: TEdit;
    grp1: TGroupBox;
    tb_simpanan: TDBGrid;
    grp2: TGroupBox;
    edt_carisimpanan: TEdit;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure kondisi(a:Integer);
    procedure btn_BsimpanClick(Sender: TObject);
    procedure tb_tagihanDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_cariChange(Sender: TObject);
    procedure btn_BtambahClick(Sender: TObject);
    procedure tb_simpananDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tb_tagihanCellClick(Column: TColumn);
    procedure edt_carisimpananChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_simpanan: TFrm_simpanan;
  _idsimp,_usipa,_usipake,_art,_artke:string;
implementation

uses
  U_Utama, ADODB, DB, U_CariAnggota;

{$R *.dfm}

procedure TFrm_simpanan.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_simpanan.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_simpanan.TabVisible:=False;
end;

procedure TFrm_simpanan.FormShow(Sender: TObject);
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_simpanan');
    koneksitabel('vw_tagihan');
    koneksitabel('tb_pinjaman');
    koneksitabel('vw_simpanan');
    koneksitabel('tb_anggota');
    tb_tagihan.DataSource:=dts_tagihan;
    tb_simpanan.DataSource:=dts_simpanan;
    bersih(Self);
    kondisi(0);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=30-20;
    idsimpanan;
    gayatabel('vw_tagihan');
    gayatabel('vw_simpanan');
  end;
end;

procedure TFrm_simpanan.kondisi(a: Integer);
begin
  if (a=0) then
  begin
    btn_Bsimpan.Enabled:=false;
  end
  else
  begin
    btn_Bsimpan.Enabled:=true;
  end;
end;

procedure TFrm_simpanan.btn_BsimpanClick(Sender: TObject);
var
  tanggal,query:string;
begin
  query:='update tb_simpanan set status="Simpanan",tglsimpan='+
    QuotedStr(FormatDateTime('yyyy-mm-dd',now))+' where idsimpanan='+
    QuotedStr(_idsimp)+'';
  Frm_Utama.modelcrud(query,Frm_Utama.Q_simpanan);
  MessageDlg('Proses Simpanan Anggota Berhasil',mtInformation,[mbok],0);
  FormShow(Sender);
end;

procedure TFrm_simpanan.tb_tagihanDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Frm_utama do
  begin
    if dts_tagihan.DataSet.RecNo>0 then
    begin
      if Column.Title.Caption = 'No' then
      begin
        tb_tagihan.Canvas.TextOut(Rect.Left  + 2, rect.Top,IntToStr(dts_tagihan.DataSet.RecNo));
      end;
    end;
  end;
end;

procedure TFrm_simpanan.edt_cariChange(Sender: TObject);
var
query:string;
begin
  query:='select * from vw_simpanan where (namadinas like "%'+edt_cari.Text+'%" or namaanggota like "%'+
    edt_cari.Text+'%" or nip like "%'+edt_cari.Text+'%") and status="Tagihan"';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwtagihan);
  Frm_Utama.gayatabel('vw_tagihan');
end;

procedure TFrm_simpanan.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_simpanan.tb_simpananDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Frm_utama do
  begin
    if dts_simpanan.DataSet.RecNo>0 then
    begin
      if Column.Title.Caption = 'No' then
      begin
        tb_simpanan.Canvas.TextOut(Rect.Left  + 2, rect.Top,IntToStr(dts_simpanan.DataSet.RecNo));
      end;
    end;
  end;
end;

procedure TFrm_simpanan.tb_tagihanCellClick(Column: TColumn);
begin
  with Frm_Utama.Q_vwtagihan do
  begin
    if Recordset.RecordCount<>0 then
    begin
    _idsimp:=FieldValues['idsimpanan'];
    kondisi(1);
    end;
  end;
end;

procedure TFrm_simpanan.edt_carisimpananChange(Sender: TObject);
var
query:string;
begin
  query:='select * from vw_simpanan where (namadinas like "%'+edt_carisimpanan.Text+'%" or namaanggota like "%'+
    edt_carisimpanan.Text+'%" or nip like "%'+edt_carisimpanan.Text+'%") and status="Simpanan"';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwsimpanan);
  Frm_Utama.gayatabel('vw_simpanan');
end;

end.

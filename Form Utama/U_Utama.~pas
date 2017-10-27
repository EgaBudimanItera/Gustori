unit U_Utama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, StdCtrls, ExtCtrls, jpeg, DB,
  ADODB;

type
  TFrm_Utama = class(TForm)
    mm1: TMainMenu;
    File1: TMenuItem;
    UbahPassword1: TMenuItem;
    N1: TMenuItem;
    KeluarAplikasi1: TMenuItem;
    Master1: TMenuItem;
    il1: TImageList;
    tlb1: TToolBar;
    btn_dinas: TToolButton;
    btn1: TToolButton;
    btn_anggota: TToolButton;
    btn2: TToolButton;
    btn_akun: TToolButton;
    btn3: TToolButton;
    btn_tagihan: TToolButton;
    btn8: TToolButton;
    btn_simpanan: TToolButton;
    btn4: TToolButton;
    btn_pinjaman: TToolButton;
    btn6: TToolButton;
    btn_lr: TToolButton;
    lbl_jam: TLabel;
    Tab_Utama: TPageControl;
    ts_Utama: TTabSheet;
    pnl2: TPanel;
    lbl_ketlogin: TLabel;
    pnl5: TPanel;
    lbl_2: TLabel;
    lbl_3: TLabel;
    edt_utama: TEdit;
    dtp_utama: TDateTimePicker;
    tmr1: TTimer;
    img1: TImage;
    Dinas1: TMenuItem;
    Anggota1: TMenuItem;
    Akun1: TMenuItem;
    ransaksi1: TMenuItem;
    agihan1: TMenuItem;
    Simpanan1: TMenuItem;
    Pinjaman1: TMenuItem;
    LabaRugi1: TMenuItem;
    SHU1: TMenuItem;
    SHUAnggota1: TMenuItem;
    Laporan1: TMenuItem;
    Simpanan2: TMenuItem;
    DanaTertagih1: TMenuItem;
    SHU2: TMenuItem;
    btn9: TToolButton;
    btn_shu: TToolButton;
    btn11: TToolButton;
    btn_shuanggota: TToolButton;
    btn_login: TToolButton;
    btn_out: TToolButton;
    btn15: TToolButton;
    btn16: TToolButton;
    condb: TADOConnection;
    Q_dinas: TADOQuery;
    dts_dinas: TDataSource;
    Q_anggota: TADOQuery;
    dts_anggota: TDataSource;
    Q_vwanggota: TADOQuery;
    Q_akun: TADOQuery;
    dts_akun: TDataSource;
    Q_pengguna: TADOQuery;
    Q_tagihan: TADOQuery;
    dts_tagihan: TDataSource;
    Q_vwtagihan: TADOQuery;
    Q_simpanan: TADOQuery;
    dts_simpanan: TDataSource;
    Q_vwsimpanan: TADOQuery;
    Q_pinjaman: TADOQuery;
    dts_pinjaman: TDataSource;
    Q_vwpinjaman: TADOQuery;
    Q_lr: TADOQuery;
    dts_lr: TDataSource;
    Q_vwlr: TADOQuery;
    Q_shu: TADOQuery;
    dts_shu: TDataSource;
    Q_vwshu: TADOQuery;
    Q_shuanggota: TADOQuery;
    dts_shuanggota: TDataSource;
    Q_vwshuanggota: TADOQuery;
    Q_angsur: TADOQuery;
    Q_vwangsur: TADOQuery;
    dts_angsur: TDataSource;
    ts_dinas: TTabSheet;
    ts_anggota: TTabSheet;
    ts_akun: TTabSheet;
    ts_tagihan: TTabSheet;
    ts_simpanan: TTabSheet;
    ts_pinjaman: TTabSheet;
    ts_angsuran: TTabSheet;
    ts_lr: TTabSheet;
    ts_shu: TTabSheet;
    ts_shuanggota: TTabSheet;
    ts_login: TTabSheet;
    ts_laporanlr: TTabSheet;
    ts_ubahpass: TTabSheet;
    ts_laporandanatertagih: TTabSheet;
    ts_laporanshu: TTabSheet;
    procedure bersih(x:TObject);
    procedure isiform(vtab: TTabsheet; vform: TForm);
    procedure tmr1Timer(Sender: TObject);
    procedure btn_outClick(Sender: TObject);
    function ribuan(edit: tedit): string;
    function hapusformat(nilai: tedit): Currency;
    procedure modelcrud(query:string;q_:TADOQuery);
    procedure modellihatdata(query: string; q_: TADOQuery);
    procedure modellihatdatads(query: string; q_: TADOQuery;ds:TDataSource);
    procedure koneksitabel(tabel:string);
    procedure gayatabel(tabel:string);
    procedure keadaanform(kondisi:string);
    procedure koneksidb;
    procedure FormShow(Sender: TObject);
    procedure keadaantabs(kondisi:string);
    procedure btn_akunClick(Sender: TObject);
    procedure btn_dinasClick(Sender: TObject);
    procedure btn_anggotaClick(Sender: TObject);
    procedure idsimpanan;
    procedure btn_tagihanClick(Sender: TObject);
    procedure btn_pinjamanClick(Sender: TObject);
    procedure btn_simpananClick(Sender: TObject);
    procedure btn_lrClick(Sender: TObject);
    procedure btn_shuClick(Sender: TObject);
    procedure btn_shuanggotaClick(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
    procedure UbahPassword1Click(Sender: TObject);
    procedure KeluarAplikasi1Click(Sender: TObject);
    procedure Dinas1Click(Sender: TObject);
    procedure Anggota1Click(Sender: TObject);
    procedure Akun1Click(Sender: TObject);
    procedure agihan1Click(Sender: TObject);
    procedure Simpanan1Click(Sender: TObject);
    procedure Pinjaman1Click(Sender: TObject);
    procedure LabaRugi1Click(Sender: TObject);
    procedure SHU1Click(Sender: TObject);
    procedure SHUAnggota1Click(Sender: TObject);
    procedure Simpanan2Click(Sender: TObject);
    procedure DanaTertagih1Click(Sender: TObject);
    procedure SHU2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Utama: TFrm_Utama;
  _idsimpanan,_idlog,_namauser,_level:string;
implementation

uses
  U_Akun, U_Dinas, U_Anggota, U_Tagihan, U_Pinjaman, U_Simpanan, U_LR, U_shu, U_shuanggota, U_Login, U_ubah, U_LabaRugi, U_DanaTertagih, U_CetakSHU;

{$R *.dfm}

{ TFrm_Utama }

procedure TFrm_Utama.bersih(x: TObject);
var
  a:integer;
begin
  with x as TForm do
  begin
    for a:=0 to ComponentCount -1 do
    begin
      if Components[a] is TEdit then
        TEdit (Components[a]).Text:='';
      if Components[a] is TComboBox then
        TComboBox (Components[a]).Text:='';
      if Components[a] is TMemo then
        TMemo (Components[a]).Text:='';
      if Components[a] is TRadioButton then
        TRadioButton (Components[a]).Checked:=false;
      if Components[a] is TDateTimePicker then
        TDateTimePicker (Components[a]).Date:=now;
      if Components[a] is TCheckBox then
        TDateTimePicker (Components[a]).Checked:=false;
    end;
  end;
end;

procedure TFrm_Utama.isiform(vtab: TTabsheet; vform: TForm);
begin
  vform.BorderStyle:=bsNone;
  vform.Align:=alClient;
  vtab.Caption:=vform.Caption;
  vform.Parent:=vtab;
  vform.Visible:=true;
  vform.show;
end;

procedure TFrm_Utama.tmr1Timer(Sender: TObject);
begin
  lbl_jam.Caption:=FormatDateTime('dd mmmm yyyy | HH:mm:ss  ',now);
end;

procedure TFrm_Utama.btn_outClick(Sender: TObject);
begin
  if (ts_akun.TabVisible=true) or (ts_dinas.TabVisible=true) or (ts_anggota.TabVisible=true) or
     (ts_tagihan.TabVisible=true) or (ts_simpanan.TabVisible=true) or (ts_pinjaman.TabVisible=true)
     or (ts_angsuran.TabVisible=true) or (ts_lr.TabVisible=true) or (ts_shu.TabVisible=true) or
     (ts_shuanggota.TabVisible=true) or (ts_laporanlr.TabVisible=true) or (ts_laporanshu.TabVisible=true)  or
     (ts_laporandanatertagih.TabVisible=true) or (ts_simpanan.TabVisible=true) or (ts_ubahpass.TabVisible=true) then
  begin
    MessageDlg('Silahkan Tutup Semua Tab!!!',mtInformation,[mbOK],0);
    Exit;
  end
  else
  begin
    if MessageDlg('Yakin untuk menutup aplikasi?',mtConfirmation,[mbYes,mbNo],0)=mryes then
      Application.Terminate;
  end;
end;

function TFrm_Utama.ribuan(edit: tedit): string;
var
  NilaiRupiah: string;
  AngkaRupiah: Currency;
begin
if Edit.Text='' then Exit;
  NilaiRupiah := Edit.text;
  NilaiRupiah := StringReplace(NilaiRupiah,',','',[rfReplaceAll,rfIgnoreCase]);
  NilaiRupiah := StringReplace(NilaiRupiah,'.','',[rfReplaceAll,rfIgnoreCase]);
  AngkaRupiah := StrToCurrDef(NilaiRupiah,0);
  Edit.Text := FormatCurr('#,###',AngkaRupiah);
  Edit.SelStart := length(Edit.text);
end;

function TFrm_Utama.hapusformat(nilai: tedit): Currency;
var
  Hasil:String;
begin
  Hasil:=Nilai.Text;
  Hasil:=StringReplace(Hasil,',','',[rfReplaceAll,rfIgnoreCase]);
  Hasil:=StringReplace(Hasil,'.','',[rfReplaceAll,rfIgnoreCase]);
  Result:=StrToCurr(Hasil);
end;

procedure TFrm_Utama.modelcrud(query: string; q_: TADOQuery);
begin
  with Q_ do
  begin
    SQL.Text:=query;
    ExecSQL;
  end;
end;

procedure TFrm_Utama.modellihatdata(query: string; q_: TADOQuery);
begin
  with Q_ do
  begin
    Connection:=condb;
    SQL.Text:=query;
    Close;
    Open;
  end;
end;

procedure TFrm_Utama.modellihatdatads(query: string; q_: TADOQuery;
  ds: TDataSource);
begin
  with Q_ do
  begin
    Connection:=condb;
    SQL.Text:=query;
    Close;
    Open;
  end;
  ds.DataSet:=Q_;
end;

procedure TFrm_Utama.koneksitabel(tabel: string);
var
  query:string;
begin
  //1.tabel akun
  if (tabel='tb_akun') then
  begin
    Q_akun.SQL.Clear;
    query:='select * from '+tabel+' order by idakun asc';
    modellihatdatads(query,Q_akun,dts_akun);
  end
  //2.tabel dinas
  else  if (tabel='tb_dinas') then
  begin
    Q_dinas.SQL.Clear;
    query:='select * from '+tabel+' order by iddinas asc';
    modellihatdatads(query,Q_dinas,dts_dinas);
  end
  //3.tabel anggota
  else  if (tabel='tb_anggota') then
  begin
    Q_anggota.SQL.Clear;
    query:='select * from '+tabel+' order by idanggota asc';
    modellihatdata(query,Q_anggota);
  end
  else if (tabel='vw_anggota') then
  begin
    Q_vwanggota.SQL.Clear;
    query:='select * from '+tabel+' order by idanggota asc';
    modellihatdatads(query,Q_vwanggota,dts_anggota);
  end
  //4.tabel tagihan
  else  if (tabel='tb_tagihan') then
  begin
    Q_tagihan.SQL.Clear;
    query:='select * from tb_simpanan where status = '+QuotedStr('Tagihan')+'';
    modellihatdata(query,Q_tagihan);
  end
  else if (tabel='vw_tagihan') then
  begin
    Q_vwtagihan.SQL.Clear;
    query:='select * from vw_simpanan where status ='+QuotedStr('Tagihan')+' order by idsimpanan asc,idanggota asc';
    modellihatdatads(query,Q_vwtagihan,dts_tagihan);
  end
  //5.tabel simpanan
  else  if (tabel='tb_simpanan') then
  begin
    Q_simpanan.SQL.Clear;
    query:='select * from tb_simpanan where status = '+QuotedStr('Simpanan')+'';
    modellihatdata(query,Q_simpanan);
  end
  else if (tabel='vw_simpanan') then
  begin
    //Q_vwsimpanan.SQL.Clear;
    query:='select * from vw_simpanan where status ='+QuotedStr('Simpanan')+' order by idanggota asc,idsimpanan asc';
    modellihatdatads(query,Q_vwsimpanan,dts_simpanan);
  end
  //6.tabel pinjaman
  else  if (tabel='tb_pinjaman') then
  begin
    Q_pinjaman.SQL.Clear;
    query:='select * from '+tabel+'';
    modellihatdata(query,Q_pinjaman);
  end
  else if (tabel='vw_pinjaman') then
  begin
    Q_vwpinjaman.SQL.Clear;
    query:='select * from '+tabel+' order by idpinjaman desc';
    modellihatdatads(query,Q_vwpinjaman,dts_pinjaman);
  end
  //7.Tabel angsur
  {else  if (tabel='tb_angsur') then
  begin
    Q_anggota.SQL.Clear;
    query:='select * from '+tabel+'';
    modellihatdatads(query,Q_angsur,dts_angsur);
  end    }
  //8.tabel Lr
  else  if (tabel='tb_lr') then
  begin
    Q_lr.SQL.Clear;
    query:='select * from '+tabel+'';
    modellihatdata(query,Q_lr);
  end
  else if (tabel='vw_lr') then
  begin
    Q_vwlr.SQL.Clear;
    query:='select * from '+tabel+' order by idlr desc,idakun asc';
    modellihatdatads(query,Q_vwlr,dts_lr);
  end
  //9.tabel shu
  else  if (tabel='tb_shu') then
  begin
    Q_shu.SQL.Clear;
    query:='select * from '+tabel+'';
    modellihatdata(query,Q_shu);
  end
  else if (tabel='vw_shu') then
  begin
    Q_vwshu.SQL.Clear;
    query:='select * from '+tabel+' order by idshu desc';
    modellihatdatads(query,Q_vwshu,dts_shu);
  end
  //10.tabel shu anggota
  else  if (tabel='tb_shuanggota') then
  begin
    Q_shuanggota.SQL.Clear;
    query:='select * from '+tabel+'';
    modellihatdata(query,Q_shuanggota);
  end
  else if (tabel='vw_shuanggota') then
  begin
    Q_vwshuanggota.SQL.Clear;
    query:='select * from '+tabel+' order by idshu desc,idanggota asc';
    modellihatdatads(query,Q_vwshuanggota,dts_shuanggota);
  end
  //11. tabel pengguna
  else if (tabel='tb_pengguna') then
  begin
    Q_pengguna.SQL.Clear;
    query:='select * from '+tabel+'';
    modellihatdata(query,Q_pengguna);
  end
end;

procedure TFrm_Utama.gayatabel(tabel: string);
begin
  if (tabel='vw_anggota') then
  begin
     TFloatField(Q_vwanggota.FieldByName('umroh')).DisplayFormat:='#,#0';
     TFloatField(Q_vwanggota.FieldByName('sukarela')).DisplayFormat:='#,#0';
     TFloatField(Q_vwanggota.FieldByName('haji')).DisplayFormat:='#,#0';
     TFloatField(Q_vwanggota.FieldByName('art')).DisplayFormat:='#,#0';
     TFloatField(Q_vwanggota.FieldByName('usipa')).DisplayFormat:='#,#0';
     TFloatField(Q_vwanggota.FieldByName('sosial')).DisplayFormat:='#,#0';
  end
  else if (tabel='vw_tagihan') then
  begin
     TFloatField(Q_vwtagihan.FieldByName('pokok')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('wajib')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('sukarela')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('sosial')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('dapen')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('haji')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('umroh')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('laba')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('jasa')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('art')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('artke')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('usipa')).DisplayFormat:='#,#0';
     TFloatField(Q_vwtagihan.FieldByName('usipake')).DisplayFormat:='#,#0';
  end
  else if (tabel='vw_simpanan') then
  begin
    TFloatField(Q_vwsimpanan.FieldByName('pokok')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('wajib')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('sukarela')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('sosial')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('dapen')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('haji')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('umroh')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('laba')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('jasa')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('art')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('artke')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('usipa')).DisplayFormat:='#,#0';
    TFloatField(Q_vwsimpanan.FieldByName('usipake')).DisplayFormat:='#,#0';
  end
  else if (tabel='vw_pinjaman') then
  begin
    TFloatField(Q_vwpinjaman.FieldByName('lamapinjaman')).DisplayFormat:='#,#0 Bulan';
    TFloatField(Q_vwpinjaman.FieldByName('jumlahpinjaman')).DisplayFormat:='#,#0';
    TFloatField(Q_vwpinjaman.FieldByName('angsuran')).DisplayFormat:='#,#0';
    TFloatField(Q_vwpinjaman.FieldByName('sisapinjaman')).DisplayFormat:='#,#0';
  end
  else if (tabel='tb_angsur') then
  begin
    TFloatField(Q_angsur.FieldByName('jumlahangsur')).DisplayFormat:='#,#0';
    TFloatField(Q_angsur.FieldByName('ke')).DisplayFormat:='#,#0';
  end
  else if (tabel='vw_lr') then
  begin
    TFloatField(Q_vwlr.FieldByName('jumlah')).DisplayFormat:='#,#0';
  end
  else if (tabel='vw_shu') then
  begin
    TFloatField(Q_vwshu.FieldByName('totalpendapatan')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshu.FieldByName('totalbeban')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshu.FieldByName('totalsimpanan')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshu.FieldByName('totalbayar')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshu.FieldByName('jasa')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshu.FieldByName('laba')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshu.FieldByName('persenjasa')).DisplayFormat:='###,###.00 ';
    TFloatField(Q_vwshu.FieldByName('persenlaba')).DisplayFormat:='###,###.00 ';
  end
  else if (tabel='vw_shuanggota') then
  begin
    TFloatField(Q_vwshuanggota.FieldByName('jumlahsimpanan')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshuanggota.FieldByName('labasimpanan')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshuanggota.FieldByName('jumlahbayar')).DisplayFormat:='#,#0';
    TFloatField(Q_vwshuanggota.FieldByName('labajasa')).DisplayFormat:='#,#0';
  end
end;

procedure TFrm_Utama.keadaanform(kondisi: string);
begin
  if (kondisi='Awal') then
  begin
    btn_dinas.Enabled:=False;
    btn_anggota.Enabled:=false;
    btn_akun.Enabled:=False;
    btn_tagihan.Enabled:=False;
    btn_simpanan.Enabled:=false;
    btn_pinjaman.Enabled:=false;
    btn_lr.Enabled:=false;
    btn_shu.Enabled:=false;
    btn_shuanggota.Enabled:=False;
    Master1.Enabled:=false;
    ransaksi1.Enabled:=False;
    Laporan1.Enabled:=False;
    btn_login.Caption:='Login';
    btn_login.ImageIndex:=4;
    UbahPassword1.Enabled:=False;
    _idlog:='0';
  end
  else if (kondisi='USIPA') then
  begin
    btn_dinas.Enabled:=true;
    btn_anggota.Enabled:=true;
    Anggota1.Enabled:=True;
    Dinas1.Enabled:=True;
    Akun1.Enabled:=False;
    btn_akun.Enabled:=False;
    btn_tagihan.Enabled:=true;
    btn_simpanan.Enabled:=true;
    btn_pinjaman.Enabled:=true;
    agihan1.Enabled:=True;
    Simpanan1.Enabled:=True;
    Pinjaman1.Enabled:=True;
    LabaRugi1.Enabled:=false;
    shu1.Enabled:=False;
    SHUAnggota1.Enabled:=False;
    btn_lr.Enabled:=false;
    btn_shu.Enabled:=false;
    btn_shuanggota.Enabled:=False;
    Master1.Enabled:=true;
    ransaksi1.Enabled:=true;
    Laporan1.Enabled:=true;
    Simpanan2.Enabled:=True;
    DanaTertagih1.Enabled:=true;
    SHU2.Enabled:=false;
    btn_login.Caption:='Logout';
    btn_login.ImageIndex:=9;
    UbahPassword1.Enabled:=true;
    _idlog:='1';
  end
  else if (kondisi='Bendahara Koperasi') then
  begin
    btn_dinas.Enabled:=false;
    btn_anggota.Enabled:=false;
    Anggota1.Enabled:=false;
    Dinas1.Enabled:=false;
    Akun1.Enabled:=true;
    btn_akun.Enabled:=true;
    btn_tagihan.Enabled:=false;
    btn_simpanan.Enabled:=false;
    btn_pinjaman.Enabled:=false;
    agihan1.Enabled:=false;
    Simpanan1.Enabled:=false;
    Pinjaman1.Enabled:=false;
    LabaRugi1.Enabled:=true;
    shu1.Enabled:=true;
    SHUAnggota1.Enabled:=true;
    btn_lr.Enabled:=true;
    btn_shu.Enabled:=true;
    btn_shuanggota.Enabled:=true;
    Master1.Enabled:=true;
    ransaksi1.Enabled:=true;
    Laporan1.Enabled:=true;
    Simpanan2.Enabled:=false;
    DanaTertagih1.Enabled:=false;
    SHU2.Enabled:=true;
    btn_login.Caption:='Logout';
    btn_login.ImageIndex:=9;
    UbahPassword1.Enabled:=true;
    _idlog:='2';
  end
  else if (kondisi='Bendahara Anggota') then
  begin
    btn_dinas.Enabled:=false;
    btn_anggota.Enabled:=false;
    Anggota1.Enabled:=false;
    Dinas1.Enabled:=false;
    Akun1.Enabled:=false;
    btn_akun.Enabled:=false;
    btn_tagihan.Enabled:=true;
    btn_simpanan.Enabled:=false;
    btn_pinjaman.Enabled:=false;
    agihan1.Enabled:=True;
    Simpanan1.Enabled:=false;
    Pinjaman1.Enabled:=false;
    LabaRugi1.Enabled:=false;
    shu1.Enabled:=False;
    SHUAnggota1.Enabled:=false;
    btn_lr.Enabled:=false;
    btn_shu.Enabled:=false;
    btn_shuanggota.Enabled:=false;
    Master1.Enabled:=true;
    ransaksi1.Enabled:=true;
    Laporan1.Enabled:=true;
    Simpanan2.Enabled:=false;
    DanaTertagih1.Enabled:=false;
    SHU2.Enabled:=true;
    btn_login.Caption:='Logout';
    btn_login.ImageIndex:=9;
    UbahPassword1.Enabled:=true;
    _idlog:='3';
  end
  else if (kondisi='Ketua Koperasi') then
  begin
    btn_dinas.Enabled:=true;
    btn_anggota.Enabled:=true;
    Anggota1.Enabled:=true;
    Dinas1.Enabled:=true;
    Akun1.Enabled:=true;
    btn_akun.Enabled:=true;
    btn_tagihan.Enabled:=true;
    btn_simpanan.Enabled:=true;
    btn_pinjaman.Enabled:=true;
    agihan1.Enabled:=True;
    Simpanan1.Enabled:=true;
    Pinjaman1.Enabled:=true;
    LabaRugi1.Enabled:=true;
    shu1.Enabled:=true;
    SHUAnggota1.Enabled:=true;
    btn_lr.Enabled:=true;
    btn_shu.Enabled:=true;
    btn_shuanggota.Enabled:=true;
    Master1.Enabled:=true;
    ransaksi1.Enabled:=true;
    Laporan1.Enabled:=true;
    Simpanan2.Enabled:=true;
    DanaTertagih1.Enabled:=true;
    SHU2.Enabled:=true;
    btn_login.Caption:='Logout';
    btn_login.ImageIndex:=9;
    UbahPassword1.Enabled:=true;
    _idlog:='4';
  end;

end;

procedure TFrm_Utama.koneksidb;
begin
  with condb do
  begin
    ConnectionString:='db_koperasigustori';
    LoginPrompt:=False;
    Connected:=True;
  end;
end;

procedure TFrm_Utama.FormShow(Sender: TObject);
begin
  koneksidb;
  keadaanform('Awal');
  keadaantabs('Awal');
end;

procedure TFrm_Utama.keadaantabs(kondisi: string);
begin
  if (kondisi='Awal') then
  begin
    ts_dinas.TabVisible:=False;
    ts_anggota.TabVisible:=false;
    ts_akun.TabVisible:=False;

    ts_tagihan.TabVisible:=False;
    ts_simpanan.TabVisible:=false;
    ts_pinjaman.TabVisible:=False;
    ts_angsuran.TabVisible:=False;
    ts_lr.TabVisible:=false;
    ts_shu.TabVisible:=False;
    ts_shuanggota.TabVisible:=False;

    ts_laporanlr.TabVisible:=false;
    ts_laporandanatertagih.TabVisible:=False;
    ts_laporanshu.TabVisible:=False;

    ts_login.TabVisible:=false;
    ts_ubahpass.TabVisible:=False;

  end
  else if (kondisi='TabAkun') then
  begin
    Tab_Utama.ActivePage:=ts_akun;
    if ts_akun.TabVisible=False then
    begin
      ts_akun.TabVisible:=True;
      isiform(ts_akun,Frm_akun);
    end;
    koneksitabel('tb_akun');
  end
  else if (kondisi='TabDinas') then
  begin
    Tab_Utama.ActivePage:=ts_dinas;
    if ts_dinas.TabVisible=False then
    begin
      ts_dinas.TabVisible:=True;
      isiform(ts_dinas,Frm_dinas);
    end;
    koneksitabel('tb_dinas');
  end
  else if (kondisi='TabAnggota') then
  begin
    Tab_Utama.ActivePage:=ts_anggota;
    if ts_anggota.TabVisible=False then
    begin
      ts_anggota.TabVisible:=True;
      isiform(ts_anggota,Frm_anggota);
    end;
    koneksitabel('tb_anggota');
    koneksitabel('vw_anggota');
    koneksitabel('tb_dinas');
  end
  else if (kondisi='TabTagihan') then
  begin
    Tab_Utama.ActivePage:=ts_tagihan;
    if ts_tagihan.TabVisible=False then
    begin
      ts_tagihan.TabVisible:=True;
      isiform(ts_tagihan,Frm_tagihan);
    end;
    koneksitabel('tb_tagihan');
    koneksitabel('vw_tagihan');
    gayatabel('vw_tagihan');
  end
   else if (kondisi='TabCetakLR') then
  begin
    Tab_Utama.ActivePage:=ts_laporanlr;
    if ts_laporanlr.TabVisible=False then
    begin
      ts_laporanlr.TabVisible:=True;
      isiform(ts_laporanlr,Frm_cetakLR);
    end;
  end
  else if (kondisi='TabCetakSHU') then
  begin
    Tab_Utama.ActivePage:=ts_laporanshu;
    if ts_laporanshu.TabVisible=False then
    begin
      ts_laporanshu.TabVisible:=True;
      isiform(ts_laporanshu,Frm_cetakSHU);
    end;
  end
   else if (kondisi='TabCetakDana') then
  begin
    Tab_Utama.ActivePage:=ts_laporandanatertagih;
    if ts_laporandanatertagih.TabVisible=False then
    begin
      ts_laporandanatertagih.TabVisible:=True;
      isiform(ts_laporandanatertagih,Frm_cetakDanaTertagih);
    end;
  end
  else if (kondisi='TabPinjaman') then
  begin
    Tab_Utama.ActivePage:=ts_pinjaman;
    if ts_pinjaman.TabVisible=False then
    begin
      ts_pinjaman.TabVisible:=True;
      isiform(ts_pinjaman,Frm_pinjaman);
    end;
    koneksitabel('tb_pinjaman');
    koneksitabel('vw_pinjaman');
    gayatabel('vw_pinjaman');
  end
  else if (kondisi='TabSimpanan') then
  begin
    Tab_Utama.ActivePage:=ts_simpanan;
    if ts_simpanan.TabVisible=False then
    begin
      ts_simpanan.TabVisible:=True;
      isiform(ts_simpanan,Frm_simpanan);
    end;
    koneksitabel('vw_tagihan');
    koneksitabel('tb_simpanan');
    koneksitabel('vw_simpanan');
    //koneksitabel('tb_angsur');
    gayatabel('vw_tagihan');
    gayatabel('vw_simpanan');
  end
  else if (kondisi='TabLabaRugi') then
  begin
    Tab_Utama.ActivePage:=ts_lr;
    if ts_lr.TabVisible=False then
    begin
      ts_lr.TabVisible:=True;
      isiform(ts_lr,Frm_lr);
    end;
    koneksitabel('tb_lr');
    koneksitabel('vw_lr');
    koneksitabel('tb_akun');
    gayatabel('vw_lr');
  end
  else if (kondisi='TabSHU') then
  begin
    Tab_Utama.ActivePage:=ts_shu;
    if ts_shu.TabVisible=False then
    begin
      ts_shu.TabVisible:=True;
      isiform(ts_shu,Frm_shu);
    end;
    koneksitabel('tb_shu');
    koneksitabel('vw_shu');
    koneksitabel('vw_lr');
    koneksitabel('vw_simpanan');
    gayatabel('vw_shu');
  end
  else if (kondisi='TabSHUanggota') then
  begin
    Tab_Utama.ActivePage:=ts_shuanggota;
    if ts_shuanggota.TabVisible=False then
    begin
      ts_shuanggota.TabVisible:=True;
      isiform(ts_shuanggota,Frm_shuanggota);
    end;
    koneksitabel('tb_shuanggota');
    koneksitabel('vw_shu');
    koneksitabel('vw_shuanggota');
    koneksitabel('vw_simpanan');
    koneksitabel('tb_simpanan');
    koneksitabel('vw_anggota');
    gayatabel('vw_shuanggota');
    gayatabel('vw_shu');
  end
  else if (kondisi='TabLogin') then
  begin
    Tab_Utama.ActivePage:=ts_login;
    if ts_login.TabVisible=False then
    begin
      ts_login.TabVisible:=True;
      isiform(ts_login,Frm_login);
    end;
    koneksitabel('tb_pengguna');
  end
  else if (kondisi='TabUbah') then
  begin
    Tab_Utama.ActivePage:=ts_ubahpass;
    if ts_ubahpass.TabVisible=False then
    begin
      ts_ubahpass.TabVisible:=True;
      isiform(ts_ubahpass,Frm_ubah);
    end;
    koneksitabel('tb_pengguna');
  end
end;

procedure TFrm_Utama.btn_akunClick(Sender: TObject);
begin
  keadaantabs('TabAkun');
end;

procedure TFrm_Utama.btn_dinasClick(Sender: TObject);
begin
  keadaantabs('TabDinas');
end;

procedure TFrm_Utama.btn_anggotaClick(Sender: TObject);
begin
  keadaantabs('TabAnggota');
end;

procedure TFrm_Utama.idsimpanan;
var
  dig1,dig2,dig3:Integer;
  query:string;
begin
  query:='select * from tb_simpanan where idsimpanan like "S%" order by idsimpanan asc';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_simpanan);
  if Frm_Utama.Q_simpanan.Recordset.RecordCount=0 then
  begin
    dig1:=0;
    dig2:=0;
    dig3:=1;
  end
  else
  begin
    Frm_Utama.Q_simpanan.Last;
    dig3:=StrToInt(MidStr(Frm_Utama.Q_simpanan.FieldValues['idsimpanan'],4,1))+1;
    dig2:=StrToInt(MidStr(Frm_Utama.Q_simpanan.FieldValues['idsimpanan'],3,1));
    dig1:=StrToInt(MidStr(Frm_Utama.Q_simpanan.FieldValues['idsimpanan'],2,1));

    if dig3>9 then
        begin
          dig3:=0;
          dig2:=dig2+1;
        end
        else
        begin
          dig3:=dig3;
        end;

        if dig2>9 then
        begin
          dig2:=0;
          dig1:=dig1+1;
        end
        else
        begin
          dig2:=dig2;
        end;

        if dig1>9 then
        begin
          MessageDlg('ID Simpanan melebihi batas !!!! ' + chr(13) +
          'Hubungi Pengembang Sistem (Administrator) '+ chr(13) +
          '---->----- ',mtError,[mbOK],0);
          Application.Terminate;
        end
        else
        begin
          dig1:=dig1;
        end;
  end;
  _idsimpanan:='S'+IntToStr(dig1)+IntToStr(dig2)+IntToStr(dig3)+FormatDateTime('mmyyy',now);
end;

procedure TFrm_Utama.btn_tagihanClick(Sender: TObject);
begin
  keadaantabs('TabTagihan');
end;

procedure TFrm_Utama.btn_pinjamanClick(Sender: TObject);
begin
  keadaantabs('TabPinjaman');
end;

procedure TFrm_Utama.btn_simpananClick(Sender: TObject);
begin
  keadaantabs('TabSimpanan');
end;

procedure TFrm_Utama.btn_lrClick(Sender: TObject);
begin
  keadaantabs('TabLabaRugi');
end;

procedure TFrm_Utama.btn_shuClick(Sender: TObject);
begin
  keadaantabs('TabSHU');
end;

procedure TFrm_Utama.btn_shuanggotaClick(Sender: TObject);
begin
  keadaantabs('TabSHUanggota');
end;

procedure TFrm_Utama.btn_loginClick(Sender: TObject);
begin
  if btn_login.Caption='Login' then
    keadaantabs('TabLogin')
  else
    keadaanform('Awal');
end;

procedure TFrm_Utama.UbahPassword1Click(Sender: TObject);
begin
  keadaantabs('TabUbah');
end;

procedure TFrm_Utama.KeluarAplikasi1Click(Sender: TObject);
begin
  btn_outClick(Sender);
end;

procedure TFrm_Utama.Dinas1Click(Sender: TObject);
begin
  btn_dinasClick(sender);
end;

procedure TFrm_Utama.Anggota1Click(Sender: TObject);
begin
  btn_anggotaClick(sender);
end;

procedure TFrm_Utama.Akun1Click(Sender: TObject);
begin
  btn_akunClick(sender);
end;

procedure TFrm_Utama.agihan1Click(Sender: TObject);
begin
  btn_tagihanClick(sender);
end;

procedure TFrm_Utama.Simpanan1Click(Sender: TObject);
begin
  btn_simpananClick(sender);
end;

procedure TFrm_Utama.Pinjaman1Click(Sender: TObject);
begin
  btn_pinjamanClick(sender);
end;

procedure TFrm_Utama.LabaRugi1Click(Sender: TObject);
begin
  btn_lrClick(sender);
end;

procedure TFrm_Utama.SHU1Click(Sender: TObject);
begin
  btn_shuClick(sender);
end;

procedure TFrm_Utama.SHUAnggota1Click(Sender: TObject);
begin
  btn_shuanggotaClick(sender);
end;

procedure TFrm_Utama.Simpanan2Click(Sender: TObject);
begin
  keadaantabs('TabCetakLR');
end;

procedure TFrm_Utama.DanaTertagih1Click(Sender: TObject);
begin
  keadaantabs('TabCetakDana');
end;

procedure TFrm_Utama.SHU2Click(Sender: TObject);
begin
  keadaantabs('TabCetakSHU');
end;

end.

///Form Utama Fix menerima
//form dinas fix
//form akun fix
//form anggota fix
//form pinjaman fix
//form tagihan fix
//form simpanan fix
//form shu fix
//form LR fix

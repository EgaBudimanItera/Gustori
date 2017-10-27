unit U_Tagihan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,DateUtils,
  ComCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Dialogs, jpeg, OleCtrls, Crystal_TLB;

type
  TFrm_tagihan = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    edt_idanggota: TEdit;
    grp2: TGroupBox;
    edt_Nip: TEdit;
    grp8: TGroupBox;
    grp5: TGroupBox;
    tb_tagihan: TDBGrid;
    grp3: TGroupBox;
    btn_Btambah: TBitBtn;
    btn_Bsimpan: TBitBtn;
    btn_Bkeluar: TBitBtn;
    grp4: TGroupBox;
    edt_cari: TEdit;
    edt_Nama: TEdit;
    grp6: TGroupBox;
    grp7: TGroupBox;
    grp9: TGroupBox;
    grp10: TGroupBox;
    grp12: TGroupBox;
    edt_haji: TEdit;
    grp13: TGroupBox;
    edt_art: TEdit;
    grp14: TGroupBox;
    edt_artke: TEdit;
    edt_dapen: TEdit;
    grp15: TGroupBox;
    grp16: TGroupBox;
    btn_Cetak: TBitBtn;
    edt_Wajib: TEdit;
    edt_sukarela: TEdit;
    edt_sosial: TEdit;
    grp11: TGroupBox;
    edt_idTagihan: TEdit;
    grp17: TGroupBox;
    dtp_tgltagihan: TDateTimePicker;
    grp18: TGroupBox;
    edt_umroh: TEdit;
    edt_usipa: TEdit;
    edt_usipake: TEdit;
    crystlrprt_1: TCrystalReport;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure kondisi(a:Integer);
    procedure btn_BsimpanClick(Sender: TObject);
    procedure tb_tagihanDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_cariChange(Sender: TObject);
    procedure btn_BtambahClick(Sender: TObject);
    procedure btn_BhapusClick(Sender: TObject);
    procedure simpan;
    procedure btn_CetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_tagihan: TFrm_tagihan;

implementation

uses
  U_Utama, ADODB, DB, U_CariAnggota;

{$R *.dfm}

procedure TFrm_tagihan.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_tagihan.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_tagihan.TabVisible:=False;
end;

procedure TFrm_tagihan.FormShow(Sender: TObject);
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_tagihan');
    koneksitabel('vw_tagihan');
    koneksitabel('tb_pinjaman');
    koneksitabel('vw_pinjaman');
    koneksitabel('tb_anggota');
    tb_tagihan.DataSource:=dts_tagihan;
    bersih(Self);
    kondisi(0);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=30-20;
    idsimpanan;
    edt_idTagihan.Text:=_idsimpanan;
    edt_umroh.Text:='0';
    edt_haji.Text:='0';
    edt_sukarela.Text:='0';
    edt_sosial.Text:='0';
    edt_Wajib.Text:='0';
    edt_dapen.Text:='0';
    edt_usipa.Text:='0';
    edt_usipake.Text:='0';
    edt_art.Text:='0';
    edt_usipake.Text:='0';
    edt_artke.Text:='0';
    gayatabel('vw_tagihan');
    if (_idlog='3') then
      btn_Bsimpan.Enabled:=False;
  end;
end;

procedure TFrm_tagihan.kondisi(a: Integer);
begin
  if (a=0) then
  begin
    btn_Bsimpan.Enabled:=True;

  end
  else
  begin
    btn_Bsimpan.Enabled:=false;
  
  end;
end;

procedure TFrm_tagihan.btn_BsimpanClick(Sender: TObject);
var

  tanggal,query:string;
begin
  tanggal:=FormatDateTime('dd',now);
  if (StrToInt(tanggal)>=25) and (StrToInt(tanggal)<=31) then
  begin
   { MessageDlg('Masa Untuk Input Tagihan',mtWarning,[mbok],0);
    Exit; }
   query:='select * from tb_simpanan where tgltagih between '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',startofthemonth(now))) +' and '+
    QuotedStr(FormatDateTime('yyyy-mm-dd',EndOfTheMonth(now)))+' and status="Tagihan" ';
   Frm_Utama.modellihatdata(query,Frm_Utama.Q_tagihan);
   if Frm_Utama.Q_tagihan.Recordset.RecordCount=0 then
   begin
    simpan;
   end
   else
   begin
    MessageDlg('Tagihan Bulan Depan Sudah DIbuat',mtError,[mbok],0);
    Exit;
   end;
  end
  else
  begin
    MessageDlg('Bukan Masa Untuk Input Tagihan',mtWarning,[mbok],0);
    Exit;
  end;
  FormShow(Sender);
end;

procedure TFrm_tagihan.tb_tagihanDrawColumnCell(Sender: TObject;
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

procedure TFrm_tagihan.edt_cariChange(Sender: TObject);
var
query:string;
begin
  query:='select * from vw_simpanan where (namadinas like "%'+edt_cari.Text+'%" or namaanggota like "%'+
    edt_cari.Text+'%" or nip like "%'+edt_cari.Text+'%") and status="Tagihan"';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwtagihan);
  Frm_Utama.gayatabel('vw_tagihan');
end;



procedure TFrm_tagihan.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_tagihan.btn_BhapusClick(Sender: TObject);
var
  query:string;
begin
  if MessageDlg('Ingin Dihapus?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    query:='delete from tb_tagihan where idtagihan='+
        QuotedStr(edt_idTagihan.Text)+'';
    Frm_Utama.modelcrud(query,Frm_Utama.Q_tagihan);
    MessageDlg('Data Telah Dihapus',mtInformation,[mbok],0);
    FormShow(Sender);
  end;
end;

procedure TFrm_tagihan.simpan;
var
  query,query2,idpinjaman,query3:string;
begin
    with Frm_Utama do
    begin
      query:='select * from tb_anggota order by idanggota asc';
      modellihatdata(query,Q_anggota);
      if Q_anggota.Recordset.RecordCount=0 then
      begin
        MessageDlg('Tidak Ada Anggota',mtWarning,[mbok],0);
        Exit;
      end
      else
      begin
        Q_anggota.First;
        while not Q_anggota.Eof do
        begin
          edt_idanggota.Text:=Q_anggota.FieldValues['idanggota'];
          edt_Wajib.Text:=Q_anggota.FieldValues['sosial'];
          edt_sukarela.Text:=Q_anggota.FieldValues['sukarela'];
          edt_sosial.Text:='3000';
          edt_dapen.Text:=Q_anggota.FieldValues['dapen'];
          edt_haji.Text:=Q_anggota.FieldValues['haji'];
          edt_umroh.Text:=Q_anggota.FieldValues['umroh'];
          with Q_pinjaman do
          begin
            Close;
            SQL.Text:='select * from tb_pinjaman where idanggota='+
              QuotedStr(edt_idanggota.Text) +' and jenispinjaman='+
              QuotedStr('USIPA') +' and sisapinjaman>0 ';
            Open;
            if Recordset.RecordCount=0 then
            begin
              edt_usipa.Text:='0';
              edt_usipake.Text:='0';
            end
            else
            begin
              edt_usipa.Text:=Q_pinjaman.FieldValues['angsuran'];
              edt_usipake.Text:=Q_pinjaman.FieldValues['ke'];
              idpinjaman:=Q_pinjaman.FieldValues['idpinjaman'];
              query3:='update tb_pinjaman set ke='+
                QuotedStr(IntToStr(StrToInt(edt_usipake.Text)+1))+' where idpinjaman='+
                QuotedStr(idpinjaman)+'';
              modelcrud(query3,Q_pinjaman);
            end;
          end;
          with Q_pinjaman do
          begin
            Close;
            SQL.Text:='select * from tb_pinjaman where idanggota='+
              QuotedStr(edt_idanggota.Text) +' and jenispinjaman='+
              QuotedStr('ART') +' and sisapinjaman>0 ';
            Open;
            if Recordset.RecordCount=0 then
            begin
              edt_art.Text:='0';
              edt_artke.Text:='0';
            end
            else
            begin
              edt_art.Text:=Q_pinjaman.FieldValues['angsuran'];
              edt_artke.Text:=Q_pinjaman.FieldValues['ke'];
              idpinjaman:=Q_pinjaman.FieldValues['idpinjaman'];
              query3:='update tb_pinjaman set ke='+
                QuotedStr(IntToStr(StrToInt(edt_usipake.Text)+1))+' where idpinjaman='+
                QuotedStr(idpinjaman)+'';
              modelcrud(query3,Q_pinjaman);
            end;
          end;
          query2:='insert into tb_simpanan values('+
            QuotedStr(edt_idTagihan.Text)+','+
            QuotedStr(FormatDateTime('yyyy-mm-dd',now))+','+
            QuotedStr(FormatDateTime('yyyy-mm-dd',now))+','+
            QuotedStr(edt_idanggota.Text)+','+
            QuotedStr('0')+','+
            QuotedStr(edt_Wajib.Text)+','+
            QuotedStr(edt_sukarela.Text)+','+
            QuotedStr(edt_sosial.Text)+','+
            QuotedStr(edt_dapen.Text)+','+
            QuotedStr(edt_haji.Text)+','+
            QuotedStr(edt_umroh.Text)+','+
            QuotedStr('0')+','+
            QuotedStr('0')+','+
            QuotedStr(edt_art.Text)+','+
            QuotedStr(edt_artke.Text)+','+
            QuotedStr(edt_usipa.Text)+','+
            QuotedStr(edt_usipake.Text)+','+
            QuotedStr('Tagihan')+')';
          modelcrud(query2,Q_tagihan);
          idsimpanan;
          edt_idTagihan.Text:=_idsimpanan;
          Q_anggota.Next;
        end;
      end;
    end;
end;

procedure TFrm_tagihan.btn_CetakClick(Sender: TObject);
begin
  with crystlrprt_1 do
  begin
    ReportFileName:='Laporan/Tagihan.rpt';
    SelectionFormula:='{vw_simpanan.status}='''+'Tagihan'+'''';
    Destination:=crptToWindow;
    ReportTitle:=FormatDateTime('mmmm',IncMonth(Now,1))  ;
    WindowState:=crptMaximized;
    RetrieveDataFiles;
    Action:=1;
  end;
end;

end.

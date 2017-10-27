unit U_Pinjaman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls;

type
  TFrm_pinjaman = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    edt_idanggota: TEdit;
    grp2: TGroupBox;
    edt_Nip: TEdit;
    grp8: TGroupBox;
    grp5: TGroupBox;
    tb_pinjaman: TDBGrid;
    grp3: TGroupBox;
    btn_Btambah: TBitBtn;
    btn_Bsimpan: TBitBtn;
    btn_Bhapus: TBitBtn;
    btn_Bkeluar: TBitBtn;
    grp4: TGroupBox;
    edt_cari: TEdit;
    edt_Nama: TEdit;
    grp6: TGroupBox;
    grp7: TGroupBox;
    grp9: TGroupBox;
    grp10: TGroupBox;
    grp12: TGroupBox;
    edt_jumlahpinjam: TEdit;
    dtp_tglpinjam: TDateTimePicker;
    cb_jenis: TComboBox;
    grp15: TGroupBox;
    edt_angsuran: TEdit;
    edt_idpinjaman: TEdit;
    lbl_1: TLabel;
    edt_lama: TEdit;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure kondisi(a:Integer);
    procedure btn_BsimpanClick(Sender: TObject);
    procedure tb_pinjamanDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_cariChange(Sender: TObject);
    procedure tb_pinjamanCellClick(Column: TColumn);
    procedure btn_BtambahClick(Sender: TObject);
    procedure btn_BhapusClick(Sender: TObject);
    procedure cb_jenisKeyPress(Sender: TObject; var Key: Char);
    procedure edt_idanggotaClick(Sender: TObject);
    procedure idpinjaman;
    procedure edt_lamaChange(Sender: TObject);
    procedure edt_jumlahpinjamChange(Sender: TObject);
    procedure edt_lamaExit(Sender: TObject);
    procedure edt_jumlahpinjamExit(Sender: TObject);
    procedure angsuran;
    procedure edt_angsuranChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_pinjaman: TFrm_pinjaman;

  lama,jumlahpinjam,bunga,total:Currency;
  angsurbulan :Real;
implementation

uses
  U_Utama, ADODB, DB, U_CariAnggota;

{$R *.dfm}

procedure TFrm_pinjaman.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_pinjaman.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_pinjaman.TabVisible:=False;
end;

procedure TFrm_pinjaman.FormShow(Sender: TObject);
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_anggota');
    koneksitabel('tb_pinjaman');
    koneksitabel('vw_pinjaman');
    tb_pinjaman.DataSource:=dts_pinjaman;
    bersih(Self);
    kondisi(0);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=30-20;
    edt_lama.Text:='0';
    edt_jumlahpinjam.Text:='0';
    edt_angsuran.Text:='0';
    idpinjaman;
    gayatabel('vw_pinjaman');
  end;
end;

procedure TFrm_pinjaman.kondisi(a: Integer);
begin
  if (a=0) then
  begin
    btn_Bsimpan.Enabled:=True;
    btn_Bhapus.Enabled:=false;
  end
  else
  begin
    btn_Bsimpan.Enabled:=false;
    btn_Bhapus.Enabled:=true;
  end;
end;

procedure TFrm_pinjaman.btn_BsimpanClick(Sender: TObject);
var
  query:string;
begin
  query:='select * from tb_pinjaman where idanggota='+
    QuotedStr(edt_idanggota.Text)+' and jenispinjaman='+
    QuotedStr(cb_jenis.Text)+' and sisapinjaman>0';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_pinjaman);
  if Frm_Utama.Q_pinjaman.Recordset.RecordCount=0 then
  begin
    query:='insert into tb_pinjaman values('+
    QuotedStr(edt_idpinjaman.Text)+','+
    QuotedStr(FormatDateTime('yyyy-mm-dd',dtp_tglpinjam.Date))+','+
    QuotedStr(edt_idanggota.Text)+','+
    QuotedStr(cb_jenis.Text)+','+
    QuotedStr(CurrToStr(Frm_Utama.hapusformat(edt_lama)))+','+
    QuotedStr(CurrToStr(Frm_Utama.hapusformat(edt_jumlahpinjam)))+','+
    QuotedStr(Format('%f',[angsurbulan]))+','+
    QuotedStr(CurrToStr(Frm_Utama.hapusformat(edt_jumlahpinjam)))+','+
    QuotedStr('1')+')';

    Frm_Utama.modelcrud(query,Frm_Utama.Q_pinjaman);
    MessageDlg('Berhasil Disimpan',mtInformation,[mbok],0);
    FormShow(Sender);
  end
  else
  begin
    MessageDlg('Sudah Ada Pinjaman',mtInformation,[mbok],0);
    Exit;
  end;

end;

procedure TFrm_pinjaman.tb_pinjamanDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Frm_utama do
  begin
    if dts_pinjaman.DataSet.RecNo>0 then
    begin
      if Column.Title.Caption = 'No' then
      begin
        tb_pinjaman.Canvas.TextOut(Rect.Left  + 2, rect.Top,IntToStr(dts_pinjaman.DataSet.RecNo));
      end;
    end;
  end;  
end;

procedure TFrm_pinjaman.edt_cariChange(Sender: TObject);
var
query:string;
begin
  query:='select * from vw_pinjaman where namadinas like "%'+edt_cari.Text+'%" or namaanggota like "%'+edt_cari.Text+'%" or nip like "%'+edt_cari.Text+'%" ';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwpinjaman);
  Frm_Utama.gayatabel('vw_pinjaman');
end;

procedure TFrm_pinjaman.tb_pinjamanCellClick(Column: TColumn);
begin
  with Frm_Utama.Q_vwpinjaman do
  begin
   if Recordset.RecordCount<>0 then
   begin
    edt_idanggota.Text:=FieldValues['idanggota'];
    edt_Nip.Text:=FieldValues['nip'];
    edt_Nama.Text:=FieldValues['namaanggota'];
    edt_idpinjaman.Text:=FieldValues['idpinjaman'];
    cb_jenis.Text:=FieldValues['jenispinjaman'];
    edt_lama.Text:=FieldValues['lamapinjaman'];
    edt_jumlahpinjam.Text:=FieldValues['jumlahpinjaman'];
    edt_angsuran.Text:=FieldValues['angsuran'];
    dtp_tglpinjam.date:=FieldValues['tglpinjaman'];
    kondisi(1);
   end;
  end;
end;

procedure TFrm_pinjaman.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_pinjaman.btn_BhapusClick(Sender: TObject);
var
  query:string;
begin
  if MessageDlg('Ingin Dihapus?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    query:='delete from tb_pinjaman where idpinjaman='+
      QuotedStr(edt_idpinjaman.Text)+'';
    MessageDlg('Data Telah Dihapus',mtInformation,[mbok],0);
    FormShow(Sender);
  end;
end;

procedure TFrm_pinjaman.cb_jenisKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_pinjaman.edt_idanggotaClick(Sender: TObject);
begin
  Frm_carianggota.ShowModal;
end;

procedure TFrm_pinjaman.idpinjaman;
var
  dig1,dig2,dig3:Integer;
  query:string;
begin
  query:='select * from tb_pinjaman where idpinjaman like "P%" order by idpinjaman asc';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_pinjaman);
  if Frm_Utama.Q_pinjaman.Recordset.RecordCount=0 then
  begin
    dig1:=0;
    dig2:=0;
    dig3:=1;
  end
  else
  begin
    Frm_Utama.Q_pinjaman.Last;
    dig3:=StrToInt(MidStr(Frm_Utama.Q_pinjaman.FieldValues['idpinjaman'],4,1))+1;
    dig2:=StrToInt(MidStr(Frm_Utama.Q_pinjaman.FieldValues['idpinjaman'],3,1));
    dig1:=StrToInt(MidStr(Frm_Utama.Q_pinjaman.FieldValues['idpinjaman'],2,1));

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
          MessageDlg('ID Pinjaman melebihi batas !!!! ' + chr(13) +
          'Hubungi Pengembang Sistem (Administrator) '+ chr(13) +
          '---->----- ',mtError,[mbOK],0);
          Application.Terminate;
        end
        else
        begin
          dig1:=dig1;
        end;
  end;
  edt_idpinjaman.Text:='P'+IntToStr(dig1)+IntToStr(dig2)+IntToStr(dig3)+FormatDateTime('mmyyyy',now) ;

end;

procedure TFrm_pinjaman.edt_lamaChange(Sender: TObject);
begin
  if (edt_lama.Text='0') then edt_lama.Text:='0'
  else
  Frm_Utama.ribuan(edt_lama);
end;

procedure TFrm_pinjaman.edt_jumlahpinjamChange(Sender: TObject);
begin
  if (edt_jumlahpinjam.Text='0') then edt_jumlahpinjam.Text:='0'
  else
  Frm_Utama.ribuan(edt_jumlahpinjam);
end;

procedure TFrm_pinjaman.edt_lamaExit(Sender: TObject);
begin
  if (edt_lama.Text='') then edt_lama.Text:='0';
  //angsuran;
end;

procedure TFrm_pinjaman.edt_jumlahpinjamExit(Sender: TObject);
begin
  if (edt_jumlahpinjam.Text='') then edt_jumlahpinjam.Text:='0';
  angsuran;
end;

procedure TFrm_pinjaman.angsuran;
begin
  if (edt_lama.Text<>'') and (edt_jumlahpinjam.Text<>'') then
  begin
    lama:=Frm_Utama.hapusformat(edt_lama);
    jumlahpinjam:=Frm_Utama.hapusformat(edt_jumlahpinjam);
    if (lama <= 24) then
      bunga:=13/100
    else
      bunga:=135/1000;
    angsurbulan:=(jumlahpinjam+(jumlahpinjam*bunga));
    angsurbulan:=angsurbulan/lama;

    total:=jumlahpinjam+(jumlahpinjam*bunga);
    edt_angsuran.Text:=Format('%f',[angsurbulan]);
   // edt_angsuran.Text:=Frm_Utama.ribuan(edt_angsuran);
  end;
end;

procedure TFrm_pinjaman.edt_angsuranChange(Sender: TObject);
begin
  {if (edt_angsuran.Text='0') then edt_angsuran.Text:='0'
  else
  Frm_Utama.ribuan(edt_angsuran);}
end;

end.

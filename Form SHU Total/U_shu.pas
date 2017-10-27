unit U_shu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrm_shu = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    edt_idshu: TEdit;
    grp2: TGroupBox;
    grp8: TGroupBox;
    grp5: TGroupBox;
    tb_shu: TDBGrid;
    grp3: TGroupBox;
    btn_Btambah: TBitBtn;
    btn_Bsimpan: TBitBtn;
    btn_Bhapus: TBitBtn;
    btn_Bkeluar: TBitBtn;
    edt_pendapatan: TEdit;
    grp6: TGroupBox;
    edt_beban: TEdit;
    grp7: TGroupBox;
    edt_simpanan: TEdit;
    grp9: TGroupBox;
    edt_bayar: TEdit;
    cb_tahun: TComboBox;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure edt_idshuKeyPress(Sender: TObject; var Key: Char);
    procedure edt_NamaAkunKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure kondisi(a:Integer);
    procedure btn_BsimpanClick(Sender: TObject);
    procedure tb_shuDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tb_shuCellClick(Column: TColumn);
    procedure btn_BtambahClick(Sender: TObject);
    procedure cb_tahunKeyPress(Sender: TObject; var Key: Char);
    procedure idshu;
    procedure gettotalpendapatan;
    procedure gettotalbeban;
    procedure edt_pendapatanExit(Sender: TObject);
    procedure edt_bebanExit(Sender: TObject);
    procedure edt_simpananExit(Sender: TObject);
    procedure edt_bayarExit(Sender: TObject);
    procedure edt_pendapatanChange(Sender: TObject);
    procedure edt_bebanChange(Sender: TObject);
    procedure edt_simpananChange(Sender: TObject);
    procedure edt_bayarChange(Sender: TObject);
    procedure getlaba;
    procedure getjasa;
    procedure cb_tahunChange(Sender: TObject);
    procedure btn_BhapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_shu: TFrm_shu;

implementation

uses
  U_Utama, ADODB;

{$R *.dfm}

procedure TFrm_shu.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_shu.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_shu.TabVisible:=False;
end;

procedure TFrm_shu.edt_idshuKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in['0'..'9',#13,#8]) then key:=#0;
end;

procedure TFrm_shu.edt_NamaAkunKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9']) then key:=#0;
end;

procedure TFrm_shu.FormShow(Sender: TObject);
var
  tahun:string;
  thn:Integer;
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_shu');
    koneksitabel('vw_shu');
    koneksitabel('vw_lr');
    koneksitabel('vw_simpanan');
    gayatabel('vw_shu');
    tb_shu.DataSource:=dts_shu;
    bersih(Self);
    kondisi(0);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=30-20;
    tahun:=FormatDateTime('yyyy',now);
    thn:=StrToInt(tahun);
    for thn:=thn-5 to thn+5 do
    begin
      cb_tahun.Items.Add(IntToStr(thn));
    end;
    idshu;
    edt_pendapatan.Text:='0';
    edt_beban.Text:='0';
    edt_simpanan.Text:='0';
    edt_bayar.Text:='0';
  end;
end;

procedure TFrm_shu.kondisi(a: Integer);
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

procedure TFrm_shu.btn_BsimpanClick(Sender: TObject);
var
  query:string;
begin
  query :='select * from tb_shu where tahunshu='+
    QuotedStr(cb_tahun.Text)+'';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_shu);
  if Frm_Utama.Q_shu.Recordset.RecordCount=0 then
  begin
    query:='insert into tb_shu values('+
    QuotedStr(edt_idshu.Text)+','+
    QuotedStr(FormatDateTime('yyyy-mm-dd',now))+','+
    QuotedStr(cb_tahun.Text)+','+
    QuotedStr(CurrToStr(Frm_Utama.hapusformat(edt_pendapatan)))+','+
    QuotedStr(CurrToStr(Frm_Utama.hapusformat(edt_beban)))+','+
    QuotedStr(CurrToStr(Frm_Utama.hapusformat(edt_simpanan)))+','+
    QuotedStr(CurrToStr(Frm_Utama.hapusformat(edt_bayar)))+')';
  Frm_Utama.modelcrud(query,Frm_Utama.Q_shu);
  MessageDlg('SHU tahun : '+cb_tahun.Text+' Berhasil disimpan',mtInformation,[mbok],0);
  FormShow(Sender);
  end
  else
  begin
     MessageDlg('SHU tahun : '+cb_tahun.Text+' Sudah Ada',mtInformation,[mbok],0);
     Exit;
  end;
end;

procedure TFrm_shu.tb_shuDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Frm_utama do
  begin
    if dts_shu.DataSet.RecNo>0 then
    begin
      if Column.Title.Caption = 'No' then
      begin
        tb_shu.Canvas.TextOut(Rect.Left  + 2, rect.Top,IntToStr(dts_shu.DataSet.RecNo));
      end;
    end;
  end;
end;

procedure TFrm_shu.tb_shuCellClick(Column: TColumn);
begin
  with Frm_Utama.Q_vwshu do
  begin
    if Recordset.RecordCount<>0 then
    begin
      edt_idshu.Text:=FieldValues['idshu'];
    cb_tahun.Text:=FieldValues['tahunshu'];
    edt_beban.Text:=FieldValues['totalbeban'];
    edt_pendapatan.Text:=FieldValues['totalpendapatan'];
    edt_simpanan.Text:=FieldValues['totalsimpanan'];
    edt_bayar.Text:=FieldValues['totalbayar'];
    kondisi(1);
    end;

  end;
end;

procedure TFrm_shu.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_shu.cb_tahunKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure TFrm_shu.idshu;
var
  dig1,dig2,dig3:Integer;
  query:string;
begin
  query:='select * from tb_shu where idshu like "S%" order by idshu asc';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_shu);
  if Frm_Utama.Q_shu.Recordset.RecordCount=0 then
  begin
    dig1:=0;
    dig2:=0;
    dig3:=1;
  end
  else
  begin
    Frm_Utama.Q_shu.Last;
    dig3:=StrToInt(MidStr(Frm_Utama.Q_shu.FieldValues['idshu'],4,1))+1;
    dig2:=StrToInt(MidStr(Frm_Utama.Q_shu.FieldValues['idshu'],3,1));
    dig1:=StrToInt(MidStr(Frm_Utama.Q_shu.FieldValues['idshu'],2,1));

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
          MessageDlg('ID SHU melebihi batas !!!! ' + chr(13) +
          'Hubungi Pengembang Sistem (Administrator) '+ chr(13) +
          '---->----- ',mtError,[mbOK],0);
          Application.Terminate;
        end
        else
        begin
          dig1:=dig1;
        end;
  end;
  edt_idshu.Text:='S'+IntToStr(dig1)+IntToStr(dig2)+IntToStr(dig3)+FormatDateTime('mmyyyy',now) ;
end;

procedure TFrm_shu.gettotalpendapatan;
var
  query:string;
begin
  query:='select sum(jumlah) as nominal from vw_lr where jenisakun="Pendapatan" and tahun ='+
    QuotedStr(cb_tahun.Text)+'';
  if (cb_tahun.Text<>'') then
  begin
    Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwlr);
    if Frm_Utama.Q_vwlr.FieldValues['nominal']=null then
      edt_pendapatan.Text:='0'
    else
      edt_pendapatan.Text:=Frm_Utama.Q_vwlr.FieldValues['nominal'];
  end;
end;

procedure TFrm_shu.edt_pendapatanExit(Sender: TObject);
begin
  if (edt_pendapatan.Text='') then edt_pendapatan.Text:='0';
end;

procedure TFrm_shu.edt_bebanExit(Sender: TObject);
begin
   if (edt_beban.Text='') then edt_beban.Text:='0';
end;

procedure TFrm_shu.edt_simpananExit(Sender: TObject);
begin
   if (edt_simpanan.Text='') then edt_simpanan.Text:='0';
end;

procedure TFrm_shu.edt_bayarExit(Sender: TObject);
begin
   if (edt_bayar.Text='') then edt_bayar.Text:='0';
end;

procedure TFrm_shu.edt_pendapatanChange(Sender: TObject);
begin
  if (edt_pendapatan.Text='0') then edt_pendapatan.Text:='0'
  else
    Frm_Utama.ribuan(edt_pendapatan);
end;

procedure TFrm_shu.edt_bebanChange(Sender: TObject);
begin
   if (edt_beban.Text='0') then edt_beban.Text:='0'
  else
    Frm_Utama.ribuan(edt_beban);
end;

procedure TFrm_shu.edt_simpananChange(Sender: TObject);
begin
   if (edt_simpanan.Text='0') then edt_simpanan.Text:='0'
  else
    Frm_Utama.ribuan(edt_simpanan);
end;

procedure TFrm_shu.edt_bayarChange(Sender: TObject);
begin
   if (edt_bayar.Text='0') then edt_bayar.Text:='0'
  else
    Frm_Utama.ribuan(edt_bayar);
end;

procedure TFrm_shu.gettotalbeban;
var
  query:string;
begin
  query:='select sum(jumlah) as nominal from vw_lr where jenisakun="Biaya" and tahun ='+
    QuotedStr(cb_tahun.Text)+'';
  if (cb_tahun.Text<>'') then
  begin
    Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwlr);
    if Frm_Utama.Q_vwlr.FieldValues['nominal']=null then
      edt_beban.Text:='0'
    else
      edt_beban.Text:=Frm_Utama.Q_vwlr.FieldValues['nominal'];
  end;

end;

procedure TFrm_shu.getlaba;
var
  query:string;
begin
  query:='select (sum(pokok)+sum(wajib)+sum(sukarela)+sum(jasa)+sum(laba))as total,year(tglsimpan) from vw_simpanan '+
         ' where status="Simpanan" and year(tglsimpan)='+
         QuotedStr(cb_tahun.Text)+'';
  if (cb_tahun.Text<>'') then
  begin
    Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwsimpanan);
    if Frm_Utama.Q_vwsimpanan.FieldValues['total']=null then
      edt_simpanan.Text:='0'
    else
      edt_simpanan.Text:=Frm_Utama.Q_vwsimpanan.FieldValues['total'];
  end;
end;

procedure TFrm_shu.getjasa;
var
  query:string;
begin
  query:='select (sum(art)+sum(usipa))as total,year(tglsimpan) from vw_simpanan '+
         ' where status="Simpanan" and year(tglsimpan)='+
         QuotedStr(cb_tahun.Text)+'';
  if (cb_tahun.Text<>'') then
  begin
    Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwsimpanan);
    if Frm_Utama.Q_vwsimpanan.FieldValues['total']=null then
      edt_bayar.Text:='0'
    else
      edt_bayar.Text:=Frm_Utama.Q_vwsimpanan.FieldValues['total'];
  end;
end;

procedure TFrm_shu.cb_tahunChange(Sender: TObject);
begin
  gettotalpendapatan;
  gettotalbeban;
  getlaba;
  getjasa;
end;

procedure TFrm_shu.btn_BhapusClick(Sender: TObject);
var
  query:string;
begin
  query:='delete from tb_shu where idshu='+
    QuotedStr(edt_idshu.Text)+'';
  if (MessageDlg('Yakin untuk menghapus??',mtConfirmation,[mbYes,mbno],0)=mryes) then
  begin
    Frm_Utama.modelcrud(query,Frm_Utama.Q_shu);
    MessageDlg('Berhasil dihapus',mtInformation,[mbok],0);
    FormShow(Sender);
  end;

end;

end.

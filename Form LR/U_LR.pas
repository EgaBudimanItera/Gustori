unit U_LR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrm_lr = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    edt_idlr: TEdit;
    grp2: TGroupBox;
    grp8: TGroupBox;
    cb_jenisakun: TComboBox;
    grp5: TGroupBox;
    tb_lr: TDBGrid;
    grp3: TGroupBox;
    btn_Btambah: TBitBtn;
    btn_Bsimpan: TBitBtn;
    btn_Bhapus: TBitBtn;
    btn_Bkeluar: TBitBtn;
    grp4: TGroupBox;
    edt_cari: TEdit;
    cb_tahun: TComboBox;
    grp6: TGroupBox;
    edt_nominal: TEdit;
    edt_namaakun: TEdit;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure edt_idlrKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure kondisi(a:Integer);
    procedure btn_BsimpanClick(Sender: TObject);
    procedure tb_lrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_cariChange(Sender: TObject);
    procedure tb_lrCellClick(Column: TColumn);
    procedure btn_BtambahClick(Sender: TObject);
    procedure btn_BhapusClick(Sender: TObject);
    procedure cb_jenisakunChange(Sender: TObject);
    procedure edt_nominalChange(Sender: TObject);
    procedure edt_nominalExit(Sender: TObject);
    procedure idLr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_lr: TFrm_lr;

implementation

uses
  U_Utama, ADODB, DB;

{$R *.dfm}

procedure TFrm_lr.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_lr.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_lr.TabVisible:=False;
end;

procedure TFrm_lr.edt_idlrKeyPress(Sender: TObject; var Key: Char);
begin
   if not(key in['0'..'9',#13,#8]) then key:=#0;
end;

procedure TFrm_lr.FormShow(Sender: TObject);
var
  tahun:string;
  thn:Integer;
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_lr');
    koneksitabel('tb_akun');
    koneksitabel('vw_lr');
    tb_lr.DataSource:=dts_lr;
    bersih(Self);
    kondisi(0);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=30-20;
    idLr;
    cb_jenisakun.Clear;
    with Q_akun do
    begin
      while Not Eof do
      begin
        cb_jenisakun.Items.Add(FieldValues['idakun']);
        Next;
      end;
    end;
    cb_tahun.Clear;
    tahun:=FormatDateTime('yyyy',now);
    thn:=StrToInt(tahun);
    for thn:=thn-5 to thn+5 do
    begin
      cb_tahun.Items.Add(IntToStr(thn));
    end;
    edt_nominal.Text:='0';
    gayatabel('vw_lr');
  end;
end;

procedure TFrm_lr.kondisi(a: Integer);
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

procedure TFrm_lr.btn_BsimpanClick(Sender: TObject);
var
  query,_idakun:string;
begin
  query:='select * from tb_lr where idakun='+
    QuotedStr(cb_jenisakun.Text)+' and tahun='+
    QuotedStr(cb_tahun.Text)+'';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_lr);
  if Frm_Utama.Q_lr.Recordset.RecordCount=0 then
  begin
    query:='insert into tb_lr values('+
    QuotedStr(edt_idlr.Text)+','+
    QuotedStr(cb_tahun.Text)+','+
    QuotedStr(cb_tahun.Text+'-01-01')+','+
    QuotedStr(cb_tahun.Text+'-12-31')+','+
    QuotedStr(cb_jenisakun.Text)+','+
    QuotedStr(CurrToStr(Frm_Utama.hapusformat(edt_nominal)))+')';

    Frm_Utama.modelcrud(query,Frm_Utama.Q_lr);
    MessageDlg('Sukses Menyimpan Data',mtInformation,[mbok],0);
    FormShow(Sender);
  end
  else
  begin
    MessageDlg('Data Sudah Ada',mtInformation,[mbok],0);
    Exit;
  end;
end;

procedure TFrm_lr.tb_lrDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Frm_utama do
  begin
    if dts_lr.DataSet.RecNo>0 then
    begin
      if Column.Title.Caption = 'No' then
      begin
        tb_lr.Canvas.TextOut(Rect.Left  + 2, rect.Top,IntToStr(dts_lr.DataSet.RecNo));
      end;
    end;
  end;
end;

procedure TFrm_lr.edt_cariChange(Sender: TObject);
var
query:string;
begin
  query:='select * from vw_lr where idakun like "%'+edt_cari.Text+'%" '+
         ' or namaakun like "%'+edt_cari.Text+'%" or tahun like "%'+edt_cari.Text+'%" ';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwlr);
end;

procedure TFrm_lr.tb_lrCellClick(Column: TColumn);
begin
  with Frm_Utama.Q_vwlr do
  begin
    if Recordset.RecordCount<>0 then
    begin
    edt_idlr.Text:=FieldValues['idlr'];
    cb_tahun.Text:=FieldValues['tahun'];
    edt_namaakun.Text:=FieldValues['namaakun'];
    cb_jenisakun.Text:=FieldValues['idakun'];
    edt_nominal.Text:=FieldValues['jumlah'];
    kondisi(1);
    end;
  end;
end;

procedure TFrm_lr.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_lr.btn_BhapusClick(Sender: TObject);
var
  query:string;
begin
  if MessageDlg('Ingin Dihapus?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    query:='delete from tb_lr where idlr='+
        QuotedStr(edt_idlr.Text)+'';
    Frm_Utama.modelcrud(query,Frm_Utama.Q_lr);
    MessageDlg('Data Telah Dihapus',mtInformation,[mbok],0);
    FormShow(Sender);
  end;
end;

procedure TFrm_lr.cb_jenisakunChange(Sender: TObject);
var
  query:string;
begin
  query:='select * from tb_akun where idakun='+
    QuotedStr(cb_jenisakun.Text)+'';
  Frm_Utama.modellihatdata(query,Frm_Utama.q_akun);
  edt_namaakun.Text:=Frm_Utama.Q_akun.FieldValues['namaakun'];
end;

procedure TFrm_lr.edt_nominalChange(Sender: TObject);
begin
  if (edt_nominal.Text='0') then edt_nominal.Text:='0'
  else
    Frm_Utama.ribuan(edt_nominal);
end;

procedure TFrm_lr.edt_nominalExit(Sender: TObject);
begin
  if (edt_nominal.Text='0') then edt_nominal.Text:='0';
end;

procedure TFrm_lr.idLr;
var
  dig1,dig2,dig3:Integer;
  query:string;
begin
  query:='select * from tb_lr where idlr like "L%" order by idlr asc';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_lr);
  if Frm_Utama.Q_lr.Recordset.RecordCount=0 then
  begin
    dig1:=0;
    dig2:=0;
    dig3:=1;
  end
  else
  begin
    Frm_Utama.Q_lr.Last;
    dig3:=StrToInt(MidStr(Frm_Utama.Q_lr.FieldValues['idlr'],4,1))+1;
    dig2:=StrToInt(MidStr(Frm_Utama.Q_lr.FieldValues['idlr'],3,1));
    dig1:=StrToInt(MidStr(Frm_Utama.Q_lr.FieldValues['idlr'],2,1));

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
          MessageDlg('ID Laba Rugi melebihi batas !!!! ' + chr(13) +
          'Hubungi Pengembang Sistem (Administrator) '+ chr(13) +
          '---->----- ',mtError,[mbOK],0);
          Application.Terminate;
        end
        else
        begin
          dig1:=dig1;
        end;
  end;
  edt_idlr.Text:='L'+IntToStr(dig1)+IntToStr(dig2)+IntToStr(dig3)+FormatDateTime('mmyyyy',now) ;

end;

end.

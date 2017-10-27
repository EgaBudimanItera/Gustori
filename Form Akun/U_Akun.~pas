unit U_Akun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrm_akun = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    edt_idakun: TEdit;
    grp2: TGroupBox;
    edt_NamaAkun: TEdit;
    grp8: TGroupBox;
    cb_jenisakun: TComboBox;
    grp5: TGroupBox;
    tb_akun: TDBGrid;
    grp3: TGroupBox;
    btn_Btambah: TBitBtn;
    btn_Bsimpan: TBitBtn;
    btn_Bubah: TBitBtn;
    btn_Bhapus: TBitBtn;
    btn_Bkeluar: TBitBtn;
    grp4: TGroupBox;
    edt_cari: TEdit;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure edt_idakunKeyPress(Sender: TObject; var Key: Char);
    procedure edt_NamaAkunKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure kondisi(a:Integer);
    procedure btn_BsimpanClick(Sender: TObject);
    procedure tb_akunDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_cariChange(Sender: TObject);
    procedure tb_akunCellClick(Column: TColumn);
    procedure btn_BtambahClick(Sender: TObject);
    procedure btn_BubahClick(Sender: TObject);
    procedure btn_BhapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_akun: TFrm_akun;

implementation

uses
  U_Utama, ADODB;

{$R *.dfm}

procedure TFrm_akun.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_akun.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_akun.TabVisible:=False;
end;

procedure TFrm_akun.edt_idakunKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in['0'..'9',#13,#8]) then key:=#0;
end;

procedure TFrm_akun.edt_NamaAkunKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9']) then key:=#0;
end;

procedure TFrm_akun.FormShow(Sender: TObject);
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_akun');
    tb_akun.DataSource:=dts_akun;
    bersih(Self);
    kondisi(0);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=30-20;
  end;
end;

procedure TFrm_akun.kondisi(a: Integer);
begin
  if (a=0) then
  begin
    btn_Bsimpan.Enabled:=True;
    btn_Bubah.Enabled:=false;
    btn_Bhapus.Enabled:=false;
    edt_idakun.ReadOnly:=false;
  end
  else
  begin
    btn_Bsimpan.Enabled:=false;
    btn_Bubah.Enabled:=true;
    btn_Bhapus.Enabled:=true;
    edt_idakun.ReadOnly:=true;
  end;
end;

procedure TFrm_akun.btn_BsimpanClick(Sender: TObject);
var
  query:string;
begin
  with Frm_Utama do
  begin
    if (edt_idakun.Text<>'') and (edt_NamaAkun.Text<>'') and (cb_jenisakun.Text<>'') then
    begin
      with Q_akun do
      begin
        Close;
        SQL.Text:='select * from tb_akun where idakun='+
          QuotedStr(edt_idakun.Text)+'';
        Open;
        if Recordset.RecordCount<>0 then
        begin
          MessageDlg('Id Akun Tersebut Sudah Diinputkan',mtError,[mbok],0);
          Exit;
        end
        else
        begin
          query:='insert into tb_akun values('+
            QuotedStr(edt_idakun.Text)+','+
            QuotedStr(edt_NamaAkun.Text)+','+
            QuotedStr(cb_jenisakun.Text)+')';
          modelcrud(query,Q_akun);
          MessageDlg('Data Telah Disimpan',mtInformation,[mbok],0);
          Frm_akun.FormShow(Sender);
        end;
      end;
    end
    else
    begin
      MessageDlg('Data Tidak Lengkap !!',mtError,[mbok],0);
      Exit;
    end;
  end;
end;

procedure TFrm_akun.tb_akunDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Frm_utama do
  begin
    if dts_akun.DataSet.RecNo>0 then
    begin
      if Column.Title.Caption = 'No' then
      begin
        tb_akun.Canvas.TextOut(Rect.Left  + 2, rect.Top,IntToStr(dts_akun.DataSet.RecNo));
      end;
    end;
  end;
end;

procedure TFrm_akun.edt_cariChange(Sender: TObject);
var
query:string;
begin
  query:='select * from tb_akun where idakun like "%'+edt_cari.Text+'%" '+
         ' or namaakun like "%'+edt_cari.Text+'%"';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_akun);
end;

procedure TFrm_akun.tb_akunCellClick(Column: TColumn);
begin
  with Frm_Utama.Q_akun do
  begin
    if Recordset.RecordCount<>0 then
    begin
      edt_idakun.Text:=FieldValues['idakun'];
    edt_NamaAkun.Text:=FieldValues['namaakun'];
    cb_jenisakun.Text:=FieldValues['jenisakun'];
    kondisi(1);
    end;

  end;
end;

procedure TFrm_akun.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_akun.btn_BubahClick(Sender: TObject);
var
  query:string;
begin
  query:='update tb_akun set namaakun='+
    QuotedStr(edt_NamaAkun.Text)+', jenisakun='+
    QuotedStr(cb_jenisakun.Text)+' where idakun='+
    QuotedStr(edt_idakun.Text)+'';
  Frm_Utama.modelcrud(query,Frm_Utama.Q_akun);
  MessageDlg('Data Telah Diubah',mtInformation,[mbok],0);
  FormShow(Sender);
end;

procedure TFrm_akun.btn_BhapusClick(Sender: TObject);
var
  query:string;
begin
  if MessageDlg('Ingin Dihapus?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    query:='delete from tb_akun where idakun='+
        QuotedStr(edt_idakun.Text)+'';
    Frm_Utama.modelcrud(query,Frm_Utama.Q_akun);
    MessageDlg('Data Telah Dihapus',mtInformation,[mbok],0);
    FormShow(Sender);
  end;
end;

end.

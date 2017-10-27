unit U_Dinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrm_dinas = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    edt_iddinas: TEdit;
    grp2: TGroupBox;
    edt_Namadinas: TEdit;
    grp8: TGroupBox;
    grp5: TGroupBox;
    tb_dinas: TDBGrid;
    grp3: TGroupBox;
    btn_Btambah: TBitBtn;
    btn_Bsimpan: TBitBtn;
    btn_Bubah: TBitBtn;
    btn_Bhapus: TBitBtn;
    btn_Bkeluar: TBitBtn;
    grp4: TGroupBox;
    edt_cari: TEdit;
    mmo_alamat: TMemo;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure kondisi(a:Integer);
    procedure btn_BsimpanClick(Sender: TObject);
    procedure tb_dinasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_cariChange(Sender: TObject);
    procedure tb_dinasCellClick(Column: TColumn);
    procedure btn_BtambahClick(Sender: TObject);
    procedure btn_BubahClick(Sender: TObject);
    procedure btn_BhapusClick(Sender: TObject);
    procedure iddinas;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_dinas: TFrm_dinas;

implementation

uses
  U_Utama, ADODB;

{$R *.dfm}

procedure TFrm_dinas.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_dinas.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_dinas.TabVisible:=False;
end;

procedure TFrm_dinas.FormShow(Sender: TObject);
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_dinas');
    tb_dinas.DataSource:=dts_dinas;
    bersih(Self);
    kondisi(0);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=30-20;
    iddinas;
  end;
end;

procedure TFrm_dinas.kondisi(a: Integer);
begin
  if (a=0) then
  begin
    btn_Bsimpan.Enabled:=True;
    btn_Bubah.Enabled:=false;
    btn_Bhapus.Enabled:=false;
  end
  else
  begin
    btn_Bsimpan.Enabled:=false;
    btn_Bubah.Enabled:=true;
    btn_Bhapus.Enabled:=true;
  end;
end;

procedure TFrm_dinas.btn_BsimpanClick(Sender: TObject);
var
  query:string;
begin
  with Frm_Utama do
  begin
    if (edt_iddinas.Text<>'') and (edt_Namadinas.Text<>'') and (mmo_alamat.Text<>'') then
    begin
      query:='insert into tb_dinas values('+
        QuotedStr(edt_iddinas.Text)+','+
        QuotedStr(edt_Namadinas.Text)+','+
        QuotedStr(mmo_alamat.Text)+')';
      modelcrud(query,Q_dinas);
      MessageDlg('Data Telah disimpan',mtInformation,[mbok],0);
      Frm_dinas.FormShow(Sender);
    end
    else
    begin
      MessageDlg('Data Tidak Lengkap !!',mtError,[mbok],0);
      Exit;
    end;
  end;
end;

procedure TFrm_dinas.tb_dinasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Frm_utama do
  begin
    if dts_dinas.DataSet.RecNo>0 then
    begin
      if Column.Title.Caption = 'No' then
      begin
        tb_dinas.Canvas.TextOut(Rect.Left  + 2, rect.Top,IntToStr(dts_dinas.DataSet.RecNo));
      end;
    end;
  end;
end;

procedure TFrm_dinas.edt_cariChange(Sender: TObject);
var
query:string;
begin
  query:='select * from tb_dinas where namadinas like "%'+edt_cari.Text+'%" ';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_dinas);
end;

procedure TFrm_dinas.tb_dinasCellClick(Column: TColumn);
begin
  with Frm_Utama.Q_dinas do
  begin
    if Recordset.RecordCount<>0 then
    begin
      edt_iddinas.Text:=FieldValues['iddinas'];
    edt_Namadinas.Text:=FieldValues['namadinas'];
    mmo_alamat.Text:=FieldValues['alamatdinas'];
    kondisi(1);
    end;

  end;
end;

procedure TFrm_dinas.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_dinas.btn_BubahClick(Sender: TObject);
var
  query:string;
begin
  query:='update tb_dinas set namadinas='+
    QuotedStr(edt_Namadinas.Text)+', alamatdinas='+
    QuotedStr(mmo_alamat.Text)+' where iddinas='+
    QuotedStr(edt_iddinas.Text)+'';
  Frm_Utama.modelcrud(query,Frm_Utama.Q_dinas);
  MessageDlg('Data Telah Diubah',mtInformation,[mbok],0);
  FormShow(Sender);
end;

procedure TFrm_dinas.btn_BhapusClick(Sender: TObject);
var
  query:string;
begin
  if MessageDlg('Ingin Dihapus?',mtConfirmation,[mbYes,mbNo],0)=mryes then
  begin
    query:='delete from tb_dinas where iddinas='+
        QuotedStr(edt_iddinas.Text)+'';
    Frm_Utama.modelcrud(query,Frm_Utama.Q_dinas);
    MessageDlg('Data Telah Dihapus',mtInformation,[mbok],0);
    FormShow(Sender);
  end;
end;

procedure TFrm_dinas.iddinas;
var
  dig1,dig2,dig3:Integer;
  query:string;
begin
  query:='select * from tb_dinas where iddinas like "D%" order by iddinas asc';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_dinas);
  if Frm_Utama.Q_dinas.Recordset.RecordCount=0 then
  begin
    dig1:=0;
    dig2:=0;
    dig3:=1;
  end
  else
  begin
    Frm_Utama.Q_dinas.Last;
    dig3:=StrToInt(MidStr(Frm_Utama.Q_dinas.FieldValues['iddinas'],4,1))+1;
    dig2:=StrToInt(MidStr(Frm_Utama.Q_dinas.FieldValues['iddinas'],3,1));
    dig1:=StrToInt(MidStr(Frm_Utama.Q_dinas.FieldValues['iddinas'],2,1));

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
          MessageDlg('ID Dinas melebihi batas !!!! ' + chr(13) +
          'Hubungi Pengembang Sistem (Administrator) '+ chr(13) +
          '---->----- ',mtError,[mbOK],0);
          Application.Terminate;
        end
        else
        begin
          dig1:=dig1;
        end;
  end;
  edt_iddinas.Text:='D'+IntToStr(dig1)+IntToStr(dig2)+IntToStr(dig3);
end;

end.

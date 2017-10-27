unit U_CariAnggota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls;

type
  TFrm_carianggota = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp5: TGroupBox;
    tb_anggota: TDBGrid;
    grp4: TGroupBox;
    edt_cari: TEdit;
    btn_Bkeluar: TBitBtn;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tb_anggotaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edt_cariChange(Sender: TObject);
    procedure tb_anggotaCellClick(Column: TColumn);
    procedure btn_BtambahClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_carianggota: TFrm_carianggota;

implementation

uses
  U_Utama, ADODB, DB, U_Pinjaman;

{$R *.dfm}

procedure TFrm_carianggota.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_carianggota.btn_BkeluarClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_carianggota.FormShow(Sender: TObject);
begin
  with Frm_Utama do
  begin
    koneksitabel('vw_anggota');
    tb_anggota.DataSource:=dts_anggota;
    bersih(Self);
  end;
end;

procedure TFrm_carianggota.tb_anggotaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with Frm_utama do
  begin
    if dts_anggota.DataSet.RecNo>0 then
    begin
      if Column.Title.Caption = 'No' then
      begin
        tb_anggota.Canvas.TextOut(Rect.Left  + 2, rect.Top,IntToStr(dts_anggota.DataSet.RecNo));
      end;
    end;
  end;  
end;

procedure TFrm_carianggota.edt_cariChange(Sender: TObject);
var
query:string;
begin
  query:='select * from vw_anggota where namadinas like "%'+edt_cari.Text+'%" or namaanggota like "%'+edt_cari.Text+'%" or nip like "%'+edt_cari.Text+'%" ';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_vwanggota);
end;

procedure TFrm_carianggota.tb_anggotaCellClick(Column: TColumn);
begin
  with Frm_Utama.Q_vwanggota do
  begin
    if Recordset.RecordCount<>0 then
    begin
      with Frm_pinjaman do
    begin
      edt_idanggota.Text:=FieldValues['idanggota'];
      edt_Nip.Text:=FieldValues['nip'];
      edt_Nama.Text:=FieldValues['namaanggota'];
    end;
    Frm_carianggota.Close;
    end;
  end;
end;

procedure TFrm_carianggota.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

end.

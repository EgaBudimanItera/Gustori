unit U_ubah;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrm_ubah = class(TForm)
    img1: TImage;
    pnlu: TPanel;
    grp1: TGroupBox;
    edt_namapengguna: TEdit;
    grp2: TGroupBox;
    edt_password: TEdit;
    grp3: TGroupBox;
    btn_Bsimpan: TBitBtn;
    btn_Bkeluar: TBitBtn;
    procedure cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
    procedure btn_BkeluarClick(Sender: TObject);
    procedure edt_namapenggunaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_passwordKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btn_BtambahClick(Sender: TObject);
    procedure btn_BsimpanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ubah: TFrm_ubah;

implementation

uses
  U_Utama, ADODB;

{$R *.dfm}

procedure TFrm_ubah.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_ubah.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_ubahpass.TabVisible:=False;
end;

procedure TFrm_ubah.edt_namapenggunaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in['0'..'9',#13,#8]) then key:=#0;
end;

procedure TFrm_ubah.edt_passwordKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9']) then key:=#0;
end;

procedure TFrm_ubah.FormShow(Sender: TObject);
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_pengguna');
    bersih(Self);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=100-5;
    edt_namapengguna.Text:=_namauser;
  end;
end;

procedure TFrm_ubah.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_ubah.btn_BsimpanClick(Sender: TObject);
var
query,level :string;
begin
  query:='update tb_pengguna set password='+
    QuotedStr(edt_password.Text)+' where namapengguna='+
    QuotedStr(edt_namapengguna.Text)+'';
  Frm_Utama.modelcrud(query,Frm_Utama.Q_pengguna);
  MessageDlg('Berhasil Mengubah Password',mtInformation,[mbok],0);
  btn_BkeluarClick(Sender);
end;

end.

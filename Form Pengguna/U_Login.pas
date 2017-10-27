unit U_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrm_login = class(TForm)
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
  Frm_login: TFrm_login;

implementation

uses
  U_Utama, ADODB;

{$R *.dfm}

procedure TFrm_login.cb_jenisakunKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFrm_login.btn_BkeluarClick(Sender: TObject);
begin
  close;
  Frm_Utama.ts_login.TabVisible:=False;
end;

procedure TFrm_login.edt_namapenggunaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in['0'..'9',#13,#8]) then key:=#0;
end;

procedure TFrm_login.edt_passwordKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0'..'9']) then key:=#0;
end;

procedure TFrm_login.FormShow(Sender: TObject);
begin
  with Frm_Utama do
  begin
    koneksitabel('tb_pengguna');
    bersih(Self);
    pnlu.Left:=(Screen.Width div 2)  - pnlu.Width div 2;
    pnlu.Top:=100-5;
  end;
end;

procedure TFrm_login.btn_BtambahClick(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TFrm_login.btn_BsimpanClick(Sender: TObject);
var
query,level :string;
begin
  query:='select * from tb_pengguna where namapengguna='+
    QuotedStr(edt_namapengguna.Text)+'';
  Frm_Utama.modellihatdata(query,Frm_Utama.Q_pengguna);
  if Frm_Utama.Q_pengguna.Recordset.RecordCount=0 then
  begin
    MessageDlg('Nama Pengguna Salah',mtWarning,[mbok],0);
    edt_namapengguna.Clear;
    edt_namapengguna.SetFocus;
    Exit;
  end
  else
  begin
    query:='select * from tb_pengguna where namapengguna='+
    QuotedStr(edt_namapengguna.Text)+' and password='+
    QuotedStr(edt_password.Text)+'';
    Frm_Utama.modellihatdata(query,Frm_Utama.Q_pengguna);
    if Frm_Utama.Q_pengguna.Recordset.RecordCount=0 then
    begin
      MessageDlg('Password Salah',mtWarning,[mbok],0);
      edt_password.Clear;
      edt_password.SetFocus;
      Exit;
    end
    else
    begin
      level:=Frm_Utama.Q_pengguna.FieldValues['level'];
      Frm_Utama.keadaanform(level);
      Frm_Utama.lbl_ketlogin.Caption:='Nama User : '+edt_namapengguna.Text +'   Hak Akses : '+level;
      _namauser:=edt_namapengguna.Text;
      _level:=level;
      btn_BkeluarClick(Sender);
    end;
  end;
end;

end.

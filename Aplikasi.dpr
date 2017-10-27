program Aplikasi;

uses
  Forms,
  U_Utama in 'Form Utama\U_Utama.pas' {Frm_Utama},
  U_Simpanan in 'Form Simpanan\U_Simpanan.pas' {Frm_simpanan},
  U_LR in 'Form LR\U_LR.pas' {Frm_lr},
  U_Dinas in 'Form Dinas\U_Dinas.pas' {Frm_dinas},
  U_Pinjaman in 'Form Pinjaman\U_Pinjaman.pas' {Frm_pinjaman},
  U_CariAnggota in 'Form Anggota\U_CariAnggota.pas' {Frm_carianggota},
  U_Anggota in 'Form Anggota\U_Anggota.pas' {Frm_anggota},
  U_Tagihan in 'Form Tagihan\U_Tagihan.pas' {Frm_tagihan},
  U_shuanggota in 'Form SHU Anggota\U_shuanggota.pas' {Frm_shuanggota},
  U_DanaTertagih in 'Form Laporan\U_DanaTertagih.pas' {Frm_cetakDanaTertagih},
  U_shu in 'Form SHU Total\U_shu.pas' {Frm_shu},
  U_Akun in 'Form Akun\U_Akun.pas' {Frm_akun},
  U_Login in 'Form Pengguna\U_Login.pas' {Frm_login},
  U_ubah in 'Form Ubah Password\U_ubah.pas' {Frm_ubah},
  U_CetakSHU in 'Form Laporan\U_CetakSHU.pas' {Frm_cetakSHU},
  U_LabaRugi in 'Form Laporan\U_LabaRugi.pas' {Frm_cetakLR},
  U_splash in 'Form Splash\U_splash.pas' {Frm_Splas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_Splas, Frm_Splas);
  Application.CreateForm(TFrm_Utama, Frm_Utama);
  Application.CreateForm(TFrm_simpanan, Frm_simpanan);
  Application.CreateForm(TFrm_lr, Frm_lr);
  Application.CreateForm(TFrm_dinas, Frm_dinas);
  Application.CreateForm(TFrm_pinjaman, Frm_pinjaman);
  Application.CreateForm(TFrm_carianggota, Frm_carianggota);
  Application.CreateForm(TFrm_anggota, Frm_anggota);
  Application.CreateForm(TFrm_tagihan, Frm_tagihan);
  Application.CreateForm(TFrm_shuanggota, Frm_shuanggota);
  Application.CreateForm(TFrm_cetakDanaTertagih, Frm_cetakDanaTertagih);
  Application.CreateForm(TFrm_shu, Frm_shu);
  Application.CreateForm(TFrm_akun, Frm_akun);
  Application.CreateForm(TFrm_login, Frm_login);
  Application.CreateForm(TFrm_ubah, Frm_ubah);
  Application.CreateForm(TFrm_cetakSHU, Frm_cetakSHU);
  Application.CreateForm(TFrm_cetakLR, Frm_cetakLR);
  Application.Run;
end.

unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Image2: TImage;
    Image3: TImage;
    CheckBox1: TCheckBox;
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1, Unit2, Unit6, Unit3;

{$R *.dfm}

procedure TForm5.Image3Click(Sender: TObject);
begin
// clear
edit1.Clear;
edit2.Clear;

form5.Hide;
form1.show;
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
if (edit1.Text = 'owner') and (edit2.Text = 'owner') then
  begin
    showmessage('Selamat anda berhasil login');
    form5.Hide;
    form3.show;

    form3.image4.visible := true;
    form3.image5.visible := true;
    form3.image6.visible := true;
    form3.image7.visible := true;

    form3.image8.visible := false;
    form3.image9.visible := false;
    form3.image10.visible := false;

    form3.Label1.Caption := 'Anda masuk sebagai owner';
  end
else if (edit1.Text = '') or (edit2.Text = '') then
  begin
    if edit1.Text = '' then
      begin
        showmessage('Nama lengkap harus diisi');
        edit1.SetFocus;
      end
    else
      begin
        showmessage('Password harus diisi');
        edit2.SetFocus;
      end;
  end
else
  begin
    if Form1.ADOTable1.Locate('nama_lengkap', edit1.Text, [lopartialkey]) then
      begin
        if edit2.Text = Form1.ADOTable1['password'] then
          begin
            form2.Label4.Caption := Form1.ADOTable1['nama_lengkap'];
            form2.label5.caption := Form1.ADOTable1['no_telp'];

            edit1.Clear;
            edit2.Clear;

            if Form1.ADOTable1['jabatan'] = 'Kasir' then
              begin
                showmessage('Selamat anda berhasil login');
                form5.Hide;
                form3.show;

                form3.image4.visible := false;
                form3.image5.visible := false;
                form3.image6.visible := false;
                form3.image7.visible := false;

                form3.image8.visible := true;
                form3.image9.visible := true;
                form3.image10.visible := true;

                form3.Label1.Caption := 'Anda masuk sebagai kasir';
              end
            else if Form1.ADOTable1['jabatan'] = 'Admin' then
              begin
                showmessage('Selamat anda berhasil login');
                form5.Hide;
                form3.show;

                form3.image4.visible := true;
                form3.image5.visible := true;
                form3.image6.visible := true;
                form3.image7.visible := true;

                form3.image8.visible := false;
                form3.image9.visible := false;
                form3.image10.visible := false;

                form3.Label1.Caption := 'Anda masuk sebagai admin';
              end;
          end
        else
          begin
            showmessage('Kata sandi yang anda masukkan salah!');

            edit2.Clear;
            edit2.SetFocus;
          end;
      end
    else
      begin
        showmessage('Akun anda belum terdaftar, silahkan mendaftar akun terlebih dahulu');

        edit1.Clear;
        edit2.Clear;
        edit1.SetFocus;
      end;
end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
edit2.PasswordChar := '*';
end;

procedure TForm5.CheckBox1Click(Sender: TObject);
begin
if checkbox1.Checked = true then
  edit2.PasswordChar := #0
else
  edit2.PasswordChar := '*'
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  edit2.SetFocus;
end;

procedure TForm5.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
if (edit1.Text = 'owner') and (edit2.Text = 'owner') then
  begin
    showmessage('Selamat anda berhasil login');
    form5.Hide;
    form3.show;

    form3.image4.visible := true;
    form3.image5.visible := true;
    form3.image6.visible := true;
    form3.image7.visible := true;

    form3.image8.visible := false;
    form3.image9.visible := false;
    form3.image10.visible := false;

    form3.Label1.Caption := 'Anda masuk sebagai owner';
  end
else if (edit1.Text = '') or (edit2.Text = '') then
  begin
    if edit1.Text = '' then
      begin
        showmessage('Nama lengkap harus diisi');
        edit1.SetFocus;
      end
    else
      begin
        showmessage('Password harus diisi');
        edit2.SetFocus;
      end;
  end
else
  begin
    if Form1.ADOTable1.Locate('nama_lengkap', edit1.Text, [lopartialkey]) then
      begin
        if edit2.Text = Form1.ADOTable1['password'] then
          begin
            form2.Label4.Caption := Form1.ADOTable1['nama_lengkap'];
            form2.label5.caption := Form1.ADOTable1['no_telp'];

            edit1.Clear;
            edit2.Clear;

            if Form1.ADOTable1['jabatan'] = 'Kasir' then
              begin
                showmessage('Selamat anda berhasil login');
                form5.Hide;
                form3.show;

                form3.image4.visible := false;
                form3.image5.visible := false;
                form3.image6.visible := false;
                form3.image7.visible := false;

                form3.image8.visible := true;
                form3.image9.visible := true;
                form3.image10.visible := true;

                form3.Label1.Caption := 'Anda masuk sebagai kasir';
              end
            else if Form1.ADOTable1['jabatan'] = 'Admin' then
              begin
                showmessage('Selamat anda berhasil login');
                form5.Hide;
                form3.show;

                form3.image4.visible := true;
                form3.image5.visible := true;
                form3.image6.visible := true;
                form3.image7.visible := true;

                form3.image8.visible := false;
                form3.image9.visible := false;
                form3.image10.visible := false;

                form3.Label1.Caption := 'Anda masuk sebagai admin';
              end;
          end
        else
          begin
            showmessage('Kata sandi yang anda masukkan salah!');

            edit2.Clear;
            edit2.SetFocus;
          end;
      end
    else
      begin
        showmessage('Akun anda belum terdaftar, silahkan mendaftar akun terlebih dahulu');

        edit1.Clear;
        edit2.Clear;
        edit1.SetFocus;
      end;
end;
end;

end.

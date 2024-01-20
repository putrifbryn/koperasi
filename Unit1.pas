unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Image2: TImage;
    CheckBox1: TCheckBox;
    Edit4: TEdit;
    Image3: TImage;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOTable2: TADOTable;
    procedure Image2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit5;

{$R *.dfm}

procedure TForm1.Image2Click(Sender: TObject);
begin
form1.Hide;
form5.show;

// clear
edit1.Clear;
edit2.Clear;
edit4.Clear;
combobox1.text := '';

dbgrid1.Refresh;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  edit2.SetFocus;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
edit4.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
edit4.PasswordChar := '*';

combobox1.Items.Add('Kasir');
combobox1.Items.Add('Admin');
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if checkbox1.Checked = true then
  edit4.PasswordChar := #0
else
  edit4.PasswordChar := '*';
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  edit4.SetFocus;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
if (edit1.Text = '') or (edit2.Text = '') or (edit4.Text = '') or (combobox1.Text = 'Pilih salah satu') then
  begin
    if edit1.Text = '' then
      begin
        showmessage('Nama lengkap harus diisi');
        edit1.SetFocus;
      end
    else if edit2.Text = '' then
      begin
        showmessage('Nomor telepon harus diisi');
        edit2.SetFocus;
      end
    else if combobox1.Text = 'Pilih salah satu' then
      begin
        showmessage('Pilih jabatan terlebih dahulu');
      end
    else
      begin
        showmessage('Password harus diisi');
        edit4.SetFocus;
      end;
  end
else
  begin
    if ADOTable1.Locate('nama_lengkap', edit1.Text, [lopartialkey]) then
      begin
        showmessage('Akun anda telah terdaftar, silahkan kembali ke halaman login');

        edit1.Clear;
        edit2.Clear;
        combobox1.Text := 'Pilih salah satu';
        edit4.Clear;
        edit1.SetFocus;
      end
    else
      begin
        showmessage('Akun berhasil dibuat');

        if combobox1.Text = 'Kasir' then
          begin
            ADOTable2.Append;
            ADOTable2['nama_lengkap'] := edit1.Text;
            ADOTable2['no_telp'] := edit2.Text;
            ADOTable2['jabatan'] := combobox1.Text;
            ADOTable2['password'] := edit4.Text;
            ADOTable2.Post;
          end;
        
        ADOTable1.Append;
        ADOTable1['nama_lengkap'] := edit1.Text;
        ADOTable1['no_telp'] := edit2.Text;
        ADOTable1['jabatan'] := combobox1.Text;
        ADOTable1['password'] := edit4.Text;
        ADOTable1.Post;
        dbgrid1.Refresh;

        edit1.Clear;
        edit2.Clear;
        combobox1.Text := 'Pilih salah satu';
        edit4.Clear;
        edit1.SetFocus;
      end;
  end;
end;

end.

unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  TForm10 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    Image7: TImage;
    Edit5: TEdit;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    ADOConnection1: TADOConnection;
    ComboBox1: TComboBox;
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit3, Unit1, Unit5;

{$R *.dfm}

procedure TForm10.Image3Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    dbgrid1.Refresh;
    dbgrid2.Refresh;

    form10.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

procedure TForm10.Image2Click(Sender: TObject);
begin
form10.Hide;
form3.show;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
dbgrid1.Refresh;

end;

procedure TForm10.Image4Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_lengkap', uppercase(edit4.Text), [lopartialkey]) then
  begin
    DBGrid1.Refresh;
    edit1.Text := ADOTable1['nama_lengkap'];
    edit2.Text := ADOTable1['no_telp'];
    edit3.Text := ADOTable1['jabatan'];
    edit4.Text := ADOTable1['password'];

    showmessage('Data ditemukan!');
  end
else
  begin
    showmessage('Data tidak ditemukan!');
  end;
end;

procedure TForm10.Image6Click(Sender: TObject);
begin
if (edit1.Text = '') or (edit2.Text = '') or (edit3.Text = '') or (edit5.Text = '') then
  begin
    if (edit1.Text = '') then
      begin
        MessageDlg('Nama pengguna harus diisi!', mtError, [mbOK], 0);
        edit1.SetFocus;
      end
    else if (edit2.Text = '') then
      begin
        MessageDlg('No telp harus diisi!', mtError, [mbOK], 0);
        edit3.SetFocus;
      end
    else if (edit5.Text = '') then
      begin
        MessageDlg('Kata sandi harus diisi!', mtError, [mbOK], 0);
        edit5.SetFocus;
      end
  end
else if dbgrid2.Visible = false then
  begin
    if ADOTable1.Locate('nama_lengkap', uppercase(edit1.Text), [lopartialkey]) then
      begin
        ADOTable1.Edit;
        ADOTable1['nama_lengkap'] := edit1.Text;
        ADOTable1['no_telp'] := edit2.Text;
        ADOTable1['jabatan'] := edit3.Text;
        ADOTable1['password'] := edit5.Text;
        ADOTable1.Post;
        DBGrid1.Refresh;

        ADOTable2.Edit;
        ADOTable2['nama_lengkap'] := edit1.Text;
        ADOTable2['no_telp'] := edit2.Text;
        ADOTable2['jabatan'] := edit3.Text;
        ADOTable2['password'] := edit5.Text;
        ADOTable2.Post;
        DBGrid2.Refresh;

        showmessage('Data berhasil diperbarui!');
      end
    else
      begin
        ADOTable1.Append;
        ADOTable1['nama_lengkap'] := edit1.Text;
        ADOTable1['no_telp'] := edit2.Text;
        ADOTable1['jabatan'] := edit3.Text;
        ADOTable1['password'] := edit5.Text;
        ADOTable1.Post;
        DBGrid1.Refresh;

        ADOTable2.Append;;
        ADOTable2['nama_lengkap'] := edit1.Text;
        ADOTable2['no_telp'] := edit2.Text;
        ADOTable2['jabatan'] := edit3.Text;
        ADOTable2['password'] := edit5.Text;
        ADOTable2.Post;
        DBGrid2.Refresh;

        showmessage('Data berhasil ditambahkan!');
      end;
  end
else if dbgrid2.Visible = true then
  begin
    if ADOTable2.Locate('nama_lengkap', uppercase(edit1.Text), [lopartialkey]) then
      begin
        ADOTable1.Edit;
        ADOTable1['nama_lengkap'] := edit1.Text;
        ADOTable1['no_telp'] := edit2.Text;
        ADOTable1['jabatan'] := combobox1.Text;
        ADOTable1['password'] := edit5.Text;
        ADOTable1.Post;
        DBGrid1.Refresh;

        ADOTable2.Edit;
        ADOTable2['nama_lengkap'] := edit1.Text;
        ADOTable2['no_telp'] := edit2.Text;
        ADOTable2['jabatan'] := combobox1.Text;
        ADOTable2['password'] := edit5.Text;
        ADOTable2.Post;
        DBGrid2.Refresh;

        combobox1.Text := 'Pilih salah satu';

        showmessage('Data berhasil diperbarui!');
      end
    else
      begin
        ADOTable1.Append;
        ADOTable1['nama_lengkap'] := edit1.Text;
        ADOTable1['no_telp'] := edit2.Text;
        ADOTable1['jabatan'] := combobox1.Text;
        ADOTable1['password'] := edit5.Text;
        ADOTable1.Post;
        DBGrid1.Refresh;

        ADOTable2.Append;;
        ADOTable2['nama_lengkap'] := edit1.Text;
        ADOTable2['no_telp'] := edit2.Text;
        ADOTable2['jabatan'] := combobox1.Text;
        ADOTable2['password'] := edit5.Text;
        ADOTable2.Post;
        DBGrid2.Refresh;

        combobox1.Text := 'Pilih salah satu';

        showmessage('Data berhasil ditambahkan!');
      end;
    end;
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
end;

procedure TForm10.Image7Click(Sender: TObject);
var
konfirm: integer;
begin
if ADOTable1.Locate('nama_lengkap', uppercase(edit1.Text), [lopartialkey]) and ADOTable2.Locate('nama_lengkap', uppercase(edit1.Text), [lopartialkey]) then
begin
if dbgrid2.Visible = false then
  begin
    konfirm := MessageDlg('Apakah Anda yakin ingin menghapus data yang dipilih?', mtConfirmation, [mbOK, mbCancel], 0);
    if konfirm = mrOK then
      begin
        ADOTable1.Delete;
        ADOTable2.Delete;
        DBGrid1.Refresh;
        DBGrid2.Refresh;

        edit1.Clear;
        edit2.Clear;
        edit3.Clear;
        edit4.Clear;
        edit5.Clear;
      end;
  end
else
  begin
    konfirm := MessageDlg('Apakah Anda yakin ingin menghapus data yang dipilih?', mtConfirmation, [mbOK, mbCancel], 0);
    if konfirm = mrOK then
      begin
        ADOTable1.Delete;
        ADOTable2.Delete;
        DBGrid1.Refresh;
        DBGrid2.Refresh;

        edit1.Clear;
        edit2.Clear;
        combobox1.Text := 'Pilih salah satu';
        edit4.Clear;
        edit5.Clear;
      end;
  end;
end;
end;

procedure TForm10.Image5Click(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
end;

procedure TForm10.DBGrid1CellClick(Column: TColumn);
begin
edit1.Text := ADOTable1['nama_lengkap'];
edit2.Text := ADOTable1['no_telp'];
edit3.Text := ADOTable1['jabatan'];
edit5.Text := ADOTable1['password'];
end;

procedure TForm10.DBGrid2CellClick(Column: TColumn);
begin
if dbgrid2.Visible = false then
  begin
    edit1.Text := ADOTable2['nama_lengkap'];
    edit2.Text := ADOTable2['no_telp'];
    edit3.Text := ADOTable2['jabatan'];
    edit5.Text := ADOTable2['password'];
  end
else
  begin
    edit1.Text := ADOTable2['nama_lengkap'];
    edit2.Text := ADOTable2['no_telp'];
    combobox1.Text := ADOTable2['jabatan'];
    edit5.Text := ADOTable2['password'];
  end;
end;

procedure TForm10.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  edit2.SetFocus;
  edit3.Text := 'Kasir';
  end;
end;

end.

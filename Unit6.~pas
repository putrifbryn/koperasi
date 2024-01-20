unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Menus, DB, ADODB, Grids, DBGrids;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Image5: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Edit5: TEdit;
    procedure Keluar1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit5;

{$R *.dfm}

procedure TForm6.Keluar1Click(Sender: TObject);
begin
form6.Hide;
form5.show;
end;

procedure TForm6.Stop1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
edit5.Text := ADOTable1.FieldByName('kode_barang').AsString;
edit1.Text := ADOTable1.FieldByName('nama_barang').AsString;
edit2.Text := ADOTable1.FieldByName('harga').AsString;
edit3.Text := ADOTable1.FieldByName('stok').AsString;
end;

procedure TForm6.Image2Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_barang', uppercase(edit4.Text), [lopartialkey]) then
  begin
    edit5.Text := ADOTable1['kode_barang'];
    edit1.Text := ADOTable1['nama_barang'];
    edit2.Text := ADOTable1['harga'];
    edit3.Text := ADOTable1['stok'];

    showmessage('Data ditemukan!');
  end
else
  begin
    showmessage('Data tidak ditemukan!');
  end;
end;

procedure TForm6.Image4Click(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
end;

procedure TForm6.Image5Click(Sender: TObject);
begin
if (edit1.Text = '') or (edit2.Text = '') or (edit3.Text = '')  or (edit5.Text = '') then
  begin
    showmessage('Tolong isi semua input yang tersedia!');
  end
else
  begin
    if ADOTable1.Locate('nama_barang', edit1.Text, [lopartialkey]) then
      begin
        showmessage('Data berhasil diperbarui');

        ADOTable1.Edit;
        ADOTable1['kode_barang'] := edit5.Text;
        ADOTable1['nama_barang'] := edit1.Text;
        ADOTable1['harga'] := edit2.Text;
        ADOTable1['stok'] := edit3.Text;
        ADOTable1.Post;

        edit1.Clear;
        edit2.Clear;
        edit3.Clear;
        edit5.Clear;
        edit1.SetFocus;
      end
    else
      begin
        showmessage('Data berhasil ditambahkan');

        ADOTable1.Append;
        ADOTable1['kode_barang'] := edit5.Text;
        ADOTable1['nama_barang'] := edit1.Text;
        ADOTable1['harga'] := edit2.Text;
        ADOTable1['stok'] := edit3.Text;
        ADOTable1.Post;

        edit1.Clear;
        edit2.Clear;
        edit3.Clear;
        edit5.Clear;
        edit1.SetFocus;
      end;
  end;
end;

end.

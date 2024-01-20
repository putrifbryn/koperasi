unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Grids, DBGrids, StdCtrls, DB, ADODB;

type
  TForm9 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Image9: TImage;
    ADOQuery1: TADOQuery;
    Image10: TImage;
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit3, Unit14, Unit2, Unit5;

{$R *.dfm}

procedure TForm9.Image3Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    form9.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

procedure TForm9.Image2Click(Sender: TObject);
begin
form9.Hide;
form3.Show;
end;

procedure TForm9.DBGrid1CellClick(Column: TColumn);
begin
label1.Caption := ADOTable1.FieldByName('kode_barang').AsString;
edit1.Text := ADOTable1.FieldByName('nama_barang').AsString;
edit2.Text := ADOTable1.FieldByName('stok').AsString;
edit3.Text := ADOTable1.FieldByName('harga').AsString;
end;

procedure TForm9.Image4Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_barang', uppercase(edit4.Text), [lopartialkey]) then
  begin
    label1.Caption := ADOTable1['kode_barang'];
    edit1.Text := ADOTable1['nama_barang'];
    edit2.Text := ADOTable1['stok'];
    edit3.Text := ADOTable1['stok'];

    showmessage('Data ditemukan!');
  end
else
  begin
    showmessage('Data tidak ditemukan!');
  end;
end;

procedure TForm9.Image5Click(Sender: TObject);
begin
label1.Caption := '...';
edit1.Clear;
edit2.Clear;
edit3.Clear;
end;

procedure TForm9.Image6Click(Sender: TObject);
begin
if (edit1.Text = '') or (edit2.Text = '') or (edit3.Text = '') then
  begin
    if (edit1.Text = '') then
      begin
        MessageDlg('Nama barang harus diisi!', mtError, [mbOK], 0);
        edit1.SetFocus;
      end
    else if (edit2.Text = '') then
      begin
        MessageDlg('Stok harus diisi!', mtError, [mbOK], 0);
        edit3.SetFocus;
      end
    else if (edit3.Text = '') then
      begin
        MessageDlg('Harga harus diisi!', mtError, [mbOK], 0);
        edit3.SetFocus;
      end;
  end
else
  begin
    if ADOTable1.Locate('nama_barang', uppercase(edit1.Text), [lopartialkey]) then
      begin
        ADOTable1.Edit;
        ADOTable1['kode_barang'] := label1.Caption;
        ADOTable1['nama_barang'] := edit1.Text;
        ADOTable1['stok'] := edit2.Text;
        ADOTable1['harga'] := edit3.Text;
        ADOTable1.Post;
        DBGrid1.Refresh;

        showmessage('Data berhasil diperbarui!');
      end
    else
      begin
        ADOTable1.Append;
        ADOTable1['kode_barang'] := label1.Caption;
        ADOTable1['nama_barang'] := edit1.Text;
        ADOTable1['stok'] := edit2.Text;
        ADOTable1['harga'] := edit3.Text;
        ADOTable1.Post;
        DBGrid1.Refresh;

        showmessage('Data berhasil ditambahkan!');
      end;
  end;

label1.Caption := '...';
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
end;

procedure TForm9.Image7Click(Sender: TObject);
var
konfirm: integer;
begin
konfirm := MessageDlg('Apakah Anda yakin ingin menghapus data yang dipilih?', mtConfirmation, [mbOK, mbCancel], 0);
if konfirm = mrOK then
  begin
    ADOTable1.Delete;
    DBGrid1.Refresh;
  end;
end;

procedure TForm9.Image9Click(Sender: TObject);
var
  totalBaris: integer;
  kode: string;
begin
  ADOQuery1.SQL.Text := 'SELECT COUNT(*) AS kode_barang FROM barang';
  ADOQuery1.Open;

  totalBaris := ADOQuery1.FieldByName('kode_barang').AsInteger;
  if totalBaris < 10 then
    begin
      kode := 'P-' + '00' + inttostr(totalBaris + 1);
      label1.Caption := kode;
    end
  else if totalBaris < 100 then
    begin
      kode := 'P-' + '0' + inttostr(totalBaris + 1);
      label1.Caption := kode;
    end;

  ADOQuery1.Close;
end;

procedure TForm9.Image10Click(Sender: TObject);
begin
form9.Hide;
form2.show;
end;

end.

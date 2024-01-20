unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm13 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image8: TImage;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    Image9: TImage;
    Image10: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Edit4: TEdit;
    Label2: TLabel;
    ADOConnection1: TADOConnection;
    Image11: TImage;
    ADOQuery1: TADOQuery;
    Image7: TImage;
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image11Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Unit12, Unit3, Unit7, Unit2, Unit5;

{$R *.dfm}

procedure TForm13.Image4Click(Sender: TObject);
begin
form13.Hide;
form12.show;
end;

procedure TForm13.Image2Click(Sender: TObject);
begin
form13.Hide;
form3.show;
end;

procedure TForm13.Image3Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    form13.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

procedure TForm13.Image8Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_barang', uppercase(edit4.Text), [lopartialkey]) then
  begin
    DBGrid1.Refresh;
    label1.Caption := ADOTable1['kode_barang'];
    edit1.Text := ADOTable1['nama_barang'];
    edit2.Text := ADOTable1['stok'];

    showmessage('Barang ditemukan!');
  end
else
  begin
    showmessage('Barang tidak ditemukan!');
  end;
end;

procedure TForm13.Image9Click(Sender: TObject);
begin
label1.Caption := '...';
edit1.Clear;
edit2.Clear;
end;

procedure TForm13.Image10Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_barang', uppercase(edit1.Text), [lopartialkey]) then
  begin
    ADOTable1.Edit;
    ADOTable1['kode_barang'] := label1.Caption;
    ADOTable1['nama_barang'] := edit1.Text;
    ADOTable1['stok'] := edit2.Text;
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
    ADOTable1.Post;
    DBGrid1.Refresh;

    showmessage('Data berhasil ditambahkan!');
  end;

label1.Caption := '...';
edit1.Clear;
edit2.Clear;
end;

procedure TForm13.Image6Click(Sender: TObject);
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

procedure TForm13.DBGrid1CellClick(Column: TColumn);
begin
label1.Caption := ADOTable1['kode_barang'];
edit1.Text := ADOTable1['nama_barang'];
edit2.Text := ADOTable1['stok'];
end;

procedure TForm13.Image11Click(Sender: TObject);
begin
form12.Hide;
form7.show;
end;

procedure TForm13.Image7Click(Sender: TObject);
var
  totalBaris: integer;
  kode: string;
begin
  ADOQuery1.SQL.Text := 'SELECT COUNT(*) AS kode_barang FROM barangsewa';
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

end.

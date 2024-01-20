unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ADODB, Menus;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Image9: TImage;
    Image10: TImage;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Image2: TImage;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    Edit5: TEdit;
    Image3: TImage;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    DataSource2: TDataSource;
    Image4: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image5: TImage;
    Image6: TImage;
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Image2Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Image4Click(Sender: TObject);
    procedure Kembali1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  total, bayar, kembali: integer;

implementation

uses Unit1, Unit3, Unit4, Unit5, Unit9;

{$R *.dfm}

procedure TForm2.Image11Click(Sender: TObject);
begin
form2.Hide;
form1.show;
end;

procedure TForm2.Image12Click(Sender: TObject);
begin
close;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
label1.Caption := ADOTable1.FieldByName('kode_barang').AsString;
edit1.Text := ADOTable1.FieldByName('nama_barang').AsString;
edit2.Text := ADOTable1.FieldByName('harga').AsString;
label2.Caption := ADOTable1.FieldByName('stok').AsString;
end;

procedure TForm2.Edit3KeyPress(Sender: TObject; var Key: Char);
var
  sisa, stok: integer;
begin
if key = #13 then
  if strtoint(edit3.Text) <= strtoint(label2.Caption) then
    begin
      if ADOTable2.Locate('nama_barang', edit1.Text, [lopartialkey]) then
        begin
          stok := ADOTable2.FieldByName('banyak').AsInteger;

          if strtoint(edit3.Text) <= stok then
            begin
              sisa := strtoint(label2.Caption) + (stok - strtoint(edit3.Text));
              label3.Caption := inttostr(sisa);
              edit4.Text := inttostr(strtoint(edit2.Text) * strtoint(edit3.Text));
            end
          else
            begin
              sisa := strtoint(label2.Caption) - (strtoint(edit3.Text) - stok);
              label3.Caption := inttostr(sisa);
              edit4.Text := inttostr(strtoint(edit2.Text) * strtoint(edit3.Text));
            end;
        end
      else
        begin
          sisa := strtoint(label2.Caption) - strtoint(edit3.Text);
          label3.Caption := inttostr(sisa);
          edit4.Text := inttostr(strtoint(edit2.Text) * strtoint(edit3.Text));
        end;
    end
  else
    begin
      showmessage('Stok di gudang kurang');
      edit3.Clear;
      edit3.SetFocus;
    end;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
if edit4.Text = '' then
  begin
    showmessage('Tekan enter setelah mengisi input banyak, untuk menampilkan total');
  end
else
  begin
    showmessage('Data berhasil ditambahkan ke keranjang');

    ADOTable1.Edit;
    ADOTable1['kode_barang'] := label1.Caption;
    ADOTable1['nama_barang'] := edit1.Text;
    ADOTable1['stok'] := label3.Caption;
    ADOTable1['harga'] := edit2.Text;
    ADOTable1.Post;

    if ADOTable2.Locate('nama_barang', edit1.Text, [lopartialkey]) then
      begin
        ADOTable2.Edit;
        ADOTable2['kode_barang'] := label1.Caption;
        ADOTable2['nama_barang'] := edit1.Text;
        ADOTable2['harga'] := edit2.Text;
        ADOTable2['banyak'] := edit3.Text;
        ADOTable2['total'] := edit4.Text;
        ADOTable2.Post;

        label1.Caption := '...';
        edit1.Clear;
        edit2.Clear;
        edit3.Clear;
        edit4.Clear;
        edit1.SetFocus;
      end
    else
      begin
        ADOTable2.Append;
        ADOTable2['kode_barang'] := label1.Caption;
        ADOTable2['nama_barang'] := edit1.Text;
        ADOTable2['harga'] := edit2.Text;
        ADOTable2['banyak'] := edit3.Text;
        ADOTable2['total'] := edit4.Text;
        ADOTable2.Post;

        label1.Caption := '...';
        edit1.Clear;
        edit2.Clear;
        edit3.Clear;
        edit4.Clear;
        edit1.SetFocus;
      end;
  end;
end;

procedure TForm2.Image10Click(Sender: TObject);
begin
label1.Caption := '...';
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
end;

procedure TForm2.Image9Click(Sender: TObject);
var
  gtotal: integer;
begin
dbgrid2.Refresh;

form2.Hide;
form4.show;

gtotal := 0;

ADOTable2.First;
while not ADOTable2.Eof do
begin
  gtotal := gtotal + ADOTable2.FieldByName('TOTAL').AsInteger;
  ADOTable2.Next;
end;
form4.Edit1.Text := inttostr(gtotal);

form4.edit3.SetFocus;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
edit4.Clear;
end;



procedure TForm2.DBGrid2CellClick(Column: TColumn);
begin
label1.Caption := ADOTable2.FieldByName('kode_barang').AsString;
edit1.Text := ADOTable2.FieldByName('nama_barang').AsString;
edit2.Text := ADOTable2.FieldByName('harga').AsString;
edit3.Text := ADOTable2.FieldByName('banyak').AsString;
edit4.Text := ADOTable2.FieldByName('total').AsString;

if ADOTable1.Locate('nama_barang', edit1.Text, [lopartialkey]) then
  begin
   label2.Caption := ADOTable1.FieldByName('stok').AsString;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
{
ADOTable2.First;
while not ADOTable2.Eof do
  begin
    if ADOTable2['nama_barang'] <> '' then
      begin
        ADOTable2.Delete;
      end
    else
      begin
        ADOTable2.Next;
      end;
  end;
}
end;

procedure TForm2.Image3Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_barang', uppercase(edit5.Text), [lopartialkey]) then
  begin
    label1.Caption := ADOTable1['kode_barang'];
    edit1.Text := ADOTable1['nama_barang'];
    edit2.Text := ADOTable1['harga'];
    label2.Caption := ADOTable1['stok'];

    showmessage('Data ditemukan!');
  end
else
  begin
    showmessage('Data tidak ditemukan!');
  end;
end;

procedure TForm2.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
if ADOTable1.Locate('nama_barang', uppercase(edit5.Text), [lopartialkey]) then
  begin
    label1.Caption := ADOTable1['kode_barang'];
    edit1.Text := ADOTable1['nama_barang'];
    edit2.Text := ADOTable1['harga'];
    label2.Caption := ADOTable1['stok'];

    showmessage('Data ditemukan!');
  end
else
  begin
    showmessage('Data tidak ditemukan!');
  end;
end;

procedure TForm2.Image4Click(Sender: TObject);
var
  kode, nama, harga: string;
  banyak, stok, sisa, res: integer;
begin
res := MessageDlg('Apakah anda benar-benar ingin menghapusnya?', mtConfirmation, [mbYes, mbNo], 0);

if res = mrYes then
  begin
    kode := ADOTable2.FieldByName('kode_barang').AsString;
    nama := ADOTable2.FieldByName('nama_barang').AsString;
    harga := ADOTable2.FieldByName('harga').AsString;
    banyak := ADOTable2.FieldByName('banyak').AsInteger;

    stok := ADOTable1.FieldByName('stok').AsInteger;

    sisa := stok + banyak;

    if ADOTable1.Locate('nama_barang', nama, [lopartialkey]) then
      begin
        ADOTable1.Edit;
        ADOTable1['kode_barang'] := kode;
        ADOTable1['nama_barang'] := nama;
        ADOTable1['stok'] := inttostr(sisa);
        ADOTable1['harga'] := harga;
        ADOTable1.Post;

        ADOTable2.Delete;

        label1.Caption := '...';
        label2.Caption := '...';
        label3.Caption := '...';
        edit1.Clear;
        edit2.Clear;
        edit3.Clear;
        edit4.Clear;
      end;
  end;
end;
procedure TForm2.Kembali1Click(Sender: TObject);
begin
form2.Hide;
form5.show;
end;

procedure TForm2.Keluar1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm2.Image5Click(Sender: TObject);
begin
if form3.Label1.Caption = 'Anda masuk sebagai owner' then
  begin
    form2.Hide;
    form9.show;
    form9.Image10.Visible := true;
  end
else
  begin
    form2.Hide;
    form3.Show;
  end;
end;

procedure TForm2.Image6Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    form2.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

end.

unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, DB, ADODB, Grids, DBGrids, ComCtrls;

type
  TForm12 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Image10: TImage;
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image10Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses Unit3, Unit13, Unit2, Unit18, Unit7, Unit5;

{$R *.dfm}

procedure TForm12.Image2Click(Sender: TObject);
begin
form12.Hide;
form3.show;

end;

procedure TForm12.Image3Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    form12.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

procedure TForm12.Image9Click(Sender: TObject);
begin
form12.Hide;
form13.show;

if form3.Label1.Caption = 'Anda masuk sebagai owner' then
  begin
    form13.image11.Visible := true;
  end;
end;

procedure TForm12.Image4Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_barang', uppercase(edit6.Text), [lopartialkey]) then
  begin
    DBGrid1.Refresh;
    label1.Caption := ADOTable1['kode_barang'];
    edit1.Text := ADOTable1['nama_siswa'];
    edit2.Text := ADOTable1['nis'];
    edit3.Text := ADOTable1['nama_barang'];
    DateTimePicker1.Date := ADOTable1.FieldByName('waktu').AsDateTime;
    DateTimePicker2.Date := ADOTable1.FieldByName('batas').AsDateTime;

    MessageDlg('Data ditemukan!', mtInformation, [mbOK], 0);
  end
else
  begin
    MessageDlg('Data tidak dapat ditemukan!', mtError, [mbOK], 0);
  end;
end;

procedure TForm12.Image7Click(Sender: TObject);
begin
if (edit1.Text = '') or (edit2.Text = '') or (edit3.Text = '') then
  begin
    if edit1.Text = '' then
      begin
        MessageDlg('Nama penyewa harus diisi!', mtError, [mbOK], 0);
        edit1.SetFocus;
      end
    else if edit2.Text = '' then
      begin
        MessageDlg('NIS penyewa harus diisi!', mtError, [mbOK], 0);
        edit2.SetFocus;
      end
    else if edit3.Text = '' then
      begin
        MessageDlg('Nama barang penyewa harus diisi!', mtError, [mbOK], 0);
        edit3.SetFocus;
      end;
  end
else if (edit3.Text <> '') then
  begin
    if (edit3.Text = 'PROYEKTOR') then
      begin
        if (trunc(DateTimePicker2.Date)-trunc(DateTimePicker1.Date)) >= 1 then
          begin
            MessageDlg('Harus dikembalikan pada hari yang sama!', mtError, [mbOK], 0);
          end
        else
          begin
            showmessage('Data berhasil diperbarui!');

            ADOTable1.Edit;
            ADOTable1['no_transaksi'] := label1.Caption;
            ADOTable1['nama_siswa'] := edit1.Text;
            ADOTable1['nis'] := edit2.Text;
            ADOTable1['nama_barang'] := edit3.Text;
            ADOTable1['banyak'] := inttostr(1);
            ADOTable1.FieldByName('waktu').AsDateTime := DateTimePicker1.Date;
            ADOTable1.FieldByName('batas').AsDateTime := DateTimePicker2.Date;
            ADOTable1.Post;
            DBGrid1.Refresh;

            label1.Caption := '...';
            edit1.Clear;
            edit2.Clear;
            edit3.Clear;
            datetimepicker1.Date := now;
            datetimepicker2.Date := now;
          end;
      end
    else if (edit3.Text <> 'PROYEKTOR') then
      begin
        if (trunc(DateTimePicker2.Date)-trunc(DateTimePicker1.Date)) > 3 then
          begin
            MessageDlg('Harus dikembalikan dalam waktu 3 hari!', mtError, [mbOK], 0);
          end
        else
          begin
            showmessage('Data berhasil diperbarui!');

            ADOTable1.Edit;
            ADOTable1['no_transaksi'] := label1.Caption;
            ADOTable1['nama_siswa'] := edit1.Text;
            ADOTable1['nis'] := edit2.Text;
            ADOTable1['nama_barang'] := edit3.Text;
            ADOTable1['banyak'] := inttostr(1);
            ADOTable1.FieldByName('waktu').AsDateTime := DateTimePicker1.Date;
            ADOTable1.FieldByName('batas').AsDateTime := DateTimePicker2.Date;
            ADOTable1.Post;
            DBGrid1.Refresh;

            label1.Caption := '...';
            edit1.Clear;
            edit2.Clear;
            edit3.Clear;
            datetimepicker1.Date := now;
            datetimepicker2.Date := now;
          end;
      end;
  end;
end;

procedure TForm12.Image6Click(Sender: TObject);
begin
label1.Caption := '...';
edit1.Clear;
edit2.Clear;
edit3.Clear;
datetimepicker1.Date := now;
datetimepicker2.Date := now;
end;

procedure TForm12.DBGrid1CellClick(Column: TColumn);
begin
  DBGrid1.Refresh;
  label1.Caption := ADOTable1['no_transaksi'];
  edit1.Text := ADOTable1['nama_siswa'];
  edit2.Text := ADOTable1['nis'];
  edit3.Text := ADOTable1['nama_barang'];
  DateTimePicker1.Date := ADOTable1.FieldByName('waktu').AsDateTime;
  DateTimePicker2.Date := ADOTable1.FieldByName('batas').AsDateTime;
end;

procedure TForm12.Image10Click(Sender: TObject);
begin
form12.Hide;
form7.show;
end;

procedure TForm12.Image5Click(Sender: TObject);
begin
form12.Hide;
quickreport18.preview;
end;

end.

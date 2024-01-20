unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, DB, ADODB, Grids, DBGrids;

type
  TForm7 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    Image5: TImage;
    Image6: TImage;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Image7: TImage;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    Label3: TLabel;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit5, Unit3, Unit11, Unit13, Unit16;

{$R *.dfm}

procedure TForm7.Image3Click(Sender: TObject);
var
  konfirm: Integer;
begin
  konfirm := MessageDlg('Apakah Anda yakin ingin keluar?', mtConfirmation, [mbOK, mbCancel], 0);

  if konfirm = mrOK then
    begin
    form7.Hide;
    form5.show;
    form5.Edit1.Clear;
    form5.Edit2.Clear;
    end;
end;

procedure TForm7.Image2Click(Sender: TObject);
begin
if form3.Label1.Caption = 'Anda masuk sebagai owner' then
  begin
    form7.Hide;
    form13.show;
    form13.Image11.Visible := true;
  end
else
  begin
    form7.hide;
    form3.show;
  end;
end;

procedure TForm7.Image5Click(Sender: TObject);
begin
label1.Caption := '...';

edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
end;

procedure TForm7.Image6Click(Sender: TObject);
begin
form7.Hide;
quickreport16.preview;
end;

procedure TForm7.Image4Click(Sender: TObject);
begin
if ADOTable1.Locate('nama_barang', uppercase(edit5.Text), [lopartialkey]) then
  begin
    DBGrid1.Refresh;
    label1.Caption := ADOTable1['kode_barang'];
    edit3.Text := ADOTable1['nama_barang'];

    MessageDlg('Data ditemukan!', mtInformation, [mbOK], 0);
  end
else
  begin
    MessageDlg('Data tidak dapat ditemukan!', mtError, [mbOK], 0);
  end;
end;

procedure TForm7.Image7Click(Sender: TObject);
var
  sisa, kode: string;
  totalBaris: integer;
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
        if (DateToStr(datetimepicker1.Date) <> DateToStr(now)) then
          begin
            MessageDlg('Harus meminjam hari ini!', mtError, [mbOK], 0);
          end
        else
          begin
            if (trunc(DateTimePicker2.Date)-trunc(DateTimePicker1.Date)) >= 1 then
              begin
                MessageDlg('Harus dikembalikan pada hari yang sama!', mtError, [mbOK], 0);
              end
            else
              begin
                ADOQuery1.SQL.Text := 'SELECT COUNT(*) AS no_transaksi FROM sewa';
                ADOQuery1.Open;

                totalBaris := ADOQuery1.FieldByName('no_transaksi').AsInteger;
                if totalBaris < 10 then
                  begin
                    kode := 'TR-' + '00' + inttostr(totalBaris + 1);
                    //edit1.Text := kode;
                  end
                else if totalBaris < 100 then
                  begin
                    kode := 'TR-' + '0' + inttostr(totalBaris + 1);
                    //edit1.Text := kode;
                  end;

                ADOQuery1.Close;
                
                sisa := inttostr(strtoint(label2.Caption) - strtoint(edit4.Text));
                showmessage('Selamat, Transaksi berhasil!');

                ADOTable2.Append;
                ADOTable2['no_transaksi'] := kode;
                ADOTable2['nama_siswa'] := edit1.Text;
                ADOTable2['nis'] := edit2.Text;
                ADOTable2['nama_barang'] := edit3.Text;
                ADOTable2['banyak'] := edit4.Text;
                ADOTable2.FieldByName('waktu').AsDateTime := DateTimePicker1.Date;
                ADOTable2.FieldByName('batas').AsDateTime := DateTimePicker2.Date;
                ADOTable2.Post;
                DBGrid2.Refresh;

                ADOTable1.Edit;
                ADOTable1['kode_barang'] := label1.Caption;
                ADOTable1['nama_barang'] := edit3.Text;
                ADOTable1['stok'] := sisa;
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
      end
    else if (edit3.Text <> 'PROYEKTOR') then
      begin
        if (DateToStr(datetimepicker1.Date) <> DateToStr(now)) then
          begin
            MessageDlg('Harus meminjam hari ini!', mtError, [mbOK], 0);
          end
        else
          begin
            if (trunc(DateTimePicker2.Date)-trunc(DateTimePicker1.Date)) > 3 then
              begin
                MessageDlg('Harus dikembalikan dalam waktu 3 hari!', mtError, [mbOK], 0);
              end
            else
              begin
                sisa := inttostr(strtoint(label2.Caption) - strtoint(edit4.Text));
                showmessage('Selamat, Transaksi berhasil!');

                ADOQuery1.SQL.Text := 'SELECT COUNT(*) AS no_transaksi FROM sewa';
                ADOQuery1.Open;

                totalBaris := ADOQuery1.FieldByName('no_transaksi').AsInteger;
                if totalBaris < 10 then
                  begin
                    kode := 'TR-' + '00' + inttostr(totalBaris + 1);
                    //edit1.Text := kode;
                  end
                else if totalBaris < 100 then
                  begin
                    kode := 'TR-' + '0' + inttostr(totalBaris + 1);
                    //edit1.Text := kode;
                  end;

                ADOQuery1.Close;

                ADOTable2.Append;
                ADOTable2['no_transaksi'] := kode;
                ADOTable2['nama_siswa'] := edit1.Text;
                ADOTable2['nis'] := edit2.Text;
                ADOTable2['nama_barang'] := edit3.Text;
                ADOTable2['banyak'] := edit4.Text;
                ADOTable2.FieldByName('waktu').AsDateTime := DateTimePicker1.Date;
                ADOTable2.FieldByName('batas').AsDateTime := DateTimePicker2.Date;
                ADOTable2.Post;
                DBGrid2.Refresh;

                ADOTable1.Edit;
                ADOTable1['kode_barang'] := label1.Caption;
                ADOTable1['nama_barang'] := edit3.Text;
                ADOTable1['stok'] := sisa;
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
end;

procedure TForm7.DBGrid1CellClick(Column: TColumn);
begin
  label1.Caption := ADOTable1['kode_barang'];
  edit3.Text := ADOTable1['nama_barang'];
  label2.Caption := ADOTable1['stok'];
end;

procedure TForm7.Image1Click(Sender: TObject);
begin
datetimepicker1.Date := now;
datetimepicker2.Date := now;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
datetimepicker1.Date := now;
datetimepicker2.Date := now;
end;

end.

unit untMain;

interface

uses
     System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
     FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.FMXUI.Wait,
     Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
     FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.Controls, System.Rtti,
     FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
     System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
     Data.Bind.Grid, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
     Data.Bind.DBScope, FMX.Layouts, FMX.Bind.Navigator, FireDAC.Comp.DataSet,
  FMX.StdCtrls, FMX.TabControl;

type
     TfrmMain = class(TForm)
          FDConnection: TFDConnection;
          FDQueryContacts: TFDQuery;
          FDQueryContactsidContact: TFDAutoIncField;
          FDQueryContactsnameContact: TStringField;
          FDQueryContactscellPhone: TStringField;
          FDQueryContactsdateBirth: TSQLTimeStampField;
          BindSourceDB1: TBindSourceDB;
          BindingsList1: TBindingsList;
          Panel1: TPanel;
          TabControl1: TTabControl;
          TabItem1: TTabItem;
          Grid1: TGrid;
          BindNavigator1: TBindNavigator;
          TabItem2: TTabItem;
    btnConnect: TButton;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    StyleBook: TStyleBook;
          procedure FormShow(Sender: TObject);
          procedure FormClose(Sender: TObject; var Action: TCloseAction);
          procedure btnConnectClick(Sender: TObject);
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnConnectClick(Sender: TObject);
begin
     if FDQueryContacts.Active then
     begin
          FDQueryContacts.Close;
          //
          btnConnect.Text := 'Open';
     end
     else
     begin
          FDQueryContacts.Open;
          //
          btnConnect.Text := 'Close';
     end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FDConnection.Close;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
     FDConnection.Open();
end;

end.

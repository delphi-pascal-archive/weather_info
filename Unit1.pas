unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls,UseXML;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Ed1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Ed2: TEdit;
    Label3: TLabel;
    Ed3: TEdit;
    Label4: TLabel;
    Ed4: TEdit;
    Memo1: TMemo;
    Label5: TLabel;
    Ed5: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  URL,CityID,str:string;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 i,y: integer;
begin
 Memo1.Clear;
 CreateXML;
 // ������ �������� - ����� ID ������
 // �������� ����������������� ����� ������
 // ��� ���� ������ ���� � ����� ���� ������ ���� ����� (��������� � Ed1.Tex)
 URL:='http://xoap.weather.com/search/search?where='+Ed1.Text;
 LoadXML(URL);
 // ����� ��������� �� ��� ����������� � �������
 // saveXML('FindCityXML.txt');
 { ������ ���� ��� ����������� � ������� ���� ������ Ekaterinburg � ���� ������ (��� ������ � ���� ������ �������)
  <?xml version="1.0" encoding="ISO-8859-1"?>
  <!--This document is intended only for use by authorized licensees of The Weather Channel. Unauthorized use is prohibited. Copyright 1995-2005, The Weather Channel Interactive, Inc. All Rights Reserved.-->
  <search ver="2.0">
  <loc id="RSXX1219" type="1">Ekaterinburg, Russia</loc>
  </search>
 }
 // ����� �� (����������������� ����� ������)
 // � ��� ������� ��� RSXX1219
 CityID:=GetNodeItemText(['//search','//loc'],'id');
 if CityID=''
 then
  begin
   Memo1.Lines.Add(Format('������, ����� %s �� ������ � ���� �������',[Ed1.Text]));
   Exit;
  end;
 // ������� ���������� � �������� ������, � ��� �� ��������� (������)
 memo1.Lines.Add('����� ������ � ����: '+GetNodeText(['//search','//loc']));
 memo1.Lines.Add('');
 //=======================================
 //=== ������ �������� - �� ID ������ ������� ���� � ������
 //=======================================
 // �������� ���������� � ������ (��������� � �����)
 // ��� ������ ������ URL: http://xoap.weather.com/weather/local/RSXX1219?cc=*&dayf=4&prod=xoap&link=xoap&par=1006341644&key=0647abc97052c741&unit=m
 URL:=Format('http://xoap.weather.com/weather/local/%s?cc=*&dayf=%s&prod=xoap&link=xoap&par=%s&key=%s&unit=%s',[CityID{Ed1.Text},Ed5.Text,Ed2.Text,Ed3.Text,Ed4.Text]);
 LoadXML(URL);
 // ����� ��������� �� ��� ����������� � �������
 // SaveXML('WeaterCityXML.txt');
 {
 //������ ������ �� 2 ��� :)
 //�� ���� ����� ������� ������, ���� ��� ����� ���� ����� ���������:
 //����� �������/������ ������, ������� ����, ��� �������������� ����� ��� ������������� ���� - <lnks type="prmo">
 //� <cc> ������� ���� � ������: �������� ��. ������ � <bar>, ����� � ��� �������������� � <wind> � �.�.
 //� <dayf> ����������� ������ �� "����������" � ����� URL ���
 <?xml version="1.0" encoding="ISO-8859-1"?>
 <!--This document is intended only for use by authorized licensees of The Weather Channel. Unauthorized use is prohibited. Copyright 1995-2005, The Weather Channel Interactive, Inc. All Rights Reserved.-->
 <weather ver="2.0">
 	<head>
 		<locale>en_US</locale>
 		<form>MEDIUM</form>
 		<ut>C</ut>
		<ud>km</ud>
		<us>km/h</us>
		<up>mb</up>
		<ur>mm</ur>
	</head>
	<loc id="RSXX1219">
		<dnam>Ekaterinburg, Russia</dnam>
		<tm>9:13 PM</tm>
		<lat>56.83</lat>
		<lon>60.63</lon>
		<sunr>8:15 AM</sunr>
		<suns>7:14 PM</suns>
		<zone>6</zone>
	</loc>
	<lnks type="prmo">
		<link pos="1">
			<l>http://www.weather.com/outlook/health/allergies/RSXX1219?par=xoap</l>
			<t>Pollen Reports</t>
		</link>
		<link pos="2">
			<l>http://www.weather.com/outlook/travel/flights/citywx/RSXX1219?par=xoap</l>
			<t>Airport Delays</t>
		</link>
		<link pos="3">
			<l>http://www.weather.com/outlook/events/special/result/RSXX1219?when=thisweek&amp;par=xoap</l>
			<t>Special Events</t>
		</link>
		<link pos="4">
			<l>http://www.weather.com/services/desktop.html?par=xoap</l>
			<t>Download Desktop Weather</t>
		</link>
	</lnks>
	<cc>
		<lsup>10/8/05 8:00 PM Local Time</lsup>
		<obst>Yekaterinburg, Russia</obst>
		<tmp>4</tmp>
		<flik>1</flik>
		<t>Mostly Cloudy</t>
		<icon>27</icon>
		<bar>
			<r>1026.1</r>
			<d>rising</d>
		</bar>
		<wind>
			<s>11</s>
			<gust>N/A</gust>
			<d>320</d>
			<t>NW</t>
		</wind>
		<hmid>61</hmid>
		<vis>6.0</vis>
		<uv>
			<i>0</i>
			<t>Low</t>
		</uv>
		<dewp>-3</dewp>
		<moon>
			<icon>5</icon>
			<t>Waxing Crescent</t>
		</moon>
	</cc>
	<dayf>
		<lsup>10/8/05 7:18 PM Local Time</lsup>
		<day d="0" t="Saturday" dt="Oct 8">
			<hi>N/A</hi>
			<low>-2</low>
			<sunr>8:15 AM</sunr>
			<suns>7:14 PM</suns>
			<part p="d">
				<icon>44</icon>
				<t>N/A</t>
				<wind>
					<s>N/A</s>
					<gust>N/A</gust>
					<d>N/A</d>
					<t>N/A</t>
				</wind>
				<bt>N/A</bt>
				<ppcp>10</ppcp>
				<hmid>N/A</hmid>
			</part>
			<part p="n">
				<icon>29</icon>
				<t>Partly Cloudy</t>
				<wind>
					<s>16</s>
					<gust>N/A</gust>
					<d>300</d>
					<t>WNW</t>
				</wind>
				<bt>P Cloudy</bt>
				<ppcp>10</ppcp>
				<hmid>76</hmid>
			</part>
		</day>
		<day d="1" t="Sunday" dt="Oct 9">
			<hi>12</hi>
			<low>2</low>
			<sunr>8:17 AM</sunr>
			<suns>7:11 PM</suns>
			<part p="d">
				<icon>34</icon>
				<t>Mostly Sunny</t>
				<wind>
					<s>21</s>
					<gust>N/A</gust>
					<d>283</d>
					<t>WNW</t>
				</wind>
				<bt>M Sunny</bt>
				<ppcp>10</ppcp>
				<hmid>76</hmid>
			</part>
			<part p="n">
				<icon>29</icon>
				<t>Partly Cloudy</t>
				<wind>
					<s>19</s>
					<gust>N/A</gust>
					<d>304</d>
					<t>NW</t>
				</wind>
				<bt>P Cloudy</bt>
				<ppcp>20</ppcp>
				<hmid>92</hmid>
			</part>
		</day>
	</dayf>
</weather>
}
 //����
 memo1.Lines.Add('����� = ' +GetNodeText(['//weather','//loc ','//dnam']));
 memo1.Lines.Add('������ = ' + GetNodeText(['//weather','//loc ','//sunr']));
 memo1.Lines.Add('�����  = ' + GetNodeText(['//weather','//loc ','//suns']));
 memo1.Lines.Add('������� ���� = '+GetNodeText(['//weather','//loc ','//zone']));
 memo1.Lines.Add('');
 //
 memo1.Lines.Add('��������� ����� = ' + GetNodeText(['//weather','//cc','//lsup']));
 memo1.Lines.Add('����������� � = ' + GetNodeText(['//weather','//cc','//tmp']));
 memo1.Lines.Add('������ = ' + GetNodeTextFromID(['//weather','//cc'],4));
 memo1.Lines.Add('�������� ��. ��. = '+ GetNodeText(['//weather','//cc','//bar','//r']));
 memo1.Lines.Add('�������� = '+ GetNodeText(['//weather','//cc','//bar','//d']));
 memo1.Lines.Add('����� �/c = '+ GetNodeText(['//weather','//cc','//wind','//s']));
 memo1.Lines.Add('����������� = '+GetNodeTextFromID(['//weather','//cc','//wind'],3));
 memo1.Lines.Add('��������� ��.  = ' + GetNodeText(['//weather','//cc','//vis']));
 memo1.Lines.Add('���� = '+ GetNodeTextFromID(['//weather','//moon'],1));
 memo1.Lines.Add('');
 //
 // � ��� ��� ��� ������� �� ������ ��� (������� ������� �� �����, �� ��������� 4)
 memo1.Lines.Add('������ �� ��������� ���:');
 for i:=1 to GetNodesCountByName(['//weather','//dayf'],'day') do
  begin
   str:= GetNodeItemTextFromID(['//weather','//dayf'],i,'t');
   str:= str+', '+GetNodeItemTextFromID(['//weather','//dayf'],i,'dt');
   memo1.Lines.Add('���� - '+str);

   str:=GetNodeTextByNameFromID(['//weather','//dayf'],'hi',i);
   memo1.Lines.Add('����. �����������: '+str);

   str:=GetNodeTextByNameFromID(['//weather','//dayf'],'low',i);
   memo1.Lines.Add('���. �����������: '+str);

   str:=GetNodeTextByNameFromID(['//weather','//dayf'],'sunr',i);
   memo1.Lines.Add('������: '+str);

   str:=GetNodeTextByNameFromID(['//weather','//dayf'],'suns',i);
   memo1.Lines.Add('�����: '+str);
 end;
end;

end.

{
Ìîäóëü äëÿ óäîáíîé ðàáîòû ñ XML äîêóìåíòàìè,
ðàáîòàåò ÷åðåç  OLE îáúåêò

äîáàâëÿåò â êîä îêîëî 70 Êá

ïðèìåð èñïîëüçîâàíèÿ:
1) åñòü XML ñòðóêòóðà â ôàéëå WeaterCityXML.txt:

<?xml version="1.0" encoding="ISO-8859-1"?>
<weather ver="2.0">
	<head>
		<locale>en_US</locale>
  </head>
  <item>
    <t>123</t>
  </item>
  <item>
    <t>321</t>
  </item>
  <item>
    <t>567</t>
  </item>
</weather>

2) êîä:
CreateXML;
LoadXML('WeaterCityXML.txt');
str1:=GetNodeText(['//weather','//head','//locale']); - âîçâðàòèò en_US
str2:=GetNodeItemText(['//weather'],'ver'); - âîçâðàòèò 2.0
int3:=GetNodesCount(['//weather']) - âîçâðàòèò 4
int4:=GetNodesCountByName(['//weather'],'item') - âîçâðàòèò 3
str5:=GetNodeTextFromID(['//weather'],0); - âîçâðàòèò <locale>en_US</locale>
str6:=GetNodeTextByNameFromID(['//weather'],'item',1); - âîçâðàòèò <t>321</t>
}
unit UseXML;

interface

uses
  comobj;

var
  XML: Variant;  //ãëàâíûé îáúåêò XML: çàãðóæàåò/ñîõðàíÿåò XML è ò.ï.

function CreateXML:boolean;
procedure LoadXML(XML_:string);//XML_ - ñòðîêà_XML èëè èìÿ_ôàéëà èëè URL
procedure SaveXML(FileName:string);
function GetNodeText(Path:array of string):string;
function GetNodeItemText(Path:array of string;Item:string):string;
function GetNodeItemTextFromID(Path:array of string;ID:integer;Item:string):string;
function GetNodeItemTextByNameFromID(Path:array of string;NodeName:string;ID:integer;Item:string):string;
function GetNodesCount(Path:array of string):integer;//êîë-âî âñåõ ýëåìåíòîâ ó ïîñëåäíåãî "íîäà" â Path
function GetNodesCountByName(Path:array of string;NodeName:string):integer;//êîë-âî ýëåìåíòîâ ñ èìåíåì NodeName ó ïîñëåäíåãî "íîäà" â Path
function GetNodeTextFromID(Path:array of string;ID:integer):string;
function GetNodeTextByNameFromID(Path:array of string;NodeName:string;ID:integer):string;

implementation


function CreateXML:boolean;
begin
XML := CreateOleObject('Microsoft.XMLDOM');
XML.async:=false;//åñëè true òî âðîäå äèíàìè÷åñêè áóäåò ïîäãðóæàòü  XML
result:= ({XML<>0}XML.parseError.reason = '');
end;

procedure LoadXML(XML_:string);
begin
XML.load(XML_);
end;

procedure SaveXML(FileName:string);
begin
XML.save(FileName);
end;

function GetNodeText(Path:array of string):string;
var
  Node: variant;
  i:integer;
begin
  Node:=XML.documentElement;
  for i:=0 to High(Path) do begin
    Node:=Node.SelectSingleNode(Path[i]);
    //if integer(Node)=0 then exit;
  end;
    try
    result:=Node.Text;
    except
    result:='';
    end;
end;

function GetNodeItemText(Path:array of string;Item:string):string;
var
  Node: variant;
  i:integer;
begin
  Node:=XML.documentElement;
  for i:=0 to High(Path) do begin
    Node:=Node.SelectSingleNode(Path[i]);
    //if Node=0 then exit;
  end;
    try
    result:=Node.attributes.getNamedItem(Item).text;
    except
    result:='';
    end;
end;

function GetNodeItemTextFromID(Path:array of string;ID:integer;Item:string):string;
var
  Node: variant;
  i:integer;
begin
  Node:=XML.documentElement;
  for i:=0 to High(Path) do begin
    Node:=Node.SelectSingleNode(Path[i]);
    //if Node=0 then exit;
  end;
    try
    result:=Node.childNodes.item[ID].attributes.getNamedItem(Item).Text;
    except
    result:='';
    end;
end;

function GetNodeItemTextByNameFromID(Path:array of string;NodeName:string;ID:integer;Item:string):string;
var
  Node: variant;
  i:integer;
begin
  Node:=XML.documentElement;
  for i:=0 to High(Path) do begin
    Node:=Node.SelectSingleNode(Path[i]);
    //if Node=0 then exit;
  end;
    try
    result:=Node.SelectNodes(NodeName).item[ID].attributes.getNamedItem(Item).text;
    except
    result:='';
    end;
end;

function GetNodesCount(Path:array of string):integer;
var
  Node: variant;
  i:integer;
begin
  Node:=XML.documentElement;
  for i:=0 to High(Path) do begin
    Node:=Node.SelectSingleNode(Path[i]);
    //if Node=0 then exit;
  end;
    try
    result:=Node.childNodes.length;
    except
    result:=0;
    end;
end;

function GetNodesCountByName(Path:array of string;NodeName:string):integer;
var
  Node: variant;
  i:integer;
begin
  Node:=XML.documentElement;
  for i:=0 to High(Path) do begin
    Node:=Node.SelectSingleNode(Path[i]);
    //if Node=0 then exit;
  end;
    try
    result:=Node.SelectNodes(NodeName).length;
    except
    result:=0;
    end;
end;

function GetNodeTextFromID(Path:array of string;ID:integer):string;
var
  Node: variant;
  i:integer;
begin
  Node:=XML.documentElement;
  for i:=0 to High(Path) do begin
    Node:=Node.SelectSingleNode(Path[i]);
    //if Node=0 then exit;
  end;
    try
    result:=Node.childNodes.item[ID].Text;
    except
    result:='';
    end;
end;


function GetNodeTextByNameFromID(Path:array of string;NodeName:string;ID:integer):string;
var
  Node: variant;
  i:integer;
begin
  Node:=XML.documentElement;
  for i:=0 to High(Path) do begin
    Node:=Node.SelectSingleNode(Path[i]);
    //if Node=0 then exit;
  end;
    node:=Node.childNodes.item[ID];

    try
    result:=Node.SelectSingleNode(NodeName).text;
    //result:=Node.SelectNodes(NodeName).item[ID].text;
    except
    result:='';
    end;
end;

end.
 
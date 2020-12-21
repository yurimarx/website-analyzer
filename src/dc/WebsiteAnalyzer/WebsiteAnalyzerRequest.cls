Class dc.WebsiteAnalyzer.WebsiteAnalyzerRequest Extends Ens.Request
{

Property Website As %String;

Property Depth As %Integer;

Property Pages As %Integer;

Storage Default
{
<Data name="WebsiteAnalyzerRequestDefaultData">
<Subscript>"WebsiteAnalyzerRequest"</Subscript>
<Value name="1">
<Value>Website</Value>
</Value>
<Value name="2">
<Value>Depth</Value>
</Value>
<Value name="3">
<Value>Pages</Value>
</Value>
</Data>
<DefaultData>WebsiteAnalyzerRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

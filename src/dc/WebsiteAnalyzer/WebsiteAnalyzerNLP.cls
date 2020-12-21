Class dc.WebsiteAnalyzer.WebsiteAnalyzerNLP Extends %iKnow.DomainDefinition [ ProcedureBlock ]
{

XData Domain [ XMLNamespace = "http://www.intersystems.com/iknow" ]
{
<domain name="WebsiteAnalyzerDomain" disabled="false" allowCustomUpdates="true">
<parameter name="DefaultConfig" value="WebsiteAnalyzerDomain.Configuration" isList="false" />
<data dropBeforeBuild="true">
<files listname="File_1" batchMode="false" disabled="false" listerClass="%iKnow.Source.File.Lister" path="/var/crawler/nlp/" recursive="false" extensions="txt">
<parameter value="/var/crawler/nlp/" isList="false" />
<parameter isList="false" />
<parameter value="0" isList="false" />
</files>
</data>
<matching disabled="false" dropBeforeBuild="true" autoExecute="true" ignoreDictionaryErrors="true" />
<metadata />
<configuration name="WebsiteAnalyzerDomain.Configuration" detectLanguage="true" languages="en,pt" userDictionary="WebsiteAnalyzerDomain.Dictionary#1" summarize="true" maxConceptLength="0" />
<userDictionary name="WebsiteAnalyzerDomain.Dictionary#1" />
</domain>
}

}

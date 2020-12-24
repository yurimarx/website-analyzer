Class dc.WebsiteAnalyzer.TopEntitiesKPI Extends %iKnow.DeepSee.GenericKPI
{

Parameter IKDOMAINID = 1;

Parameter IKPAGESIZE As %Integer = 10;

Parameter IKQUERYCLASS = "%iKnow.Queries.EntityAPI";

Parameter IKQUERYNAME = "GetTop";

/// This XData definition defines the KPI.
XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi name="TopEntities" displayName="Top Entities in text analytics domain 1"  >
<property name="resultNumber" displayName="rank"/>
<property name="entity" displayName="entity"/>
<property name="entUniId" displayName="Id"/>
<property name="frequency" displayName="frequency"/>
<property name="spread" displayName="spread"/>
</kpi>
}

}

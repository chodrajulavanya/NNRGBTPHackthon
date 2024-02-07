sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'salesinformation/salesapp/test/integration/FirstJourney',
		'salesinformation/salesapp/test/integration/pages/BusinessPartnerList',
		'salesinformation/salesapp/test/integration/pages/BusinessPartnerObjectPage'
    ],
    function(JourneyRunner, opaJourney, BusinessPartnerList, BusinessPartnerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('salesinformation/salesapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBusinessPartnerList: BusinessPartnerList,
					onTheBusinessPartnerObjectPage: BusinessPartnerObjectPage
                }
            },
            opaJourney.run
        );
    }
);
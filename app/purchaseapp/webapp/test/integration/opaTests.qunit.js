sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'purchaseinformation/purchaseapp/test/integration/FirstJourney',
		'purchaseinformation/purchaseapp/test/integration/pages/BusinessPartnerList',
		'purchaseinformation/purchaseapp/test/integration/pages/BusinessPartnerObjectPage'
    ],
    function(JourneyRunner, opaJourney, BusinessPartnerList, BusinessPartnerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('purchaseinformation/purchaseapp') + '/index.html'
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
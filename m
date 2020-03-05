Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49E17AE06
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Mar 2020 19:24:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32B7DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Mar 2020 18:24:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7003EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2020 18:24:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025IDWf2017599; Thu, 5 Mar 2020 19:24:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xoCUsHoX8gmaJFTXl9yht58eHR76QRmFaW2mlT7xwwU=;
 b=A9tnODeB6eDWgHqTkpZBACILUn89uT7h/QzzaqL5TMBUcwaL2by8hFeKoe7HBDhr6JKU
 NoCet2dtcctJF2wbmSqsPPC/SRnM2qMhjhbjK2Xwnx/bohk6qQtUmqisoo0tIKchdSZy
 FUBLlRDhFxZCPHIJ/79x71kc4x+uf9SKD0v5fJieslHoT5U9Ndj5BmMrm03TmzIw99ge
 08G86tN7+q9rNKXWxj3+u/kOrsrcs3zJQWW3oll5D8aOiGy960cTeZunfxlTyAFKDBis
 NFNH8PwSRZjF9OBIvR7u12S5w+84VjCSDeZ5rR6G9Oq2/rLYUjvj7jxWRD0IA3O+BB/J IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfdydaa5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 19:24:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4483B10002A;
 Thu,  5 Mar 2020 19:24:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 318722AE6CA;
 Thu,  5 Mar 2020 19:24:32 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Mar
 2020 19:24:31 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 5 Mar 2020 19:24:31 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v4 2/5] usb: host: dwc2: add phy support
Thread-Index: AQHV5jZU0c3A+IaK+kCXJ4FV9bHgH6g433IAgAGKQ+A=
Date: Thu, 5 Mar 2020 18:24:31 +0000
Message-ID: <e4d70ab6e8e04d7396fa9b375a0f7fae@SFHDAG6NODE3.st.com>
References: <20200218083503.5468-1-patrick.delaunay@st.com>
 <20200218083503.5468-3-patrick.delaunay@st.com>
 <9c919bd2-87b9-0052-579a-a3fa491445dd@gmail.com>
In-Reply-To: <9c919bd2-87b9-0052-579a-a3fa491445dd@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_06:2020-03-05,
 2020-03-05 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>,
 "ley.foon.tan@intel.com" <ley.foon.tan@intel.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v4 2/5] usb: host: dwc2: add phy support
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



> -----Original Message-----
> From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
> Sent: mercredi 4 mars 2020 20:52
> To: Patrick DELAUNAY <patrick.delaunay@st.com>; u-boot@lists.denx.de
> Cc: ley.foon.tan@intel.com; b.galvani@gmail.com; Daniel Schwierzeck
> <daniel.schwierzeck@gmail.com>; Marek Vasut <marex@denx.de>; Michal
> Suchanek <msuchanek@suse.de>; Simon Glass <sjg@chromium.org>; U-Boot
> STM32 <uboot-stm32@st-md-mailman.stormreply.com>
> Subject: Re: [PATCH v4 2/5] usb: host: dwc2: add phy support
> Importance: High
> 
> Am 18.02.2020 um 09:35 schrieb Patrick Delaunay:
> > Use generic phy to initialize the PHY associated to the
> > DWC2 device and available in the device tree.
> >
> > This patch don't added dependency because when CONFIG_PHY is not
> > activated, the generic PHY function are stubbed.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> > Changes in v4: None
> > Changes in v3: None
> > Changes in v2:
> > - update dev_err
> > - update commit message
> > - change dev_err to dev_dbg for PHY function call
> > - treat dwc2_shutdown_phy error
> >
> >  drivers/usb/host/dwc2.c | 66
> > +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c index
> > e4efaf1e59..5e7ffaddd9 100644
> > --- a/drivers/usb/host/dwc2.c
> > +++ b/drivers/usb/host/dwc2.c
> > @@ -8,6 +8,7 @@
> >  #include <cpu_func.h>
> >  #include <dm.h>
> >  #include <errno.h>
> > +#include <generic-phy.h>
> >  #include <usb.h>
> >  #include <malloc.h>
> >  #include <memalign.h>
> > @@ -37,6 +38,7 @@ struct dwc2_priv {
> >  #ifdef CONFIG_DM_REGULATOR
> >  	struct udevice *vbus_supply;
> >  #endif
> > +	struct phy phy;
> >  #else
> >  	uint8_t *aligned_buffer;
> >  	uint8_t *status_buffer;
> > @@ -1322,13 +1324,71 @@ static int dwc2_usb_ofdata_to_platdata(struct
> udevice *dev)
> >  	return 0;
> >  }
> >
> > +static int dwc2_setup_phy(struct udevice *dev) {
> > +	struct dwc2_priv *priv = dev_get_priv(dev);
> > +	int ret;
> > +
> > +	ret = generic_phy_get_by_index(dev, 0, &priv->phy);
> > +	if (ret) {
> > +		if (ret != -ENOENT) {
> 
> Could you invert this logic and add a comment like "no PHY" or something?

Yes in V5, it is more clear

	ret = generic_phy_get_by_index(dev, 0, &priv->phy);
	if (ret) {
		if (ret == -ENOENT)
			return 0; /* no PHY, nothing to do */
		dev_err(dev, "Failed to get USB PHY: %d.\n", ret);
		return ret;
	}

> > +			dev_err(dev, "Failed to get USB PHY: %d.\n", ret);
> > +			return ret;
> > +		}
> > +		return 0;
> > +	}
> > +
> > +	ret = generic_phy_init(&priv->phy);
> > +	if (ret) {
> > +		dev_dbg(dev, "Failed to init USB PHY: %d.\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = generic_phy_power_on(&priv->phy);
> > +	if (ret) {
> > +		dev_dbg(dev, "Failed to power on USB PHY: %d.\n", ret);
> > +		generic_phy_exit(&priv->phy);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int dwc2_shutdown_phy(struct udevice *dev) {
> > +	struct dwc2_priv *priv = dev_get_priv(dev);
> > +	int ret;
> > +
> > +	if (!generic_phy_valid(&priv->phy))
> 
> A comment saying that this is for platforms without a phy driver would be nice.

Yes in V5:

static int dwc2_shutdown_phy(struct udevice *dev)
{
	struct dwc2_priv *priv = dev_get_priv(dev);
	int ret;

	/* PHY is not valid when generic_phy_get_by_index() = -ENOENT */
	if (!generic_phy_valid(&priv->phy))
		return 0; /* no PHY, nothing to do */


> Other than that:
> Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

Thanks 
Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

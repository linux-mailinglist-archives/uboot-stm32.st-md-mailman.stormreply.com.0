Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8758CF1C9F
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 18:40:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41391C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 17:40:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71E1BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 17:40:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6HbZ6C030198; Wed, 6 Nov 2019 18:40:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=V/pN6JwbaVVbxDT+V2M5f2px5jDFFdRvtaECbDQoqNo=;
 b=dj9W3xEZQqPfEXsPkVlX/kF7BfT8RaHwo+/BVmE4eW564/ZCsk/uI/NhDZtDpSqg/xeD
 4/oPR6cCPXvg7+Nz3Rtn++OErvJaB2xAKxBRYuiuIKIH/7qliJypGPz4o2Vj3h4c2AO8
 NXD7WPzvGb+zvDA2D7+T7KiuXCFIW1mLJB+VXnRGi8BLxoKm3QYaFEKms8CyyT9ZIcGO
 XZM4QFBZUbhjEtWsfPOM/y74YLS4+sLekerWq+6pboxu8ndNUWnmwcCQT24+hF6KLX2D
 vFZGXkFLdDXKK7mkhGvkAq5yxO1m1pajpJ8cnBp+gP4EYC1u0b8CzpLwDl1EId1aHkOd AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w41vgr8vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 18:40:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8C3E10002A;
 Wed,  6 Nov 2019 18:40:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C27B12AE910;
 Wed,  6 Nov 2019 18:40:19 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 6 Nov
 2019 18:40:19 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 6 Nov 2019 18:40:19 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [RESEND PATCH 1/5] usb: host: dwc2: add phy support
Thread-Index: AQHVgmV2nmRa+G7B8UeLaPkBdNThMKdap14AgCPWHFA=
Date: Wed, 6 Nov 2019 17:40:19 +0000
Message-ID: <899e7f46951f4a52a9e2a6453363f210@SFHDAG6NODE3.st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-2-patrick.delaunay@st.com>
 <67fe66ee-4ee9-ceb4-c303-801605764bdb@denx.de>
In-Reply-To: <67fe66ee-4ee9-ceb4-c303-801605764bdb@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-06_06:2019-11-06,2019-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 1/5] usb: host: dwc2: add phy
	support
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

Hi Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: mardi 15 octobre 2019 01:27

First sorry for my late answer....
 
> On 10/14/19 10:00 AM, Patrick Delaunay wrote:
> > Use generic phy to initialize the PHY associated to the
> 
> PHY and USB are abbreviations, should be in capitals.
> 
> > DWC2 device and available in the device tree.
> 
> [...]
> 
> General question -- is the PHY subsystem a mandatory dependency of this driver
> now or will it work without the PHY subsystem still ?

Normally it is working as all the generic_phy_XXX fucntions
are stubbed in include/generic-phy.h

- generic_phy_get_by_index() return 0 and phy->dev = NULL
- all other function return 0
- generic_phy_valid return FALSE (phy->dev = NULL)

 
> > +static int dwc2_setup_phy(struct udevice *dev) {
> > +	struct dwc2_priv *priv = dev_get_priv(dev);
> > +	int ret;
> > +
> > +	ret = generic_phy_get_by_index(dev, 0, &priv->phy);
> > +	if (ret) {
> > +		if (ret != -ENOENT) {
> > +			dev_err(dev, "failed to get usb phy\n");
> 
> Sentence starts with capital letter, USB and PHY are in capitals. Fix globally
> please.
> It would be useful to print the $ret value too.

Yes, in V2

> 
> > +			return ret;
> > +		}
> > +		return 0;
> > +	}
> > +
> > +	ret = generic_phy_init(&priv->phy);
> > +	if (ret) {
> > +		dev_err(dev, "failed to init usb phy\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = generic_phy_power_on(&priv->phy);
> > +	if (ret) {
> > +		dev_err(dev, "failed to power on usb phy\n");
> > +		return generic_phy_exit(&priv->phy);
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
> > +		return 0;
> > +
> > +	ret = generic_phy_power_off(&priv->phy);
> > +	if (ret) {
> > +		dev_err(dev, "failed to power off usb phy\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = generic_phy_exit(&priv->phy);
> > +	if (ret) {
> > +		dev_err(dev, "failed to power off usb phy\n");
> 
> Shouldn't all those error prints be produced by the PHY subsystem ?

Perhaps... but it is not done today in phy u-class (only call ops).

I make the same level of trace than ./drivers/usb/dwc3/core.c
as copy initially the phy support from this driver.

> > +		return ret;
> 
> [...]
> 
> > @@ -1339,6 +1398,8 @@ static int dwc2_usb_remove(struct udevice *dev)
> >  	if (ret)
> >  		return ret;
> >
> > +	dwc2_shutdown_phy(dev);
> 
> This function returns a return value, but it's ignored here ?

Yes, even if the shutdown of the USB PHY failed, the USB dwc2
 driver continues the procedure to release other ressources...

And the driver expects that the USB PHY will be available for next
request/probe (recovery with phy reset for example).

I use the same logic than dwc3 driver in :
source/drivers/usb/dwc3/dwc3-generic.c::dwc3_generic_remove()
drivers/usb/host/xhci-dwc3.c::xhci_dwc3_remove()

> 
> >  	dwc2_uninit_common(priv->regs);
> >
> >  	reset_release_bulk(&priv->resets);
> >
> 
> [...]

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

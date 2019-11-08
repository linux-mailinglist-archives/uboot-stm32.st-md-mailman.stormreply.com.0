Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2FF4D1D
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 14:25:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3316C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 13:25:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C52E8C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 13:25:35 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8DOkc5006777; Fri, 8 Nov 2019 14:25:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NZms1HoaEbmiGK/3minG/+m0c4fxw2m8MXbkB4aTj7c=;
 b=aXX34bW3H5WZtR43b/bNljexJ79ZAipOMzkNOqfqX0c0Hp/kkeuEaBf6StChfGO7Hjlj
 SPjMNjT4a5I8HKdBS4zKefstCyeZZr1/NxqrpzGMgc8N4GISQbir3kfiF7zyB7oc4KO8
 mM5UJKQNw1DiO2wXTDhrGXtCZKeYwvgPPhnbDhD5a51U8h8eQgjc/QCL2JnBDGNFJKrI
 vcgZLshwc1Wqou/GO+iviSc6QZBkhzcJnFDHPborURYiZaX9U4ffFlDcpPvA4+rSHcDP
 MXL+E5xiF5SSDvakpEytYqksv2KKDKKfAxjj4GJnSQTS2TbKp/Oqmo8JYxN6Xx/wmdE8 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w41ve3s26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 14:25:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E430410002A;
 Fri,  8 Nov 2019 14:25:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB8762BB25C;
 Fri,  8 Nov 2019 14:25:28 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 8 Nov
 2019 14:25:28 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 8 Nov 2019 14:25:28 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [RESEND PATCH 1/5] usb: host: dwc2: add phy support
Thread-Index: AQHVgmV2nmRa+G7B8UeLaPkBdNThMKdap14AgCPWHFCAAEbZgIACj07g
Date: Fri, 8 Nov 2019 13:25:28 +0000
Message-ID: <d797f1ca4c334f7fa0b44db1f5e4b744@SFHDAG6NODE3.st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-2-patrick.delaunay@st.com>
 <67fe66ee-4ee9-ceb4-c303-801605764bdb@denx.de>
 <899e7f46951f4a52a9e2a6453363f210@SFHDAG6NODE3.st.com>
 <06128aa3-a114-fb20-73c6-7a16980c8dce@denx.de>
In-Reply-To: <06128aa3-a114-fb20-73c6-7a16980c8dce@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_04:2019-11-08,2019-11-08 signatures=0
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

Hi,

> From: Marek Vasut <marex@denx.de>
> 
> On 11/6/19 6:40 PM, Patrick DELAUNAY wrote:
> > Hi Marek,
> 
> Hi,
> 
> [...]
> 
> >>> +static int dwc2_shutdown_phy(struct udevice *dev) {
> >>> +	struct dwc2_priv *priv = dev_get_priv(dev);
> >>> +	int ret;
> >>> +
> >>> +	if (!generic_phy_valid(&priv->phy))
> >>> +		return 0;
> >>> +
> >>> +	ret = generic_phy_power_off(&priv->phy);
> >>> +	if (ret) {
> >>> +		dev_err(dev, "failed to power off usb phy\n");
> >>> +		return ret;
> >>> +	}
> >>> +
> >>> +	ret = generic_phy_exit(&priv->phy);
> >>> +	if (ret) {
> >>> +		dev_err(dev, "failed to power off usb phy\n");
> >>
> >> Shouldn't all those error prints be produced by the PHY subsystem ?
> >
> > Perhaps... but it is not done today in phy u-class (only call ops).
> >
> > I make the same level of trace than ./drivers/usb/dwc3/core.c as copy
> > initially the phy support from this driver.
> 
> So this starts the duplication. Can you move it to the PHY subsystem instead ?

Yes I can, in v2 I will change dev_err to dev_dbg

And I will sent a other serie to change the generic phy (add printf or dev_err) 
and also remove the dev_err for all the caller to avoid duplicated trace.

This generic error is already done in some U-Boot uclass,
- clock (clk_enable)

But sometime only the caller, the driver,  knows if it is a error or a warning,
and it is not done for others uclass, for example:

- Reset: reset_assert/ reset_deassert reset_assert_bulk/ reset_deassert_bulk
- Regulator: regulator_set_enable

> >>> +		return ret;
> >>
> >> [...]
> >>
> >>> @@ -1339,6 +1398,8 @@ static int dwc2_usb_remove(struct udevice *dev)
> >>>  	if (ret)
> >>>  		return ret;
> >>>
> >>> +	dwc2_shutdown_phy(dev);
> >>
> >> This function returns a return value, but it's ignored here ?
> >
> > Yes, even if the shutdown of the USB PHY failed, the USB dwc2  driver
> > continues the procedure to release other ressources...
> 
> How can you safely release the rest of the resources if the PHY driver didn't shut
> down? I suspect this might lead to some resource corruption, no?

Yes...and that depends of the PHY driver.

What it is better stategy:
- try to continue to release the resources after the first error and the next probe could works / the error is masked
Or
- stopped the release procedure => the next procedure could failed (resource not available)

> > And the driver expects that the USB PHY will be available for next
> > request/probe (recovery with phy reset for example).
> >
> > I use the same logic than dwc3 driver in :
> > source/drivers/usb/dwc3/dwc3-generic.c::dwc3_generic_remove()
> > drivers/usb/host/xhci-dwc3.c::xhci_dwc3_remove()
> 
> dwc3_shutdown_phy() only ever returns 0 though.

Yes, but in dwc3_shutdown_phy, the phy operation can have errors
and the "remove" procedure continue (even if ret is never retruned)

ret = generic_phy_power_off(&usb_phys[i]);
ret |= generic_phy_exit(&usb_phys[i]);
if (ret) {
	pr_err("Can't shutdown USB PHY%d for %s\n", i, dev->name);
}

Anyway I will treat error in v2, it should be more clear in dw2c code.

+	ret= dwc2_shutdown_phy(dev);
+	if (ret) {
+		dev_dbg(dev, "Failed to shutdown USB PHY: %d.\n": ret);
+		return ret;
+	}

> --
> Best regards,
> Marek Vasut

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

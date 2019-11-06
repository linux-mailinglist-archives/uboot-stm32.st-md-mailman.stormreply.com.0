Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B854F1D7D
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 19:27:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A3F5C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 18:27:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4E81C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 18:27:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6IRWlP028661; Wed, 6 Nov 2019 19:27:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=fyL0p4MCsTZBL7RC2kxYfLxhaJPo6WCNyrKTo7tyZug=;
 b=AMx1p4j+OS7dP5hxA7HU1dFTCKk/Z8vqS7Tcm6NQHOOAhvuja7C3M6o2olqYsEHR686J
 NJmB18JYPKfnI9rb5BUKkN+legfKY8usMj45J7FnO22Tf+OuuvpqTo2ICJUgrg7t0qTV
 XDLXyJvgappsfvbRLV8MWu4hZVeZMnAsvTapLYtquMTNHnBupYQdaHB/6kkbzQS1QB4t
 ZKhrvOLtqnLyZC/JY5U/qN/VnXTJsB2ZCg6ghPao92Hifa1NgE9TqzZnq55ndxwoygaF
 EkL0S/WthX2HKvMAIsMMgOD4/7OEZaBLwOMUdxuP5ADhe1/O4CzqfVXYt4iXpVCKDdKZ 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w41vcrejw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 19:27:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ADCD010002A;
 Wed,  6 Nov 2019 19:27:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A5CE2AD359;
 Wed,  6 Nov 2019 19:27:34 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Nov
 2019 19:27:34 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 6 Nov 2019 19:27:33 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [RESEND PATCH 3/5] usb: host: dwc2: force reset assert
Thread-Index: AQHVgmV5BbJGpxxSmEyHBRf487JJQKdaqEKAgCPr9ZA=
Date: Wed, 6 Nov 2019 18:27:33 +0000
Message-ID: <3e13407a0c24443fb5325318de75e357@SFHDAG6NODE3.st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-4-patrick.delaunay@st.com>
 <d4a847ac-b675-6a85-4320-c4f3800c18b1@denx.de>
In-Reply-To: <d4a847ac-b675-6a85-4320-c4f3800c18b1@denx.de>
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
Subject: Re: [Uboot-stm32] [RESEND PATCH 3/5] usb: host: dwc2: force reset
	assert
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
> Sent: mardi 15 octobre 2019 01:30
> 
> On 10/14/19 10:00 AM, Patrick Delaunay wrote:
> > Assert reset before deassert in dwc2_reset; It should be more safe for
> > DWC2.
> 
> Can you be more descriptive about this issue ? I have no idea what this patch does
> or fixes from the description.

Yes

I will explain it in V2 commit message.

The issue only occurs if the DWC2 OTG device switch between gadget mode 
and host mode.

For example: 
some registers initialiaze by the command "ums" (device mode is forced for example),
cause problem for the next command "usb start" and vice versa.

Even the existing  software reset in dwc_otg_core_reset is not enough;
the added hardware reset solve all the issues.
 
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  drivers/usb/host/dwc2.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c index
> > 51023b0c2c..3086411fc4 100644
> > --- a/drivers/usb/host/dwc2.c
> > +++ b/drivers/usb/host/dwc2.c
> > @@ -1149,6 +1149,8 @@ static int dwc2_reset(struct udevice *dev)
> >  			return ret;
> >  	}
> >
> > +	reset_assert_bulk(&priv->resets);
> > +	udelay(2);
> 
> Why is there a 2 uS delay ?

I think: no real reason to have 2 us....

It was jus a reasonable time to be sure that the device reset is correctly
performed, the reset signal is propagated....

but perhaps that no delay is working...
I can test without delay if you prefer...

PS: I use the same value than DWC2 gadget driver:
       Added by my commit c2c74f97afff

static int dwc2_udc_otg_reset_init(struct udevice *dev,
				   struct reset_ctl_bulk *resets)
{
.....
	ret = reset_assert_bulk(resets);

	if (!ret) {
		udelay(2);
		ret = reset_deassert_bulk(resets);
	}
....
}

 
> >  	ret = reset_deassert_bulk(&priv->resets);
> >  	if (ret) {
> >  		reset_release_bulk(&priv->resets);
> >
> 
> [...]

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

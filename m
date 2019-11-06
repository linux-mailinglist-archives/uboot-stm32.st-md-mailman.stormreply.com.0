Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0758F1D18
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 19:03:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A9E6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Nov 2019 18:03:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51DF0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 18:03:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA6I2HAB027587; Wed, 6 Nov 2019 19:03:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DSHJ83FG6xmRkrlzVVM+5TmTDYHVUbAb3QnWSKaZNYk=;
 b=nSiyN27xq2q1nWtWUQ8Ss1aJzibW6vRlhuX+sY/GfqzDi53l4uHakufVadiC9K24wMfh
 X/zD9vf771zLQ/3PAiKZZkZDK1NZeRrCE1FUl4JWiETYb8mt0LFSFZZeI2hjJLxWsjwE
 MKZscJ+Hh7RCy7yGeDB1q/rB9jfPC8EJLhDnsNJPS6jAxbhp1yss62EKodqvKRvMA1Bz
 gC0ZORx4V3q2IPQlzJ2poOnct3MondWtq34XKyWybiYR74srAht4aE/sy43ovoKRmJf8
 BXgM4wGWN8VqXMK6A/Y/BnboS/RlRfpEMOrYZ+OH5OVbovs1Ptr0JyKn0iM195p3JRTi uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w41vgrbuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 19:03:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41177100034;
 Wed,  6 Nov 2019 19:03:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EFEF2AF078;
 Wed,  6 Nov 2019 19:03:24 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Nov
 2019 19:03:23 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 6 Nov 2019 19:03:23 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [RESEND PATCH 2/5] usb: host: dwc2: add support for clk
Thread-Index: AQHVgmV3xQpodwOrUEWXov0EadTepKdap8kAgCPoNZA=
Date: Wed, 6 Nov 2019 18:03:23 +0000
Message-ID: <fd4aa0d388ed49269628a7f8cc9a75d0@SFHDAG6NODE3.st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-3-patrick.delaunay@st.com>
 <77804378-5ea1-4b37-cb54-8fce77351d9b@denx.de>
In-Reply-To: <77804378-5ea1-4b37-cb54-8fce77351d9b@denx.de>
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
Subject: Re: [Uboot-stm32] [RESEND PATCH 2/5] usb: host: dwc2: add support
	for clk
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
> Sent: mardi 15 octobre 2019 01:28
> 
> On 10/14/19 10:00 AM, Patrick Delaunay wrote:
> > Add support for clock with driver model.
> >
> 
> Same question as with the PHY -- is there now a mandatory dependency on the
> DM CLK ?

No I don't think.

Because the clk function are also stubbed in ./include/clk.h
CONFIG_IS_ENABLED(CLK)

But I don't 100% sure as I don't tested it on one platform without DM_CLK...
 
> [...]
> 
> > @@ -1403,6 +1429,7 @@ static int dwc2_usb_remove(struct udevice *dev)
> >  	dwc2_uninit_common(priv->regs);
> >
> >  	reset_release_bulk(&priv->resets);
> > +	clk_release_bulk(&priv->clks);
> 
> Shouldn't there be some clk_...disable() here ?

I don't like make clk_....disable() in U-Boot remove function because the clock
u-class don't managed a counter for each clock user (as it is done in kernel).

We have always a risk to deactivate a clock needed by a several device:
each driver (A&B) enable a common clock with U-Boot clock function, 
but the first clock disable (A) really deactivate the clock even it is still needed
by the other driver (B)

I use the same logical than dwc3 driver: clk_disable_bulk is not called.

static int dwc3_glue_remove(struct udevice *dev)
{
	struct dwc3_glue_data *glue = dev_get_platdata(dev);

	reset_release_bulk(&glue->resets);

	clk_release_bulk(&glue->clks);

	return 0;
}

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

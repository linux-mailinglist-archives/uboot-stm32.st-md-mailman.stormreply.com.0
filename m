Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A0F44FB
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 11:51:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B685BC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 10:51:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91661C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 10:51:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8AmBhx016392; Fri, 8 Nov 2019 11:51:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PmDf70HGF7FeccLyoyJJCLwK+e9KF3G152yAGgOzTl4=;
 b=rlGeCVEOeRb6j0ux52sA+5/rA+421kYtjklr65QGtWDODj/KOaEJXW8UKoXI98X3SGLe
 RlUMqtqUs6NaR3dqZMY/jGYII+ObUg+WnFCrO54JhhPqFEC4bG+2Nx6xdolJ02Jq1KRs
 4qLAPrBnxEjMY4piz9np2/A5iTXi0lwFToXz3epkrKzg8gN7AfUqUZUvdduF6bsc0uE2
 aVBmac5S45fFCbnZoRLVfLlnM1boWGzGLXemy13jDW/SDPk6RPLzXz3p1O2p1kEYFrL/
 flNJIoyy1m5kX5OG2/g/gZVgnMoYd9Oe5ahOT4KUYaAHUM0N/JT1FGPMhaHTV3VDrR/J jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w41vd30yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 11:51:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3F03100034;
 Fri,  8 Nov 2019 11:51:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 986B62B100C;
 Fri,  8 Nov 2019 11:51:02 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 8 Nov
 2019 11:51:01 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 8 Nov 2019 11:51:02 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [RESEND PATCH 3/5] usb: host: dwc2: force reset assert
Thread-Index: AQHVgmV5BbJGpxxSmEyHBRf487JJQKdaqEKAgCPr9ZCAADFpgIACWg7ggAAAIwCAAB+M0A==
Date: Fri, 8 Nov 2019 10:51:02 +0000
Message-ID: <28ad7b0031e64ab6a1316ae887128783@SFHDAG6NODE3.st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-4-patrick.delaunay@st.com>
 <d4a847ac-b675-6a85-4320-c4f3800c18b1@denx.de>
 <3e13407a0c24443fb5325318de75e357@SFHDAG6NODE3.st.com>
 <5e90369b-c273-028e-ee27-bfd7249ae64e@denx.de>
 <da2174ce14a04120bc6fa5a425f0d90e@SFHDAG6NODE3.st.com>
 <39e7831d-7981-ded6-5b71-0b93ecd7f449@denx.de>
In-Reply-To: <39e7831d-7981-ded6-5b71-0b93ecd7f449@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_03:2019-11-07,2019-11-08 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Amelie DELAUNAY <amelie.delaunay@st.com>, Michal Suchanek <msuchanek@suse.de>,
 Sven Schwermer <sven@svenschwermer.de>
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

> 
> On 11/8/19 10:53 AM, Patrick DELAUNAY wrote:
> > Hi,
> 
> Hi,
> 
> [...]
> 
> >>>>> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
> >>>>> index
> >>>>> 51023b0c2c..3086411fc4 100644
> >>>>> --- a/drivers/usb/host/dwc2.c
> >>>>> +++ b/drivers/usb/host/dwc2.c
> >>>>> @@ -1149,6 +1149,8 @@ static int dwc2_reset(struct udevice *dev)
> >>>>>  			return ret;
> >>>>>  	}
> >>>>>
> >>>>> +	reset_assert_bulk(&priv->resets);
> >>>>> +	udelay(2);
> >>>>
> >>>> Why is there a 2 uS delay ?
> >>>
> >>> I think: no real reason to have 2 us....
> >>>
> >>> It was jus a reasonable time to be sure that the device reset is
> >>> correctly performed, the reset signal is propagated....
> >>>
> >>> but perhaps that no delay is working...
> >>> I can test without delay if you prefer...
> >>>
> >>> PS: I use the same value than DWC2 gadget driver:
> >>>        Added by my commit c2c74f97afff
> >>
> >> Isn't there a way to poll the IP to determine whether the reset completed ?
> >
> > It is HW IP reset, the complete state is not available for stm32mp1 reset
> controller (RCC).
> > And the need reset duration of depends on each IP (can't be handle in reset u-
> class).
> 
> If it's a SoC specific delay, it should be in the reset driver.
> 
> > I check with DWC2 OTG IP expert, and we found in
> > DWC_otg_databook_3.30a.pdf
> >
> > t_rst: DWC_otg PHY clock domain reset and AHB hclk domain reset over lap
> time
> >         (a minimum of 12 cycles of the slowest clock is recommended.)
> >
> > In our board, we have 209MHz for AHB frequency... USB phy clock is
> > 48MHz So freq12 cycles is MIN(57ns,  250ns) < 1us.
> >
> > The 2us value seens a over protection.
> >
> > I will reduce it to 1us in V2 and I will add comments for.
> 
> Well, why don't you put this into the reset driver ? Seems to be a more fitting place
> for this. I don't think every single SoC has the same clock settings.

Ok, I will remove the delay in driver.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

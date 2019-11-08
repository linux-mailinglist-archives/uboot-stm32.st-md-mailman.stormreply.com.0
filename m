Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F19F43EE
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 10:53:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C444C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 09:53:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D06DBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 09:53:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA89qWgc030854; Fri, 8 Nov 2019 10:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JN9aBXqU3dyNBzpaPis3XtCRADo+Oz5Zp3oBzg5EWW8=;
 b=cPDr8KwvbEYr6v8k4Xmnd5rwxg4BTLfytl+BtM0KUjyaesORDC98tv/75zp+8eDIlVnk
 3Go9oeI6yggdKnc5YMYB9ZtDgnEwZWmQSDyCEgRdxWHpu9su9jk1O2+D0zqnh54Zn3Mi
 61005BjTN0PtNkseVUNq5MJFApv87xPaP8DT9bOVUTedBTTwko7rYZsBmsAcqd56bIVP
 ep86n/0ztfCehiY/hA+5GXjDFWS/89SJGX1IDP2hcTTLJKVApOhoV4gNJDFRMmFXzMKh
 swS5UoPUs1Ll6gXsV0tBcStw1yduy18uZWFz7ujUTiRPQqnHXv+8xWpWhBZszDvQqxf0 Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w41vh2ssd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 10:53:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0513100034;
 Fri,  8 Nov 2019 10:53:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C92A92AD341;
 Fri,  8 Nov 2019 10:53:46 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 8 Nov
 2019 10:53:46 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 8 Nov 2019 10:53:46 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [RESEND PATCH 3/5] usb: host: dwc2: force reset assert
Thread-Index: AQHVgmV5BbJGpxxSmEyHBRf487JJQKdaqEKAgCPr9ZCAADFpgIACWg7g
Date: Fri, 8 Nov 2019 09:53:45 +0000
Message-ID: <da2174ce14a04120bc6fa5a425f0d90e@SFHDAG6NODE3.st.com>
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-4-patrick.delaunay@st.com>
 <d4a847ac-b675-6a85-4320-c4f3800c18b1@denx.de>
 <3e13407a0c24443fb5325318de75e357@SFHDAG6NODE3.st.com>
 <5e90369b-c273-028e-ee27-bfd7249ae64e@denx.de>
In-Reply-To: <5e90369b-c273-028e-ee27-bfd7249ae64e@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_02:2019-11-07,2019-11-08 signatures=0
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

> From: Marek Vasut <marex@denx.de>
> Sent: mercredi 6 novembre 2019 23:00
> 
> On 11/6/19 7:27 PM, Patrick DELAUNAY wrote:
> > Hi,
> 
> Hi,
> 
> [...]
> 
> >>> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c index
> >>> 51023b0c2c..3086411fc4 100644
> >>> --- a/drivers/usb/host/dwc2.c
> >>> +++ b/drivers/usb/host/dwc2.c
> >>> @@ -1149,6 +1149,8 @@ static int dwc2_reset(struct udevice *dev)
> >>>  			return ret;
> >>>  	}
> >>>
> >>> +	reset_assert_bulk(&priv->resets);
> >>> +	udelay(2);
> >>
> >> Why is there a 2 uS delay ?
> >
> > I think: no real reason to have 2 us....
> >
> > It was jus a reasonable time to be sure that the device reset is
> > correctly performed, the reset signal is propagated....
> >
> > but perhaps that no delay is working...
> > I can test without delay if you prefer...
> >
> > PS: I use the same value than DWC2 gadget driver:
> >        Added by my commit c2c74f97afff
> 
> Isn't there a way to poll the IP to determine whether the reset completed ?

It is HW IP reset, the complete state is not available for stm32mp1 reset controller (RCC).
And the need reset duration of depends on each IP (can't be handle in reset u-class).

I check with DWC2 OTG IP expert, and we found in DWC_otg_databook_3.30a.pdf

t_rst: DWC_otg PHY clock domain reset and AHB hclk domain reset over lap time
        (a minimum of 12 cycles of the slowest clock is recommended.)

In our board, we have 209MHz for AHB frequency... USB phy clock is 48MHz
So freq12 cycles is MIN(57ns,  250ns) < 1us.

The 2us value seens a over protection.

I will reduce it to 1us in V2 and I will add comments for.

> [...]
> 
> --
> Best regards,
> Marek Vasut

Regards
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

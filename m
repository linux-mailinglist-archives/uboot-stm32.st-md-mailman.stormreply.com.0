Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91528F72E
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 18:52:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC94AC3FADE;
	Thu, 15 Oct 2020 16:52:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5E04C32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 16:52:50 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FGlMMT006670; Thu, 15 Oct 2020 18:52:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GCeHBt3hkvxenzA4Q8qO8DLEkgCyfmkBNpeh7zIy87Y=;
 b=BX+Rtf/gTHg9HqKFxuSEUoT1tSUrX4MYXAagBqkcn4HKmp1EOmiq86gA4DFgF7Qyle/J
 MPOgZTHJ0GW9wtdxmE2kVyRT+vdjVsz4l0v4l9+wZqQRqIg2W36r1lFLVCQ4P9ujeXlz
 NnzPgjpleZD6w5K9XQGI+H1IU78cnfQLhmBDNU1mcV6kxvVXCi4NxlVbYQkCRDDuuQY2
 f/ZRt5pUa8G3a/Mb5kV99268AcLC+fMZ7Fqrne8WPdd6uld5gCIVQbl1GUZHdSMWml0g
 v+yWPRKCpeVIKY2gT/sFWsA6TKQvPowxPecaflJs9NfgUqHfgAeIX8RNSr+53w6HSB22 dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 343587ebm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 18:52:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 922FC10002A;
 Thu, 15 Oct 2020 18:52:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79B2E2E4B7C;
 Thu, 15 Oct 2020 18:52:36 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 18:52:36 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Thu, 15 Oct 2020 18:52:36 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] usb: dwc2: add "u-boot,force-vbus-detection" for stm32
Thread-Index: AQHWovGkvAGN10AlR0WNb7UEREgczqmYgO8AgABRfYA=
Date: Thu, 15 Oct 2020 16:52:36 +0000
Message-ID: <7fd5050f277643a78bb185b4c272b6c4@SFHDAG2NODE3.st.com>
References: <20201015144856.1.I77269d852e0f410c31f9d1f869815c4328510c12@changeid>
 <9ea18aa8-2c87-85cf-fba3-d753382f32e7@denx.de>
In-Reply-To: <9ea18aa8-2c87-85cf-fba3-d753382f32e7@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_10:2020-10-14,
 2020-10-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Amelie DELAUNAY <amelie.delaunay@st.com>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: add "u-boot,
	force-vbus-detection" for stm32
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
> Sent: jeudi 15 octobre 2020 15:08
> 
> On 10/15/20 2:49 PM, Patrick Delaunay wrote:
> > On some board, the ID pin is not connected so the B session must be
> > overridden with "u-boot,force_b_session_valid" but the VBus sensing
> > must continue to be handle.
> >
> > To managed it, this patch adds a new DT field
> > "u-boot,force-vbus-detection" to use with "u-boot,force_b_session_valid"
> 
> How is this solved in Linux ?

It is managed by Linux DWC2 driver: it is a real OTG driver, with dual mode
support and by usb framework

Throught the properties
&usbotg_hs {
	usb-role-switch;
};

a glue treat the session and the sensing management
see linux/drivers/usb/dwc2/drd.c in linux-next

PS: activate_stm_id_vb_detection is also used in driver = hsotg->params. 

As ID pin / vbus is completly managed by the USB TYPE driver C
(STUSB1600 for STMicroelectronics board) and DWC2 driver with dual role
stack (host/gadget).

I don't found a better solution than device tree property for this task in U-Boot as DWC2
driver don't support dual role and U-Boot don't have framework for USB type C controller.

> 
> btw can you do something about that huge change in indent ? Is it necessary ?

I move all this code under activate_stm_id_vb_detection (linked to compatible "st,stm32mp1-hsotg")
to avoid impact on other platform as this "sensing" properties are only support for STM32MP15X
(it is linked to USB block detection integrated in SOC)

And after I need to check the 
1/ The usb33d-supply is required of vbus or IDPIN sensing
2/ manage Vbus sensing or override (according dt)
3/ manage IDPIN or override (according dt)

I add a new property to be backward compatible (even it the combinaison is less clear)
I protect regulator function call to avoid compilation issue for other platform.

PS: after reading the refmanual, I also split VALOEN and VALOVAL bit update as it is required.

So yes I think it is needed but I can split the patch to simplify the review.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

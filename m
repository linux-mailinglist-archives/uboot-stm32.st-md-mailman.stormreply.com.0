Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ADF2909BC
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Oct 2020 18:32:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81BAEC3FAD5;
	Fri, 16 Oct 2020 16:32:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 880F9C32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Oct 2020 16:32:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09GGQoQd022903; Fri, 16 Oct 2020 18:32:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SJzLqrNv5KqNGCOxoaekYLH6jpBiNYggb3/LkBwxxaw=;
 b=nhDmDMoWI10g12Ic9tTxUI7IMeBggRbeD//ciZ31MdhDfpJ9/Us1ZBvvl1AUm5OIVAIE
 7uBlCoNU0nXT81jUqMRRckiAm0Yo208mGrQ6fphZKONzi7i9Kh5WI7mHgAfmIm2oy5vV
 +6FY7xBfLiCDV+J43CfaCVKpwZEuhy2xnV2S+W6MJKlFgEwA2ZVybol/uuJJQx/twHn+
 IZP+LsfHkx9B5DTVp3q/1/P81Cfj/diz+smCfGxJPI1xf5fQ7XZtOhmCp5xwm9/VYYFf
 LtJkMqy/1ia20kEt4Yxf5rcOHqmVRsX0UloNlPZETzyRQH2QPx4TL14uqj9j8F6vCTxg wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wxm0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2020 18:32:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3C4F10002A;
 Fri, 16 Oct 2020 18:32:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCCB52073DB;
 Fri, 16 Oct 2020 18:32:36 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 18:32:36 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Fri, 16 Oct 2020 18:32:36 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] usb: dwc2: add "u-boot,force-vbus-detection" for stm32
Thread-Index: AQHWovGkvAGN10AlR0WNb7UEREgczqmYgO8AgABRfYD///pCgIABoK6w
Date: Fri, 16 Oct 2020 16:32:36 +0000
Message-ID: <b4e675d5caff47d1b207b67e6ca03e1f@SFHDAG2NODE3.st.com>
References: <20201015144856.1.I77269d852e0f410c31f9d1f869815c4328510c12@changeid>
 <9ea18aa8-2c87-85cf-fba3-d753382f32e7@denx.de>
 <7fd5050f277643a78bb185b4c272b6c4@SFHDAG2NODE3.st.com>
 <eeaec9e8-764f-8869-33c3-0b3d4d74348e@denx.de>
In-Reply-To: <eeaec9e8-764f-8869-33c3-0b3d4d74348e@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-16_08:2020-10-16,
 2020-10-16 signatures=0
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
> Sent: jeudi 15 octobre 2020 19:39
> 
> On 10/15/20 6:52 PM, Patrick DELAUNAY wrote:
> 
> Hi,
> 
> [...]
> 
> >> On 10/15/20 2:49 PM, Patrick Delaunay wrote:
> >>> On some board, the ID pin is not connected so the B session must be
> >>> overridden with "u-boot,force_b_session_valid" but the VBus sensing
> >>> must continue to be handle.
> >>>
> >>> To managed it, this patch adds a new DT field
> >>> "u-boot,force-vbus-detection" to use with "u-boot,force_b_session_valid"
> >>
> >> How is this solved in Linux ?
> >
> > It is managed by Linux DWC2 driver: it is a real OTG driver, with dual
> > mode support and by usb framework
> >
> > Throught the properties
> > &usbotg_hs {
> > 	usb-role-switch;
> > };
> >
> > a glue treat the session and the sensing management see
> > linux/drivers/usb/dwc2/drd.c in linux-next
> >
> > PS: activate_stm_id_vb_detection is also used in driver = hsotg->params.
> >
> > As ID pin / vbus is completly managed by the USB TYPE driver C
> > (STUSB1600 for STMicroelectronics board) and DWC2 driver with dual
> > role stack (host/gadget).
> >
> > I don't found a better solution than device tree property for this
> > task in U-Boot as DWC2 driver don't support dual role and U-Boot don't have
> framework for USB type C controller.
> >
> >>
> >> btw can you do something about that huge change in indent ? Is it necessary ?
> >
> > I move all this code under activate_stm_id_vb_detection (linked to
> > compatible "st,stm32mp1-hsotg") to avoid impact on other platform as
> > this "sensing" properties are only support for STM32MP15X (it is
> > linked to USB block detection integrated in SOC)
> >
> > And after I need to check the
> > 1/ The usb33d-supply is required of vbus or IDPIN sensing 2/ manage
> > Vbus sensing or override (according dt) 3/ manage IDPIN or override
> > (according dt)
> >
> > I add a new property to be backward compatible (even it the
> > combinaison is less clear) I protect regulator function call to avoid compilation
> issue for other platform.
> >
> > PS: after reading the refmanual, I also split VALOEN and VALOVAL bit update
> as it is required.
> >
> > So yes I think it is needed but I can split the patch to simplify the review.
> 
> I presume you don't feel like implementing proper OTG support, right ?

Yes, I am afraid of this task.

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

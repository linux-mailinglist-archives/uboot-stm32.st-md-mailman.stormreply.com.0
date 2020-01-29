Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E22514CEB0
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Jan 2020 17:51:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 182CDC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Jan 2020 16:51:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CD54C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 16:51:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TGl90E002182; Wed, 29 Jan 2020 17:51:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=e8vjSMWXg5QjgzceS3qF8SfT0OfXNiWE4Z+VZiDbC5Q=;
 b=BFODymBBSU/QwKeDilkOEb+CdVleqjxoP+SDDcxe4jhrSM3opJxNNKpxjvoOGG+EMRkd
 TfSaEuGCcXynRVbAwuBY5wcWpZTqvDQxPnMLCG6K7fa3rHqnzdvG0ca4JvjCprLYPCQb
 nT3pxqHIEio9xLgFmc2EhwzUHGsouZ9BoMGI7kaSc1lcJGD77+qdhK970k/96MN9heVr
 9tAfujO2Ci4+K8IZxcMYyUhsNNXetDcb9WstPqJmo13QgsaOhbZrhDBkxgSsbVCIiAzp
 8CW0FIwfrIblK+sx+WXonJeuXaKn10e5vn3t1+NEjotwK+MGYKrN5c6vlt7byYp5nuHs TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcay46r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 17:51:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B39B5100038;
 Wed, 29 Jan 2020 17:51:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43B682BF9DB;
 Wed, 29 Jan 2020 17:51:51 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 17:51:50 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 29 Jan 2020 17:51:50 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to PLL4_R
Thread-Index: AQHV1brt0TuVWBqyKk67jzeWED/NPqf/7R6AgAHj0lA=
Date: Wed, 29 Jan 2020 16:51:50 +0000
Message-ID: <adb487b28fac45b6b147464b1bb53641@SFHDAG6NODE3.st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
 <231eb0d9-9bf3-ac62-0177-f7ee6dfb644d@denx.de>
In-Reply-To: <231eb0d9-9bf3-ac62-0177-f7ee6dfb644d@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_04:2020-01-28,
 2020-01-29 signatures=0
Cc: Antonio BORNEO <antonio.borneo@st.com>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gerald BAEZA <gerald.baeza@st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to
	PLL4_R
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
> Sent: mardi 28 janvier 2020 13:16
> 
> On 1/28/20 10:11 AM, Patrick Delaunay wrote:
> > From: Antonio Borneo <antonio.borneo@st.com>
> >
> > LTDC modifies the clock frequency to adapt it to the display. Such
> > frequency change is not detected by the FDCAN driver that instead
> > cache the value at probe and pretend to use it later.
> >
> > Keep the LTDC alone on PLL4_Q by moving the FDCAN to PLL4_R.
> 
> Now this looks like a grisly workaround. Can you fix the LTDC driver to do
> something sane on boards which didn't update bootloader yet ?

In fact it more a issue in the initial clock-tree used when I upstream the ST board the first time... based on our delivery v1.0.0

It is already corrected in downstream on v1.1.0:
+ For U-Boot = https://github.com/STMicroelectronics/u-boot/commit/d62f14dece32e41c2854b9ff44aca7b8384aa8a0
+ For TF-A = https://github.com/STMicroelectronics/arm-trusted-firmware/commit/9a24ceda6c3ba060d9acf2b26d069fedde9f0807

The LTDC/DSI need to set the pixel clock according the panel configuration and settings: it is normal and needed.

But If the pixel clock is shared with FDCAN, which expects that its input clock is fixed, an issue occur when the pixel clock change.

We could add protection in FDCAN driver (don't assume fixed clock in probe for example) 
but anyway that don't protect for any issue (pending FDCAN transfer when pixel clock change).

The main issue is that we try to share a clock source between 2 IP that are not compatible:
1/ FDCAN => clock source configurated by CLK_FDCAN_PLL4Q
2/ pixel clocl for LTDC and DSI = LTDC_PX or DSI_PX  => _PLL4_Q  (hardcoded in RCC)

The clock source for pixel clock PLL4_Q need only managed only by LDTC as it can modify the source clock.

It is why we decide to change the reference clock tree used on ST Microelectronic boards.
And unfortunately that impacts the first stage bootloader.

For information in our solution the clock tree is fixed and configurated at boot by first stage bootloader 
(TF-A normally for trusted boot chain / SPL for basic boot chain) as this configuration is  done in secured
registers with information provided by device-tree.

See https://wiki.st.com/stm32mpu/wiki/STM32MP15_clock_tree for details

Regards

Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

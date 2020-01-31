Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D5114E97D
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 09:15:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3023CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 08:15:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66EBDC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 08:15:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00V88SB8022135; Fri, 31 Jan 2020 09:15:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=AbX/qdMGOhIzbs6KYjgrqAkFRWr1ulVJGBujZUaLBv0=;
 b=u6iz1xjJ7sdHE3MlaIIaIXCzwz3R7o2dztQ00aRHE4NRk1E/UH9ojJzugtnnZ6YTukdD
 lUbGdp4YEaNHlXaHBhuV2gD1xBL+wYei8KIGqejHQVs2Ly7PT+UcGiV4TDtfgBzuYXff
 HmcsBnM1PkdMF1aCMX5WpIzbEBk5SKIErdUxFVYRK/nnF8k/2bsrJsJEJDYdUrnyAUMy
 RweT0+hVAGlck+jQngyalzWWojNN3W6PgsIHhF4ePmwss4LZu8asgMVwykV3swGOF5Kv
 9Qu2rn8036dSw84N5eXQjx8aVLb52swnTYpQ8QpBMMq2+nzZXz09pQCd+xF3O8ohYyV7 xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrc13mh2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2020 09:15:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA63D100034;
 Fri, 31 Jan 2020 09:15:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B608921ED1B;
 Fri, 31 Jan 2020 09:15:49 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jan
 2020 09:15:49 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 31 Jan 2020 09:15:49 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 4/9] ARM: dts: stm32mp1: move FDCAN to PLL4_R
Thread-Index: AQHV1brt0TuVWBqyKk67jzeWED/NPqf/7R6AgAHj0lCAAJtUgIAB/ktw
Date: Fri, 31 Jan 2020 08:15:49 +0000
Message-ID: <357d83958e34432bb052af1509bc2487@SFHDAG6NODE3.st.com>
References: <20200128091106.28552-1-patrick.delaunay@st.com>
 <20200128101041.4.Ide537d091d8ee33f89ee50edad59ea237e517e42@changeid>
 <231eb0d9-9bf3-ac62-0177-f7ee6dfb644d@denx.de>
 <adb487b28fac45b6b147464b1bb53641@SFHDAG6NODE3.st.com>
 <a7dcac3d-beaa-b641-e4f0-ab75622e7edd@denx.de>
In-Reply-To: <a7dcac3d-beaa-b641-e4f0-ab75622e7edd@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_02:2020-01-30,
 2020-01-31 signatures=0
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
> Sent: jeudi 30 janvier 2020 03:23
> 
> On 1/29/20 5:51 PM, Patrick DELAUNAY wrote:
> > Hi Marek,
> 
> Hi,
> 
> >> From: Marek Vasut <marex@denx.de>
> >> Sent: mardi 28 janvier 2020 13:16
> >>
> >> On 1/28/20 10:11 AM, Patrick Delaunay wrote:
> >>> From: Antonio Borneo <antonio.borneo@st.com>
> >>>
> >>> LTDC modifies the clock frequency to adapt it to the display. Such
> >>> frequency change is not detected by the FDCAN driver that instead
> >>> cache the value at probe and pretend to use it later.
> >>>
> >>> Keep the LTDC alone on PLL4_Q by moving the FDCAN to PLL4_R.
> >>
> >> Now this looks like a grisly workaround. Can you fix the LTDC driver
> >> to do something sane on boards which didn't update bootloader yet ?
> >
> > In fact it more a issue in the initial clock-tree used when I upstream
> > the ST board the first time... based on our delivery v1.0.0
> >
> > It is already corrected in downstream on v1.1.0:
> > + For U-Boot =
> > + https://github.com/STMicroelectronics/u-boot/commit/d62f14dece32e41c
> > + 2854b9ff44aca7b8384aa8a0 For TF-A =
> > + https://github.com/STMicroelectronics/arm-trusted-firmware/commit/9a
> > + 24ceda6c3ba060d9acf2b26d069fedde9f0807
> >
> > The LTDC/DSI need to set the pixel clock according the panel configuration and
> settings: it is normal and needed.
> >
> > But If the pixel clock is shared with FDCAN, which expects that its input clock is
> fixed, an issue occur when the pixel clock change.
> 
> I understand the problem you are trying to solve.
> 
> What I think you are missing is that not everyone will update ATF/U-Boot/Linux in
> lockstep. That is the problem you need to deal with here.

I understood the possible issue and I hope that I will be not the case
(at least for the ST Microelectronics boards).

We are aware of the possible issue to fixe these clocks in first stage bootloader but after a long
debate, we don't found a better solution, with the constraints:
- M4 firmware require clock initialization before start and it can be loaded by U-Boot
- clock tree is generated by CubeMX tools which generate device tree (for bootloaders and kernel)
- "assigned-clock" management in Linux kernel could lead us to a race condition for shared clock

We spent a long time to found a clock tree which respect all the constraints of the SOC
before to our first release v1.0 and before I upstream the stm32mp1 support in U-Boot.

Then I wait a year before to upstream the patches on clock tree initialization (and the second
release v1.2) to avoid too many iteration.
 And this patch on FDCAN is the only issue found on the initial clock tree.

Today I think (hope?) it will be the last patch on this part.

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

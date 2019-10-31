Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC21EB350
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2019 15:59:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D09D3C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2019 14:59:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91E16C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2019 14:59:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9VEvjaT000462; Thu, 31 Oct 2019 15:59:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=tUCsNrtkA1NxOMgFfdy+oi01LLJC5R8PwBNniHEH2AM=;
 b=Sx/0q133IL+aDyG/qOkSV50bS09V8lJllHe1QjF4TTkS25vFU8d30dJS5GbjCSEthRUM
 HaSJUSB7LrJLIQ+0S91G3RuSj/3s3bMVlZsnHTZDUySIblaLg17RjiclqvJX446/sqm8
 5Y0+8qIbyKNLfLuYhHSKl9XLq0Nt/EgIbEDQs9yDNWj48LwUzX0TrSlqItUYpcp86lJm
 Btz931lAIyMNtKzzfAdzb1VN+G0BYcIUv1IQMOjcnuLiBekICCIVkdGWbt8vZA6X5t1x
 6SbqeR0YVNU1gRl1nqDMC8mQ9pFzW59vA51m65QeSTkzAfGCREetA7s9kk5osMlJ80t6 yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vxwf4adg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 15:59:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5807210002A;
 Thu, 31 Oct 2019 15:59:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A5002C64A8;
 Thu, 31 Oct 2019 15:59:38 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 31 Oct
 2019 15:59:37 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 31 Oct 2019 15:59:37 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH 06/13] gpio: add support for new flags on gpio
 configuration
Thread-Index: AQHViagScBjw31GDekOPZscbjOGw16dyZDSAgAJ8cHA=
Date: Thu, 31 Oct 2019 14:59:37 +0000
Message-ID: <26ab96b4b5654cdcbb1bc36858b88e9a@SFHDAG6NODE3.st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-7-patrick.delaunay@st.com>
 <CAPnjgZ2rSG47Etzh-RZo3jQPakdn0NGQ5Xey5B3CL5c2fyKkmg@mail.gmail.com>
In-Reply-To: <CAPnjgZ2rSG47Etzh-RZo3jQPakdn0NGQ5Xey5B3CL5c2fyKkmg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-31_06:2019-10-30,2019-10-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 06/13] gpio: add support for new flags on
 gpio configuration
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

Hi Simon,

> From: Simon Glass <sjg@chromium.org>
> Sent: mercredi 30 octobre 2019 02:49
> 
> Hi Patrick,
> 
> On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com>
> wrote:
> >
> > This commit manages the flags that can be used in GPIO specifiers to
> > indicate if a pull-up resistor or pull-down resistor should be enabled
> > for output GPIO and the Open Drain/Open Source configuration for input
> > GPIO.
> >
> > It is managed in driver with a new ops in gpio uclass set_config.
> >
> > These flags are already support in Linux kernel in gpiolib.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  drivers/gpio/gpio-uclass.c | 62
> > +++++++++++++++++++++++++++++++++++++-
> >  include/asm-generic/gpio.h | 56 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 117 insertions(+), 1 deletion(-)
> >
> 
> To me this seems like a pretty annoying interface. The uclass has to call the driver
> multiple times with each enum and the driver may end up reprogramming the pins
> multiple times to get it right.
> 
> Normally we want to program things correctly once, before enabling the function.
> 
> On the other handle I think what you have is better than adding new methods like
> set_open_drain().
> 
> But overall I think it would be better to define a new struct like gpio_config that
> holds some flags and perhaps a few other things. Then the uclass can set up that
> struct and call the driver once with it, to set up the pin. It could include input/output
> too, so that if
> set_config() is defined, the uclass uses that instead of direction_output(), etc.
> 
> What do you think?

I understand the issue.... 
You think something like the serial ops setconfig/getconfig.

So the API can evaluate without add new ops for each new parameter... 
It is clearly better.

I will think about and try to propose something without break nothing.

> Also we should update the sandbox driver to include tests for new methods. It
> looks like you have done pinctrl but not this?

I think test are done in 
[PATCH 12/13] test: dm: update test for pins configuration in gpio
- dm_test_gpio_pin_config

Do think about other tests ?

> Regards,
> Simon

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 784272883EA
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Oct 2020 09:50:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EEC8C32EA7;
	Fri,  9 Oct 2020 07:50:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12886C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 07:50:36 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0997igxP015483; Fri, 9 Oct 2020 09:46:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Rj9mHrMH3G78iOtvwOQcjoYOqncWbxW+TBWiTeicGTg=;
 b=OARfkLvOePyExxCk8WC/UJCR44+KRNUl6omOv6vrpMgdUk1AS6YiM4fn/g2BlpUeQFWU
 gI01l80GXYaRCty2rHBYTjZtUUcXLnwBnXmwpEE/kVzh9pnymkilCWYg3I/StzOWXfRJ
 Dd7BsHOVN5eifnSejPzwkclcYE/ezgWd8cfxFhE6H+khmxf7iN6WKSGv+TcuCJmJ6MHE
 fDXgbAcNxhtsSRKDC6tWE3jqSLv+jBaQETtb2fjm8iu+fcB5dd+XqFRVYCS5rNOfqCqD
 ti9E33G3pYYpAqEc7bzmiu3FcdE3ovJp6aZwJn3pgiNfDVvtmYhPVqUAPuZ5IXv2ipEJ ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3429j62v09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Oct 2020 09:46:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B11F7100038;
 Fri,  9 Oct 2020 09:46:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8350121E686;
 Fri,  9 Oct 2020 09:46:22 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 9 Oct
 2020 09:46:21 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Fri, 9 Oct 2020 09:46:21 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [PATCH] configs: stm32mp: force empty PREBOOT
Thread-Index: AQHWnIFNeSAe4KJr6EKz/HfVSdcVLKmNoJoAgAFAgJA=
Date: Fri, 9 Oct 2020 07:46:21 +0000
Message-ID: <19333411c29f4eb4a58a1b93688a6939@SFHDAG2NODE3.st.com>
References: <20201007081020.30635-1-patrick.delaunay@st.com>
 <20201008141610.GB14816@bill-the-cat>
In-Reply-To: <20201008141610.GB14816@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-09_02:2020-10-09,
 2020-10-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Andre Przywara <andre.przywara@arm.com>, Lukasz Majewski <lukma@denx.de>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Jonas Smedegaard <dr@jones.dk>,
 Peter Robinson <pbrobinson@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp: force empty PREBOOT
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

Hi Tom,

> From: Tom Rini <trini@konsulko.com>
> Sent: jeudi 8 octobre 2020 16:16
> 
> On Wed, Oct 07, 2020 at 10:10:20AM +0200, Patrick Delaunay wrote:
> 
> > This patch remove the default preboot command 'usb start' for
> > STMicroelectronics board. These command is added by the commit
> > 324d77998ed6 ("Define default CONFIG_PREBOOT with right config
> > option")' and commit 44758771eefb ("arm: move CONFIG_PREBOOT="usb
> start"
> > to KConfig").
> >
> > The USB storage boot (not activated in stm32mp1.h) is correctly
> > managed by distro boot command 'usb_boot' (defined in
> > include/config_distro_bootcmd.h, it include 'usb start') and USB
> > keyboard is not supported in stm32mp15 defconfig.
> >
> > So this patch avoids unnecessary USB initialization which slows down
> > the start-up:
> >   starting USB...
> >   Bus usbh-ehci@5800d000: USB EHCI 1.00
> >   scanning bus usbh-ehci@5800d000 for devices... 3 USB Device(s) found
> >          scanning usb for storage devices... 1 Storage Device(s) found
> >
> > Cc: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Jonas Smedegaard <dr@jones.dk>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
> >  configs/stm32mp15_basic_defconfig   | 1 +
> >  configs/stm32mp15_trusted_defconfig | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/configs/stm32mp15_basic_defconfig
> > b/configs/stm32mp15_basic_defconfig
> > index a8c4112dbe..f937a0278d 100644
> > --- a/configs/stm32mp15_basic_defconfig
> > +++ b/configs/stm32mp15_basic_defconfig
> > @@ -19,6 +19,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-
> ev1"
> >  CONFIG_DISTRO_DEFAULTS=y
> >  CONFIG_FIT=y
> >  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> > +CONFIG_PREBOOT=""
> >  CONFIG_BOARD_EARLY_INIT_F=y
> >  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
> >  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
> > diff --git a/configs/stm32mp15_trusted_defconfig
> > b/configs/stm32mp15_trusted_defconfig
> > index 0792884a9d..b0be064cc3 100644
> > --- a/configs/stm32mp15_trusted_defconfig
> > +++ b/configs/stm32mp15_trusted_defconfig
> > @@ -12,6 +12,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-
> ev1"
> >  CONFIG_DISTRO_DEFAULTS=y
> >  CONFIG_FIT=y
> >  CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
> > +CONFIG_PREBOOT=""
> >  CONFIG_SYS_PROMPT="STM32MP> "
> >  CONFIG_CMD_ADTIMG=y
> >  # CONFIG_CMD_ELF is not set
> 
> In this case you should disable CONFIG_USE_PREBOOT.

I activate CONFIG_USE_PREBOOT to handle the "preboot" variable in
common/main.c::main_loop()

	if (IS_ENABLED(CONFIG_USE_PREBOOT))
		run_preboot_environment_command();

But I expect that the "preboot" varibale in empty by default,
as it is the case until now.

In my case the preboot variable is dynamically build in 
arch/arm/mach-stm32mp/cpu.c::setup_boot_mode()

it is why I activate the USE_PREBOOT by default:
  with imply in mach-stm32mp Kconfig.

I use this feature to handle the 'forced' boot request,
and I preferred don't override the bootcmd
(I handle the fastboot 'continue' command without any effort:
  the bootcmd is executed after preboot=fastboot)

And it is managed by linux with reboot mode driver:

tamp: tamp@5c00a000 {
	compatible = "simple-bus", "syscon", "simple-mfd";
	reg = <0x5c00a000 0x400>;

	reboot-mode {
		compatible = "syscon-reboot-mode";
		offset = <0x150>; /* reg20 */
		mask = <0xff>;
		mode-normal = <0>;
		mode-fastboot = <0x1>;
		mode-recovery = <0x2>;
		mode-stm32cubeprogrammer = <0x3>;
		mode-ums_mmc0 = <0x10>;
		mode-ums_mmc1 = <0x11>;
		mode-ums_mmc2 = <0x12>;
	};
};

So the expected configuration for me is 
- CONFIG_USE_PREBOOT=y		=> variable preboot is handle
- CONFIG_PREBOOT=""		=> default value of variable


> --
> Tom

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

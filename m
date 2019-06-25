Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 783FA52696
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:28:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AAF4D12B73
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:28:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CAA1D12B72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:28:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P8LflE028292; Tue, 25 Jun 2019 10:28:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=RmyDKzDID1tj0/rh1RDv0z9D1dDDD5RpvOWLrsM6Rzg=;
 b=tOsONF4NBBuj7oP+RUVxBvy6qqpdM+GJwq8MxryDI8DdFMU977sMGavSUwTOJVbEUzpl
 /Qrpz6uLsYzZjY0v/9axChIAcZfJWbCtrcbrU/o9eb7m4/jEB41uNUUOwwJ6eAWNz5DL
 iXLA09Vl2Fn0ANaZ7JAxbFEs3XI+4AX0P4qPT6ggHrH7sJUCug+q1egNESWHPDVbfuFK
 L8Rf+fVvLNYoiAt3oOp7pMv7g5/9UT6AVCRW/XA4Wt9o9EGzQw7CRI4olXHGBL6Q4u6R
 srUIw7lxf1/gVWAGy4Q0ecd6MEdi/2XCOAQGCd+EzVlrNQo4L0tgLjb7te7kGgdax993 Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2wg5f5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:28:09 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC1FE34;
 Tue, 25 Jun 2019 08:28:04 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FB772404;
 Tue, 25 Jun 2019 08:28:04 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 25 Jun
 2019 10:28:04 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 25 Jun 2019 10:28:04 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 00/16] stm32m1 patches for v2017.10
Thread-Index: AQHVKDRSJx68L7CZgUCA4Fh0++isY6al//yAgAYOknA=
Date: Tue, 25 Jun 2019 08:28:04 +0000
Message-ID: <7983bada2853436ea4f38e950526e58f@SFHDAG6NODE3.st.com>
References: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
 <b4cb362b-f512-b810-c052-42a10fcf95a9@st.com>
In-Reply-To: <b4cb362b-f512-b810-c052-42a10fcf95a9@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Christophe
 KERELLO <christophe.kerello@st.com>, Albert
 Aribaud <albert.u.boot@aribaud.net>
Subject: Re: [Uboot-stm32] [PATCH 00/16] stm32m1 patches for v2017.10
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

Hi Patrice,

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 21 juin 2019 15:55
> 
> for v2019.10 ;-)

Yes Sorry :-)

I mixed the first name (target as v2019.07) the new target v2019.10.
I will update the serie title if I sent a v2.

> 
> On 6/21/19 3:21 PM, Patrick Delaunay wrote:
> > Some remaining patches for stm32mp1
> > - some cleanup in files
> > - add 2 specific commands for stm32mp1 board
> > - use OF_SYSTEM_SETUP to update kernel device tree
> > - synchronization with latest device tree
> >
> >
> >
> > Patrick Delaunay (16):
> >   stm32mp1: deactivate WATCHDOG in defconfig
> >   stm32mp1: call regulators_enable_boot_on in board_init
> >   stm32mp1: syscon: remove etzpc support
> >   stm32mp1: syscon: remove stgen
> >   dt-bindings: pinctrl: stm32: add new entry for package information
> >   stm32mp1: export get_cpu_package function
> >   stm32mp1: update package information in device tree
> >   stm32mp1: update device tree with ETZPC status
> >   stm32mp1: add stboard command
> >   stm32mp1: key: add stm32key command
> >   stm32mp1: udpate README
> >   stm32mp1: cosmetic: remove unnecessary include
> >   stm32mp1: configs: Add CONFIG_OF_SPL_REMOVE_PROPS
> >   stm32mp1: add check for presence of environment in boot device
> >   stm32mp1: force boot_net_usb_start
> >   ARM: dts: stm32mp1: sync device tree with v5.2-rc4
> >
> >  arch/arm/Kconfig                                   |   1 +
> >  arch/arm/dts/stm32mp15-ddr.dtsi                    |   2 +-
> >  arch/arm/dts/stm32mp157-pinctrl.dtsi               | 270
> ++++++++++++++++++++-
> >  arch/arm/dts/stm32mp157-u-boot.dtsi                |  67 ++---
> >  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi           |   4 -
> >  arch/arm/dts/stm32mp157a-dk1.dts                   |  30 ++-
> >  arch/arm/dts/stm32mp157c-dk2.dts                   |   1 +
> >  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi           |  15 +-
> >  arch/arm/dts/stm32mp157c-ed1.dts                   | 205 ++++------------
> >  arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi           |   4 -
> >  arch/arm/dts/stm32mp157c-ev1.dts                   |  12 +-
> >  arch/arm/dts/stm32mp157c.dtsi                      | 199 +++++++++++----
> >  arch/arm/mach-stm32mp/Kconfig                      |  15 ++
> >  arch/arm/mach-stm32mp/Makefile                     |   2 +
> >  arch/arm/mach-stm32mp/cmd_stm32key.c               | 101 ++++++++
> >  arch/arm/mach-stm32mp/cpu.c                        |   7 +-
> >  arch/arm/mach-stm32mp/fdt.c                        | 223 +++++++++++++++++
> >  arch/arm/mach-stm32mp/include/mach/stm32.h         |   3 +-
> >  arch/arm/mach-stm32mp/include/mach/sys_proto.h     |   9 +
> >  arch/arm/mach-stm32mp/syscon.c                     |   2 -
> >  board/st/stm32mp1/Kconfig                          |   7 +
> >  board/st/stm32mp1/Makefile                         |   1 +
> >  board/st/stm32mp1/README                           |  15 +-
> >  board/st/stm32mp1/cmd_stboard.c                    | 145 +++++++++++
> >  board/st/stm32mp1/spl.c                            |   1 -
> >  board/st/stm32mp1/stm32mp1.c                       |   4 +
> >  configs/stm32mp15_basic_defconfig                  |   3 +-
> >  configs/stm32mp15_trusted_defconfig                |   2 -
> >  .../pinctrl/st,stm32-pinctrl.txt                   | 101 +++++++-
> >  drivers/clk/clk_stm32mp1.c                         |   3 +-
> >  include/configs/stm32mp1.h                         |   7 +-
> >  include/dt-bindings/pinctrl/stm32-pinfunc.h        |   6 +
> >  32 files changed, 1158 insertions(+), 309 deletions(-)  create mode
> > 100644 arch/arm/mach-stm32mp/cmd_stm32key.c
> >  create mode 100644 arch/arm/mach-stm32mp/fdt.c  create mode 100644
> > board/st/stm32mp1/cmd_stboard.c
> >

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

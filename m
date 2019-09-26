Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 975ADBEF1E
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Sep 2019 11:58:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D93FC36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Sep 2019 09:58:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55896C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2019 09:58:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8Q9aKUH029698; Thu, 26 Sep 2019 11:57:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=a3JGVy7IUQMrV9PfIi8JtqMh+fEs8Tr7Jn2tu8Zul7M=;
 b=MSMDVVYIxIC7V+mvEYt4J5462Kwl2I8Twj7RaKG9nPL90KpGn3bmSz/9GjIEG0CeGbjm
 yAJ+VHTH6JpXgTA/B4iG4DWISQ844Qj+cjTvBrFdT76jjllYtvfHuh+MscGeCfIZePmF
 ienne8Nc8c9/Sk4WJVHIi7wlwV1DDfTn/wPXrAyNtWt25L1xKX2DehqR6p880d37exvD
 PyUv2gOM4Z8LroDjZULkIB+3K2Ssn2bUngfEDP+AQWva2HpufrWVnD+B7Wx2iA7P7bcE
 vpI2khyJEFtnrxBkWSjHBKrMT7GpoaAhQNi0AtXwY+akBB36IetwTZijpLPJP+cYszMG qQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v5arhwvfh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 26 Sep 2019 11:57:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B786523;
 Thu, 26 Sep 2019 09:57:43 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 670102B6C79;
 Thu, 26 Sep 2019 11:57:43 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Sep
 2019 11:57:42 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 26 Sep 2019 11:57:42 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Tom Rini <trini@konsulko.com>, Stefan Roese <sr@denx.de>
Thread-Topic: [U-Boot] [PATCH v3 0/3] env: Add CONFIG_ENV_FULL_SUPPORT
Thread-Index: AQHVbgOiinOinVx3e0q2YllyRlA5Bqc0KJYAgACmAgCACPDh4A==
Date: Thu, 26 Sep 2019 09:57:42 +0000
Message-ID: <a7ac42f7230c40a7be62385b10c9016f@SFHDAG6NODE3.st.com>
References: <20190918092920.21435-1-patrick.delaunay@st.com>
 <b3874e83-e983-2adb-aef4-585acc4e08d9@denx.de>
 <20190920190324.GM1011@bill-the-cat>
In-Reply-To: <20190920190324.GM1011@bill-the-cat>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_04:2019-09-25,2019-09-26 signatures=0
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Ash Charles <ash@gumstix.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 0/3] env: Add
	CONFIG_ENV_FULL_SUPPORT
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
> Sent: vendredi 20 septembre 2019 21:03
> 
> On Fri, Sep 20, 2019 at 11:09:14AM +0200, Stefan Roese wrote:
> > Hi Patrick,
> >
> > On 18.09.19 11:29, Patrick Delaunay wrote:
> > >This patchset is a the 3rd version of
> > >   http://patchwork.ozlabs.org/project/uboot/list/?series=129339
> > >   "env: Add CONFIG_ENV_SUPPORT"
> > >
> > >The first patch of the serie only solves the regression introduced by
> > >commit 7d4776545b0f ("env: solve compilation error in SPL");
> > >change_ok was always NULL in U-Boot.
> > >See "U-Boot: Environment flags broken for U-Boot" mail
> > >http://u-boot.10912.n7.nabble.com/U-Boot-Environment-flags-broken-for
> > >-U-Boot-tt382673.html
> > >
> > >This first patch can be integrated in master branch for v2019.10 as
> > >requested Tom Rimi.
> > >
> > >The next patches of the serie is a proposal after Wolfgang Denk
> > >review on the first proposal: I make the env support coherent between
> > >U-Boot, SPL and TPL.
> > >
> > >I need to change many defconfig (to add
> > >CONFIG_(SPL/TPL)_ENV_IS_NOWHERE) because I modify the dependency
> between the CONFIG used by SPL.
> > >
> > >Moreover the size of SPL increase after this last patch.
> > >
> > >For example on stm32mp15_basic, the SPL sizes:
> > >
> > >   62024	   4616	    892	  67532	  107cc	spl/u-boot-spl 00003e6c
> > >
> > >increase by 250 byte to
> > >
> > >   62274	   4640	    896	  67810	  108e2	spl/u-boot-spl 00003f56
> > >
> > >And the patch also breaks the compilation of few boards, when SPL
> > >size is near to its limit (.sram overflowed in SPL or SPL image too big):
> > >  imx6q_logic (by 1572 bytes)
> > >  omap3_logic_somlv (by 220 bytes)
> > >  omap3_logic (by 276 bytes)
> > >  omap35_logic_somlv (by 156 bytes)
> > >  omap35_logic (by 3064 bytes)
> > >  smartweb (by 408 bytes)
> > >  duovero (by 952 bytes)
> > >  x600 (by 1624 bytes)
> > >
> > >So the last patch can't be integrated today with these errors but any
> > >review and advice are welcome.
> >
> > I'm looking into this because of the x600 breakage. So this patchset
> > increases the SPL image size because all the environment "features"
> > are now also available in SPL (please correct me if I'm wrong). In the
> > case of x600 (IIRC), env is not used at all in the SPL stage.
> > Perhaps it would be possible to (optionally) remove the environment
> > support completely from SPL/TPL in such cases?
> 
> As part of correcting things here, we need to be able to have boards
> either:
> - Work as-is today, whatever options that need to be on/off now, are
>   on/off.
> - In the potential cases of undesirable configurations we need to be
>   able to opt for "OK, drop stuff" as well as there's going to be many
>   cases where the board doesn't have the binary space for more features
>   and removal of really unused stuff is fine.  ie TPL/SPL environment
>   use cases boil down to:
>   - Need read-only support, for network stack.
>   - Need some read/write support, for bootcount
>   - Maybe a few things along those lines I can't think of off-hand but
>     are $X needs read-only or $Y needs limited write.

I think that it was already managed by Kconfig :

+ not supported => only read of default env =>  CONFIG_SPL_ENV_IS_NOWHERE
+ Read-only on XXX => default behavior and activated when CONFIG_SPL_ENV_IS_IN_XXX is activated
+ Write support => CONFIG_SPL_SAVEENV (deactivated by default)

(Same for CONFIG_TPL)

I just be sure that it is the correct and expected behavior before to go futher / cheakc why the SPL size increase on the broken board.

Regards
Patrick

> --
> Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

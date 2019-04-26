Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 038DDB314
	for <lists+uboot-stm32@lfdr.de>; Sat, 27 Apr 2019 10:15:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A666DC35E04
	for <lists+uboot-stm32@lfdr.de>; Sat, 27 Apr 2019 08:15:14 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2503C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2019 21:59:01 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Apr 2019 14:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,399,1549958400"; d="scan'208";a="139181077"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga006.jf.intel.com with ESMTP; 26 Apr 2019 14:58:46 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hK8ri-0003Fr-IU; Sat, 27 Apr 2019 00:58:42 +0300
Date: Sat, 27 Apr 2019 00:58:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Message-ID: <20190426215842.GF9224@smile.fi.intel.com>
References: <20190419043859.16751-1-alex.kiernan@gmail.com>
 <20190426215756.GE9224@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190426215756.GE9224@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 27 Apr 2019 08:15:12 +0000
Cc: Peng Fan <peng.fan@nxp.com>,
 =?iso-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>,
 Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>,
 Ramon Fried <ramon.fried@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot@lists.denx.de, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Marek Vasut <marex@denx.de>, Akshay Saraswat <akshay.s@samsung.com>,
 Stephen Warren <swarren@nvidia.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Toradex ARM Support <support.arm@toradex.com>,
 Fabio Estevam <festevam@gmail.com>, Minkyu Kang <mk7.kang@samsung.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>,
 Simone CIANNI <simone.cianni@bticino.it>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chander Kashyap <k.chander@samsung.com>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Stefan Agner <stefan.agner@toradex.com>, Tim Harvey <tharvey@gateworks.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Adam Ford <aford173@gmail.com>,
 Ingo Schroeck <open-source@samtec.de>, Stefano Babic <sbabic@denx.de>,
 Dmitry Lifshitz <lifshitz@compulab.co.il>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Simon Glass <sjg@chromium.org>, "Andrew F. Davis" <afd@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Subject: Re: [Uboot-stm32] [PATCH] Convert CONFIG_SUPPORT_EMMC_BOOT to
	Kconfig
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

On Sat, Apr 27, 2019 at 12:57:56AM +0300, Andy Shevchenko wrote:
> On Fri, Apr 19, 2019 at 04:38:59AM +0000, Alex Kiernan wrote:
> > This converts the following to Kconfig:
> >    CONFIG_SUPPORT_EMMC_BOOT
> 
> >  configs/edison_defconfig                         | 1 +
> 
> > diff --git a/configs/edison_defconfig b/configs/edison_defconfig
> > index 22fc84a41e38..b99906a4d144 100644
> > --- a/configs/edison_defconfig
> > +++ b/configs/edison_defconfig
> > @@ -30,6 +30,7 @@ CONFIG_ENV_IS_IN_MMC=y
> >  CONFIG_CPU=y
> >  CONFIG_DFU_MMC=y
> >  CONFIG_DFU_RAM=y
> > +CONFIG_SUPPORT_EMMC_BOOT=y
> >  CONFIG_DM_PCI_COMPAT=y
> >  CONFIG_RTC_MC146818=y
> >  CONFIG_USB_DWC3_GADGET=y
>

Including
 include/configs/edison.h                         | 1 -

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

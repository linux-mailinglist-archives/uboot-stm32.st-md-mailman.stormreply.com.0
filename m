Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C34E6EC0
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Mar 2022 08:21:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6064BC628A2;
	Fri, 25 Mar 2022 07:21:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7C06C60468
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 19:56:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5931E60ADB;
 Thu, 24 Mar 2022 19:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AECC340EE;
 Thu, 24 Mar 2022 19:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648151781;
 bh=SHVH5BmEn5WX64gJKzSs+hm0AWcHK4sRNrPVqfPRwDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PQ6KVSKeAXiY0Ms7viXvGnzNQmUDlCuF8Qge22NAcJLRbIS6Ju2olbk8lTIxCQoac
 uFDTQNgsCWsVWumNZoS22rrtcefjkHFMun6J9vjyIGCw82gzQV81U2HcMNuvnud5/h
 EOFoQHWLdTILQpC99wUgeg+TDnMMPZ675cIZCHtxCvvjvj1LGailk7TZyYuewXH1X1
 rugaEyObk/0nZmEUoFxeKrVvaFSW+rfY9xaOIbNbCvS1UOeFxMLwUVKwqEGYGGlGBg
 VBa+14vCv7KB4mrpv8SXtJ/80xYMgVSDn0BU34Ijr+B/4SS8DUxjROf8ZRFLGOkjsz
 c9Zx6FRMhWgUg==
Received: by pali.im (Postfix)
 id 6EE68989; Thu, 24 Mar 2022 20:56:18 +0100 (CET)
Date: Thu, 24 Mar 2022 20:56:18 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20220324195618.jf4zx3n5loc7hj6r@pali>
References: <20220123140415.3091482-1-sjg@chromium.org>
 <CAPnjgZ0UhAcCPmDeEPzrvYLXnPFC_sAZa6ssk=MwJkqDzHCMzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0UhAcCPmDeEPzrvYLXnPFC_sAZa6ssk=MwJkqDzHCMzQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 25 Mar 2022 07:21:39 +0000
Cc: Baruch Siach <baruch@tkos.co.il>, Aymen Sghaier <aymen.sghaier@nxp.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Vanessa Maegima <vanessa.maegima@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Alison Wang <alison.wang@nxp.com>, Rick Chen <rick@andestech.com>,
 Matthias Brugger <mbrugger@suse.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Kory Maincent <kory.maincent@bootlin.com>,
 Anatolij Gustschin <agust@denx.de>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, Stephen Carlson <stcarlso@linux.microsoft.com>
Subject: Re: [Uboot-stm32] [PATCH 00/14] video: Drop old CFB code
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

On Thursday 24 March 2022 13:54:22 Simon Glass wrote:
> Hi Anatolij,
> 
> On Sun, 23 Jan 2022 at 07:04, Simon Glass <sjg@chromium.org> wrote:
> >
> > There is still quite a bit of cruft in the video subsystem. Mainly this is
> > users of the now-removed CONFIG_VIDEO, cfb_console and CONFIG_LCD.
> >
> > This series removes most of the first two. The exception is videomodes.c
> > and its header, since these are used by sunxi. It looks like the code
> > could be removed, but I did not attempt it.
> >
> > This is left for the sunxi maintainer.
> >
> > The LCD clean-up can come later. Once done, we can rename CONFIG_DM_VIDEO
> > to CONFIG_VIDEO, thus completing the migration.
> >
> >
> > Simon Glass (14):
> >   video: Drop cfg_console
> >   video: nokia_rx51: Drop obsolete video code
...
> 
> Is there any word on this series, please?

Nokia board code does not use this cfb_console anymore... Or it is still
affected?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6904E6A8D
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Mar 2022 23:16:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A62ECC60496;
	Thu, 24 Mar 2022 22:16:50 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8E99C60468
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 22:16:49 +0000 (UTC)
Received: from crub (p508b6e90.dip0.t-ipconnect.de [80.139.110.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id ECCC484021;
 Thu, 24 Mar 2022 23:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648160209;
 bh=6eeyfYAbLufYghM3JY2a/QE/EIaaAOekT0guFsDfnJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o8obzwo2lMB/xRsLRZcrSTknqSMUPoO9SCGreVueVqn1rC5YUecYvhKcbbI8cjgEH
 8fOzds+a19aYXUFFYKkPFp6Cg+eLw6XEogR+aipSp2j8Qf34vAyPpdb1RkEmnXmvkO
 /0mG2kNJqq6AoIJkji9edS3NfJmivJ+DOK6RqP4ed6uDHn4JzX/obkHr1wjmQBkDGD
 WjJvQKJ8bwA6nueJ6SEWIWBixRN0Ulc0EYz6TcsaEs0HwmwI3ZWAcZAtnakyD14FT7
 jB9uto4HyIlNFr0qM9UxVtkpJC+9jEtxRuuPNNOh32WjvYmRRkrZd+51qDD9QqjoGL
 ak+TaKyFQLbgA==
Date: Thu, 24 Mar 2022 23:16:45 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20220324231645.1d6fc1ab@crub>
In-Reply-To: <CAPnjgZ0UhAcCPmDeEPzrvYLXnPFC_sAZa6ssk=MwJkqDzHCMzQ@mail.gmail.com>
References: <20220123140415.3091482-1-sjg@chromium.org>
 <CAPnjgZ0UhAcCPmDeEPzrvYLXnPFC_sAZa6ssk=MwJkqDzHCMzQ@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Baruch Siach <baruch@tkos.co.il>, Aymen Sghaier <aymen.sghaier@nxp.com>,
 "NXP i.MX
 U-Boot Team" <uboot-imx@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Samuel Egli <samuel.egli@siemens.com>,
 Peng Fan <peng.fan@nxp.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Vanessa Maegima <vanessa.maegima@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Heiko Schocher <hs@denx.de>, Dario Binacchi <dariobin@libero.it>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Alison Wang <alison.wang@nxp.com>, Rick Chen <rick@andestech.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>,
 Stefano Babic <sbabic@denx.de>, Kory Maincent <kory.maincent@bootlin.com>,
 Matthias Brugger <mbrugger@suse.com>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Stephen Carlson <stcarlso@linux.microsoft.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
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

Hi Simon,

On Thu, 24 Mar 2022 13:54:22 -0600
Simon Glass sjg@chromium.org wrote:
...
> 
> Is there any word on this series, please?

last week I've rebased and applied this series to next (PATCH 02/14
dropped) and will submit a pull request when Tom merges last -rc
into his next branch. Otherwise there will be a build error due to
missing Nokia RX-51 related changes. Thanks!

--
Anatolij

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

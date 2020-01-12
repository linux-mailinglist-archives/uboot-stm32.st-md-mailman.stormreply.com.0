Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2EA138837
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Jan 2020 21:30:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B42F6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 12 Jan 2020 20:30:12 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 319A0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2020 20:30:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47wpHc5WTfz1rD9H;
 Sun, 12 Jan 2020 21:30:04 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47wpHb1Pr8z1qvx4;
 Sun, 12 Jan 2020 21:30:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id X0v5MjFnGr35; Sun, 12 Jan 2020 21:29:58 +0100 (CET)
X-Auth-Info: lwpJ9i3l9CYhFA2SxVBh0O/eUKxDS/ZtBMhXbK7W7/E=
Received: from crub (p508B64CC.dip0.t-ipconnect.de [80.139.100.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 12 Jan 2020 21:29:58 +0100 (CET)
Date: Sun, 12 Jan 2020 21:29:57 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20200112212957.44f7e1f0@crub>
In-Reply-To: <20200112120216.29.I451105ed1149334d1ef6eca303eede6e56b833d1@changeid>
References: <20200112190624.79077-1-sjg@chromium.org>
 <20200112120216.29.I451105ed1149334d1ef6eca303eede6e56b833d1@changeid>
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Carlo Caione <ccaione@baylibre.com>,
 Eddie James <eajames@linux.ibm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>, Sergey Kubushyn <ksi@koi8.net>,
 Ramon Fried <rfried.dev@gmail.com>, Michal Suchanek <msuchanek@suse.de>,
 Ye Li <ye.li@nxp.com>, "Derald D. Woods" <woods.technical@gmail.com>,
 Sekhar Nori <nsekhar@ti.com>, Stefano Babic <sbabic@denx.de>,
 Andreas Dannenberg <dannenberg@ti.com>,
 =?UTF-8?B?6buY6buY?= <wangqiang1588@sina.com>,
 titron <tiezhuang.dong.yh@renesas.com>, Anup Patel <Anup.Patel@wdc.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, "NXP i.MX
 U-Boot Team" <uboot-imx@nxp.com>, Stefan Roese <sr@denx.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Fabien Dessenne <fabien.dessenne@st.com>, u-boot-amlogic@groups.io,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Shyam Saini <shyam.saini@amarulasolutions.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Sherry Sun <sherry.sun@nxp.com>, Fugang Duan <fugang.duan@nxp.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Patrice Chotard <patrice.chotard@st.com>, Suman Anna <s-anna@ti.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Atish Patra <atish.patra@wdc.com>,
 Lukas Auer <lukas.auer@aisec.fraunhofer.de>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Joel Stanley <joel@jms.id.au>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 William Zhang <william.zhang@broadcom.com>,
 Frank Wunderlich <frank-w@public-files.de>, Levin Du <djw@t-chip.com.cn>,
 Adam Ford <aford173@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Kyungmin Park <kmpark@infradead.org>, Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Trent Piepho <tpiepho@impinj.com>,
 Nishanth Menon <nm@ti.com>, Vignesh R <vigneshr@ti.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Rick Chen <rick@andestech.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Marek Vasut <marex@denx.de>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Marek Vasut <marek.vasut@gmail.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Stefan Agner <stefan.agner@toradex.com>,
 Andre Przywara <andre.przywara@arm.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, Keerthy <j-keerthy@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 29/33] dm: core: Require users of devres
 to include the header
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

On Sun, 12 Jan 2020 12:06:20 -0700
Simon Glass sjg@chromium.org wrote:

> At present devres.h is included in all files that include dm.h but few
> make use of it. Also this pulls in linux/compat which adds several more
> headers. Drop the automatic inclusion and require files to include devres
> themselves. This provides a good indication of which files use devres.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>

Reviewed-by: Anatolij Gustschin <agust@denx.de>

--
Anatolij
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

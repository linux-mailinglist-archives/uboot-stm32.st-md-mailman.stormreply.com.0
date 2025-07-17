Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83952B14899
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F204C3F92F;
	Tue, 29 Jul 2025 06:49:52 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADE13C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 13:09:39 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HD7S8B485268;
 Thu, 17 Jul 2025 08:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1752757648;
 bh=nsyg8TWytJZ/S1BeeO6muRVSNtIq9VU+wfODApNM+hQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=AmiCvHlmGnU0oIH0nDNaMMXR43f+P6ZnN5WW/xVGpNwnvTo63MMiq69D44MCMfoyC
 jblWYuhBmMWoJGzD5FnAZ14VFBfv785mzWMEgTlruwq5QTmEiyY0AL1tLq34PNN86e
 5TbKnewDyrcdCvrY3uYAlDoEVrcFzGM3z2LMMtZc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HD7SwC243017
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 17 Jul 2025 08:07:28 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 08:07:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 08:07:27 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HD7RpN2213598;
 Thu, 17 Jul 2025 08:07:27 -0500
Date: Thu, 17 Jul 2025 08:07:27 -0500
From: Bryan Brattlof <bb@ti.com>
To: Sam Protsenko <semen.protsenko@linaro.org>
Message-ID: <20250717130727.5phynk5x53eubngx@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250717024426.26953-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717024426.26953-1-semen.protsenko@linaro.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:49:34 +0000
Cc: Nishanth Menon <nm@ti.com>, Kursad Oney <kursad.oney@broadcom.com>,
 Peng Fan <peng.fan@nxp.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alice Guo <alice.guo@nxp.com>, Jim Liu <JJLIU0@nuvoton.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Sean Anderson <seanga2@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 liuhao <liuhao@phytium.com.cn>, Jan Kiszka <jan.kiszka@siemens.com>,
 Garrett Giordano <ggiordano@phytec.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Francesco
 Dolcini <francesco.dolcini@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dario
 Binacchi <dario.binacchi@amarulasolutions.com>, Fabio
 Estevam <festevam@gmail.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 weichangzheng <weichangzheng@phytium.com.cn>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 open list <u-boot@lists.denx.de>, Adam Ford <aford173@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Le Jin <le.jin@siemens.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Hugues Kamba Mpiana <hugues.kambampiana@arm.com>,
 Michal Simek <michal.simek@amd.com>, Ben Horgan <ben.horgan@arm.com>,
 Sam Shih <sam.shih@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Julien Masson <jmasson@baylibre.com>,
 Stanley Chu <yschu@nuvoton.com>, Anand Gore <anand.gore@broadcom.com>, William
 Zhang <william.zhang@broadcom.com>, Eric Nelson <eric@nelint.com>,
 Paul Barker <paul@pbarker.dev>, u-boot@dh-electronics.com,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>, lixinde <lixinde@phytium.com.cn>,
 Huan Zhou <pericycle.cc@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 shuyiqi <shuyiqi@phytium.com.cn>, Apurva Nandan <a-nandan@ti.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jayesh
 Choudhary <j-choudhary@ti.com>, Wadim
 Egorov <w.egorov@phytec.de>, Philippe Reynes <philippe.reynes@softathome.com>,
 Fabien Parent <fparent@baylibre.com>, Vaishnav Achath <vaishnav.a@ti.com>,
 Simon Glass <sjg@chromium.org>, Gilles Talis <gilles.talis@gmail.com>,
 u-boot-amlogic@groups.io, Kamil Lulko <kamil.lulko@gmail.com>,
 Aaron Williams <awilliams@marvell.com>, Tuomas
 Tynkkynen <tuomas.tynkkynen@iki.fi>, Michael Walle <michael@walle.cc>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, Manorit
 Chawdhry <m-chawdhry@ti.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH] treewide: Remove empty board_init()
 function from all boards
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

On July 16, 2025 thus sayeth Sam Protsenko:
> Commit 86acdce2ba88 ("common: add config for board_init() call")
> introduced CONFIG_BOARD_INIT option. This option can be disabled for the
> boards where board_init() function is not needed. Remove empty
> board_init() calls for all boards where it's possible, and disable
> CONFIG_BOARD_INIT in all related defconfigs.
> 
> This cleanup was made semi-automatically using these scripts: [1].
> 
> No functional change, but the binary size for the modified boards is
> reduced a bit.
> 
> [1] https://github.com/joe-skb7/uboot-convert-scripts/tree/master/remove-board-init
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

This appears to work for the TI's K3 boards

Tested-by: Bryan Brattlof <bb@ti.com>

~Bryan

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

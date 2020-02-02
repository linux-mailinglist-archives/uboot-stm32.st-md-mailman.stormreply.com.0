Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB914FD8E
	for <lists+uboot-stm32@lfdr.de>; Sun,  2 Feb 2020 15:36:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 174CEC36B0B
	for <lists+uboot-stm32@lfdr.de>; Sun,  2 Feb 2020 14:36:06 +0000 (UTC)
Received: from mail.ltec.ch (mail.ltec.ch [95.143.48.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0977C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Feb 2020 14:36:03 +0000 (UTC)
Received: from 46-126-180-79.dynamic.hispeed.ch ([46.126.180.79]
 helo=[172.27.111.134])
 by mail.ltec.ch with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <fb@ltec.ch>)
 id 1iyGLi-00084R-Ve; Sun, 02 Feb 2020 15:35:47 +0100
To: Thomas Hebb <tommyhebb@gmail.com>, u-boot@lists.denx.de
References: <faa9691528835dce9733dcfd1c1a8f20d13fa0bb.1580585884.git.tommyhebb@gmail.com>
 <6412a441fa9548f23086bf8c0a1b9b490d92dd0b.1580585884.git.tommyhebb@gmail.com>
From: Felix Brack <fb@ltec.ch>
Organization: LTEC AG
Message-ID: <fb41192d-68f1-361a-7c65-eec5ee479a35@ltec.ch>
Date: Sun, 2 Feb 2020 15:35:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6412a441fa9548f23086bf8c0a1b9b490d92dd0b.1580585884.git.tommyhebb@gmail.com>
Content-Language: en-US
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Baruch Siach <baruch@tkos.co.il>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Lars Poeschel <poeschel@lemonage.de>, Peng Fan <peng.fan@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>, Vignesh R <vigneshr@ti.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Arkadiusz Karas <arkadiusz.karas@somlabs.com>,
 =?UTF-8?Q?Eric_B=c3=a9nard?= <eric@eukrea.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Hu <richard.hu@technexion.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, Marek Vasut <marex@denx.de>,
 Niel Fourie <lusus@denx.de>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?Q?Javier_Mart=c3=adnez_Canillas?= <javier@dowhile0.org>,
 Heiko Schocher <hs@denx.de>, Ash Charles <ash@gumstix.com>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Otavio Salvador <otavio@ossystems.com.br>, Breno Lima <breno.lima@nxp.com>,
 Samuel Egli <samuel.egli@siemens.com>, Gilles Gameiro <gilles@gigadevices.com>,
 James Byrne <james.byrne@origamienergy.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Erik van Luijk <evanluijk@interact.nl>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Moses Christopher Bollavarapu <BollavarapuMoses.Christopher@in.bosch.com>,
 Silvio Fricke <open-source@softing.de>, Parthiban Nallathambi <pn@denx.de>,
 Yegor Yefremov <yegorslists@googlemail.com>, Stefano Babic <sbabic@denx.de>,
 Michal Simek <monstr@monstr.eu>, Anatolij Gustschin <agust@denx.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Martyn Welch <martyn.welch@collabora.com>, Simon Glass <sjg@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, "Andrew F. Davis" <afd@ti.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lothar Felten <lothar.felten@gmail.com>, Yangbo Lu <yangbo.lu@nxp.com>,
 Francesco Montefoschi <francesco.montefoschi@udoo.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] spl: get rid of SPL_LIBDISK_SUPPORT
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 01.02.20 20:38, Thomas Hebb wrote:
> This option hasn't actually affected what's linked into the build since
> commit 91ff6865629c ("blk: Rework guard around part_init call"), which
> switched libdisk in SPL to depend on (CONFIG_SPL_FRAMEWORK &&
> CONFIG_PARTITIONS). After removing one straggling reference that seems
> to been authored before 91ff6865629c landed, there are absolutely no
> references to this in the code. Let's remove it.
> 
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> 
> ---
> 

For the PDU001 board:
Tested-by: Felix Brack <fb@ltec.ch>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

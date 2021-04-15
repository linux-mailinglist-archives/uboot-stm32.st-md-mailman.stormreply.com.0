Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7C361040
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Apr 2021 18:36:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33EFBC57B78;
	Thu, 15 Apr 2021 16:36:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B851C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 16:36:50 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AFF0B81E89;
 Thu, 15 Apr 2021 18:36:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618504607;
 bh=S9ocFICtTnZ1eYW3We8zgpgIDPImv/kcX2WTeyefX2c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UfreHLuIm+F0DgUtEH4N8A1icUz/aNMmw1q2jOJB9u5yjKrB8EhbhyQutIB28dfYK
 bliKWK2fOa0vbIHtwBY8DbmnSEjC+1KrsqHSZYKl7KJaN8XCJq7dPLuxzLe/wCfwey
 MaYXcoLZEcuk1u+gglbM78FLndQp7rnoUeCVADdjVr6KeyiTOV76fYUR1o/JQ1moZx
 8j+65cS1bMUCCdjxOHku1ow6iy8xRLol5t5BoudMiL8tfwTQx31Ec/FjelzoAGIvXY
 NvfLWRYxZg4zumoSMeyFyPiS7KpHHYD33u7LmXlE7UNwI9CLWzfDpqkzB6+EphZgMN
 P16gZFJ9BzcSw==
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20210326031303.833293-1-sjg@chromium.org>
 <20210326031303.833293-2-sjg@chromium.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <3b3de37f-90ea-b745-8145-0fe63e8941a6@denx.de>
Date: Thu, 15 Apr 2021 18:36:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210326031303.833293-2-sjg@chromium.org>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: Peng Fan <peng.fan@nxp.com>, Reuben Dowle <reubendowle0@gmail.com>,
 Marco Franchi <marcofrk@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Samuel Holland <samuel@sholland.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 Ramon Fried <rfried.dev@gmail.com>, Harald Seiler <hws@denx.de>,
 Wolfgang Grandegger <wg@aries-embedded.de>,
 Beniamino Galvani <b.galvani@gmail.com>, David Bauer <mail@david-bauer.net>,
 Trevor Woerner <twoerner@gmail.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Pavel Machek <pavel@denx.de>,
 Anup Patel <anup.patel@wdc.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Pratyush Yadav <p.yadav@ti.com>,
 =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Stefan Roese <sr@denx.de>, u-boot-amlogic@groups.io,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Alifer Moraes <alifer.wsdm@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Mario Six <mario.six@gdsys.cc>,
 Andy Yan <andy.yan@rock-chips.com>, Dalon Westergreen <dwesterg@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Joel Johnson <mrjoel@lixil.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Atish Patra <atish.patra@wdc.com>,
 "Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@hitachi-powergrids.com>,
 Dirk Eibach <dirk.eibach@gdsys.cc>, Loic Devulder <ldevulder@suse.com>,
 Akash Gajjar <akash@openedev.com>, Eugeniy Paltsev <paltsev@synopsys.com>,
 Levin Du <djw@t-chip.com.cn>, Adam Ford <aford173@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Jack Mitchell <ml@embed.me.uk>,
 Chin-Liang See <clsee@altera.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Banglang Huang <banglang.huang@foxmail.com>, Maxim Sloyko <maxims@google.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Peter Robinson <pbrobinson@gmail.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Christian Hewitt <christianshewitt@gmail.com>, "Andrew F. Davis" <afd@ti.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Tom Warren <twarren@nvidia.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] Rename CONFIG_DM_RESET to CONFIG_RESET
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

On 3/26/21 4:13 AM, Simon Glass wrote:
> This config was misnamed at birth since there has never been a
> CONFIG_RESET option used before driver model. Rename it so that it is
> clear that driver model is the only option here.

I'd say it should be kept as CONFIG_DM_*, to make it clear it is a DM 
option.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

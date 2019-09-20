Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC1B8D75
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Sep 2019 11:09:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E271C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Sep 2019 09:09:36 +0000 (UTC)
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 830F9C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 09:09:33 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id EDDE1A1C2D;
 Fri, 20 Sep 2019 11:09:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id kQE_NOqnQmuM; Fri, 20 Sep 2019 11:09:20 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20190918092920.21435-1-patrick.delaunay@st.com>
From: Stefan Roese <sr@denx.de>
Message-ID: <b3874e83-e983-2adb-aef4-585acc4e08d9@denx.de>
Date: Fri, 20 Sep 2019 11:09:14 +0200
MIME-Version: 1.0
In-Reply-To: <20190918092920.21435-1-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Lukasz Majewski <lukma@denx.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Heiko Schocher <hs@denx.de>,
 Ash Charles <ash@gumstix.com>, Wolfgang Denk <wd@denx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam Ford <aford173@gmail.com>,
 Simon Glass <sjg@chromium.org>, Anup Patel <Anup.Patel@wdc.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] env: Add CONFIG_ENV_FULL_SUPPORT
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

Hi Patrick,

On 18.09.19 11:29, Patrick Delaunay wrote:
> This patchset is a the 3rd version of
>    http://patchwork.ozlabs.org/project/uboot/list/?series=129339
>    "env: Add CONFIG_ENV_SUPPORT"
> 
> The first patch of the serie only solves the regression introduced by
> commit 7d4776545b0f ("env: solve compilation error
> in SPL"); change_ok was always NULL in U-Boot.
> See "U-Boot: Environment flags broken for U-Boot" mail
> http://u-boot.10912.n7.nabble.com/U-Boot-Environment-flags-broken-for-U-Boot-tt382673.html
> 
> This first patch can be integrated in master branch
> for v2019.10 as requested Tom Rimi.
> 
> The next patches of the serie is a proposal after Wolfgang Denk
> review on the first proposal: I make the env support coherent between
> U-Boot, SPL and TPL.
> 
> I need to change many defconfig (to add CONFIG_(SPL/TPL)_ENV_IS_NOWHERE)
> because I modify the dependency between the CONFIG used by SPL.
> 
> Moreover the size of SPL increase after this last patch.
> 
> For example on stm32mp15_basic, the SPL sizes:
> 
>    62024	   4616	    892	  67532	  107cc	spl/u-boot-spl 00003e6c
> 
> increase by 250 byte to
> 
>    62274	   4640	    896	  67810	  108e2	spl/u-boot-spl 00003f56
> 
> And the patch also breaks the compilation of few boards, when SPL size is
> near to its limit (.sram overflowed in SPL or SPL image too big):
>   imx6q_logic (by 1572 bytes)
>   omap3_logic_somlv (by 220 bytes)
>   omap3_logic (by 276 bytes)
>   omap35_logic_somlv (by 156 bytes)
>   omap35_logic (by 3064 bytes)
>   smartweb (by 408 bytes)
>   duovero (by 952 bytes)
>   x600 (by 1624 bytes)
> 
> So the last patch can't be integrated today with these errors
> but any review and advice are welcome.

I'm looking into this because of the x600 breakage. So this patchset
increases the SPL image size because all the environment "features"
are now also available in SPL (please correct me if I'm wrong). In
the case of x600 (IIRC), env is not used at all in the SPL stage.
Perhaps it would be possible to (optionally) remove the environment
support completely from SPL/TPL in such cases?

Thanks,
Stefan
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

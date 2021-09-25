Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF34A417E8F
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Sep 2021 02:12:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7778BC5A4F4;
	Sat, 25 Sep 2021 00:12:04 +0000 (UTC)
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 893B7C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 00:12:01 +0000 (UTC)
Received: from thinkpad (unknown [172.20.6.87])
 by mail.nic.cz (Postfix) with ESMTPSA id C5378142627;
 Sat, 25 Sep 2021 02:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1632528721; bh=glCfIUomaAlH08lUnS2WwFGYTh87Chy7WqBvYcGQipw=;
 h=Date:From:To;
 b=WzH2hYFnxe7EUEfceAFYBtBzh0289QAZsAeTuBsT7RfvRxiUnl6ncA1Hbish8qxMr
 nEcUicqsyPsXzdVb9iwVUIIM3Ru5W0M/+6bnIPnH52daLe+AmFF+7XNiD+MK3b7KPP
 gD21zuOVE7+QK+ggPf0eC59NmbdjfAMUwacw7kJk=
Date: Sat, 25 Sep 2021 02:12:00 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>
Message-ID: <20210925021200.7d5b62e2@thinkpad>
In-Reply-To: <f3c1e30e-a7d7-a492-2ca1-789edf1f9290@denx.de>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
 <20210922194615.GD31748@bill-the-cat>
 <59ce8fa7-64f2-07c9-ee2b-4b59335b3907@denx.de>
 <20210922200053.GE31748@bill-the-cat>
 <a0fa4277-80be-ce67-73fa-08a5be23088f@denx.de>
 <4f1609c3-0aca-3f49-715b-95c8a3336f61@foss.st.com>
 <20210924182257.GG31748@bill-the-cat>
 <20210924212559.22006a61@thinkpad>
 <f3c1e30e-a7d7-a492-2ca1-789edf1f9290@denx.de>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
 USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
 autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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

On Fri, 24 Sep 2021 22:09:15 +0200
Marek Vasut <marex@denx.de> wrote:

> I have a feeling the discussion is again banking toward "mtdparts" and 
> "DT", which really is a solved problem, or at least we agreed upon the 
> solution.

I was trying to explain to Patrick how he can convert the ST board so
that the mtd partitions will be defined in DT and board code won't need
mtdids if he also converts to distro boot correctly.

> The patch is trying to fix MTDIDS and their look up in 
> get_mtd_device_nm(). This is all U-Boot stuff, it has nothing to do with 
> passing mtd partitions to Linux at all.

The solution here is to get rid of MTDIDS also. But I guess this will
take some time, so it does make sense for get_mtd_device_nm() to
return the same device as previously when given argument "norN".

The reason why I put SPI NOR name into mtd->name was because otherwise
the `mtd list` command did not print that name anywhere (since it
doesn't know how, because that SPI-NOR data are private for the
jedec_spi_nor driver).

Since
- every mtd device has mtd->type, for NOR flash this is MTD_NORFLASH
- we can iterate mtd devices in order they were registered
  (mtd_for_each_device does this)
we can easily implement a function
  get_mtd_device_by_type_and_id()
that, when given string "norN" will find the N-th mtd device of type
MTD_NORFLASH.

This function could than be called from get_mtd_device_nm() if
everything failed, or in some other way.

Tom, Marek, Patrick, what do you think?

Marek
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

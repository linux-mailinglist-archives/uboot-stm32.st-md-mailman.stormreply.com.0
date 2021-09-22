Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59936414F16
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 19:29:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E24BBC5A4CD;
	Wed, 22 Sep 2021 17:29:28 +0000 (UTC)
Received: from mail.nic.cz (lists.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AAFCC5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 17:29:27 +0000 (UTC)
Received: from thinkpad (unknown [172.20.6.87])
 by mail.nic.cz (Postfix) with ESMTPSA id 803D1147F36;
 Wed, 22 Sep 2021 19:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1632331766; bh=7+PvqvcOA6zdOkNIWQZVm/a2v3FCy5ndFhL6nrzK6F4=;
 h=Date:From:To;
 b=RCXgIJ5+TniOB2dEJI6yey2tYLISs1iwSZYOeiG3IAi4KASDkwS+YYOm91NpBgwzw
 zSFvebG4pmOY9eCfUpl0ZfWTQGRtl0DqjJPpREbapf1wgcd593N78269i42GCHrO3e
 8rco3EUXTP1O3l1RCI5Mzg1iPUXDv7R0P3sU1yFE=
Date: Wed, 22 Sep 2021 19:29:25 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Marek Vasut
 <marex@denx.de>, Tom Rini <trini@konsulko.com>
Message-ID: <20210922192925.723abcba@thinkpad>
In-Reply-To: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
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
 u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
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

(Adding also Tom.)

Hi Patrick, Marek,

I find this either not complete or not needed:

- either you need mtd names to be of this format so that old MTDPARTS
  config definitions do not need to be changed, i.e. something like
    CONFIG_MTDPARTS_DEFAULT="nor0:1M(u-boot),0x1000@0xfff000(env)"
  does not work currently, and you want to make it work.

  I find your solution here incomplete because MTDPARTS can also be
  used to be passed to Linux as mtdparts parameter, but there is no
  guarantee that the "norN" numbering you are creating in U-Boot will
  be the same as the one in kernel.

- or it is not needed, because you can remove MTDPARTS definition from
  the board config entirely and move the information into device tree. 
  In fact this was the main idea behind making the series
    Support SPI NORs and OF partitions in `mtd list`
  The SPI-NOR MTDs after this series can have conflicting names,
  because you can still choose between them via OF path with the `mtd`
  command.

  Tom and I were of the opinion that MTDPARTS should be deprecated and
  removed in favor of OF. Marek Vasut says that this is not possible
  for every board, and so needs to stay.

BTW, I find it a little weird for Marek to defend old API which should
be converted to DT, when in discussion about DM USB / Nokia N900
USB TTY console [1] he was defending the opinion that we should be
heading to DT in U-Boot.

[1]
https://patchwork.ozlabs.org/project/uboot/patch/20210618145724.2558-1-pali@kernel.org/

On Wed, 22 Sep 2021 18:29:06 +0200
Patrick Delaunay <patrick.delaunay@foss.st.com> wrote:

> This serie is a V4 for [1].
> 
> Now the SPI nor are named "norN" with N after the CFI nor device:
> "nor0" to "norM" => N= M+1.
> 
> See also an other proposal from Marek (not working after test)
> "mtd: spi-nor: Fix SF MTDIDS when registering multiple MTDs with
> DM enabled"
> 
> http://patchwork.ozlabs.org/project/uboot/list/?series=262362
> 
> The first patch of the serie fixed the compilation issues around
> 'cfi_flash_num_flash_banks' found in CI:
> 
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/9138
> 
> [1] Series: mtd: spi: nor: force mtd name to "nor%d"
> http://patchwork.ozlabs.org/project/uboot/list/?series=262632&state=*
> http://patchwork.ozlabs.org/project/uboot/list/?series=262017&state=*
> http://patchwork.ozlabs.org/project/uboot/list/?series=262013&state=*
> 
> Patrick
> 
> 
> Changes in v4:
> - introduce macro MTD_NAME_SIZE for mtd_name size and use MTD_DEV_TYPE
>   to retrieved the "nor" string.
> 
> Changes in v3:
> - NEW: solve compilation issue when CONFIG_SYS_MAX_FLASH_BANKS is used
> - start index after the last CFI device, use CONFIG_SYS_MAX_FLASH_BANKS
> 
> Changes in v2:
> - correct commit message
> 
> Patrick Delaunay (2):
>   mtd: cfi_flash: use cfi_flash_num_flash_banks only when supported
>   mtd: spi: nor: force mtd name to "nor%d"
> 
>  drivers/mtd/spi/spi-nor-core.c | 17 ++++++++++++++---
>  include/dm/device.h            |  3 ++-
>  include/linux/mtd/spi-nor.h    |  2 ++
>  include/mtd.h                  |  4 ++++
>  include/mtd/cfi_flash.h        |  8 +++++++-
>  5 files changed, 29 insertions(+), 5 deletions(-)
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

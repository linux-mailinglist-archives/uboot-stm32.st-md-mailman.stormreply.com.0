Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B689F31
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Aug 2019 15:07:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC4D4C35E01
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Aug 2019 13:07:50 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E92D8C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2019 13:07:49 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c34so18377286otb.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2019 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFcj8y9kXjPF2doTCIOL8xYXpi8ZHAZDyEffsxs2oRY=;
 b=hSNGlohCMgodvCQDxY1fI3fOTpU9/k/PuQ5VO01Awd33WKdnMDs72iatsktfMJv6T1
 J13CdSc5qq0NJgdftR6bm+XH64CSPE1wbf3YkW6z8hCLdPcV4XDxm4upFhCK/6tXG97k
 MMqITqoZeNP/9gZjGTLM8UBQ2k1bkVRKMaU2R4GIkspOfhbXUTfCmC8WMEQ//BueV3K1
 EEGJOTAmTYcXS3akrkW1uB38mXkGfhXLls5FzDpv/MHJ4EZZQdJRWlzVq9T47RLIefHY
 4StW/WxhKNqn+LxdWtVuP10S71eYF+xE5eW4B2IHGlUItAnA//0Ogj8n4uEhTUj1N9t7
 wE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFcj8y9kXjPF2doTCIOL8xYXpi8ZHAZDyEffsxs2oRY=;
 b=kbmbg0k+VTXeRL5plKjlViOjGkMeFJ6VcUgC+iyTUINCuxzwjoxnqNo3IQerx7cRh2
 EzCbLsTCTeLdoWPFsLNdF3SWzmRFiC9N2J6iHUluAHPYp+t7jiTawXG6lyGLBjsWSRl2
 qDyXtVYad1MtOiGWKzM40h2l8VUK79S9RIXHpeFM3DZEofxwfy4dVa8ssmx9I5/JA3qC
 0+98jG94KvuPX3+2SfeWRtwVLLRuRe6Sc7h9wtd8td0lPLVtNQSZpjhtJYlxb1WZ4bug
 UqGHD4g8+vA4tmRtr7e3jK5Ukaou2vrXxNcm8bM4CU4XAulapy8iUySwq8zQC/9QmZsR
 55wg==
X-Gm-Message-State: APjAAAVqe2G20N3Mnzi+ZMbmkw0qEDNXhNN5KvhOHTalzpQCF1SApXEv
 LkRGKC0dZ99ZC4k61RiDh4BL3rlMA7W6Hsf4ScQ=
X-Google-Smtp-Source: APXvYqyZX44KP8KyrKYjbftVk3v9tvMBauPrQM2DrzjdbRl9bk29XGi57aXb8kbJYJ7gjN++AEWIOtAqwZuebEyMV0c=
X-Received: by 2002:a6b:c98c:: with SMTP id
 z134mr10564224iof.276.1565615268128; 
 Mon, 12 Aug 2019 06:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190812070748.7315-1-lukma@denx.de>
In-Reply-To: <20190812070748.7315-1-lukma@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 12 Aug 2019 08:07:37 -0500
Message-ID: <CAHCN7xKhCgvO57UYZLm3bCH=dy0nNrsM2MFZyFZrH6dR139gcg@mail.gmail.com>
To: Lukasz Majewski <lukma@denx.de>
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Mans Rullgard <mans@mansr.com>, Vignesh R <vigneshr@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Pankit Garg <pankit.garg@nxp.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Tom Rini <trini@konsulko.com>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Abel Vesa <abel.vesa@nxp.com>,
 Sumit Garg <sumit.garg@nxp.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Heiko Schocher <hs@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Feng Li <feng.li_2@nxp.com>, Rajesh Bhagat <rajesh.bhagat@nxp.com>,
 Alison Wang <alison.wang@nxp.com>, Mian Yousaf Kaukab <ykaukab@suse.de>,
 York Sun <york.sun@nxp.com>, Stefano Babic <sbabic@denx.de>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Wen He <wen.he_1@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Simon Glass <sjg@chromium.org>, "Andrew F. Davis" <afd@ti.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH v1 0/4] spi: Split CONFIG_DM_SPI* to
	CONFIG_{SPL_TPL}DM_SPI*
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

On Mon, Aug 12, 2019 at 2:08 AM Lukasz Majewski <lukma@denx.de> wrote:
>
> This patch series introduces new SPL and TPL specific Kconfig entries for
> DM_SPI* options. Such change allows using the spi driver in SPL/TPL or
> U-Boot proper.
>
> First two patches - related to ls10{42}* NXP soc fix some issues with
> defining the DM_SPI* defines in <board>.h file instead of Kconfig.
>
> This series doesn't introduce build breaks, but board maintainers are kindly
> asked to check if their boards still boots.
>

FYI,  when I pulled the latest u-boot/master, this patch didn't apply
cleanly, so I ended up having to skip a few items that wouldn't impact
the da850-evm which boots from SPI flash.

From what I can tell, this seems to work just fine on the da850-evm

Tested-by: Adam Ford <aford173@gmail.com> #da850-evm

>
>
> Lukasz Majewski (4):
>   kconfig: Update comment regarding CONFIG_IS_ENABLED(FOO) for TPL
>   spi: Move DM_SPI_FLASH to Kconfig (for NXP's ls1043a)
>   spi: Move DM_SPI_FLASH and SPI_FLASH_DATAFLASH to Kconfig (for
>     ls1021aXXX)
>   spi: Convert CONFIG_DM_SPI* to CONFIG_$(SPL_TPL_)DM_SPI*
>
>  arch/arm/Kconfig                            | 23 +++++++++++++++++++++--
>  board/l+g/vinco/vinco.c                     |  4 ++--
>  cmd/sf.c                                    |  4 ++--
>  cmd/spi.c                                   |  6 +++---
>  common/spl/Kconfig                          | 28 ++++++++++++++++++++++++++++
>  configs/am57xx_evm_defconfig                |  2 ++
>  configs/am57xx_hs_evm_defconfig             |  2 ++
>  configs/am57xx_hs_evm_usb_defconfig         |  2 ++
>  configs/axm_defconfig                       |  2 ++
>  configs/chromebook_link64_defconfig         |  2 ++
>  configs/chromebook_samus_tpl_defconfig      |  4 ++++
>  configs/dra7xx_evm_defconfig                |  2 ++
>  configs/dra7xx_hs_evm_defconfig             |  2 ++
>  configs/dra7xx_hs_evm_usb_defconfig         |  2 ++
>  configs/imx28_xea_defconfig                 |  2 ++
>  configs/j721e_evm_a72_defconfig             |  2 ++
>  configs/j721e_evm_r5_defconfig              |  2 ++
>  configs/ls1021aiot_qspi_defconfig           |  2 ++
>  configs/ls1021aiot_sdcard_defconfig         |  2 ++
>  configs/ls1021aqds_qspi_defconfig           |  1 +
>  configs/ls1021aqds_sdcard_qspi_defconfig    |  1 +
>  configs/ls1021atwr_qspi_defconfig           |  1 +
>  configs/sama5d2_xplained_spiflash_defconfig |  2 ++
>  configs/sama5d3xek_spiflash_defconfig       |  7 ++++---
>  configs/sama5d4_xplained_spiflash_defconfig |  2 ++
>  configs/sama5d4ek_spiflash_defconfig        |  2 ++
>  configs/stm32mp15_basic_defconfig           |  2 ++
>  configs/taurus_defconfig                    |  2 ++
>  drivers/mtd/spi/Makefile                    |  4 ++--
>  drivers/mtd/spi/sf_probe.c                  |  8 ++++----
>  drivers/net/fm/fm.c                         |  4 ++--
>  drivers/spi/Makefile                        |  2 +-
>  drivers/spi/atmel_spi.c                     |  4 ++--
>  drivers/spi/davinci_spi.c                   |  6 +++---
>  drivers/spi/fsl_dspi.c                      |  5 +++--
>  drivers/spi/kirkwood_spi.c                  |  2 +-
>  drivers/spi/mxc_spi.c                       |  6 +++---
>  drivers/spi/omap3_spi.c                     |  4 ++--
>  drivers/spi/sh_qspi.c                       |  4 ++--
>  env/sf.c                                    |  2 +-
>  include/configs/ls1021aiot.h                |  6 ------
>  include/configs/ls1021aqds.h                |  8 --------
>  include/configs/ls1021atwr.h                |  5 -----
>  include/configs/ls1043a_common.h            |  2 --
>  include/linux/kconfig.h                     |  2 ++
>  include/spi.h                               |  8 ++++----
>  include/spi_flash.h                         |  2 +-
>  test/dm/spi.c                               |  2 +-
>  48 files changed, 137 insertions(+), 64 deletions(-)
>
> --
> 2.11.0
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

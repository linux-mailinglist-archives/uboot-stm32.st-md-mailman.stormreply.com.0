Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1767B77A68A
	for <lists+uboot-stm32@lfdr.de>; Sun, 13 Aug 2023 15:36:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9431AC6B461;
	Sun, 13 Aug 2023 13:36:58 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B630C6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Aug 2023 13:36:57 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-d6b0c2cca0aso149077276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Aug 2023 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691933817; x=1692538617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QiDweHi3PQs3a4JzeYfqFTn6Ulf0UKV0embk82M+si8=;
 b=kBcZgEwI72p0hsoh85ABhgYLaanrQr929v7fG1WFWD4FgxbTNG4+JejbgeoF2ngKdS
 uQ+H8lfs5acipnX8QO7s3L7ZEVXRUi5muWCkEDVkXRD/EbnsFk4HfQxd9arNXDBXOIh1
 hlvZ+wf6LSzFAdOivHAYRVI3UDQszjnxAO0Wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691933817; x=1692538617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QiDweHi3PQs3a4JzeYfqFTn6Ulf0UKV0embk82M+si8=;
 b=QvwTlGkThbh1kNN14ShxYqMZM7INqANF4KkSFaLc8TsjsSxGu2q4d8TnbtWXw3PbMd
 G8M1OwQpsEeHEeak3m3LJ+zDU8wuvzFG33WQC0Yk5836vPCYHhxJc1OBf13+UujknjQh
 y69UvLSp6i6pT4Rys0RupYH52U3tDq9j6VWI5WcW8PoY/pVgXTblf4Rbgj+p0tSYJiAM
 QIVfl6ESJnbdF9r/JvZeCX10z5vvMLHDswaQT3cTaPopHG787p4k+rYj1mq8Fk3dRjrf
 p3g+Nb2DsywIlR6doMHI2VVVKu842qYEBzpPl3t7ti2idaxTBRCC71QTIyH2RSSNJqMZ
 gv+Q==
X-Gm-Message-State: AOJu0YxmMNAQQcPTnYT7dojP9A4kl4Gl8g4ipmT+OVv6AX2cy2Wm+Y0K
 K4qwqJSD1DK56o0mhr95f/KqqNZPM8v+7kmoiRVx8Q==
X-Google-Smtp-Source: AGHT+IE7s9dBO9GwlZcJmwxLVkKWl6H6a37Chx4HafpEZUgHbh/4nWtErTiNIEGjnkRs4mK0IODU+undH/ahe19/tZ4=
X-Received: by 2002:a25:5c7:0:b0:d4e:ea00:dfb6 with SMTP id
 190-20020a2505c7000000b00d4eea00dfb6mr7319551ybf.58.1691933816717; Sun, 13
 Aug 2023 06:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230813050011.9345-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20230813050011.9345-1-heinrich.schuchardt@canonical.com>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 13 Aug 2023 07:36:36 -0600
Message-ID: <CAPnjgZ1fxfxUT2g8wfi9YoJt4K2EDgCzy10Tv_D5p3T2yB-dVg@mail.gmail.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>, Fedor Ross <fedor.ross@ifm.com>,
 u-boot@lists.denx.de, "NXP i . MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Yanhong Wang <yanhong.wang@starfivetech.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Michal Simek <michal.simek@amd.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Michal Suchanek <msuchanek@suse.de>, Peter Robinson <pbrobinson@gmail.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>, Ovidiu Panait <ovpanait@gmail.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Nikhil M Jain <n-jain1@ti.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Stefano Babic <sbabic@denx.de>,
 Olaf Mandel <o.mandel@menlosystems.com>, Matthias Brugger <mbrugger@suse.com>,
 Leo <ycliang@andestech.com>, Aaron Williams <awilliams@marvell.com>,
 Paul Burton <paul.burton@mips.com>, Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] common: return type
	board_get_usable_ram_top
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

Hi Heinrich,

On Sat, 12 Aug 2023 at 23:01, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> board_get_usable_ram_top() returns a physical address that is stored in
> gd->ram_top. The return type of the function should be phys_addr_t like the
> current type of gd->ram_top.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  arch/arm/mach-imx/imx8m/soc.c           | 2 +-
>  arch/arm/mach-mvebu/arm64-common.c      | 2 +-
>  arch/arm/mach-rockchip/sdram.c          | 2 +-
>  arch/arm/mach-stm32mp/dram_init.c       | 2 +-
>  arch/arm/mach-sunxi/board.c             | 2 +-
>  arch/arm/mach-tegra/board2.c            | 2 +-
>  arch/mips/mach-jz47xx/jz4780/jz4780.c   | 2 +-
>  arch/mips/mach-octeon/dram.c            | 2 +-
>  arch/riscv/cpu/fu540/dram.c             | 2 +-
>  arch/riscv/cpu/fu740/dram.c             | 2 +-
>  arch/riscv/cpu/generic/dram.c           | 2 +-
>  arch/riscv/cpu/jh7110/dram.c            | 2 +-
>  arch/x86/cpu/broadwell/sdram.c          | 2 +-
>  arch/x86/cpu/coreboot/sdram.c           | 2 +-
>  arch/x86/cpu/efi/payload.c              | 2 +-
>  arch/x86/cpu/efi/sdram.c                | 2 +-
>  arch/x86/cpu/ivybridge/sdram.c          | 2 +-
>  arch/x86/cpu/qemu/dram.c                | 2 +-
>  arch/x86/cpu/quark/dram.c               | 2 +-
>  arch/x86/cpu/slimbootloader/sdram.c     | 2 +-
>  arch/x86/cpu/tangier/sdram.c            | 2 +-
>  arch/x86/include/asm/u-boot-x86.h       | 2 +-
>  arch/x86/lib/fsp1/fsp_dram.c            | 2 +-
>  arch/x86/lib/fsp2/fsp_dram.c            | 2 +-
>  board/broadcom/bcmns3/ns3.c             | 2 +-
>  board/imgtec/boston/ddr.c               | 2 +-
>  board/menlo/m53menlo/m53menlo.c         | 2 +-
>  board/raspberrypi/rpi/rpi.c             | 2 +-
>  board/ti/am65x/evm.c                    | 2 +-
>  board/ti/j721e/evm.c                    | 2 +-
>  board/ti/j721s2/evm.c                   | 2 +-
>  board/toradex/verdin-am62/verdin-am62.c | 2 +-
>  board/xilinx/common/board.c             | 2 +-
>  common/board_f.c                        | 2 +-
>  include/init.h                          | 2 +-
>  35 files changed, 35 insertions(+), 35 deletions(-)

While you are here, could you please fix the function comment?

[..]

> diff --git a/include/init.h b/include/init.h
> index 8873081685..b1e1451166 100644
> --- a/include/init.h
> +++ b/include/init.h
> @@ -304,7 +304,7 @@ int show_board_info(void);
>   *
>   * @param total_size   Size of U-Boot (unused?)

It seems confused about the param, and we should have a return value.

Also should explain what this function is used for.

>   */
> -phys_size_t board_get_usable_ram_top(phys_size_t total_size);
> +phys_addr_t board_get_usable_ram_top(phys_size_t total_size);
>
>  int board_early_init_f(void);
>
> --
> 2.40.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

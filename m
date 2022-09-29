Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2185EF2E9
	for <lists+uboot-stm32@lfdr.de>; Thu, 29 Sep 2022 12:01:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16570C640FF;
	Thu, 29 Sep 2022 10:01:05 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27D72C640FE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 10:01:03 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id q10so1082166oib.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9FtF2noGH/UFMlEScIwy0cJnThO+SsszMDhtVFj4FmM=;
 b=FDIAk2Rzx6Wgi6oF+c1T0CSfDmVoULMxWXHu9dSePOcfYtL2tUr4+iyhJdDl4hZV7p
 PuzfoCDbM3jX3p2OVmlpqb4CqsGX2Q4tYDS2tu1sXQLXkGwSTHJUCjUSlLYkgCQB7bnm
 6UOIbnJJB7+Qz43BjaFoRafWRdfXSsV0IAQZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9FtF2noGH/UFMlEScIwy0cJnThO+SsszMDhtVFj4FmM=;
 b=OBQ8L+CkxlYGqR5M4KtLd//R0rdPe6nH+EGR0vfnSxKT/fw8mFojhdg6c+xjOGaE0B
 pTRfwzbqX/BsTs4xyuc59mGyiw6FWtFQUrz/iFXmk7GnaChCJWXx9cxHoQf8XsGVCMKV
 CQ9a54/MwjzkkKDL8BnGAA7SL6WuLBs2+oM5vjVp8aotn2ttG8fQiLk2M8x5xslDn+mq
 xKxstDk5rN0pKv0bV4LTitmmz2ydn/cXReyaBNM8KLZ1AjiuSwU4lhKb+/58N7hgTd+0
 GMusVrK+p2lf4BlHS4VSYtE9ouJQQWGe0sw4oWNAR3FI4Z/l4zAeDWDK1whT6WJ1YCZG
 oQcg==
X-Gm-Message-State: ACrzQf2XBjcm9C+xIQNw0T7CCcgG9mWXRL/pYbtgNuuxd44DLTVejiRo
 /qzMNX/a4u+BDDF2Op/THmlMPGUSDPy8L+j0Eu2H+w==
X-Google-Smtp-Source: AMsMyM41qUuZ9TYG06FH2RBYHPgw7nqPVnkm2wPd7t3UlU8I4M5rvq78vmbzu7X8qETGcs4ww6Kf/DNcQ3Fv66QXX+E=
X-Received: by 2002:a05:6808:d53:b0:351:1cab:9c29 with SMTP id
 w19-20020a0568080d5300b003511cab9c29mr1150855oik.64.1664445661704; Thu, 29
 Sep 2022 03:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664093812.git.msuchanek@suse.de>
 <cover.1664314042.git.msuchanek@suse.de>
 <bb147eca1363500941ffae34c8987031e0a54a30.1664314043.git.msuchanek@suse.de>
In-Reply-To: <bb147eca1363500941ffae34c8987031e0a54a30.1664314043.git.msuchanek@suse.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 29 Sep 2022 04:00:44 -0600
Message-ID: <CAPnjgZ1wnw5MdNO22Y06+pAr5v=6KWorqZaA6aEycTof=aTBVQ@mail.gmail.com>
To: Michal Suchanek <msuchanek@suse.de>
Cc: Peng Fan <peng.fan@nxp.com>, Anatolij Gustschin <agust@denx.de>,
 Liviu Dudau <liviu.dudau@foss.arm.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 "moderated list:ARM STM STM32MP" <uboot-stm32@st-md-mailman.stormreply.com>,
 Matthias Brugger <mbrugger@suse.com>, Ramon Fried <rfried.dev@gmail.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Bin Meng <bmeng.cn@gmail.com>, Tom Warren <twarren@nvidia.com>,
 Andrew Scull <ascull@google.com>, Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v5 10/15] dm: treewide: Use
 uclass_first_device_err when accessing one device
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

On Tue, 27 Sept 2022 at 15:38, Michal Suchanek <msuchanek@suse.de> wrote:
>
> There is a number of users that use uclass_first_device to access the
> first and (assumed) only device in uclass.
>
> Some check the return value of uclass_first_device and also that a
> device was returned which is exactly what uclass_first_device_err does.
>
> Some are not checking that a device was returned and can potentially
> crash if no device exists in the uclass. Finally there is one that
> returns NULL on error either way.
>
> Convert all of these to use uclass_first_device_err instead, the return
> value will be removed from uclass_first_device in a later patch.
>
> Also print the symbolic error when the return value is printed.
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  arch/arm/mach-omap2/am33xx/board.c        |  4 ++--
>  arch/x86/cpu/broadwell/cpu.c              |  4 +---
>  arch/x86/cpu/intel_common/cpu.c           |  4 +---
>  arch/x86/lib/pinctrl_ich6.c               |  4 +---
>  board/intel/cougarcanyon2/cougarcanyon2.c |  4 +---
>  drivers/mmc/omap_hsmmc.c                  |  2 +-
>  drivers/serial/serial-uclass.c            |  2 +-
>  drivers/serial/serial_bcm283x_mu.c        |  2 +-
>  drivers/serial/serial_bcm283x_pl011.c     |  2 +-
>  drivers/sysreset/sysreset_ast.c           |  2 +-
>  drivers/video/exynos/exynos_fb.c          | 24 ++++++++++-------------
>  drivers/video/mali_dp.c                   |  2 +-
>  drivers/video/stm32/stm32_dsi.c           |  6 ++++--
>  drivers/video/tegra124/dp.c               |  7 ++++---
>  lib/acpi/acpi_table.c                     |  2 +-
>  lib/efi_loader/efi_gop.c                  |  2 +-
>  net/eth-uclass.c                          |  4 ++--
>  test/boot/bootmeth.c                      |  2 +-
>  test/dm/acpi.c                            | 14 ++++++-------
>  test/dm/devres.c                          |  4 ++--
>  test/dm/i2c.c                             |  8 ++++----
>  test/dm/virtio_device.c                   |  8 ++++----
>  test/dm/virtio_rng.c                      |  2 +-
>  test/fuzz/cmd_fuzz.c                      |  2 +-
>  test/fuzz/virtio.c                        |  2 +-
>  25 files changed, 55 insertions(+), 64 deletions(-)

With the errno change dropped:

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

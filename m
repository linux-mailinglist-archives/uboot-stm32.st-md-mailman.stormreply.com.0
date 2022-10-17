Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63425601B45
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Oct 2022 23:29:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17253C63327;
	Mon, 17 Oct 2022 21:29:22 +0000 (UTC)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EE0FC63325
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 21:29:19 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id a66so6021842vkc.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:references:in-reply-to:from:sender
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WWXktrkvxQB/a7sk4u85dRY8tKD9nMvAxfloNvVKT5c=;
 b=PZq6dFy/BUxNHII+QHZZrVGD0l9vSnJNa77pPuwQmMpYh8zVlK3yrQeYnOMcX4VXlu
 GEOsqtoVdxH9GFUUTq8aMTqImfKpp4YoJZ0w1NA+ImWFQUITHA6n8KXrwrv1NCoyIzJM
 oFq7QgLSBUCNXphE/pCvQDA+l1MRV+UpNwCN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:references:in-reply-to:from:sender
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WWXktrkvxQB/a7sk4u85dRY8tKD9nMvAxfloNvVKT5c=;
 b=VuqppU7PAOJDURIoBZUJG8oxbBlS+5t6qM60D34N7FvpD0LZ7VD/mRLXqW5zlkC3Ni
 elb8lv4qRA5lYluPnUoYXu+f3l7T690ABrVdjuckaIj0hAMPyKBr8epIJW+2uLYULPmI
 /xwyPY9qBWMqolxCYFcOLaM8A6QQU7xS1TAa18uUuvBH+hklKBUSUHo900FqssjFUxZR
 +OdPzYAImjXpciBGWVaiHK5yif3Hjty2Bcv+AbFEyz3F4fADNNf2MbHdp8PqnT9vTOkq
 wbM+ejZIRm5JD8HgnWy1z0L+Zt4emjMECaF1mXbExDFe6KwUJ/8OR/wQEz3hIv/vppS0
 +Zdw==
X-Gm-Message-State: ACrzQf0ALXZVx9HZO5gMPI/tArRE8zpQuwOa350D5vsCD+87ZXK2WK9e
 VfI0lhw60NK87b9Z2gAk4826y/jGWPSBkWUGQ47Oyw==
X-Google-Smtp-Source: AMsMyM4erxW4HxPBFojBfmfkPrT0orGw4wQY9hIzAL/chetfKgRizTaJGLbJilaZd1SvsH+4/+09oHfH3XJbFE/RQzw=
X-Received: by 2002:a1f:6088:0:b0:3af:933:ba4a with SMTP id
 u130-20020a1f6088000000b003af0933ba4amr5284676vkb.28.1666042158675; Mon, 17
 Oct 2022 14:29:18 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Oct 2022 14:29:15 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <e2a53ad0b2112945b159b66d20d96dd811b4e525.1665604425.git.msuchanek@suse.de>
References: <e2a53ad0b2112945b159b66d20d96dd811b4e525.1665604425.git.msuchanek@suse.de>
 <cover.1664314042.git.msuchanek@suse.de>
 <cover.1665604425.git.msuchanek@suse.de>
Date: Mon, 17 Oct 2022 14:29:15 -0700
X-Google-Sender-Auth: 3hNWallRhd27Hv1aFdHpPwFCwao
Message-ID: <CAPnjgZ34hNquqK=tSQAXKSeeHf0vvEdqYQnzQTSmrzc7ns_1Uw@mail.gmail.com>
To: Michal Suchanek <msuchanek@suse.de>
Cc: Peng Fan <peng.fan@nxp.com>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 "moderated list:ARM STM STM32MP" <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Mark Kettenis <kettenis@openbsd.org>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ramon Fried <rfried.dev@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Heiko Schocher <hs@denx.de>, Matthias Brugger <mbrugger@suse.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Andrew Scull <ascull@google.com>
Subject: Re: [Uboot-stm32] [PATCH v6 10/20] dm: treewide: Use
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

There is a number of users that use uclass_first_device to access the
first and (assumed) only device in uclass.

Some check the return value of uclass_first_device and also that a
device was returned which is exactly what uclass_first_device_err does.

Some are not checking that a device was returned and can potentially
crash if no device exists in the uclass. Finally there is one that
returns NULL on error either way.

Convert all of these to use uclass_first_device_err instead, the return
value will be removed from uclass_first_device in a later patch.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
v6: drop errno_str
---
 arch/arm/mach-omap2/am33xx/board.c        |  4 ++--
 arch/x86/cpu/broadwell/cpu.c              |  4 +---
 arch/x86/cpu/intel_common/cpu.c           |  4 +---
 arch/x86/lib/pinctrl_ich6.c               |  4 +---
 board/intel/cougarcanyon2/cougarcanyon2.c |  4 +---
 drivers/mmc/omap_hsmmc.c                  |  2 +-
 drivers/serial/serial-uclass.c            |  2 +-
 drivers/serial/serial_bcm283x_mu.c        |  2 +-
 drivers/serial/serial_bcm283x_pl011.c     |  2 +-
 drivers/sysreset/sysreset_ast.c           |  2 +-
 drivers/video/exynos/exynos_fb.c          | 14 +++-----------
 drivers/video/mali_dp.c                   |  2 +-
 drivers/video/stm32/stm32_dsi.c           |  2 +-
 drivers/video/tegra124/dp.c               |  4 ++--
 lib/acpi/acpi_table.c                     |  2 +-
 lib/efi_loader/efi_gop.c                  |  2 +-
 net/eth-uclass.c                          |  4 ++--
 test/boot/bootmeth.c                      |  2 +-
 test/dm/acpi.c                            | 14 +++++++-------
 test/dm/devres.c                          |  4 ++--
 test/dm/i2c.c                             |  8 ++++----
 test/dm/virtio_device.c                   |  8 ++++----
 test/dm/virtio_rng.c                      |  2 +-
 test/fuzz/cmd_fuzz.c                      |  2 +-
 test/fuzz/virtio.c                        |  2 +-
 25 files changed, 43 insertions(+), 59 deletions(-)

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

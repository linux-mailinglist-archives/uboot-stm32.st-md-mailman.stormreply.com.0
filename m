Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC165EBB2A
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Sep 2022 09:10:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 773FAC6334A;
	Tue, 27 Sep 2022 07:10:52 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C255CC01E99
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Sep 2022 08:28:34 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D0F3A1FD46;
 Sun, 25 Sep 2022 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664094513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eow8xUEMDUE6FQbbJUMhWi1sEuwn2YpWrhy9GRfVGxU=;
 b=yW93g+H83adqvHkkFvIpVpMynU+ouYUSCAO+Xuk3m827IeXZ4CV9H5oNB/HtfAAs9iVJEQ
 WvB8cyINeQH8KNHj712K/0lAqRZupnUlwCperL89kVZw7NDbLTJOqLG2RUyxuGlQKOCruR
 epr3y3IqEN612GkxVC8LznFKVnR4JcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664094513;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eow8xUEMDUE6FQbbJUMhWi1sEuwn2YpWrhy9GRfVGxU=;
 b=Z/MEVso9HfzuVMjtXNXpgh7d3denWZys6cB5I1mH8oIyQRoqDpGRRJ39pMzpL7T3g37W4x
 kf5i7Cd6DCRuC0Cg==
Received: from naga.suse.cz (unknown [10.100.224.114])
 by relay2.suse.de (Postfix) with ESMTP id 970D42C175;
 Sun, 25 Sep 2022 08:28:30 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: u-boot@lists.denx.de
Date: Sun, 25 Sep 2022 10:27:53 +0200
Message-Id: <cover.1664093812.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <CAPnjgZ3Of8+p8jbXiO1-tmiN2+iM7fTTPKz3rkmTJ98Bxk5uWQ@mail.gmail.com>
References: <CAPnjgZ3Of8+p8jbXiO1-tmiN2+iM7fTTPKz3rkmTJ98Bxk5uWQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 27 Sep 2022 07:10:52 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>, Eddie James <eajames@linux.ibm.com>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 "moderated list:ARM STM STM32MP" <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Vyacheslav Bocharov <adeep@lexina.in>,
 Samuel Holland <samuel@sholland.org>,
 Samuel Dionne-Riel <samuel@dionne-riel.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Diego Rondini <diego.rondini@kynetics.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 Jason Liu <jason.hui.liu@nxp.com>, Michal Suchanek <msuchanek@suse.de>,
 Marek Vasut <marex@denx.de>, Anatolij Gustschin <agust@denx.de>,
 Matthias Brugger <mbrugger@suse.com>, Ovidiu Panait <ovpanait@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Mark Kettenis <kettenis@openbsd.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andrew Scull <ascull@google.com>,
 Vabhav Sharma <vabhav.sharma@nxp.com>,
 =?UTF-8?q?Viktor=20K=C5=99iv=C3=A1k?= <viktor.krivak@gmail.com>,
 Tomas Hlavacek <tmshlvck@gmail.com>, Michal Simek <michal.simek@amd.com>,
 =?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
 Heiko Schocher <hs@denx.de>, Alexander Dahl <ada@thorsis.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <sean.anderson@seco.com>, Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [Uboot-stm32] [PATCH v4 00/21] Do not stop uclass iteration on error
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

Hello,

this patch series fixes the simple uclass iterators to be usable for
iterating uclasses even if some devices fail to probe.

Before this series when a probe error happens an error is returned
without any device pointer, and iteration cannot continue to devices
that happen to be after the failing device in the uclass list.

This is rarely expected, nor clearly documented, and for the most part
not useful in any way.

The first four patches are independent fixes, the remaining until the
last remove problematic iterator use.

All but the last are new in v4.

Thanks

Michal

Michal Suchanek (21):
  dm: pci: Fix doc typo first -> next
  dm: core: Add note about device_probe idempotence
  dm: core: Document return value of device bind functions
  dm: blk: Add probe in blk_first_device/blk_next_device
  dm: core: Fix uclass_probe_all to really probe all devices
  dm: treewide: Do not opencode uclass_probe_all()
  dm: pci: Fix device PCI iteration
  bootstd: Fix listing boot devices
  usb: ether: Fix error handling in usb_ether_init
  stdio: Fix class iteration in stdio_add_devices()
  video: ipuv3: Fix error handling when getting the display
  w1: Fix bus counting in w1_get_bus
  w1: Clean up device iteration in w1_bus_find_dev
  dma: Eliminate unused variable in dma_get_cfg()
  cmd: List all uclass devices regardless of probe error
  dm: treewide: Use uclass_first_device_err when accessing one device
  dm: treewide: Use uclass_next_device_err when accessing second device
  dm: blk: Do not use uclass_next_device_err
  dm: treewide: Do not use the return value of simple uclass iterator
  dm: core: Switch uclass_*_device_err to use uclass_*_device_check
  dm: core: Do not stop uclass iteration on error

 arch/arm/mach-k3/j721s2_init.c            |  2 +-
 arch/arm/mach-omap2/am33xx/board.c        |  4 +-
 arch/x86/cpu/broadwell/cpu.c              |  4 +-
 arch/x86/cpu/intel_common/cpu.c           |  4 +-
 arch/x86/lib/pinctrl_ich6.c               |  4 +-
 board/atmel/common/mac_eeprom.c           |  2 +-
 board/intel/cougarcanyon2/cougarcanyon2.c |  4 +-
 boot/bootdev-uclass.c                     |  7 +--
 cmd/adc.c                                 | 22 ++++----
 cmd/demo.c                                | 16 +++---
 cmd/gpio.c                                | 15 ++++--
 cmd/pmic.c                                | 15 +++---
 cmd/regulator.c                           | 13 ++---
 cmd/virtio.c                              |  9 ++--
 common/stdio.c                            | 33 +++++-------
 drivers/block/blk-uclass.c                | 62 ++++++++++-------------
 drivers/core/uclass.c                     | 56 ++++++++++----------
 drivers/cpu/cpu-uclass.c                  | 20 ++------
 drivers/dma/dma-uclass.c                  |  7 ++-
 drivers/gpio/gpio-uclass.c                | 14 +++--
 drivers/mmc/omap_hsmmc.c                  |  2 +-
 drivers/pci/pci-uclass.c                  | 19 ++-----
 drivers/serial/serial-uclass.c            |  2 +-
 drivers/serial/serial_bcm283x_mu.c        |  2 +-
 drivers/serial/serial_bcm283x_pl011.c     |  2 +-
 drivers/sysreset/sysreset_ast.c           |  2 +-
 drivers/usb/gadget/ether.c                | 11 ++--
 drivers/video/exynos/exynos_fb.c          | 24 ++++-----
 drivers/video/imx/mxc_ipuv3_fb.c          |  9 ++--
 drivers/video/mali_dp.c                   |  2 +-
 drivers/video/stm32/stm32_dsi.c           |  6 ++-
 drivers/video/tegra124/dp.c               |  7 +--
 drivers/virtio/virtio-uclass.c            | 15 +-----
 drivers/w1/w1-uclass.c                    | 29 +++++------
 include/dm/device-internal.h              |  4 +-
 include/dm/lists.h                        |  2 +
 include/dm/uclass.h                       | 35 +++++++------
 include/pci.h                             |  2 +-
 lib/acpi/acpi_table.c                     |  2 +-
 lib/efi_loader/efi_gop.c                  |  2 +-
 net/eth-uclass.c                          |  6 ++-
 test/boot/bootmeth.c                      |  2 +-
 test/dm/acpi.c                            | 14 ++---
 test/dm/core.c                            | 27 +++-------
 test/dm/devres.c                          |  4 +-
 test/dm/i2c.c                             |  8 +--
 test/dm/test-fdt.c                        | 27 +++++++---
 test/dm/virtio_device.c                   |  8 +--
 test/dm/virtio_rng.c                      |  2 +-
 test/fuzz/cmd_fuzz.c                      |  2 +-
 test/fuzz/virtio.c                        |  2 +-
 test/test-main.c                          | 11 +---
 52 files changed, 275 insertions(+), 330 deletions(-)

-- 
2.37.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

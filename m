Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCC35FCBBF
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 21:58:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC876C640F2;
	Wed, 12 Oct 2022 19:58:29 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 719A2C0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 19:58:28 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D82EA21DBA;
 Wed, 12 Oct 2022 19:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665604707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/sMWdTjbzC0gro8STZy4Jgj0MJvaSW0TzmJrKSWZJo=;
 b=UkuFgx6IqWhzz9giISffjsnDecXQckleM8k1PXurGaN46DXHzQazGnl6q/hC8Ub7m3zFd4
 uZkivjm21WwE4Op6QncT93U7hlHPobdeNMbhk7eKMabjkNV7iDs2LZaqHjISaThTEs2a48
 4DcersPTIovUPRtDcIwevfhbSDTZDTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665604707;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/sMWdTjbzC0gro8STZy4Jgj0MJvaSW0TzmJrKSWZJo=;
 b=yCxD25jfIwD7WzMEw+oH0W1ByUZzLSSN2Udlk1c2ae4pGDCCz3+k+MkX0onBnEPHQHtNTS
 Mtcs43O0eZwDC6AA==
Received: from naga.suse.cz (unknown [10.100.224.114])
 by relay2.suse.de (Postfix) with ESMTP id 591382C141;
 Wed, 12 Oct 2022 19:58:24 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: u-boot@lists.denx.de
Date: Wed, 12 Oct 2022 21:57:49 +0200
Message-Id: <cover.1665604425.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1664314042.git.msuchanek@suse.de>
References: <cover.1664314042.git.msuchanek@suse.de>
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Liviu Dudau <liviu.dudau@foss.arm.com>,
 Andrew Jeffery <andrew@aj.id.au>, Pavel Herrmann <morpheus.ibis@gmail.com>,
 Eddie James <eajames@linux.ibm.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 "moderated list:ARM STM STM32MP" <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Vyacheslav Bocharov <adeep@lexina.in>,
 Samuel Dionne-Riel <samuel@dionne-riel.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Lukasz Majewski <lukma@denx.de>,
 Diego Rondini <diego.rondini@kynetics.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 Jason Liu <jason.hui.liu@nxp.com>, Michal Suchanek <msuchanek@suse.de>,
 Matthias Brugger <mbrugger@suse.com>, Ovidiu Panait <ovpanait@gmail.com>,
 Mark Kettenis <kettenis@openbsd.org>, Loic Poulain <loic.poulain@linaro.org>,
 Heiko Schocher <hs@denx.de>, Vabhav Sharma <vabhav.sharma@nxp.com>,
 =?UTF-8?q?Viktor=20K=C5=99iv=C3=A1k?= <viktor.krivak@gmail.com>,
 Tomas Hlavacek <tmshlvck@gmail.com>, Michal Simek <michal.simek@amd.com>,
 =?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
 Anatolij Gustschin <agust@denx.de>, Alexander Dahl <ada@thorsis.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <sean.anderson@seco.com>, Mario Six <mario.six@gdsys.cc>,
 Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Andrew Scull <ascull@google.com>
Subject: [Uboot-stm32] [PATCH v6 00/20] Do not stop uclass iteration on error
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

All but the last patch are new in v4 removing problematic iterator use.

v5:

Split off patches that can be applied independently

Fix uclass_foreach_dev_probe, pci_sriov_init, and sysinfo_get to work
after the uclass_first_device_err change.

Document that uclass_first_device_err and uclass_first_device_check can
return non-activated device on error.

Consolidate multiple similar cleanups into one patch.

v6:

Split off the fixups from uclass_*_device_err switch patch.

Thanks

Michal

Michal Suchanek (20):
  dm: core: Fix uclass_probe_all to really probe all devices
  dm: treewide: Do not opencode uclass_probe_all()
  dm: pci: Fix device PCI iteration
  bootstd: Fix listing boot devices
  usb: ether: Fix error handling in usb_ether_init
  stdio: Fix class iteration in stdio_add_devices()
  video: ipuv3: Fix error handling when getting the display
  w1: Fix bus counting in w1_get_bus
  cmd: List all uclass devices regardless of probe error
  dm: treewide: Use uclass_first_device_err when accessing one device
  dm: treewide: Use uclass_next_device_err when accessing second device
  dm: blk: Do not use uclass_next_device_err
  net: eth-uclass: Do not set device on error
  dm: pci: Update error handling in pci_sriov_init
  mpc83xx: gazerbeam: Update sysinfo_get error handling
  dm: core: Switch uclass_foreach_dev_probe to use simple iterator
  dm: core: Switch uclass_*_device_err to use uclass_*_device_check
  dm: core: Non-activated device may be returned from uclass iterators
    that provide error handling
  dm: treewide: Do not use the return value of simple uclass iterator
  dm: core: Do not stop uclass iteration on error

 arch/arm/mach-k3/j721s2_init.c            |  2 +-
 arch/arm/mach-omap2/am33xx/board.c        |  4 +-
 arch/x86/cpu/broadwell/cpu.c              |  4 +-
 arch/x86/cpu/intel_common/cpu.c           |  4 +-
 arch/x86/lib/pinctrl_ich6.c               |  4 +-
 board/atmel/common/mac_eeprom.c           |  2 +-
 board/gdsys/mpc8308/gazerbeam.c           | 12 +++--
 board/intel/cougarcanyon2/cougarcanyon2.c |  4 +-
 boot/bootdev-uclass.c                     |  4 +-
 cmd/adc.c                                 | 20 ++++----
 cmd/demo.c                                | 15 +++---
 cmd/gpio.c                                | 15 ++++--
 cmd/pmic.c                                | 15 +++---
 cmd/regulator.c                           | 13 +++---
 cmd/virtio.c                              |  9 ++--
 common/stdio.c                            | 32 ++++++-------
 drivers/block/blk-uclass.c                | 16 +++----
 drivers/core/uclass.c                     | 56 ++++++++++++-----------
 drivers/cpu/cpu-uclass.c                  | 20 ++------
 drivers/dma/dma-uclass.c                  |  7 ++-
 drivers/gpio/gpio-uclass.c                | 14 +++---
 drivers/mmc/omap_hsmmc.c                  |  2 +-
 drivers/pci/pci-uclass.c                  | 26 ++++-------
 drivers/serial/serial-uclass.c            |  2 +-
 drivers/serial/serial_bcm283x_mu.c        |  2 +-
 drivers/serial/serial_bcm283x_pl011.c     |  2 +-
 drivers/sysreset/sysreset_ast.c           |  2 +-
 drivers/usb/gadget/ether.c                | 11 ++---
 drivers/video/exynos/exynos_fb.c          | 14 ++----
 drivers/video/imx/mxc_ipuv3_fb.c          |  9 ++--
 drivers/video/mali_dp.c                   |  2 +-
 drivers/video/stm32/stm32_dsi.c           |  2 +-
 drivers/video/tegra124/dp.c               |  4 +-
 drivers/virtio/virtio-uclass.c            | 15 +-----
 drivers/w1/w1-uclass.c                    | 29 ++++++------
 include/dm/uclass.h                       | 49 ++++++++++----------
 lib/acpi/acpi_table.c                     |  2 +-
 lib/efi_loader/efi_gop.c                  |  2 +-
 net/eth-uclass.c                          |  6 ++-
 test/boot/bootmeth.c                      |  2 +-
 test/dm/acpi.c                            | 14 +++---
 test/dm/core.c                            | 27 +++--------
 test/dm/devres.c                          |  4 +-
 test/dm/i2c.c                             |  8 ++--
 test/dm/test-fdt.c                        | 46 ++++++++++++++-----
 test/dm/virtio_device.c                   |  8 ++--
 test/dm/virtio_rng.c                      |  2 +-
 test/fuzz/cmd_fuzz.c                      |  2 +-
 test/fuzz/virtio.c                        |  2 +-
 test/test-main.c                          | 11 +----
 50 files changed, 266 insertions(+), 313 deletions(-)

-- 
2.37.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

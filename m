Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D17ACBD5
	for <lists+uboot-stm32@lfdr.de>; Sun, 24 Sep 2023 22:40:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81F5CC6A5EA;
	Sun, 24 Sep 2023 20:40:21 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC547C65068
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 20:40:19 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-351250be257so9160665ab.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 13:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695588018; x=1696192818;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JRbLQkKNVodEaf+rEGPwgM3yWxwi0ZcnnEKENf0uc1Y=;
 b=XKxKy0XknM0tnJImz1DOr+tcm6y/q+HHQzzecQeDovTOxUSmRJVXZuJxxMaY7hEZF3
 dfijeo4jZvDdrxGxCkn6iRTQRlPkGlZGpDjhR4pZKaEAMDe8hlaXFJxjcAwcdjQT2Ps8
 PGjScmWcCohaaQslhYmZAEm0uyF+yzNEWvp0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695588018; x=1696192818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JRbLQkKNVodEaf+rEGPwgM3yWxwi0ZcnnEKENf0uc1Y=;
 b=S/DXuPljAGPsPsXBSTNl/qvj3q8I8yxKc7vCFzeJF6cOW0OFd2QjJ/c6NTaoF8oBPf
 0yTjFWk6n+pkb+9bbG+h3XXGQdv8Exvdt0c3t8n+Zw3pRInl4kasSiQbPK1l0UoVnSER
 wdqfx4Fv3IqEPNJGiXJHfH7I+TLPNtbhofWGuT6gMcNlteEhTZemU8xsBFCLEh4nUQx2
 K0dRxfgZYCuE04h4kvpIzWuaZ26P4nn//UsKdvAS6TWOWbfH5Ido5hGqAZPhTRTAeHgh
 AmlJQoEMTf2FaVdyfGNZ1X1uy93QyL5ZvFtrun0wGAL2ubwLJcZgO4XmRqQb3z4XKGHj
 BWHA==
X-Gm-Message-State: AOJu0YxnjZmroT8WezsgiUVhFVkUpYsB10lABFYnK2fx39r8VfUO7HVo
 DcG/KeDf/jSGgIJAhyUQ+VQ55w==
X-Google-Smtp-Source: AGHT+IGSWtDj8QdjL6Im7BYt1omjIV2qnUG5XmlkoabIW5US7/AAvHmrYqsmNuSEMdG6Fd6Im1SL/g==
X-Received: by 2002:a92:c5cb:0:b0:34d:f0b9:97fd with SMTP id
 s11-20020a92c5cb000000b0034df0b997fdmr5562840ilt.8.1695588018630; 
 Sun, 24 Sep 2023 13:40:18 -0700 (PDT)
Received: from sjg1.roam.corp.google.com (c-73-14-173-85.hsd1.co.comcast.net.
 [73.14.173.85]) by smtp.gmail.com with ESMTPSA id
 m11-20020a02cdcb000000b0043a1b74a0e3sm2311705jap.90.2023.09.24.13.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 13:40:18 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun, 24 Sep 2023 14:39:18 -0600
Message-ID: <20230924203953.1829820-1-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
Cc: Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Rick Chen <rick@andestech.com>, Joe Hershberger <joe.hershberger@ni.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Troy Kisky <troykiskyboundary@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Tom Rini <trini@konsulko.com>,
 Mark Kettenis <kettenis@openbsd.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Harald Seiler <hws@denx.de>, Alexey Romanov <avromanov@sberdevices.ru>,
 Michal Suchanek <msuchanek@suse.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Safae Ouajih <souajih@baylibre.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Evgeny Bachinin <EABachinin@sberdevices.ru>, Stefano Babic <sbabic@denx.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Anatolij Gustschin <agust@denx.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Tom Warren <twarren@nvidia.com>, Bin Meng <bmeng.cn@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Subject: [Uboot-stm32] [PATCH 00/25] Tidy up use of CONFIG_CMDLINE
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

It should be possible to disable CONFIG_CMDLINE and have all commands
and related functionality dropped from U-Boot. This is useful when
trying to reduce the size of U-Boot.

Recent changes have stopped this from working.

This series repairs the feature for sandbox and adds a test to stop it
breaking again.

Note that quite a lot of functionality is lost of CONFIG_CMDLINE is
disabled, e.g. networking and most booting options. Further work is
needed to make the option more generally useful.


Simon Glass (25):
  buildman: Use oldconfig when adjusting the config
  bootstd: Correct dependencies on CMDLINE
  autoboot: Correct dependencies on CMDLINE
  cmd: Add a few more dependencies on CMDLINE
  treewide: Correct use of long help
  test: Make UNIT_TEST depend on CMDLINE
  tegra: Change #ifdef for nop
  fastboot: Avoid depending on CMDLINE
  cli: Always build cli_getch
  cmd: Use an #ifdef around run_commandf()
  Move bootmenu_conv_key() into its own file
  armffa: Correct command help condition
  pxe: Depend on CMDLINE
  env: Split out non-command code into a new file
  console: Move SYS_PBSIZE into common/
  bootm: Allow building when cleanup functions are missing
  fdt: Move working_fdt into fdt_support
  net: Depend on CONFIG_CMDLINE
  log: Allow use without CONFIG_CMDLINE
  video: Allow use without CONFIG_CMDLINE
  video: Dont require the font command
  efi: Depend on CMDLINE for efi_loader
  cmd: Make all commands depend on CMDLINE
  sandbox: Avoid requiring cmdline
  sandbox: Add a test for disabling CONFIG_CMDLINE

 arch/Kconfig                               |   6 +-
 arch/arm/lib/bootm.c                       |   2 +
 arch/arm/mach-imx/cmd_dek.c                |   3 +-
 arch/arm/mach-imx/cmd_mfgprot.c            |   3 +-
 arch/arm/mach-imx/imx8/snvs_security_sc.c  |  10 ++
 arch/arm/mach-stm32mp/cmd_stm32key.c       |   2 +
 board/freescale/common/cmd_esbc_validate.c |   3 +-
 board/kontron/sl28/cmds.c                  |   2 +
 boot/Kconfig                               |  42 ++++---
 boot/bootm.c                               |  10 +-
 boot/fdt_support.c                         |   5 +
 cmd/Kconfig                                |  25 ++--
 cmd/Makefile                               |   2 +-
 cmd/adc.c                                  |   2 +
 cmd/arm/exception.c                        |   2 +
 cmd/arm/exception64.c                      |   2 +
 cmd/armffa.c                               |   2 +
 cmd/axi.c                                  |   2 +
 cmd/blob.c                                 |   2 +
 cmd/cyclic.c                               |   2 +
 cmd/fdt.c                                  |   5 -
 cmd/mux.c                                  |   2 +
 cmd/nvedit.c                               | 122 +------------------
 cmd/osd.c                                  |   2 +
 cmd/pcap.c                                 |   2 +
 cmd/riscv/exception.c                      |   2 +
 cmd/sandbox/exception.c                    |   2 +
 cmd/scp03.c                                |   2 +
 cmd/wdt.c                                  |   2 +
 cmd/x86/exception.c                        |   2 +
 common/Kconfig                             |   5 +
 common/Makefile                            |   3 +-
 common/cli.c                               |   2 +
 common/cli_getch.c                         |   1 +
 common/log.c                               |   4 +-
 common/menu.c                              |  40 -------
 common/menu_key.c                          |  49 ++++++++
 drivers/fastboot/fb_command.c              |   3 +-
 drivers/fastboot/fb_common.c               |  15 ++-
 drivers/video/Kconfig                      |   2 +-
 drivers/video/console_truetype.c           |   4 +
 env/Makefile                               |   1 +
 env/env_set.c                              | 132 +++++++++++++++++++++
 include/bootm.h                            |  15 ++-
 include/env_internal.h                     |  23 ++++
 include/k210/pll.h                         |   2 +-
 lib/efi_loader/Kconfig                     |   2 +
 net/Kconfig                                |   1 +
 test/Kconfig                               |   1 +
 test/py/tests/test_sandbox_opts.py         |  20 ++++
 tools/buildman/builder.py                  |   2 +-
 tools/buildman/builderthread.py            |   6 +
 tools/buildman/func_test.py                |   4 +-
 53 files changed, 388 insertions(+), 221 deletions(-)
 create mode 100644 common/menu_key.c
 create mode 100644 env/env_set.c
 create mode 100644 test/py/tests/test_sandbox_opts.py

-- 
2.42.0.515.g380fc7ccd1-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

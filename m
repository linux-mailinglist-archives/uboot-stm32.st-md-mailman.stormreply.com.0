Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C556FC9C8
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Nov 2019 16:21:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5301CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Nov 2019 15:21:31 +0000 (UTC)
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7487C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 14:54:27 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id y18so2629162ybs.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 06:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=88+NlE65oV76dMLUNd5rnorhZCxQgZzglK1C2tC7HF4=;
 b=JqV5RXgkwCbQX9bHhH+sSCfF4iRcAC3Uyc756xiE977XPqQFq2nNlIhkkoalKmuk+h
 eWt5Ibfc5Y4BGr1707CwYOa1JhGaFjiwQowXSVmk1wVR+1mOhGfTOAdSk+ZFY0v6CCy1
 hMNFj43Op8MgTe2AqM45pnfXubQ4OiUfuL4qbWZbLRdLozWU9vt+NwTz75yzQ1G+DNSb
 Qfnf4A+hNn6ypAUK02LJyuqJe4RqnwiGJ6Rn6iGN5RMSF6BdHiAdX2vEhai3mZZH4JnU
 /1X6ztHzsQBE3vjA1yHdv3dOvXGP8+b86RYPTRQhai2FZ2lbpCXgl7zXClQr3OJFfhBg
 Ijkg==
X-Gm-Message-State: APjAAAU5YPMQ4xG+kCXCuSxEFZgbOOBO70sx+KtfACuaBJpU4iF4vX3K
 dE/Xl2wH8SfWSkAVLTSJpQ==
X-Google-Smtp-Source: APXvYqxNjlnFASfvpY1Q+mId6WfGIe7jjaeXQH+hVXaHNqB9oUg/WCapDX0VBnG+AtrTcQDDElZnZw==
X-Received: by 2002:a25:1646:: with SMTP id 67mr7506334ybw.485.1573743264911; 
 Thu, 14 Nov 2019 06:54:24 -0800 (PST)
Received: from bill-the-cat.local
 (2606-a000-1401-86dd-7820-207b-f1ad-f723.inf6.spectrum.com.
 [2606:a000:1401:86dd:7820:207b:f1ad:f723])
 by smtp.gmail.com with ESMTPSA id w133sm2021462ywa.25.2019.11.14.06.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 06:54:23 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Date: Thu, 14 Nov 2019 09:54:15 -0500
Message-Id: <20191114145415.13187-5-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114145415.13187-1-trini@konsulko.com>
References: <20191114145415.13187-1-trini@konsulko.com>
X-Mailman-Approved-At: Thu, 14 Nov 2019 15:21:28 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 5/5] env: Finish migration of common ENV
	options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

- In ARMv8 NXP Layerscape platforms we also need to make use of
  CONFIG_SYS_RELOC_GD_ENV_ADDR now, do so.
- On ENV_IS_IN_REMOTE, CONFIG_ENV_OFFSET is never used, drop the define
  to 0.
- Add Kconfig entry for ENV_ADDR.
- Make ENV_ADDR / ENV_OFFSET depend on the env locations that use it.
- Add ENV_xxx_REDUND options that depend on their primary option and
  SYS_REDUNDAND_ENVIRONMENT
- On a number of PowerPC platforms, use SPL_ENV_ADDR not CONFIG_ENV_ADDR
  for the pre-main-U-Boot environment location.
- On ENV_IS_IN_SPI_FLASH, check not for CONFIG_ENV_ADDR being set but
  rather it being non-zero, as it will now be zero by default.
- Rework the env_offset absolute in env/embedded.o to not use
  CONFIG_ENV_OFFSET as it was the only use of ENV_OFFSET within
  ENV_IS_IN_FLASH.
- Migrate all platforms.

Cc: Wolfgang Denk <wd@denx.de>
Cc: Joe Hershberger <joe.hershberger@ni.com>
Cc: Patrick Delaunay <patrick.delaunay@st.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 arch/arm/cpu/armv8/fsl-layerscape/soc.c       |  2 +-
 board/freescale/b4860qds/spl.c                |  4 +-
 board/freescale/c29xpcie/spl.c                |  4 +-
 board/freescale/p1010rdb/spl.c                |  4 +-
 board/freescale/p1022ds/spl.c                 |  4 +-
 board/freescale/p1_p2_rdb_pc/spl.c            |  4 +-
 board/freescale/t102xqds/spl.c                |  8 +--
 board/freescale/t102xrdb/spl.c                |  8 +--
 board/freescale/t104xrdb/spl.c                |  8 +--
 board/freescale/t208xqds/spl.c                |  8 +--
 board/freescale/t208xrdb/spl.c                |  8 +--
 board/freescale/t4qds/spl.c                   |  6 +--
 board/freescale/t4rdb/spl.c                   |  4 +-
 configs/10m50_defconfig                       |  3 ++
 configs/3c120_defconfig                       |  3 ++
 configs/B4420QDS_NAND_defconfig               |  2 +
 configs/B4420QDS_SPIFLASH_defconfig           |  3 ++
 configs/B4420QDS_defconfig                    |  3 ++
 configs/B4860QDS_NAND_defconfig               |  2 +
 configs/B4860QDS_SECURE_BOOT_defconfig        |  1 +
 configs/B4860QDS_SPIFLASH_defconfig           |  3 ++
 configs/B4860QDS_SRIO_PCIE_BOOT_defconfig     |  2 +
 configs/B4860QDS_defconfig                    |  3 ++
 configs/BSC9131RDB_NAND_SYSCLK100_defconfig   |  2 +
 configs/BSC9131RDB_NAND_defconfig             |  2 +
 .../BSC9131RDB_SPIFLASH_SYSCLK100_defconfig   |  3 ++
 configs/BSC9131RDB_SPIFLASH_defconfig         |  3 ++
 ...BSC9132QDS_NAND_DDRCLK100_SECURE_defconfig |  1 +
 configs/BSC9132QDS_NAND_DDRCLK100_defconfig   |  2 +
 ...BSC9132QDS_NAND_DDRCLK133_SECURE_defconfig |  1 +
 configs/BSC9132QDS_NAND_DDRCLK133_defconfig   |  2 +
 .../BSC9132QDS_NOR_DDRCLK100_SECURE_defconfig |  1 +
 configs/BSC9132QDS_NOR_DDRCLK100_defconfig    |  3 ++
 .../BSC9132QDS_NOR_DDRCLK133_SECURE_defconfig |  1 +
 configs/BSC9132QDS_NOR_DDRCLK133_defconfig    |  3 ++
 ...C9132QDS_SDCARD_DDRCLK100_SECURE_defconfig |  1 +
 configs/BSC9132QDS_SDCARD_DDRCLK100_defconfig |  2 +
 ...C9132QDS_SDCARD_DDRCLK133_SECURE_defconfig |  1 +
 configs/BSC9132QDS_SDCARD_DDRCLK133_defconfig |  2 +
 ...132QDS_SPIFLASH_DDRCLK100_SECURE_defconfig |  1 +
 .../BSC9132QDS_SPIFLASH_DDRCLK100_defconfig   |  3 ++
 ...132QDS_SPIFLASH_DDRCLK133_SECURE_defconfig |  1 +
 .../BSC9132QDS_SPIFLASH_DDRCLK133_defconfig   |  3 ++
 configs/C29XPCIE_NAND_defconfig               |  2 +
 configs/C29XPCIE_NOR_SECBOOT_defconfig        |  1 +
 configs/C29XPCIE_SPIFLASH_SECBOOT_defconfig   |  1 +
 configs/C29XPCIE_SPIFLASH_defconfig           |  3 ++
 configs/C29XPCIE_defconfig                    |  3 ++
 configs/Cyrus_P5020_defconfig                 |  2 +
 configs/Cyrus_P5040_defconfig                 |  2 +
 configs/M5208EVBE_defconfig                   |  3 ++
 configs/M52277EVB_defconfig                   |  3 ++
 configs/M52277EVB_stmicro_defconfig           |  3 ++
 configs/M5235EVB_Flash32_defconfig            |  3 ++
 configs/M5235EVB_defconfig                    |  3 ++
 configs/M5249EVB_defconfig                    |  3 ++
 configs/M5253DEMO_defconfig                   |  3 ++
 configs/M5272C3_defconfig                     |  3 ++
 configs/M5275EVB_defconfig                    |  3 ++
 configs/M5282EVB_defconfig                    |  3 ++
 configs/M53017EVB_defconfig                   |  3 ++
 configs/M5329AFEE_defconfig                   |  3 ++
 configs/M5329BFEE_defconfig                   |  3 ++
 configs/M5373EVB_defconfig                    |  3 ++
 configs/M54418TWR_defconfig                   |  3 ++
 configs/M54418TWR_nand_mii_defconfig          |  1 +
 configs/M54418TWR_nand_rmii_defconfig         |  1 +
 configs/M54418TWR_nand_rmii_lowfreq_defconfig |  1 +
 configs/M54418TWR_serial_mii_defconfig        |  3 ++
 configs/M54418TWR_serial_rmii_defconfig       |  3 ++
 configs/M54451EVB_defconfig                   |  3 ++
 configs/M54451EVB_stmicro_defconfig           |  3 ++
 configs/M54455EVB_a66_defconfig               |  3 ++
 configs/M54455EVB_defconfig                   |  3 ++
 configs/M54455EVB_i66_defconfig               |  3 ++
 configs/M54455EVB_intel_defconfig             |  3 ++
 configs/M54455EVB_stm33_defconfig             |  3 ++
 configs/M5475AFE_defconfig                    |  3 ++
 configs/M5475BFE_defconfig                    |  3 ++
 configs/M5475CFE_defconfig                    |  3 ++
 configs/M5475DFE_defconfig                    |  3 ++
 configs/M5475EFE_defconfig                    |  3 ++
 configs/M5475FFE_defconfig                    |  3 ++
 configs/M5475GFE_defconfig                    |  3 ++
 configs/M5485AFE_defconfig                    |  3 ++
 configs/M5485BFE_defconfig                    |  3 ++
 configs/M5485CFE_defconfig                    |  3 ++
 configs/M5485DFE_defconfig                    |  3 ++
 configs/M5485EFE_defconfig                    |  3 ++
 configs/M5485FFE_defconfig                    |  3 ++
 configs/M5485GFE_defconfig                    |  3 ++
 configs/M5485HFE_defconfig                    |  3 ++
 configs/MCR3000_defconfig                     |  3 ++
 configs/MPC8308RDB_defconfig                  |  4 ++
 configs/MPC8313ERDB_33_defconfig              |  3 ++
 configs/MPC8313ERDB_66_defconfig              |  3 ++
 configs/MPC8313ERDB_NAND_33_defconfig         |  3 ++
 configs/MPC8313ERDB_NAND_66_defconfig         |  3 ++
 configs/MPC8315ERDB_defconfig                 |  3 ++
 configs/MPC8323ERDB_defconfig                 |  3 ++
 configs/MPC832XEMDS_ATM_defconfig             |  3 ++
 configs/MPC832XEMDS_HOST_33_defconfig         |  3 ++
 configs/MPC832XEMDS_HOST_66_defconfig         |  3 ++
 configs/MPC832XEMDS_SLAVE_defconfig           |  3 ++
 configs/MPC832XEMDS_defconfig                 |  3 ++
 configs/MPC8349EMDS_PCI64_defconfig           |  4 ++
 configs/MPC8349EMDS_SDRAM_defconfig           |  4 ++
 configs/MPC8349EMDS_SLAVE_defconfig           |  4 ++
 configs/MPC8349EMDS_defconfig                 |  4 ++
 configs/MPC8349ITXGP_defconfig                |  3 ++
 configs/MPC8349ITX_LOWBOOT_defconfig          |  3 ++
 configs/MPC8349ITX_defconfig                  |  3 ++
 configs/MPC837XEMDS_HOST_defconfig            |  3 ++
 configs/MPC837XEMDS_SLAVE_defconfig           |  3 ++
 configs/MPC837XEMDS_defconfig                 |  3 ++
 configs/MPC837XERDB_SLAVE_defconfig           |  3 ++
 configs/MPC837XERDB_defconfig                 |  3 ++
 configs/MPC8536DS_36BIT_defconfig             |  3 ++
 configs/MPC8536DS_SDCARD_defconfig            |  2 +
 configs/MPC8536DS_SPIFLASH_defconfig          |  3 ++
 configs/MPC8536DS_defconfig                   |  3 ++
 configs/MPC8541CDS_defconfig                  |  3 ++
 configs/MPC8541CDS_legacy_defconfig           |  3 ++
 configs/MPC8544DS_defconfig                   |  3 ++
 configs/MPC8548CDS_36BIT_defconfig            |  3 ++
 configs/MPC8548CDS_defconfig                  |  3 ++
 configs/MPC8548CDS_legacy_defconfig           |  3 ++
 configs/MPC8555CDS_defconfig                  |  3 ++
 configs/MPC8555CDS_legacy_defconfig           |  3 ++
 configs/MPC8568MDS_defconfig                  |  3 ++
 configs/MPC8569MDS_ATM_defconfig              |  3 ++
 configs/MPC8569MDS_defconfig                  |  3 ++
 configs/MPC8572DS_36BIT_defconfig             |  3 ++
 configs/MPC8572DS_defconfig                   |  3 ++
 configs/MPC8610HPCD_defconfig                 |  3 ++
 configs/MPC8641HPCN_36BIT_defconfig           |  3 ++
 configs/MPC8641HPCN_defconfig                 |  3 ++
 configs/MigoR_defconfig                       |  3 ++
 .../P1010RDB-PA_36BIT_NAND_SECBOOT_defconfig  |  1 +
 configs/P1010RDB-PA_36BIT_NAND_defconfig      |  2 +
 .../P1010RDB-PA_36BIT_NOR_SECBOOT_defconfig   |  1 +
 configs/P1010RDB-PA_36BIT_NOR_defconfig       |  3 ++
 configs/P1010RDB-PA_36BIT_SDCARD_defconfig    |  2 +
 ...010RDB-PA_36BIT_SPIFLASH_SECBOOT_defconfig |  1 +
 configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig  |  3 ++
 configs/P1010RDB-PA_NAND_SECBOOT_defconfig    |  1 +
 configs/P1010RDB-PA_NAND_defconfig            |  2 +
 configs/P1010RDB-PA_NOR_SECBOOT_defconfig     |  1 +
 configs/P1010RDB-PA_NOR_defconfig             |  3 ++
 configs/P1010RDB-PA_SDCARD_defconfig          |  2 +
 .../P1010RDB-PA_SPIFLASH_SECBOOT_defconfig    |  1 +
 configs/P1010RDB-PA_SPIFLASH_defconfig        |  3 ++
 .../P1010RDB-PB_36BIT_NAND_SECBOOT_defconfig  |  1 +
 configs/P1010RDB-PB_36BIT_NAND_defconfig      |  2 +
 .../P1010RDB-PB_36BIT_NOR_SECBOOT_defconfig   |  1 +
 configs/P1010RDB-PB_36BIT_NOR_defconfig       |  3 ++
 configs/P1010RDB-PB_36BIT_SDCARD_defconfig    |  2 +
 ...010RDB-PB_36BIT_SPIFLASH_SECBOOT_defconfig |  1 +
 configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig  |  3 ++
 configs/P1010RDB-PB_NAND_SECBOOT_defconfig    |  1 +
 configs/P1010RDB-PB_NAND_defconfig            |  2 +
 configs/P1010RDB-PB_NOR_SECBOOT_defconfig     |  1 +
 configs/P1010RDB-PB_NOR_defconfig             |  3 ++
 configs/P1010RDB-PB_SDCARD_defconfig          |  2 +
 .../P1010RDB-PB_SPIFLASH_SECBOOT_defconfig    |  1 +
 configs/P1010RDB-PB_SPIFLASH_defconfig        |  3 ++
 configs/P1020MBG-PC_36BIT_SDCARD_defconfig    |  2 +
 configs/P1020MBG-PC_36BIT_defconfig           |  3 ++
 configs/P1020MBG-PC_SDCARD_defconfig          |  2 +
 configs/P1020MBG-PC_defconfig                 |  3 ++
 configs/P1020RDB-PC_36BIT_NAND_defconfig      |  2 +
 configs/P1020RDB-PC_36BIT_SDCARD_defconfig    |  2 +
 configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig  |  3 ++
 configs/P1020RDB-PC_36BIT_defconfig           |  3 ++
 configs/P1020RDB-PC_NAND_defconfig            |  2 +
 configs/P1020RDB-PC_SDCARD_defconfig          |  2 +
 configs/P1020RDB-PC_SPIFLASH_defconfig        |  3 ++
 configs/P1020RDB-PC_defconfig                 |  3 ++
 configs/P1020RDB-PD_NAND_defconfig            |  2 +
 configs/P1020RDB-PD_SDCARD_defconfig          |  2 +
 configs/P1020RDB-PD_SPIFLASH_defconfig        |  3 ++
 configs/P1020RDB-PD_defconfig                 |  3 ++
 configs/P1020UTM-PC_36BIT_SDCARD_defconfig    |  2 +
 configs/P1020UTM-PC_36BIT_defconfig           |  3 ++
 configs/P1020UTM-PC_SDCARD_defconfig          |  2 +
 configs/P1020UTM-PC_defconfig                 |  3 ++
 configs/P1021RDB-PC_36BIT_NAND_defconfig      |  2 +
 configs/P1021RDB-PC_36BIT_SDCARD_defconfig    |  2 +
 configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig  |  3 ++
 configs/P1021RDB-PC_36BIT_defconfig           |  3 ++
 configs/P1021RDB-PC_NAND_defconfig            |  2 +
 configs/P1021RDB-PC_SDCARD_defconfig          |  2 +
 configs/P1021RDB-PC_SPIFLASH_defconfig        |  3 ++
 configs/P1021RDB-PC_defconfig                 |  3 ++
 configs/P1022DS_36BIT_NAND_defconfig          |  2 +
 configs/P1022DS_36BIT_SDCARD_defconfig        |  2 +
 configs/P1022DS_36BIT_SPIFLASH_defconfig      |  3 ++
 configs/P1022DS_36BIT_defconfig               |  3 ++
 configs/P1022DS_NAND_defconfig                |  2 +
 configs/P1022DS_SDCARD_defconfig              |  2 +
 configs/P1022DS_SPIFLASH_defconfig            |  3 ++
 configs/P1022DS_defconfig                     |  3 ++
 configs/P1023RDB_defconfig                    |  3 ++
 configs/P1024RDB_36BIT_defconfig              |  3 ++
 configs/P1024RDB_NAND_defconfig               |  2 +
 configs/P1024RDB_SDCARD_defconfig             |  2 +
 configs/P1024RDB_SPIFLASH_defconfig           |  3 ++
 configs/P1024RDB_defconfig                    |  3 ++
 configs/P1025RDB_36BIT_defconfig              |  3 ++
 configs/P1025RDB_NAND_defconfig               |  2 +
 configs/P1025RDB_SDCARD_defconfig             |  2 +
 configs/P1025RDB_SPIFLASH_defconfig           |  3 ++
 configs/P1025RDB_defconfig                    |  3 ++
 configs/P2020RDB-PC_36BIT_NAND_defconfig      |  2 +
 configs/P2020RDB-PC_36BIT_SDCARD_defconfig    |  2 +
 configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig  |  3 ++
 configs/P2020RDB-PC_36BIT_defconfig           |  3 ++
 configs/P2020RDB-PC_NAND_defconfig            |  2 +
 configs/P2020RDB-PC_SDCARD_defconfig          |  2 +
 configs/P2020RDB-PC_SPIFLASH_defconfig        |  3 ++
 configs/P2020RDB-PC_defconfig                 |  3 ++
 configs/P2041RDB_NAND_defconfig               |  2 +
 configs/P2041RDB_SDCARD_defconfig             |  2 +
 configs/P2041RDB_SECURE_BOOT_defconfig        |  1 +
 configs/P2041RDB_SPIFLASH_defconfig           |  3 ++
 configs/P2041RDB_SRIO_PCIE_BOOT_defconfig     |  2 +
 configs/P2041RDB_defconfig                    |  3 ++
 configs/P3041DS_NAND_SECURE_BOOT_defconfig    |  1 +
 configs/P3041DS_NAND_defconfig                |  2 +
 configs/P3041DS_SDCARD_defconfig              |  2 +
 configs/P3041DS_SECURE_BOOT_defconfig         |  1 +
 configs/P3041DS_SPIFLASH_defconfig            |  3 ++
 configs/P3041DS_SRIO_PCIE_BOOT_defconfig      |  2 +
 configs/P3041DS_defconfig                     |  3 ++
 configs/P4080DS_SDCARD_defconfig              |  2 +
 configs/P4080DS_SECURE_BOOT_defconfig         |  1 +
 configs/P4080DS_SPIFLASH_defconfig            |  3 ++
 configs/P4080DS_SRIO_PCIE_BOOT_defconfig      |  2 +
 configs/P4080DS_defconfig                     |  3 ++
 configs/P5020DS_NAND_SECURE_BOOT_defconfig    |  1 +
 configs/P5020DS_NAND_defconfig                |  2 +
 configs/P5020DS_SDCARD_defconfig              |  2 +
 configs/P5020DS_SECURE_BOOT_defconfig         |  1 +
 configs/P5020DS_SPIFLASH_defconfig            |  3 ++
 configs/P5020DS_SRIO_PCIE_BOOT_defconfig      |  2 +
 configs/P5020DS_defconfig                     |  3 ++
 configs/P5040DS_NAND_SECURE_BOOT_defconfig    |  1 +
 configs/P5040DS_NAND_defconfig                |  2 +
 configs/P5040DS_SDCARD_defconfig              |  2 +
 configs/P5040DS_SECURE_BOOT_defconfig         |  1 +
 configs/P5040DS_SPIFLASH_defconfig            |  3 ++
 configs/P5040DS_defconfig                     |  3 ++
 configs/SBx81LIFKW_defconfig                  |  3 ++
 configs/SBx81LIFXCAT_defconfig                |  3 ++
 configs/T1023RDB_NAND_defconfig               |  2 +
 configs/T1023RDB_SDCARD_defconfig             |  2 +
 configs/T1023RDB_SECURE_BOOT_defconfig        |  1 +
 configs/T1023RDB_SPIFLASH_defconfig           |  4 ++
 configs/T1023RDB_defconfig                    |  3 ++
 configs/T1024QDS_DDR4_SECURE_BOOT_defconfig   |  1 +
 configs/T1024QDS_DDR4_defconfig               |  3 ++
 configs/T1024QDS_NAND_defconfig               |  2 +
 configs/T1024QDS_SDCARD_defconfig             |  2 +
 configs/T1024QDS_SECURE_BOOT_defconfig        |  1 +
 configs/T1024QDS_SPIFLASH_defconfig           |  4 ++
 configs/T1024QDS_defconfig                    |  3 ++
 configs/T1024RDB_NAND_defconfig               |  2 +
 configs/T1024RDB_SDCARD_defconfig             |  2 +
 configs/T1024RDB_SECURE_BOOT_defconfig        |  1 +
 configs/T1024RDB_SPIFLASH_defconfig           |  4 ++
 configs/T1024RDB_defconfig                    |  3 ++
 configs/T1040D4RDB_NAND_defconfig             |  2 +
 configs/T1040D4RDB_SDCARD_defconfig           |  2 +
 configs/T1040D4RDB_SECURE_BOOT_defconfig      |  1 +
 configs/T1040D4RDB_SPIFLASH_defconfig         |  4 ++
 configs/T1040D4RDB_defconfig                  |  3 ++
 configs/T1040QDS_DDR4_defconfig               |  3 ++
 configs/T1040QDS_SECURE_BOOT_defconfig        |  1 +
 configs/T1040QDS_defconfig                    |  3 ++
 configs/T1040RDB_NAND_defconfig               |  2 +
 configs/T1040RDB_SDCARD_defconfig             |  2 +
 configs/T1040RDB_SECURE_BOOT_defconfig        |  1 +
 configs/T1040RDB_SPIFLASH_defconfig           |  4 ++
 configs/T1040RDB_defconfig                    |  3 ++
 configs/T1042D4RDB_NAND_defconfig             |  2 +
 configs/T1042D4RDB_SDCARD_defconfig           |  2 +
 configs/T1042D4RDB_SECURE_BOOT_defconfig      |  1 +
 configs/T1042D4RDB_SPIFLASH_defconfig         |  4 ++
 configs/T1042D4RDB_defconfig                  |  3 ++
 .../T1042RDB_PI_NAND_SECURE_BOOT_defconfig    |  1 +
 configs/T1042RDB_PI_NAND_defconfig            |  2 +
 configs/T1042RDB_PI_SDCARD_defconfig          |  2 +
 configs/T1042RDB_PI_SPIFLASH_defconfig        |  4 ++
 configs/T1042RDB_PI_defconfig                 |  3 ++
 configs/T1042RDB_SECURE_BOOT_defconfig        |  1 +
 configs/T1042RDB_defconfig                    |  3 ++
 configs/T2080QDS_NAND_defconfig               |  2 +
 configs/T2080QDS_SDCARD_defconfig             |  2 +
 configs/T2080QDS_SECURE_BOOT_defconfig        |  1 +
 configs/T2080QDS_SPIFLASH_defconfig           |  4 ++
 configs/T2080QDS_SRIO_PCIE_BOOT_defconfig     |  2 +
 configs/T2080QDS_defconfig                    |  3 ++
 configs/T2080RDB_NAND_defconfig               |  2 +
 configs/T2080RDB_SDCARD_defconfig             |  2 +
 configs/T2080RDB_SECURE_BOOT_defconfig        |  1 +
 configs/T2080RDB_SPIFLASH_defconfig           |  4 ++
 configs/T2080RDB_SRIO_PCIE_BOOT_defconfig     |  2 +
 configs/T2080RDB_defconfig                    |  3 ++
 configs/T2081QDS_NAND_defconfig               |  2 +
 configs/T2081QDS_SDCARD_defconfig             |  2 +
 configs/T2081QDS_SPIFLASH_defconfig           |  4 ++
 configs/T2081QDS_SRIO_PCIE_BOOT_defconfig     |  2 +
 configs/T2081QDS_defconfig                    |  3 ++
 configs/T4160QDS_NAND_defconfig               |  2 +
 configs/T4160QDS_SDCARD_defconfig             |  2 +
 configs/T4160QDS_SECURE_BOOT_defconfig        |  1 +
 configs/T4160QDS_defconfig                    |  3 ++
 configs/T4160RDB_defconfig                    |  3 ++
 configs/T4240QDS_NAND_defconfig               |  2 +
 configs/T4240QDS_SDCARD_defconfig             |  2 +
 configs/T4240QDS_SECURE_BOOT_defconfig        |  1 +
 configs/T4240QDS_SRIO_PCIE_BOOT_defconfig     |  2 +
 configs/T4240QDS_defconfig                    |  3 ++
 configs/T4240RDB_SDCARD_defconfig             |  2 +
 configs/T4240RDB_defconfig                    |  3 ++
 configs/TQM834x_defconfig                     |  4 ++
 configs/TWR-P1025_defconfig                   |  3 ++
 configs/UCP1020_defconfig                     |  3 ++
 configs/adp-ae3xx_defconfig                   |  3 ++
 configs/adp-ag101p_defconfig                  |  3 ++
 configs/ae350_rv32_defconfig                  |  1 +
 configs/ae350_rv32_xip_defconfig              |  1 +
 configs/ae350_rv64_defconfig                  |  1 +
 configs/ae350_rv64_xip_defconfig              |  1 +
 configs/alt_defconfig                         |  4 ++
 configs/am335x_boneblack_vboot_defconfig      |  1 +
 configs/am335x_guardian_defconfig             |  2 +-
 configs/am335x_shc_defconfig                  |  1 +
 configs/am335x_shc_ict_defconfig              |  1 +
 configs/am335x_shc_netboot_defconfig          |  1 +
 configs/am335x_shc_sdboot_defconfig           |  1 +
 configs/am335x_sl50_defconfig                 |  1 +
 configs/am43xx_evm_qspiboot_defconfig         |  1 +
 configs/am57xx_evm_defconfig                  |  1 +
 configs/am57xx_hs_evm_defconfig               |  1 +
 configs/am57xx_hs_evm_usb_defconfig           |  1 +
 configs/am65x_evm_a53_defconfig               |  3 ++
 configs/am65x_evm_r5_defconfig                |  1 +
 configs/am65x_hs_evm_a53_defconfig            |  1 +
 configs/am65x_hs_evm_r5_defconfig             |  1 +
 configs/amcore_defconfig                      |  3 ++
 configs/ap121_defconfig                       |  3 ++
 configs/ap143_defconfig                       |  3 ++
 configs/ap152_defconfig                       |  3 ++
 configs/apalis-imx8qm_defconfig               |  2 +
 configs/apalis-tk1_defconfig                  |  2 +
 configs/apalis_imx6_defconfig                 |  2 +
 configs/apalis_t30_defconfig                  |  2 +
 configs/apf27_defconfig                       |  3 ++
 configs/apx4devkit_defconfig                  |  3 ++
 configs/aristainetos2_defconfig               |  4 ++
 configs/aristainetos2b_defconfig              |  4 ++
 configs/aristainetos_defconfig                |  4 ++
 configs/armadillo-800eva_defconfig            |  3 ++
 configs/arndale_defconfig                     |  2 +
 configs/aspenite_defconfig                    |  1 +
 configs/astro_mcf5373l_defconfig              |  3 ++
 configs/at91rm9200ek_defconfig                |  2 +-
 configs/at91rm9200ek_ram_defconfig            |  2 +-
 configs/at91sam9260ek_nandflash_defconfig     |  1 +
 configs/at91sam9261ek_nandflash_defconfig     |  1 +
 configs/at91sam9263ek_nandflash_defconfig     |  1 +
 configs/at91sam9263ek_norflash_boot_defconfig |  3 +-
 configs/at91sam9263ek_norflash_defconfig      |  3 +-
 configs/at91sam9g10ek_nandflash_defconfig     |  1 +
 .../at91sam9g20ek_2mmc_nandflash_defconfig    |  1 +
 configs/at91sam9g20ek_nandflash_defconfig     |  1 +
 configs/at91sam9m10g45ek_nandflash_defconfig  |  1 +
 configs/at91sam9n12ek_nandflash_defconfig     |  1 +
 configs/at91sam9rlek_nandflash_defconfig      |  1 +
 configs/at91sam9x5ek_nandflash_defconfig      |  1 +
 configs/at91sam9xeek_nandflash_defconfig      |  1 +
 configs/axm_defconfig                         |  1 +
 configs/bayleybay_defconfig                   |  3 ++
 configs/bcm11130_defconfig                    |  2 +
 configs/bcm11130_nand_defconfig               |  2 +
 configs/bcm23550_w1d_defconfig                |  2 +
 configs/bcm28155_ap_defconfig                 |  2 +
 configs/bcm28155_w1d_defconfig                |  2 +
 configs/bcm7260_defconfig                     |  3 ++
 configs/bcm7445_defconfig                     |  4 ++
 configs/bcm911360_entphn-ns_defconfig         |  1 +
 configs/bcm911360_entphn_defconfig            |  1 +
 configs/bcm911360k_defconfig                  |  1 +
 configs/bcm958300k-ns_defconfig               |  1 +
 configs/bcm958300k_defconfig                  |  1 +
 configs/bcm958305k_defconfig                  |  1 +
 configs/bcm958622hr_defconfig                 |  1 +
 configs/bcm958712k_defconfig                  |  1 +
 configs/bcm963158_ram_defconfig               |  1 +
 configs/bcm968380gerg_ram_defconfig           |  1 +
 configs/bcm968580xref_ram_defconfig           |  1 +
 configs/beaver_defconfig                      |  2 +
 configs/bg0900_defconfig                      |  1 +
 configs/bk4r1_defconfig                       |  3 ++
 configs/blanche_defconfig                     |  4 ++
 configs/boston32r2_defconfig                  |  3 ++
 configs/boston32r2el_defconfig                |  3 ++
 configs/boston32r6_defconfig                  |  3 ++
 configs/boston32r6el_defconfig                |  3 ++
 configs/boston64r2_defconfig                  |  3 ++
 configs/boston64r2el_defconfig                |  3 ++
 configs/boston64r6_defconfig                  |  3 ++
 configs/boston64r6el_defconfig                |  3 ++
 configs/brppt1_mmc_defconfig                  |  1 +
 configs/brppt1_spi_defconfig                  |  1 +
 configs/brppt2_defconfig                      |  3 ++
 configs/brsmarc1_defconfig                    |  1 +
 configs/brxre1_defconfig                      |  1 +
 configs/bubblegum_96_defconfig                |  1 +
 configs/caddy2_defconfig                      |  4 ++
 configs/cardhu_defconfig                      |  2 +
 configs/cei-tk1-som_defconfig                 |  2 +
 configs/cgtqmx6eval_defconfig                 |  3 ++
 configs/cherryhill_defconfig                  |  3 ++
 configs/chiliboard_defconfig                  |  1 +
 configs/chromebook_bob_defconfig              |  1 +
 configs/chromebook_link64_defconfig           |  3 ++
 configs/chromebook_link_defconfig             |  3 ++
 configs/chromebook_samus_defconfig            |  3 ++
 configs/chromebook_samus_tpl_defconfig        |  3 ++
 configs/chromebox_panther_defconfig           |  3 ++
 configs/ci20_mmc_defconfig                    |  2 +
 configs/cl-som-imx7_defconfig                 |  3 ++
 configs/clearfog_defconfig                    |  2 +
 configs/clearfog_gt_8k_defconfig              |  3 ++
 configs/cm_fx6_defconfig                      |  3 ++
 configs/cm_t43_defconfig                      |  2 +-
 configs/cm_t54_defconfig                      |  3 +-
 configs/cobra5272_defconfig                   |  3 ++
 configs/colibri-imx6ull_defconfig             |  2 +
 configs/colibri-imx8qxp_defconfig             |  2 +
 configs/colibri_imx6_defconfig                |  2 +
 configs/colibri_imx7_defconfig                |  2 +
 configs/colibri_imx7_emmc_defconfig           |  2 +
 configs/colibri_pxa270_defconfig              |  3 ++
 configs/colibri_t20_defconfig                 |  2 +
 configs/colibri_t30_defconfig                 |  2 +
 configs/colibri_vf_defconfig                  |  2 +
 configs/comtrend_ar5315u_ram_defconfig        |  1 +
 configs/comtrend_ar5387un_ram_defconfig       |  1 +
 configs/comtrend_ct5361_ram_defconfig         |  1 +
 configs/comtrend_vr3032u_ram_defconfig        |  1 +
 configs/comtrend_wap5813n_ram_defconfig       |  1 +
 ...-qeval20-qa3-e3845-internal-uart_defconfig |  3 ++
 configs/conga-qeval20-qa3-e3845_defconfig     |  3 ++
 ...trolcenterd_36BIT_SDCARD_DEVELOP_defconfig |  2 +
 configs/controlcenterd_36BIT_SDCARD_defconfig |  2 +
 ...ntrolcenterd_TRAILBLAZER_DEVELOP_defconfig |  1 +
 configs/controlcenterd_TRAILBLAZER_defconfig  |  1 +
 configs/controlcenterdc_defconfig             |  3 ++
 configs/coreboot_defconfig                    |  1 +
 configs/corvus_defconfig                      |  1 +
 configs/cougarcanyon2_defconfig               |  3 ++
 configs/crownbay_defconfig                    |  3 ++
 configs/crs305-1g-4s_defconfig                |  3 ++
 configs/d2net_v2_defconfig                    |  4 ++
 configs/da850evm_defconfig                    |  3 ++
 configs/da850evm_direct_nor_defconfig         |  3 ++
 configs/da850evm_nand_defconfig               |  2 +
 configs/dalmore_defconfig                     |  2 +
 configs/db-88f6281-bp-nand_defconfig          |  3 ++
 configs/db-88f6281-bp-spi_defconfig           |  3 ++
 configs/db-88f6720_defconfig                  |  3 ++
 configs/db-88f6820-amc_defconfig              |  3 ++
 configs/db-88f6820-gp_defconfig               |  3 ++
 configs/db-mv784mp-gp_defconfig               |  3 ++
 configs/db-xc3-24g4xg_defconfig               |  3 ++
 configs/devkit3250_defconfig                  |  2 +
 configs/dfi-bt700-q7x-151_defconfig           |  3 ++
 configs/dh_imx6_defconfig                     |  4 ++
 configs/display5_defconfig                    |  4 ++
 configs/display5_factory_defconfig            |  4 ++
 configs/dms-ba16-1g_defconfig                 |  3 ++
 configs/dms-ba16_defconfig                    |  3 ++
 configs/dns325_defconfig                      |  2 +
 configs/dockstar_defconfig                    |  2 +
 configs/dra7xx_evm_defconfig                  |  1 +
 configs/dra7xx_hs_evm_defconfig               |  1 +
 configs/dra7xx_hs_evm_usb_defconfig           |  1 +
 configs/draco_defconfig                       |  1 +
 configs/dragonboard410c_defconfig             |  2 +
 configs/dragonboard820c_defconfig             |  1 +
 configs/dreamplug_defconfig                   |  4 ++
 configs/ds109_defconfig                       |  4 ++
 configs/ds414_defconfig                       |  3 ++
 configs/durian_defconfig                      |  1 +
 configs/e2220-1170_defconfig                  |  2 +
 configs/eb_cpu5282_defconfig                  |  3 ++
 configs/eb_cpu5282_internal_defconfig         |  3 ++
 configs/edb9315a_defconfig                    |  4 ++
 configs/edison_defconfig                      |  3 ++
 configs/edminiv2_defconfig                    |  3 ++
 configs/efi-x86_app_defconfig                 |  1 +
 configs/efi-x86_payload32_defconfig           |  1 +
 configs/efi-x86_payload64_defconfig           |  1 +
 configs/elgin-rv1108_defconfig                |  1 +
 configs/espresso7420_defconfig                |  1 +
 configs/etamin_defconfig                      |  1 +
 configs/evb-ast2500_defconfig                 |  1 +
 configs/evb-px5_defconfig                     |  1 +
 configs/evb-rk3128_defconfig                  |  1 +
 configs/evb-rk3229_defconfig                  |  1 +
 configs/evb-rk3288_defconfig                  |  1 +
 configs/evb-rk3328_defconfig                  |  1 +
 configs/evb-rk3399_defconfig                  |  1 +
 configs/ficus-rk3399_defconfig                |  1 +
 configs/firefly-rk3288_defconfig              |  1 +
 configs/firefly-rk3399_defconfig              |  1 +
 configs/flea3_defconfig                       |  4 ++
 configs/galileo_defconfig                     |  3 ++
 ...gardena-smart-gateway-mt7688-ram_defconfig |  4 ++
 .../gardena-smart-gateway-mt7688_defconfig    |  4 ++
 configs/gazerbeam_defconfig                   |  4 ++
 configs/ge_bx50v3_defconfig                   |  3 ++
 configs/goflexhome_defconfig                  |  2 +
 configs/gose_defconfig                        |  4 ++
 configs/gplugd_defconfig                      |  1 +
 configs/grpeach_defconfig                     |  3 ++
 configs/guruplug_defconfig                    |  2 +
 configs/gwventana_emmc_defconfig              |  3 ++
 configs/gwventana_gw5904_defconfig            |  3 ++
 configs/gwventana_nand_defconfig              |  3 ++
 configs/harmony_defconfig                     |  2 +
 configs/helios4_defconfig                     |  2 +
 configs/highbank_defconfig                    |  2 +
 configs/hikey960_defconfig                    |  1 +
 configs/hikey_defconfig                       |  2 +
 configs/hrcon_defconfig                       |  4 ++
 configs/hrcon_dh_defconfig                    |  4 ++
 configs/huawei_hg556a_ram_defconfig           |  1 +
 configs/ib62x0_defconfig                      |  2 +
 configs/iconnect_defconfig                    |  2 +
 configs/ids8313_defconfig                     |  4 ++
 configs/imgtec_xilfpga_defconfig              |  1 +
 configs/imx6dl_icore_nand_defconfig           |  2 +
 configs/imx6dl_mamoj_defconfig                |  2 +
 configs/imx6q_icore_nand_defconfig            |  2 +
 configs/imx6q_logic_defconfig                 |  2 +
 configs/imx6qdl_icore_mipi_defconfig          |  2 +
 configs/imx6qdl_icore_mmc_defconfig           |  2 +
 configs/imx6qdl_icore_nand_defconfig          |  2 +
 configs/imx6qdl_icore_rqs_defconfig           |  2 +
 configs/imx6ul_geam_mmc_defconfig             |  2 +
 configs/imx6ul_geam_nand_defconfig            |  2 +
 configs/imx6ul_isiot_emmc_defconfig           |  2 +
 configs/imx6ul_isiot_nand_defconfig           |  2 +
 configs/imx8mm_evk_defconfig                  |  2 +
 configs/imx8mn_ddr4_evk_defconfig             |  2 +
 configs/imx8mq_evk_defconfig                  |  2 +
 configs/imx8qm_mek_defconfig                  |  2 +
 configs/imx8qm_rom7720_a1_4G_defconfig        |  2 +
 configs/imx8qxp_mek_defconfig                 |  2 +
 configs/inetspace_v2_defconfig                |  4 ++
 configs/integratorap_cm720t_defconfig         |  1 +
 configs/integratorap_cm920t_defconfig         |  1 +
 configs/integratorap_cm926ejs_defconfig       |  1 +
 configs/integratorap_cm946es_defconfig        |  1 +
 configs/integratorcp_cm1136_defconfig         |  3 ++
 configs/integratorcp_cm920t_defconfig         |  3 ++
 configs/integratorcp_cm926ejs_defconfig       |  3 ++
 configs/integratorcp_cm946es_defconfig        |  3 ++
 configs/j721e_evm_a72_defconfig               |  1 +
 configs/j721e_evm_r5_defconfig                |  1 +
 configs/jetson-tk1_defconfig                  |  2 +
 configs/k2e_evm_defconfig                     |  2 +
 configs/k2e_hs_evm_defconfig                  |  2 +
 configs/k2g_evm_defconfig                     |  1 +
 configs/k2g_hs_evm_defconfig                  |  1 +
 configs/k2hk_evm_defconfig                    |  2 +
 configs/k2hk_hs_evm_defconfig                 |  2 +
 configs/k2l_evm_defconfig                     |  2 +
 configs/k2l_hs_evm_defconfig                  |  2 +
 configs/khadas-edge-captain-rk3399_defconfig  |  1 +
 configs/khadas-edge-rk3399_defconfig          |  1 +
 configs/khadas-edge-v-rk3399_defconfig        |  1 +
 configs/khadas-vim2_defconfig                 |  1 +
 configs/khadas-vim3_defconfig                 |  1 +
 configs/khadas-vim_defconfig                  |  1 +
 configs/km_kirkwood_128m16_defconfig          |  3 ++
 configs/km_kirkwood_defconfig                 |  3 ++
 configs/km_kirkwood_pci_defconfig             |  3 ++
 configs/kmcoge4_defconfig                     |  4 ++
 configs/kmcoge5ne_defconfig                   |  4 ++
 configs/kmcoge5un_defconfig                   |  4 ++
 configs/kmeter1_defconfig                     |  4 ++
 configs/kmnusa_defconfig                      |  4 ++
 configs/kmopti2_defconfig                     |  4 ++
 configs/kmsugp1_defconfig                     |  4 ++
 configs/kmsupx5_defconfig                     |  4 ++
 configs/kmsuv31_defconfig                     |  4 ++
 configs/kmtegr1_defconfig                     |  4 ++
 configs/kmtepr2_defconfig                     |  4 ++
 configs/koelsch_defconfig                     |  4 ++
 configs/kp_imx53_defconfig                    |  3 ++
 configs/kp_imx6q_tpc_defconfig                |  3 ++
 configs/kylin-rk3036_defconfig                |  1 +
 configs/kzm9g_defconfig                       |  3 ++
 configs/lager_defconfig                       |  4 ++
 configs/leez-rk3399_defconfig                 |  1 +
 configs/legoev3_defconfig                     |  1 +
 configs/libretech-ac_defconfig                |  3 ++
 configs/libretech-cc_defconfig                |  1 +
 configs/linkit-smart-7688-ram_defconfig       |  3 ++
 configs/linkit-smart-7688_defconfig           |  3 ++
 configs/lion-rk3368_defconfig                 |  1 +
 configs/liteboard_defconfig                   |  2 +
 configs/ls1012a2g5rdb_qspi_defconfig          |  3 ++
 configs/ls1012a2g5rdb_tfa_defconfig           |  3 ++
 configs/ls1012afrdm_qspi_defconfig            |  3 ++
 configs/ls1012afrdm_tfa_defconfig             |  3 ++
 .../ls1012afrwy_qspi_SECURE_BOOT_defconfig    |  1 +
 configs/ls1012afrwy_qspi_defconfig            |  4 ++
 configs/ls1012afrwy_tfa_SECURE_BOOT_defconfig |  1 +
 configs/ls1012afrwy_tfa_defconfig             |  4 ++
 configs/ls1012aqds_qspi_defconfig             |  3 ++
 configs/ls1012aqds_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1012aqds_tfa_defconfig              |  3 ++
 configs/ls1012ardb_qspi_SECURE_BOOT_defconfig |  1 +
 configs/ls1012ardb_qspi_defconfig             |  4 ++
 configs/ls1012ardb_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1012ardb_tfa_defconfig              |  4 ++
 configs/ls1021aiot_qspi_defconfig             |  3 ++
 configs/ls1021aiot_sdcard_defconfig           |  2 +
 configs/ls1021aqds_ddr4_nor_defconfig         |  3 ++
 configs/ls1021aqds_ddr4_nor_lpuart_defconfig  |  3 ++
 configs/ls1021aqds_nand_defconfig             |  2 +
 configs/ls1021aqds_nor_SECURE_BOOT_defconfig  |  1 +
 configs/ls1021aqds_nor_defconfig              |  3 ++
 configs/ls1021aqds_nor_lpuart_defconfig       |  3 ++
 configs/ls1021aqds_qspi_defconfig             |  3 ++
 configs/ls1021aqds_sdcard_ifc_defconfig       |  2 +
 configs/ls1021aqds_sdcard_qspi_defconfig      |  2 +
 configs/ls1021atsn_qspi_defconfig             |  3 ++
 configs/ls1021atsn_sdcard_defconfig           |  2 +
 configs/ls1021atwr_nor_SECURE_BOOT_defconfig  |  1 +
 configs/ls1021atwr_nor_defconfig              |  3 ++
 configs/ls1021atwr_nor_lpuart_defconfig       |  3 ++
 configs/ls1021atwr_qspi_defconfig             |  3 ++
 ...s1021atwr_sdcard_ifc_SECURE_BOOT_defconfig |  1 +
 configs/ls1021atwr_sdcard_ifc_defconfig       |  2 +
 configs/ls1021atwr_sdcard_qspi_defconfig      |  2 +
 configs/ls1028aqds_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1028aqds_tfa_defconfig              |  4 ++
 configs/ls1028ardb_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1028ardb_tfa_defconfig              |  4 ++
 configs/ls1043aqds_defconfig                  |  3 ++
 configs/ls1043aqds_lpuart_defconfig           |  3 ++
 configs/ls1043aqds_nand_defconfig             |  2 +
 configs/ls1043aqds_nor_ddr3_defconfig         |  3 ++
 configs/ls1043aqds_qspi_defconfig             |  3 ++
 configs/ls1043aqds_sdcard_ifc_defconfig       |  2 +
 configs/ls1043aqds_sdcard_qspi_defconfig      |  2 +
 configs/ls1043aqds_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1043aqds_tfa_defconfig              |  4 ++
 configs/ls1043ardb_SECURE_BOOT_defconfig      |  1 +
 configs/ls1043ardb_defconfig                  |  3 ++
 configs/ls1043ardb_nand_SECURE_BOOT_defconfig |  1 +
 configs/ls1043ardb_nand_defconfig             |  2 +
 .../ls1043ardb_sdcard_SECURE_BOOT_defconfig   |  1 +
 configs/ls1043ardb_sdcard_defconfig           |  2 +
 configs/ls1043ardb_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1043ardb_tfa_defconfig              |  4 ++
 configs/ls1046afrwy_tfa_defconfig             |  4 ++
 configs/ls1046aqds_SECURE_BOOT_defconfig      |  1 +
 configs/ls1046aqds_defconfig                  |  3 ++
 configs/ls1046aqds_lpuart_defconfig           |  3 ++
 configs/ls1046aqds_nand_defconfig             |  2 +
 configs/ls1046aqds_qspi_defconfig             |  3 ++
 configs/ls1046aqds_sdcard_ifc_defconfig       |  2 +
 configs/ls1046aqds_sdcard_qspi_defconfig      |  2 +
 configs/ls1046aqds_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1046aqds_tfa_defconfig              |  4 ++
 configs/ls1046ardb_emmc_defconfig             |  2 +
 configs/ls1046ardb_qspi_SECURE_BOOT_defconfig |  1 +
 configs/ls1046ardb_qspi_defconfig             |  3 ++
 configs/ls1046ardb_qspi_spl_defconfig         |  3 ++
 .../ls1046ardb_sdcard_SECURE_BOOT_defconfig   |  1 +
 configs/ls1046ardb_sdcard_defconfig           |  2 +
 configs/ls1046ardb_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1046ardb_tfa_defconfig              |  4 ++
 configs/ls1088aqds_defconfig                  |  3 ++
 configs/ls1088aqds_qspi_SECURE_BOOT_defconfig |  1 +
 configs/ls1088aqds_qspi_defconfig             |  4 ++
 configs/ls1088aqds_sdcard_ifc_defconfig       |  2 +
 configs/ls1088aqds_sdcard_qspi_defconfig      |  2 +
 configs/ls1088aqds_tfa_defconfig              |  4 ++
 configs/ls1088ardb_qspi_SECURE_BOOT_defconfig |  1 +
 configs/ls1088ardb_qspi_defconfig             |  4 ++
 ...1088ardb_sdcard_qspi_SECURE_BOOT_defconfig |  1 +
 configs/ls1088ardb_sdcard_qspi_defconfig      |  2 +
 configs/ls1088ardb_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls1088ardb_tfa_defconfig              |  4 ++
 configs/ls2080a_emu_defconfig                 |  1 +
 configs/ls2080a_simu_defconfig                |  1 +
 configs/ls2080aqds_SECURE_BOOT_defconfig      |  1 +
 configs/ls2080aqds_defconfig                  |  3 ++
 configs/ls2080aqds_nand_defconfig             |  2 +
 configs/ls2080aqds_qspi_defconfig             |  3 ++
 configs/ls2080aqds_sdcard_defconfig           |  2 +
 configs/ls2080ardb_SECURE_BOOT_defconfig      |  1 +
 configs/ls2080ardb_defconfig                  |  3 ++
 configs/ls2080ardb_nand_defconfig             |  2 +
 configs/ls2081ardb_defconfig                  |  3 ++
 configs/ls2088aqds_tfa_defconfig              |  4 ++
 configs/ls2088ardb_qspi_SECURE_BOOT_defconfig |  1 +
 configs/ls2088ardb_qspi_defconfig             |  3 ++
 configs/ls2088ardb_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/ls2088ardb_tfa_defconfig              |  4 ++
 configs/lschlv2_defconfig                     |  3 ++
 configs/lsxhl_defconfig                       |  3 ++
 configs/lx2160aqds_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/lx2160aqds_tfa_defconfig              |  2 +
 configs/lx2160ardb_tfa_SECURE_BOOT_defconfig  |  1 +
 configs/lx2160ardb_tfa_defconfig              |  2 +
 configs/m53menlo_defconfig                    |  3 ++
 configs/malta64_defconfig                     |  3 ++
 configs/malta64el_defconfig                   |  3 ++
 configs/malta_defconfig                       |  3 ++
 configs/maltael_defconfig                     |  3 ++
 configs/marsboard_defconfig                   |  3 ++
 configs/maxbcm_defconfig                      |  3 ++
 configs/mccmon6_nor_defconfig                 |  4 ++
 configs/mccmon6_sd_defconfig                  |  4 ++
 configs/medcom-wide_defconfig                 |  2 +
 configs/meerkat96_defconfig                   |  2 +
 configs/mgcoge3un_defconfig                   |  3 ++
 configs/microblaze-generic_defconfig          |  1 +
 configs/microchip_mpfs_icicle_defconfig       |  1 +
 configs/minnowmax_defconfig                   |  3 ++
 configs/miqi-rk3288_defconfig                 |  1 +
 configs/mpc8308_p1m_defconfig                 |  4 ++
 configs/mscc_jr2_defconfig                    |  4 ++
 configs/mscc_luton_defconfig                  |  4 ++
 configs/mscc_ocelot_defconfig                 |  4 ++
 configs/mscc_serval_defconfig                 |  4 ++
 configs/mscc_servalt_defconfig                |  4 ++
 configs/mt7623n_bpir2_defconfig               |  2 +
 configs/mt7629_rfb_defconfig                  |  1 +
 configs/mvebu_db-88f3720_defconfig            |  3 ++
 configs/mvebu_db_armada8k_defconfig           |  3 ++
 configs/mvebu_espressobin-88f3720_defconfig   |  3 ++
 configs/mvebu_mcbin-88f8040_defconfig         |  3 ++
 configs/mx23_olinuxino_defconfig              |  2 +
 configs/mx23evk_defconfig                     |  2 +
 configs/mx25pdk_defconfig                     |  2 +
 configs/mx28evk_auart_console_defconfig       |  2 +
 configs/mx28evk_defconfig                     |  2 +
 configs/mx28evk_nand_defconfig                |  3 ++
 configs/mx28evk_spi_defconfig                 |  1 +
 configs/mx31pdk_defconfig                     |  3 ++
 configs/mx35pdk_defconfig                     |  4 ++
 configs/mx51evk_defconfig                     |  2 +
 configs/mx53ard_defconfig                     |  2 +
 configs/mx53cx9020_defconfig                  |  2 +
 configs/mx53evk_defconfig                     |  2 +
 configs/mx53loco_defconfig                    |  2 +
 configs/mx53ppd_defconfig                     |  2 +
 configs/mx53smd_defconfig                     |  2 +
 configs/mx6cuboxi_defconfig                   |  2 +
 configs/mx6dlarm2_defconfig                   |  2 +
 configs/mx6dlarm2_lpddr2_defconfig            |  2 +
 configs/mx6memcal_defconfig                   |  1 +
 configs/mx6qarm2_defconfig                    |  2 +
 configs/mx6qarm2_lpddr2_defconfig             |  2 +
 configs/mx6qsabrelite_defconfig               |  2 +
 configs/mx6sabreauto_defconfig                |  2 +
 configs/mx6sabresd_defconfig                  |  2 +
 configs/mx6slevk_defconfig                    |  2 +
 configs/mx6slevk_spinor_defconfig             |  3 ++
 configs/mx6slevk_spl_defconfig                |  2 +
 configs/mx6sllevk_defconfig                   |  2 +
 configs/mx6sllevk_plugin_defconfig            |  2 +
 configs/mx6sxsabreauto_defconfig              |  2 +
 configs/mx6sxsabresd_defconfig                |  2 +
 configs/mx6sxsabresd_spl_defconfig            |  2 +
 configs/mx6ul_14x14_evk_defconfig             |  2 +
 configs/mx6ul_9x9_evk_defconfig               |  2 +
 configs/mx6ull_14x14_evk_defconfig            |  2 +
 configs/mx6ull_14x14_evk_plugin_defconfig     |  2 +
 configs/mx6ulz_14x14_evk_defconfig            |  2 +
 configs/mx7dsabresd_defconfig                 |  2 +
 configs/mx7dsabresd_qspi_defconfig            |  2 +
 configs/mx7ulp_evk_defconfig                  |  2 +
 configs/mx7ulp_evk_plugin_defconfig           |  2 +
 configs/nanopc-t4-rk3399_defconfig            |  1 +
 configs/nanopi-k2_defconfig                   |  1 +
 configs/nanopi-m4-rk3399_defconfig            |  1 +
 configs/nanopi-neo4-rk3399_defconfig          |  1 +
 configs/nas220_defconfig                      |  2 +
 configs/net2big_v2_defconfig                  |  4 ++
 configs/netgear_cg3100d_ram_defconfig         |  1 +
 configs/netgear_dgnd3700v2_ram_defconfig      |  1 +
 configs/netspace_lite_v2_defconfig            |  4 ++
 configs/netspace_max_v2_defconfig             |  4 ++
 configs/netspace_mini_v2_defconfig            |  4 ++
 configs/netspace_v2_defconfig                 |  4 ++
 configs/nitrogen6dl2g_defconfig               |  3 ++
 configs/nitrogen6dl_defconfig                 |  3 ++
 configs/nitrogen6q2g_defconfig                |  3 ++
 configs/nitrogen6q_defconfig                  |  3 ++
 configs/nitrogen6s1g_defconfig                |  3 ++
 configs/nitrogen6s_defconfig                  |  3 ++
 configs/novena_defconfig                      |  3 ++
 configs/nsa310s_defconfig                     |  2 +
 configs/nyan-big_defconfig                    |  2 +
 configs/odroid-c2_defconfig                   |  1 +
 configs/odroid-n2_defconfig                   |  1 +
 configs/odroid-xu3_defconfig                  |  2 +
 configs/odroid_defconfig                      |  2 +
 configs/omap5_uevm_defconfig                  |  1 +
 configs/omapl138_lcdk_defconfig               |  2 +
 configs/openrd_base_defconfig                 |  2 +
 configs/openrd_client_defconfig               |  2 +
 configs/openrd_ultimate_defconfig             |  2 +
 configs/opos6uldev_defconfig                  |  3 ++
 configs/orangepi-rk3399_defconfig             |  1 +
 configs/origen_defconfig                      |  2 +
 configs/ot1200_defconfig                      |  3 ++
 configs/ot1200_spl_defconfig                  |  3 ++
 configs/p200_defconfig                        |  1 +
 configs/p201_defconfig                        |  1 +
 configs/p212_defconfig                        |  1 +
 configs/p2371-0000_defconfig                  |  2 +
 configs/p2371-2180_defconfig                  |  2 +
 configs/p2571_defconfig                       |  2 +
 configs/p2771-0000-000_defconfig              |  2 +
 configs/p2771-0000-500_defconfig              |  2 +
 configs/paz00_defconfig                       |  2 +
 configs/pcm052_defconfig                      |  3 ++
 configs/pcm058_defconfig                      |  4 ++
 configs/peach-pi_defconfig                    |  3 ++
 configs/peach-pit_defconfig                   |  3 ++
 configs/pfla02_defconfig                      |  4 ++
 configs/phycore-am335x-r2-wega_defconfig      |  2 +-
 configs/phycore-rk3288_defconfig              |  1 +
 configs/phycore_pcl063_defconfig              |  1 +
 configs/phycore_pcl063_ull_defconfig          |  1 +
 configs/pic32mzdask_defconfig                 |  1 +
 configs/pico-dwarf-imx6ul_defconfig           |  2 +
 configs/pico-dwarf-imx7d_defconfig            |  2 +
 configs/pico-hobbit-imx6ul_defconfig          |  2 +
 configs/pico-hobbit-imx7d_defconfig           |  2 +
 configs/pico-imx6_defconfig                   |  2 +
 configs/pico-imx6ul_defconfig                 |  2 +
 configs/pico-imx7d_bl33_defconfig             |  2 +
 configs/pico-imx7d_defconfig                  |  2 +
 configs/pico-nymph-imx7d_defconfig            |  2 +
 configs/pico-pi-imx6ul_defconfig              |  2 +
 configs/pico-pi-imx7d_defconfig               |  2 +
 configs/platinum_picon_defconfig              |  3 ++
 configs/platinum_titanium_defconfig           |  3 ++
 configs/plutux_defconfig                      |  2 +
 configs/pm9261_defconfig                      |  2 +-
 configs/pm9263_defconfig                      |  2 +-
 configs/pm9g45_defconfig                      |  1 +
 configs/pogo_e02_defconfig                    |  2 +
 configs/poplar_defconfig                      |  2 +
 configs/popmetal-rk3288_defconfig             |  1 +
 configs/porter_defconfig                      |  4 ++
 configs/puma-rk3399_defconfig                 |  1 +
 configs/pumpkin_defconfig                     |  1 +
 configs/qemu-ppce500_defconfig                |  1 +
 configs/qemu-riscv32_defconfig                |  1 +
 configs/qemu-riscv32_smode_defconfig          |  1 +
 configs/qemu-riscv32_spl_defconfig            |  1 +
 configs/qemu-riscv64_defconfig                |  1 +
 configs/qemu-riscv64_smode_defconfig          |  1 +
 configs/qemu-riscv64_spl_defconfig            |  1 +
 configs/qemu-x86_64_defconfig                 |  1 +
 configs/qemu-x86_defconfig                    |  1 +
 configs/qemu_arm64_defconfig                  |  3 ++
 configs/qemu_arm_defconfig                    |  3 ++
 configs/qemu_mips64_defconfig                 |  3 ++
 configs/qemu_mips64el_defconfig               |  3 ++
 configs/qemu_mips_defconfig                   |  3 ++
 configs/qemu_mipsel_defconfig                 |  3 ++
 configs/r2dplus_defconfig                     |  3 ++
 configs/r7780mp_defconfig                     |  3 ++
 configs/r8a7795_salvator-x_defconfig          |  2 +
 configs/r8a7795_ulcb_defconfig                |  2 +
 configs/r8a77965_salvator-x_defconfig         |  2 +
 configs/r8a77965_ulcb_defconfig               |  2 +
 configs/r8a7796_salvator-x_defconfig          |  2 +
 configs/r8a7796_ulcb_defconfig                |  2 +
 configs/r8a77970_eagle_defconfig              |  3 ++
 configs/r8a77980_condor_defconfig             |  3 ++
 configs/r8a77990_ebisu_defconfig              |  2 +
 configs/r8a77995_draak_defconfig              |  2 +
 configs/rastaban_defconfig                    |  1 +
 configs/riotboard_defconfig                   |  2 +
 configs/riotboard_spl_defconfig               |  2 +
 configs/roc-rk3399-pc_defconfig               |  1 +
 configs/rock-pi-4-rk3399_defconfig            |  1 +
 configs/rock2_defconfig                       |  1 +
 configs/rock64-rk3328_defconfig               |  1 +
 configs/rock960-rk3399_defconfig              |  1 +
 configs/rock_defconfig                        |  1 +
 configs/rockpro64-rk3399_defconfig            |  1 +
 configs/rpi_0_w_defconfig                     |  1 +
 configs/rpi_2_defconfig                       |  1 +
 configs/rpi_3_32b_defconfig                   |  1 +
 configs/rpi_3_b_plus_defconfig                |  1 +
 configs/rpi_3_defconfig                       |  1 +
 configs/rpi_4_32b_defconfig                   |  1 +
 configs/rpi_4_defconfig                       |  1 +
 configs/rpi_defconfig                         |  1 +
 configs/s32v234evb_defconfig                  |  2 +
 configs/s400_defconfig                        |  1 +
 configs/s5p_goni_defconfig                    |  2 +
 configs/s5pc210_universal_defconfig           |  2 +
 configs/sagem_f@st1704_ram_defconfig          |  1 +
 configs/sam9x60ek_nandflash_defconfig         |  1 +
 configs/sama5d2_ptc_ek_nandflash_defconfig    |  1 +
 configs/sama5d36ek_cmp_nandflash_defconfig    |  1 +
 configs/sama5d3_xplained_nandflash_defconfig  |  1 +
 configs/sama5d3xek_nandflash_defconfig        |  1 +
 configs/sama5d4_xplained_nandflash_defconfig  |  1 +
 configs/sama5d4ek_nandflash_defconfig         |  1 +
 configs/sandbox64_defconfig                   |  1 +
 configs/sandbox_defconfig                     |  1 +
 configs/sandbox_flattree_defconfig            |  1 +
 configs/sandbox_spl_defconfig                 |  1 +
 configs/sansa_fuze_plus_defconfig             |  1 +
 configs/sbc8349_PCI_33_defconfig              |  4 ++
 configs/sbc8349_PCI_66_defconfig              |  4 ++
 configs/sbc8349_defconfig                     |  4 ++
 configs/sbc8548_PCI_33_PCIE_defconfig         |  3 ++
 configs/sbc8548_PCI_33_defconfig              |  3 ++
 configs/sbc8548_PCI_66_PCIE_defconfig         |  3 ++
 configs/sbc8548_PCI_66_defconfig              |  3 ++
 configs/sbc8548_defconfig                     |  3 ++
 configs/sbc8641d_defconfig                    |  3 ++
 configs/sc_sps_1_defconfig                    |  2 +
 configs/seaboard_defconfig                    |  2 +
 configs/secomx6quq7_defconfig                 |  2 +
 configs/sei510_defconfig                      |  2 +
 configs/sei610_defconfig                      |  2 +
 configs/sfr_nb4-ser_ram_defconfig             |  1 +
 configs/sh7752evb_defconfig                   |  1 +
 configs/sh7753evb_defconfig                   |  1 +
 configs/sh7757lcr_defconfig                   |  1 +
 configs/sh7763rdp_defconfig                   |  4 ++
 configs/sheevaplug_defconfig                  |  2 +
 configs/sifive_fu540_defconfig                |  1 +
 configs/silk_defconfig                        |  4 ++
 configs/sksimx6_defconfig                     |  3 ++
 configs/slimbootloader_defconfig              |  1 +
 configs/smartweb_defconfig                    |  1 +
 configs/smdk5250_defconfig                    |  3 ++
 configs/smdk5420_defconfig                    |  3 ++
 configs/smdkc100_defconfig                    |  2 +
 configs/smdkv310_defconfig                    |  2 +
 configs/snow_defconfig                        |  3 ++
 configs/socfpga_arria10_defconfig             |  2 +
 configs/socfpga_arria5_defconfig              |  2 +
 configs/socfpga_cyclone5_defconfig            |  2 +
 configs/socfpga_dbm_soc1_defconfig            |  2 +
 configs/socfpga_de0_nano_soc_defconfig        |  2 +
 configs/socfpga_de10_nano_defconfig           |  2 +
 configs/socfpga_de1_soc_defconfig             |  2 +
 configs/socfpga_is1_defconfig                 |  3 ++
 configs/socfpga_mcvevk_defconfig              |  2 +
 configs/socfpga_sockit_defconfig              |  2 +
 configs/socfpga_socrates_defconfig            |  2 +
 configs/socfpga_sr1500_defconfig              |  4 ++
 configs/socfpga_stratix10_defconfig           |  2 +
 configs/socfpga_vining_fpga_defconfig         |  4 ++
 configs/socrates_defconfig                    |  4 ++
 configs/som-db5800-som-6867_defconfig         |  3 ++
 configs/spear300_defconfig                    |  3 ++
 configs/spear300_nand_defconfig               |  2 +
 configs/spear300_usbtty_defconfig             |  3 ++
 configs/spear300_usbtty_nand_defconfig        |  2 +
 configs/spear310_defconfig                    |  3 ++
 configs/spear310_nand_defconfig               |  2 +
 configs/spear310_pnor_defconfig               |  3 ++
 configs/spear310_usbtty_defconfig             |  3 ++
 configs/spear310_usbtty_nand_defconfig        |  2 +
 configs/spear310_usbtty_pnor_defconfig        |  3 ++
 configs/spear320_defconfig                    |  3 ++
 configs/spear320_nand_defconfig               |  2 +
 configs/spear320_pnor_defconfig               |  3 ++
 configs/spear320_usbtty_defconfig             |  3 ++
 configs/spear320_usbtty_nand_defconfig        |  2 +
 configs/spear320_usbtty_pnor_defconfig        |  3 ++
 configs/spear600_defconfig                    |  3 ++
 configs/spear600_nand_defconfig               |  2 +
 configs/spear600_usbtty_defconfig             |  3 ++
 configs/spear600_usbtty_nand_defconfig        |  2 +
 configs/spring_defconfig                      |  3 ++
 configs/stih410-b2260_defconfig               |  1 +
 configs/stm32f429-discovery_defconfig         |  3 ++
 configs/stm32f429-evaluation_defconfig        |  1 +
 configs/stm32f469-discovery_defconfig         |  1 +
 configs/stm32f746-disco_defconfig             |  1 +
 configs/stm32f769-disco_defconfig             |  1 +
 configs/stm32h743-disco_defconfig             |  1 +
 configs/stm32h743-eval_defconfig              |  1 +
 configs/stm32mp15_basic_defconfig             |  1 +
 configs/stm32mp15_optee_defconfig             |  1 +
 configs/stm32mp15_trusted_defconfig           |  1 +
 configs/stmark2_defconfig                     |  3 ++
 configs/stout_defconfig                       |  4 ++
 configs/strider_con_defconfig                 |  4 ++
 configs/strider_con_dp_defconfig              |  4 ++
 configs/strider_cpu_defconfig                 |  4 ++
 configs/strider_cpu_dp_defconfig              |  4 ++
 configs/stv0991_defconfig                     |  4 ++
 configs/suvd3_defconfig                       |  4 ++
 configs/taurus_defconfig                      |  1 +
 configs/tbs2910_defconfig                     |  2 +
 configs/tec-ng_defconfig                      |  2 +
 configs/tec_defconfig                         |  2 +
 ...able-x86-conga-qa3-e3845-pcie-x4_defconfig |  4 ++
 .../theadorable-x86-conga-qa3-e3845_defconfig |  4 ++
 configs/theadorable-x86-dfi-bt700_defconfig   |  4 ++
 configs/theadorable_debug_defconfig           |  3 ++
 configs/thuban_defconfig                      |  1 +
 configs/thunderx_88xx_defconfig               |  1 +
 configs/ti816x_evm_defconfig                  |  3 +-
 configs/tinker-rk3288_defconfig               |  1 +
 configs/titanium_defconfig                    |  3 ++
 configs/tools-only_defconfig                  |  1 +
 configs/topic_miami_defconfig                 |  1 +
 configs/topic_miamilite_defconfig             |  1 +
 configs/topic_miamiplus_defconfig             |  1 +
 configs/tplink_wdr4300_defconfig              |  1 +
 configs/tqma6dl_mba6_mmc_defconfig            |  2 +
 configs/tqma6dl_mba6_spi_defconfig            |  4 ++
 configs/tqma6q_mba6_mmc_defconfig             |  2 +
 configs/tqma6q_mba6_spi_defconfig             |  4 ++
 configs/tqma6s_mba6_mmc_defconfig             |  2 +
 configs/tqma6s_mba6_spi_defconfig             |  4 ++
 configs/tqma6s_wru4_mmc_defconfig             |  2 +
 configs/trats2_defconfig                      |  2 +
 configs/trats_defconfig                       |  2 +
 configs/tricorder_defconfig                   |  1 +
 configs/trimslice_defconfig                   |  3 ++
 configs/ts4600_defconfig                      |  2 +
 configs/ts4800_defconfig                      |  2 +
 configs/tuge1_defconfig                       |  4 ++
 configs/turris_mox_defconfig                  |  3 ++
 configs/turris_omnia_defconfig                |  3 ++
 configs/tuxx1_defconfig                       |  4 ++
 configs/u200_defconfig                        |  1 +
 configs/uDPU_defconfig                        |  3 ++
 configs/udoo_defconfig                        |  2 +
 configs/udoo_neo_defconfig                    |  2 +
 configs/uniphier_ld4_sld8_defconfig           |  1 +
 configs/uniphier_v7_defconfig                 |  1 +
 configs/uniphier_v8_defconfig                 |  1 +
 configs/usbarmory_defconfig                   |  2 +
 configs/variscite_dart6ul_defconfig           |  1 +
 configs/vct_platinum_defconfig                |  4 ++
 configs/vct_platinum_onenand_defconfig        |  2 +
 configs/vct_platinum_onenand_small_defconfig  |  2 +
 configs/vct_platinum_small_defconfig          |  4 ++
 configs/vct_platinumavc_defconfig             |  4 ++
 configs/vct_platinumavc_onenand_defconfig     |  2 +
 .../vct_platinumavc_onenand_small_defconfig   |  2 +
 configs/vct_platinumavc_small_defconfig       |  4 ++
 configs/vct_premium_defconfig                 |  4 ++
 configs/vct_premium_onenand_defconfig         |  2 +
 configs/vct_premium_onenand_small_defconfig   |  2 +
 configs/vct_premium_small_defconfig           |  4 ++
 configs/ve8313_defconfig                      |  4 ++
 configs/venice2_defconfig                     |  2 +
 configs/ventana_defconfig                     |  2 +
 configs/vexpress_aemv8a_juno_defconfig        |  3 ++
 configs/vexpress_aemv8a_semi_defconfig        |  3 ++
 configs/vexpress_ca15_tc2_defconfig           |  3 ++
 configs/vexpress_ca5x2_defconfig              |  3 ++
 configs/vexpress_ca9x4_defconfig              |  3 ++
 configs/vf610twr_defconfig                    |  2 +
 configs/vf610twr_nand_defconfig               |  2 +
 configs/vining_2000_defconfig                 |  3 ++
 configs/vme8349_defconfig                     |  4 ++
 configs/vyasa-rk3288_defconfig                |  1 +
 configs/wandboard_defconfig                   |  2 +
 configs/warp7_bl33_defconfig                  |  2 +
 configs/warp7_defconfig                       |  2 +
 configs/warp_defconfig                        |  2 +
 configs/wb45n_defconfig                       |  3 +-
 configs/wb50n_defconfig                       |  1 +
 configs/woodburn_defconfig                    |  4 ++
 configs/woodburn_sd_defconfig                 |  4 ++
 configs/work_92105_defconfig                  |  3 ++
 configs/x530_defconfig                        |  4 ++
 configs/x600_defconfig                        |  4 ++
 configs/xfi3_defconfig                        |  1 +
 configs/xilinx_zynqmp_r5_defconfig            |  1 +
 configs/xpedite517x_defconfig                 |  3 ++
 configs/xpedite520x_defconfig                 |  3 ++
 configs/xpedite537x_defconfig                 |  3 ++
 configs/xpedite550x_defconfig                 |  3 ++
 configs/xpress_defconfig                      |  2 +
 configs/xpress_spl_defconfig                  |  2 +
 configs/xtfpga_defconfig                      |  3 ++
 configs/zc5202_defconfig                      |  2 +
 configs/zc5601_defconfig                      |  2 +
 configs/zmx25_defconfig                       |  3 ++
 configs/zynq_zc770_xm012_defconfig            |  1 +
 env/Kconfig                                   | 32 +++++++++---
 env/embedded.c                                |  2 +-
 env/mmc.c                                     |  4 --
 env/remote.c                                  |  4 --
 env/sf.c                                      |  6 +--
 include/configs/10m50_devboard.h              |  2 -
 include/configs/3c120_devboard.h              |  2 -
 include/configs/B4860QDS.h                    | 21 +-------
 include/configs/BSC9131RDB.h                  |  8 ---
 include/configs/BSC9132QDS.h                  | 14 -----
 include/configs/C29XPCIE.h                    | 14 +----
 include/configs/M5208EVBE.h                   |  3 --
 include/configs/M52277EVB.h                   |  6 ---
 include/configs/M5235EVB.h                    | 10 ----
 include/configs/M5249EVB.h                    |  4 --
 include/configs/M5253DEMO.h                   |  7 ---
 include/configs/M5272C3.h                     |  7 ---
 include/configs/M5275EVB.h                    |  7 ---
 include/configs/M5282EVB.h                    |  2 -
 include/configs/M53017EVB.h                   |  3 --
 include/configs/M5329EVB.h                    |  2 -
 include/configs/M5373EVB.h                    |  2 -
 include/configs/M54418TWR.h                   | 14 -----
 include/configs/M54451EVB.h                   |  9 ----
 include/configs/M54455EVB.h                   |  9 ----
 include/configs/M5475EVB.h                    |  2 -
 include/configs/M5485EVB.h                    |  2 -
 include/configs/MCR3000.h                     |  2 -
 include/configs/MPC8308RDB.h                  |  5 --
 include/configs/MPC8313ERDB_NAND.h            |  6 +--
 include/configs/MPC8313ERDB_NOR.h             |  8 ---
 include/configs/MPC8315ERDB.h                 |  9 ----
 include/configs/MPC8323ERDB.h                 |  9 ----
 include/configs/MPC832XEMDS.h                 |  9 ----
 include/configs/MPC8349EMDS.h                 | 10 ----
 include/configs/MPC8349EMDS_SDRAM.h           | 10 ----
 include/configs/MPC8349ITX.h                  | 10 ----
 include/configs/MPC837XEMDS.h                 |  9 ----
 include/configs/MPC837XERDB.h                 |  9 ----
 include/configs/MPC8536DS.h                   | 11 ----
 include/configs/MPC8540ADS.h                  |  8 ---
 include/configs/MPC8541CDS.h                  |  3 --
 include/configs/MPC8544DS.h                   |  7 ---
 include/configs/MPC8548CDS.h                  |  7 ---
 include/configs/MPC8555CDS.h                  |  3 --
 include/configs/MPC8560ADS.h                  |  8 ---
 include/configs/MPC8568MDS.h                  |  3 --
 include/configs/MPC8569MDS.h                  |  6 ---
 include/configs/MPC8572DS.h                   | 12 -----
 include/configs/MPC8610HPCD.h                 |  8 ---
 include/configs/MPC8641HPCN.h                 |  8 ---
 include/configs/MigoR.h                       |  4 --
 include/configs/P1010RDB.h                    | 18 +------
 include/configs/P1022DS.h                     | 22 ++------
 include/configs/P1023RDB.h                    |  4 --
 include/configs/P2041RDB.h                    | 18 -------
 include/configs/SBx81LIFKW.h                  |  3 --
 include/configs/SBx81LIFXCAT.h                |  3 --
 include/configs/T102xQDS.h                    | 21 +-------
 include/configs/T102xRDB.h                    | 29 +----------
 include/configs/T1040QDS.h                    | 15 ------
 include/configs/T104xRDB.h                    | 15 +-----
 include/configs/T208xQDS.h                    | 21 +-------
 include/configs/T208xRDB.h                    | 21 +-------
 include/configs/T4240QDS.h                    | 17 ------
 include/configs/T4240RDB.h                    | 18 +------
 include/configs/TQM834x.h                     |  5 --
 include/configs/UCP1020.h                     | 40 +-------------
 include/configs/adp-ae3xx.h                   |  3 --
 include/configs/adp-ag101p.h                  |  3 --
 include/configs/advantech_dms-ba16.h          |  4 --
 include/configs/am335x_evm.h                  | 12 -----
 include/configs/am335x_shc.h                  |  4 --
 include/configs/am335x_sl50.h                 |  2 -
 include/configs/am3517_crane.h                |  1 -
 include/configs/am3517_evm.h                  |  1 -
 include/configs/am43xx_evm.h                  |  4 --
 include/configs/am57xx_evm.h                  |  1 -
 include/configs/am65x_evm.h                   |  5 --
 include/configs/amcore.h                      |  5 --
 include/configs/ap121.h                       |  4 --
 include/configs/ap143.h                       |  4 --
 include/configs/ap152.h                       |  3 --
 include/configs/apalis-imx8.h                 |  3 --
 include/configs/apalis-tk1.h                  |  2 -
 include/configs/apalis_imx6.h                 |  3 --
 include/configs/apalis_t30.h                  |  2 -
 include/configs/apf27.h                       |  4 --
 include/configs/apx4devkit.h                  |  7 ---
 include/configs/aristainetos-common.h         |  4 --
 include/configs/armadillo-800eva.h            |  5 --
 include/configs/arndale.h                     |  2 -
 include/configs/aspenite.h                    |  1 -
 include/configs/astro_mcf5373l.h              |  4 --
 include/configs/at91-sama5_common.h           |  1 -
 include/configs/at91rm9200ek.h                |  2 -
 include/configs/at91sam9260ek.h               | 11 ----
 include/configs/at91sam9261ek.h               |  9 ----
 include/configs/at91sam9263ek.h               |  9 ----
 include/configs/at91sam9m10g45ek.h            |  4 --
 include/configs/at91sam9n12ek.h               |  9 ----
 include/configs/at91sam9rlek.h                |  7 ---
 include/configs/at91sam9x5ek.h                |  1 -
 include/configs/ax25-ae350.h                  |  2 -
 include/configs/bav335x.h                     | 13 -----
 include/configs/bayleybay.h                   |  2 -
 include/configs/bcm23550_w1d.h                |  2 -
 include/configs/bcm28155_ap.h                 |  2 -
 include/configs/bcm7260.h                     |  1 -
 include/configs/bcm7445.h                     |  2 -
 include/configs/bcm_ep_board.h                |  2 -
 include/configs/bcm_northstar2.h              |  2 -
 include/configs/bcmstb.h                      |  2 -
 include/configs/beaver.h                      |  1 -
 include/configs/bg0900.h                      |  1 -
 include/configs/bk4r1.h                       |  7 ---
 include/configs/blanche.h                     |  8 ---
 include/configs/boston.h                      |  9 ----
 include/configs/broadcom_bcm963158.h          |  1 -
 include/configs/broadcom_bcm968380gerg.h      |  2 -
 include/configs/broadcom_bcm968580xref.h      |  1 -
 include/configs/brppt1.h                      |  5 --
 include/configs/brppt2.h                      |  3 --
 include/configs/brsmarc1.h                    |  2 -
 include/configs/brxre1.h                      |  3 --
 include/configs/bubblegum_96.h                |  2 -
 include/configs/caddy2.h                      |  9 ----
 include/configs/cardhu.h                      |  1 -
 include/configs/cei-tk1-som.h                 |  1 -
 include/configs/cgtqmx6eval.h                 |  8 ---
 include/configs/cherryhill.h                  |  2 -
 include/configs/chiliboard.h                  |  2 -
 include/configs/chromebook_link.h             |  3 --
 include/configs/chromebook_samus.h            |  3 --
 include/configs/ci20.h                        |  2 -
 include/configs/cl-som-imx7.h                 |  3 --
 include/configs/clearfog.h                    |  4 --
 include/configs/cm_fx6.h                      |  3 --
 include/configs/cm_t335.h                     |  1 -
 include/configs/cm_t35.h                      |  2 -
 include/configs/cm_t54.h                      |  5 --
 include/configs/cobra5272.h                   |  8 ---
 include/configs/colibri-imx6ull.h             |  6 ---
 include/configs/colibri-imx8x.h               |  3 --
 include/configs/colibri_imx6.h                |  3 --
 include/configs/colibri_imx7.h                |  7 ---
 include/configs/colibri_pxa270.h              |  4 --
 include/configs/colibri_t20.h                 |  3 --
 include/configs/colibri_t30.h                 |  2 -
 include/configs/colibri_vf.h                  |  2 -
 include/configs/comtrend_ar5315u.h            |  1 -
 include/configs/comtrend_ar5387un.h           |  1 -
 include/configs/comtrend_ct5361.h             |  1 -
 include/configs/comtrend_vr3032u.h            |  2 -
 include/configs/comtrend_wap5813n.h           |  1 -
 include/configs/condor.h                      |  3 --
 include/configs/conga-qeval20-qa3-e3845.h     |  3 --
 include/configs/controlcenterd.h              |  6 ---
 include/configs/controlcenterdc.h             |  3 --
 include/configs/corenet_ds.h                  | 17 ------
 include/configs/corvus.h                      |  1 -
 include/configs/cougarcanyon2.h               |  2 -
 include/configs/crownbay.h                    |  2 -
 include/configs/crs305-1g-4s.h                |  3 --
 include/configs/cyrus.h                       |  2 -
 include/configs/da850evm.h                    | 15 ------
 include/configs/dalmore.h                     |  1 -
 include/configs/dart_6ul.h                    |  4 --
 include/configs/db-88f6281-bp.h               |  3 --
 include/configs/db-88f6720.h                  |  3 --
 include/configs/db-88f6820-amc.h              |  3 --
 include/configs/db-88f6820-gp.h               |  3 --
 include/configs/db-mv784mp-gp.h               |  3 --
 include/configs/db-xc3-24g4xg.h               |  3 --
 include/configs/devkit3250.h                  |  2 -
 include/configs/dfi-bt700.h                   |  3 --
 include/configs/dh_imx6.h                     |  8 ---
 include/configs/display5.h                    |  5 --
 include/configs/dns325.h                      |  7 ---
 include/configs/dockstar.h                    |  6 ---
 include/configs/dra7xx_evm.h                  | 12 -----
 include/configs/draak.h                       |  1 -
 include/configs/draco.h                       |  1 -
 include/configs/dragonboard410c.h             |  1 -
 include/configs/dragonboard820c.h             |  2 -
 include/configs/dreamplug.h                   |  6 ---
 include/configs/ds109.h                       |  6 ---
 include/configs/ds414.h                       |  3 --
 include/configs/durian.h                      |  1 -
 include/configs/e2220-1170.h                  |  1 -
 include/configs/eagle.h                       |  3 --
 include/configs/eb_cpu5282.h                  |  3 --
 include/configs/ebisu.h                       |  1 -
 include/configs/edb93xx.h                     | 13 -----
 include/configs/edison.h                      |  3 --
 include/configs/edminiv2.h                    |  3 --
 include/configs/el6x_common.h                 |  3 --
 include/configs/embestmx6boards.h             |  4 --
 include/configs/etamin.h                      |  3 --
 include/configs/ethernut5.h                   |  1 -
 include/configs/evb_ast2500.h                 |  2 -
 include/configs/exynos5-common.h              |  5 --
 include/configs/exynos5-dt-common.h           |  1 -
 include/configs/exynos7420-common.h           |  1 -
 include/configs/flea3.h                       |  7 ---
 include/configs/galileo.h                     |  2 -
 .../configs/gardena-smart-gateway-mt7688.h    |  5 --
 include/configs/gazerbeam.h                   |  5 --
 include/configs/ge_bx50v3.h                   |  3 --
 include/configs/goflexhome.h                  |  6 ---
 include/configs/gplugd.h                      |  1 -
 include/configs/grpeach.h                     |  3 --
 include/configs/guruplug.h                    |  5 --
 include/configs/gw_ventana.h                  | 12 -----
 include/configs/harmony.h                     |  1 -
 include/configs/helios4.h                     |  7 ---
 include/configs/highbank.h                    |  2 -
 include/configs/hikey.h                       |  1 -
 include/configs/hikey960.h                    |  4 --
 include/configs/hrcon.h                       |  9 ----
 include/configs/huawei_hg556a.h               |  1 -
 include/configs/ib62x0.h                      |  5 --
 include/configs/iconnect.h                    |  5 --
 include/configs/ids8313.h                     |  4 --
 include/configs/imgtec_xilfpga.h              |  1 -
 include/configs/imx27lite-common.h            |  2 -
 include/configs/imx6-engicam.h                |  5 --
 include/configs/imx6_logic.h                  |  3 --
 include/configs/imx6dl-mamoj.h                |  4 --
 include/configs/imx8mm_evk.h                  |  4 --
 include/configs/imx8mn_evk.h                  |  4 --
 include/configs/imx8mq_evk.h                  |  2 -
 include/configs/imx8qm_mek.h                  |  2 -
 include/configs/imx8qm_rom7720.h              |  4 --
 include/configs/imx8qxp_mek.h                 |  2 -
 include/configs/integratorap.h                |  1 -
 include/configs/integratorcp.h                |  6 ---
 include/configs/j721e_evm.h                   |  2 -
 include/configs/jetson-tk1.h                  |  1 -
 include/configs/k2e_evm.h                     |  3 --
 include/configs/k2g_evm.h                     |  2 -
 include/configs/k2hk_evm.h                    |  3 --
 include/configs/k2l_evm.h                     |  3 --
 include/configs/km/km-mpc83xx.h               | 15 ------
 include/configs/km/km-powerpc.h               |  2 -
 include/configs/km/km_arm.h                   |  8 ---
 include/configs/kmp204x.h                     |  4 --
 include/configs/kmtegr1.h                     |  3 --
 include/configs/kp_imx53.h                    |  3 --
 include/configs/kp_imx6q_tpc.h                |  3 --
 include/configs/kzm9g.h                       |  3 --
 include/configs/lacie_kw.h                    |  4 --
 include/configs/legoev3.h                     |  2 -
 include/configs/libretech-ac.h                |  3 --
 include/configs/linkit-smart-7688.h           |  3 --
 include/configs/liteboard.h                   |  2 -
 include/configs/ls1012a_common.h              |  8 ---
 include/configs/ls1012afrwy.h                 |  8 ---
 include/configs/ls1012ardb.h                  |  2 -
 include/configs/ls1021aiot.h                  |  6 ---
 include/configs/ls1021aqds.h                  | 13 -----
 include/configs/ls1021atsn.h                  |  6 ---
 include/configs/ls1021atwr.h                  | 10 ----
 include/configs/ls1028a_common.h              |  4 --
 include/configs/ls1028aqds.h                  |  1 -
 include/configs/ls1028ardb.h                  |  1 -
 include/configs/ls1043aqds.h                  | 17 ------
 include/configs/ls1043ardb.h                  | 13 -----
 include/configs/ls1046afrwy.h                 |  5 --
 include/configs/ls1046aqds.h                  | 17 ------
 include/configs/ls1046ardb.h                  | 10 ----
 include/configs/ls1088a_common.h              |  3 --
 include/configs/ls1088aqds.h                  | 14 -----
 include/configs/ls1088ardb.h                  | 13 -----
 include/configs/ls2080a_common.h              |  8 ---
 include/configs/ls2080a_emu.h                 |  1 -
 include/configs/ls2080a_simu.h                |  1 -
 include/configs/ls2080aqds.h                  | 16 ------
 include/configs/ls2080ardb.h                  | 17 ------
 include/configs/lsxl.h                        |  4 --
 include/configs/lx2160a_common.h              |  5 --
 include/configs/m53menlo.h                    |  7 +--
 include/configs/malta.h                       |  4 --
 include/configs/maxbcm.h                      |  3 --
 include/configs/mccmon6.h                     |  5 --
 include/configs/medcom-wide.h                 |  1 -
 include/configs/meerkat96.h                   |  2 -
 include/configs/meesc.h                       |  5 --
 include/configs/meson64.h                     |  3 --
 include/configs/meson64_android.h             |  2 -
 include/configs/microblaze-generic.h          | 15 ------
 include/configs/microchip_mpfs_icicle.h       |  1 -
 include/configs/minnowmax.h                   |  3 --
 include/configs/mpc8308_p1m.h                 |  5 --
 include/configs/mt7623.h                      |  2 -
 include/configs/mt7629.h                      |  1 -
 include/configs/mvebu_armada-37xx.h           |  3 --
 include/configs/mvebu_armada-8k.h             |  4 --
 include/configs/mx23_olinuxino.h              |  2 -
 include/configs/mx23evk.h                     |  2 -
 include/configs/mx25pdk.h                     |  2 -
 include/configs/mx28evk.h                     | 15 ------
 include/configs/mx31pdk.h                     |  3 --
 include/configs/mx35pdk.h                     | 11 ----
 include/configs/mx51evk.h                     |  2 -
 include/configs/mx53ard.h                     |  2 -
 include/configs/mx53cx9020.h                  |  2 -
 include/configs/mx53evk.h                     |  2 -
 include/configs/mx53loco.h                    |  2 -
 include/configs/mx53ppd.h                     |  2 -
 include/configs/mx53smd.h                     |  2 -
 include/configs/mx6cuboxi.h                   |  2 -
 include/configs/mx6memcal.h                   |  2 -
 include/configs/mx6qarm2.h                    |  2 -
 include/configs/mx6sabre_common.h             |  5 --
 include/configs/mx6slevk.h                    |  8 ---
 include/configs/mx6sllevk.h                   |  3 --
 include/configs/mx6sxsabreauto.h              |  3 --
 include/configs/mx6sxsabresd.h                |  3 --
 include/configs/mx6ul_14x14_evk.h             |  2 -
 include/configs/mx6ullevk.h                   |  3 --
 include/configs/mx7dsabresd.h                 |  2 -
 include/configs/mx7ulp_evk.h                  |  3 --
 include/configs/nas220.h                      |  6 ---
 include/configs/netgear_cg3100d.h             |  1 -
 include/configs/netgear_dgnd3700v2.h          |  1 -
 include/configs/nitrogen6x.h                  |  5 --
 include/configs/novena.h                      |  4 --
 include/configs/nsa310s.h                     |  5 --
 include/configs/nyan-big.h                    |  1 -
 include/configs/odroid.h                      |  2 -
 include/configs/odroid_xu3.h                  |  5 --
 include/configs/omap3_beagle.h                |  1 -
 include/configs/omap3_cairo.h                 |  1 -
 include/configs/omap3_evm.h                   |  1 -
 include/configs/omap3_logic.h                 |  1 -
 include/configs/omap3_overo.h                 |  2 -
 include/configs/omap3_pandora.h               |  1 -
 include/configs/omap3_zoom1.h                 |  1 -
 include/configs/omap4_sdp4430.h               |  1 -
 include/configs/omap5_uevm.h                  |  1 -
 include/configs/omapl138_lcdk.h               |  9 ----
 include/configs/openrd.h                      |  5 --
 include/configs/opos6uldev.h                  |  3 --
 include/configs/origen.h                      |  2 -
 include/configs/ot1200.h                      |  3 --
 include/configs/p1_p2_rdb_pc.h                | 22 ++------
 include/configs/p1_twr.h                      |  8 ---
 include/configs/p2371-0000.h                  |  1 -
 include/configs/p2371-2180.h                  |  1 -
 include/configs/p2571.h                       |  1 -
 include/configs/p2771-0000.h                  |  1 -
 include/configs/paz00.h                       |  1 -
 include/configs/pcl063.h                      |  3 --
 include/configs/pcl063_ull.h                  |  4 --
 include/configs/pcm052.h                      | 10 ----
 include/configs/pcm058.h                      | 10 ----
 include/configs/pdu001.h                      |  1 -
 include/configs/pengwyn.h                     |  2 -
 include/configs/pfla02.h                      | 10 ----
 include/configs/pic32mzdask.h                 |  1 -
 include/configs/pico-imx6.h                   |  2 -
 include/configs/pico-imx6ul.h                 |  2 -
 include/configs/pico-imx7d.h                  |  2 -
 include/configs/picosam9g45.h                 |  1 -
 include/configs/platinum.h                    |  6 ---
 include/configs/plutux.h                      |  1 -
 include/configs/pm9261.h                      |  9 ----
 include/configs/pm9263.h                      |  9 ----
 include/configs/pm9g45.h                      |  4 --
 include/configs/pogo_e02.h                    |  6 ---
 include/configs/poplar.h                      |  2 -
 include/configs/puma_rk3399.h                 |  2 -
 include/configs/pumpkin.h                     |  1 -
 include/configs/qemu-arm.h                    |  2 -
 include/configs/qemu-mips.h                   |  2 -
 include/configs/qemu-mips64.h                 |  2 -
 include/configs/qemu-ppce500.h                |  1 -
 include/configs/qemu-riscv.h                  |  1 -
 include/configs/qemu-x86.h                    |  3 --
 include/configs/r2dplus.h                     |  4 --
 include/configs/r7780mp.h                     |  3 --
 include/configs/rastaban.h                    |  1 -
 include/configs/rcar-gen2-common.h            |  4 --
 include/configs/rcar-gen3-common.h            |  2 -
 include/configs/rpi.h                         |  1 -
 include/configs/s32v234evb.h                  |  2 -
 include/configs/s5p_goni.h                    |  2 -
 include/configs/s5pc210_universal.h           |  2 -
 include/configs/sagem_f@st1704.h              |  1 -
 include/configs/salvator-x.h                  |  1 -
 include/configs/sam9x60ek.h                   |  1 -
 include/configs/sandbox.h                     |  2 -
 include/configs/sansa_fuze_plus.h             |  1 -
 include/configs/sbc8349.h                     |  9 ----
 include/configs/sbc8548.h                     | 14 -----
 include/configs/sbc8641d.h                    |  3 --
 include/configs/sc_sps_1.h                    |  2 -
 include/configs/seaboard.h                    |  1 -
 include/configs/secomx6quq7.h                 |  2 -
 include/configs/sfr_nb4_ser.h                 |  1 -
 include/configs/sh7752evb.h                   |  4 --
 include/configs/sh7753evb.h                   |  4 --
 include/configs/sh7757lcr.h                   |  4 --
 include/configs/sh7763rdp.h                   |  5 --
 include/configs/sheevaplug.h                  |  6 ---
 include/configs/siemens-am33x-common.h        |  4 --
 include/configs/sifive-fu540.h                |  1 -
 include/configs/sksimx6.h                     |  4 --
 include/configs/smartweb.h                    |  1 -
 include/configs/smdkc100.h                    |  3 --
 include/configs/smdkv310.h                    |  2 -
 include/configs/socfpga_common.h              | 10 +---
 include/configs/socfpga_sr1500.h              |  4 --
 include/configs/socfpga_stratix10_socdk.h     |  9 ----
 include/configs/socfpga_vining_fpga.h         |  5 --
 include/configs/socrates.h                    |  5 --
 include/configs/som-db5800-som-6867.h         |  3 --
 include/configs/spear-common.h                |  7 ---
 include/configs/stih410-b2260.h               |  3 --
 include/configs/stm32f429-discovery.h         |  4 --
 include/configs/stm32f429-evaluation.h        |  4 --
 include/configs/stm32f469-discovery.h         |  4 --
 include/configs/stm32f746-disco.h             |  2 -
 include/configs/stm32h743-disco.h             |  2 -
 include/configs/stm32h743-eval.h              |  2 -
 include/configs/stmark2.h                     |  3 --
 include/configs/strider.h                     |  9 ----
 include/configs/stv0991.h                     |  5 --
 include/configs/t4qds.h                       |  4 +-
 include/configs/tam3517-common.h              |  4 --
 include/configs/tao3530.h                     |  1 -
 include/configs/taurus.h                      |  1 -
 include/configs/tbs2910.h                     |  2 -
 include/configs/tec-ng.h                      |  1 -
 include/configs/tec.h                         |  1 -
 include/configs/tegra-common.h                |  1 -
 include/configs/theadorable-x86-common.h      |  6 ---
 include/configs/theadorable.h                 |  3 --
 include/configs/thuban.h                      |  1 -
 include/configs/thunderx_88xx.h               |  1 -
 include/configs/ti816x_evm.h                  |  3 --
 include/configs/titanium.h                    |  6 ---
 include/configs/topic_miami.h                 |  4 --
 include/configs/tplink_wdr4300.h              |  2 -
 include/configs/tqma6.h                       |  7 ---
 include/configs/trats.h                       |  2 -
 include/configs/trats2.h                      |  2 -
 include/configs/tricorder.h                   |  1 -
 include/configs/trimslice.h                   |  2 -
 include/configs/ts4600.h                      |  2 -
 include/configs/ts4800.h                      |  2 -
 include/configs/turris_mox.h                  |  3 --
 include/configs/turris_omnia.h                |  3 --
 include/configs/udoo.h                        |  2 -
 include/configs/udoo_neo.h                    |  2 -
 include/configs/ulcb.h                        |  1 -
 include/configs/uniphier.h                    |  4 --
 include/configs/usbarmory.h                   |  2 -
 include/configs/vcoreiii.h                    |  9 ----
 include/configs/vct.h                         |  7 ---
 include/configs/ve8313.h                      |  6 ---
 include/configs/venice2.h                     |  1 -
 include/configs/ventana.h                     |  1 -
 include/configs/vexpress_aemv8a.h             |  5 --
 include/configs/vexpress_common.h             |  6 ---
 include/configs/vf610twr.h                    |  6 ---
 include/configs/vinco.h                       |  5 --
 include/configs/vining_2000.h                 |  4 --
 include/configs/vme8349.h                     |  9 ----
 include/configs/wandboard.h                   |  2 -
 include/configs/warp.h                        |  2 -
 include/configs/warp7.h                       |  2 -
 include/configs/wb45n.h                       |  3 --
 include/configs/wb50n.h                       |  1 -
 include/configs/woodburn_common.h             |  7 ---
 include/configs/work_92105.h                  |  5 --
 include/configs/x530.h                        |  4 --
 include/configs/x600.h                        |  6 ---
 include/configs/x86-chromebook.h              |  5 --
 include/configs/x86-common.h                  |  1 -
 include/configs/xfi3.h                        |  1 -
 include/configs/xilinx_zynqmp_r5.h            |  2 -
 include/configs/xpedite517x.h                 |  3 --
 include/configs/xpedite520x.h                 |  3 --
 include/configs/xpedite537x.h                 |  3 --
 include/configs/xpedite550x.h                 |  3 --
 include/configs/xpress.h                      |  2 -
 include/configs/xtfpga.h                      |  2 -
 include/configs/zmx25.h                       |  4 --
 include/env_internal.h                        | 52 -------------------
 scripts/config_whitelist.txt                  |  3 --
 1605 files changed, 2597 insertions(+), 2331 deletions(-)

diff --git a/arch/arm/cpu/armv8/fsl-layerscape/soc.c b/arch/arm/cpu/armv8/fsl-layerscape/soc.c
index f0df88c565ab..adfa51b6be0d 100644
--- a/arch/arm/cpu/armv8/fsl-layerscape/soc.c
+++ b/arch/arm/cpu/armv8/fsl-layerscape/soc.c
@@ -844,7 +844,7 @@ int board_late_init(void)
 	 * check if gd->env_addr is default_environment; then setenv bootcmd
 	 * and mcinitcmd.
 	 */
-#if !defined(CONFIG_ENV_ADDR) || defined(ENV_IS_EMBEDDED)
+#ifdef CONFIG_SYS_RELOC_GD_ENV_ADDR
 	if (gd->env_addr == (ulong)&default_environment[0]) {
 #else
 	if (gd->env_addr + gd->reloc_off == (ulong)&default_environment[0]) {
diff --git a/board/freescale/b4860qds/spl.c b/board/freescale/b4860qds/spl.c
index 6dfc0c73eca9..06ea8775044a 100644
--- a/board/freescale/b4860qds/spl.c
+++ b/board/freescale/b4860qds/spl.c
@@ -100,8 +100,8 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 #else
 	/* relocate environment function pointers etc. */
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 #endif
 
diff --git a/board/freescale/c29xpcie/spl.c b/board/freescale/c29xpcie/spl.c
index 29040962cf1b..9a2385b978c5 100644
--- a/board/freescale/c29xpcie/spl.c
+++ b/board/freescale/c29xpcie/spl.c
@@ -61,8 +61,8 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 
 	/* relocate environment function pointers etc. */
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 
 	i2c_init_all();
diff --git a/board/freescale/p1010rdb/spl.c b/board/freescale/p1010rdb/spl.c
index 8f050b3947d1..cb489140c030 100644
--- a/board/freescale/p1010rdb/spl.c
+++ b/board/freescale/p1010rdb/spl.c
@@ -86,8 +86,8 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 	/* relocate environment function pointers etc. */
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
-			    gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
+			    gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 #else
 	env_relocate();
diff --git a/board/freescale/p1022ds/spl.c b/board/freescale/p1022ds/spl.c
index 06273f1d20e6..8d2c1388ec3f 100644
--- a/board/freescale/p1022ds/spl.c
+++ b/board/freescale/p1022ds/spl.c
@@ -98,9 +98,9 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 	/* relocate environment function pointers etc. */
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
 
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 #else
 	env_relocate();
diff --git a/board/freescale/p1_p2_rdb_pc/spl.c b/board/freescale/p1_p2_rdb_pc/spl.c
index dbf9f739b28f..908f4bc96f50 100644
--- a/board/freescale/p1_p2_rdb_pc/spl.c
+++ b/board/freescale/p1_p2_rdb_pc/spl.c
@@ -91,8 +91,8 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 	/* relocate environment function pointers etc. */
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 #else
 	env_relocate();
diff --git a/board/freescale/t102xqds/spl.c b/board/freescale/t102xqds/spl.c
index 3008f0919f17..7a499a559fbd 100644
--- a/board/freescale/t102xqds/spl.c
+++ b/board/freescale/t102xqds/spl.c
@@ -125,19 +125,19 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_MMC_BOOT
 	mmc_initialize(bd);
 	mmc_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			   (uchar *)CONFIG_ENV_ADDR);
+			   (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_SPI_BOOT
 	fsl_spi_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			       (uchar *)CONFIG_ENV_ADDR);
+			       (uchar *)SPL_ENV_ADDR);
 #endif
 
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 
 	i2c_init_all();
diff --git a/board/freescale/t102xrdb/spl.c b/board/freescale/t102xrdb/spl.c
index 029e3d212ca6..c579be1cb253 100644
--- a/board/freescale/t102xrdb/spl.c
+++ b/board/freescale/t102xrdb/spl.c
@@ -112,19 +112,19 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_MMC_BOOT
 	mmc_initialize(bd);
 	mmc_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			   (uchar *)CONFIG_ENV_ADDR);
+			   (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_SPI_BOOT
 	fsl_spi_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			       (uchar *)CONFIG_ENV_ADDR);
+			       (uchar *)SPL_ENV_ADDR);
 #endif
 
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 
 	i2c_init_all();
diff --git a/board/freescale/t104xrdb/spl.c b/board/freescale/t104xrdb/spl.c
index 76b5160cf903..2c1f729fb52c 100644
--- a/board/freescale/t104xrdb/spl.c
+++ b/board/freescale/t104xrdb/spl.c
@@ -109,17 +109,17 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 #ifndef CONFIG_NXP_ESBC
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_MMC_BOOT
 	mmc_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			   (uchar *)CONFIG_ENV_ADDR);
+			   (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_SPI_BOOT
 	fsl_spi_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			       (uchar *)CONFIG_ENV_ADDR);
+			       (uchar *)SPL_ENV_ADDR);
 #endif
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 #endif
 
diff --git a/board/freescale/t208xqds/spl.c b/board/freescale/t208xqds/spl.c
index 9695dfc2e2ed..f0499ad7e542 100644
--- a/board/freescale/t208xqds/spl.c
+++ b/board/freescale/t208xqds/spl.c
@@ -111,19 +111,19 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_MMC_BOOT
 	mmc_initialize(bd);
 	mmc_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			   (uchar *)CONFIG_ENV_ADDR);
+			   (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_SPI_BOOT
 	fsl_spi_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			       (uchar *)CONFIG_ENV_ADDR);
+			       (uchar *)SPL_ENV_ADDR);
 #endif
 
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 
 	i2c_init_all();
diff --git a/board/freescale/t208xrdb/spl.c b/board/freescale/t208xrdb/spl.c
index ca7d6a28e052..d7ca0dd6db29 100644
--- a/board/freescale/t208xrdb/spl.c
+++ b/board/freescale/t208xrdb/spl.c
@@ -81,19 +81,19 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_MMC_BOOT
 	mmc_initialize(bd);
 	mmc_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			   (uchar *)CONFIG_ENV_ADDR);
+			   (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_SPI_BOOT
 	fsl_spi_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			       (uchar *)CONFIG_ENV_ADDR);
+			       (uchar *)SPL_ENV_ADDR);
 #endif
 
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 
 	i2c_init_all();
diff --git a/board/freescale/t4qds/spl.c b/board/freescale/t4qds/spl.c
index 7666fe7556dc..df81205e88da 100644
--- a/board/freescale/t4qds/spl.c
+++ b/board/freescale/t4qds/spl.c
@@ -120,15 +120,15 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 
 #ifdef CONFIG_SPL_NAND_BOOT
 	nand_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			    (uchar *)CONFIG_ENV_ADDR);
+			    (uchar *)SPL_ENV_ADDR);
 #endif
 #ifdef CONFIG_SPL_MMC_BOOT
 	mmc_initialize(bd);
 	mmc_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			   (uchar *)CONFIG_ENV_ADDR);
+			   (uchar *)SPL_ENV_ADDR);
 #endif
 
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 
 	i2c_init_all();
diff --git a/board/freescale/t4rdb/spl.c b/board/freescale/t4rdb/spl.c
index a19558bd6be1..ec3978a70aa7 100644
--- a/board/freescale/t4rdb/spl.c
+++ b/board/freescale/t4rdb/spl.c
@@ -84,9 +84,9 @@ void board_init_r(gd_t *gd, ulong dest_addr)
 
 	mmc_initialize(bd);
 	mmc_spl_load_image(CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE,
-			   (uchar *)CONFIG_ENV_ADDR);
+			   (uchar *)SPL_ENV_ADDR);
 
-	gd->env_addr  = (ulong)(CONFIG_ENV_ADDR);
+	gd->env_addr  = (ulong)(SPL_ENV_ADDR);
 	gd->env_valid = ENV_VALID;
 
 	i2c_init_all();
diff --git a/configs/10m50_defconfig b/configs/10m50_defconfig
index 119cbcd354a0..138bb5235406 100644
--- a/configs/10m50_defconfig
+++ b/configs/10m50_defconfig
@@ -1,6 +1,8 @@
 CONFIG_NIOS2=y
 CONFIG_SYS_CONFIG_NAME="10m50_devboard"
+CONFIG_ENV_SIZE=0x10000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_VERSION_VARIABLE=y
@@ -18,6 +20,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_DEFAULT_DEVICE_TREE="10m50_devboard"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF4080000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
 CONFIG_ALTERA_PIO=y
diff --git a/configs/3c120_defconfig b/configs/3c120_defconfig
index 42a032f1e76f..08758ca17e29 100644
--- a/configs/3c120_defconfig
+++ b/configs/3c120_defconfig
@@ -1,6 +1,8 @@
 CONFIG_NIOS2=y
 CONFIG_SYS_CONFIG_NAME="3c120_devboard"
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_FIT=y
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 CONFIG_VERSION_VARIABLE=y
@@ -18,6 +20,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_DEFAULT_DEVICE_TREE="3c120_devboard"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xE2880000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM_GPIO=y
 CONFIG_ALTERA_PIO=y
diff --git a/configs/B4420QDS_NAND_defconfig b/configs/B4420QDS_NAND_defconfig
index 863389e884a9..13475ba4501a 100644
--- a/configs/B4420QDS_NAND_defconfig
+++ b/configs/B4420QDS_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4420QDS=y
diff --git a/configs/B4420QDS_SPIFLASH_defconfig b/configs/B4420QDS_SPIFLASH_defconfig
index fbb359a7cc18..37723e8788e1 100644
--- a/configs/B4420QDS_SPIFLASH_defconfig
+++ b/configs/B4420QDS_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4420QDS=y
 CONFIG_FIT=y
diff --git a/configs/B4420QDS_defconfig b/configs/B4420QDS_defconfig
index c94444f42cbc..aa1b1f400ef5 100644
--- a/configs/B4420QDS_defconfig
+++ b/configs/B4420QDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4420QDS=y
 CONFIG_FIT=y
@@ -22,6 +24,7 @@ CONFIG_CMD_DATE=y
 CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/B4860QDS_NAND_defconfig b/configs/B4860QDS_NAND_defconfig
index b1922c1d32c8..0c7aa18dca78 100644
--- a/configs/B4860QDS_NAND_defconfig
+++ b/configs/B4860QDS_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4860QDS=y
diff --git a/configs/B4860QDS_SECURE_BOOT_defconfig b/configs/B4860QDS_SECURE_BOOT_defconfig
index 9ddcc0edbd02..739516ed723d 100644
--- a/configs/B4860QDS_SECURE_BOOT_defconfig
+++ b/configs/B4860QDS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4860QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/B4860QDS_SPIFLASH_defconfig b/configs/B4860QDS_SPIFLASH_defconfig
index cedf4c940c1f..1aa0c65fef20 100644
--- a/configs/B4860QDS_SPIFLASH_defconfig
+++ b/configs/B4860QDS_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4860QDS=y
 CONFIG_FIT=y
diff --git a/configs/B4860QDS_SRIO_PCIE_BOOT_defconfig b/configs/B4860QDS_SRIO_PCIE_BOOT_defconfig
index 412a7d49f166..2b8cc49ec239 100644
--- a/configs/B4860QDS_SRIO_PCIE_BOOT_defconfig
+++ b/configs/B4860QDS_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4860QDS=y
 CONFIG_FIT=y
@@ -23,6 +24,7 @@ CONFIG_CMD_DATE=y
 CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_FSL_CAAM=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/B4860QDS_defconfig b/configs/B4860QDS_defconfig
index 2df7196ef360..b4993d4f35c0 100644
--- a/configs/B4860QDS_defconfig
+++ b/configs/B4860QDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_B4860QDS=y
 CONFIG_FIT=y
@@ -22,6 +24,7 @@ CONFIG_CMD_DATE=y
 CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/BSC9131RDB_NAND_SYSCLK100_defconfig b/configs/BSC9131RDB_NAND_SYSCLK100_defconfig
index 3fd5b17a7e76..8d45903dd16e 100644
--- a/configs/BSC9131RDB_NAND_SYSCLK100_defconfig
+++ b/configs/BSC9131RDB_NAND_SYSCLK100_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9131RDB=y
diff --git a/configs/BSC9131RDB_NAND_defconfig b/configs/BSC9131RDB_NAND_defconfig
index abaa57ded19d..99cada8cc76d 100644
--- a/configs/BSC9131RDB_NAND_defconfig
+++ b/configs/BSC9131RDB_NAND_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9131RDB=y
diff --git a/configs/BSC9131RDB_SPIFLASH_SYSCLK100_defconfig b/configs/BSC9131RDB_SPIFLASH_SYSCLK100_defconfig
index 7e27adcbec69..603d752bcd5e 100644
--- a/configs/BSC9131RDB_SPIFLASH_SYSCLK100_defconfig
+++ b/configs/BSC9131RDB_SPIFLASH_SYSCLK100_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9131RDB=y
 CONFIG_FIT=y
diff --git a/configs/BSC9131RDB_SPIFLASH_defconfig b/configs/BSC9131RDB_SPIFLASH_defconfig
index c6a4b3232c96..9f4541ebfa0d 100644
--- a/configs/BSC9131RDB_SPIFLASH_defconfig
+++ b/configs/BSC9131RDB_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9131RDB=y
 CONFIG_FIT=y
diff --git a/configs/BSC9132QDS_NAND_DDRCLK100_SECURE_defconfig b/configs/BSC9132QDS_NAND_DDRCLK100_SECURE_defconfig
index febb1bfb499d..f89ce3a54f51 100644
--- a/configs/BSC9132QDS_NAND_DDRCLK100_SECURE_defconfig
+++ b/configs/BSC9132QDS_NAND_DDRCLK100_SECURE_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/BSC9132QDS_NAND_DDRCLK100_defconfig b/configs/BSC9132QDS_NAND_DDRCLK100_defconfig
index dabf5f311cf3..db62a7ed07a8 100644
--- a/configs/BSC9132QDS_NAND_DDRCLK100_defconfig
+++ b/configs/BSC9132QDS_NAND_DDRCLK100_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
diff --git a/configs/BSC9132QDS_NAND_DDRCLK133_SECURE_defconfig b/configs/BSC9132QDS_NAND_DDRCLK133_SECURE_defconfig
index d2f9ae9365ef..532024ce9137 100644
--- a/configs/BSC9132QDS_NAND_DDRCLK133_SECURE_defconfig
+++ b/configs/BSC9132QDS_NAND_DDRCLK133_SECURE_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/BSC9132QDS_NAND_DDRCLK133_defconfig b/configs/BSC9132QDS_NAND_DDRCLK133_defconfig
index 2959c7e9adc5..e23c71b2c054 100644
--- a/configs/BSC9132QDS_NAND_DDRCLK133_defconfig
+++ b/configs/BSC9132QDS_NAND_DDRCLK133_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x00201000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
diff --git a/configs/BSC9132QDS_NOR_DDRCLK100_SECURE_defconfig b/configs/BSC9132QDS_NOR_DDRCLK100_SECURE_defconfig
index cade39d7e2b4..9296218fa710 100644
--- a/configs/BSC9132QDS_NOR_DDRCLK100_SECURE_defconfig
+++ b/configs/BSC9132QDS_NOR_DDRCLK100_SECURE_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x8FF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/BSC9132QDS_NOR_DDRCLK100_defconfig b/configs/BSC9132QDS_NOR_DDRCLK100_defconfig
index a16838c49a4a..8fc2bdd30b02 100644
--- a/configs/BSC9132QDS_NOR_DDRCLK100_defconfig
+++ b/configs/BSC9132QDS_NOR_DDRCLK100_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x8FF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 CONFIG_FIT=y
@@ -26,6 +28,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=88000000.nor,nand0=ff800000.flash,"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=88000000.nor:256k(dtb),7m(kernel),55m(fs),1m(uboot);ff800000.flash:1m(uboot),8m(kernel),512k(dtb),-(fs)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x8FF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/BSC9132QDS_NOR_DDRCLK133_SECURE_defconfig b/configs/BSC9132QDS_NOR_DDRCLK133_SECURE_defconfig
index 1ea17b58c322..362cbec73bb9 100644
--- a/configs/BSC9132QDS_NOR_DDRCLK133_SECURE_defconfig
+++ b/configs/BSC9132QDS_NOR_DDRCLK133_SECURE_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x8FF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/BSC9132QDS_NOR_DDRCLK133_defconfig b/configs/BSC9132QDS_NOR_DDRCLK133_defconfig
index e56be3fda02b..1419dcadc362 100644
--- a/configs/BSC9132QDS_NOR_DDRCLK133_defconfig
+++ b/configs/BSC9132QDS_NOR_DDRCLK133_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x8FF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 CONFIG_FIT=y
@@ -26,6 +28,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=88000000.nor,nand0=ff800000.flash,"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=88000000.nor:256k(dtb),7m(kernel),55m(fs),1m(uboot);ff800000.flash:1m(uboot),8m(kernel),512k(dtb),-(fs)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x8FF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/BSC9132QDS_SDCARD_DDRCLK100_SECURE_defconfig b/configs/BSC9132QDS_SDCARD_DDRCLK100_SECURE_defconfig
index 0bc855a80967..1b72d490e98e 100644
--- a/configs/BSC9132QDS_SDCARD_DDRCLK100_SECURE_defconfig
+++ b/configs/BSC9132QDS_SDCARD_DDRCLK100_SECURE_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/BSC9132QDS_SDCARD_DDRCLK100_defconfig b/configs/BSC9132QDS_SDCARD_DDRCLK100_defconfig
index afac604b402e..66375cab942e 100644
--- a/configs/BSC9132QDS_SDCARD_DDRCLK100_defconfig
+++ b/configs/BSC9132QDS_SDCARD_DDRCLK100_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 CONFIG_FIT=y
diff --git a/configs/BSC9132QDS_SDCARD_DDRCLK133_SECURE_defconfig b/configs/BSC9132QDS_SDCARD_DDRCLK133_SECURE_defconfig
index b5faee59df37..bdc56fca9dc8 100644
--- a/configs/BSC9132QDS_SDCARD_DDRCLK133_SECURE_defconfig
+++ b/configs/BSC9132QDS_SDCARD_DDRCLK133_SECURE_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/BSC9132QDS_SDCARD_DDRCLK133_defconfig b/configs/BSC9132QDS_SDCARD_DDRCLK133_defconfig
index 50ebb14f704d..f26a49a4a443 100644
--- a/configs/BSC9132QDS_SDCARD_DDRCLK133_defconfig
+++ b/configs/BSC9132QDS_SDCARD_DDRCLK133_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 CONFIG_FIT=y
diff --git a/configs/BSC9132QDS_SPIFLASH_DDRCLK100_SECURE_defconfig b/configs/BSC9132QDS_SPIFLASH_DDRCLK100_SECURE_defconfig
index 07c07c75d3a1..28068f755170 100644
--- a/configs/BSC9132QDS_SPIFLASH_DDRCLK100_SECURE_defconfig
+++ b/configs/BSC9132QDS_SPIFLASH_DDRCLK100_SECURE_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/BSC9132QDS_SPIFLASH_DDRCLK100_defconfig b/configs/BSC9132QDS_SPIFLASH_DDRCLK100_defconfig
index c40f726dbfd7..83d79100dc66 100644
--- a/configs/BSC9132QDS_SPIFLASH_DDRCLK100_defconfig
+++ b/configs/BSC9132QDS_SPIFLASH_DDRCLK100_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 CONFIG_FIT=y
diff --git a/configs/BSC9132QDS_SPIFLASH_DDRCLK133_SECURE_defconfig b/configs/BSC9132QDS_SPIFLASH_DDRCLK133_SECURE_defconfig
index bfe80147ae71..c78017c9a136 100644
--- a/configs/BSC9132QDS_SPIFLASH_DDRCLK133_SECURE_defconfig
+++ b/configs/BSC9132QDS_SPIFLASH_DDRCLK133_SECURE_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/BSC9132QDS_SPIFLASH_DDRCLK133_defconfig b/configs/BSC9132QDS_SPIFLASH_DDRCLK133_defconfig
index 08e4d681ce46..38bf15a7026f 100644
--- a/configs/BSC9132QDS_SPIFLASH_DDRCLK133_defconfig
+++ b/configs/BSC9132QDS_SPIFLASH_DDRCLK133_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_BSC9132QDS=y
 CONFIG_FIT=y
diff --git a/configs/C29XPCIE_NAND_defconfig b/configs/C29XPCIE_NAND_defconfig
index d2c7836e179b..a64ee9fe6300 100644
--- a/configs/C29XPCIE_NAND_defconfig
+++ b/configs/C29XPCIE_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x100000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_C29XPCIE=y
diff --git a/configs/C29XPCIE_NOR_SECBOOT_defconfig b/configs/C29XPCIE_NOR_SECBOOT_defconfig
index 50ba06f6a6d4..604d8dd0938e 100644
--- a/configs/C29XPCIE_NOR_SECBOOT_defconfig
+++ b/configs/C29XPCIE_NOR_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_C29XPCIE=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/C29XPCIE_SPIFLASH_SECBOOT_defconfig b/configs/C29XPCIE_SPIFLASH_SECBOOT_defconfig
index fbaa2cf7c65d..01ad74b4b73d 100644
--- a/configs/C29XPCIE_SPIFLASH_SECBOOT_defconfig
+++ b/configs/C29XPCIE_SPIFLASH_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_C29XPCIE=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/C29XPCIE_SPIFLASH_defconfig b/configs/C29XPCIE_SPIFLASH_defconfig
index 097dc0188c86..d7c4096a330f 100644
--- a/configs/C29XPCIE_SPIFLASH_defconfig
+++ b/configs/C29XPCIE_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_C29XPCIE=y
 CONFIG_FIT=y
diff --git a/configs/C29XPCIE_defconfig b/configs/C29XPCIE_defconfig
index ac525e8e9282..3c0ae78e975d 100644
--- a/configs/C29XPCIE_defconfig
+++ b/configs/C29XPCIE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_C29XPCIE=y
 CONFIG_FIT=y
@@ -19,6 +21,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_DOS_PARTITION=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/Cyrus_P5020_defconfig b/configs/Cyrus_P5020_defconfig
index 016ec03cfcc0..eb2b0f86f3a2 100644
--- a/configs/Cyrus_P5020_defconfig
+++ b/configs/Cyrus_P5020_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xCF400
 CONFIG_MPC85xx=y
 CONFIG_TARGET_CYRUS_P5020=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
diff --git a/configs/Cyrus_P5040_defconfig b/configs/Cyrus_P5040_defconfig
index d1c359b60483..10ca467faa6f 100644
--- a/configs/Cyrus_P5040_defconfig
+++ b/configs/Cyrus_P5040_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xCF400
 CONFIG_MPC85xx=y
 CONFIG_TARGET_CYRUS_P5040=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
diff --git a/configs/M5208EVBE_defconfig b/configs/M5208EVBE_defconfig
index 8f5990a63c17..0b015ff83f93 100644
--- a/configs/M5208EVBE_defconfig
+++ b/configs/M5208EVBE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5208EVBE=y
 CONFIG_BOOTDELAY=1
 # CONFIG_DISPLAY_BOARDINFO is not set
@@ -13,6 +15,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5208EVBE"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x2000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M52277EVB_defconfig b/configs/M52277EVB_defconfig
index 55f6fb9c9086..d2e40245785c 100644
--- a/configs/M52277EVB_defconfig
+++ b/configs/M52277EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_SECT_SIZE=0x8000
 CONFIG_TARGET_M52277EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_SPANSION_BOOT"
 CONFIG_BOOTDELAY=3
@@ -17,6 +19,7 @@ CONFIG_CMD_DATE=y
 CONFIG_CMD_JFFS2=y
 CONFIG_DEFAULT_DEVICE_TREE="M52277EVB"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x40000
 # CONFIG_NET is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M52277EVB_stmicro_defconfig b/configs/M52277EVB_stmicro_defconfig
index c689eaacacb3..1a89934c25ff 100644
--- a/configs/M52277EVB_stmicro_defconfig
+++ b/configs/M52277EVB_stmicro_defconfig
@@ -1,5 +1,8 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x30000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M52277EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="CF_SBF,SYS_STMICRO_BOOT"
 CONFIG_BOOTDELAY=3
diff --git a/configs/M5235EVB_Flash32_defconfig b/configs/M5235EVB_Flash32_defconfig
index 80ceb978aa21..3c79ff0542ed 100644
--- a/configs/M5235EVB_Flash32_defconfig
+++ b/configs/M5235EVB_Flash32_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFFC00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5235EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="NORFLASH_PS32BIT"
 CONFIG_BOOTDELAY=1
@@ -18,6 +20,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5235EVB_Flash32"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFE04000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M5235EVB_defconfig b/configs/M5235EVB_defconfig
index 2fa977555ce9..347782cecf84 100644
--- a/configs/M5235EVB_defconfig
+++ b/configs/M5235EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5235EVB=y
 CONFIG_BOOTDELAY=1
 # CONFIG_DISPLAY_BOARDINFO is not set
@@ -18,6 +20,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5235EVB"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFE04000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M5249EVB_defconfig b/configs/M5249EVB_defconfig
index e074169aa4d8..39c4976e0df0 100644
--- a/configs/M5249EVB_defconfig
+++ b/configs/M5249EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5249EVB=y
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
 # CONFIG_DISPLAY_BOARDINFO is not set
@@ -11,6 +13,7 @@ CONFIG_MX_CYCLIC=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5249EVB"
+CONFIG_ENV_ADDR=0xFFE04000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 # CONFIG_NET is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/M5253DEMO_defconfig b/configs/M5253DEMO_defconfig
index 77e2d2b226bf..84a24844fe21 100644
--- a/configs/M5253DEMO_defconfig
+++ b/configs/M5253DEMO_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_TARGET_M5253DEMO=y
 CONFIG_BOOTDELAY=5
 # CONFIG_DISPLAY_BOARDINFO is not set
@@ -14,5 +16,6 @@ CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_MAC_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="M5253DEMO"
+CONFIG_ENV_ADDR=0xFF804000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/M5272C3_defconfig b/configs/M5272C3_defconfig
index eaf43b4db2d8..afd5c44b1092 100644
--- a/configs/M5272C3_defconfig
+++ b/configs/M5272C3_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5272C3=y
 CONFIG_BOOTDELAY=5
 # CONFIG_DISPLAY_BOARDINFO is not set
@@ -14,6 +16,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5272C3"
+CONFIG_ENV_ADDR=0xFFE04000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M5275EVB_defconfig b/configs/M5275EVB_defconfig
index 246b1b01d0f9..d4f6d427a18c 100644
--- a/configs/M5275EVB_defconfig
+++ b/configs/M5275EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5275EVB=y
 CONFIG_BOOTDELAY=5
 # CONFIG_DISPLAY_BOARDINFO is not set
@@ -16,6 +18,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5275EVB"
+CONFIG_ENV_ADDR=0xFFE04000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M5282EVB_defconfig b/configs/M5282EVB_defconfig
index d9694896eea4..bbf394dcdef3 100644
--- a/configs/M5282EVB_defconfig
+++ b/configs/M5282EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5282EVB=y
 CONFIG_BOOTDELAY=5
 # CONFIG_DISPLAY_BOARDINFO is not set
@@ -14,6 +16,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5282EVB"
+CONFIG_ENV_ADDR=0xFFE04000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M53017EVB_defconfig b/configs/M53017EVB_defconfig
index 92dfd0256dd2..bf467bb8e92d 100644
--- a/configs/M53017EVB_defconfig
+++ b/configs/M53017EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_SECT_SIZE=0x8000
 CONFIG_TARGET_M53017EVB=y
 CONFIG_BOOTDELAY=1
 CONFIG_USE_BOOTARGS=y
@@ -16,6 +18,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
 CONFIG_DEFAULT_DEVICE_TREE="M53017EVB"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x40000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5329AFEE_defconfig b/configs/M5329AFEE_defconfig
index 35403d1eeeca..9191dc0515a3 100644
--- a/configs/M5329AFEE_defconfig
+++ b/configs/M5329AFEE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5329EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="NANDFLASH_SIZE=0"
 CONFIG_BOOTDELAY=1
@@ -16,6 +18,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5329AFEE"
+CONFIG_ENV_ADDR=0x4000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M5329BFEE_defconfig b/configs/M5329BFEE_defconfig
index 2d98dbe732c8..e9d460f69835 100644
--- a/configs/M5329BFEE_defconfig
+++ b/configs/M5329BFEE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5329EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="NANDFLASH_SIZE=16"
 CONFIG_BOOTDELAY=1
@@ -16,6 +18,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5329BFEE"
+CONFIG_ENV_ADDR=0x4000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M5373EVB_defconfig b/configs/M5373EVB_defconfig
index 00c33b151817..8ba76718060c 100644
--- a/configs/M5373EVB_defconfig
+++ b/configs/M5373EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_M5373EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="NANDFLASH_SIZE=16"
 CONFIG_BOOTDELAY=1
@@ -16,6 +18,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5373EVB"
+CONFIG_ENV_ADDR=0x4000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/M54418TWR_defconfig b/configs/M54418TWR_defconfig
index 49abfed5c6ed..783c6f073e02 100644
--- a/configs/M54418TWR_defconfig
+++ b/configs/M54418TWR_defconfig
@@ -1,5 +1,8 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x47E00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x40000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M54418TWR=y
 CONFIG_SYS_EXTRA_OPTIONS="CF_SBF,SYS_SERIAL_BOOT,SYS_INPUT_CLKSRC=50000000"
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/M54418TWR_nand_mii_defconfig b/configs/M54418TWR_nand_mii_defconfig
index dd650c3eb943..1688d4063a10 100644
--- a/configs/M54418TWR_nand_mii_defconfig
+++ b/configs/M54418TWR_nand_mii_defconfig
@@ -1,5 +1,6 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x47E00000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_M54418TWR=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_NAND_BOOT,SYS_INPUT_CLKSRC=25000000"
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/M54418TWR_nand_rmii_defconfig b/configs/M54418TWR_nand_rmii_defconfig
index 32a2b6068469..87e38261bada 100644
--- a/configs/M54418TWR_nand_rmii_defconfig
+++ b/configs/M54418TWR_nand_rmii_defconfig
@@ -1,5 +1,6 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x47E00000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_M54418TWR=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_NAND_BOOT,SYS_INPUT_CLKSRC=50000000"
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/M54418TWR_nand_rmii_lowfreq_defconfig b/configs/M54418TWR_nand_rmii_lowfreq_defconfig
index c20c0703807f..d196e4c18709 100644
--- a/configs/M54418TWR_nand_rmii_lowfreq_defconfig
+++ b/configs/M54418TWR_nand_rmii_lowfreq_defconfig
@@ -1,5 +1,6 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x47E00000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_M54418TWR=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_NAND_BOOT,LOW_MCFCLK,SYS_INPUT_CLKSRC=50000000"
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/M54418TWR_serial_mii_defconfig b/configs/M54418TWR_serial_mii_defconfig
index d6eda311d0cb..7d88778b8d46 100644
--- a/configs/M54418TWR_serial_mii_defconfig
+++ b/configs/M54418TWR_serial_mii_defconfig
@@ -1,5 +1,8 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x47E00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x40000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M54418TWR=y
 CONFIG_SYS_EXTRA_OPTIONS="CF_SBF,SYS_SERIAL_BOOT,SYS_INPUT_CLKSRC=25000000"
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/M54418TWR_serial_rmii_defconfig b/configs/M54418TWR_serial_rmii_defconfig
index cb2b36f4b3bd..079c9175bd79 100644
--- a/configs/M54418TWR_serial_rmii_defconfig
+++ b/configs/M54418TWR_serial_rmii_defconfig
@@ -1,5 +1,8 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x47E00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x40000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M54418TWR=y
 CONFIG_SYS_EXTRA_OPTIONS="CF_SBF,SYS_SERIAL_BOOT,SYS_INPUT_CLKSRC=50000000"
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/M54451EVB_defconfig b/configs/M54451EVB_defconfig
index f0bd93f2d9db..26471de8fd6c 100644
--- a/configs/M54451EVB_defconfig
+++ b/configs/M54451EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_M54451EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_INPUT_CLKSRC=24000000"
 CONFIG_BOOTDELAY=1
@@ -22,6 +24,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
 CONFIG_DEFAULT_DEVICE_TREE="M54451EVB"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x40000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M54451EVB_stmicro_defconfig b/configs/M54451EVB_stmicro_defconfig
index d5a9a9f5ab0e..16cc02ad87a5 100644
--- a/configs/M54451EVB_stmicro_defconfig
+++ b/configs/M54451EVB_stmicro_defconfig
@@ -1,5 +1,8 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x47E00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x20000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M54451EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="CF_SBF,SYS_STMICRO_BOOT,SYS_INPUT_CLKSRC=24000000"
 CONFIG_BOOTDELAY=1
diff --git a/configs/M54455EVB_a66_defconfig b/configs/M54455EVB_a66_defconfig
index ca403083f795..997164ca1518 100644
--- a/configs/M54455EVB_a66_defconfig
+++ b/configs/M54455EVB_a66_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x4000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M54455EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_ATMEL_BOOT,SYS_INPUT_CLKSRC=66666666"
 CONFIG_BOOTDELAY=1
@@ -26,6 +28,7 @@ CONFIG_CMD_JFFS2=y
 CONFIG_ISO_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="M54455EVB_a66"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x4040000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M54455EVB_defconfig b/configs/M54455EVB_defconfig
index 3ca2d7379758..d782c4bcd0c8 100644
--- a/configs/M54455EVB_defconfig
+++ b/configs/M54455EVB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x4000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M54455EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_ATMEL_BOOT,SYS_INPUT_CLKSRC=33333333"
 CONFIG_BOOTDELAY=1
@@ -27,6 +29,7 @@ CONFIG_CMD_JFFS2=y
 CONFIG_ISO_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="M54455EVB"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x4040000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M54455EVB_i66_defconfig b/configs/M54455EVB_i66_defconfig
index 20abcd80ab80..5311b19d9792 100644
--- a/configs/M54455EVB_i66_defconfig
+++ b/configs/M54455EVB_i66_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_M54455EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_INTEL_BOOT,SYS_INPUT_CLKSRC=66666666"
 CONFIG_BOOTDELAY=1
@@ -26,6 +28,7 @@ CONFIG_CMD_JFFS2=y
 CONFIG_ISO_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="M54455EVB_i66"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x40000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M54455EVB_intel_defconfig b/configs/M54455EVB_intel_defconfig
index a17e4fab2524..4039093fcd03 100644
--- a/configs/M54455EVB_intel_defconfig
+++ b/configs/M54455EVB_intel_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x0
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_M54455EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_INTEL_BOOT,SYS_INPUT_CLKSRC=33333333"
 CONFIG_BOOTDELAY=1
@@ -26,6 +28,7 @@ CONFIG_CMD_JFFS2=y
 CONFIG_ISO_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="M54455EVB_intel"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x40000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M54455EVB_stm33_defconfig b/configs/M54455EVB_stm33_defconfig
index 440218531601..09a273ecc06a 100644
--- a/configs/M54455EVB_stm33_defconfig
+++ b/configs/M54455EVB_stm33_defconfig
@@ -1,5 +1,8 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x4FE00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x30000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M54455EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_STMICRO_BOOT,CF_SBF,SYS_INPUT_CLKSRC=33333333"
 CONFIG_BOOTDELAY=1
diff --git a/configs/M5475AFE_defconfig b/configs/M5475AFE_defconfig
index 368f73e9dd66..dcb100ad2104 100644
--- a/configs/M5475AFE_defconfig
+++ b/configs/M5475AFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5475EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=133333333,SYS_BOOTSZ=2,SYS_DRAMSZ=64"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5475AFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5475BFE_defconfig b/configs/M5475BFE_defconfig
index d44b0b267fd3..d1a5a6c97c1f 100644
--- a/configs/M5475BFE_defconfig
+++ b/configs/M5475BFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5475EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=133333333,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_NOR1SZ=16"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5475BFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5475CFE_defconfig b/configs/M5475CFE_defconfig
index 108ef978a65f..bf2eb8f8c110 100644
--- a/configs/M5475CFE_defconfig
+++ b/configs/M5475CFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5475EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=133333333,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_NOR1SZ=16,SYS_VIDEO,SYS_USBCTRL"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5475CFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5475DFE_defconfig b/configs/M5475DFE_defconfig
index 9325db5ba67e..424e7f23dddd 100644
--- a/configs/M5475DFE_defconfig
+++ b/configs/M5475DFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5475EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=133333333,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_USBCTRL"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5475DFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5475EFE_defconfig b/configs/M5475EFE_defconfig
index 6873f1500c91..7e947c66acfc 100644
--- a/configs/M5475EFE_defconfig
+++ b/configs/M5475EFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5475EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=133333333,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_VIDEO,SYS_USBCTRL"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5475EFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5475FFE_defconfig b/configs/M5475FFE_defconfig
index a98e804c4149..a12b62ac1f92 100644
--- a/configs/M5475FFE_defconfig
+++ b/configs/M5475FFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5475EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=133333333,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_NOR1SZ=32,SYS_VIDEO,SYS_USBCTRL,SYS_DRAMSZ1=64"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5475FFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5475GFE_defconfig b/configs/M5475GFE_defconfig
index ed7574380145..594b0c0a987b 100644
--- a/configs/M5475GFE_defconfig
+++ b/configs/M5475GFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5475EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=133333333,SYS_BOOTSZ=4,SYS_DRAMSZ=64"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5475GFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5485AFE_defconfig b/configs/M5485AFE_defconfig
index 8f94ac99a174..ab96ba775888 100644
--- a/configs/M5485AFE_defconfig
+++ b/configs/M5485AFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5485EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=100000000,SYS_BOOTSZ=2,SYS_DRAMSZ=64"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5485AFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5485BFE_defconfig b/configs/M5485BFE_defconfig
index 96bd5200dad9..0a7c2bffb0ab 100644
--- a/configs/M5485BFE_defconfig
+++ b/configs/M5485BFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5485EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=100000000,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_NOR1SZ=16"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5485BFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5485CFE_defconfig b/configs/M5485CFE_defconfig
index 148be33d5a5b..84f8ebae7d69 100644
--- a/configs/M5485CFE_defconfig
+++ b/configs/M5485CFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5485EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=100000000,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_NOR1SZ=16,SYS_VIDEO,SYS_USBCTRL"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5485CFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5485DFE_defconfig b/configs/M5485DFE_defconfig
index 5facb0733da8..25d54630aedf 100644
--- a/configs/M5485DFE_defconfig
+++ b/configs/M5485DFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5485EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=100000000,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_USBCTRL"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5485DFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5485EFE_defconfig b/configs/M5485EFE_defconfig
index ece3e115ea34..de82703c8f3d 100644
--- a/configs/M5485EFE_defconfig
+++ b/configs/M5485EFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5485EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=100000000,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_VIDEO,SYS_USBCTRL"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5485EFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5485FFE_defconfig b/configs/M5485FFE_defconfig
index c2a2d926d657..c9101033422f 100644
--- a/configs/M5485FFE_defconfig
+++ b/configs/M5485FFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5485EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=100000000,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_NOR1SZ=32,SYS_VIDEO,SYS_USBCTRL,SYS_DRAMSZ1=64"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5485FFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5485GFE_defconfig b/configs/M5485GFE_defconfig
index 9cf620242ae7..c7f47703e11c 100644
--- a/configs/M5485GFE_defconfig
+++ b/configs/M5485GFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5485EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=100000000,SYS_BOOTSZ=4,SYS_DRAMSZ=64"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5485GFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/M5485HFE_defconfig b/configs/M5485HFE_defconfig
index e6c9225ea9f2..4b03ee009439 100644
--- a/configs/M5485HFE_defconfig
+++ b/configs/M5485HFE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_M5485EVB=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_BUSCLK=100000000,SYS_BOOTSZ=2,SYS_DRAMSZ=64,SYS_NOR1SZ=16,SYS_VIDEO"
 CONFIG_BOOTDELAY=1
@@ -15,6 +17,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_DEFAULT_DEVICE_TREE="M5485HFE"
+CONFIG_ENV_ADDR=0xFF840000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/MCR3000_defconfig b/configs/MCR3000_defconfig
index 8ce5c55b536f..8bc6d1c9bdd4 100644
--- a/configs/MCR3000_defconfig
+++ b/configs/MCR3000_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x4000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_MPC8xx=y
 CONFIG_SYS_IMMR=0xFF000000
 CONFIG_TARGET_MCR3000=y
@@ -67,6 +69,7 @@ CONFIG_CMD_PING=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="mcr3000"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x4004000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 # CONFIG_MMC is not set
diff --git a/configs/MPC8308RDB_defconfig b/configs/MPC8308RDB_defconfig
index 55ecf758863c..dc9ebb8f5cc4 100644
--- a/configs/MPC8308RDB_defconfig
+++ b/configs/MPC8308RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
 CONFIG_TARGET_MPC8308RDB=y
@@ -127,6 +129,8 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_FAT=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE080000
+CONFIG_ENV_ADDR_REDUND=0xFE090000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8313ERDB_33_defconfig b/configs/MPC8313ERDB_33_defconfig
index 9b58860e08af..121959b2722e 100644
--- a/configs/MPC8313ERDB_33_defconfig
+++ b/configs/MPC8313ERDB_33_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -143,6 +145,7 @@ CONFIG_CMD_DATE=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=e2800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=e2800000.flash:512k(uboot),128k(env),6m@1m(kernel),-(fs)"
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8313ERDB_66_defconfig b/configs/MPC8313ERDB_66_defconfig
index 98fcda1de29a..c0f89bc61432 100644
--- a/configs/MPC8313ERDB_66_defconfig
+++ b/configs/MPC8313ERDB_66_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=66666667
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -142,6 +144,7 @@ CONFIG_CMD_DATE=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=e2800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=e2800000.flash:512k(uboot),128k(env),6m@1m(kernel),-(fs)"
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8313ERDB_NAND_33_defconfig b/configs/MPC8313ERDB_NAND_33_defconfig
index 744f8f6ace6c..170bc39809f0 100644
--- a/configs/MPC8313ERDB_NAND_33_defconfig
+++ b/configs/MPC8313ERDB_NAND_33_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x00100000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_SPL=y
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
@@ -151,6 +153,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=e2800000.flash:512k(uboot),128k(env),6m@1m(ker
 # CONFIG_ENV_IS_IN_FLASH is not set
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x90000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8313ERDB_NAND_66_defconfig b/configs/MPC8313ERDB_NAND_66_defconfig
index 4c53104c68fc..c2a3267d471e 100644
--- a/configs/MPC8313ERDB_NAND_66_defconfig
+++ b/configs/MPC8313ERDB_NAND_66_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x00100000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_SPL=y
 CONFIG_SYS_CLK_FREQ=66666667
 CONFIG_MPC83xx=y
@@ -150,6 +152,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=e2800000.flash:512k(uboot),128k(env),6m@1m(ker
 # CONFIG_ENV_IS_IN_FLASH is not set
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x90000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8315ERDB_defconfig b/configs/MPC8315ERDB_defconfig
index 2a550bc98b9f..c232e495dedc 100644
--- a/configs/MPC8315ERDB_defconfig
+++ b/configs/MPC8315ERDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=66666667
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -127,6 +129,7 @@ CONFIG_CMD_EXT2=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=e0600000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=e0600000.flash:512k(uboot),128k(env),6m@1m(kernel),-(fs)"
+CONFIG_ENV_ADDR=0xFE080000
 CONFIG_FSL_SATA=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8323ERDB_defconfig b/configs/MPC8323ERDB_defconfig
index 349d611086ea..fd31046e4e2d 100644
--- a/configs/MPC8323ERDB_defconfig
+++ b/configs/MPC8323ERDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66666667
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -101,6 +103,7 @@ CONFIG_CMD_I2C=y
 CONFIG_CMD_PCI=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_PING=y
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC832XEMDS_ATM_defconfig b/configs/MPC832XEMDS_ATM_defconfig
index 3eda9a4deb98..c1b323f9fe41 100644
--- a/configs/MPC832XEMDS_ATM_defconfig
+++ b/configs/MPC832XEMDS_ATM_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -126,6 +128,7 @@ CONFIG_CMD_ASKENV=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_PING=y
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC832XEMDS_HOST_33_defconfig b/configs/MPC832XEMDS_HOST_33_defconfig
index ede3b8a0e4c0..17a142bf8244 100644
--- a/configs/MPC832XEMDS_HOST_33_defconfig
+++ b/configs/MPC832XEMDS_HOST_33_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -147,6 +149,7 @@ CONFIG_CMD_I2C=y
 CONFIG_CMD_PCI=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_PING=y
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC832XEMDS_HOST_66_defconfig b/configs/MPC832XEMDS_HOST_66_defconfig
index 370a9141c9c3..5eca9b26696a 100644
--- a/configs/MPC832XEMDS_HOST_66_defconfig
+++ b/configs/MPC832XEMDS_HOST_66_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -147,6 +149,7 @@ CONFIG_CMD_I2C=y
 CONFIG_CMD_PCI=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_PING=y
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC832XEMDS_SLAVE_defconfig b/configs/MPC832XEMDS_SLAVE_defconfig
index 5b1c8f89b604..498d87935467 100644
--- a/configs/MPC832XEMDS_SLAVE_defconfig
+++ b/configs/MPC832XEMDS_SLAVE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -144,6 +146,7 @@ CONFIG_CMD_I2C=y
 CONFIG_CMD_PCI=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_PING=y
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC832XEMDS_defconfig b/configs/MPC832XEMDS_defconfig
index 34fbe53f727f..53bec936a799 100644
--- a/configs/MPC832XEMDS_defconfig
+++ b/configs/MPC832XEMDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -125,6 +127,7 @@ CONFIG_CMD_ASKENV=y
 CONFIG_CMD_I2C=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_PING=y
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8349EMDS_PCI64_defconfig b/configs/MPC8349EMDS_PCI64_defconfig
index 873fabc60bc7..fd4e6ece4387 100644
--- a/configs/MPC8349EMDS_PCI64_defconfig
+++ b/configs/MPC8349EMDS_PCI64_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -94,6 +96,8 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE080000
+CONFIG_ENV_ADDR_REDUND=0xFE0A0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8349EMDS_SDRAM_defconfig b/configs/MPC8349EMDS_SDRAM_defconfig
index ed7445ca98c2..1a618930c8ba 100644
--- a/configs/MPC8349EMDS_SDRAM_defconfig
+++ b/configs/MPC8349EMDS_SDRAM_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -103,6 +105,8 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE080000
+CONFIG_ENV_ADDR_REDUND=0xFE0A0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8349EMDS_SLAVE_defconfig b/configs/MPC8349EMDS_SLAVE_defconfig
index c39c36208792..1351d9621317 100644
--- a/configs/MPC8349EMDS_SLAVE_defconfig
+++ b/configs/MPC8349EMDS_SLAVE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66666666
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -94,6 +96,8 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE080000
+CONFIG_ENV_ADDR_REDUND=0xFE0A0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8349EMDS_defconfig b/configs/MPC8349EMDS_defconfig
index 87e041944cfc..5a8692fceb5f 100644
--- a/configs/MPC8349EMDS_defconfig
+++ b/configs/MPC8349EMDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -95,6 +97,8 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE080000
+CONFIG_ENV_ADDR_REDUND=0xFE0A0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8349ITXGP_defconfig b/configs/MPC8349ITXGP_defconfig
index b4cf8c33d050..c4d41c63a891 100644
--- a/configs/MPC8349ITXGP_defconfig
+++ b/configs/MPC8349ITXGP_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=66666666
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -164,6 +166,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
+CONFIG_ENV_ADDR=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8349ITX_LOWBOOT_defconfig b/configs/MPC8349ITX_LOWBOOT_defconfig
index fbfeda57cfae..d5e253b0a658 100644
--- a/configs/MPC8349ITX_LOWBOOT_defconfig
+++ b/configs/MPC8349ITX_LOWBOOT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=66666666
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -168,6 +170,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_ENV_ADDR=0xFE080000
 CONFIG_SATA_SIL3114=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8349ITX_defconfig b/configs/MPC8349ITX_defconfig
index e9a8bb1836de..0517fc6ad40a 100644
--- a/configs/MPC8349ITX_defconfig
+++ b/configs/MPC8349ITX_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFEF00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=66666666
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -167,6 +169,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_ENV_ADDR=0xFEF80000
 CONFIG_SATA_SIL3114=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC837XEMDS_HOST_defconfig b/configs/MPC837XEMDS_HOST_defconfig
index 7b69f5b44f3a..a7aa5a261c5e 100644
--- a/configs/MPC837XEMDS_HOST_defconfig
+++ b/configs/MPC837XEMDS_HOST_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -161,6 +163,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_ENV_ADDR=0xFE080000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC837XEMDS_SLAVE_defconfig b/configs/MPC837XEMDS_SLAVE_defconfig
index 17ccb40ac5dd..c33aae0ea6d5 100644
--- a/configs/MPC837XEMDS_SLAVE_defconfig
+++ b/configs/MPC837XEMDS_SLAVE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_TARGET_MPC837XEMDS=y
@@ -119,6 +121,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_ENV_ADDR=0xFE080000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/MPC837XEMDS_defconfig b/configs/MPC837XEMDS_defconfig
index 47125e27bc04..3fd3a394932f 100644
--- a/configs/MPC837XEMDS_defconfig
+++ b/configs/MPC837XEMDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -139,6 +141,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_ENV_ADDR=0xFE080000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC837XERDB_SLAVE_defconfig b/configs/MPC837XERDB_SLAVE_defconfig
index 4dcaed23e3b1..39c50960bb24 100644
--- a/configs/MPC837XERDB_SLAVE_defconfig
+++ b/configs/MPC837XERDB_SLAVE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=66666667
 CONFIG_MPC83xx=y
 CONFIG_TARGET_MPC837XERDB=y
@@ -117,6 +119,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_ENV_ADDR=0xFE080000
 CONFIG_FSL_SATA=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC837XERDB_defconfig b/configs/MPC837XERDB_defconfig
index 738e75ac36c0..fd8335ee4ef1 100644
--- a/configs/MPC837XERDB_defconfig
+++ b/configs/MPC837XERDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_CLK_FREQ=66666667
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -158,6 +160,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
+CONFIG_ENV_ADDR=0xFE080000
 CONFIG_FSL_SATA=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8536DS_36BIT_defconfig b/configs/MPC8536DS_36BIT_defconfig
index 428586a48690..871a141e4824 100644
--- a/configs/MPC8536DS_36BIT_defconfig
+++ b/configs/MPC8536DS_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8536DS=y
@@ -25,6 +27,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_SYS_FSL_DDR2=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8536DS_SDCARD_defconfig b/configs/MPC8536DS_SDCARD_defconfig
index d8f6a516ec0d..b7d026394531 100644
--- a/configs/MPC8536DS_SDCARD_defconfig
+++ b/configs/MPC8536DS_SDCARD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xf8f40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8536DS=y
diff --git a/configs/MPC8536DS_SPIFLASH_defconfig b/configs/MPC8536DS_SPIFLASH_defconfig
index fb223890c03d..b0b1040cda89 100644
--- a/configs/MPC8536DS_SPIFLASH_defconfig
+++ b/configs/MPC8536DS_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xf8f40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xF0000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8536DS=y
diff --git a/configs/MPC8536DS_defconfig b/configs/MPC8536DS_defconfig
index 01863a443cbd..f10a0891a883 100644
--- a/configs/MPC8536DS_defconfig
+++ b/configs/MPC8536DS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8536DS=y
@@ -24,6 +26,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_SYS_FSL_DDR2=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8541CDS_defconfig b/configs/MPC8541CDS_defconfig
index 3307dbbb481d..7017f7f5c875 100644
--- a/configs/MPC8541CDS_defconfig
+++ b/configs/MPC8541CDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8541CDS=y
@@ -16,6 +18,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8541CDS_legacy_defconfig b/configs/MPC8541CDS_legacy_defconfig
index bef89171ea5c..a62d3663b51a 100644
--- a/configs/MPC8541CDS_legacy_defconfig
+++ b/configs/MPC8541CDS_legacy_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8541CDS=y
@@ -17,6 +19,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8544DS_defconfig b/configs/MPC8544DS_defconfig
index a77f8f14cd16..fb1ed08adb7b 100644
--- a/configs/MPC8544DS_defconfig
+++ b/configs/MPC8544DS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8544DS=y
@@ -20,6 +22,7 @@ CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_CMD_EXT2=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFF70000
 CONFIG_SCSI_AHCI=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8548CDS_36BIT_defconfig b/configs/MPC8548CDS_36BIT_defconfig
index 1c3762497846..a8700100e168 100644
--- a/configs/MPC8548CDS_36BIT_defconfig
+++ b/configs/MPC8548CDS_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8548CDS=y
@@ -19,6 +21,7 @@ CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="mpc8548cds_36b"
+CONFIG_ENV_ADDR=0xFFF60000
 CONFIG_DM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8548CDS_defconfig b/configs/MPC8548CDS_defconfig
index ef82aa8c2b54..42c31d423782 100644
--- a/configs/MPC8548CDS_defconfig
+++ b/configs/MPC8548CDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8548CDS=y
@@ -18,6 +20,7 @@ CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="mpc8548cds"
+CONFIG_ENV_ADDR=0xFFF60000
 CONFIG_DM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8548CDS_legacy_defconfig b/configs/MPC8548CDS_legacy_defconfig
index e36fcf8435c4..263f24c17962 100644
--- a/configs/MPC8548CDS_legacy_defconfig
+++ b/configs/MPC8548CDS_legacy_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8548CDS=y
@@ -18,6 +20,7 @@ CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="mpc8548cds"
+CONFIG_ENV_ADDR=0xFFF60000
 CONFIG_DM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8555CDS_defconfig b/configs/MPC8555CDS_defconfig
index f5fcd81f1195..b6391751076e 100644
--- a/configs/MPC8555CDS_defconfig
+++ b/configs/MPC8555CDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8555CDS=y
@@ -16,6 +18,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8555CDS_legacy_defconfig b/configs/MPC8555CDS_legacy_defconfig
index 7887bccb6443..51710bbdbe7b 100644
--- a/configs/MPC8555CDS_legacy_defconfig
+++ b/configs/MPC8555CDS_legacy_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8555CDS=y
@@ -17,6 +19,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8568MDS_defconfig b/configs/MPC8568MDS_defconfig
index 190b0b89dfab..24bc0d582d25 100644
--- a/configs/MPC8568MDS_defconfig
+++ b/configs/MPC8568MDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8568MDS=y
@@ -18,6 +20,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFF60000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8569MDS_ATM_defconfig b/configs/MPC8569MDS_ATM_defconfig
index 08e17bf5f252..8d7cc64a2201 100644
--- a/configs/MPC8569MDS_ATM_defconfig
+++ b/configs/MPC8569MDS_ATM_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8569MDS=y
@@ -23,6 +25,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFF60000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8569MDS_defconfig b/configs/MPC8569MDS_defconfig
index f1b4a7befd91..7517b4d56822 100644
--- a/configs/MPC8569MDS_defconfig
+++ b/configs/MPC8569MDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_MPC8569MDS=y
@@ -22,6 +24,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFF60000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/MPC8572DS_36BIT_defconfig b/configs/MPC8572DS_36BIT_defconfig
index 3f02171737ba..6faf32e00a73 100644
--- a/configs/MPC8572DS_36BIT_defconfig
+++ b/configs/MPC8572DS_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_MPC8572DS=y
 CONFIG_PHYS_64BIT=y
@@ -22,6 +24,7 @@ CONFIG_CMD_PING=y
 CONFIG_MP=y
 # CONFIG_CMD_HASH is not set
 CONFIG_CMD_EXT2=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_FSL_DDR2=y
 # CONFIG_MMC is not set
diff --git a/configs/MPC8572DS_defconfig b/configs/MPC8572DS_defconfig
index acb4af4b3de6..b4e88ef2ec66 100644
--- a/configs/MPC8572DS_defconfig
+++ b/configs/MPC8572DS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_MPC8572DS=y
 CONFIG_FIT=y
@@ -21,6 +23,7 @@ CONFIG_CMD_PING=y
 CONFIG_MP=y
 # CONFIG_CMD_HASH is not set
 CONFIG_CMD_EXT2=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_FSL_DDR2=y
 # CONFIG_MMC is not set
diff --git a/configs/MPC8610HPCD_defconfig b/configs/MPC8610HPCD_defconfig
index 80ea441aa338..987982341164 100644
--- a/configs/MPC8610HPCD_defconfig
+++ b/configs/MPC8610HPCD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC86xx=y
 CONFIG_HIGH_BATS=y
 CONFIG_TARGET_MPC8610HPCD=y
@@ -20,6 +22,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_BMP=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
+CONFIG_ENV_ADDR=0xFFF80000
 CONFIG_SCSI_AHCI=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8641HPCN_36BIT_defconfig b/configs/MPC8641HPCN_36BIT_defconfig
index 81901f7a28b0..249cddac36d2 100644
--- a/configs/MPC8641HPCN_36BIT_defconfig
+++ b/configs/MPC8641HPCN_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xeff00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC86xx=y
 CONFIG_HIGH_BATS=y
 CONFIG_TARGET_MPC8641HPCN=y
@@ -19,6 +21,7 @@ CONFIG_CMD_PING=y
 CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
+CONFIG_ENV_ADDR=0xEFF80000
 CONFIG_SCSI_AHCI=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MPC8641HPCN_defconfig b/configs/MPC8641HPCN_defconfig
index 497d398c834f..f87c61696644 100644
--- a/configs/MPC8641HPCN_defconfig
+++ b/configs/MPC8641HPCN_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xeff00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC86xx=y
 CONFIG_HIGH_BATS=y
 CONFIG_TARGET_MPC8641HPCN=y
@@ -19,6 +21,7 @@ CONFIG_CMD_PING=y
 CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
+CONFIG_ENV_ADDR=0xEFF80000
 CONFIG_SCSI_AHCI=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/MigoR_defconfig b/configs/MigoR_defconfig
index b261a92e03c3..54012a39a60f 100644
--- a/configs/MigoR_defconfig
+++ b/configs/MigoR_defconfig
@@ -1,5 +1,7 @@
 CONFIG_SH=y
 CONFIG_SYS_TEXT_BASE=0x8FFC0000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_MIGOR=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
@@ -23,6 +25,7 @@ CONFIG_CMD_SDRAM=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_MISC is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xA0020000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
diff --git a/configs/P1010RDB-PA_36BIT_NAND_SECBOOT_defconfig b/configs/P1010RDB-PA_36BIT_NAND_SECBOOT_defconfig
index 17fa25f37a4f..11856f67a751 100644
--- a/configs/P1010RDB-PA_36BIT_NAND_SECBOOT_defconfig
+++ b/configs/P1010RDB-PA_36BIT_NAND_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PA_36BIT_NAND_defconfig b/configs/P1010RDB-PA_36BIT_NAND_defconfig
index dfa64d132636..305787335cd1 100644
--- a/configs/P1010RDB-PA_36BIT_NAND_defconfig
+++ b/configs/P1010RDB-PA_36BIT_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
diff --git a/configs/P1010RDB-PA_36BIT_NOR_SECBOOT_defconfig b/configs/P1010RDB-PA_36BIT_NOR_SECBOOT_defconfig
index 99e8b4058034..851840f4e4db 100644
--- a/configs/P1010RDB-PA_36BIT_NOR_SECBOOT_defconfig
+++ b/configs/P1010RDB-PA_36BIT_NOR_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PA_36BIT_NOR_defconfig b/configs/P1010RDB-PA_36BIT_NOR_defconfig
index 10a2eff357c0..3b3484dc7911 100644
--- a/configs/P1010RDB-PA_36BIT_NOR_defconfig
+++ b/configs/P1010RDB-PA_36BIT_NOR_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
 CONFIG_PHYS_64BIT=y
@@ -25,6 +27,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:2m(uboot-env),1m(dtb),5m(kernel),56m(fs),-(usr)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1010RDB-PA_36BIT_SDCARD_defconfig b/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
index aa96237e5963..34b95bbeebb3 100644
--- a/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
diff --git a/configs/P1010RDB-PA_36BIT_SPIFLASH_SECBOOT_defconfig b/configs/P1010RDB-PA_36BIT_SPIFLASH_SECBOOT_defconfig
index 7d39e670daeb..10a8424af7d5 100644
--- a/configs/P1010RDB-PA_36BIT_SPIFLASH_SECBOOT_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SPIFLASH_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig b/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
index eaf5bfe6e9e5..1edfbfb348c9 100644
--- a/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PA_36BIT_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1010RDB-PA_NAND_SECBOOT_defconfig b/configs/P1010RDB-PA_NAND_SECBOOT_defconfig
index 96eb27cdb57b..0532a9c7b18f 100644
--- a/configs/P1010RDB-PA_NAND_SECBOOT_defconfig
+++ b/configs/P1010RDB-PA_NAND_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PA_NAND_defconfig b/configs/P1010RDB-PA_NAND_defconfig
index cd4f258c7f1b..177a2ca8f38d 100644
--- a/configs/P1010RDB-PA_NAND_defconfig
+++ b/configs/P1010RDB-PA_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
diff --git a/configs/P1010RDB-PA_NOR_SECBOOT_defconfig b/configs/P1010RDB-PA_NOR_SECBOOT_defconfig
index 7b58ee80d2da..ba4bcdf98a70 100644
--- a/configs/P1010RDB-PA_NOR_SECBOOT_defconfig
+++ b/configs/P1010RDB-PA_NOR_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PA_NOR_defconfig b/configs/P1010RDB-PA_NOR_defconfig
index 47c5cca91c49..9bcf41cc603b 100644
--- a/configs/P1010RDB-PA_NOR_defconfig
+++ b/configs/P1010RDB-PA_NOR_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
 CONFIG_FIT=y
@@ -24,6 +26,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:2m(uboot-env),1m(dtb),5m(kernel),56m(fs),-(usr)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1010RDB-PA_SDCARD_defconfig b/configs/P1010RDB-PA_SDCARD_defconfig
index d5a18093a328..0d5fe5dd3f83 100644
--- a/configs/P1010RDB-PA_SDCARD_defconfig
+++ b/configs/P1010RDB-PA_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
diff --git a/configs/P1010RDB-PA_SPIFLASH_SECBOOT_defconfig b/configs/P1010RDB-PA_SPIFLASH_SECBOOT_defconfig
index d1dca08ab83e..f289a342dee8 100644
--- a/configs/P1010RDB-PA_SPIFLASH_SECBOOT_defconfig
+++ b/configs/P1010RDB-PA_SPIFLASH_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PA=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PA_SPIFLASH_defconfig b/configs/P1010RDB-PA_SPIFLASH_defconfig
index 71aea8a6e88e..6012f88bf35c 100644
--- a/configs/P1010RDB-PA_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PA_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1010RDB-PB_36BIT_NAND_SECBOOT_defconfig b/configs/P1010RDB-PB_36BIT_NAND_SECBOOT_defconfig
index f304be67a919..1ad079bc89ed 100644
--- a/configs/P1010RDB-PB_36BIT_NAND_SECBOOT_defconfig
+++ b/configs/P1010RDB-PB_36BIT_NAND_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PB_36BIT_NAND_defconfig b/configs/P1010RDB-PB_36BIT_NAND_defconfig
index 622db5fbc223..a28ab0417941 100644
--- a/configs/P1010RDB-PB_36BIT_NAND_defconfig
+++ b/configs/P1010RDB-PB_36BIT_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
diff --git a/configs/P1010RDB-PB_36BIT_NOR_SECBOOT_defconfig b/configs/P1010RDB-PB_36BIT_NOR_SECBOOT_defconfig
index 4c7f46460969..ebbd76e60d5f 100644
--- a/configs/P1010RDB-PB_36BIT_NOR_SECBOOT_defconfig
+++ b/configs/P1010RDB-PB_36BIT_NOR_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PB_36BIT_NOR_defconfig b/configs/P1010RDB-PB_36BIT_NOR_defconfig
index 9ea5d83e922c..35daf2cb900a 100644
--- a/configs/P1010RDB-PB_36BIT_NOR_defconfig
+++ b/configs/P1010RDB-PB_36BIT_NOR_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
 CONFIG_PHYS_64BIT=y
@@ -25,6 +27,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:2m(uboot-env),1m(dtb),5m(kernel),56m(fs),-(usr)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1010RDB-PB_36BIT_SDCARD_defconfig b/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
index 12ca80bae490..2f408d546e0c 100644
--- a/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
diff --git a/configs/P1010RDB-PB_36BIT_SPIFLASH_SECBOOT_defconfig b/configs/P1010RDB-PB_36BIT_SPIFLASH_SECBOOT_defconfig
index 01084fef9438..e85aacc06778 100644
--- a/configs/P1010RDB-PB_36BIT_SPIFLASH_SECBOOT_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SPIFLASH_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig b/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
index f857023fca3e..f538a5029bde 100644
--- a/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PB_36BIT_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1010RDB-PB_NAND_SECBOOT_defconfig b/configs/P1010RDB-PB_NAND_SECBOOT_defconfig
index 844e4a088dfe..154cbd434409 100644
--- a/configs/P1010RDB-PB_NAND_SECBOOT_defconfig
+++ b/configs/P1010RDB-PB_NAND_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PB_NAND_defconfig b/configs/P1010RDB-PB_NAND_defconfig
index 33fd5fca4431..11ff356201c3 100644
--- a/configs/P1010RDB-PB_NAND_defconfig
+++ b/configs/P1010RDB-PB_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
diff --git a/configs/P1010RDB-PB_NOR_SECBOOT_defconfig b/configs/P1010RDB-PB_NOR_SECBOOT_defconfig
index bcfb589095a5..6775aba6f2c7 100644
--- a/configs/P1010RDB-PB_NOR_SECBOOT_defconfig
+++ b/configs/P1010RDB-PB_NOR_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PB_NOR_defconfig b/configs/P1010RDB-PB_NOR_defconfig
index 4178800a3a01..9ad9f955a3b6 100644
--- a/configs/P1010RDB-PB_NOR_defconfig
+++ b/configs/P1010RDB-PB_NOR_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
 CONFIG_FIT=y
@@ -24,6 +26,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nand0=ff800000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:2m(uboot-env),1m(dtb),5m(kernel),56m(fs),-(usr)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1010RDB-PB_SDCARD_defconfig b/configs/P1010RDB-PB_SDCARD_defconfig
index 982305bf1bb1..cd5ccc882b50 100644
--- a/configs/P1010RDB-PB_SDCARD_defconfig
+++ b/configs/P1010RDB-PB_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
diff --git a/configs/P1010RDB-PB_SPIFLASH_SECBOOT_defconfig b/configs/P1010RDB-PB_SPIFLASH_SECBOOT_defconfig
index 9420619b18b5..5386633cdcb0 100644
--- a/configs/P1010RDB-PB_SPIFLASH_SECBOOT_defconfig
+++ b/configs/P1010RDB-PB_SPIFLASH_SECBOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1010RDB_PB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P1010RDB-PB_SPIFLASH_defconfig b/configs/P1010RDB-PB_SPIFLASH_defconfig
index 3de5feda3882..033719559dac 100644
--- a/configs/P1010RDB-PB_SPIFLASH_defconfig
+++ b/configs/P1010RDB-PB_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1020MBG-PC_36BIT_SDCARD_defconfig b/configs/P1020MBG-PC_36BIT_SDCARD_defconfig
index 71cf213041ba..222dbf034d82 100644
--- a/configs/P1020MBG-PC_36BIT_SDCARD_defconfig
+++ b/configs/P1020MBG-PC_36BIT_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020MBG-PC_36BIT_defconfig b/configs/P1020MBG-PC_36BIT_defconfig
index 63cc1b6b7729..5fd1870ce5c0 100644
--- a/configs/P1020MBG-PC_36BIT_defconfig
+++ b/configs/P1020MBG-PC_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1020MBG=y
@@ -27,6 +29,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1020MBG-PC_SDCARD_defconfig b/configs/P1020MBG-PC_SDCARD_defconfig
index 44f77421c920..c48e463f2994 100644
--- a/configs/P1020MBG-PC_SDCARD_defconfig
+++ b/configs/P1020MBG-PC_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020MBG-PC_defconfig b/configs/P1020MBG-PC_defconfig
index f0a479aca8d4..c8a324d0a9e8 100644
--- a/configs/P1020MBG-PC_defconfig
+++ b/configs/P1020MBG-PC_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1020MBG=y
@@ -26,6 +28,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1020RDB-PC_36BIT_NAND_defconfig b/configs/P1020RDB-PC_36BIT_NAND_defconfig
index 2fc6e83a3470..c5fad3ebc2f3 100644
--- a/configs/P1020RDB-PC_36BIT_NAND_defconfig
+++ b/configs/P1020RDB-PC_36BIT_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020RDB-PC_36BIT_SDCARD_defconfig b/configs/P1020RDB-PC_36BIT_SDCARD_defconfig
index f7532151f2af..4230a494993e 100644
--- a/configs/P1020RDB-PC_36BIT_SDCARD_defconfig
+++ b/configs/P1020RDB-PC_36BIT_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig b/configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig
index d47c291425d3..888f9e98fbd7 100644
--- a/configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig
+++ b/configs/P1020RDB-PC_36BIT_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1020RDB-PC_36BIT_defconfig b/configs/P1020RDB-PC_36BIT_defconfig
index 9ce12c564791..454a7991b1da 100644
--- a/configs/P1020RDB-PC_36BIT_defconfig
+++ b/configs/P1020RDB-PC_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1020RDB_PC=y
@@ -30,6 +32,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p1020rdb-pc_36b"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1020RDB-PC_NAND_defconfig b/configs/P1020RDB-PC_NAND_defconfig
index 8e0345be79aa..1bf070971bd1 100644
--- a/configs/P1020RDB-PC_NAND_defconfig
+++ b/configs/P1020RDB-PC_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020RDB-PC_SDCARD_defconfig b/configs/P1020RDB-PC_SDCARD_defconfig
index 43a48bad7c7d..601c7dccb09e 100644
--- a/configs/P1020RDB-PC_SDCARD_defconfig
+++ b/configs/P1020RDB-PC_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020RDB-PC_SPIFLASH_defconfig b/configs/P1020RDB-PC_SPIFLASH_defconfig
index 38c7b04bd9ee..c9de7bc56c60 100644
--- a/configs/P1020RDB-PC_SPIFLASH_defconfig
+++ b/configs/P1020RDB-PC_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1020RDB-PC_defconfig b/configs/P1020RDB-PC_defconfig
index 9158fefdfddd..605c9257cc90 100644
--- a/configs/P1020RDB-PC_defconfig
+++ b/configs/P1020RDB-PC_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1020RDB_PC=y
@@ -29,6 +31,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p1020rdb-pc"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1020RDB-PD_NAND_defconfig b/configs/P1020RDB-PD_NAND_defconfig
index a1f2ac63f17d..8cebc3ce8f0d 100644
--- a/configs/P1020RDB-PD_NAND_defconfig
+++ b/configs/P1020RDB-PD_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020RDB-PD_SDCARD_defconfig b/configs/P1020RDB-PD_SDCARD_defconfig
index fba8dfbd19a7..2bd17ec32653 100644
--- a/configs/P1020RDB-PD_SDCARD_defconfig
+++ b/configs/P1020RDB-PD_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020RDB-PD_SPIFLASH_defconfig b/configs/P1020RDB-PD_SPIFLASH_defconfig
index fc90cf5a29dc..a5255a3a96f6 100644
--- a/configs/P1020RDB-PD_SPIFLASH_defconfig
+++ b/configs/P1020RDB-PD_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1020RDB-PD_defconfig b/configs/P1020RDB-PD_defconfig
index a29f811450f8..ea3e26cf4fb1 100644
--- a/configs/P1020RDB-PD_defconfig
+++ b/configs/P1020RDB-PD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1020RDB_PD=y
@@ -32,6 +34,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=ec000000.nor:128k(dtb),6016k(kernel),57088k(fs
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p1020rdb-pd"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P1020UTM-PC_36BIT_SDCARD_defconfig b/configs/P1020UTM-PC_36BIT_SDCARD_defconfig
index a5213d709987..069a1d317621 100644
--- a/configs/P1020UTM-PC_36BIT_SDCARD_defconfig
+++ b/configs/P1020UTM-PC_36BIT_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020UTM-PC_36BIT_defconfig b/configs/P1020UTM-PC_36BIT_defconfig
index 4fe2a9228a62..df9ae199a45c 100644
--- a/configs/P1020UTM-PC_36BIT_defconfig
+++ b/configs/P1020UTM-PC_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1020UTM=y
@@ -27,6 +29,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1020UTM-PC_SDCARD_defconfig b/configs/P1020UTM-PC_SDCARD_defconfig
index 4f8c82b44e93..a6b3e0ca99a0 100644
--- a/configs/P1020UTM-PC_SDCARD_defconfig
+++ b/configs/P1020UTM-PC_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1020UTM-PC_defconfig b/configs/P1020UTM-PC_defconfig
index dbe1879d886f..2ec53742eddd 100644
--- a/configs/P1020UTM-PC_defconfig
+++ b/configs/P1020UTM-PC_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1020UTM=y
@@ -26,6 +28,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1021RDB-PC_36BIT_NAND_defconfig b/configs/P1021RDB-PC_36BIT_NAND_defconfig
index 8a929f11eebe..8cc533ca1d09 100644
--- a/configs/P1021RDB-PC_36BIT_NAND_defconfig
+++ b/configs/P1021RDB-PC_36BIT_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1021RDB-PC_36BIT_SDCARD_defconfig b/configs/P1021RDB-PC_36BIT_SDCARD_defconfig
index 1b66deb4072f..40b06d207d80 100644
--- a/configs/P1021RDB-PC_36BIT_SDCARD_defconfig
+++ b/configs/P1021RDB-PC_36BIT_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig b/configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig
index 581e37e9cdd4..74b3472cca78 100644
--- a/configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig
+++ b/configs/P1021RDB-PC_36BIT_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1021RDB-PC_36BIT_defconfig b/configs/P1021RDB-PC_36BIT_defconfig
index 273435a6b462..01ae3e494aee 100644
--- a/configs/P1021RDB-PC_36BIT_defconfig
+++ b/configs/P1021RDB-PC_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1021RDB=y
@@ -31,6 +33,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=fef000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fef000000.nor:256k(vsc7385-firmware),256k(dtb),4608k(kernel),9728k(fs),256k(qe-ucode-firmware),1280k(u-boot)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1021RDB-PC_NAND_defconfig b/configs/P1021RDB-PC_NAND_defconfig
index 3795668bd852..aeac3b60f9dc 100644
--- a/configs/P1021RDB-PC_NAND_defconfig
+++ b/configs/P1021RDB-PC_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1021RDB-PC_SDCARD_defconfig b/configs/P1021RDB-PC_SDCARD_defconfig
index 1be333c5b45c..6d4dfc02132b 100644
--- a/configs/P1021RDB-PC_SDCARD_defconfig
+++ b/configs/P1021RDB-PC_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1021RDB-PC_SPIFLASH_defconfig b/configs/P1021RDB-PC_SPIFLASH_defconfig
index 0ae8a7f91f1f..3dc5ca8ffc83 100644
--- a/configs/P1021RDB-PC_SPIFLASH_defconfig
+++ b/configs/P1021RDB-PC_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1021RDB-PC_defconfig b/configs/P1021RDB-PC_defconfig
index 9671af1d86d4..373c4f0fa6dd 100644
--- a/configs/P1021RDB-PC_defconfig
+++ b/configs/P1021RDB-PC_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1021RDB=y
@@ -30,6 +32,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=ef000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ef000000.nor:256k(vsc7385-firmware),256k(dtb),4608k(kernel),9728k(fs),256k(qe-ucode-firmware),1280k(u-boot)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1022DS_36BIT_NAND_defconfig b/configs/P1022DS_36BIT_NAND_defconfig
index cfdb0fbf18d3..013af8743722 100644
--- a/configs/P1022DS_36BIT_NAND_defconfig
+++ b/configs/P1022DS_36BIT_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1022DS=y
diff --git a/configs/P1022DS_36BIT_SDCARD_defconfig b/configs/P1022DS_36BIT_SDCARD_defconfig
index 8bb5285488ba..6b400cdcfb06 100644
--- a/configs/P1022DS_36BIT_SDCARD_defconfig
+++ b/configs/P1022DS_36BIT_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1022DS=y
diff --git a/configs/P1022DS_36BIT_SPIFLASH_defconfig b/configs/P1022DS_36BIT_SPIFLASH_defconfig
index 8b5a67552650..b4aa22281387 100644
--- a/configs/P1022DS_36BIT_SPIFLASH_defconfig
+++ b/configs/P1022DS_36BIT_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1022DS_36BIT_defconfig b/configs/P1022DS_36BIT_defconfig
index 44c950ed13e7..c1b4b77cacf3 100644
--- a/configs/P1022DS_36BIT_defconfig
+++ b/configs/P1022DS_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1022DS=y
 CONFIG_PHYS_64BIT=y
@@ -29,6 +31,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:48m(ramdisk),14m(diagnostic),2m(dink),6m(kernel),58112k(fs),512k(dtb),768k(u-boot)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1022DS_NAND_defconfig b/configs/P1022DS_NAND_defconfig
index 982ac00bebf5..eb7a34b7cd0c 100644
--- a/configs/P1022DS_NAND_defconfig
+++ b/configs/P1022DS_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1022DS=y
diff --git a/configs/P1022DS_SDCARD_defconfig b/configs/P1022DS_SDCARD_defconfig
index 7b3e98304ae8..fec645a8efb6 100644
--- a/configs/P1022DS_SDCARD_defconfig
+++ b/configs/P1022DS_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1022DS=y
diff --git a/configs/P1022DS_SPIFLASH_defconfig b/configs/P1022DS_SPIFLASH_defconfig
index 206dda0017ec..f478dc8c4c02 100644
--- a/configs/P1022DS_SPIFLASH_defconfig
+++ b/configs/P1022DS_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1022DS_defconfig b/configs/P1022DS_defconfig
index 42c47f732a4b..4a2bd8ca779c 100644
--- a/configs/P1022DS_defconfig
+++ b/configs/P1022DS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P1022DS=y
 CONFIG_FIT=y
@@ -28,6 +30,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=e8000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=e8000000.nor:48m(ramdisk),14m(diagnostic),2m(dink),6m(kernel),58112k(fs),512k(dtb),768k(u-boot)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1023RDB_defconfig b/configs/P1023RDB_defconfig
index ee2aee4a322b..9c2d90e8def7 100644
--- a/configs/P1023RDB_defconfig
+++ b/configs/P1023RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1023RDB=y
@@ -27,6 +29,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1024RDB_36BIT_defconfig b/configs/P1024RDB_36BIT_defconfig
index 577d9e863a62..2541fd14cf56 100644
--- a/configs/P1024RDB_36BIT_defconfig
+++ b/configs/P1024RDB_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1024RDB=y
@@ -27,6 +29,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1024RDB_NAND_defconfig b/configs/P1024RDB_NAND_defconfig
index b3e8a4ce6109..2a8233b1c587 100644
--- a/configs/P1024RDB_NAND_defconfig
+++ b/configs/P1024RDB_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1024RDB_SDCARD_defconfig b/configs/P1024RDB_SDCARD_defconfig
index bbd0bd8e3e71..7e38adf5833e 100644
--- a/configs/P1024RDB_SDCARD_defconfig
+++ b/configs/P1024RDB_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1024RDB_SPIFLASH_defconfig b/configs/P1024RDB_SPIFLASH_defconfig
index 398b9491253d..4c29e4a2da05 100644
--- a/configs/P1024RDB_SPIFLASH_defconfig
+++ b/configs/P1024RDB_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1024RDB_defconfig b/configs/P1024RDB_defconfig
index 694a2e9eacc6..88c79c9e0df5 100644
--- a/configs/P1024RDB_defconfig
+++ b/configs/P1024RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1024RDB=y
@@ -26,6 +28,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1025RDB_36BIT_defconfig b/configs/P1025RDB_36BIT_defconfig
index e2407e3ae8d7..0b475d679104 100644
--- a/configs/P1025RDB_36BIT_defconfig
+++ b/configs/P1025RDB_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1025RDB=y
@@ -29,6 +31,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P1025RDB_NAND_defconfig b/configs/P1025RDB_NAND_defconfig
index 51b12233ea1a..71c58d892327 100644
--- a/configs/P1025RDB_NAND_defconfig
+++ b/configs/P1025RDB_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1025RDB_SDCARD_defconfig b/configs/P1025RDB_SDCARD_defconfig
index 9f4debf1fc8e..d09eb782d1df 100644
--- a/configs/P1025RDB_SDCARD_defconfig
+++ b/configs/P1025RDB_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P1025RDB_SPIFLASH_defconfig b/configs/P1025RDB_SPIFLASH_defconfig
index d12348bb311f..d78bb54fc207 100644
--- a/configs/P1025RDB_SPIFLASH_defconfig
+++ b/configs/P1025RDB_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P1025RDB_defconfig b/configs/P1025RDB_defconfig
index a22f1a10da08..4d8711bbb1da 100644
--- a/configs/P1025RDB_defconfig
+++ b/configs/P1025RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1025RDB=y
@@ -28,6 +30,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/P2020RDB-PC_36BIT_NAND_defconfig b/configs/P2020RDB-PC_36BIT_NAND_defconfig
index 5a4f5822edcf..8d54a0f0c1de 100644
--- a/configs/P2020RDB-PC_36BIT_NAND_defconfig
+++ b/configs/P2020RDB-PC_36BIT_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P2020RDB-PC_36BIT_SDCARD_defconfig b/configs/P2020RDB-PC_36BIT_SDCARD_defconfig
index 73222c9e5ee0..770e497d5113 100644
--- a/configs/P2020RDB-PC_36BIT_SDCARD_defconfig
+++ b/configs/P2020RDB-PC_36BIT_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig b/configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig
index 8cb2afc47b4e..3e9a841828df 100644
--- a/configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig
+++ b/configs/P2020RDB-PC_36BIT_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P2020RDB-PC_36BIT_defconfig b/configs/P2020RDB-PC_36BIT_defconfig
index c99c25f83590..243f4e108af7 100644
--- a/configs/P2020RDB-PC_36BIT_defconfig
+++ b/configs/P2020RDB-PC_36BIT_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P2020RDB=y
@@ -34,6 +36,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fef000000.nor:256k(vsc7385-firmware),256k(dtb)
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p2020rdb-pc_36b"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P2020RDB-PC_NAND_defconfig b/configs/P2020RDB-PC_NAND_defconfig
index 965172515113..c4050b8da724 100644
--- a/configs/P2020RDB-PC_NAND_defconfig
+++ b/configs/P2020RDB-PC_NAND_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P2020RDB-PC_SDCARD_defconfig b/configs/P2020RDB-PC_SDCARD_defconfig
index 7768fd14c9b0..94458c9d14df 100644
--- a/configs/P2020RDB-PC_SDCARD_defconfig
+++ b/configs/P2020RDB-PC_SDCARD_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/P2020RDB-PC_SPIFLASH_defconfig b/configs/P2020RDB-PC_SPIFLASH_defconfig
index 6e3a3c6e1e2d..19807d45f48c 100644
--- a/configs/P2020RDB-PC_SPIFLASH_defconfig
+++ b/configs/P2020RDB-PC_SPIFLASH_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_TEXT_BASE=0x11001000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
diff --git a/configs/P2020RDB-PC_defconfig b/configs/P2020RDB-PC_defconfig
index a0a69ca22f54..ebd6d76d8ff0 100644
--- a/configs/P2020RDB-PC_defconfig
+++ b/configs/P2020RDB-PC_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P2020RDB=y
@@ -33,6 +35,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=ef000000.nor:256k(vsc7385-firmware),256k(dtb),
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p2020rdb-pc"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P2041RDB_NAND_defconfig b/configs/P2041RDB_NAND_defconfig
index 9c86ded023d0..889cc60fe0bd 100644
--- a/configs/P2041RDB_NAND_defconfig
+++ b/configs/P2041RDB_NAND_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P2041RDB=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P2041RDB_SDCARD_defconfig b/configs/P2041RDB_SDCARD_defconfig
index 96240f1ac5a6..a09a0b8aa1cb 100644
--- a/configs/P2041RDB_SDCARD_defconfig
+++ b/configs/P2041RDB_SDCARD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xCF400
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P2041RDB=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P2041RDB_SECURE_BOOT_defconfig b/configs/P2041RDB_SECURE_BOOT_defconfig
index 5c13d29258f2..eace75ecb542 100644
--- a/configs/P2041RDB_SECURE_BOOT_defconfig
+++ b/configs/P2041RDB_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P2041RDB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P2041RDB_SPIFLASH_defconfig b/configs/P2041RDB_SPIFLASH_defconfig
index db8108025259..9dc89848e11d 100644
--- a/configs/P2041RDB_SPIFLASH_defconfig
+++ b/configs/P2041RDB_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P2041RDB=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P2041RDB_SRIO_PCIE_BOOT_defconfig b/configs/P2041RDB_SRIO_PCIE_BOOT_defconfig
index 4161d10c27ef..5c06ac75219f 100644
--- a/configs/P2041RDB_SRIO_PCIE_BOOT_defconfig
+++ b/configs/P2041RDB_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P2041RDB=y
 CONFIG_FIT=y
@@ -24,6 +25,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/P2041RDB_defconfig b/configs/P2041RDB_defconfig
index e757330510e8..b51a12048268 100644
--- a/configs/P2041RDB_defconfig
+++ b/configs/P2041RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P2041RDB=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -26,6 +28,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p2041rdb"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/P3041DS_NAND_SECURE_BOOT_defconfig b/configs/P3041DS_NAND_SECURE_BOOT_defconfig
index ce1f79c1ec57..fb9d2606bbb2 100644
--- a/configs/P3041DS_NAND_SECURE_BOOT_defconfig
+++ b/configs/P3041DS_NAND_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P3041DS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P3041DS_NAND_defconfig b/configs/P3041DS_NAND_defconfig
index 542d947f4f19..04c6a11e9a34 100644
--- a/configs/P3041DS_NAND_defconfig
+++ b/configs/P3041DS_NAND_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P3041DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P3041DS_SDCARD_defconfig b/configs/P3041DS_SDCARD_defconfig
index 2cb4688a9a99..32c85d38e060 100644
--- a/configs/P3041DS_SDCARD_defconfig
+++ b/configs/P3041DS_SDCARD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xCF400
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P3041DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P3041DS_SECURE_BOOT_defconfig b/configs/P3041DS_SECURE_BOOT_defconfig
index 1ba0194feaa7..c180f35db329 100644
--- a/configs/P3041DS_SECURE_BOOT_defconfig
+++ b/configs/P3041DS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P3041DS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P3041DS_SPIFLASH_defconfig b/configs/P3041DS_SPIFLASH_defconfig
index b45118cbc3f7..c3752a60ee41 100644
--- a/configs/P3041DS_SPIFLASH_defconfig
+++ b/configs/P3041DS_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P3041DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P3041DS_SRIO_PCIE_BOOT_defconfig b/configs/P3041DS_SRIO_PCIE_BOOT_defconfig
index efb759d470a8..cf9e2dd32fc4 100644
--- a/configs/P3041DS_SRIO_PCIE_BOOT_defconfig
+++ b/configs/P3041DS_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P3041DS=y
 CONFIG_FIT=y
@@ -24,6 +25,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/P3041DS_defconfig b/configs/P3041DS_defconfig
index 96297df0df9e..0757ece1522a 100644
--- a/configs/P3041DS_defconfig
+++ b/configs/P3041DS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P3041DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -26,6 +28,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p3041ds"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/P4080DS_SDCARD_defconfig b/configs/P4080DS_SDCARD_defconfig
index 86455da09f3c..e8209fab6c57 100644
--- a/configs/P4080DS_SDCARD_defconfig
+++ b/configs/P4080DS_SDCARD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xCF400
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P4080DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P4080DS_SECURE_BOOT_defconfig b/configs/P4080DS_SECURE_BOOT_defconfig
index 4f5ad98cd15d..281bba123f97 100644
--- a/configs/P4080DS_SECURE_BOOT_defconfig
+++ b/configs/P4080DS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P4080DS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P4080DS_SPIFLASH_defconfig b/configs/P4080DS_SPIFLASH_defconfig
index 2344198379d6..2d0cb4614537 100644
--- a/configs/P4080DS_SPIFLASH_defconfig
+++ b/configs/P4080DS_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P4080DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P4080DS_SRIO_PCIE_BOOT_defconfig b/configs/P4080DS_SRIO_PCIE_BOOT_defconfig
index 095b21f95b59..2ee3d1090696 100644
--- a/configs/P4080DS_SRIO_PCIE_BOOT_defconfig
+++ b/configs/P4080DS_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P4080DS=y
 CONFIG_FIT=y
@@ -24,6 +25,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/P4080DS_defconfig b/configs/P4080DS_defconfig
index a9a90e499885..801f56026a02 100644
--- a/configs/P4080DS_defconfig
+++ b/configs/P4080DS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P4080DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -26,6 +28,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p4080ds"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/P5020DS_NAND_SECURE_BOOT_defconfig b/configs/P5020DS_NAND_SECURE_BOOT_defconfig
index 8c07d0f55a24..183296867857 100644
--- a/configs/P5020DS_NAND_SECURE_BOOT_defconfig
+++ b/configs/P5020DS_NAND_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5020DS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P5020DS_NAND_defconfig b/configs/P5020DS_NAND_defconfig
index 4ae3e177f51c..cbb1263e18f6 100644
--- a/configs/P5020DS_NAND_defconfig
+++ b/configs/P5020DS_NAND_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5020DS=y
 CONFIG_FIT=y
diff --git a/configs/P5020DS_SDCARD_defconfig b/configs/P5020DS_SDCARD_defconfig
index 829c6aa70486..43e5b9c3dfe4 100644
--- a/configs/P5020DS_SDCARD_defconfig
+++ b/configs/P5020DS_SDCARD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xCF400
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5020DS=y
 CONFIG_FIT=y
diff --git a/configs/P5020DS_SECURE_BOOT_defconfig b/configs/P5020DS_SECURE_BOOT_defconfig
index 26cc310b8c98..326bb06967ba 100644
--- a/configs/P5020DS_SECURE_BOOT_defconfig
+++ b/configs/P5020DS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5020DS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P5020DS_SPIFLASH_defconfig b/configs/P5020DS_SPIFLASH_defconfig
index 008ed33fbf33..b82f28480a84 100644
--- a/configs/P5020DS_SPIFLASH_defconfig
+++ b/configs/P5020DS_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5020DS=y
 CONFIG_FIT=y
diff --git a/configs/P5020DS_SRIO_PCIE_BOOT_defconfig b/configs/P5020DS_SRIO_PCIE_BOOT_defconfig
index 79de46e41528..ce80ef9bc987 100644
--- a/configs/P5020DS_SRIO_PCIE_BOOT_defconfig
+++ b/configs/P5020DS_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5020DS=y
 CONFIG_FIT=y
@@ -25,6 +26,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/P5020DS_defconfig b/configs/P5020DS_defconfig
index df43d13f7ca8..2c116cf90f96 100644
--- a/configs/P5020DS_defconfig
+++ b/configs/P5020DS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5020DS=y
 CONFIG_FIT=y
@@ -24,6 +26,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/P5040DS_NAND_SECURE_BOOT_defconfig b/configs/P5040DS_NAND_SECURE_BOOT_defconfig
index b268a9fa10d5..be287317fd4e 100644
--- a/configs/P5040DS_NAND_SECURE_BOOT_defconfig
+++ b/configs/P5040DS_NAND_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5040DS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P5040DS_NAND_defconfig b/configs/P5040DS_NAND_defconfig
index bf58aba7a1d2..465fc371f5ce 100644
--- a/configs/P5040DS_NAND_defconfig
+++ b/configs/P5040DS_NAND_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5040DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P5040DS_SDCARD_defconfig b/configs/P5040DS_SDCARD_defconfig
index 51b8197ef802..711d97221c0e 100644
--- a/configs/P5040DS_SDCARD_defconfig
+++ b/configs/P5040DS_SDCARD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xCF400
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5040DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P5040DS_SECURE_BOOT_defconfig b/configs/P5040DS_SECURE_BOOT_defconfig
index a6e6f191ccba..bae759e4bc52 100644
--- a/configs/P5040DS_SECURE_BOOT_defconfig
+++ b/configs/P5040DS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5040DS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/P5040DS_SPIFLASH_defconfig b/configs/P5040DS_SPIFLASH_defconfig
index adf61e3fb663..2b96bca1a9e6 100644
--- a/configs/P5040DS_SPIFLASH_defconfig
+++ b/configs/P5040DS_SPIFLASH_defconfig
@@ -1,5 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5040DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/P5040DS_defconfig b/configs/P5040DS_defconfig
index f922521e7fed..bb9e5d86a144 100644
--- a/configs/P5040DS_defconfig
+++ b/configs/P5040DS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_P5040DS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -27,6 +29,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="p5040ds"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/SBx81LIFKW_defconfig b/configs/SBx81LIFKW_defconfig
index 73f8cfb608de..61dc1e87528f 100644
--- a/configs/SBx81LIFKW_defconfig
+++ b/configs/SBx81LIFKW_defconfig
@@ -4,6 +4,9 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x00600000
 CONFIG_TARGET_SBx81LIFKW=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_IDENT_STRING="\nSBx81LIFKW"
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_BOOTDELAY=3
diff --git a/configs/SBx81LIFXCAT_defconfig b/configs/SBx81LIFXCAT_defconfig
index 094d4c65b3e3..bda5e7f06d9a 100644
--- a/configs/SBx81LIFXCAT_defconfig
+++ b/configs/SBx81LIFXCAT_defconfig
@@ -4,6 +4,9 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x00600000
 CONFIG_TARGET_SBx81LIFXCAT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_IDENT_STRING="\nSBx81LIFXCAT"
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_BOOTDELAY=3
diff --git a/configs/T1023RDB_NAND_defconfig b/configs/T1023RDB_NAND_defconfig
index 1902197f5b16..f82d396d560f 100644
--- a/configs/T1023RDB_NAND_defconfig
+++ b/configs/T1023RDB_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1023RDB=y
diff --git a/configs/T1023RDB_SDCARD_defconfig b/configs/T1023RDB_SDCARD_defconfig
index 8f1caae06698..120cf8c9780a 100644
--- a/configs/T1023RDB_SDCARD_defconfig
+++ b/configs/T1023RDB_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1023RDB=y
diff --git a/configs/T1023RDB_SECURE_BOOT_defconfig b/configs/T1023RDB_SECURE_BOOT_defconfig
index 865b7a9cbf3a..980ea5072bf6 100644
--- a/configs/T1023RDB_SECURE_BOOT_defconfig
+++ b/configs/T1023RDB_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1023RDB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1023RDB_SPIFLASH_defconfig b/configs/T1023RDB_SPIFLASH_defconfig
index 49df3528b9b2..a4ea7dde5a07 100644
--- a/configs/T1023RDB_SPIFLASH_defconfig
+++ b/configs/T1023RDB_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -44,6 +47,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.1"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:1m(uboot),5m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T1023RDB_defconfig b/configs/T1023RDB_defconfig
index cadc16a2b05c..c2443034e978 100644
--- a/configs/T1023RDB_defconfig
+++ b/configs/T1023RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1023RDB=y
 CONFIG_FIT=y
@@ -29,6 +31,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.1"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:1m(uboot),5m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T1024QDS_DDR4_SECURE_BOOT_defconfig b/configs/T1024QDS_DDR4_SECURE_BOOT_defconfig
index 09f0979a9230..dc4f94af9536 100644
--- a/configs/T1024QDS_DDR4_SECURE_BOOT_defconfig
+++ b/configs/T1024QDS_DDR4_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1024QDS_DDR4_defconfig b/configs/T1024QDS_DDR4_defconfig
index 6a61ddff88e7..265bf372041d 100644
--- a/configs/T1024QDS_DDR4_defconfig
+++ b/configs/T1024QDS_DDR4_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
 CONFIG_FIT=y
@@ -30,6 +32,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T1024QDS_NAND_defconfig b/configs/T1024QDS_NAND_defconfig
index cf010f1c997a..1267a76482ee 100644
--- a/configs/T1024QDS_NAND_defconfig
+++ b/configs/T1024QDS_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
diff --git a/configs/T1024QDS_SDCARD_defconfig b/configs/T1024QDS_SDCARD_defconfig
index df896b3b5649..27239cc19fab 100644
--- a/configs/T1024QDS_SDCARD_defconfig
+++ b/configs/T1024QDS_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
diff --git a/configs/T1024QDS_SECURE_BOOT_defconfig b/configs/T1024QDS_SECURE_BOOT_defconfig
index 949a33e2a6dc..32f88ea5130a 100644
--- a/configs/T1024QDS_SECURE_BOOT_defconfig
+++ b/configs/T1024QDS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1024QDS_SPIFLASH_defconfig b/configs/T1024QDS_SPIFLASH_defconfig
index 1a0915b90da0..5b91d7f8d79c 100644
--- a/configs/T1024QDS_SPIFLASH_defconfig
+++ b/configs/T1024QDS_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -45,6 +48,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1024QDS_defconfig b/configs/T1024QDS_defconfig
index af0eb46f8406..93da3a79ef37 100644
--- a/configs/T1024QDS_defconfig
+++ b/configs/T1024QDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024QDS=y
 CONFIG_FIT=y
@@ -30,6 +32,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1024RDB_NAND_defconfig b/configs/T1024RDB_NAND_defconfig
index af65615f7d3d..d9fe82acadc6 100644
--- a/configs/T1024RDB_NAND_defconfig
+++ b/configs/T1024RDB_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024RDB=y
diff --git a/configs/T1024RDB_SDCARD_defconfig b/configs/T1024RDB_SDCARD_defconfig
index 43817bedf209..8412eb1bece1 100644
--- a/configs/T1024RDB_SDCARD_defconfig
+++ b/configs/T1024RDB_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024RDB=y
diff --git a/configs/T1024RDB_SECURE_BOOT_defconfig b/configs/T1024RDB_SECURE_BOOT_defconfig
index 93abcf34660a..cc4d12f8e644 100644
--- a/configs/T1024RDB_SECURE_BOOT_defconfig
+++ b/configs/T1024RDB_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024RDB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1024RDB_SPIFLASH_defconfig b/configs/T1024RDB_SPIFLASH_defconfig
index 9ffd5d62303f..cbb992cb2fac 100644
--- a/configs/T1024RDB_SPIFLASH_defconfig
+++ b/configs/T1024RDB_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -47,6 +50,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),9
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t1024rdb"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
diff --git a/configs/T1024RDB_defconfig b/configs/T1024RDB_defconfig
index 08a622544449..2b40f5d1c099 100644
--- a/configs/T1024RDB_defconfig
+++ b/configs/T1024RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1024RDB=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -33,6 +35,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),9
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t1024rdb"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
diff --git a/configs/T1040D4RDB_NAND_defconfig b/configs/T1040D4RDB_NAND_defconfig
index ab5a9b73c0e5..fce47588bb95 100644
--- a/configs/T1040D4RDB_NAND_defconfig
+++ b/configs/T1040D4RDB_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040D4RDB=y
diff --git a/configs/T1040D4RDB_SDCARD_defconfig b/configs/T1040D4RDB_SDCARD_defconfig
index edbedf841b68..9cf68f8be483 100644
--- a/configs/T1040D4RDB_SDCARD_defconfig
+++ b/configs/T1040D4RDB_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040D4RDB=y
diff --git a/configs/T1040D4RDB_SECURE_BOOT_defconfig b/configs/T1040D4RDB_SECURE_BOOT_defconfig
index e59f8d736ed7..03266d4ec394 100644
--- a/configs/T1040D4RDB_SECURE_BOOT_defconfig
+++ b/configs/T1040D4RDB_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040D4RDB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1040D4RDB_SPIFLASH_defconfig b/configs/T1040D4RDB_SPIFLASH_defconfig
index 1f08ee8e8039..98b4717aaa3c 100644
--- a/configs/T1040D4RDB_SPIFLASH_defconfig
+++ b/configs/T1040D4RDB_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -43,6 +46,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T1040D4RDB_defconfig b/configs/T1040D4RDB_defconfig
index 8d7427d310c7..ba32893bef4c 100644
--- a/configs/T1040D4RDB_defconfig
+++ b/configs/T1040D4RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040D4RDB=y
 CONFIG_FIT=y
@@ -28,6 +30,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T1040QDS_DDR4_defconfig b/configs/T1040QDS_DDR4_defconfig
index 9aa552379f74..0181de22c33c 100644
--- a/configs/T1040QDS_DDR4_defconfig
+++ b/configs/T1040QDS_DDR4_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040QDS=y
 CONFIG_FIT=y
@@ -31,6 +33,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T1040QDS_SECURE_BOOT_defconfig b/configs/T1040QDS_SECURE_BOOT_defconfig
index e411274a9d4c..b0e830711a0e 100644
--- a/configs/T1040QDS_SECURE_BOOT_defconfig
+++ b/configs/T1040QDS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1040QDS_defconfig b/configs/T1040QDS_defconfig
index 5901ca51f148..59e47645b855 100644
--- a/configs/T1040QDS_defconfig
+++ b/configs/T1040QDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040QDS=y
 CONFIG_FIT=y
@@ -31,6 +33,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1040RDB_NAND_defconfig b/configs/T1040RDB_NAND_defconfig
index c00c85038465..a70581e0dce9 100644
--- a/configs/T1040RDB_NAND_defconfig
+++ b/configs/T1040RDB_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040RDB=y
diff --git a/configs/T1040RDB_SDCARD_defconfig b/configs/T1040RDB_SDCARD_defconfig
index 369b08d4efca..99c528e10525 100644
--- a/configs/T1040RDB_SDCARD_defconfig
+++ b/configs/T1040RDB_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040RDB=y
diff --git a/configs/T1040RDB_SECURE_BOOT_defconfig b/configs/T1040RDB_SECURE_BOOT_defconfig
index 376d52d2cbba..41c598ad2764 100644
--- a/configs/T1040RDB_SECURE_BOOT_defconfig
+++ b/configs/T1040RDB_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040RDB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1040RDB_SPIFLASH_defconfig b/configs/T1040RDB_SPIFLASH_defconfig
index a19d506c6035..23922cdc29ad 100644
--- a/configs/T1040RDB_SPIFLASH_defconfig
+++ b/configs/T1040RDB_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -43,6 +46,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1040RDB_defconfig b/configs/T1040RDB_defconfig
index 9ef146bed050..d8d2e4a35551 100644
--- a/configs/T1040RDB_defconfig
+++ b/configs/T1040RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1040RDB=y
 CONFIG_FIT=y
@@ -28,6 +30,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1042D4RDB_NAND_defconfig b/configs/T1042D4RDB_NAND_defconfig
index 2fcd9e194032..5ea869abf7e0 100644
--- a/configs/T1042D4RDB_NAND_defconfig
+++ b/configs/T1042D4RDB_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042D4RDB=y
diff --git a/configs/T1042D4RDB_SDCARD_defconfig b/configs/T1042D4RDB_SDCARD_defconfig
index 04372fd26a1c..4dca49cb39a0 100644
--- a/configs/T1042D4RDB_SDCARD_defconfig
+++ b/configs/T1042D4RDB_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042D4RDB=y
diff --git a/configs/T1042D4RDB_SECURE_BOOT_defconfig b/configs/T1042D4RDB_SECURE_BOOT_defconfig
index 55541be9758a..93129fa45b7d 100644
--- a/configs/T1042D4RDB_SECURE_BOOT_defconfig
+++ b/configs/T1042D4RDB_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042D4RDB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1042D4RDB_SPIFLASH_defconfig b/configs/T1042D4RDB_SPIFLASH_defconfig
index 2c869cdbd093..4aeb63eac1ee 100644
--- a/configs/T1042D4RDB_SPIFLASH_defconfig
+++ b/configs/T1042D4RDB_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -46,6 +49,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),9
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t1042d4rdb"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1042D4RDB_defconfig b/configs/T1042D4RDB_defconfig
index 5d8a25f2b5ac..ad976961a990 100644
--- a/configs/T1042D4RDB_defconfig
+++ b/configs/T1042D4RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042D4RDB=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -32,6 +34,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),9
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t1042d4rdb"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig b/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
index e11757d3f0ac..6296dc605ba5 100644
--- a/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
+++ b/configs/T1042RDB_PI_NAND_SECURE_BOOT_defconfig
@@ -5,6 +5,7 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_NXP_ESBC=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_NAND_defconfig b/configs/T1042RDB_PI_NAND_defconfig
index a32fa4c64651..c83b12952e9e 100644
--- a/configs/T1042RDB_PI_NAND_defconfig
+++ b/configs/T1042RDB_PI_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_SDCARD_defconfig b/configs/T1042RDB_PI_SDCARD_defconfig
index ad145b65d483..ed5123c3f008 100644
--- a/configs/T1042RDB_PI_SDCARD_defconfig
+++ b/configs/T1042RDB_PI_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
diff --git a/configs/T1042RDB_PI_SPIFLASH_defconfig b/configs/T1042RDB_PI_SPIFLASH_defconfig
index 120fc14d1f34..5677234f7fa5 100644
--- a/configs/T1042RDB_PI_SPIFLASH_defconfig
+++ b/configs/T1042RDB_PI_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -45,6 +48,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1042RDB_PI_defconfig b/configs/T1042RDB_PI_defconfig
index 7aeac6020344..b59e6bf17f45 100644
--- a/configs/T1042RDB_PI_defconfig
+++ b/configs/T1042RDB_PI_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB_PI=y
 CONFIG_FIT=y
@@ -30,6 +32,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T1042RDB_SECURE_BOOT_defconfig b/configs/T1042RDB_SECURE_BOOT_defconfig
index fc9144a03df9..29862687345d 100644
--- a/configs/T1042RDB_SECURE_BOOT_defconfig
+++ b/configs/T1042RDB_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T1042RDB_defconfig b/configs/T1042RDB_defconfig
index 6378c95efc98..fc20e6b37624 100644
--- a/configs/T1042RDB_defconfig
+++ b/configs/T1042RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T1042RDB=y
 CONFIG_FIT=y
@@ -27,6 +29,7 @@ CONFIG_CMD_FAT=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:2m(uboot),9m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:2m(uboot),9m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_SYS_FSL_DDR3=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T2080QDS_NAND_defconfig b/configs/T2080QDS_NAND_defconfig
index 4d80baead6fd..44f0e6c9b6c8 100644
--- a/configs/T2080QDS_NAND_defconfig
+++ b/configs/T2080QDS_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
diff --git a/configs/T2080QDS_SDCARD_defconfig b/configs/T2080QDS_SDCARD_defconfig
index 786f154e71ce..e41c005a04b2 100644
--- a/configs/T2080QDS_SDCARD_defconfig
+++ b/configs/T2080QDS_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
diff --git a/configs/T2080QDS_SECURE_BOOT_defconfig b/configs/T2080QDS_SECURE_BOOT_defconfig
index 3e1b3686eac4..f7f59a7a9d15 100644
--- a/configs/T2080QDS_SECURE_BOOT_defconfig
+++ b/configs/T2080QDS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
diff --git a/configs/T2080QDS_SPIFLASH_defconfig b/configs/T2080QDS_SPIFLASH_defconfig
index 066a83b727e4..56d6c241e372 100644
--- a/configs/T2080QDS_SPIFLASH_defconfig
+++ b/configs/T2080QDS_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -43,6 +46,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),9
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t2080qds"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_DM=y
 CONFIG_FSL_AHCI=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/T2080QDS_SRIO_PCIE_BOOT_defconfig b/configs/T2080QDS_SRIO_PCIE_BOOT_defconfig
index f4bebee1473a..a1cef08b6ec8 100644
--- a/configs/T2080QDS_SRIO_PCIE_BOOT_defconfig
+++ b/configs/T2080QDS_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -27,6 +28,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t2080qds"
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_DM=y
 CONFIG_FSL_AHCI=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/T2080QDS_defconfig b/configs/T2080QDS_defconfig
index e22542fd8c90..7d7179d4fcdc 100644
--- a/configs/T2080QDS_defconfig
+++ b/configs/T2080QDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080QDS=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -29,6 +31,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),9
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t2080qds"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_AHCI=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/T2080RDB_NAND_defconfig b/configs/T2080RDB_NAND_defconfig
index 692d01cbbd87..3d4e0eb397fb 100644
--- a/configs/T2080RDB_NAND_defconfig
+++ b/configs/T2080RDB_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
diff --git a/configs/T2080RDB_SDCARD_defconfig b/configs/T2080RDB_SDCARD_defconfig
index 247cc314b088..1a3a6a37334e 100644
--- a/configs/T2080RDB_SDCARD_defconfig
+++ b/configs/T2080RDB_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
diff --git a/configs/T2080RDB_SECURE_BOOT_defconfig b/configs/T2080RDB_SECURE_BOOT_defconfig
index 71f07438c11e..5c256f8261ec 100644
--- a/configs/T2080RDB_SECURE_BOOT_defconfig
+++ b/configs/T2080RDB_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T2080RDB_SPIFLASH_defconfig b/configs/T2080RDB_SPIFLASH_defconfig
index 1370e16d68ca..01723c63d00e 100644
--- a/configs/T2080RDB_SPIFLASH_defconfig
+++ b/configs/T2080RDB_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -44,6 +47,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),9
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t2080rdb"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T2080RDB_SRIO_PCIE_BOOT_defconfig b/configs/T2080RDB_SRIO_PCIE_BOOT_defconfig
index ab071abc4752..d29c147ece15 100644
--- a/configs/T2080RDB_SRIO_PCIE_BOOT_defconfig
+++ b/configs/T2080RDB_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
 CONFIG_FIT=y
@@ -25,6 +26,7 @@ CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 # CONFIG_CMD_IRQ is not set
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/T2080RDB_defconfig b/configs/T2080RDB_defconfig
index bc4a02663f90..71a95599d11a 100644
--- a/configs/T2080RDB_defconfig
+++ b/configs/T2080RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2080RDB=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -30,6 +32,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),9
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t2080rdb"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/T2081QDS_NAND_defconfig b/configs/T2081QDS_NAND_defconfig
index f793e2a72a3d..72bb8f9be764 100644
--- a/configs/T2081QDS_NAND_defconfig
+++ b/configs/T2081QDS_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2081QDS=y
diff --git a/configs/T2081QDS_SDCARD_defconfig b/configs/T2081QDS_SDCARD_defconfig
index 7d4c147b95ea..ef477d760352 100644
--- a/configs/T2081QDS_SDCARD_defconfig
+++ b/configs/T2081QDS_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2081QDS=y
diff --git a/configs/T2081QDS_SPIFLASH_defconfig b/configs/T2081QDS_SPIFLASH_defconfig
index eb752cd99c70..55718265ed99 100644
--- a/configs/T2081QDS_SPIFLASH_defconfig
+++ b/configs/T2081QDS_SPIFLASH_defconfig
@@ -4,7 +4,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_MPC85xx=y
@@ -40,6 +43,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:1m(uboot),5m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xFFFC9000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T2081QDS_SRIO_PCIE_BOOT_defconfig b/configs/T2081QDS_SRIO_PCIE_BOOT_defconfig
index 5dfb4f2ab212..5f8ee398a88e 100644
--- a/configs/T2081QDS_SRIO_PCIE_BOOT_defconfig
+++ b/configs/T2081QDS_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2081QDS=y
 CONFIG_FIT=y
@@ -23,6 +24,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/T2081QDS_defconfig b/configs/T2081QDS_defconfig
index 306d8b79d845..cecf93cb2552 100644
--- a/configs/T2081QDS_defconfig
+++ b/configs/T2081QDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T2081QDS=y
 CONFIG_FIT=y
@@ -25,6 +27,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=fe8000000.nor,nand0=fff800000.flash,spi0=spife110000.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=fe8000000.nor:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);fff800000.flash:1m(uboot),5m(kernel),128k(dtb),96m(fs),-(user);spife110000.0:1m(uboot),5m(kernel),128k(dtb),-(user)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T4160QDS_NAND_defconfig b/configs/T4160QDS_NAND_defconfig
index 1a47bbc5dbbe..1bdd43bc581f 100644
--- a/configs/T4160QDS_NAND_defconfig
+++ b/configs/T4160QDS_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160QDS=y
diff --git a/configs/T4160QDS_SDCARD_defconfig b/configs/T4160QDS_SDCARD_defconfig
index f04c34dc5ea6..e9f0760bc1e9 100644
--- a/configs/T4160QDS_SDCARD_defconfig
+++ b/configs/T4160QDS_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160QDS=y
diff --git a/configs/T4160QDS_SECURE_BOOT_defconfig b/configs/T4160QDS_SECURE_BOOT_defconfig
index c71880e213b0..0042424539d0 100644
--- a/configs/T4160QDS_SECURE_BOOT_defconfig
+++ b/configs/T4160QDS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T4160QDS_defconfig b/configs/T4160QDS_defconfig
index 50970fc79588..d4668402ac1b 100644
--- a/configs/T4160QDS_defconfig
+++ b/configs/T4160QDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160QDS=y
 CONFIG_FIT=y
@@ -22,6 +24,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T4160RDB_defconfig b/configs/T4160RDB_defconfig
index 077961de62e1..986539ad8454 100644
--- a/configs/T4160RDB_defconfig
+++ b/configs/T4160RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4160RDB=y
 CONFIG_FIT=y
@@ -22,6 +24,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T4240QDS_NAND_defconfig b/configs/T4240QDS_NAND_defconfig
index 031cdc205e35..00b369cede44 100644
--- a/configs/T4240QDS_NAND_defconfig
+++ b/configs/T4240QDS_NAND_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
diff --git a/configs/T4240QDS_SDCARD_defconfig b/configs/T4240QDS_SDCARD_defconfig
index 579d4f42b6f4..b12e3e21f390 100644
--- a/configs/T4240QDS_SDCARD_defconfig
+++ b/configs/T4240QDS_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
diff --git a/configs/T4240QDS_SECURE_BOOT_defconfig b/configs/T4240QDS_SECURE_BOOT_defconfig
index 3f6ad233d3e6..046686bd7ec6 100644
--- a/configs/T4240QDS_SECURE_BOOT_defconfig
+++ b/configs/T4240QDS_SECURE_BOOT_defconfig
@@ -1,6 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/T4240QDS_SRIO_PCIE_BOOT_defconfig b/configs/T4240QDS_SRIO_PCIE_BOOT_defconfig
index 3eb07017d115..217378ec5043 100644
--- a/configs/T4240QDS_SRIO_PCIE_BOOT_defconfig
+++ b/configs/T4240QDS_SRIO_PCIE_BOOT_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF40000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
 CONFIG_FIT=y
@@ -23,6 +24,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_REMOTE=y
+CONFIG_ENV_ADDR=0xFFE20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/T4240QDS_defconfig b/configs/T4240QDS_defconfig
index c9f541c0ef63..bd24b4891dcb 100644
--- a/configs/T4240QDS_defconfig
+++ b/configs/T4240QDS_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240QDS=y
 CONFIG_FIT=y
@@ -22,6 +24,7 @@ CONFIG_MP=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/T4240RDB_SDCARD_defconfig b/configs/T4240RDB_SDCARD_defconfig
index df308d4fbcb5..b5d306171044 100644
--- a/configs/T4240RDB_SDCARD_defconfig
+++ b/configs/T4240RDB_SDCARD_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL=y
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240RDB=y
diff --git a/configs/T4240RDB_defconfig b/configs/T4240RDB_defconfig
index 9cf2c6afa6c6..0e926df4fad7 100644
--- a/configs/T4240RDB_defconfig
+++ b/configs/T4240RDB_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_T4240RDB=y
 CONFIG_MPC85XX_HAVE_RESET_VECTOR=y
@@ -25,6 +27,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="t4240rdb"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_FSL_ESDHC=y
diff --git a/configs/TQM834x_defconfig b/configs/TQM834x_defconfig
index f7d7d58af426..4a28327357d0 100644
--- a/configs/TQM834x_defconfig
+++ b/configs/TQM834x_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x80000000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66666000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -139,6 +141,8 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=TQM834x-0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=TQM834x-0:256k(u-boot),256k(env),1m(kernel),2m(initrd),-(user);"
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0x80060000
+CONFIG_ENV_ADDR_REDUND=0x80080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_MTD_DEVICE=y
diff --git a/configs/TWR-P1025_defconfig b/configs/TWR-P1025_defconfig
index 53f66c714d8c..686e52348af5 100644
--- a/configs/TWR-P1025_defconfig
+++ b/configs/TWR-P1025_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF40000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_P1_TWR=y
@@ -30,6 +32,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nor0=ec000000.nor"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ec000000.nor:256k(vsc7385-firmware),256k(dtb),5632k(kernel),57856k(fs),256k(qe-ucode-firmware),1280k(u-boot)"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEFF20000
 CONFIG_SATA_SIL3114=y
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/UCP1020_defconfig b/configs/UCP1020_defconfig
index 128f10fa5d05..71a0b2cf4bc4 100644
--- a/configs/UCP1020_defconfig
+++ b/configs/UCP1020_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xEFF80000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_UCP1020=y
 CONFIG_FIT=y
@@ -32,6 +34,7 @@ CONFIG_CMD_CRAMFS=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xEC0C0000
 # CONFIG_SATA_SIL is not set
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/adp-ae3xx_defconfig b/configs/adp-ae3xx_defconfig
index 1d6efb3bcc69..2ea0609e9a9d 100644
--- a/configs/adp-ae3xx_defconfig
+++ b/configs/adp-ae3xx_defconfig
@@ -1,6 +1,9 @@
 CONFIG_NDS32=y
 CONFIG_SYS_TEXT_BASE=0x4A000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_TARGET_ADP_AE3XX=y
 CONFIG_FIT=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/adp-ag101p_defconfig b/configs/adp-ag101p_defconfig
index c91f13d0eea3..9dd960c8e316 100644
--- a/configs/adp-ag101p_defconfig
+++ b/configs/adp-ag101p_defconfig
@@ -1,6 +1,8 @@
 CONFIG_NDS32=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_ADP_AG101P=y
 CONFIG_FIT=y
 CONFIG_BOOTDELAY=3
@@ -18,6 +20,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ag101p"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x80140000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_MMC=y
diff --git a/configs/ae350_rv32_defconfig b/configs/ae350_rv32_defconfig
index 02769ab32def..fdf3bdb958ec 100644
--- a/configs/ae350_rv32_defconfig
+++ b/configs/ae350_rv32_defconfig
@@ -1,6 +1,7 @@
 CONFIG_RISCV=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_TARGET_AX25_AE350=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/ae350_rv32_xip_defconfig b/configs/ae350_rv32_xip_defconfig
index 385d86ac0900..8ca2b8017c36 100644
--- a/configs/ae350_rv32_xip_defconfig
+++ b/configs/ae350_rv32_xip_defconfig
@@ -1,6 +1,7 @@
 CONFIG_RISCV=y
 CONFIG_SYS_TEXT_BASE=0x80000000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_TARGET_AX25_AE350=y
 CONFIG_XIP=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ae350_rv64_defconfig b/configs/ae350_rv64_defconfig
index e21b24793e6e..dcce3d20c7d1 100644
--- a/configs/ae350_rv64_defconfig
+++ b/configs/ae350_rv64_defconfig
@@ -1,6 +1,7 @@
 CONFIG_RISCV=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_TARGET_AX25_AE350=y
 CONFIG_ARCH_RV64I=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ae350_rv64_xip_defconfig b/configs/ae350_rv64_xip_defconfig
index 1439a218a0bc..4544828b6283 100644
--- a/configs/ae350_rv64_xip_defconfig
+++ b/configs/ae350_rv64_xip_defconfig
@@ -1,6 +1,7 @@
 CONFIG_RISCV=y
 CONFIG_SYS_TEXT_BASE=0x80000000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_TARGET_AX25_AE350=y
 CONFIG_ARCH_RV64I=y
 CONFIG_XIP=y
diff --git a/configs/alt_defconfig b/configs/alt_defconfig
index a0535533fb0b..f5b68e5c001d 100644
--- a/configs/alt_defconfig
+++ b/configs/alt_defconfig
@@ -12,9 +12,12 @@ CONFIG_ARCH_RMOBILE_BOARD_STRING="Alt"
 CONFIG_R8A7794=y
 CONFIG_TARGET_ALT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0xe6300000
@@ -54,6 +57,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7794-alt-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xC0000
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/am335x_boneblack_vboot_defconfig b/configs/am335x_boneblack_vboot_defconfig
index 329e2a83106c..ce3b2ae68f56 100644
--- a/configs/am335x_boneblack_vboot_defconfig
+++ b/configs/am335x_boneblack_vboot_defconfig
@@ -32,6 +32,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-boneblack"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 # CONFIG_SPL_BLK is not set
diff --git a/configs/am335x_guardian_defconfig b/configs/am335x_guardian_defconfig
index ea6fd2d97703..f4f0a63fcebc 100644
--- a/configs/am335x_guardian_defconfig
+++ b/configs/am335x_guardian_defconfig
@@ -8,7 +8,7 @@ CONFIG_AM33XX=y
 CONFIG_TARGET_AM335X_GUARDIAN=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
-CONFIG_ENV_SIZE=0x040000
+CONFIG_ENV_SIZE=0x40000
 CONFIG_SPL=y
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/am335x_shc_defconfig b/configs/am335x_shc_defconfig
index 3bf3400376f0..5e8b2511fbf0 100644
--- a/configs/am335x_shc_defconfig
+++ b/configs/am335x_shc_defconfig
@@ -44,6 +44,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-shc"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x9000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM_MMC=y
diff --git a/configs/am335x_shc_ict_defconfig b/configs/am335x_shc_ict_defconfig
index 98bbf831a29a..38cceb173c7f 100644
--- a/configs/am335x_shc_ict_defconfig
+++ b/configs/am335x_shc_ict_defconfig
@@ -45,6 +45,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-shc"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x9000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM_MMC=y
diff --git a/configs/am335x_shc_netboot_defconfig b/configs/am335x_shc_netboot_defconfig
index b3f0086d5464..2c85f9567a73 100644
--- a/configs/am335x_shc_netboot_defconfig
+++ b/configs/am335x_shc_netboot_defconfig
@@ -46,6 +46,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-shc"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x9000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM_MMC=y
diff --git a/configs/am335x_shc_sdboot_defconfig b/configs/am335x_shc_sdboot_defconfig
index 4579bfd94210..52ad497604c3 100644
--- a/configs/am335x_shc_sdboot_defconfig
+++ b/configs/am335x_shc_sdboot_defconfig
@@ -45,6 +45,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-shc"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x9000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM_MMC=y
diff --git a/configs/am335x_sl50_defconfig b/configs/am335x_sl50_defconfig
index b7f1810783d5..71686b7a4fb0 100644
--- a/configs/am335x_sl50_defconfig
+++ b/configs/am335x_sl50_defconfig
@@ -43,6 +43,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-sl50"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x20000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_BOOTCOUNT_LIMIT=y
diff --git a/configs/am43xx_evm_qspiboot_defconfig b/configs/am43xx_evm_qspiboot_defconfig
index c901aced18d0..6934cb58d749 100644
--- a/configs/am43xx_evm_qspiboot_defconfig
+++ b/configs/am43xx_evm_qspiboot_defconfig
@@ -33,6 +33,7 @@ CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x120000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/am57xx_evm_defconfig b/configs/am57xx_evm_defconfig
index 784751227024..a8ae4952552b 100644
--- a/configs/am57xx_evm_defconfig
+++ b/configs/am57xx_evm_defconfig
@@ -41,6 +41,7 @@ CONFIG_DEFAULT_DEVICE_TREE="am572x-idk"
 CONFIG_OF_LIST="am57xx-beagle-x15 am57xx-beagle-x15-revb1 am57xx-beagle-x15-revc am572x-idk am571x-idk am574x-idk"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/am57xx_hs_evm_defconfig b/configs/am57xx_hs_evm_defconfig
index 11054f585f78..b3abbba0f92b 100644
--- a/configs/am57xx_hs_evm_defconfig
+++ b/configs/am57xx_hs_evm_defconfig
@@ -43,6 +43,7 @@ CONFIG_DEFAULT_DEVICE_TREE="am57xx-beagle-x15"
 CONFIG_OF_LIST="am57xx-beagle-x15 am57xx-beagle-x15-revb1 am57xx-beagle-x15-revc am572x-idk am571x-idk am574x-idk"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/am57xx_hs_evm_usb_defconfig b/configs/am57xx_hs_evm_usb_defconfig
index 150ad85f915a..260391b270eb 100644
--- a/configs/am57xx_hs_evm_usb_defconfig
+++ b/configs/am57xx_hs_evm_usb_defconfig
@@ -48,6 +48,7 @@ CONFIG_DEFAULT_DEVICE_TREE="am57xx-beagle-x15"
 CONFIG_OF_LIST="am57xx-beagle-x15 am57xx-beagle-x15-revb1 am57xx-beagle-x15-revc am572x-idk am571x-idk am574x-idk"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/am65x_evm_a53_defconfig b/configs/am65x_evm_a53_defconfig
index ead9fdc397e0..a5f8cf9aba39 100644
--- a/configs/am65x_evm_a53_defconfig
+++ b/configs/am65x_evm_a53_defconfig
@@ -8,6 +8,8 @@ CONFIG_TARGET_AM654_A53_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x680000
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
@@ -46,6 +48,7 @@ CONFIG_SPL_MULTI_DTB_FIT=y
 CONFIG_SPL_MULTI_DTB_FIT_NO_COMPRESSION=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x6A0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
diff --git a/configs/am65x_evm_r5_defconfig b/configs/am65x_evm_r5_defconfig
index 17cf18adf909..8ead2388831b 100644
--- a/configs/am65x_evm_r5_defconfig
+++ b/configs/am65x_evm_r5_defconfig
@@ -10,6 +10,7 @@ CONFIG_TARGET_AM654_R5_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/am65x_hs_evm_a53_defconfig b/configs/am65x_hs_evm_a53_defconfig
index 70e93eb41f0f..ca635dd95255 100644
--- a/configs/am65x_hs_evm_a53_defconfig
+++ b/configs/am65x_hs_evm_a53_defconfig
@@ -9,6 +9,7 @@ CONFIG_TARGET_AM654_A53_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/am65x_hs_evm_r5_defconfig b/configs/am65x_hs_evm_r5_defconfig
index 53d554a8bdad..aafbfb23bb41 100644
--- a/configs/am65x_hs_evm_r5_defconfig
+++ b/configs/am65x_hs_evm_r5_defconfig
@@ -10,6 +10,7 @@ CONFIG_TARGET_AM654_R5_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/amcore_defconfig b/configs/amcore_defconfig
index d68d5223c1c6..78e2d1da05d5 100644
--- a/configs/amcore_defconfig
+++ b/configs/amcore_defconfig
@@ -1,6 +1,8 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFFC00000
 CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_TARGET_AMCORE=y
 CONFIG_BOOTDELAY=1
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
@@ -19,6 +21,7 @@ CONFIG_CMD_TIMER=y
 CONFIG_CMD_DIAG=y
 CONFIG_DEFAULT_DEVICE_TREE="amcore"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFC1F000
 # CONFIG_NET is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/ap121_defconfig b/configs/ap121_defconfig
index cc6d46c56dc6..d65854179361 100644
--- a/configs/ap121_defconfig
+++ b/configs/ap121_defconfig
@@ -1,9 +1,12 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9F000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xb8020000
 CONFIG_DEBUG_UART_CLOCK=25000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_ARCH_ATH79=y
 CONFIG_DEBUG_UART=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/ap143_defconfig b/configs/ap143_defconfig
index 58352ebd5e41..5b6da7b85f2a 100644
--- a/configs/ap143_defconfig
+++ b/configs/ap143_defconfig
@@ -1,9 +1,12 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9F000000
 CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xb8020000
 CONFIG_DEBUG_UART_CLOCK=25000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_ARCH_ATH79=y
 CONFIG_TARGET_AP143=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/ap152_defconfig b/configs/ap152_defconfig
index 817ebcfcd88c..76181eb5bcc6 100644
--- a/configs/ap152_defconfig
+++ b/configs/ap152_defconfig
@@ -1,9 +1,12 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9F000000
 CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xb8020000
 CONFIG_DEBUG_UART_CLOCK=25000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_ARCH_ATH79=y
 CONFIG_TARGET_AP152=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/apalis-imx8qm_defconfig b/configs/apalis-imx8qm_defconfig
index eb7d40c79c06..85ef2df13ed1 100644
--- a/configs/apalis-imx8qm_defconfig
+++ b/configs/apalis-imx8qm_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARCH_IMX8=y
 CONFIG_SYS_TEXT_BASE=0x80020000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_APALIS_IMX8=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFDE00
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/apalis-tk1_defconfig b/configs/apalis-tk1_defconfig
index 3d982e00be11..d01c7e3e36c9 100644
--- a/configs/apalis-tk1_defconfig
+++ b/configs/apalis-tk1_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFDE00
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA124=y
 CONFIG_TARGET_APALIS_TK1=y
diff --git a/configs/apalis_imx6_defconfig b/configs/apalis_imx6_defconfig
index fb0100e9f236..92a249f317df 100644
--- a/configs/apalis_imx6_defconfig
+++ b/configs/apalis_imx6_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_APALIS_IMX6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFDE00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_CMD_HDMIDETECT=y
diff --git a/configs/apalis_t30_defconfig b/configs/apalis_t30_defconfig
index bb276ca93ef0..554e6194a484 100644
--- a/configs/apalis_t30_defconfig
+++ b/configs/apalis_t30_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFDE00
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA30=y
 CONFIG_TARGET_APALIS_T30=y
diff --git a/configs/apf27_defconfig b/configs/apf27_defconfig
index e1f92778e659..21ada4735618 100644
--- a/configs/apf27_defconfig
+++ b/configs/apf27_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARM=y
 CONFIG_TARGET_APF27=y
 CONFIG_SYS_TEXT_BASE=0xA0000800
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_IDENT_STRING=" apf27 patch 3.10"
@@ -40,6 +42,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=mxc_nand.0:1M(u-boot)ro,512K(env),512K(env2),5
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x180000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FPGA_XILINX=y
 CONFIG_FPGA_SPARTAN3=y
diff --git a/configs/apx4devkit_defconfig b/configs/apx4devkit_defconfig
index 3660b679e1a9..1843bc1f40fe 100644
--- a/configs/apx4devkit_defconfig
+++ b/configs/apx4devkit_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_APX4DEVKIT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x120000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
@@ -32,6 +34,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:128k(bootstrap),1024k(boot),768k(env
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x180000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
diff --git a/configs/aristainetos2_defconfig b/configs/aristainetos2_defconfig
index b5f46dbd6746..0c8958d57b2c 100644
--- a/configs/aristainetos2_defconfig
+++ b/configs/aristainetos2_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_ARISTAINETOS2=y
+CONFIG_ENV_SIZE=0x3000
+CONFIG_ENV_OFFSET=0xD0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/aristainetos/aristainetos2.cfg,MX6DL"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xE0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/aristainetos2b_defconfig b/configs/aristainetos2b_defconfig
index 283b5408eece..c387009465b4 100644
--- a/configs/aristainetos2b_defconfig
+++ b/configs/aristainetos2b_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_ARISTAINETOS2B=y
+CONFIG_ENV_SIZE=0x3000
+CONFIG_ENV_OFFSET=0xD0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/aristainetos/aristainetos2.cfg,MX6DL"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xE0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/aristainetos_defconfig b/configs/aristainetos_defconfig
index ae5b1de1220c..a2baee764b2d 100644
--- a/configs/aristainetos_defconfig
+++ b/configs/aristainetos_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_ARISTAINETOS=y
+CONFIG_ENV_SIZE=0x3000
+CONFIG_ENV_OFFSET=0xD0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/aristainetos/aristainetos.cfg,MX6DL"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xE0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/armadillo-800eva_defconfig b/configs/armadillo-800eva_defconfig
index 6eefabd8b684..c6fd9c033178 100644
--- a/configs/armadillo-800eva_defconfig
+++ b/configs/armadillo-800eva_defconfig
@@ -7,7 +7,9 @@ CONFIG_SYS_TEXT_BASE=0xE80C0000
 CONFIG_ARCH_RMOBILE_BOARD_STRING="Armadillo-800EVA Board"
 CONFIG_R8A7740=y
 CONFIG_TARGET_ARMADILLO_800EVA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_BOOTDELAY=3
 CONFIG_VERSION_VARIABLE=y
 # CONFIG_CMDLINE_EDITING is not set
@@ -33,6 +35,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_MISC is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x40000
 # CONFIG_MMC is not set
 CONFIG_SH_ETHER=y
 CONFIG_SCIF_CONSOLE=y
diff --git a/configs/arndale_defconfig b/configs/arndale_defconfig
index 3464a671059a..987b0fcd909e 100644
--- a/configs/arndale_defconfig
+++ b/configs/arndale_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
 CONFIG_ARCH_EXYNOS5=y
 CONFIG_TARGET_ARNDALE=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x86200
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_SPL=y
 CONFIG_IDENT_STRING=" for ARNDALE"
diff --git a/configs/aspenite_defconfig b/configs/aspenite_defconfig
index 835a7981e51a..43b0b88e0c13 100644
--- a/configs/aspenite_defconfig
+++ b/configs/aspenite_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_ASPENITE=y
 CONFIG_SYS_TEXT_BASE=0x600000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nMarvell-Aspenite DB"
 CONFIG_BOOTDELAY=3
diff --git a/configs/astro_mcf5373l_defconfig b/configs/astro_mcf5373l_defconfig
index 126b50c9b68e..da7332e0a12e 100644
--- a/configs/astro_mcf5373l_defconfig
+++ b/configs/astro_mcf5373l_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x00000000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x8000
 CONFIG_TARGET_ASTRO_MCF5373L=y
 CONFIG_BOOTDELAY=1
 CONFIG_USE_BOOTARGS=y
@@ -17,6 +19,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_JFFS2=y
 CONFIG_DEFAULT_DEVICE_TREE="astro_mcf5373l"
+CONFIG_ENV_ADDR=0x1FF8000
 # CONFIG_NET is not set
 CONFIG_FPGA_ALTERA=y
 CONFIG_FPGA_CYCLON2=y
diff --git a/configs/at91rm9200ek_defconfig b/configs/at91rm9200ek_defconfig
index 834457cb99fc..19c85aa4eb47 100644
--- a/configs/at91rm9200ek_defconfig
+++ b/configs/at91rm9200ek_defconfig
@@ -4,7 +4,6 @@ CONFIG_ARCH_AT91=y
 CONFIG_SYS_TEXT_BASE=0x10000000
 CONFIG_TARGET_AT91RM9200EK=y
 CONFIG_ENV_SIZE=0x10000
-CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_BOOTDELAY=3
@@ -22,6 +21,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x10040000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/at91rm9200ek_ram_defconfig b/configs/at91rm9200ek_ram_defconfig
index 93171912bc3b..e8eb3d30fee5 100644
--- a/configs/at91rm9200ek_ram_defconfig
+++ b/configs/at91rm9200ek_ram_defconfig
@@ -4,7 +4,6 @@ CONFIG_ARCH_AT91=y
 CONFIG_SYS_TEXT_BASE=0x20100000
 CONFIG_TARGET_AT91RM9200EK=y
 CONFIG_ENV_SIZE=0x10000
-CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_EXTRA_OPTIONS="RAMBOOT"
@@ -23,6 +22,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x10040000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/at91sam9260ek_nandflash_defconfig b/configs/at91sam9260ek_nandflash_defconfig
index 5dd719e20a6b..f5c021f13650 100644
--- a/configs/at91sam9260ek_nandflash_defconfig
+++ b/configs/at91sam9260ek_nandflash_defconfig
@@ -30,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9260ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9261ek_nandflash_defconfig b/configs/at91sam9261ek_nandflash_defconfig
index 9af60ce5a194..089120431ec4 100644
--- a/configs/at91sam9261ek_nandflash_defconfig
+++ b/configs/at91sam9261ek_nandflash_defconfig
@@ -30,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9261ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9263ek_nandflash_defconfig b/configs/at91sam9263ek_nandflash_defconfig
index 550d9427f21d..a825e4abef89 100644
--- a/configs/at91sam9263ek_nandflash_defconfig
+++ b/configs/at91sam9263ek_nandflash_defconfig
@@ -34,6 +34,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9263ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9263ek_norflash_boot_defconfig b/configs/at91sam9263ek_norflash_boot_defconfig
index 5253e63f6452..4bd24782cdf8 100644
--- a/configs/at91sam9263ek_norflash_boot_defconfig
+++ b/configs/at91sam9263ek_norflash_boot_defconfig
@@ -5,7 +5,6 @@ CONFIG_SYS_TEXT_BASE=0x0000000
 CONFIG_TARGET_AT91SAM9263EK=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_ENV_SIZE=0x10000
-CONFIG_ENV_OFFSET=0x7e0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xffffee00
@@ -35,6 +34,8 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9263ek"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0x107E0000
+CONFIG_ENV_ADDR_REDUND=0x107D0000
 CONFIG_DM=y
 CONFIG_CLK=y
 CONFIG_CLK_AT91=y
diff --git a/configs/at91sam9263ek_norflash_defconfig b/configs/at91sam9263ek_norflash_defconfig
index a008368f6673..5d292c0bb57e 100644
--- a/configs/at91sam9263ek_norflash_defconfig
+++ b/configs/at91sam9263ek_norflash_defconfig
@@ -5,7 +5,6 @@ CONFIG_SYS_TEXT_BASE=0x21F00000
 CONFIG_TARGET_AT91SAM9263EK=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_ENV_SIZE=0x10000
-CONFIG_ENV_OFFSET=0x7e0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0xffffee00
@@ -35,6 +34,8 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9263ek"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0x107E0000
+CONFIG_ENV_ADDR_REDUND=0x107D0000
 CONFIG_DM=y
 CONFIG_CLK=y
 CONFIG_CLK_AT91=y
diff --git a/configs/at91sam9g10ek_nandflash_defconfig b/configs/at91sam9g10ek_nandflash_defconfig
index 23abe50585eb..69fca8375753 100644
--- a/configs/at91sam9g10ek_nandflash_defconfig
+++ b/configs/at91sam9g10ek_nandflash_defconfig
@@ -30,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9261ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9g20ek_2mmc_nandflash_defconfig b/configs/at91sam9g20ek_2mmc_nandflash_defconfig
index 020bb51e28c0..acf6d6cbb12f 100644
--- a/configs/at91sam9g20ek_2mmc_nandflash_defconfig
+++ b/configs/at91sam9g20ek_2mmc_nandflash_defconfig
@@ -31,6 +31,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9g20ek_2mmc"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9g20ek_nandflash_defconfig b/configs/at91sam9g20ek_nandflash_defconfig
index 91b3a6cd557c..e3dbdb391267 100644
--- a/configs/at91sam9g20ek_nandflash_defconfig
+++ b/configs/at91sam9g20ek_nandflash_defconfig
@@ -30,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9g20ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9m10g45ek_nandflash_defconfig b/configs/at91sam9m10g45ek_nandflash_defconfig
index 66327d012ad3..c6ec113b0dc2 100644
--- a/configs/at91sam9m10g45ek_nandflash_defconfig
+++ b/configs/at91sam9m10g45ek_nandflash_defconfig
@@ -33,6 +33,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9m10g45ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9n12ek_nandflash_defconfig b/configs/at91sam9n12ek_nandflash_defconfig
index 6671f1881446..f48ca112f678 100644
--- a/configs/at91sam9n12ek_nandflash_defconfig
+++ b/configs/at91sam9n12ek_nandflash_defconfig
@@ -32,6 +32,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9n12ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9rlek_nandflash_defconfig b/configs/at91sam9rlek_nandflash_defconfig
index dc80c84f10d8..800e9bb286f1 100644
--- a/configs/at91sam9rlek_nandflash_defconfig
+++ b/configs/at91sam9rlek_nandflash_defconfig
@@ -31,6 +31,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9rlek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 # CONFIG_NET is not set
 CONFIG_DM=y
diff --git a/configs/at91sam9x5ek_nandflash_defconfig b/configs/at91sam9x5ek_nandflash_defconfig
index fba256c91517..325e5c8d2adc 100644
--- a/configs/at91sam9x5ek_nandflash_defconfig
+++ b/configs/at91sam9x5ek_nandflash_defconfig
@@ -34,6 +34,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9g35ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/at91sam9xeek_nandflash_defconfig b/configs/at91sam9xeek_nandflash_defconfig
index 2d11ba01b601..97aa2ec3505a 100644
--- a/configs/at91sam9xeek_nandflash_defconfig
+++ b/configs/at91sam9xeek_nandflash_defconfig
@@ -30,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9260ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/axm_defconfig b/configs/axm_defconfig
index 1c5bf39f2804..98d0e200bc32 100644
--- a/configs/axm_defconfig
+++ b/configs/axm_defconfig
@@ -51,6 +51,7 @@ CONFIG_DEFAULT_DEVICE_TREE="at91sam9g20-taurus"
 CONFIG_SPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x180000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SPL_DM=y
 CONFIG_BLK=y
diff --git a/configs/bayleybay_defconfig b/configs/bayleybay_defconfig
index 9328637dadc5..f2cce97ef849 100644
--- a/configs/bayleybay_defconfig
+++ b/configs/bayleybay_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x6FF000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_INTEL=y
 CONFIG_TARGET_BAYLEYBAY=y
 CONFIG_INTERNAL_UART=y
diff --git a/configs/bcm11130_defconfig b/configs/bcm11130_defconfig
index 06009c6887d6..d843ad093020 100644
--- a/configs/bcm11130_defconfig
+++ b/configs/bcm11130_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCM28155_AP=y
 CONFIG_SYS_TEXT_BASE=0xae000000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x2340000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="SYS_MMC_ENV_DEV=0"
 CONFIG_MISC_INIT_R=y
diff --git a/configs/bcm11130_nand_defconfig b/configs/bcm11130_nand_defconfig
index 556538728f3e..cde16eae0a53 100644
--- a/configs/bcm11130_nand_defconfig
+++ b/configs/bcm11130_nand_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCM28155_AP=y
 CONFIG_SYS_TEXT_BASE=0xae000000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x2340000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_MISC_INIT_R=y
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm23550_w1d_defconfig b/configs/bcm23550_w1d_defconfig
index aa90227583c0..2b03964f7dcb 100644
--- a/configs/bcm23550_w1d_defconfig
+++ b/configs/bcm23550_w1d_defconfig
@@ -4,6 +4,8 @@ CONFIG_SYS_DCACHE_OFF=y
 CONFIG_ENABLE_ARM_SOC_BOOT0_HOOK=y
 CONFIG_TARGET_BCM23550_W1D=y
 CONFIG_SYS_TEXT_BASE=0x9f000000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x2340000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_ANDROID_BOOT_IMAGE is not set
 CONFIG_MISC_INIT_R=y
diff --git a/configs/bcm28155_ap_defconfig b/configs/bcm28155_ap_defconfig
index 4bd8d2a0863a..f8fcac747d98 100644
--- a/configs/bcm28155_ap_defconfig
+++ b/configs/bcm28155_ap_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ENABLE_ARM_SOC_BOOT0_HOOK=y
 CONFIG_TARGET_BCM28155_AP=y
 CONFIG_SYS_TEXT_BASE=0xae000000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x2340000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_ANDROID_BOOT_IMAGE is not set
 CONFIG_MISC_INIT_R=y
diff --git a/configs/bcm28155_w1d_defconfig b/configs/bcm28155_w1d_defconfig
index 06fc357b5141..a3a0f680d125 100644
--- a/configs/bcm28155_w1d_defconfig
+++ b/configs/bcm28155_w1d_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ENABLE_ARM_SOC_BOOT0_HOOK=y
 CONFIG_TARGET_BCM28155_AP=y
 CONFIG_SYS_TEXT_BASE=0xae000000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x2340000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_MISC_INIT_R=y
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm7260_defconfig b/configs/bcm7260_defconfig
index 5b194b93e898..47f0a7d488c1 100644
--- a/configs/bcm7260_defconfig
+++ b/configs/bcm7260_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_BCMSTB=y
 CONFIG_SYS_TEXT_BASE=0x10100000
 CONFIG_TARGET_BCM7260=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x814800
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
@@ -14,6 +16,7 @@ CONFIG_EFI_PARTITION=y
 CONFIG_OF_PRIOR_STAGE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x824800
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_SDHCI=y
diff --git a/configs/bcm7445_defconfig b/configs/bcm7445_defconfig
index 35eee69e15ae..2450d247caa6 100644
--- a/configs/bcm7445_defconfig
+++ b/configs/bcm7445_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_BCMSTB=y
 CONFIG_SYS_TEXT_BASE=0x80100000
 CONFIG_TARGET_BCM7445=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x1E0000
 CONFIG_NR_DRAM_BANKS=3
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
 CONFIG_BOOTDELAY=1
@@ -15,6 +18,7 @@ CONFIG_CMD_SPI=y
 CONFIG_OF_PRIOR_STAGE=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x1F0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM_MMC=y
 CONFIG_MMC_SDHCI=y
diff --git a/configs/bcm911360_entphn-ns_defconfig b/configs/bcm911360_entphn-ns_defconfig
index 340039a906d3..45707edb8579 100644
--- a/configs/bcm911360_entphn-ns_defconfig
+++ b/configs/bcm911360_entphn-ns_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCMCYGNUS=y
 CONFIG_SYS_TEXT_BASE=0x61000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="SYS_SDRAM_SIZE=0x20000000,ARMV7_NONSEC"
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm911360_entphn_defconfig b/configs/bcm911360_entphn_defconfig
index 5e4a960c09c9..2156d5640172 100644
--- a/configs/bcm911360_entphn_defconfig
+++ b/configs/bcm911360_entphn_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCMCYGNUS=y
 CONFIG_SYS_TEXT_BASE=0x61000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="SYS_SDRAM_SIZE=0x20000000"
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm911360k_defconfig b/configs/bcm911360k_defconfig
index 092e2c978ba9..02fa526a4330 100644
--- a/configs/bcm911360k_defconfig
+++ b/configs/bcm911360k_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCMCYGNUS=y
 CONFIG_SYS_TEXT_BASE=0x61000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="SYS_SDRAM_SIZE=0x40000000"
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm958300k-ns_defconfig b/configs/bcm958300k-ns_defconfig
index 866cf5340ab9..73c8966cce14 100644
--- a/configs/bcm958300k-ns_defconfig
+++ b/configs/bcm958300k-ns_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCMCYGNUS=y
 CONFIG_SYS_TEXT_BASE=0x61000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="SYS_SDRAM_SIZE=0x40000000,ARMV7_NONSEC"
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm958300k_defconfig b/configs/bcm958300k_defconfig
index 092e2c978ba9..02fa526a4330 100644
--- a/configs/bcm958300k_defconfig
+++ b/configs/bcm958300k_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCMCYGNUS=y
 CONFIG_SYS_TEXT_BASE=0x61000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="SYS_SDRAM_SIZE=0x40000000"
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm958305k_defconfig b/configs/bcm958305k_defconfig
index 092e2c978ba9..02fa526a4330 100644
--- a/configs/bcm958305k_defconfig
+++ b/configs/bcm958305k_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCMCYGNUS=y
 CONFIG_SYS_TEXT_BASE=0x61000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="SYS_SDRAM_SIZE=0x40000000"
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm958622hr_defconfig b/configs/bcm958622hr_defconfig
index 7bf9cd4abd1b..f7861ebbec62 100644
--- a/configs/bcm958622hr_defconfig
+++ b/configs/bcm958622hr_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCMNSP=y
 CONFIG_SYS_TEXT_BASE=0x61000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="SYS_SDRAM_SIZE=0x01000000"
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/bcm958712k_defconfig b/configs/bcm958712k_defconfig
index 3b584fc13613..2425c3149aa6 100644
--- a/configs/bcm958712k_defconfig
+++ b/configs/bcm958712k_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_BCMNS2=y
 CONFIG_SYS_TEXT_BASE=0x85000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING=" Broadcom Northstar 2"
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/bcm963158_ram_defconfig b/configs/bcm963158_ram_defconfig
index c02521445eca..81df312895c8 100644
--- a/configs/bcm963158_ram_defconfig
+++ b/configs/bcm963158_ram_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_BCM63158=y
 CONFIG_SYS_TEXT_BASE=0x10000000
 CONFIG_SYS_MALLOC_F_LEN=0x8000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_BCM963158=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/bcm968380gerg_ram_defconfig b/configs/bcm968380gerg_ram_defconfig
index 477b9b04a62c..b9689ce56d71 100644
--- a/configs/bcm968380gerg_ram_defconfig
+++ b/configs/bcm968380gerg_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6838=y
diff --git a/configs/bcm968580xref_ram_defconfig b/configs/bcm968580xref_ram_defconfig
index 76ee3f32432b..001e8d89abd5 100644
--- a/configs/bcm968580xref_ram_defconfig
+++ b/configs/bcm968580xref_ram_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_BCM6858=y
 CONFIG_SYS_TEXT_BASE=0x10000000
 CONFIG_SYS_MALLOC_F_LEN=0x8000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_BCM968580XREF=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/beaver_defconfig b/configs/beaver_defconfig
index 20c3b8270b41..5351b530e226 100644
--- a/configs/beaver_defconfig
+++ b/configs/beaver_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA30=y
 CONFIG_TARGET_BEAVER=y
diff --git a/configs/bg0900_defconfig b/configs/bg0900_defconfig
index 98fe71a21a1d..e8f3b5f26e75 100644
--- a/configs/bg0900_defconfig
+++ b/configs/bg0900_defconfig
@@ -6,6 +6,7 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_BG0900=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/bk4r1_defconfig b/configs/bk4r1_defconfig
index aea740d04d33..67efe61140dd 100644
--- a/configs/bk4r1_defconfig
+++ b/configs/bk4r1_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_VF610=y
 CONFIG_SYS_TEXT_BASE=0x3f401000
 CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x200000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0x4006e02c
@@ -33,6 +35,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="vf610-bk4r1"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x220000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_DM=y
diff --git a/configs/blanche_defconfig b/configs/blanche_defconfig
index 58ee355db4c0..65171de3ea82 100644
--- a/configs/blanche_defconfig
+++ b/configs/blanche_defconfig
@@ -7,7 +7,10 @@ CONFIG_SYS_MALLOC_F_LEN=0x8000
 CONFIG_ARCH_RMOBILE_BOARD_STRING="Blanche"
 CONFIG_R8A7792=y
 CONFIG_TARGET_BLANCHE=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_FIT=y
 CONFIG_BOOTDELAY=3
 CONFIG_VERSION_VARIABLE=y
@@ -36,6 +39,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7792-blanche-u-boot"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x40000
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/boston32r2_defconfig b/configs/boston32r2_defconfig
index 3d8d97252c43..3904d0f0f924 100644
--- a/configs/boston32r2_defconfig
+++ b/configs/boston32r2_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9FC00000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_BOSTON=y
 # CONFIG_MIPS_BOOT_CMDLINE_LEGACY is not set
 # CONFIG_MIPS_BOOT_ENV_LEGACY is not set
@@ -25,6 +27,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="img,boston"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBFFE0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
 CONFIG_MTD=y
diff --git a/configs/boston32r2el_defconfig b/configs/boston32r2el_defconfig
index 6650211b48fc..8974e71e87fc 100644
--- a/configs/boston32r2el_defconfig
+++ b/configs/boston32r2el_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9FC00000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_BOSTON=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 # CONFIG_MIPS_BOOT_CMDLINE_LEGACY is not set
@@ -26,6 +28,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="img,boston"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBFFE0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
 CONFIG_MTD=y
diff --git a/configs/boston32r6_defconfig b/configs/boston32r6_defconfig
index b916460f058e..0724423f4fac 100644
--- a/configs/boston32r6_defconfig
+++ b/configs/boston32r6_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9FC00000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_BOSTON=y
 CONFIG_CPU_MIPS32_R6=y
 # CONFIG_MIPS_BOOT_CMDLINE_LEGACY is not set
@@ -26,6 +28,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="img,boston"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBFFE0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
 CONFIG_MTD=y
diff --git a/configs/boston32r6el_defconfig b/configs/boston32r6el_defconfig
index 6bf0027e698a..5d316d77c265 100644
--- a/configs/boston32r6el_defconfig
+++ b/configs/boston32r6el_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9FC00000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_BOSTON=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R6=y
@@ -27,6 +29,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="img,boston"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBFFE0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
 CONFIG_MTD=y
diff --git a/configs/boston64r2_defconfig b/configs/boston64r2_defconfig
index 250a70da9030..09aa97874d00 100644
--- a/configs/boston64r2_defconfig
+++ b/configs/boston64r2_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xFFFFFFFF9FC00000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_BOSTON=y
 CONFIG_CPU_MIPS64_R2=y
 # CONFIG_MIPS_BOOT_CMDLINE_LEGACY is not set
@@ -26,6 +28,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="img,boston"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFFFFFFBFFE0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
 CONFIG_MTD=y
diff --git a/configs/boston64r2el_defconfig b/configs/boston64r2el_defconfig
index 84c4e5372b91..d48083d923ec 100644
--- a/configs/boston64r2el_defconfig
+++ b/configs/boston64r2el_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xFFFFFFFF9FC00000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_BOSTON=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS64_R2=y
@@ -27,6 +29,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="img,boston"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFFFFFFBFFE0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
 CONFIG_MTD=y
diff --git a/configs/boston64r6_defconfig b/configs/boston64r6_defconfig
index 133a0a9115bd..140817f49131 100644
--- a/configs/boston64r6_defconfig
+++ b/configs/boston64r6_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xFFFFFFFF9FC00000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_BOSTON=y
 CONFIG_CPU_MIPS64_R6=y
 # CONFIG_MIPS_BOOT_CMDLINE_LEGACY is not set
@@ -26,6 +28,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="img,boston"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFFFFFFBFFE0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
 CONFIG_MTD=y
diff --git a/configs/boston64r6el_defconfig b/configs/boston64r6el_defconfig
index 8c97dca774e5..9c99a92ff204 100644
--- a/configs/boston64r6el_defconfig
+++ b/configs/boston64r6el_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xFFFFFFFF9FC00000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_BOSTON=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS64_R6=y
@@ -27,6 +29,7 @@ CONFIG_CMD_EXT4_WRITE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="img,boston"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFFFFFFBFFE0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
 CONFIG_MTD=y
diff --git a/configs/brppt1_mmc_defconfig b/configs/brppt1_mmc_defconfig
index 5fa59301d1e5..b1e65194b197 100644
--- a/configs/brppt1_mmc_defconfig
+++ b/configs/brppt1_mmc_defconfig
@@ -67,6 +67,7 @@ CONFIG_DEFAULT_DEVICE_TREE="am335x-brppt1-mmc"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clocks clock-names interrupt-parent interrupt-controller interrupt-cells dma-names dmas "
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x50000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
diff --git a/configs/brppt1_spi_defconfig b/configs/brppt1_spi_defconfig
index 36d0006a331c..495ecca857b3 100644
--- a/configs/brppt1_spi_defconfig
+++ b/configs/brppt1_spi_defconfig
@@ -73,6 +73,7 @@ CONFIG_DEFAULT_DEVICE_TREE="am335x-brppt1-spi"
 CONFIG_OF_SPL_REMOVE_PROPS="pinctrl-0 pinctrl-names clocks clock-names interrupt-parent interrupt-controller interrupt-cells dma-names dmas "
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x30000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
diff --git a/configs/brppt2_defconfig b/configs/brppt2_defconfig
index 70d7dd466f76..e67b7265923e 100644
--- a/configs/brppt2_defconfig
+++ b/configs/brppt2_defconfig
@@ -10,10 +10,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x1000
 CONFIG_TARGET_BRPPT2=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0x020CC068
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/brsmarc1_defconfig b/configs/brsmarc1_defconfig
index 466c7e95ce8a..2a29a112d0e3 100644
--- a/configs/brsmarc1_defconfig
+++ b/configs/brsmarc1_defconfig
@@ -72,6 +72,7 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-brsmarc1"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x30000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_NETCONSOLE=y
diff --git a/configs/brxre1_defconfig b/configs/brxre1_defconfig
index 9544240982ac..3ebcb3339397 100644
--- a/configs/brxre1_defconfig
+++ b/configs/brxre1_defconfig
@@ -66,6 +66,7 @@ CONFIG_DEFAULT_DEVICE_TREE="am335x-brxre1"
 CONFIG_OF_SPL_REMOVE_PROPS=""
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x50000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_NETCONSOLE=y
diff --git a/configs/bubblegum_96_defconfig b/configs/bubblegum_96_defconfig
index a5454a892c9a..a13464c7ae03 100644
--- a/configs/bubblegum_96_defconfig
+++ b/configs/bubblegum_96_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_OWL=y
 CONFIG_SYS_TEXT_BASE=0x11000000
 CONFIG_TARGET_BUBBLEGUM_96=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="\nBubblegum-96"
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/caddy2_defconfig b/configs/caddy2_defconfig
index 0760986f40a5..3c542c5d44ed 100644
--- a/configs/caddy2_defconfig
+++ b/configs/caddy2_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -107,6 +109,8 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFFFC0000
+CONFIG_ENV_ADDR_REDUND=0xFFFE0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/cardhu_defconfig b/configs/cardhu_defconfig
index 9161f93e1937..729440864466 100644
--- a/configs/cardhu_defconfig
+++ b/configs/cardhu_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA30=y
 CONFIG_TARGET_CARDHU=y
diff --git a/configs/cei-tk1-som_defconfig b/configs/cei-tk1-som_defconfig
index b98d3496bc30..7642b1985ab0 100644
--- a/configs/cei-tk1-som_defconfig
+++ b/configs/cei-tk1-som_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA124=y
 CONFIG_TARGET_CEI_TK1_SOM=y
diff --git a/configs/cgtqmx6eval_defconfig b/configs/cgtqmx6eval_defconfig
index 98e3c8bfeb37..f1eb3a4b2b58 100644
--- a/configs/cgtqmx6eval_defconfig
+++ b/configs/cgtqmx6eval_defconfig
@@ -7,8 +7,11 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_CGTQMX6EVAL=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/cherryhill_defconfig b/configs/cherryhill_defconfig
index 3ec5d3e01076..5c292e83f428 100644
--- a/configs/cherryhill_defconfig
+++ b/configs/cherryhill_defconfig
@@ -1,8 +1,11 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x5F0000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_VENDOR_INTEL=y
 CONFIG_TARGET_CHERRYHILL=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/chiliboard_defconfig b/configs/chiliboard_defconfig
index 9f592c94079f..56db948cab58 100644
--- a/configs/chiliboard_defconfig
+++ b/configs/chiliboard_defconfig
@@ -36,6 +36,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-chiliboard"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x22000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_DM_GPIO=y
diff --git a/configs/chromebook_bob_defconfig b/configs/chromebook_bob_defconfig
index ec51d711a5a2..bc0498987565 100644
--- a/configs/chromebook_bob_defconfig
+++ b/configs/chromebook_bob_defconfig
@@ -6,6 +6,7 @@ CONFIG_ROCKCHIP_RK3399=y
 CONFIG_ROCKCHIP_BOOT_MODE_REG=0
 CONFIG_ROCKCHIP_SPL_RESERVE_IRAM=0x4000
 # CONFIG_SPL_MMC_SUPPORT is not set
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_TARGET_CHROMEBOOK_BOB=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff1a0000
diff --git a/configs/chromebook_link64_defconfig b/configs/chromebook_link64_defconfig
index 89fffa587b07..b5c7c541c953 100644
--- a/configs/chromebook_link64_defconfig
+++ b/configs/chromebook_link64_defconfig
@@ -1,9 +1,12 @@
 CONFIG_X86=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_X86_RUN_64BIT=y
 CONFIG_VENDOR_GOOGLE=y
 CONFIG_TARGET_CHROMEBOOK_LINK64=y
diff --git a/configs/chromebook_link_defconfig b/configs/chromebook_link_defconfig
index cdf51794e6b0..7273fcb3c5ef 100644
--- a/configs/chromebook_link_defconfig
+++ b/configs/chromebook_link_defconfig
@@ -1,10 +1,13 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
 CONFIG_SYS_MALLOC_F_LEN=0x2400
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_GOOGLE=y
 CONFIG_TARGET_CHROMEBOOK_LINK=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/chromebook_samus_defconfig b/configs/chromebook_samus_defconfig
index 68cbd5d4ef95..8227fee72c56 100644
--- a/configs/chromebook_samus_defconfig
+++ b/configs/chromebook_samus_defconfig
@@ -1,10 +1,13 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
 CONFIG_SYS_MALLOC_F_LEN=0x1d00
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_GOOGLE=y
 CONFIG_TARGET_CHROMEBOOK_SAMUS=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/chromebook_samus_tpl_defconfig b/configs/chromebook_samus_tpl_defconfig
index a3bd44c830d7..df1eed898627 100644
--- a/configs/chromebook_samus_tpl_defconfig
+++ b/configs/chromebook_samus_tpl_defconfig
@@ -1,10 +1,13 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xffed0000
 CONFIG_SYS_MALLOC_F_LEN=0x1a00
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_GOOGLE=y
 CONFIG_TARGET_CHROMEBOOK_SAMUS_TPL=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/chromebox_panther_defconfig b/configs/chromebox_panther_defconfig
index d7f5f0dbb2c7..c7bb3b4488d8 100644
--- a/configs/chromebox_panther_defconfig
+++ b/configs/chromebox_panther_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_GOOGLE=y
 CONFIG_TARGET_CHROMEBOX_PANTHER=y
 CONFIG_HAVE_MRC=y
diff --git a/configs/ci20_mmc_defconfig b/configs/ci20_mmc_defconfig
index fadebee80823..3b3ec10995e1 100644
--- a/configs/ci20_mmc_defconfig
+++ b/configs/ci20_mmc_defconfig
@@ -4,6 +4,8 @@ CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_OFFSET=0x83800
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_ARCH_JZ47XX=y
diff --git a/configs/cl-som-imx7_defconfig b/configs/cl-som-imx7_defconfig
index 1062ba5b5990..497d6f9bdb5e 100644
--- a/configs/cl-som-imx7_defconfig
+++ b/configs/cl-som-imx7_defconfig
@@ -7,8 +7,11 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_CL_SOM_IMX7=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
diff --git a/configs/clearfog_defconfig b/configs/clearfog_defconfig
index 9f75e391f219..c5fbe3186632 100644
--- a/configs/clearfog_defconfig
+++ b/configs/clearfog_defconfig
@@ -11,6 +11,8 @@ CONFIG_TARGET_CLEARFOG=y
 CONFIG_MVEBU_SPL_BOOT_DEVICE_MMC=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xF0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
diff --git a/configs/clearfog_gt_8k_defconfig b/configs/clearfog_gt_8k_defconfig
index 8e654e4cb2b3..0c842c800741 100644
--- a/configs/clearfog_gt_8k_defconfig
+++ b/configs/clearfog_gt_8k_defconfig
@@ -4,9 +4,12 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_MVEBU_ARMADA_8K=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DEBUG_UART_BASE=0xf0512000
 CONFIG_DEBUG_UART_CLOCK=200000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_DEBUG_UART=y
 CONFIG_AHCI=y
diff --git a/configs/cm_fx6_defconfig b/configs/cm_fx6_defconfig
index 3f14c67ea3ff..218d3d6d0976 100644
--- a/configs/cm_fx6_defconfig
+++ b/configs/cm_fx6_defconfig
@@ -7,8 +7,11 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_CM_FX6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/cm_t43_defconfig b/configs/cm_t43_defconfig
index 597f30d9742b..478c17e0e725 100644
--- a/configs/cm_t43_defconfig
+++ b/configs/cm_t43_defconfig
@@ -8,7 +8,7 @@ CONFIG_TARGET_CM_T43=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_ENV_SIZE=0x4000
-CONFIG_ENV_OFFSET=0xc0000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL=y
 CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/cm_t54_defconfig b/configs/cm_t54_defconfig
index f857c04b0270..11b34d9046a2 100644
--- a/configs/cm_t54_defconfig
+++ b/configs/cm_t54_defconfig
@@ -4,7 +4,7 @@ CONFIG_OMAP54XX=y
 CONFIG_TARGET_CM_T54=y
 CONFIG_OMAP_PLATFORM_RESET_TIME_MAX_USEC=16296
 CONFIG_ENV_SIZE=0x4000
-CONFIG_ENV_OFFSET=0xc0000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x40300000
 CONFIG_DISTRO_DEFAULTS=y
@@ -33,6 +33,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xC4000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/cobra5272_defconfig b/configs/cobra5272_defconfig
index e43f373d2d20..3bc76ac69cfc 100644
--- a/configs/cobra5272_defconfig
+++ b/configs/cobra5272_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TARGET_COBRA5272=y
 CONFIG_BOOTDELAY=5
 # CONFIG_DISPLAY_BOARDINFO is not set
@@ -12,6 +14,7 @@ CONFIG_CMD_IMLS=y
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_CMD_PING=y
 CONFIG_DEFAULT_DEVICE_TREE="cobra5272"
+CONFIG_ENV_ADDR=0xFFE04000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_MII=y
diff --git a/configs/colibri-imx6ull_defconfig b/configs/colibri-imx6ull_defconfig
index bc25a3d71961..044a642b8c14 100644
--- a/configs/colibri-imx6ull_defconfig
+++ b/configs/colibri-imx6ull_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_COLIBRI_IMX6ULL=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x380000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/colibri-imx8qxp_defconfig b/configs/colibri-imx8qxp_defconfig
index 575f07f80cb6..5eb8a1856670 100644
--- a/configs/colibri-imx8qxp_defconfig
+++ b/configs/colibri-imx8qxp_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARCH_IMX8=y
 CONFIG_SYS_TEXT_BASE=0x80020000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_COLIBRI_IMX8X=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFDE00
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/colibri_imx6_defconfig b/configs/colibri_imx6_defconfig
index 2931b86beb37..534873b28ab7 100644
--- a/configs/colibri_imx6_defconfig
+++ b/configs/colibri_imx6_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_COLIBRI_IMX6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFDE00
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_CMD_HDMIDETECT=y
diff --git a/configs/colibri_imx7_defconfig b/configs/colibri_imx7_defconfig
index c3a381cdf4dc..ae0f1953b6a9 100644
--- a/configs/colibri_imx7_defconfig
+++ b/configs/colibri_imx7_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_MX7=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_COLIBRI_IMX7=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x380000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IMX_RDC=y
 CONFIG_IMX_BOOTAUX=y
diff --git a/configs/colibri_imx7_emmc_defconfig b/configs/colibri_imx7_emmc_defconfig
index ba5e23aa3960..6ba2647c424c 100644
--- a/configs/colibri_imx7_emmc_defconfig
+++ b/configs/colibri_imx7_emmc_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_MX7=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_COLIBRI_IMX7=y
 CONFIG_TARGET_COLIBRI_IMX7_EMMC=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFDE00
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_IMX_RDC=y
 CONFIG_IMX_BOOTAUX=y
diff --git a/configs/colibri_pxa270_defconfig b/configs/colibri_pxa270_defconfig
index ab2d1851c66f..8ddad7e9571a 100644
--- a/configs/colibri_pxa270_defconfig
+++ b/configs/colibri_pxa270_defconfig
@@ -4,7 +4,9 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_COLIBRI_PXA270=y
 CONFIG_SYS_TEXT_BASE=0x0
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=tty0 console=ttyS0,115200"
@@ -27,6 +29,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x80000
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/colibri_t20_defconfig b/configs/colibri_t20_defconfig
index abebf15a3ec2..0d18de020ef8 100644
--- a/configs/colibri_t20_defconfig
+++ b/configs/colibri_t20_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x200000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA20=y
 CONFIG_TARGET_COLIBRI_T20=y
diff --git a/configs/colibri_t30_defconfig b/configs/colibri_t30_defconfig
index 628ed2570ff8..009cf6c23ed5 100644
--- a/configs/colibri_t30_defconfig
+++ b/configs/colibri_t30_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFDE00
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA30=y
 CONFIG_TARGET_COLIBRI_T30=y
diff --git a/configs/colibri_vf_defconfig b/configs/colibri_vf_defconfig
index 53d5a8fbef9e..dfebd4291d38 100644
--- a/configs/colibri_vf_defconfig
+++ b/configs/colibri_vf_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_VF610=y
 CONFIG_SYS_TEXT_BASE=0x3f401000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_COLIBRI_VF=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/comtrend_ar5315u_ram_defconfig b/configs/comtrend_ar5315u_ram_defconfig
index 90ff4c8c2e5e..578b21b1b88a 100644
--- a/configs/comtrend_ar5315u_ram_defconfig
+++ b/configs/comtrend_ar5315u_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6318=y
diff --git a/configs/comtrend_ar5387un_ram_defconfig b/configs/comtrend_ar5387un_ram_defconfig
index 73bec553d356..bfefb7c87850 100644
--- a/configs/comtrend_ar5387un_ram_defconfig
+++ b/configs/comtrend_ar5387un_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6328=y
diff --git a/configs/comtrend_ct5361_ram_defconfig b/configs/comtrend_ct5361_ram_defconfig
index fae85de4933d..46b4f0dd8594 100644
--- a/configs/comtrend_ct5361_ram_defconfig
+++ b/configs/comtrend_ct5361_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6348=y
diff --git a/configs/comtrend_vr3032u_ram_defconfig b/configs/comtrend_vr3032u_ram_defconfig
index 7273234c782b..bb84091fed48 100644
--- a/configs/comtrend_vr3032u_ram_defconfig
+++ b/configs/comtrend_vr3032u_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM63268=y
diff --git a/configs/comtrend_wap5813n_ram_defconfig b/configs/comtrend_wap5813n_ram_defconfig
index cc278f61e828..21edb3e016a7 100644
--- a/configs/comtrend_wap5813n_ram_defconfig
+++ b/configs/comtrend_wap5813n_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6368=y
diff --git a/configs/conga-qeval20-qa3-e3845-internal-uart_defconfig b/configs/conga-qeval20-qa3-e3845-internal-uart_defconfig
index 033129e0ca24..36a1fc33aa45 100644
--- a/configs/conga-qeval20-qa3-e3845-internal-uart_defconfig
+++ b/configs/conga-qeval20-qa3-e3845-internal-uart_defconfig
@@ -1,8 +1,11 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x6EF000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_CONGATEC=y
 CONFIG_TARGET_CONGA_QEVAL20_QA3_E3845=y
 CONFIG_INTERNAL_UART=y
diff --git a/configs/conga-qeval20-qa3-e3845_defconfig b/configs/conga-qeval20-qa3-e3845_defconfig
index 8597a3fd2271..4233e248eb9a 100644
--- a/configs/conga-qeval20-qa3-e3845_defconfig
+++ b/configs/conga-qeval20-qa3-e3845_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x6EF000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_CONGATEC=y
 CONFIG_TARGET_CONGA_QEVAL20_QA3_E3845=y
 CONFIG_SMP=y
diff --git a/configs/controlcenterd_36BIT_SDCARD_DEVELOP_defconfig b/configs/controlcenterd_36BIT_SDCARD_DEVELOP_defconfig
index e5473ff2c941..9c89ebd6979e 100644
--- a/configs/controlcenterd_36BIT_SDCARD_DEVELOP_defconfig
+++ b/configs/controlcenterd_36BIT_SDCARD_DEVELOP_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_IDENT_STRING=" controlcenterd 0.01"
 CONFIG_MPC85xx=y
 CONFIG_TARGET_CONTROLCENTERD=y
diff --git a/configs/controlcenterd_36BIT_SDCARD_defconfig b/configs/controlcenterd_36BIT_SDCARD_defconfig
index 475534e00a7e..d9a2a790c0f3 100644
--- a/configs/controlcenterd_36BIT_SDCARD_defconfig
+++ b/configs/controlcenterd_36BIT_SDCARD_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0x11000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_IDENT_STRING=" controlcenterd 0.01"
 CONFIG_MPC85xx=y
 CONFIG_TARGET_CONTROLCENTERD=y
diff --git a/configs/controlcenterd_TRAILBLAZER_DEVELOP_defconfig b/configs/controlcenterd_TRAILBLAZER_DEVELOP_defconfig
index d91b94a032ce..be213bf8c1bc 100644
--- a/configs/controlcenterd_TRAILBLAZER_DEVELOP_defconfig
+++ b/configs/controlcenterd_TRAILBLAZER_DEVELOP_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xf8fc0000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_IDENT_STRING=" controlcenterd trailblazer 0.01"
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/controlcenterd_TRAILBLAZER_defconfig b/configs/controlcenterd_TRAILBLAZER_defconfig
index 9093c73c10ee..65052ddc5db2 100644
--- a/configs/controlcenterd_TRAILBLAZER_defconfig
+++ b/configs/controlcenterd_TRAILBLAZER_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xf8fc0000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_IDENT_STRING=" controlcenterd trailblazer 0.01"
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
diff --git a/configs/controlcenterdc_defconfig b/configs/controlcenterdc_defconfig
index 1fbb577861a3..39fc57417e72 100644
--- a/configs/controlcenterdc_defconfig
+++ b/configs/controlcenterdc_defconfig
@@ -6,10 +6,13 @@ CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_CONTROLCENTERDC=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/coreboot_defconfig b/configs/coreboot_defconfig
index 7f979fb4b827..3d40a2c4aa91 100644
--- a/configs/coreboot_defconfig
+++ b/configs/coreboot_defconfig
@@ -1,5 +1,6 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0x1110000
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_PRE_CON_BUF_ADDR=0x100000
 CONFIG_VENDOR_COREBOOT=y
diff --git a/configs/corvus_defconfig b/configs/corvus_defconfig
index e7df353ab613..2608e19898ad 100644
--- a/configs/corvus_defconfig
+++ b/configs/corvus_defconfig
@@ -42,6 +42,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9g45-corvus"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x180000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BLK=y
 CONFIG_CLK=y
diff --git a/configs/cougarcanyon2_defconfig b/configs/cougarcanyon2_defconfig
index 1eeecc17d0c9..d6e062d809fe 100644
--- a/configs/cougarcanyon2_defconfig
+++ b/configs/cougarcanyon2_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFE00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x5FF000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_INTEL=y
 CONFIG_TARGET_COUGARCANYON2=y
 # CONFIG_HAVE_INTEL_ME is not set
diff --git a/configs/crownbay_defconfig b/configs/crownbay_defconfig
index e67622743ccd..32dd79bed065 100644
--- a/configs/crownbay_defconfig
+++ b/configs/crownbay_defconfig
@@ -1,7 +1,10 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
 CONFIG_MAX_CPUS=2
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_INTEL=y
 CONFIG_TARGET_CROWNBAY=y
 CONFIG_SMP=y
diff --git a/configs/crs305-1g-4s_defconfig b/configs/crs305-1g-4s_defconfig
index a04618177558..81f3d0accf44 100644
--- a/configs/crs305-1g-4s_defconfig
+++ b/configs/crs305-1g-4s_defconfig
@@ -4,6 +4,9 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00800000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_CRS305_1G_4S=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_BUILD_TARGET="u-boot.kwb"
 CONFIG_USE_PREBOOT=y
 CONFIG_SYS_CONSOLE_INFO_QUIET=y
diff --git a/configs/d2net_v2_defconfig b/configs/d2net_v2_defconfig
index b4cf22c4d756..3c090a495f36 100644
--- a/configs/d2net_v2_defconfig
+++ b/configs/d2net_v2_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NET2BIG_V2=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" D2 v2"
 CONFIG_SYS_EXTRA_OPTIONS="D2NET_V2"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-d2net"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=20000000
+CONFIG_ENV_ADDR=0x70000
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/da850evm_defconfig b/configs/da850evm_defconfig
index 7c69d3b02485..1a9bf5253206 100644
--- a/configs/da850evm_defconfig
+++ b/configs/da850evm_defconfig
@@ -8,8 +8,11 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x80000000
diff --git a/configs/da850evm_direct_nor_defconfig b/configs/da850evm_direct_nor_defconfig
index 26b12bfbb600..c8cdb2bd1736 100644
--- a/configs/da850evm_direct_nor_defconfig
+++ b/configs/da850evm_direct_nor_defconfig
@@ -6,7 +6,9 @@ CONFIG_TARGET_DA850EVM=y
 CONFIG_DA850_LOWLEVEL=y
 CONFIG_TI_COMMON_CMD_OPTIONS=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_ENV_SIZE=0x2800
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_EXTRA_OPTIONS="USE_NOR,DIRECT_NOR_BOOT"
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
@@ -38,6 +40,7 @@ CONFIG_CMD_DIAG=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="da850-evm"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60100000
 CONFIG_DM=y
 CONFIG_BLK=y
 CONFIG_DM_GPIO=y
diff --git a/configs/da850evm_nand_defconfig b/configs/da850evm_nand_defconfig
index 54594b9bebdc..ae67a895c79c 100644
--- a/configs/da850evm_nand_defconfig
+++ b/configs/da850evm_nand_defconfig
@@ -8,6 +8,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
diff --git a/configs/dalmore_defconfig b/configs/dalmore_defconfig
index 6952a06fecc0..7390c76b194e 100644
--- a/configs/dalmore_defconfig
+++ b/configs/dalmore_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA114=y
 CONFIG_TARGET_DALMORE=y
diff --git a/configs/db-88f6281-bp-nand_defconfig b/configs/db-88f6281-bp-nand_defconfig
index e0c7deb6d3ef..aa5f512ae0d7 100644
--- a/configs/db-88f6281-bp-nand_defconfig
+++ b/configs/db-88f6281-bp-nand_defconfig
@@ -5,7 +5,10 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_DB_88F6281_BP=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_IDENT_STRING="\nMarvell DB-88F6281-BP"
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_BOOTDELAY=3
diff --git a/configs/db-88f6281-bp-spi_defconfig b/configs/db-88f6281-bp-spi_defconfig
index 9ccf0a93d487..8fabea48f268 100644
--- a/configs/db-88f6281-bp-spi_defconfig
+++ b/configs/db-88f6281-bp-spi_defconfig
@@ -5,7 +5,10 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_DB_88F6281_BP=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_IDENT_STRING="\nMarvell DB-88F6281-BP"
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_FIT=y
diff --git a/configs/db-88f6720_defconfig b/configs/db-88f6720_defconfig
index 8945777defcb..4a77535a1e9a 100644
--- a/configs/db-88f6720_defconfig
+++ b/configs/db-88f6720_defconfig
@@ -7,10 +7,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_DB_88F6720=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xf1012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/db-88f6820-amc_defconfig b/configs/db-88f6820-amc_defconfig
index 29016b878ad5..acb46f802351 100644
--- a/configs/db-88f6820-amc_defconfig
+++ b/configs/db-88f6820-amc_defconfig
@@ -7,10 +7,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_DB_88F6820_AMC=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=200000000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/db-88f6820-gp_defconfig b/configs/db-88f6820-gp_defconfig
index 65580497b747..586a2c213d97 100644
--- a/configs/db-88f6820-gp_defconfig
+++ b/configs/db-88f6820-gp_defconfig
@@ -7,10 +7,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_DB_88F6820_GP=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/db-mv784mp-gp_defconfig b/configs/db-mv784mp-gp_defconfig
index f5e6244a9a87..ee2cc8ce0efc 100644
--- a/configs/db-mv784mp-gp_defconfig
+++ b/configs/db-mv784mp-gp_defconfig
@@ -7,10 +7,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_DB_MV784MP_GP=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/db-xc3-24g4xg_defconfig b/configs/db-xc3-24g4xg_defconfig
index 6da6ee04cd54..2c2cbd306ee9 100644
--- a/configs/db-xc3-24g4xg_defconfig
+++ b/configs/db-xc3-24g4xg_defconfig
@@ -4,6 +4,9 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00800000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_DB_XC3_24G4XG=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_BUILD_TARGET="u-boot.kwb"
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/devkit3250_defconfig b/configs/devkit3250_defconfig
index bca9d0efdee9..458bf37bd69b 100644
--- a/configs/devkit3250_defconfig
+++ b/configs/devkit3250_defconfig
@@ -7,6 +7,8 @@ CONFIG_SYS_TEXT_BASE=0x83F00000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xA0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00000000
diff --git a/configs/dfi-bt700-q7x-151_defconfig b/configs/dfi-bt700-q7x-151_defconfig
index e7db1af630bd..fce877faa9cb 100644
--- a/configs/dfi-bt700-q7x-151_defconfig
+++ b/configs/dfi-bt700-q7x-151_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x6EF000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_DFI=y
 CONFIG_SMP=y
 CONFIG_HAVE_VGA_BIOS=y
diff --git a/configs/dh_imx6_defconfig b/configs/dh_imx6_defconfig
index f72bbe4afb15..90be467c0ddf 100644
--- a/configs/dh_imx6_defconfig
+++ b/configs/dh_imx6_defconfig
@@ -8,9 +8,12 @@ CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_DHCOMIMX6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0x00900000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_AHCI=y
@@ -46,6 +49,7 @@ CONFIG_OF_LIST="imx6q-dhcom-pdk2 imx6dl-dhcom-pdk2"
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x110000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DWC_AHSATA=y
 CONFIG_BOOTCOUNT_LIMIT=y
diff --git a/configs/display5_defconfig b/configs/display5_defconfig
index 8fc864c6c138..af94dd503d70 100644
--- a/configs/display5_defconfig
+++ b/configs/display5_defconfig
@@ -9,11 +9,14 @@ CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_DISPLAY5=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x120000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x400
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0x020CC068
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
@@ -69,6 +72,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-display5"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x130000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/display5_factory_defconfig b/configs/display5_factory_defconfig
index 5324b2a2c700..65214bb5204e 100644
--- a/configs/display5_factory_defconfig
+++ b/configs/display5_factory_defconfig
@@ -9,9 +9,12 @@ CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_DISPLAY5=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x120000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x400
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
@@ -72,6 +75,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-display5"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x130000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_SF=y
diff --git a/configs/dms-ba16-1g_defconfig b/configs/dms-ba16-1g_defconfig
index d66db090efb2..8971ee755143 100644
--- a/configs/dms-ba16-1g_defconfig
+++ b/configs/dms-ba16-1g_defconfig
@@ -3,7 +3,10 @@ CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_ADVANTECH_DMS_BA16=y
 CONFIG_SYS_DDR_1G=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_BOOTDELAY=1
 # CONFIG_CONSOLE_MUX is not set
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/dms-ba16_defconfig b/configs/dms-ba16_defconfig
index dcfa8fade18e..b9c4a8c282b0 100644
--- a/configs/dms-ba16_defconfig
+++ b/configs/dms-ba16_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_ADVANTECH_DMS_BA16=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_BOOTDELAY=1
 # CONFIG_CONSOLE_MUX is not set
 CONFIG_SYS_CONSOLE_IS_IN_ENV=y
diff --git a/configs/dns325_defconfig b/configs/dns325_defconfig
index 6e95fb265e93..58993fd5ecb9 100644
--- a/configs/dns325_defconfig
+++ b/configs/dns325_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_DNS325=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nD-Link DNS-325"
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/dockstar_defconfig b/configs/dockstar_defconfig
index 18df663b7b63..5251264deba8 100644
--- a/configs/dockstar_defconfig
+++ b/configs/dockstar_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_DOCKSTAR=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nSeagate FreeAgent DockStar"
 CONFIG_BOOTDELAY=3
diff --git a/configs/dra7xx_evm_defconfig b/configs/dra7xx_evm_defconfig
index 759be2710212..713dcc1eab42 100644
--- a/configs/dra7xx_evm_defconfig
+++ b/configs/dra7xx_evm_defconfig
@@ -47,6 +47,7 @@ CONFIG_OF_SPL_REMOVE_PROPS="clocks clock-names interrupt-parent"
 # CONFIG_ENV_IS_IN_FAT is not set
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/dra7xx_hs_evm_defconfig b/configs/dra7xx_hs_evm_defconfig
index 07e66a590445..b0cdf41c27c5 100644
--- a/configs/dra7xx_hs_evm_defconfig
+++ b/configs/dra7xx_hs_evm_defconfig
@@ -50,6 +50,7 @@ CONFIG_OF_SPL_REMOVE_PROPS="clocks clock-names interrupt-parent"
 # CONFIG_ENV_IS_IN_FAT is not set
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/dra7xx_hs_evm_usb_defconfig b/configs/dra7xx_hs_evm_usb_defconfig
index 3154d61f75ff..6604953ea451 100644
--- a/configs/dra7xx_hs_evm_usb_defconfig
+++ b/configs/dra7xx_hs_evm_usb_defconfig
@@ -49,6 +49,7 @@ CONFIG_SPL_MULTI_DTB_FIT_UNCOMPRESS_SZ=0x9000
 CONFIG_OF_SPL_REMOVE_PROPS="clocks clock-names interrupt-parent"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/draco_defconfig b/configs/draco_defconfig
index 08ba45d66f0a..46d4f41e6062 100644
--- a/configs/draco_defconfig
+++ b/configs/draco_defconfig
@@ -60,6 +60,7 @@ CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-draco"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x2E0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
diff --git a/configs/dragonboard410c_defconfig b/configs/dragonboard410c_defconfig
index f6cedb47107f..d4a276ce1461 100644
--- a/configs/dragonboard410c_defconfig
+++ b/configs/dragonboard410c_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SNAPDRAGON=y
 CONFIG_SYS_TEXT_BASE=0x80080000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="\nQualcomm-DragonBoard 410C"
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/dragonboard820c_defconfig b/configs/dragonboard820c_defconfig
index 00c154cbdd9a..a6b0495e742e 100644
--- a/configs/dragonboard820c_defconfig
+++ b/configs/dragonboard820c_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SNAPDRAGON=y
 CONFIG_SYS_TEXT_BASE=0x80080000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_TARGET_DRAGONBOARD820C=y
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nQualcomm-DragonBoard 820C"
diff --git a/configs/dreamplug_defconfig b/configs/dreamplug_defconfig
index c421eacbe8ff..fa956f2df6f0 100644
--- a/configs/dreamplug_defconfig
+++ b/configs/dreamplug_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_DREAMPLUG=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="\nMarvell-DreamPlug"
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_BOOTDELAY=3
@@ -27,6 +30,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-dreamplug"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_ENV_ADDR=0x100000
 CONFIG_DM=y
 CONFIG_MVSATA_IDE=y
 CONFIG_BLK=y
diff --git a/configs/ds109_defconfig b/configs/ds109_defconfig
index 3e69aaa7c459..24179906f376 100644
--- a/configs/ds109_defconfig
+++ b/configs/ds109_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_DS109=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x3D0000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_USE_PREBOOT=y
 CONFIG_HUSH_PARSER=y
@@ -22,6 +25,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-ds109"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=50000000
+CONFIG_ENV_ADDR=0x3D0000
 CONFIG_DM=y
 CONFIG_MVSATA_IDE=y
 CONFIG_BLK=y
diff --git a/configs/ds414_defconfig b/configs/ds414_defconfig
index bc0446d36de9..45fe489397b9 100644
--- a/configs/ds414_defconfig
+++ b/configs/ds414_defconfig
@@ -7,10 +7,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_DS414=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x7E0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/durian_defconfig b/configs/durian_defconfig
index 71e0e5165901..6da300b2176c 100644
--- a/configs/durian_defconfig
+++ b/configs/durian_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARM_SMCCC=y
 CONFIG_TARGET_DURIAN=y
 CONFIG_SYS_TEXT_BASE=0x500000
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_PSCI_RESET is not set
 CONFIG_AHCI=y
diff --git a/configs/e2220-1170_defconfig b/configs/e2220-1170_defconfig
index c50598ace116..21edeed1569d 100644
--- a/configs/e2220-1170_defconfig
+++ b/configs/e2220-1170_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80080000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA210=y
 CONFIG_OF_SYSTEM_SETUP=y
diff --git a/configs/eb_cpu5282_defconfig b/configs/eb_cpu5282_defconfig
index daaf83a94e81..2d9caec5f2f8 100644
--- a/configs/eb_cpu5282_defconfig
+++ b/configs/eb_cpu5282_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xFF000000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_EB_CPU5282=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_MONITOR_BASE=0xFF000400"
 CONFIG_BOOTDELAY=5
@@ -16,6 +18,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_DATE=y
 CONFIG_DEFAULT_DEVICE_TREE="eb_cpu5282"
+CONFIG_ENV_ADDR=0xFF040000
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS0=y
 CONFIG_LED_STATUS_BIT=8
diff --git a/configs/eb_cpu5282_internal_defconfig b/configs/eb_cpu5282_internal_defconfig
index 7bd0d30fb606..411cbc935e29 100644
--- a/configs/eb_cpu5282_internal_defconfig
+++ b/configs/eb_cpu5282_internal_defconfig
@@ -1,5 +1,7 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_EB_CPU5282=y
 CONFIG_SYS_EXTRA_OPTIONS="SYS_MONITOR_BASE=0xF0000418"
 CONFIG_BOOTDELAY=5
@@ -15,6 +17,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_DATE=y
 CONFIG_DEFAULT_DEVICE_TREE="eb_cpu5282_internal"
+CONFIG_ENV_ADDR=0xFF040000
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS0=y
 CONFIG_LED_STATUS_BIT=8
diff --git a/configs/edb9315a_defconfig b/configs/edb9315a_defconfig
index 3c506fdcdb2e..04dfcd4ac53b 100644
--- a/configs/edb9315a_defconfig
+++ b/configs/edb9315a_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_EDB93XX=y
 CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_EXTRA_OPTIONS="MK_edb9315a"
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/nfs console=ttyAM0,115200 ip=dhcp"
@@ -25,6 +27,8 @@ CONFIG_CMD_JFFS2=y
 # CONFIG_DOS_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0x60040000
+CONFIG_ENV_ADDR_REDUND=0x60060000
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS0=y
 CONFIG_LED_STATUS_BIT=0
diff --git a/configs/edison_defconfig b/configs/edison_defconfig
index 510e640823c5..29bc96aa60ca 100644
--- a/configs/edison_defconfig
+++ b/configs/edison_defconfig
@@ -1,5 +1,7 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0x1101000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_VENDOR_INTEL=y
 CONFIG_TARGET_EDISON=y
@@ -29,6 +31,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="edison"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x600000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_CPU=y
 CONFIG_DFU_MMC=y
diff --git a/configs/edminiv2_defconfig b/configs/edminiv2_defconfig
index 9630d15cb470..84d8bd0a41b4 100644
--- a/configs/edminiv2_defconfig
+++ b/configs/edminiv2_defconfig
@@ -6,8 +6,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_EDMINIV2=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_IDENT_STRING=" EDMiniV2"
 CONFIG_SPL_TEXT_BASE=0xffff0000
 CONFIG_BOOTDELAY=3
@@ -26,6 +28,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_EXT2=y
 CONFIG_ISO_PARTITION=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFF84000
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/efi-x86_app_defconfig b/configs/efi-x86_app_defconfig
index cc1df1ff849c..790268a1ff9c 100644
--- a/configs/efi-x86_app_defconfig
+++ b/configs/efi-x86_app_defconfig
@@ -1,4 +1,5 @@
 CONFIG_X86=y
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BASE=0
 CONFIG_DEBUG_UART_CLOCK=0
diff --git a/configs/efi-x86_payload32_defconfig b/configs/efi-x86_payload32_defconfig
index e8a517b0340a..cd6f39b5dbdf 100644
--- a/configs/efi-x86_payload32_defconfig
+++ b/configs/efi-x86_payload32_defconfig
@@ -1,4 +1,5 @@
 CONFIG_X86=y
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_PRE_CON_BUF_ADDR=0x100000
 CONFIG_VENDOR_EFI=y
diff --git a/configs/efi-x86_payload64_defconfig b/configs/efi-x86_payload64_defconfig
index 2b2e5de9a870..b86c9210a510 100644
--- a/configs/efi-x86_payload64_defconfig
+++ b/configs/efi-x86_payload64_defconfig
@@ -1,4 +1,5 @@
 CONFIG_X86=y
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_PRE_CON_BUF_ADDR=0x100000
 CONFIG_VENDOR_EFI=y
diff --git a/configs/elgin-rv1108_defconfig b/configs/elgin-rv1108_defconfig
index e539d87c9206..628ab19421d8 100644
--- a/configs/elgin-rv1108_defconfig
+++ b/configs/elgin-rv1108_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x60000000
 CONFIG_ROCKCHIP_RV1108=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_TARGET_ELGIN_RV1108=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0x10210000
diff --git a/configs/espresso7420_defconfig b/configs/espresso7420_defconfig
index 1d2b023c1246..79d9e749f59b 100644
--- a/configs/espresso7420_defconfig
+++ b/configs/espresso7420_defconfig
@@ -4,6 +4,7 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
 CONFIG_ARCH_EXYNOS7=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_IDENT_STRING=" for ESPRESSO7420"
 CONFIG_SILENT_CONSOLE=y
diff --git a/configs/etamin_defconfig b/configs/etamin_defconfig
index cd218a1017fd..8a669e113af3 100644
--- a/configs/etamin_defconfig
+++ b/configs/etamin_defconfig
@@ -61,6 +61,7 @@ CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-draco"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xB80000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
index 06bf607eca46..b572f946c5fe 100644
--- a/configs/evb-ast2500_defconfig
+++ b/configs/evb-ast2500_defconfig
@@ -5,6 +5,7 @@ CONFIG_SYS_TEXT_BASE=0x0
 CONFIG_ASPEED_AST2500=y
 CONFIG_TARGET_EVB_AST2500=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_PRE_CON_BUF_ADDR=0x1e720000
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/evb-px5_defconfig b/configs/evb-px5_defconfig
index a8c708438cde..59125c0f812e 100644
--- a/configs/evb-px5_defconfig
+++ b/configs/evb-px5_defconfig
@@ -7,6 +7,7 @@ CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_TPL_LDSCRIPT="arch/arm/mach-rockchip/u-boot-tpl-v8.lds"
 CONFIG_TARGET_EVB_PX5=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x600000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
diff --git a/configs/evb-rk3128_defconfig b/configs/evb-rk3128_defconfig
index 21ecffc1607d..69167a5411ce 100644
--- a/configs/evb-rk3128_defconfig
+++ b/configs/evb-rk3128_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x60000000
 CONFIG_ROCKCHIP_RK3128=y
+CONFIG_ENV_OFFSET=0x0
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DEBUG_UART_BASE=0x20068000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/evb-rk3229_defconfig b/configs/evb-rk3229_defconfig
index 5291ebd0c6c6..82cdc40008be 100644
--- a/configs/evb-rk3229_defconfig
+++ b/configs/evb-rk3229_defconfig
@@ -5,6 +5,7 @@ CONFIG_ROCKCHIP_RK322X=y
 CONFIG_ROCKCHIP_SPL_RESERVE_IRAM=0x0
 CONFIG_TARGET_EVB_RK3229=y
 CONFIG_TPL_LDSCRIPT="arch/arm/mach-rockchip/u-boot-tpl.lds"
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x60600000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DEBUG_UART_BASE=0x11030000
diff --git a/configs/evb-rk3288_defconfig b/configs/evb-rk3288_defconfig
index a5a60bce27a6..0711d2f0db92 100644
--- a/configs/evb-rk3288_defconfig
+++ b/configs/evb-rk3288_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ROCKCHIP_RK3288=y
 CONFIG_TARGET_EVB_RK3288=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL_SIZE_LIMIT=0x4b000
diff --git a/configs/evb-rk3328_defconfig b/configs/evb-rk3328_defconfig
index d051637020a1..4a06d33789a4 100644
--- a/configs/evb-rk3328_defconfig
+++ b/configs/evb-rk3328_defconfig
@@ -6,6 +6,7 @@ CONFIG_TPL_ROCKCHIP_COMMON_BOARD=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x600000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF130000
diff --git a/configs/evb-rk3399_defconfig b/configs/evb-rk3399_defconfig
index caf83be19363..82e5d8196c63 100644
--- a/configs/evb-rk3399_defconfig
+++ b/configs/evb-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/ficus-rk3399_defconfig b/configs/ficus-rk3399_defconfig
index 69e3e0a0bc0f..6bb030acc161 100644
--- a/configs/ficus-rk3399_defconfig
+++ b/configs/ficus-rk3399_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
 CONFIG_ROCKCHIP_SPL_RESERVE_IRAM=0x4000
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_TARGET_ROCK960_RK3399=y
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/firefly-rk3288_defconfig b/configs/firefly-rk3288_defconfig
index 62a8dcb7f85d..2a1689d263a1 100644
--- a/configs/firefly-rk3288_defconfig
+++ b/configs/firefly-rk3288_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ROCKCHIP_RK3288=y
 CONFIG_TARGET_FIREFLY_RK3288=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL_SIZE_LIMIT=262144
diff --git a/configs/firefly-rk3399_defconfig b/configs/firefly-rk3399_defconfig
index b531d212ddc0..b84d7b9ff0a5 100644
--- a/configs/firefly-rk3399_defconfig
+++ b/configs/firefly-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/flea3_defconfig b/configs/flea3_defconfig
index 81c29714bd3b..1e1600851c4d 100644
--- a/configs/flea3_defconfig
+++ b/configs/flea3_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_SYS_DCACHE_OFF=y
 CONFIG_TARGET_FLEA3=y
 CONFIG_SYS_TEXT_BASE=0xA0000000
+CONFIG_ENV_SIZE=0x10000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTDELAY=3
@@ -23,6 +25,8 @@ CONFIG_MTDIDS_DEFAULT="nand0=mxc_nand,nor0=physmap-flash.0"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=mxc_nand:50m(root1),32m(rootfb),64m(pcache),64m(app1),10m(app2),-(spool);physmap-flash.0:512k(u-boot),64k(env1),64k(env2),3776k(kernel1),3776k(kernel2)"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xA0080000
+CONFIG_ENV_ADDR_REDUND=0xA0090000
 CONFIG_MXC_GPIO=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index ff243f72165e..bb1a01d70698 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF10000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_INTEL=y
 CONFIG_TARGET_GALILEO=y
 CONFIG_GENERATE_PIRQ_TABLE=y
diff --git a/configs/gardena-smart-gateway-mt7688-ram_defconfig b/configs/gardena-smart-gateway-mt7688-ram_defconfig
index cf20f4af6d1e..9a149a54b505 100644
--- a/configs/gardena-smart-gateway-mt7688-ram_defconfig
+++ b/configs/gardena-smart-gateway-mt7688-ram_defconfig
@@ -1,8 +1,11 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xA0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0xb000006c
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_ARCH_MTMIPS=y
 # CONFIG_MIPS_BOOT_ENV_LEGACY is not set
 CONFIG_MIPS_BOOT_FDT=y
@@ -41,6 +44,7 @@ CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="gardena-smart-gateway-mt7688"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xB0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 # CONFIG_DM_DEVICE_REMOVE is not set
diff --git a/configs/gardena-smart-gateway-mt7688_defconfig b/configs/gardena-smart-gateway-mt7688_defconfig
index 7c6b6572e0b3..45407d8387ac 100644
--- a/configs/gardena-smart-gateway-mt7688_defconfig
+++ b/configs/gardena-smart-gateway-mt7688_defconfig
@@ -1,8 +1,11 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9c000000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xA0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0xb000006c
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_ARCH_MTMIPS=y
 CONFIG_BOOT_ROM=y
 CONFIG_ONBOARD_DDR2_SIZE_1024MBIT=y
@@ -44,6 +47,7 @@ CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="gardena-smart-gateway-mt7688"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xB0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 # CONFIG_DM_DEVICE_REMOVE is not set
diff --git a/configs/gazerbeam_defconfig b/configs/gazerbeam_defconfig
index f7a6b1153b6c..1c71666d3579 100644
--- a/configs/gazerbeam_defconfig
+++ b/configs/gazerbeam_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
 CONFIG_SYS_MALLOC_F_LEN=0x600
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" gazerbeam 0.01"
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
@@ -141,6 +143,8 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_LIVE=y
 CONFIG_DEFAULT_DEVICE_TREE="gazerbeam"
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE080000
+CONFIG_ENV_ADDR_REDUND=0xFE090000
 CONFIG_DM=y
 CONFIG_REGMAP=y
 CONFIG_AXI=y
diff --git a/configs/ge_bx50v3_defconfig b/configs/ge_bx50v3_defconfig
index 13ab3a1980bd..68abf46d7afb 100644
--- a/configs/ge_bx50v3_defconfig
+++ b/configs/ge_bx50v3_defconfig
@@ -5,8 +5,11 @@ CONFIG_SYS_VPD_EEPROM_I2C_ADDR=0x50
 CONFIG_SYS_VPD_EEPROM_I2C_BUS=4
 CONFIG_SYS_VPD_EEPROM_SIZE=1024
 CONFIG_TARGET_GE_BX50V3=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_BOOTCOUNT_ADDR=0x7000A000
+CONFIG_ENV_SECT_SIZE=0x10000
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_FIT=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/goflexhome_defconfig b/configs/goflexhome_defconfig
index 5fa8b4d1f539..c7e116920405 100644
--- a/configs/goflexhome_defconfig
+++ b/configs/goflexhome_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_GOFLEXHOME=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nSeagate GoFlex Home"
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/gose_defconfig b/configs/gose_defconfig
index 15a9c5c8f193..5983e4088e32 100644
--- a/configs/gose_defconfig
+++ b/configs/gose_defconfig
@@ -12,9 +12,12 @@ CONFIG_ARCH_RMOBILE_BOARD_STRING="Gose"
 CONFIG_R8A7793=y
 CONFIG_TARGET_GOSE=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0xe6300000
@@ -55,6 +58,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7793-gose-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xC0000
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/gplugd_defconfig b/configs/gplugd_defconfig
index b27c109c9dfd..d03f4143ea63 100644
--- a/configs/gplugd_defconfig
+++ b/configs/gplugd_defconfig
@@ -3,6 +3,7 @@ CONFIG_SYS_DCACHE_OFF=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_GPLUGD=y
 CONFIG_SYS_TEXT_BASE=0x00f00000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nMarvell-gplugD"
 CONFIG_BOOTDELAY=3
diff --git a/configs/grpeach_defconfig b/configs/grpeach_defconfig
index 94b207b82636..b71fe9d9359a 100644
--- a/configs/grpeach_defconfig
+++ b/configs/grpeach_defconfig
@@ -3,7 +3,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_RMOBILE=y
 CONFIG_SYS_TEXT_BASE=0x18000000
 CONFIG_RZA1=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_BOOTDELAY=3
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_HUSH_PARSER=y
diff --git a/configs/guruplug_defconfig b/configs/guruplug_defconfig
index f94eeb42abe3..fa7e5ab149cf 100644
--- a/configs/guruplug_defconfig
+++ b/configs/guruplug_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_GURUPLUG=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nMarvell-GuruPlug"
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/gwventana_emmc_defconfig b/configs/gwventana_emmc_defconfig
index f659e892592f..b9876c87a493 100644
--- a/configs/gwventana_emmc_defconfig
+++ b/configs/gwventana_emmc_defconfig
@@ -9,6 +9,8 @@ CONFIG_CMD_EECONFIG=y
 CONFIG_CMD_GSC=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xB1400
 CONFIG_SPL_STACK_R_ADDR=0x18000000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
@@ -60,6 +62,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:16m(uboot),1m(env),-(rootfs)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xD1400
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
diff --git a/configs/gwventana_gw5904_defconfig b/configs/gwventana_gw5904_defconfig
index 1b2ee06be04a..eb1c125ae3e3 100644
--- a/configs/gwventana_gw5904_defconfig
+++ b/configs/gwventana_gw5904_defconfig
@@ -9,6 +9,8 @@ CONFIG_CMD_EECONFIG=y
 CONFIG_CMD_GSC=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xB1400
 CONFIG_SPL_STACK_R_ADDR=0x18000000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
@@ -60,6 +62,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:16m(uboot),1m(env),-(rootfs)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xD1400
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
diff --git a/configs/gwventana_nand_defconfig b/configs/gwventana_nand_defconfig
index 545d71bf2906..f4827b46c4ed 100644
--- a/configs/gwventana_nand_defconfig
+++ b/configs/gwventana_nand_defconfig
@@ -9,6 +9,8 @@ CONFIG_CMD_EECONFIG=y
 CONFIG_CMD_GSC=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x1000000
 CONFIG_SPL_STACK_R_ADDR=0x18000000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
@@ -63,6 +65,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:16m(uboot),1m(env),-(rootfs)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x1080000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
diff --git a/configs/harmony_defconfig b/configs/harmony_defconfig
index 412b070937ae..0ff1f2c7ea74 100644
--- a/configs/harmony_defconfig
+++ b/configs/harmony_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x1FFE0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA20=y
 CONFIG_TARGET_HARMONY=y
diff --git a/configs/helios4_defconfig b/configs/helios4_defconfig
index b8c239b04cae..e38292e9d839 100644
--- a/configs/helios4_defconfig
+++ b/configs/helios4_defconfig
@@ -8,6 +8,8 @@ CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_HELIOS4=y
 CONFIG_MVEBU_SPL_BOOT_DEVICE_MMC=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
diff --git a/configs/highbank_defconfig b/configs/highbank_defconfig
index 68738107891c..02db8ca085b2 100644
--- a/configs/highbank_defconfig
+++ b/configs/highbank_defconfig
@@ -3,6 +3,7 @@ CONFIG_SYS_DCACHE_OFF=y
 CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_HIGHBANK=y
 CONFIG_SYS_TEXT_BASE=0x00008000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=0
 CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0xfff3cf0c
@@ -19,6 +20,7 @@ CONFIG_AUTOBOOT_KEYED_CTRLC=y
 # CONFIG_CMD_FLASH is not set
 # CONFIG_CMD_SETEXPR is not set
 CONFIG_ENV_IS_IN_NVRAM=y
+CONFIG_ENV_ADDR=0xFFF88000
 CONFIG_SCSI_AHCI=y
 CONFIG_BOOTCOUNT_LIMIT=y
 # CONFIG_MMC is not set
diff --git a/configs/hikey960_defconfig b/configs/hikey960_defconfig
index 8a13aba8cc74..536201d6a0e1 100644
--- a/configs/hikey960_defconfig
+++ b/configs/hikey960_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_TARGET_HIKEY960=y
 CONFIG_SYS_TEXT_BASE=0x1ac98000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="\nHikey960"
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/hikey_defconfig b/configs/hikey_defconfig
index 8c2b438ae6f0..b58829468b1d 100644
--- a/configs/hikey_defconfig
+++ b/configs/hikey_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_SYS_TEXT_BASE=0x35000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_NR_DRAM_BANKS=6
 CONFIG_IDENT_STRING="hikey"
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/hrcon_defconfig b/configs/hrcon_defconfig
index bfbe37262505..dca59972cb1d 100644
--- a/configs/hrcon_defconfig
+++ b/configs/hrcon_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" hrcon 0.01"
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
@@ -120,6 +122,8 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE060000
+CONFIG_ENV_ADDR_REDUND=0xFE070000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/hrcon_dh_defconfig b/configs/hrcon_dh_defconfig
index fdf8af9015e4..40de2f95f354 100644
--- a/configs/hrcon_dh_defconfig
+++ b/configs/hrcon_dh_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" hrcon dh 0.01"
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
@@ -118,6 +120,8 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE060000
+CONFIG_ENV_ADDR_REDUND=0xFE070000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/huawei_hg556a_ram_defconfig b/configs/huawei_hg556a_ram_defconfig
index 6e024e75cc4f..73f2f432776f 100644
--- a/configs/huawei_hg556a_ram_defconfig
+++ b/configs/huawei_hg556a_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6358=y
diff --git a/configs/ib62x0_defconfig b/configs/ib62x0_defconfig
index 31498f662dc9..86c98fc08c39 100644
--- a/configs/ib62x0_defconfig
+++ b/configs/ib62x0_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_IB62X0=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING=" RaidSonic ICY BOX IB-NAS62x0"
 CONFIG_BOOTDELAY=3
diff --git a/configs/iconnect_defconfig b/configs/iconnect_defconfig
index dfd7955ade41..670a565c0cbf 100644
--- a/configs/iconnect_defconfig
+++ b/configs/iconnect_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_ICONNECT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING=" Iomega iConnect"
 CONFIG_BOOTDELAY=3
diff --git a/configs/ids8313_defconfig b/configs/ids8313_defconfig
index 241763d1ca78..d34e1136bb13 100644
--- a/configs/ids8313_defconfig
+++ b/configs/ids8313_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_SYS_BOOTCOUNT_ADDR=0x9
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -148,6 +150,8 @@ CONFIG_MTDIDS_DEFAULT="nor0=ff800000.flash,nand0=e1000000.flash"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=ff800000.flash:7m(dum),768k(BOOT-BIN),128k(BOOT-ENV),128k(BOOT-REDENV);e1000000.flash:-(ubi)"
 CONFIG_CMD_UBI=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFFFC0000
+CONFIG_ENV_ADDR_REDUND=0xFFFE0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_I2C=y
 # CONFIG_MMC is not set
diff --git a/configs/imgtec_xilfpga_defconfig b/configs/imgtec_xilfpga_defconfig
index c6228675dea0..61173e577f4f 100644
--- a/configs/imgtec_xilfpga_defconfig
+++ b/configs/imgtec_xilfpga_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_MALLOC_F_LEN=0x600
+CONFIG_ENV_SIZE=0x4000
 CONFIG_TARGET_XILFPGA=y
 # CONFIG_MIPS_BOOT_ENV_LEGACY is not set
 CONFIG_MIPS_BOOT_FDT=y
diff --git a/configs/imx6dl_icore_nand_defconfig b/configs/imx6dl_icore_nand_defconfig
index f919dd40272e..ba5333c8116a 100644
--- a/configs/imx6dl_icore_nand_defconfig
+++ b/configs/imx6dl_icore_nand_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6Q_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/imx6dl_mamoj_defconfig b/configs/imx6dl_mamoj_defconfig
index bc896ede6b66..479922212435 100644
--- a/configs/imx6dl_mamoj_defconfig
+++ b/configs/imx6dl_mamoj_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_MX6DL_MAMOJ=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IMX_HAB=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/imx6q_icore_nand_defconfig b/configs/imx6q_icore_nand_defconfig
index 223f9ded964e..c7bbae673915 100644
--- a/configs/imx6q_icore_nand_defconfig
+++ b/configs/imx6q_icore_nand_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6Q_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/imx6q_logic_defconfig b/configs/imx6q_logic_defconfig
index 8010eabe0757..a1e1e39ba4b4 100644
--- a/configs/imx6q_logic_defconfig
+++ b/configs/imx6q_logic_defconfig
@@ -8,6 +8,8 @@ CONFIG_MX6_OCRAM_256KB=y
 CONFIG_TARGET_MX6LOGICPD=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x100000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/imx6qdl_icore_mipi_defconfig b/configs/imx6qdl_icore_mipi_defconfig
index 1d9c1fa9a91e..9f95edf6be76 100644
--- a/configs/imx6qdl_icore_mipi_defconfig
+++ b/configs/imx6qdl_icore_mipi_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6Q_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0x021f0000
diff --git a/configs/imx6qdl_icore_mmc_defconfig b/configs/imx6qdl_icore_mmc_defconfig
index e0ec3415dd28..f7dbbf76bb82 100644
--- a/configs/imx6qdl_icore_mmc_defconfig
+++ b/configs/imx6qdl_icore_mmc_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6Q_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
diff --git a/configs/imx6qdl_icore_nand_defconfig b/configs/imx6qdl_icore_nand_defconfig
index 223f9ded964e..c7bbae673915 100644
--- a/configs/imx6qdl_icore_nand_defconfig
+++ b/configs/imx6qdl_icore_nand_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6Q_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/imx6qdl_icore_rqs_defconfig b/configs/imx6qdl_icore_rqs_defconfig
index 788546fabf18..4538ffae0f05 100644
--- a/configs/imx6qdl_icore_rqs_defconfig
+++ b/configs/imx6qdl_icore_rqs_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6Q_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/imx6ul_geam_mmc_defconfig b/configs/imx6ul_geam_mmc_defconfig
index 6fd1f1fad3bf..d3f72f0bbf97 100644
--- a/configs/imx6ul_geam_mmc_defconfig
+++ b/configs/imx6ul_geam_mmc_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6UL_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/imx6ul_geam_nand_defconfig b/configs/imx6ul_geam_nand_defconfig
index 1ee337858c96..056987eaffc0 100644
--- a/configs/imx6ul_geam_nand_defconfig
+++ b/configs/imx6ul_geam_nand_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6UL_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/imx6ul_isiot_emmc_defconfig b/configs/imx6ul_isiot_emmc_defconfig
index 9a8904e42014..b8accfb49018 100644
--- a/configs/imx6ul_isiot_emmc_defconfig
+++ b/configs/imx6ul_isiot_emmc_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6UL_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/imx6ul_isiot_nand_defconfig b/configs/imx6ul_isiot_nand_defconfig
index 264d28903282..3115a59752a1 100644
--- a/configs/imx6ul_isiot_nand_defconfig
+++ b/configs/imx6ul_isiot_nand_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6UL_ENGICAM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/imx8mm_evk_defconfig b/configs/imx8mm_evk_defconfig
index 6161e341c350..87560ef989c8 100644
--- a/configs/imx8mm_evk_defconfig
+++ b/configs/imx8mm_evk_defconfig
@@ -11,6 +11,8 @@ CONFIG_TARGET_IMX8MM_EVK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x7E1000
 CONFIG_FIT=y
diff --git a/configs/imx8mn_ddr4_evk_defconfig b/configs/imx8mn_ddr4_evk_defconfig
index d460ed9ba046..50b03d0763f5 100644
--- a/configs/imx8mn_ddr4_evk_defconfig
+++ b/configs/imx8mn_ddr4_evk_defconfig
@@ -11,6 +11,8 @@ CONFIG_TARGET_IMX8MN_EVK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_SPL=y
 CONFIG_SPL_IMX_ROMAPI_LOADADDR=0x48000000
 CONFIG_SPL_TEXT_BASE=0x912000
diff --git a/configs/imx8mq_evk_defconfig b/configs/imx8mq_evk_defconfig
index b1d51d538419..b5560d5ad1f9 100644
--- a/configs/imx8mq_evk_defconfig
+++ b/configs/imx8mq_evk_defconfig
@@ -5,6 +5,8 @@ CONFIG_ARCH_IMX8M=y
 CONFIG_SYS_TEXT_BASE=0x40200000
 CONFIG_TARGET_IMX8MQ_EVK=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_SPL=y
 CONFIG_CSF_SIZE=0x2000
 CONFIG_SPL_TEXT_BASE=0x7E1000
diff --git a/configs/imx8qm_mek_defconfig b/configs/imx8qm_mek_defconfig
index 39cc507e9b95..2f7fe256357b 100644
--- a/configs/imx8qm_mek_defconfig
+++ b/configs/imx8qm_mek_defconfig
@@ -13,6 +13,8 @@ CONFIG_TARGET_IMX8QM_MEK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x100000
diff --git a/configs/imx8qm_rom7720_a1_4G_defconfig b/configs/imx8qm_rom7720_a1_4G_defconfig
index 6646d16a5a14..ea019024ba46 100644
--- a/configs/imx8qm_rom7720_a1_4G_defconfig
+++ b/configs/imx8qm_rom7720_a1_4G_defconfig
@@ -11,6 +11,8 @@ CONFIG_TARGET_IMX8QM_ROM7720_A1=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_SPL=y
 CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
diff --git a/configs/imx8qxp_mek_defconfig b/configs/imx8qxp_mek_defconfig
index 6aff5b7405de..35699316de86 100644
--- a/configs/imx8qxp_mek_defconfig
+++ b/configs/imx8qxp_mek_defconfig
@@ -13,6 +13,8 @@ CONFIG_TARGET_IMX8QXP_MEK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x400000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x100000
diff --git a/configs/inetspace_v2_defconfig b/configs/inetspace_v2_defconfig
index 95dfa9c571e7..b05387c18b6d 100644
--- a/configs/inetspace_v2_defconfig
+++ b/configs/inetspace_v2_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NETSPACE_V2=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" IS v2"
 CONFIG_SYS_EXTRA_OPTIONS="INETSPACE_V2"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-is2"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=20000000
+CONFIG_ENV_ADDR=0x70000
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/integratorap_cm720t_defconfig b/configs/integratorap_cm720t_defconfig
index f0bf27b997a4..f5f9cb28b38c 100644
--- a/configs/integratorap_cm720t_defconfig
+++ b/configs/integratorap_cm720t_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_INTEGRATOR=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ARCH_INTEGRATOR_AP=y
 CONFIG_CM720T=y
+CONFIG_ENV_SIZE=0x8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mtdblock0 console=ttyAM0 console=tty"
diff --git a/configs/integratorap_cm920t_defconfig b/configs/integratorap_cm920t_defconfig
index 1759351bf232..8a0ad1f94813 100644
--- a/configs/integratorap_cm920t_defconfig
+++ b/configs/integratorap_cm920t_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_INTEGRATOR=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ARCH_INTEGRATOR_AP=y
 CONFIG_CM920T=y
+CONFIG_ENV_SIZE=0x8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mtdblock0 console=ttyAM0 console=tty"
diff --git a/configs/integratorap_cm926ejs_defconfig b/configs/integratorap_cm926ejs_defconfig
index 4a8b44b4b5bd..ab61bf2ef465 100644
--- a/configs/integratorap_cm926ejs_defconfig
+++ b/configs/integratorap_cm926ejs_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_INTEGRATOR=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ARCH_INTEGRATOR_AP=y
 CONFIG_CM926EJ_S=y
+CONFIG_ENV_SIZE=0x8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mtdblock0 console=ttyAM0 console=tty"
diff --git a/configs/integratorap_cm946es_defconfig b/configs/integratorap_cm946es_defconfig
index f02059fbf6d7..7af54331610a 100644
--- a/configs/integratorap_cm946es_defconfig
+++ b/configs/integratorap_cm946es_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_INTEGRATOR=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ARCH_INTEGRATOR_AP=y
 CONFIG_CM946ES=y
+CONFIG_ENV_SIZE=0x8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mtdblock0 console=ttyAM0 console=tty"
diff --git a/configs/integratorcp_cm1136_defconfig b/configs/integratorcp_cm1136_defconfig
index 1b3d067ce6a0..f2d7f9df6ef2 100644
--- a/configs/integratorcp_cm1136_defconfig
+++ b/configs/integratorcp_cm1136_defconfig
@@ -3,7 +3,9 @@ CONFIG_ARCH_INTEGRATOR=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ARCH_INTEGRATOR_CP=y
 CONFIG_CM1136=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mtdblock0 console=ttyAMA0 console=tty ip=dhcp netdev=27,0,0xfc800000,0xfc800010,eth0 video=clcdfb:0"
 CONFIG_MISC_INIT_R=y
@@ -16,6 +18,7 @@ CONFIG_SYS_PROMPT="Integrator-CP # "
 CONFIG_CMD_IMLS=y
 CONFIG_CMD_ARMFLASH=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_ENV_ADDR=0x24F00000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/integratorcp_cm920t_defconfig b/configs/integratorcp_cm920t_defconfig
index 847196e1cf51..e133ab1361b9 100644
--- a/configs/integratorcp_cm920t_defconfig
+++ b/configs/integratorcp_cm920t_defconfig
@@ -3,7 +3,9 @@ CONFIG_ARCH_INTEGRATOR=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ARCH_INTEGRATOR_CP=y
 CONFIG_CM920T=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mtdblock0 console=ttyAMA0 console=tty ip=dhcp netdev=27,0,0xfc800000,0xfc800010,eth0 video=clcdfb:0"
 CONFIG_MISC_INIT_R=y
@@ -16,6 +18,7 @@ CONFIG_SYS_PROMPT="Integrator-CP # "
 CONFIG_CMD_IMLS=y
 CONFIG_CMD_ARMFLASH=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_ENV_ADDR=0x24F00000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/integratorcp_cm926ejs_defconfig b/configs/integratorcp_cm926ejs_defconfig
index b3a1bcba3cae..f5a840d09c23 100644
--- a/configs/integratorcp_cm926ejs_defconfig
+++ b/configs/integratorcp_cm926ejs_defconfig
@@ -3,7 +3,9 @@ CONFIG_ARCH_INTEGRATOR=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ARCH_INTEGRATOR_CP=y
 CONFIG_CM926EJ_S=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mtdblock0 console=ttyAMA0 console=tty ip=dhcp netdev=27,0,0xfc800000,0xfc800010,eth0 video=clcdfb:0"
 CONFIG_MISC_INIT_R=y
@@ -16,6 +18,7 @@ CONFIG_SYS_PROMPT="Integrator-CP # "
 CONFIG_CMD_IMLS=y
 CONFIG_CMD_ARMFLASH=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_ENV_ADDR=0x24F00000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/integratorcp_cm946es_defconfig b/configs/integratorcp_cm946es_defconfig
index cadf5e8915c2..b3a33d9b6255 100644
--- a/configs/integratorcp_cm946es_defconfig
+++ b/configs/integratorcp_cm946es_defconfig
@@ -3,7 +3,9 @@ CONFIG_ARCH_INTEGRATOR=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_ARCH_INTEGRATOR_CP=y
 CONFIG_CM946ES=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/mtdblock0 console=ttyAMA0 console=tty ip=dhcp netdev=27,0,0xfc800000,0xfc800010,eth0 video=clcdfb:0"
 CONFIG_MISC_INIT_R=y
@@ -16,6 +18,7 @@ CONFIG_SYS_PROMPT="Integrator-CP # "
 CONFIG_CMD_IMLS=y
 CONFIG_CMD_ARMFLASH=y
 # CONFIG_CMD_SETEXPR is not set
+CONFIG_ENV_ADDR=0x24F00000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/j721e_evm_a72_defconfig b/configs/j721e_evm_a72_defconfig
index 3e3e924bc3b2..2112ce813be9 100644
--- a/configs/j721e_evm_a72_defconfig
+++ b/configs/j721e_evm_a72_defconfig
@@ -8,6 +8,7 @@ CONFIG_TARGET_J721E_A72_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/j721e_evm_r5_defconfig b/configs/j721e_evm_r5_defconfig
index b92a850c598e..62b959461def 100644
--- a/configs/j721e_evm_r5_defconfig
+++ b/configs/j721e_evm_r5_defconfig
@@ -9,6 +9,7 @@ CONFIG_TARGET_J721E_R5_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_SPL_STACK_R_ADDR=0x82000000
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/jetson-tk1_defconfig b/configs/jetson-tk1_defconfig
index 8b6d9c94402e..874e90e8479b 100644
--- a/configs/jetson-tk1_defconfig
+++ b/configs/jetson-tk1_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA124=y
 CONFIG_TARGET_JETSON_TK1=y
diff --git a/configs/k2e_evm_defconfig b/configs/k2e_evm_defconfig
index 4565899cb7ef..bb0acc6cdda5 100644
--- a/configs/k2e_evm_defconfig
+++ b/configs/k2e_evm_defconfig
@@ -9,6 +9,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_K2E_EVM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
diff --git a/configs/k2e_hs_evm_defconfig b/configs/k2e_hs_evm_defconfig
index b20427e53500..d660a68b16e0 100644
--- a/configs/k2e_hs_evm_defconfig
+++ b/configs/k2e_hs_evm_defconfig
@@ -7,6 +7,8 @@ CONFIG_ISW_ENTRY_ADDR=0xC100000
 CONFIG_SYS_TEXT_BASE=0xC000060
 CONFIG_TI_COMMON_CMD_OPTIONS=y
 CONFIG_TARGET_K2E_EVM=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
diff --git a/configs/k2g_evm_defconfig b/configs/k2g_evm_defconfig
index 58274e8e7467..159d772c1fac 100644
--- a/configs/k2g_evm_defconfig
+++ b/configs/k2g_evm_defconfig
@@ -9,6 +9,7 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_K2G_EVM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
diff --git a/configs/k2g_hs_evm_defconfig b/configs/k2g_hs_evm_defconfig
index 27cb905938c2..c30058fb61dc 100644
--- a/configs/k2g_hs_evm_defconfig
+++ b/configs/k2g_hs_evm_defconfig
@@ -7,6 +7,7 @@ CONFIG_ISW_ENTRY_ADDR=0xC0A0000
 CONFIG_SYS_TEXT_BASE=0xC000060
 CONFIG_TI_COMMON_CMD_OPTIONS=y
 CONFIG_TARGET_K2G_EVM=y
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
diff --git a/configs/k2hk_evm_defconfig b/configs/k2hk_evm_defconfig
index fbb1a9ed3ee0..cab702ef35b6 100644
--- a/configs/k2hk_evm_defconfig
+++ b/configs/k2hk_evm_defconfig
@@ -9,6 +9,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_K2HK_EVM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
diff --git a/configs/k2hk_hs_evm_defconfig b/configs/k2hk_hs_evm_defconfig
index dd826ba36549..48e400708787 100644
--- a/configs/k2hk_hs_evm_defconfig
+++ b/configs/k2hk_hs_evm_defconfig
@@ -7,6 +7,8 @@ CONFIG_ISW_ENTRY_ADDR=0xC200000
 CONFIG_SYS_TEXT_BASE=0xC000060
 CONFIG_TI_COMMON_CMD_OPTIONS=y
 CONFIG_TARGET_K2HK_EVM=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_IMAGE_POST_PROCESS=y
diff --git a/configs/k2l_evm_defconfig b/configs/k2l_evm_defconfig
index c74897f5d320..8054f514d7aa 100644
--- a/configs/k2l_evm_defconfig
+++ b/configs/k2l_evm_defconfig
@@ -9,6 +9,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_K2L_EVM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
diff --git a/configs/k2l_hs_evm_defconfig b/configs/k2l_hs_evm_defconfig
index f12a7b7885c3..b80d7e737dea 100644
--- a/configs/k2l_hs_evm_defconfig
+++ b/configs/k2l_hs_evm_defconfig
@@ -7,6 +7,8 @@ CONFIG_ISW_ENTRY_ADDR=0xC100000
 CONFIG_SYS_TEXT_BASE=0xC000060
 CONFIG_TI_COMMON_CMD_OPTIONS=y
 CONFIG_TARGET_K2L_EVM=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_FIT_IMAGE_POST_PROCESS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/khadas-edge-captain-rk3399_defconfig b/configs/khadas-edge-captain-rk3399_defconfig
index 7f016da37741..c408a1a59b30 100644
--- a/configs/khadas-edge-captain-rk3399_defconfig
+++ b/configs/khadas-edge-captain-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/khadas-edge-rk3399_defconfig b/configs/khadas-edge-rk3399_defconfig
index 9d32183d2a1c..796f94f8d721 100644
--- a/configs/khadas-edge-rk3399_defconfig
+++ b/configs/khadas-edge-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/khadas-edge-v-rk3399_defconfig b/configs/khadas-edge-v-rk3399_defconfig
index 3433573e7cd5..e70e1ec2e685 100644
--- a/configs/khadas-edge-v-rk3399_defconfig
+++ b/configs/khadas-edge-v-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/khadas-vim2_defconfig b/configs/khadas-vim2_defconfig
index a7f106a13420..cc9935d03882 100644
--- a/configs/khadas-vim2_defconfig
+++ b/configs/khadas-vim2_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXM=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/khadas-vim3_defconfig b/configs/khadas-vim3_defconfig
index d2e09e8f73c0..17d5a900fc7b 100644
--- a/configs/khadas-vim3_defconfig
+++ b/configs/khadas-vim3_defconfig
@@ -3,6 +3,7 @@ CONFIG_SYS_BOARD="w400"
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_G12A=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff803000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/khadas-vim_defconfig b/configs/khadas-vim_defconfig
index dda47c79370b..9b0ac8fad88a 100644
--- a/configs/khadas-vim_defconfig
+++ b/configs/khadas-vim_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/km_kirkwood_128m16_defconfig b/configs/km_kirkwood_128m16_defconfig
index 39e6f8d1718d..73b4054dcc83 100644
--- a/configs/km_kirkwood_128m16_defconfig
+++ b/configs/km_kirkwood_128m16_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x07d00000
 CONFIG_TARGET_KM_KIRKWOOD=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_IDENT_STRING="\nKeymile Kirkwood 128M16"
 CONFIG_SYS_EXTRA_OPTIONS="KM_KIRKWOOD_128M16"
 CONFIG_MISC_INIT_R=y
@@ -32,6 +34,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="kirkwood-km_kirkwood"
 CONFIG_ENV_IS_IN_EEPROM=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x2000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_RAM=y
diff --git a/configs/km_kirkwood_defconfig b/configs/km_kirkwood_defconfig
index 8100243e5839..ea8af60fa56f 100644
--- a/configs/km_kirkwood_defconfig
+++ b/configs/km_kirkwood_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x07d00000
 CONFIG_TARGET_KM_KIRKWOOD=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_IDENT_STRING="\nKeymile Kirkwood"
 CONFIG_SYS_EXTRA_OPTIONS="KM_KIRKWOOD"
 CONFIG_MISC_INIT_R=y
@@ -32,6 +34,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="kirkwood-km_kirkwood"
 CONFIG_ENV_IS_IN_EEPROM=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x2000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_RAM=y
diff --git a/configs/km_kirkwood_pci_defconfig b/configs/km_kirkwood_pci_defconfig
index f01cb3cdb4aa..1927fb47f231 100644
--- a/configs/km_kirkwood_pci_defconfig
+++ b/configs/km_kirkwood_pci_defconfig
@@ -5,6 +5,8 @@ CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x07d00000
 CONFIG_TARGET_KM_KIRKWOOD=y
 CONFIG_KM_FPGA_CONFIG=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_IDENT_STRING="\nKeymile Kirkwood PCI"
 CONFIG_SYS_EXTRA_OPTIONS="KM_KIRKWOOD_PCI"
 CONFIG_MISC_INIT_R=y
@@ -33,6 +35,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="kirkwood-km_kirkwood"
 CONFIG_ENV_IS_IN_EEPROM=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x2000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_RAM=y
diff --git a/configs/kmcoge4_defconfig b/configs/kmcoge4_defconfig
index 587d761620ca..ad2de2cd62c0 100644
--- a/configs/kmcoge4_defconfig
+++ b/configs/kmcoge4_defconfig
@@ -1,6 +1,9 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff40000
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xFB000020
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_MPC85xx=y
 CONFIG_TARGET_KMP204X=y
 CONFIG_FIT=y
@@ -37,6 +40,7 @@ CONFIG_CMD_UBI=y
 CONFIG_DOS_PARTITION=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x110000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
diff --git a/configs/kmcoge5ne_defconfig b/configs/kmcoge5ne_defconfig
index edd9af9adbb7..0d41396c250b 100644
--- a/configs/kmcoge5ne_defconfig
+++ b/configs/kmcoge5ne_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE011BFF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -178,6 +180,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=boot:768k(u-boot),128k(env),128k(envred),-(ubi
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF00C0000
+CONFIG_ENV_ADDR_REDUND=0xF00E0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/kmcoge5un_defconfig b/configs/kmcoge5un_defconfig
index d0071fb6c56d..ff23af3060be 100644
--- a/configs/kmcoge5un_defconfig
+++ b/configs/kmcoge5un_defconfig
@@ -7,6 +7,9 @@ CONFIG_TARGET_KM_KIRKWOOD=y
 CONFIG_PIGGY_MAC_ADRESS_OFFSET=3
 CONFIG_KM_ENV_IS_IN_SPI_NOR=y
 CONFIG_KM_PIGGY4_88E6352=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="\nKeymile COGE5UN"
 CONFIG_SYS_EXTRA_OPTIONS="KM_COGE5UN"
 CONFIG_MISC_INIT_R=y
@@ -35,6 +38,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="kirkwood-km_kirkwood"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xD0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_RAM=y
diff --git a/configs/kmeter1_defconfig b/configs/kmeter1_defconfig
index eb598b8ccca1..4d9f41202085 100644
--- a/configs/kmeter1_defconfig
+++ b/configs/kmeter1_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE011BFF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -141,6 +143,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=boot:768k(u-boot),128k(env),128k(envred),-(ubi
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF00C0000
+CONFIG_ENV_ADDR_REDUND=0xF00E0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/kmnusa_defconfig b/configs/kmnusa_defconfig
index b62869c6bda1..0b5a0e4e2249 100644
--- a/configs/kmnusa_defconfig
+++ b/configs/kmnusa_defconfig
@@ -7,6 +7,9 @@ CONFIG_TARGET_KM_KIRKWOOD=y
 CONFIG_KM_FPGA_CONFIG=y
 CONFIG_KM_ENV_IS_IN_SPI_NOR=y
 CONFIG_KM_PIGGY4_88E6352=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="\nKeymile NUSA"
 CONFIG_SYS_EXTRA_OPTIONS="KM_NUSA"
 CONFIG_MISC_INIT_R=y
@@ -35,6 +38,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="kirkwood-km_kirkwood"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xD0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_RAM=y
diff --git a/configs/kmopti2_defconfig b/configs/kmopti2_defconfig
index c33b25660813..80af10558485 100644
--- a/configs/kmopti2_defconfig
+++ b/configs/kmopti2_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE0113FF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -161,6 +163,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=boot:768k(u-boot),128k(env),128k(envred),-(ubi
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF00C0000
+CONFIG_ENV_ADDR_REDUND=0xF00E0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/kmsugp1_defconfig b/configs/kmsugp1_defconfig
index a72fd9cac107..3afde51f8dd9 100644
--- a/configs/kmsugp1_defconfig
+++ b/configs/kmsugp1_defconfig
@@ -7,6 +7,9 @@ CONFIG_TARGET_KM_KIRKWOOD=y
 CONFIG_KM_FPGA_CONFIG=y
 CONFIG_KM_ENV_IS_IN_SPI_NOR=y
 CONFIG_KM_PIGGY4_88E6352=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="\nKeymile SUGP1"
 CONFIG_SYS_EXTRA_OPTIONS="KM_SUGP1"
 CONFIG_MISC_INIT_R=y
@@ -35,6 +38,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="kirkwood-km_kirkwood"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xD0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_RAM=y
diff --git a/configs/kmsupx5_defconfig b/configs/kmsupx5_defconfig
index 2f7cca59527f..4e58aed96ab9 100644
--- a/configs/kmsupx5_defconfig
+++ b/configs/kmsupx5_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE0113FF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -141,6 +143,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=boot:768k(u-boot),128k(env),128k(envred),-(ubi
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF00C0000
+CONFIG_ENV_ADDR_REDUND=0xF00E0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/kmsuv31_defconfig b/configs/kmsuv31_defconfig
index 633cf83c919d..632e5dfa822b 100644
--- a/configs/kmsuv31_defconfig
+++ b/configs/kmsuv31_defconfig
@@ -6,6 +6,9 @@ CONFIG_SYS_TEXT_BASE=0x07d00000
 CONFIG_TARGET_KM_KIRKWOOD=y
 CONFIG_KM_FPGA_CONFIG=y
 CONFIG_KM_ENV_IS_IN_SPI_NOR=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="\nKeymile SUV31"
 CONFIG_SYS_EXTRA_OPTIONS="KM_SUV31"
 CONFIG_MISC_INIT_R=y
@@ -34,6 +37,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="kirkwood-km_kirkwood"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xD0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_RAM=y
diff --git a/configs/kmtegr1_defconfig b/configs/kmtegr1_defconfig
index d8a84658dc92..9cf0cde923ac 100644
--- a/configs/kmtegr1_defconfig
+++ b/configs/kmtegr1_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE0113FF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -142,6 +144,8 @@ CONFIG_CMD_DIAG=y
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF0100000
+CONFIG_ENV_ADDR_REDUND=0xF0120000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/kmtepr2_defconfig b/configs/kmtepr2_defconfig
index 8e838eac0944..d84da2d34b01 100644
--- a/configs/kmtepr2_defconfig
+++ b/configs/kmtepr2_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE0113FF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -161,6 +163,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=boot:768k(u-boot),128k(env),128k(envred),-(ubi
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF00C0000
+CONFIG_ENV_ADDR_REDUND=0xF00E0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/koelsch_defconfig b/configs/koelsch_defconfig
index 393a1c680aad..34ef807adf23 100644
--- a/configs/koelsch_defconfig
+++ b/configs/koelsch_defconfig
@@ -12,9 +12,12 @@ CONFIG_ARCH_RMOBILE_BOARD_STRING="Koelsch"
 CONFIG_R8A7791=y
 CONFIG_TARGET_KOELSCH=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0xe6300000
@@ -55,6 +58,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7791-koelsch-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xC0000
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/kp_imx53_defconfig b/configs/kp_imx53_defconfig
index 3171c3022eb4..931726b34b93 100644
--- a/configs/kp_imx53_defconfig
+++ b/configs/kp_imx53_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x77800000
 CONFIG_TARGET_KP_IMX53=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_FIT=y
@@ -30,6 +32,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx53-kp"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x102000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_I2C_SET_DEFAULT_BUS_NUM=y
 CONFIG_I2C_DEFAULT_BUS_NUMBER=0x1
diff --git a/configs/kp_imx6q_tpc_defconfig b/configs/kp_imx6q_tpc_defconfig
index b956a1903f27..ed047f26c401 100644
--- a/configs/kp_imx6q_tpc_defconfig
+++ b/configs/kp_imx6q_tpc_defconfig
@@ -9,6 +9,8 @@ CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_KP_IMX6Q_TPC=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00908000
@@ -43,6 +45,7 @@ CONFIG_DEFAULT_DEVICE_TREE="imx6q-kp"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupt-parent assigned-clocks assigned-clock-rates assigned-clock-parents interrupts dmas dma-names"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x102000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 # CONFIG_BLOCK_CACHE is not set
 CONFIG_SPL_CLK_IMX6Q=y
diff --git a/configs/kylin-rk3036_defconfig b/configs/kylin-rk3036_defconfig
index b16d38938fae..d05906ed2d30 100644
--- a/configs/kylin-rk3036_defconfig
+++ b/configs/kylin-rk3036_defconfig
@@ -6,6 +6,7 @@ CONFIG_SYS_TEXT_BASE=0x60000000
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_ROCKCHIP_RK3036=y
 CONFIG_TARGET_KYLIN_RK3036=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x0
 CONFIG_NR_DRAM_BANKS=1
diff --git a/configs/kzm9g_defconfig b/configs/kzm9g_defconfig
index 94f77cf733bf..32f23fa843f2 100644
--- a/configs/kzm9g_defconfig
+++ b/configs/kzm9g_defconfig
@@ -5,7 +5,9 @@ CONFIG_ARCH_RMOBILE=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_ARCH_RMOBILE_BOARD_STRING="KMC KZM-A9-GT"
 CONFIG_TARGET_KZM9G=y
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="root=/dev/null console=ttySC4,115200"
@@ -21,6 +23,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x40000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/lager_defconfig b/configs/lager_defconfig
index c3a96471f4b3..1be6df22e924 100644
--- a/configs/lager_defconfig
+++ b/configs/lager_defconfig
@@ -12,9 +12,12 @@ CONFIG_ARCH_RMOBILE_BOARD_STRING="Lager"
 CONFIG_R8A7790=y
 CONFIG_TARGET_LAGER=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0xe6300000
@@ -55,6 +58,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7790-lager-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xC0000
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/leez-rk3399_defconfig b/configs/leez-rk3399_defconfig
index 616c74495b91..3758d79a1e68 100644
--- a/configs/leez-rk3399_defconfig
+++ b/configs/leez-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/legoev3_defconfig b/configs/legoev3_defconfig
index 5e3c42f9ebfb..4349ad6afeec 100644
--- a/configs/legoev3_defconfig
+++ b/configs/legoev3_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_DAVINCI=y
 CONFIG_SYS_TEXT_BASE=0xc1080000
 CONFIG_TARGET_LEGOEV3=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_BOOTDELAY=0
 CONFIG_VERSION_VARIABLE=y
diff --git a/configs/libretech-ac_defconfig b/configs/libretech-ac_defconfig
index cef07e021117..7e9f02aaa1bc 100644
--- a/configs/libretech-ac_defconfig
+++ b/configs/libretech-ac_defconfig
@@ -3,9 +3,12 @@ CONFIG_SYS_CONFIG_NAME="libretech-ac"
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFF0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" libretech-ac"
 CONFIG_DEBUG_UART=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/libretech-cc_defconfig b/configs/libretech-cc_defconfig
index 36d65d9f94e6..8976d7f1f4a8 100644
--- a/configs/libretech-cc_defconfig
+++ b/configs/libretech-cc_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/linkit-smart-7688-ram_defconfig b/configs/linkit-smart-7688-ram_defconfig
index 43c916f1e965..4aff34faed15 100644
--- a/configs/linkit-smart-7688-ram_defconfig
+++ b/configs/linkit-smart-7688-ram_defconfig
@@ -1,6 +1,9 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_ARCH_MTMIPS=y
 CONFIG_BOARD_LINKIT_SMART_7688=y
 # CONFIG_MIPS_BOOT_ENV_LEGACY is not set
diff --git a/configs/linkit-smart-7688_defconfig b/configs/linkit-smart-7688_defconfig
index fca86f9c25ff..1ecd4dfb5f03 100644
--- a/configs/linkit-smart-7688_defconfig
+++ b/configs/linkit-smart-7688_defconfig
@@ -1,6 +1,9 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9c000000
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_ARCH_MTMIPS=y
 CONFIG_BOARD_LINKIT_SMART_7688=y
 CONFIG_BOOT_ROM=y
diff --git a/configs/lion-rk3368_defconfig b/configs/lion-rk3368_defconfig
index deb71032e341..ec5c576ce035 100644
--- a/configs/lion-rk3368_defconfig
+++ b/configs/lion-rk3368_defconfig
@@ -6,6 +6,7 @@ CONFIG_ROCKCHIP_SPL_RESERVE_IRAM=0x0
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x600000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
diff --git a/configs/liteboard_defconfig b/configs/liteboard_defconfig
index 6f891c7e92f2..4d2e491f6b1d 100644
--- a/configs/liteboard_defconfig
+++ b/configs/liteboard_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_LITEBOARD=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/ls1012a2g5rdb_qspi_defconfig b/configs/ls1012a2g5rdb_qspi_defconfig
index 463f48cf8d1f..710df14c74f9 100644
--- a/configs/ls1012a2g5rdb_qspi_defconfig
+++ b/configs/ls1012a2g5rdb_qspi_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1012A2G5RDB=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/ls1012a2g5rdb_tfa_defconfig b/configs/ls1012a2g5rdb_tfa_defconfig
index eeffa9a07612..cafd942d998d 100644
--- a/configs/ls1012a2g5rdb_tfa_defconfig
+++ b/configs/ls1012a2g5rdb_tfa_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1012A2G5RDB=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
diff --git a/configs/ls1012afrdm_qspi_defconfig b/configs/ls1012afrdm_qspi_defconfig
index ef167642866c..541d7b9e89ad 100644
--- a/configs/ls1012afrdm_qspi_defconfig
+++ b/configs/ls1012afrdm_qspi_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1012AFRDM=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls1012afrdm_tfa_defconfig b/configs/ls1012afrdm_tfa_defconfig
index e6d724547add..90ad5aaf2a5e 100644
--- a/configs/ls1012afrdm_tfa_defconfig
+++ b/configs/ls1012afrdm_tfa_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1012AFRDM=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1012afrwy_qspi_SECURE_BOOT_defconfig b/configs/ls1012afrwy_qspi_SECURE_BOOT_defconfig
index 8eb25434be2d..131b3a00e3a8 100644
--- a/configs/ls1012afrwy_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1012afrwy_qspi_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS1012AFRWY=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x10000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1012afrwy_qspi_defconfig b/configs/ls1012afrwy_qspi_defconfig
index 312c655569db..5cd45156cd50 100644
--- a/configs/ls1012afrwy_qspi_defconfig
+++ b/configs/ls1012afrwy_qspi_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1012AFRWY=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x1D0000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_F is not set
@@ -27,6 +30,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1012a-frwy"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x401D0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
diff --git a/configs/ls1012afrwy_tfa_SECURE_BOOT_defconfig b/configs/ls1012afrwy_tfa_SECURE_BOOT_defconfig
index ff8758434a39..e64214052e7f 100644
--- a/configs/ls1012afrwy_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1012afrwy_tfa_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS1012AFRWY=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x10000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1012afrwy_tfa_defconfig b/configs/ls1012afrwy_tfa_defconfig
index 0a6d5c6d9f95..aae6fcac8cfe 100644
--- a/configs/ls1012afrwy_tfa_defconfig
+++ b/configs/ls1012afrwy_tfa_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1012AFRWY=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x1D0000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -27,6 +30,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1012a-frwy"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x401D0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
diff --git a/configs/ls1012aqds_qspi_defconfig b/configs/ls1012aqds_qspi_defconfig
index 29cb61163b53..c73878af0a2d 100644
--- a/configs/ls1012aqds_qspi_defconfig
+++ b/configs/ls1012aqds_qspi_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1012AQDS=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/ls1012aqds_tfa_SECURE_BOOT_defconfig b/configs/ls1012aqds_tfa_SECURE_BOOT_defconfig
index b032289ac6e2..e5500e1ecb46 100644
--- a/configs/ls1012aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1012aqds_tfa_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_NXP_ESBC=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1012aqds_tfa_defconfig b/configs/ls1012aqds_tfa_defconfig
index 8bf7c2c1b9e4..99e3b65f51c5 100644
--- a/configs/ls1012aqds_tfa_defconfig
+++ b/configs/ls1012aqds_tfa_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1012AQDS=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
diff --git a/configs/ls1012ardb_qspi_SECURE_BOOT_defconfig b/configs/ls1012ardb_qspi_SECURE_BOOT_defconfig
index c7f2780bf591..3cb4e9585f07 100644
--- a/configs/ls1012ardb_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1012ardb_qspi_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1012ardb_qspi_defconfig b/configs/ls1012ardb_qspi_defconfig
index b755a29c29b8..0b98d9ec38cb 100644
--- a/configs/ls1012ardb_qspi_defconfig
+++ b/configs/ls1012ardb_qspi_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1012ARDB=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_F is not set
@@ -29,6 +32,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1012a-rdb"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x40300000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
diff --git a/configs/ls1012ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1012ardb_tfa_SECURE_BOOT_defconfig
index 6001e193f0cb..ca855a1494de 100644
--- a/configs/ls1012ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1012ardb_tfa_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_NXP_ESBC=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1012ardb_tfa_defconfig b/configs/ls1012ardb_tfa_defconfig
index ce10c736e707..4c57430c0a94 100644
--- a/configs/ls1012ardb_tfa_defconfig
+++ b/configs/ls1012ardb_tfa_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1012ARDB=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -29,6 +32,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1012a-rdb"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x40500000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
diff --git a/configs/ls1021aiot_qspi_defconfig b/configs/ls1021aiot_qspi_defconfig
index f3be6c7bdf7a..842087661e33 100644
--- a/configs/ls1021aiot_qspi_defconfig
+++ b/configs/ls1021aiot_qspi_defconfig
@@ -1,7 +1,10 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021AIOT=y
 CONFIG_SYS_TEXT_BASE=0x40010000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_AHCI=y
 CONFIG_SYS_EXTRA_OPTIONS="QSPI_BOOT"
 CONFIG_MISC_INIT_R=y
diff --git a/configs/ls1021aiot_sdcard_defconfig b/configs/ls1021aiot_sdcard_defconfig
index 073e20f2d08e..55a17f080d64 100644
--- a/configs/ls1021aiot_sdcard_defconfig
+++ b/configs/ls1021aiot_sdcard_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1021AIOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021aqds_ddr4_nor_defconfig b/configs/ls1021aqds_ddr4_nor_defconfig
index 61855e9b7c81..ec67e9d86858 100644
--- a/configs/ls1021aqds_ddr4_nor_defconfig
+++ b/configs/ls1021aqds_ddr4_nor_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
@@ -33,6 +35,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-qds-duart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1021aqds_ddr4_nor_lpuart_defconfig b/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
index 213f2dfb5bf9..51aada33c7da 100644
--- a/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
+++ b/configs/ls1021aqds_ddr4_nor_lpuart_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
@@ -34,6 +36,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-qds-lpuart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1021aqds_nand_defconfig b/configs/ls1021aqds_nand_defconfig
index e761a7d8a168..a7f3fd15f0c4 100644
--- a/configs/ls1021aqds_nand_defconfig
+++ b/configs/ls1021aqds_nand_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021aqds_nor_SECURE_BOOT_defconfig b/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
index 8dcd414c153f..3e28fc11d61c 100644
--- a/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
+++ b/configs/ls1021aqds_nor_SECURE_BOOT_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1021AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/ls1021aqds_nor_defconfig b/configs/ls1021aqds_nor_defconfig
index 7f42e51263a5..7483b7121056 100644
--- a/configs/ls1021aqds_nor_defconfig
+++ b/configs/ls1021aqds_nor_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
@@ -33,6 +35,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-qds-duart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1021aqds_nor_lpuart_defconfig b/configs/ls1021aqds_nor_lpuart_defconfig
index b67c24cf6460..09aba6e3a188 100644
--- a/configs/ls1021aqds_nor_lpuart_defconfig
+++ b/configs/ls1021aqds_nor_lpuart_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
@@ -34,6 +36,7 @@ CONFIG_CMD_FAT=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-qds-lpuart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1021aqds_qspi_defconfig b/configs/ls1021aqds_qspi_defconfig
index c50f6488788c..6dfde1ad3ce9 100644
--- a/configs/ls1021aqds_qspi_defconfig
+++ b/configs/ls1021aqds_qspi_defconfig
@@ -1,7 +1,10 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021AQDS=y
 CONFIG_SYS_TEXT_BASE=0x40100000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls1021aqds_sdcard_ifc_defconfig b/configs/ls1021aqds_sdcard_ifc_defconfig
index 417519b9c9a1..b005affa14a9 100644
--- a/configs/ls1021aqds_sdcard_ifc_defconfig
+++ b/configs/ls1021aqds_sdcard_ifc_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021aqds_sdcard_qspi_defconfig b/configs/ls1021aqds_sdcard_qspi_defconfig
index 0de4a3a8ef04..811694f5cd2e 100644
--- a/configs/ls1021aqds_sdcard_qspi_defconfig
+++ b/configs/ls1021aqds_sdcard_qspi_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021atsn_qspi_defconfig b/configs/ls1021atsn_qspi_defconfig
index 129a2927e919..add2c8b390a3 100644
--- a/configs/ls1021atsn_qspi_defconfig
+++ b/configs/ls1021atsn_qspi_defconfig
@@ -1,7 +1,10 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021ATSN=y
 CONFIG_SYS_TEXT_BASE=0x40100000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/ls1021atsn_sdcard_defconfig b/configs/ls1021atsn_sdcard_defconfig
index df9eac2e1113..75b9af9ee175 100644
--- a/configs/ls1021atsn_sdcard_defconfig
+++ b/configs/ls1021atsn_sdcard_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021atwr_nor_SECURE_BOOT_defconfig b/configs/ls1021atwr_nor_SECURE_BOOT_defconfig
index 07708362080b..beb5ad9eed9a 100644
--- a/configs/ls1021atwr_nor_SECURE_BOOT_defconfig
+++ b/configs/ls1021atwr_nor_SECURE_BOOT_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1021ATWR=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1021atwr_nor_defconfig b/configs/ls1021atwr_nor_defconfig
index a5aaa9a35088..1032f15bb7cf 100644
--- a/configs/ls1021atwr_nor_defconfig
+++ b/configs/ls1021atwr_nor_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021ATWR=y
 CONFIG_SYS_TEXT_BASE=0x60100000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
@@ -28,6 +30,7 @@ CONFIG_CMD_BMP=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-twr-duart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1021atwr_nor_lpuart_defconfig b/configs/ls1021atwr_nor_lpuart_defconfig
index fe0f6c40525d..ed77989e7713 100644
--- a/configs/ls1021atwr_nor_lpuart_defconfig
+++ b/configs/ls1021atwr_nor_lpuart_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021ATWR=y
 CONFIG_SYS_TEXT_BASE=0x60100000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
@@ -30,6 +32,7 @@ CONFIG_CMD_BMP=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="ls1021a-twr-lpuart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1021atwr_qspi_defconfig b/configs/ls1021atwr_qspi_defconfig
index f36f0a2698b0..77a144b34b83 100644
--- a/configs/ls1021atwr_qspi_defconfig
+++ b/configs/ls1021atwr_qspi_defconfig
@@ -1,7 +1,10 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS1021ATWR=y
 CONFIG_SYS_TEXT_BASE=0x40100000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig b/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
index 44713a2968de..2098a7fbfd52 100644
--- a/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
+++ b/configs/ls1021atwr_sdcard_ifc_SECURE_BOOT_defconfig
@@ -7,6 +7,7 @@ CONFIG_NXP_ESBC=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x10000000
diff --git a/configs/ls1021atwr_sdcard_ifc_defconfig b/configs/ls1021atwr_sdcard_ifc_defconfig
index 2ddc40e7613b..18ff9fac3526 100644
--- a/configs/ls1021atwr_sdcard_ifc_defconfig
+++ b/configs/ls1021atwr_sdcard_ifc_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1021atwr_sdcard_qspi_defconfig b/configs/ls1021atwr_sdcard_qspi_defconfig
index 1b8cb3eb0d4b..74ab1225de15 100644
--- a/configs/ls1021atwr_sdcard_qspi_defconfig
+++ b/configs/ls1021atwr_sdcard_qspi_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig b/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
index e2fed911b106..b14dc5990a10 100644
--- a/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1028aqds_tfa_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_NXP_ESBC=y
 CONFIG_SYS_FSL_SDHC_CLK_DIV=1
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1028aqds_tfa_defconfig b/configs/ls1028aqds_tfa_defconfig
index 67c9a82bcd6a..1875c0a3ebf3 100644
--- a/configs/ls1028aqds_tfa_defconfig
+++ b/configs/ls1028aqds_tfa_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1028AQDS=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_SYS_FSL_SDHC_CLK_DIV=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -27,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1028a-qds"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x20500000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_DM=y
diff --git a/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
index 6b87c57ec332..a8e878f3566b 100644
--- a/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1028ardb_tfa_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_NXP_ESBC=y
 CONFIG_SYS_FSL_SDHC_CLK_DIV=1
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1028ardb_tfa_defconfig b/configs/ls1028ardb_tfa_defconfig
index 1fd38ca3d482..e01bf2e1252e 100644
--- a/configs/ls1028ardb_tfa_defconfig
+++ b/configs/ls1028ardb_tfa_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1028ARDB=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_SYS_FSL_SDHC_CLK_DIV=1
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -27,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1028a-rdb"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x20500000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_DM=y
diff --git a/configs/ls1043aqds_defconfig b/configs/ls1043aqds_defconfig
index 65b2dd18f94f..d0d384d7cee3 100644
--- a/configs/ls1043aqds_defconfig
+++ b/configs/ls1043aqds_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1043AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
@@ -29,6 +31,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=60000000.nor:2m@0x100000(nor_bank0_uboot),40m@
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1043a-qds-duart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1043aqds_lpuart_defconfig b/configs/ls1043aqds_lpuart_defconfig
index 51fc761f459c..ec1712be9470 100644
--- a/configs/ls1043aqds_lpuart_defconfig
+++ b/configs/ls1043aqds_lpuart_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1043AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
@@ -30,6 +32,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=60000000.nor:2m@0x100000(nor_bank0_uboot),40m@
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1043a-qds-lpuart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1043aqds_nand_defconfig b/configs/ls1043aqds_nand_defconfig
index c3baaf5cc95d..6b3bd428877e 100644
--- a/configs/ls1043aqds_nand_defconfig
+++ b/configs/ls1043aqds_nand_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043aqds_nor_ddr3_defconfig b/configs/ls1043aqds_nor_ddr3_defconfig
index 65734f5cda7a..6a4fc87e0788 100644
--- a/configs/ls1043aqds_nor_ddr3_defconfig
+++ b/configs/ls1043aqds_nor_ddr3_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1043AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
@@ -29,6 +31,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=60000000.nor:2m@0x100000(nor_bank0_uboot),40m@
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1043a-qds-duart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1043aqds_qspi_defconfig b/configs/ls1043aqds_qspi_defconfig
index c4d7c45a1cbb..36e6f4cce48e 100644
--- a/configs/ls1043aqds_qspi_defconfig
+++ b/configs/ls1043aqds_qspi_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1043AQDS=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls1043aqds_sdcard_ifc_defconfig b/configs/ls1043aqds_sdcard_ifc_defconfig
index c4a7932e4d7d..03cae8ab2027 100644
--- a/configs/ls1043aqds_sdcard_ifc_defconfig
+++ b/configs/ls1043aqds_sdcard_ifc_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043aqds_sdcard_qspi_defconfig b/configs/ls1043aqds_sdcard_qspi_defconfig
index a7de15c8c6c7..3ee00a87eb27 100644
--- a/configs/ls1043aqds_sdcard_qspi_defconfig
+++ b/configs/ls1043aqds_sdcard_qspi_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1043aqds_tfa_SECURE_BOOT_defconfig b/configs/ls1043aqds_tfa_SECURE_BOOT_defconfig
index 9883d1683d7e..b3102ab6c18f 100644
--- a/configs/ls1043aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1043aqds_tfa_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS1043AQDS=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1043aqds_tfa_defconfig b/configs/ls1043aqds_tfa_defconfig
index b49ac2cb5d0c..e0e35e77af40 100644
--- a/configs/ls1043aqds_tfa_defconfig
+++ b/configs/ls1043aqds_tfa_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1043AQDS=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -36,6 +39,7 @@ CONFIG_ENV_IS_IN_NAND=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
 CONFIG_ENV_SPI_BUS=0
+CONFIG_ENV_ADDR=0x60500000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1043ardb_SECURE_BOOT_defconfig b/configs/ls1043ardb_SECURE_BOOT_defconfig
index 0d9d2dd490af..99599a82deba 100644
--- a/configs/ls1043ardb_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS1043ARDB=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls1043ardb_defconfig b/configs/ls1043ardb_defconfig
index 49d498ae80e2..0ca215f57d82 100644
--- a/configs/ls1043ardb_defconfig
+++ b/configs/ls1043ardb_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1043ARDB=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_OF_BOARD_SETUP=y
@@ -23,6 +25,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=60000000.nor:2m@0x100000(nor_bank0_uboot),40m@
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1043a-rdb"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_DM_MMC=y
diff --git a/configs/ls1043ardb_nand_SECURE_BOOT_defconfig b/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
index 07e29df443a5..b14f538d8d7e 100644
--- a/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_nand_SECURE_BOOT_defconfig
@@ -7,6 +7,7 @@ CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x10000000
diff --git a/configs/ls1043ardb_nand_defconfig b/configs/ls1043ardb_nand_defconfig
index 423080605c3b..fd4208216e06 100644
--- a/configs/ls1043ardb_nand_defconfig
+++ b/configs/ls1043ardb_nand_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x10000000
diff --git a/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig b/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
index 5d54b03bcfba..3ab6c9eab380 100644
--- a/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_sdcard_SECURE_BOOT_defconfig
@@ -8,6 +8,7 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x10000000
diff --git a/configs/ls1043ardb_sdcard_defconfig b/configs/ls1043ardb_sdcard_defconfig
index c201513858b7..a0ffcbd73496 100644
--- a/configs/ls1043ardb_sdcard_defconfig
+++ b/configs/ls1043ardb_sdcard_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x10000000
diff --git a/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
index 187d493336dd..af6a40b2a505 100644
--- a/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1043ardb_tfa_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS1043ARDB=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1043ardb_tfa_defconfig b/configs/ls1043ardb_tfa_defconfig
index 75bb52ad4ad8..d64f40586324 100644
--- a/configs/ls1043ardb_tfa_defconfig
+++ b/configs/ls1043ardb_tfa_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1043ARDB=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_DISTRO_DEFAULTS=y
@@ -27,6 +30,7 @@ CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1043a-rdb"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_NAND=y
+CONFIG_ENV_ADDR=0x60500000
 CONFIG_DM=y
 CONFIG_FSL_CAAM=y
 CONFIG_DM_MMC=y
diff --git a/configs/ls1046afrwy_tfa_defconfig b/configs/ls1046afrwy_tfa_defconfig
index 3cabb52ef012..0a7ff78f2404 100644
--- a/configs/ls1046afrwy_tfa_defconfig
+++ b/configs/ls1046afrwy_tfa_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1046AFRWY=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -27,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1046a-frwy"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x40500000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1046aqds_SECURE_BOOT_defconfig b/configs/ls1046aqds_SECURE_BOOT_defconfig
index c39b880456a2..146457a60853 100644
--- a/configs/ls1046aqds_SECURE_BOOT_defconfig
+++ b/configs/ls1046aqds_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS1046AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1046aqds_defconfig b/configs/ls1046aqds_defconfig
index d82d786be28f..5f962804eaa1 100644
--- a/configs/ls1046aqds_defconfig
+++ b/configs/ls1046aqds_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1046AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
@@ -29,6 +31,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=60000000.nor:2m@0x100000(nor_bank0_uboot),40m@
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1046a-qds-duart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1046aqds_lpuart_defconfig b/configs/ls1046aqds_lpuart_defconfig
index d3fb8077ef8e..2b212b401442 100644
--- a/configs/ls1046aqds_lpuart_defconfig
+++ b/configs/ls1046aqds_lpuart_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1046AQDS=y
 CONFIG_SYS_TEXT_BASE=0x60100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
@@ -30,6 +32,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=60000000.nor:2m@0x100000(nor_bank0_uboot),40m@
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1046a-qds-lpuart"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x60300000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1046aqds_nand_defconfig b/configs/ls1046aqds_nand_defconfig
index ee0b8fd99737..02ebb7f51be5 100644
--- a/configs/ls1046aqds_nand_defconfig
+++ b/configs/ls1046aqds_nand_defconfig
@@ -3,6 +3,8 @@ CONFIG_TARGET_LS1046AQDS=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046aqds_qspi_defconfig b/configs/ls1046aqds_qspi_defconfig
index 602c31612cc6..7339aba903ea 100644
--- a/configs/ls1046aqds_qspi_defconfig
+++ b/configs/ls1046aqds_qspi_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1046AQDS=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls1046aqds_sdcard_ifc_defconfig b/configs/ls1046aqds_sdcard_ifc_defconfig
index 6d5220850370..b1dad99ba29b 100644
--- a/configs/ls1046aqds_sdcard_ifc_defconfig
+++ b/configs/ls1046aqds_sdcard_ifc_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046aqds_sdcard_qspi_defconfig b/configs/ls1046aqds_sdcard_qspi_defconfig
index 3a169d35cf60..88ed9b2aff9c 100644
--- a/configs/ls1046aqds_sdcard_qspi_defconfig
+++ b/configs/ls1046aqds_sdcard_qspi_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig b/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
index a8a260fb0b58..d4c6b549c0b4 100644
--- a/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1046aqds_tfa_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS1046AQDS=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1046aqds_tfa_defconfig b/configs/ls1046aqds_tfa_defconfig
index 9033f424f9c9..3b6e561aa4a1 100644
--- a/configs/ls1046aqds_tfa_defconfig
+++ b/configs/ls1046aqds_tfa_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1046AQDS=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -36,6 +39,7 @@ CONFIG_ENV_IS_IN_NAND=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_BUS=y
 CONFIG_ENV_SPI_BUS=0
+CONFIG_ENV_ADDR=0x60500000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1046ardb_emmc_defconfig b/configs/ls1046ardb_emmc_defconfig
index 2f921f744584..7df296833ab1 100644
--- a/configs/ls1046ardb_emmc_defconfig
+++ b/configs/ls1046ardb_emmc_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046ardb_qspi_SECURE_BOOT_defconfig b/configs/ls1046ardb_qspi_SECURE_BOOT_defconfig
index 0afd2821a055..92a4d506f6cf 100644
--- a/configs/ls1046ardb_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1046ardb_qspi_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1046ardb_qspi_defconfig b/configs/ls1046ardb_qspi_defconfig
index 89217320f7f0..391b2d06dbea 100644
--- a/configs/ls1046ardb_qspi_defconfig
+++ b/configs/ls1046ardb_qspi_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1046ARDB=y
 CONFIG_SYS_TEXT_BASE=0x40100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls1046ardb_qspi_spl_defconfig b/configs/ls1046ardb_qspi_spl_defconfig
index ba851b37a13b..62edfb111a3e 100644
--- a/configs/ls1046ardb_qspi_spl_defconfig
+++ b/configs/ls1046ardb_qspi_spl_defconfig
@@ -8,8 +8,11 @@ CONFIG_SPL_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_SPL_TEXT_BASE=0x10000000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig b/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
index da683c230b17..b10094530228 100644
--- a/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
+++ b/configs/ls1046ardb_sdcard_SECURE_BOOT_defconfig
@@ -8,6 +8,7 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x10000000
diff --git a/configs/ls1046ardb_sdcard_defconfig b/configs/ls1046ardb_sdcard_defconfig
index 5a647f29b99e..4d0b04afc75a 100644
--- a/configs/ls1046ardb_sdcard_defconfig
+++ b/configs/ls1046ardb_sdcard_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
index b6d22fa75a3a..534b0f6ac545 100644
--- a/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1046ardb_tfa_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_NXP_ESBC=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1046ardb_tfa_defconfig b/configs/ls1046ardb_tfa_defconfig
index d183cf74acb5..265e1a0a7a2e 100644
--- a/configs/ls1046ardb_tfa_defconfig
+++ b/configs/ls1046ardb_tfa_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1046ARDB=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -27,6 +30,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1046a-rdb"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x40500000
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
 CONFIG_FSL_CAAM=y
diff --git a/configs/ls1088aqds_defconfig b/configs/ls1088aqds_defconfig
index 56af5261e384..2cd10b80f7c4 100644
--- a/configs/ls1088aqds_defconfig
+++ b/configs/ls1088aqds_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS1088AQDS=y
 CONFIG_SYS_TEXT_BASE=0x30100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_FIT_VERBOSE=y
@@ -26,6 +28,7 @@ CONFIG_MP=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1088a-qds"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x80300000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/ls1088aqds_qspi_SECURE_BOOT_defconfig b/configs/ls1088aqds_qspi_SECURE_BOOT_defconfig
index 40163a4af1e2..e34f215c3d1d 100644
--- a/configs/ls1088aqds_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1088aqds_qspi_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x20100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1088aqds_qspi_defconfig b/configs/ls1088aqds_qspi_defconfig
index 8051e89796ba..087d2cb2232c 100644
--- a/configs/ls1088aqds_qspi_defconfig
+++ b/configs/ls1088aqds_qspi_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1088AQDS=y
 CONFIG_SYS_TEXT_BASE=0x20100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_F is not set
@@ -26,6 +29,7 @@ CONFIG_MP=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1088a-qds"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x20300000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/ls1088aqds_sdcard_ifc_defconfig b/configs/ls1088aqds_sdcard_ifc_defconfig
index ccbdafa06253..8f13526fbf41 100644
--- a/configs/ls1088aqds_sdcard_ifc_defconfig
+++ b/configs/ls1088aqds_sdcard_ifc_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088aqds_sdcard_qspi_defconfig b/configs/ls1088aqds_sdcard_qspi_defconfig
index d6990b799579..25503aa236e1 100644
--- a/configs/ls1088aqds_sdcard_qspi_defconfig
+++ b/configs/ls1088aqds_sdcard_qspi_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088aqds_tfa_defconfig b/configs/ls1088aqds_tfa_defconfig
index 22bf8b849eee..dd25f6c200ca 100644
--- a/configs/ls1088aqds_tfa_defconfig
+++ b/configs/ls1088aqds_tfa_defconfig
@@ -4,7 +4,10 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -31,6 +34,7 @@ CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x80500000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/ls1088ardb_qspi_SECURE_BOOT_defconfig b/configs/ls1088ardb_qspi_SECURE_BOOT_defconfig
index 0658b4f1ebd6..0f668aed83b5 100644
--- a/configs/ls1088ardb_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1088ardb_qspi_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x20100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/ls1088ardb_qspi_defconfig b/configs/ls1088ardb_qspi_defconfig
index b3582e33a73e..33bec3042aef 100644
--- a/configs/ls1088ardb_qspi_defconfig
+++ b/configs/ls1088ardb_qspi_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS1088ARDB=y
 CONFIG_SYS_TEXT_BASE=0x20100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_F is not set
@@ -27,6 +30,7 @@ CONFIG_MP=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1088a-rdb"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x20300000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig b/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
index 267dad3c5d23..f41158a3f0e8 100644
--- a/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls1088ardb_sdcard_qspi_SECURE_BOOT_defconfig
@@ -8,6 +8,7 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x1800a000
diff --git a/configs/ls1088ardb_sdcard_qspi_defconfig b/configs/ls1088ardb_sdcard_qspi_defconfig
index 0d3668c74b7e..73196d2aa922 100644
--- a/configs/ls1088ardb_sdcard_qspi_defconfig
+++ b/configs/ls1088ardb_sdcard_qspi_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig b/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
index e4c61dc82e0d..c5b803e6f2f1 100644
--- a/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls1088ardb_tfa_SECURE_BOOT_defconfig
@@ -5,6 +5,7 @@ CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_NXP_ESBC=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls1088ardb_tfa_defconfig b/configs/ls1088ardb_tfa_defconfig
index 53882dd331d3..9c8a719c29b2 100644
--- a/configs/ls1088ardb_tfa_defconfig
+++ b/configs/ls1088ardb_tfa_defconfig
@@ -4,7 +4,10 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -30,6 +33,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls1088a-rdb"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x80500000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/ls2080a_emu_defconfig b/configs/ls2080a_emu_defconfig
index f5835e9aca88..7927e3838fd5 100644
--- a/configs/ls2080a_emu_defconfig
+++ b/configs/ls2080a_emu_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS2080A_EMU=y
 CONFIG_SYS_TEXT_BASE=0x30100000
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_IDENT_STRING=" LS2080A-EMU"
 CONFIG_FIT=y
diff --git a/configs/ls2080a_simu_defconfig b/configs/ls2080a_simu_defconfig
index c4ee87e62e5b..1845236cc33f 100644
--- a/configs/ls2080a_simu_defconfig
+++ b/configs/ls2080a_simu_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS2080A_SIMU=y
 CONFIG_SYS_TEXT_BASE=0x30100000
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_IDENT_STRING=" LS2080A-SIMU"
 CONFIG_FIT=y
diff --git a/configs/ls2080aqds_SECURE_BOOT_defconfig b/configs/ls2080aqds_SECURE_BOOT_defconfig
index 81169bf20fe9..197c796377fe 100644
--- a/configs/ls2080aqds_SECURE_BOOT_defconfig
+++ b/configs/ls2080aqds_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS2080AQDS=y
 CONFIG_SYS_TEXT_BASE=0x30100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/ls2080aqds_defconfig b/configs/ls2080aqds_defconfig
index d2b545f0dee2..de0c3d1d778b 100644
--- a/configs/ls2080aqds_defconfig
+++ b/configs/ls2080aqds_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS2080AQDS=y
 CONFIG_SYS_TEXT_BASE=0x30100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_FIT_VERBOSE=y
@@ -29,6 +31,7 @@ CONFIG_MP=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls2080a-qds"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x80300000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
diff --git a/configs/ls2080aqds_nand_defconfig b/configs/ls2080aqds_nand_defconfig
index 21a087eb3209..17777543872f 100644
--- a/configs/ls2080aqds_nand_defconfig
+++ b/configs/ls2080aqds_nand_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2080aqds_qspi_defconfig b/configs/ls2080aqds_qspi_defconfig
index 47d0e7b7ca58..ac0a18da1ab5 100644
--- a/configs/ls2080aqds_qspi_defconfig
+++ b/configs/ls2080aqds_qspi_defconfig
@@ -1,7 +1,10 @@
 CONFIG_ARM=y
 CONFIG_TARGET_LS2080AQDS=y
 CONFIG_SYS_TEXT_BASE=0x20100000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=3
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls2080aqds_sdcard_defconfig b/configs/ls2080aqds_sdcard_defconfig
index 0280705075b7..dca47b5daad3 100644
--- a/configs/ls2080aqds_sdcard_defconfig
+++ b/configs/ls2080aqds_sdcard_defconfig
@@ -7,6 +7,8 @@ CONFIG_FSL_LS_PPA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2080ardb_SECURE_BOOT_defconfig b/configs/ls2080ardb_SECURE_BOOT_defconfig
index 99f3dd2bf3ad..d231c235f023 100644
--- a/configs/ls2080ardb_SECURE_BOOT_defconfig
+++ b/configs/ls2080ardb_SECURE_BOOT_defconfig
@@ -3,6 +3,7 @@ CONFIG_TARGET_LS2080ARDB=y
 CONFIG_SYS_TEXT_BASE=0x30100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/ls2080ardb_defconfig b/configs/ls2080ardb_defconfig
index 7943d91e6c54..484030495506 100644
--- a/configs/ls2080ardb_defconfig
+++ b/configs/ls2080ardb_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS2080ARDB=y
 CONFIG_SYS_TEXT_BASE=0x30100000
 CONFIG_FSL_LS_PPA=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_FIT_VERBOSE=y
@@ -29,6 +31,7 @@ CONFIG_MP=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="fsl-ls2080a-rdb"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x80300000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
diff --git a/configs/ls2080ardb_nand_defconfig b/configs/ls2080ardb_nand_defconfig
index 5dd652269131..49bdd587ac84 100644
--- a/configs/ls2080ardb_nand_defconfig
+++ b/configs/ls2080ardb_nand_defconfig
@@ -5,6 +5,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x200000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_AHCI=y
diff --git a/configs/ls2081ardb_defconfig b/configs/ls2081ardb_defconfig
index 35fcedf4c0d3..01288a7be7f3 100644
--- a/configs/ls2081ardb_defconfig
+++ b/configs/ls2081ardb_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS2081ARDB=y
 CONFIG_SYS_TEXT_BASE=0x20100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=3
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls2088aqds_tfa_defconfig b/configs/ls2088aqds_tfa_defconfig
index 2c8f08cf4c7f..f0ef704309ee 100644
--- a/configs/ls2088aqds_tfa_defconfig
+++ b/configs/ls2088aqds_tfa_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_TARGET_LS2080AQDS=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=3
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -32,6 +35,7 @@ CONFIG_DEFAULT_DEVICE_TREE="fsl-ls2080a-qds"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x80500000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
diff --git a/configs/ls2088ardb_qspi_SECURE_BOOT_defconfig b/configs/ls2088ardb_qspi_SECURE_BOOT_defconfig
index d8059ef0357f..8894df5d31b0 100644
--- a/configs/ls2088ardb_qspi_SECURE_BOOT_defconfig
+++ b/configs/ls2088ardb_qspi_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x20100000
 CONFIG_NXP_ESBC=y
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/ls2088ardb_qspi_defconfig b/configs/ls2088ardb_qspi_defconfig
index 1063ef0f69ae..d230000e1925 100644
--- a/configs/ls2088ardb_qspi_defconfig
+++ b/configs/ls2088ardb_qspi_defconfig
@@ -3,7 +3,10 @@ CONFIG_TARGET_LS2080ARDB=y
 CONFIG_SYS_TEXT_BASE=0x20100000
 CONFIG_FSL_LS_PPA=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=3
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig b/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
index 88f2ce14e387..db253d1ce957 100644
--- a/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/ls2088ardb_tfa_SECURE_BOOT_defconfig
@@ -5,6 +5,7 @@ CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_NXP_ESBC=y
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/ls2088ardb_tfa_defconfig b/configs/ls2088ardb_tfa_defconfig
index 9fed7935bfd4..1730c9a5eab1 100644
--- a/configs/ls2088ardb_tfa_defconfig
+++ b/configs/ls2088ardb_tfa_defconfig
@@ -4,7 +4,10 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_QSPI_AHB_INIT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=3
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
 CONFIG_AHCI=y
@@ -33,6 +36,7 @@ CONFIG_DEFAULT_DEVICE_TREE="fsl-ls2088a-rdb-qspi"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x80500000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
 CONFIG_SATA_CEVA=y
diff --git a/configs/lschlv2_defconfig b/configs/lschlv2_defconfig
index afd64288ac1e..35190cf632fa 100644
--- a/configs/lschlv2_defconfig
+++ b/configs/lschlv2_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_LSXL=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" LS-CHLv2"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="LSCHLV2"
diff --git a/configs/lsxhl_defconfig b/configs/lsxhl_defconfig
index f3f368d99dea..74004fb29514 100644
--- a/configs/lsxhl_defconfig
+++ b/configs/lsxhl_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_LSXL=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" LS-XHL"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="LSXHL"
diff --git a/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig b/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
index 5c6a0b5af017..4ab7582fc7b9 100644
--- a/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
+++ b/configs/lx2160aqds_tfa_SECURE_BOOT_defconfig
@@ -4,6 +4,7 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_NXP_ESBC=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/lx2160aqds_tfa_defconfig b/configs/lx2160aqds_tfa_defconfig
index f50bc027cb3b..a35f1cc38d5e 100644
--- a/configs/lx2160aqds_tfa_defconfig
+++ b/configs/lx2160aqds_tfa_defconfig
@@ -3,6 +3,8 @@ CONFIG_TARGET_LX2160AQDS=y
 CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig b/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
index 2e2d888009d7..87c54b00f670 100644
--- a/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
+++ b/configs/lx2160ardb_tfa_SECURE_BOOT_defconfig
@@ -5,6 +5,7 @@ CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_NXP_ESBC=y
 CONFIG_EMC2305=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/lx2160ardb_tfa_defconfig b/configs/lx2160ardb_tfa_defconfig
index 632b52e548bd..18057b20b19a 100644
--- a/configs/lx2160ardb_tfa_defconfig
+++ b/configs/lx2160ardb_tfa_defconfig
@@ -4,6 +4,8 @@ CONFIG_TFABOOT=y
 CONFIG_SYS_TEXT_BASE=0x82000000
 CONFIG_SYS_MALLOC_F_LEN=0x6000
 CONFIG_EMC2305=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x500000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
 CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
diff --git a/configs/m53menlo_defconfig b/configs/m53menlo_defconfig
index 0a2cb4eb3550..5401cc945492 100644
--- a/configs/m53menlo_defconfig
+++ b/configs/m53menlo_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x8000
 CONFIG_TARGET_M53MENLO=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SYS_BOOTCOUNT_SINGLEWORD=y
@@ -57,6 +59,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx53-m53menlo"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x180000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_BOOTCOUNT_LIMIT=y
diff --git a/configs/malta64_defconfig b/configs/malta64_defconfig
index 10d2e55f5acf..e5a19a6e546e 100644
--- a/configs/malta64_defconfig
+++ b/configs/malta64_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xFFFFFFFFBE000000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_MALTA=y
 CONFIG_CPU_MIPS64_R2=y
 CONFIG_MISC_INIT_R=y
@@ -20,6 +22,7 @@ CONFIG_CMD_DATE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="mti,malta"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFFFFFFBE3E0000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/malta64el_defconfig b/configs/malta64el_defconfig
index 6759d1817642..e9de5bea6e1f 100644
--- a/configs/malta64el_defconfig
+++ b/configs/malta64el_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xFFFFFFFFBE000000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_MALTA=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS64_R2=y
@@ -21,6 +23,7 @@ CONFIG_CMD_DATE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="mti,malta"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFFFFFFBE3E0000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/malta_defconfig b/configs/malta_defconfig
index 6b6869dce6d1..2b43818c81ff 100644
--- a/configs/malta_defconfig
+++ b/configs/malta_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xBE000000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_MALTA=y
 CONFIG_MISC_INIT_R=y
 CONFIG_BOARD_EARLY_INIT_F=y
@@ -19,6 +21,7 @@ CONFIG_CMD_DATE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="mti,malta"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBE3E0000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/maltael_defconfig b/configs/maltael_defconfig
index 8dca7ff32f76..ec984b5a356e 100644
--- a/configs/maltael_defconfig
+++ b/configs/maltael_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xBE000000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_MALTA=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 CONFIG_MISC_INIT_R=y
@@ -20,6 +22,7 @@ CONFIG_CMD_DATE=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="mti,malta"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBE3E0000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/marsboard_defconfig b/configs/marsboard_defconfig
index e80af16a56d7..25e52b487e51 100644
--- a/configs/marsboard_defconfig
+++ b/configs/marsboard_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_EMBESTMX6BOARDS=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/boundary/nitrogen6x/nitrogen6q.cfg,MX6Q,DDR_MB=1024"
 CONFIG_BOOTCOMMAND="run finduuid; run distro_bootcmd"
diff --git a/configs/maxbcm_defconfig b/configs/maxbcm_defconfig
index c3f690563f38..a75c4b3f6bf9 100644
--- a/configs/maxbcm_defconfig
+++ b/configs/maxbcm_defconfig
@@ -7,10 +7,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_MAXBCM=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/mccmon6_nor_defconfig b/configs/mccmon6_nor_defconfig
index d46c996709d9..c92d50ff21d2 100644
--- a/configs/mccmon6_nor_defconfig
+++ b/configs/mccmon6_nor_defconfig
@@ -5,8 +5,10 @@ CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MCCMON6=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x20000
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
@@ -40,6 +42,8 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-mccmon6"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0x8040000
+CONFIG_ENV_ADDR_REDUND=0x8060000
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_I2C_SET_DEFAULT_BUS_NUM=y
 CONFIG_SYS_I2C_MXC=y
diff --git a/configs/mccmon6_sd_defconfig b/configs/mccmon6_sd_defconfig
index 196c7b3f99c7..dc159942fc4c 100644
--- a/configs/mccmon6_sd_defconfig
+++ b/configs/mccmon6_sd_defconfig
@@ -6,8 +6,10 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MCCMON6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x20000
 # CONFIG_CMD_BMODE is not set
 CONFIG_SPL_TEXT_BASE=0x00908000
 CONFIG_DISTRO_DEFAULTS=y
@@ -38,6 +40,8 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-mccmon6"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0x8040000
+CONFIG_ENV_ADDR_REDUND=0x8060000
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_I2C_SET_DEFAULT_BUS_NUM=y
 CONFIG_SYS_I2C_MXC=y
diff --git a/configs/medcom-wide_defconfig b/configs/medcom-wide_defconfig
index 74d4377f88e3..0117f87dd5be 100644
--- a/configs/medcom-wide_defconfig
+++ b/configs/medcom-wide_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x1FFE0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA20=y
 CONFIG_TARGET_MEDCOM_WIDE=y
diff --git a/configs/meerkat96_defconfig b/configs/meerkat96_defconfig
index fab1b41be092..537edb1f41a4 100644
--- a/configs/meerkat96_defconfig
+++ b/configs/meerkat96_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARCH_MX7=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_MEERKAT96=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 # CONFIG_ARMV7_VIRT is not set
diff --git a/configs/mgcoge3un_defconfig b/configs/mgcoge3un_defconfig
index 944180631c82..cae6645832e6 100644
--- a/configs/mgcoge3un_defconfig
+++ b/configs/mgcoge3un_defconfig
@@ -6,6 +6,8 @@ CONFIG_SYS_TEXT_BASE=0x07d00000
 CONFIG_TARGET_KM_KIRKWOOD=y
 CONFIG_PIGGY_MAC_ADRESS_OFFSET=3
 CONFIG_KM_PIGGY4_88E6061=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_IDENT_STRING="\nKeymile COGE3UN"
 CONFIG_SYS_EXTRA_OPTIONS="KM_MGCOGE3UN"
 CONFIG_MISC_INIT_R=y
@@ -34,6 +36,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="kirkwood-km_kirkwood"
 CONFIG_ENV_IS_IN_EEPROM=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x2000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_RAM=y
diff --git a/configs/microblaze-generic_defconfig b/configs/microblaze-generic_defconfig
index 7d2859c5c376..3e6698682208 100644
--- a/configs/microblaze-generic_defconfig
+++ b/configs/microblaze-generic_defconfig
@@ -3,6 +3,7 @@ CONFIG_SYS_TEXT_BASE=0x29000000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_TARGET_MICROBLAZE_GENERIC=y
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 3c54877fa4f7..0bc1cc2de023 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -1,4 +1,5 @@
 CONFIG_RISCV=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_TARGET_MICROCHIP_ICICLE=y
 CONFIG_ARCH_RV64I=y
 CONFIG_NR_CPUS=5
diff --git a/configs/minnowmax_defconfig b/configs/minnowmax_defconfig
index 724240f7e87f..4280fb96458e 100644
--- a/configs/minnowmax_defconfig
+++ b/configs/minnowmax_defconfig
@@ -1,8 +1,11 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x6EF000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_INTEL=y
 CONFIG_TARGET_MINNOWMAX=y
 CONFIG_INTERNAL_UART=y
diff --git a/configs/miqi-rk3288_defconfig b/configs/miqi-rk3288_defconfig
index b4d213d70c5d..76622a8bb904 100644
--- a/configs/miqi-rk3288_defconfig
+++ b/configs/miqi-rk3288_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_ROCKCHIP_RK3288=y
 CONFIG_SPL_ROCKCHIP_BACK_TO_BROM=y
 CONFIG_TARGET_MIQI_RK3288=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff690000
diff --git a/configs/mpc8308_p1m_defconfig b/configs/mpc8308_p1m_defconfig
index 68d20b1f55f5..7dd8808b41ee 100644
--- a/configs/mpc8308_p1m_defconfig
+++ b/configs/mpc8308_p1m_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFC000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
 CONFIG_TARGET_MPC8308_P1M=y
@@ -108,6 +110,8 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFC060000
+CONFIG_ENV_ADDR_REDUND=0xFC080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/mscc_jr2_defconfig b/configs/mscc_jr2_defconfig
index 42331eafb2e7..04d5256f5dbe 100644
--- a/configs/mscc_jr2_defconfig
+++ b/configs/mscc_jr2_defconfig
@@ -1,9 +1,12 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x40000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x70100000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARCH_MSCC=y
 CONFIG_SOC_JR2=y
 CONFIG_SYS_LITTLE_ENDIAN=y
@@ -41,6 +44,7 @@ CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x140000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
diff --git a/configs/mscc_luton_defconfig b/configs/mscc_luton_defconfig
index 7705ddc16835..1348548e43c6 100644
--- a/configs/mscc_luton_defconfig
+++ b/configs/mscc_luton_defconfig
@@ -1,9 +1,12 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x40000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x70100000
 CONFIG_DEBUG_UART_CLOCK=208333333
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARCH_MSCC=y
 CONFIG_SOC_LUTON=y
 CONFIG_DDRTYPE_MT47H128M8HQ=y
@@ -44,6 +47,7 @@ CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x140000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
diff --git a/configs/mscc_ocelot_defconfig b/configs/mscc_ocelot_defconfig
index bcc77d1fc584..e68ff0eb294f 100644
--- a/configs/mscc_ocelot_defconfig
+++ b/configs/mscc_ocelot_defconfig
@@ -1,9 +1,12 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x40000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_DEBUG_UART_BOARD_INIT=y
 CONFIG_DEBUG_UART_BASE=0x70100000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARCH_MSCC=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 CONFIG_DEBUG_UART=y
@@ -43,6 +46,7 @@ CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x140000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
diff --git a/configs/mscc_serval_defconfig b/configs/mscc_serval_defconfig
index e4368081d3c3..54d89d3dcd8c 100644
--- a/configs/mscc_serval_defconfig
+++ b/configs/mscc_serval_defconfig
@@ -1,6 +1,9 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x40000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARCH_MSCC=y
 CONFIG_SOC_SERVAL=y
 CONFIG_DDRTYPE_H5TQ1G63BFA=y
@@ -38,6 +41,7 @@ CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x140000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
diff --git a/configs/mscc_servalt_defconfig b/configs/mscc_servalt_defconfig
index e672bf4be708..26cfb5e56297 100644
--- a/configs/mscc_servalt_defconfig
+++ b/configs/mscc_servalt_defconfig
@@ -1,6 +1,9 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x40000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_ARCH_MSCC=y
 CONFIG_SOC_SERVALT=y
 CONFIG_SYS_LITTLE_ENDIAN=y
@@ -36,6 +39,7 @@ CONFIG_DTB_RESELECT=y
 CONFIG_MULTI_DTB_FIT=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x140000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_CLK=y
diff --git a/configs/mt7623n_bpir2_defconfig b/configs/mt7623n_bpir2_defconfig
index 18c3a2bc5924..384822db1f46 100644
--- a/configs/mt7623n_bpir2_defconfig
+++ b/configs/mt7623n_bpir2_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_MEDIATEK=y
 CONFIG_SYS_TEXT_BASE=0x81e00000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/mt7629_rfb_defconfig b/configs/mt7629_rfb_defconfig
index 5eb2c0dd481a..6bb090e941e2 100644
--- a/configs/mt7629_rfb_defconfig
+++ b/configs/mt7629_rfb_defconfig
@@ -7,6 +7,7 @@ CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_MT7629=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL_TEXT_BASE=0x201000
 CONFIG_FIT=y
diff --git a/configs/mvebu_db-88f3720_defconfig b/configs/mvebu_db-88f3720_defconfig
index 8c782d9b20e6..fe50ce941638 100644
--- a/configs/mvebu_db-88f3720_defconfig
+++ b/configs/mvebu_db-88f3720_defconfig
@@ -4,9 +4,12 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_MVEBU_ARMADA_37XX=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=25804800
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_DEBUG_UART=y
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/mvebu_db_armada8k_defconfig b/configs/mvebu_db_armada8k_defconfig
index 5583ff6763bb..bf50a1c2f265 100644
--- a/configs/mvebu_db_armada8k_defconfig
+++ b/configs/mvebu_db_armada8k_defconfig
@@ -4,9 +4,12 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_MVEBU_ARMADA_8K=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DEBUG_UART_BASE=0xf0512000
 CONFIG_DEBUG_UART_CLOCK=200000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_DEBUG_UART=y
 CONFIG_AHCI=y
diff --git a/configs/mvebu_espressobin-88f3720_defconfig b/configs/mvebu_espressobin-88f3720_defconfig
index 2c456860f396..f2a5fb3f6557 100644
--- a/configs/mvebu_espressobin-88f3720_defconfig
+++ b/configs/mvebu_espressobin-88f3720_defconfig
@@ -4,9 +4,12 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_MVEBU_ARMADA_37XX=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=25804800
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_DEBUG_UART=y
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/mvebu_mcbin-88f8040_defconfig b/configs/mvebu_mcbin-88f8040_defconfig
index 41107ca5441e..3e914f1266fd 100644
--- a/configs/mvebu_mcbin-88f8040_defconfig
+++ b/configs/mvebu_mcbin-88f8040_defconfig
@@ -4,9 +4,12 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_MVEBU_ARMADA_8K=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DEBUG_UART_BASE=0xf0512000
 CONFIG_DEBUG_UART_CLOCK=200000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_DEBUG_UART=y
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/mx23_olinuxino_defconfig b/configs/mx23_olinuxino_defconfig
index c14f9ad87fd7..b286c5dcfa8a 100644
--- a/configs/mx23_olinuxino_defconfig
+++ b/configs/mx23_olinuxino_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX23_OLINUXINO=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/mx23evk_defconfig b/configs/mx23evk_defconfig
index bfafa50f1620..1a7473bc7c75 100644
--- a/configs/mx23evk_defconfig
+++ b/configs/mx23evk_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX23EVK=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/mx25pdk_defconfig b/configs/mx25pdk_defconfig
index cf7d8b918aea..dbe5d4895dbf 100644
--- a/configs/mx25pdk_defconfig
+++ b/configs/mx25pdk_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX25=y
 CONFIG_SYS_TEXT_BASE=0x81200000
 CONFIG_TARGET_MX25PDK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx25pdk/imximage.cfg"
 CONFIG_DEFAULT_FDT_FILE="imx25-pdk.dtb"
diff --git a/configs/mx28evk_auart_console_defconfig b/configs/mx28evk_auart_console_defconfig
index 6c63969bbdf3..a0860304b686 100644
--- a/configs/mx28evk_auart_console_defconfig
+++ b/configs/mx28evk_auart_console_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX28EVK=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/mx28evk_defconfig b/configs/mx28evk_defconfig
index fbf5b0c94955..430a3bdcbb68 100644
--- a/configs/mx28evk_defconfig
+++ b/configs/mx28evk_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX28EVK=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/mx28evk_nand_defconfig b/configs/mx28evk_nand_defconfig
index ff77b810a82d..ed60dc66b9ee 100644
--- a/configs/mx28evk_nand_defconfig
+++ b/configs/mx28evk_nand_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX28EVK=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x300000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
@@ -38,6 +40,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:3m(bootloader)ro,512k(environment),5
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x380000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MXS_GPIO=y
 CONFIG_MMC_MXS=y
diff --git a/configs/mx28evk_spi_defconfig b/configs/mx28evk_spi_defconfig
index 5d64408d0d25..9bbc7d6774e9 100644
--- a/configs/mx28evk_spi_defconfig
+++ b/configs/mx28evk_spi_defconfig
@@ -6,6 +6,7 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX28EVK=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/mx31pdk_defconfig b/configs/mx31pdk_defconfig
index c5da01c6e4ca..684afd59767b 100644
--- a/configs/mx31pdk_defconfig
+++ b/configs/mx31pdk_defconfig
@@ -6,6 +6,8 @@ CONFIG_SYS_TEXT_BASE=0x87e00000
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX31PDK=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x87dc0000
@@ -23,6 +25,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x60000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_MXC_GPIO=y
 # CONFIG_MMC is not set
diff --git a/configs/mx35pdk_defconfig b/configs/mx35pdk_defconfig
index 59457e35c842..eac080a366ba 100644
--- a/configs/mx35pdk_defconfig
+++ b/configs/mx35pdk_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_MX35PDK=y
 CONFIG_SYS_TEXT_BASE=0xA0000000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x20000
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_HUSH_PARSER=y
@@ -26,6 +28,8 @@ CONFIG_EFI_PARTITION=y
 # CONFIG_PARTITION_UUIDS is not set
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xA0080000
+CONFIG_ENV_ADDR_REDUND=0xA00A0000
 CONFIG_MXC_GPIO=y
 CONFIG_FSL_ESDHC_IMX=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index dc7b4ec818d5..dd782b3e7194 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x97800000
 CONFIG_TARGET_MX51EVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx51evk/imximage.cfg"
diff --git a/configs/mx53ard_defconfig b/configs/mx53ard_defconfig
index 7bec5d1a17a9..06f6d1585bd8 100644
--- a/configs/mx53ard_defconfig
+++ b/configs/mx53ard_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x77800000
 CONFIG_TARGET_MX53ARD=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=2
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx53ard/imximage_dd3.cfg"
diff --git a/configs/mx53cx9020_defconfig b/configs/mx53cx9020_defconfig
index c16a591dd229..3e16f4519d5f 100644
--- a/configs/mx53cx9020_defconfig
+++ b/configs/mx53cx9020_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x77800000
 CONFIG_TARGET_MX53CX9020=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=2
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/beckhoff/mx53cx9020/imximage.cfg"
diff --git a/configs/mx53evk_defconfig b/configs/mx53evk_defconfig
index 5e0a9e4730e9..68915c366b86 100644
--- a/configs/mx53evk_defconfig
+++ b/configs/mx53evk_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x77800000
 CONFIG_TARGET_MX53EVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx53evk/imximage.cfg"
 CONFIG_HUSH_PARSER=y
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 626ac2270205..28f48bfa9a30 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x77800000
 CONFIG_TARGET_MX53LOCO=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=2
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx53loco/imximage.cfg"
diff --git a/configs/mx53ppd_defconfig b/configs/mx53ppd_defconfig
index c2bee460ef6a..a21cbd8ab53c 100644
--- a/configs/mx53ppd_defconfig
+++ b/configs/mx53ppd_defconfig
@@ -5,6 +5,8 @@ CONFIG_TARGET_MX53PPD=y
 CONFIG_SYS_VPD_EEPROM_I2C_ADDR=0x50
 CONFIG_SYS_VPD_EEPROM_I2C_BUS=2
 CONFIG_SYS_VPD_EEPROM_SIZE=1024
+CONFIG_ENV_SIZE=0x2800
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SYS_BOOTCOUNT_ADDR=0x7000A000
 CONFIG_FIT=y
diff --git a/configs/mx53smd_defconfig b/configs/mx53smd_defconfig
index 3c70136a5fc5..39ecb50eb009 100644
--- a/configs/mx53smd_defconfig
+++ b/configs/mx53smd_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x77800000
 CONFIG_TARGET_MX53SMD=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=2
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx53smd/imximage.cfg"
diff --git a/configs/mx6cuboxi_defconfig b/configs/mx6cuboxi_defconfig
index 94d6a0fb4468..1eba5e5cfab7 100644
--- a/configs/mx6cuboxi_defconfig
+++ b/configs/mx6cuboxi_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6CUBOXI=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFE000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/mx6dlarm2_defconfig b/configs/mx6dlarm2_defconfig
index 76b9428d0aa9..75236a603382 100644
--- a/configs/mx6dlarm2_defconfig
+++ b/configs/mx6dlarm2_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_MX6QARM2=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6qarm2/imximage_mx6dl.cfg,MX6DL,DDR_MB=2048"
diff --git a/configs/mx6dlarm2_lpddr2_defconfig b/configs/mx6dlarm2_lpddr2_defconfig
index 63b2a90b4bf7..8b4e3d74bc61 100644
--- a/configs/mx6dlarm2_lpddr2_defconfig
+++ b/configs/mx6dlarm2_lpddr2_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_MX6QARM2=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6qarm2/imximage_mx6dl.cfg,MX6DL,MX6DL_LPDDR2,DDR_MB=512"
diff --git a/configs/mx6memcal_defconfig b/configs/mx6memcal_defconfig
index 0ded54cbf224..0ee35132d2ee 100644
--- a/configs/mx6memcal_defconfig
+++ b/configs/mx6memcal_defconfig
@@ -6,6 +6,7 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_MX6MEMCAL=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/mx6qarm2_defconfig b/configs/mx6qarm2_defconfig
index cd41115a8772..49e254f29ec4 100644
--- a/configs/mx6qarm2_defconfig
+++ b/configs/mx6qarm2_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_MX6QARM2=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6qarm2/imximage.cfg,MX6Q,DDR_MB=2048"
diff --git a/configs/mx6qarm2_lpddr2_defconfig b/configs/mx6qarm2_lpddr2_defconfig
index 71c24e1e3cb2..6163259d2f6c 100644
--- a/configs/mx6qarm2_lpddr2_defconfig
+++ b/configs/mx6qarm2_lpddr2_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_MX6QARM2=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6qarm2/imximage.cfg,MX6Q,MX6DQ_LPDDR2,DDR_MB=512"
diff --git a/configs/mx6qsabrelite_defconfig b/configs/mx6qsabrelite_defconfig
index 38c93ac5f963..9eccb7814d9e 100644
--- a/configs/mx6qsabrelite_defconfig
+++ b/configs/mx6qsabrelite_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_NITROGEN6X=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
diff --git a/configs/mx6sabreauto_defconfig b/configs/mx6sabreauto_defconfig
index c62c98cedf5a..ba20198919c1 100644
--- a/configs/mx6sabreauto_defconfig
+++ b/configs/mx6sabreauto_defconfig
@@ -8,6 +8,8 @@ CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_MX6SABREAUTO=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/mx6sabresd_defconfig b/configs/mx6sabresd_defconfig
index f46b16342b10..d0177af0e5a4 100644
--- a/configs/mx6sabresd_defconfig
+++ b/configs/mx6sabresd_defconfig
@@ -8,6 +8,8 @@ CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_MX6SABRESD=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/mx6slevk_defconfig b/configs/mx6slevk_defconfig
index 3e3038dc1fc4..5aea1484e5f7 100644
--- a/configs/mx6slevk_defconfig
+++ b/configs/mx6slevk_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6SLEVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6slevk/imximage.cfg"
diff --git a/configs/mx6slevk_spinor_defconfig b/configs/mx6slevk_spinor_defconfig
index 9ac5b9b20b68..a681684a574c 100644
--- a/configs/mx6slevk_spinor_defconfig
+++ b/configs/mx6slevk_spinor_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6SLEVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6slevk/imximage.cfg"
 CONFIG_SPI_BOOT=y
diff --git a/configs/mx6slevk_spl_defconfig b/configs/mx6slevk_spl_defconfig
index a8606bfe8904..bec90e89263e 100644
--- a/configs/mx6slevk_spl_defconfig
+++ b/configs/mx6slevk_spl_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6SLEVK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/mx6sllevk_defconfig b/configs/mx6sllevk_defconfig
index 79e04695e169..b43648dc6f68 100644
--- a/configs/mx6sllevk_defconfig
+++ b/configs/mx6sllevk_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6SLLEVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6sllevk/imximage.cfg"
diff --git a/configs/mx6sllevk_plugin_defconfig b/configs/mx6sllevk_plugin_defconfig
index 33fcfbb13c57..fffcfb346731 100644
--- a/configs/mx6sllevk_plugin_defconfig
+++ b/configs/mx6sllevk_plugin_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6SLLEVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_USE_IMXIMG_PLUGIN=y
 # CONFIG_CMD_BMODE is not set
diff --git a/configs/mx6sxsabreauto_defconfig b/configs/mx6sxsabreauto_defconfig
index 7e1e11b0cf7d..d3e3b2fb022f 100644
--- a/configs/mx6sxsabreauto_defconfig
+++ b/configs/mx6sxsabreauto_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6SXSABREAUTO=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6sxsabreauto/imximage.cfg"
diff --git a/configs/mx6sxsabresd_defconfig b/configs/mx6sxsabresd_defconfig
index eab38178239a..543678e93b81 100644
--- a/configs/mx6sxsabresd_defconfig
+++ b/configs/mx6sxsabresd_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6SXSABRESD=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_NXP_BOARD_REVISION=y
diff --git a/configs/mx6sxsabresd_spl_defconfig b/configs/mx6sxsabresd_spl_defconfig
index 514e58e0b475..668284eee9ae 100644
--- a/configs/mx6sxsabresd_spl_defconfig
+++ b/configs/mx6sxsabresd_spl_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6SXSABRESD=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/mx6ul_14x14_evk_defconfig b/configs/mx6ul_14x14_evk_defconfig
index d8663dab43fe..313e918a9c04 100644
--- a/configs/mx6ul_14x14_evk_defconfig
+++ b/configs/mx6ul_14x14_evk_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6UL_14X14_EVK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/mx6ul_9x9_evk_defconfig b/configs/mx6ul_9x9_evk_defconfig
index 3c367e8f1d59..2e8af707c686 100644
--- a/configs/mx6ul_9x9_evk_defconfig
+++ b/configs/mx6ul_9x9_evk_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_MX6UL_9X9_EVK=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/mx6ull_14x14_evk_defconfig b/configs/mx6ull_14x14_evk_defconfig
index dc2f4b5c3e59..d969a98fb4c2 100644
--- a/configs/mx6ull_14x14_evk_defconfig
+++ b/configs/mx6ull_14x14_evk_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6ULL_14X14_EVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6ullevk/imximage.cfg"
 CONFIG_SUPPORT_RAW_INITRD=y
diff --git a/configs/mx6ull_14x14_evk_plugin_defconfig b/configs/mx6ull_14x14_evk_plugin_defconfig
index 8acb0e565e70..3394b41fae32 100644
--- a/configs/mx6ull_14x14_evk_plugin_defconfig
+++ b/configs/mx6ull_14x14_evk_plugin_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6ULL_14X14_EVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_USE_IMXIMG_PLUGIN=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6ullevk/imximage.cfg"
diff --git a/configs/mx6ulz_14x14_evk_defconfig b/configs/mx6ulz_14x14_evk_defconfig
index b8e54199d81c..ab06628a2a59 100644
--- a/configs/mx6ulz_14x14_evk_defconfig
+++ b/configs/mx6ulz_14x14_evk_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX6ULL_14X14_EVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx6ullevk/imximage.cfg"
 CONFIG_SUPPORT_RAW_INITRD=y
diff --git a/configs/mx7dsabresd_defconfig b/configs/mx7dsabresd_defconfig
index 223003b3fb04..9befbb70c2d4 100644
--- a/configs/mx7dsabresd_defconfig
+++ b/configs/mx7dsabresd_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX7=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX7DSABRESD=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 # CONFIG_ARMV7_VIRT is not set
diff --git a/configs/mx7dsabresd_qspi_defconfig b/configs/mx7dsabresd_qspi_defconfig
index 619b29e5dc54..c317453349f3 100644
--- a/configs/mx7dsabresd_qspi_defconfig
+++ b/configs/mx7dsabresd_qspi_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX7=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_MX7DSABRESD=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 # CONFIG_ARMV7_VIRT is not set
 CONFIG_IMX_RDC=y
diff --git a/configs/mx7ulp_evk_defconfig b/configs/mx7ulp_evk_defconfig
index e4fc5c436efb..bd75a99be666 100644
--- a/configs/mx7ulp_evk_defconfig
+++ b/configs/mx7ulp_evk_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX7ULP=y
 CONFIG_SYS_TEXT_BASE=0x67800000
 CONFIG_TARGET_MX7ULP_EVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx7ulp_evk/imximage.cfg"
diff --git a/configs/mx7ulp_evk_plugin_defconfig b/configs/mx7ulp_evk_plugin_defconfig
index 5227eb78e9a3..0b07962dc9a5 100644
--- a/configs/mx7ulp_evk_plugin_defconfig
+++ b/configs/mx7ulp_evk_plugin_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX7ULP=y
 CONFIG_SYS_TEXT_BASE=0x67800000
 CONFIG_TARGET_MX7ULP_EVK=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/mx7ulp_evk/imximage.cfg"
 CONFIG_BOUNCE_BUFFER=y
diff --git a/configs/nanopc-t4-rk3399_defconfig b/configs/nanopc-t4-rk3399_defconfig
index 2e710cbef4ea..504346eb996a 100644
--- a/configs/nanopc-t4-rk3399_defconfig
+++ b/configs/nanopc-t4-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/nanopi-k2_defconfig b/configs/nanopi-k2_defconfig
index e5bd4622c1a6..7bdeb7906a7f 100644
--- a/configs/nanopi-k2_defconfig
+++ b/configs/nanopi-k2_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/nanopi-m4-rk3399_defconfig b/configs/nanopi-m4-rk3399_defconfig
index d9ebf3f1e9c1..24c8aa401b43 100644
--- a/configs/nanopi-m4-rk3399_defconfig
+++ b/configs/nanopi-m4-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/nanopi-neo4-rk3399_defconfig b/configs/nanopi-neo4-rk3399_defconfig
index 7fe68061780c..986739f16eef 100644
--- a/configs/nanopi-neo4-rk3399_defconfig
+++ b/configs/nanopi-neo4-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/nas220_defconfig b/configs/nas220_defconfig
index a4b6a16b12e0..1bd754234d39 100644
--- a/configs/nas220_defconfig
+++ b/configs/nas220_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NAS220=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xA0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nNAS 220"
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/net2big_v2_defconfig b/configs/net2big_v2_defconfig
index 2a309f54417c..98d02d68b433 100644
--- a/configs/net2big_v2_defconfig
+++ b/configs/net2big_v2_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NET2BIG_V2=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" 2Big v2"
 CONFIG_SYS_EXTRA_OPTIONS="NET2BIG_V2"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-net2big"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=20000000
+CONFIG_ENV_ADDR=0x70000
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/netgear_cg3100d_ram_defconfig b/configs/netgear_cg3100d_ram_defconfig
index 48f00b7dc0e0..6c280748efcc 100644
--- a/configs/netgear_cg3100d_ram_defconfig
+++ b/configs/netgear_cg3100d_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 # CONFIG_MIPS_BOOT_CMDLINE_LEGACY is not set
diff --git a/configs/netgear_dgnd3700v2_ram_defconfig b/configs/netgear_dgnd3700v2_ram_defconfig
index aa8af0b386d2..3452e0d5615b 100644
--- a/configs/netgear_dgnd3700v2_ram_defconfig
+++ b/configs/netgear_dgnd3700v2_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6362=y
diff --git a/configs/netspace_lite_v2_defconfig b/configs/netspace_lite_v2_defconfig
index ee58114b949c..e310f2ebd976 100644
--- a/configs/netspace_lite_v2_defconfig
+++ b/configs/netspace_lite_v2_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NETSPACE_V2=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" NS v2 Lite"
 CONFIG_SYS_EXTRA_OPTIONS="NETSPACE_LITE_V2"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-ns2lite"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=20000000
+CONFIG_ENV_ADDR=0x70000
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/netspace_max_v2_defconfig b/configs/netspace_max_v2_defconfig
index 2a95a55752e4..3feeaf94116b 100644
--- a/configs/netspace_max_v2_defconfig
+++ b/configs/netspace_max_v2_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NETSPACE_V2=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" NS Max v2"
 CONFIG_SYS_EXTRA_OPTIONS="NETSPACE_MAX_V2"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-ns2max"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=20000000
+CONFIG_ENV_ADDR=0x70000
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/netspace_mini_v2_defconfig b/configs/netspace_mini_v2_defconfig
index 6933a9ba86ed..bd7ec1cbec08 100644
--- a/configs/netspace_mini_v2_defconfig
+++ b/configs/netspace_mini_v2_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NETSPACE_V2=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" NS v2 Mini"
 CONFIG_SYS_EXTRA_OPTIONS="NETSPACE_MINI_V2"
 CONFIG_BOOTDELAY=3
@@ -34,6 +37,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-ns2mini"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=20000000
+CONFIG_ENV_ADDR=0x70000
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/netspace_v2_defconfig b/configs/netspace_v2_defconfig
index fc806e445e71..a24848cbafb5 100644
--- a/configs/netspace_v2_defconfig
+++ b/configs/netspace_v2_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NETSPACE_V2=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x70000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" NS v2"
 CONFIG_SYS_EXTRA_OPTIONS="NETSPACE_V2"
 CONFIG_BOOTDELAY=3
@@ -36,6 +39,7 @@ CONFIG_DEFAULT_DEVICE_TREE="kirkwood-ns2"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_USE_ENV_SPI_MAX_HZ=y
 CONFIG_ENV_SPI_MAX_HZ=20000000
+CONFIG_ENV_ADDR=0x70000
 CONFIG_MVSATA_IDE=y
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH=y
diff --git a/configs/nitrogen6dl2g_defconfig b/configs/nitrogen6dl2g_defconfig
index c738633a9192..7038c03e9d9c 100644
--- a/configs/nitrogen6dl2g_defconfig
+++ b/configs/nitrogen6dl2g_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_NITROGEN6X=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/nitrogen6dl_defconfig b/configs/nitrogen6dl_defconfig
index 65bf98b706c4..91dc551a5cb7 100644
--- a/configs/nitrogen6dl_defconfig
+++ b/configs/nitrogen6dl_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_NITROGEN6X=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/nitrogen6q2g_defconfig b/configs/nitrogen6q2g_defconfig
index 4452a5daa787..1c0f3596b362 100644
--- a/configs/nitrogen6q2g_defconfig
+++ b/configs/nitrogen6q2g_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_NITROGEN6X=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/nitrogen6q_defconfig b/configs/nitrogen6q_defconfig
index 0be2461be2e6..f67de86b4437 100644
--- a/configs/nitrogen6q_defconfig
+++ b/configs/nitrogen6q_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_NITROGEN6X=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/nitrogen6s1g_defconfig b/configs/nitrogen6s1g_defconfig
index c20ce33228d4..b39cf3d4ee1a 100644
--- a/configs/nitrogen6s1g_defconfig
+++ b/configs/nitrogen6s1g_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_NITROGEN6X=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/nitrogen6s_defconfig b/configs/nitrogen6s_defconfig
index 164f635447c2..1bb29a631e15 100644
--- a/configs/nitrogen6s_defconfig
+++ b/configs/nitrogen6s_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_NITROGEN6X=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_CMD_HDMIDETECT=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/novena_defconfig b/configs/novena_defconfig
index 85c6be2d1f20..96ff80e92a23 100644
--- a/configs/novena_defconfig
+++ b/configs/novena_defconfig
@@ -8,6 +8,8 @@ CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_KOSAGI_NOVENA=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
@@ -46,6 +48,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6q-novena"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x84000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DWC_AHSATA=y
diff --git a/configs/nsa310s_defconfig b/configs/nsa310s_defconfig
index cc238f01c4c3..404e7ccf1b6f 100644
--- a/configs/nsa310s_defconfig
+++ b/configs/nsa310s_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_NSA310S=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_BOOTDELAY=3
 CONFIG_USE_PREBOOT=y
diff --git a/configs/nyan-big_defconfig b/configs/nyan-big_defconfig
index a6e73bd2b78e..c9b82d30216c 100644
--- a/configs/nyan-big_defconfig
+++ b/configs/nyan-big_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x81000100
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_BOOTSTAGE_STASH_ADDR=0x83000000
 CONFIG_DEBUG_UART_BASE=0x70006000
diff --git a/configs/odroid-c2_defconfig b/configs/odroid-c2_defconfig
index 091c6331c18b..1f5a52c57cf3 100644
--- a/configs/odroid-c2_defconfig
+++ b/configs/odroid-c2_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/odroid-n2_defconfig b/configs/odroid-n2_defconfig
index 4ba54b6fc287..dccf3f1e7db7 100644
--- a/configs/odroid-n2_defconfig
+++ b/configs/odroid-n2_defconfig
@@ -3,6 +3,7 @@ CONFIG_SYS_BOARD="w400"
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_G12A=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff803000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/odroid-xu3_defconfig b/configs/odroid-xu3_defconfig
index 5b8988aa7cb3..24d21139209e 100644
--- a/configs/odroid-xu3_defconfig
+++ b/configs/odroid-xu3_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
 CONFIG_ARCH_EXYNOS5=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x310000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_IDENT_STRING=" for ODROID-XU3/XU4/HC1/HC2"
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/odroid_defconfig b/configs/odroid_defconfig
index f94e096ad0db..4a5e56671b9e 100644
--- a/configs/odroid_defconfig
+++ b/configs/odroid_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43e00000
 CONFIG_ARCH_EXYNOS4=y
 CONFIG_TARGET_ODROID=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x140000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/omap5_uevm_defconfig b/configs/omap5_uevm_defconfig
index e595fa16ee63..a54ce9f2b015 100644
--- a/configs/omap5_uevm_defconfig
+++ b/configs/omap5_uevm_defconfig
@@ -26,6 +26,7 @@ CONFIG_CMD_USB=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x280000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/omapl138_lcdk_defconfig b/configs/omapl138_lcdk_defconfig
index 898e9514123e..add152eb5173 100644
--- a/configs/omapl138_lcdk_defconfig
+++ b/configs/omapl138_lcdk_defconfig
@@ -9,6 +9,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x80000000
diff --git a/configs/openrd_base_defconfig b/configs/openrd_base_defconfig
index e933b2df8be2..92f9b8a7c461 100644
--- a/configs/openrd_base_defconfig
+++ b/configs/openrd_base_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_OPENRD=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nOpenRD-Base"
 CONFIG_SYS_EXTRA_OPTIONS="BOARD_IS_OPENRD_BASE"
diff --git a/configs/openrd_client_defconfig b/configs/openrd_client_defconfig
index caa05c5bdeb5..1eb794527453 100644
--- a/configs/openrd_client_defconfig
+++ b/configs/openrd_client_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_OPENRD=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nOpenRD-Client"
 CONFIG_SYS_EXTRA_OPTIONS="BOARD_IS_OPENRD_CLIENT"
diff --git a/configs/openrd_ultimate_defconfig b/configs/openrd_ultimate_defconfig
index 748a5895d40c..2c7af6a921ad 100644
--- a/configs/openrd_ultimate_defconfig
+++ b/configs/openrd_ultimate_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_OPENRD=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nOpenRD-Ultimate"
 CONFIG_SYS_EXTRA_OPTIONS="BOARD_IS_OPENRD_ULTIMATE"
diff --git a/configs/opos6uldev_defconfig b/configs/opos6uldev_defconfig
index e2d2dcd36a7e..74f07695b115 100644
--- a/configs/opos6uldev_defconfig
+++ b/configs/opos6uldev_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_OPOS6ULDEV=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2800
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x400
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
@@ -63,6 +65,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6ul-opos6uldev"
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x180000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_REGMAP=y
diff --git a/configs/orangepi-rk3399_defconfig b/configs/orangepi-rk3399_defconfig
index 54bcdd684928..bed634b699a0 100644
--- a/configs/orangepi-rk3399_defconfig
+++ b/configs/orangepi-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/origen_defconfig b/configs/origen_defconfig
index a975fdddaafb..32fb1902eb1f 100644
--- a/configs/origen_defconfig
+++ b/configs/origen_defconfig
@@ -5,6 +5,8 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
 CONFIG_ARCH_EXYNOS4=y
 CONFIG_TARGET_ORIGEN=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x4200
 CONFIG_SPL=y
 CONFIG_IDENT_STRING=" for ORIGEN"
 CONFIG_SPL_TEXT_BASE=0x02021410
diff --git a/configs/ot1200_defconfig b/configs/ot1200_defconfig
index 15f052d0d2b6..7e8489634869 100644
--- a/configs/ot1200_defconfig
+++ b/configs/ot1200_defconfig
@@ -2,7 +2,10 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_OT1200=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/bachmann/ot1200/mx6q_4x_mt41j128.cfg,MX6Q"
 CONFIG_BOOTDELAY=3
 CONFIG_USE_PREBOOT=y
diff --git a/configs/ot1200_spl_defconfig b/configs/ot1200_spl_defconfig
index 0cc129dc0466..fbc8feaaf8b2 100644
--- a/configs/ot1200_spl_defconfig
+++ b/configs/ot1200_spl_defconfig
@@ -6,8 +6,11 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_OT1200=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/p200_defconfig b/configs/p200_defconfig
index b9dc5971dae9..bd65f50c17b7 100644
--- a/configs/p200_defconfig
+++ b/configs/p200_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/p201_defconfig b/configs/p201_defconfig
index 0ebf726a9f9f..ff6f279d6957 100644
--- a/configs/p201_defconfig
+++ b/configs/p201_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_SYS_BOARD="p201"
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/p212_defconfig b/configs/p212_defconfig
index 1590cc68003a..2f72db99e502 100644
--- a/configs/p212_defconfig
+++ b/configs/p212_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_GXL=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xc81004c0
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/p2371-0000_defconfig b/configs/p2371-0000_defconfig
index de8802f05bb4..ae80e62cddbc 100644
--- a/configs/p2371-0000_defconfig
+++ b/configs/p2371-0000_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80080000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA210=y
 CONFIG_TARGET_P2371_0000=y
diff --git a/configs/p2371-2180_defconfig b/configs/p2371-2180_defconfig
index d4c307606fbf..2bdc2e67aa7a 100644
--- a/configs/p2371-2180_defconfig
+++ b/configs/p2371-2180_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80080000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA210=y
 CONFIG_TARGET_P2371_2180=y
diff --git a/configs/p2571_defconfig b/configs/p2571_defconfig
index 5b43bb5be64c..2525cbf9a6b8 100644
--- a/configs/p2571_defconfig
+++ b/configs/p2571_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80080000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA210=y
 CONFIG_TARGET_P2571=y
diff --git a/configs/p2771-0000-000_defconfig b/configs/p2771-0000-000_defconfig
index 8ddc8c5d3d30..9a3330a876b4 100644
--- a/configs/p2771-0000-000_defconfig
+++ b/configs/p2771-0000-000_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80080000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=1026
 CONFIG_TEGRA186=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/p2771-0000-500_defconfig b/configs/p2771-0000-500_defconfig
index 7a8be9f29edf..920919c364b5 100644
--- a/configs/p2771-0000-500_defconfig
+++ b/configs/p2771-0000-500_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80080000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=1026
 CONFIG_TEGRA186=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/paz00_defconfig b/configs/paz00_defconfig
index 4fe0b161d418..dd61088211c4 100644
--- a/configs/paz00_defconfig
+++ b/configs/paz00_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA20=y
 CONFIG_TARGET_PAZ00=y
diff --git a/configs/pcm052_defconfig b/configs/pcm052_defconfig
index 3f0fc3a82ed2..71a51079b740 100644
--- a/configs/pcm052_defconfig
+++ b/configs/pcm052_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_VF610=y
 CONFIG_SYS_TEXT_BASE=0x3f401000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xA0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_PCM052=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/phytec/pcm052/imximage.cfg"
@@ -25,6 +27,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="vf610-pcm052"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xC0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DM_GPIO=y
diff --git a/configs/pcm058_defconfig b/configs/pcm058_defconfig
index 30644a449aff..06c0f3c75583 100644
--- a/configs/pcm058_defconfig
+++ b/configs/pcm058_defconfig
@@ -7,8 +7,11 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PCM058=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
@@ -44,6 +47,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x110000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_FSL_USDHC=y
diff --git a/configs/peach-pi_defconfig b/configs/peach-pi_defconfig
index 9f7f55dde37e..5272f1dd9f69 100644
--- a/configs/peach-pi_defconfig
+++ b/configs/peach-pi_defconfig
@@ -4,8 +4,11 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x23E00000
 CONFIG_ARCH_EXYNOS5=y
 CONFIG_TARGET_PEACH_PI=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x3FC000
 CONFIG_NR_DRAM_BANKS=7
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x4000
 CONFIG_IDENT_STRING=" for Peach-Pi"
 CONFIG_SPL_TEXT_BASE=0x02024410
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/peach-pit_defconfig b/configs/peach-pit_defconfig
index c820c1fc1bcf..4ad71c19e132 100644
--- a/configs/peach-pit_defconfig
+++ b/configs/peach-pit_defconfig
@@ -4,7 +4,10 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x23E00000
 CONFIG_ARCH_EXYNOS5=y
 CONFIG_TARGET_PEACH_PIT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x3FC000
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x4000
 CONFIG_IDENT_STRING=" for Peach-Pit"
 CONFIG_SPL_TEXT_BASE=0x02024410
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/pfla02_defconfig b/configs/pfla02_defconfig
index 0cf456e03516..56bd8f137bfa 100644
--- a/configs/pfla02_defconfig
+++ b/configs/pfla02_defconfig
@@ -7,8 +7,11 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PFLA02=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
@@ -45,6 +48,7 @@ CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x110000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_FSL_USDHC=y
diff --git a/configs/phycore-am335x-r2-wega_defconfig b/configs/phycore-am335x-r2-wega_defconfig
index 072c95fa8c8b..e9990efa4c77 100644
--- a/configs/phycore-am335x-r2-wega_defconfig
+++ b/configs/phycore-am335x-r2-wega_defconfig
@@ -9,7 +9,7 @@ CONFIG_SYS_MPUCLK=1000
 CONFIG_TARGET_PHYCORE_AM335X_R2=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_ENV_OFFSET=0x000a0000
+CONFIG_ENV_OFFSET=0xA0000
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/phycore-rk3288_defconfig b/configs/phycore-rk3288_defconfig
index e240ce6a3831..782b2adb57cb 100644
--- a/configs/phycore-rk3288_defconfig
+++ b/configs/phycore-rk3288_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_ROCKCHIP_RK3288=y
 CONFIG_SPL_ROCKCHIP_BACK_TO_BROM=y
 CONFIG_TARGET_PHYCORE_RK3288=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff690000
diff --git a/configs/phycore_pcl063_defconfig b/configs/phycore_pcl063_defconfig
index e7d9332cd97e..6b234e572127 100644
--- a/configs/phycore_pcl063_defconfig
+++ b/configs/phycore_pcl063_defconfig
@@ -6,6 +6,7 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PCL063=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00909000
diff --git a/configs/phycore_pcl063_ull_defconfig b/configs/phycore_pcl063_ull_defconfig
index 0dc4d312dc99..814e76b11641 100644
--- a/configs/phycore_pcl063_ull_defconfig
+++ b/configs/phycore_pcl063_ull_defconfig
@@ -6,6 +6,7 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PCL063_ULL=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x908000
diff --git a/configs/pic32mzdask_defconfig b/configs/pic32mzdask_defconfig
index f20a55d6b648..6801ebd22c8d 100644
--- a/configs/pic32mzdask_defconfig
+++ b/configs/pic32mzdask_defconfig
@@ -1,6 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x9D004000
 CONFIG_SYS_MALLOC_F_LEN=0x600
+CONFIG_ENV_SIZE=0x4000
 CONFIG_MACH_PIC32=y
 # CONFIG_MIPS_BOOT_ENV_LEGACY is not set
 CONFIG_MIPS_BOOT_FDT=y
diff --git a/configs/pico-dwarf-imx6ul_defconfig b/configs/pico-dwarf-imx6ul_defconfig
index e742aca6ae0e..26fd36574871 100644
--- a/configs/pico-dwarf-imx6ul_defconfig
+++ b/configs/pico-dwarf-imx6ul_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX6UL=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/pico-dwarf-imx7d_defconfig b/configs/pico-dwarf-imx7d_defconfig
index e51ff7812a75..533f569e1e19 100644
--- a/configs/pico-dwarf-imx7d_defconfig
+++ b/configs/pico-dwarf-imx7d_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX7D=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
diff --git a/configs/pico-hobbit-imx6ul_defconfig b/configs/pico-hobbit-imx6ul_defconfig
index 42605fe1b7d9..c2281b1c6304 100644
--- a/configs/pico-hobbit-imx6ul_defconfig
+++ b/configs/pico-hobbit-imx6ul_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX6UL=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/pico-hobbit-imx7d_defconfig b/configs/pico-hobbit-imx7d_defconfig
index 1af12ad3beea..3dd4f9a3a9ef 100644
--- a/configs/pico-hobbit-imx7d_defconfig
+++ b/configs/pico-hobbit-imx7d_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX7D=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
diff --git a/configs/pico-imx6_defconfig b/configs/pico-imx6_defconfig
index 388e157093af..0c8c74762cc7 100644
--- a/configs/pico-imx6_defconfig
+++ b/configs/pico-imx6_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/pico-imx6ul_defconfig b/configs/pico-imx6ul_defconfig
index e5e2abf3da86..c50f4fdf0908 100644
--- a/configs/pico-imx6ul_defconfig
+++ b/configs/pico-imx6ul_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX6UL=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/pico-imx7d_bl33_defconfig b/configs/pico-imx7d_bl33_defconfig
index 3297cc27f5b9..6633115487ad 100644
--- a/configs/pico-imx7d_bl33_defconfig
+++ b/configs/pico-imx7d_bl33_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX7D=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL=y
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_FIT=y
diff --git a/configs/pico-imx7d_defconfig b/configs/pico-imx7d_defconfig
index 8ee1ee4c53a3..3b3108875700 100644
--- a/configs/pico-imx7d_defconfig
+++ b/configs/pico-imx7d_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX7D=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
diff --git a/configs/pico-nymph-imx7d_defconfig b/configs/pico-nymph-imx7d_defconfig
index e51ff7812a75..533f569e1e19 100644
--- a/configs/pico-nymph-imx7d_defconfig
+++ b/configs/pico-nymph-imx7d_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX7D=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
diff --git a/configs/pico-pi-imx6ul_defconfig b/configs/pico-pi-imx6ul_defconfig
index 47a5c30534eb..5db7a1b56f2f 100644
--- a/configs/pico-pi-imx6ul_defconfig
+++ b/configs/pico-pi-imx6ul_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX6UL=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/pico-pi-imx7d_defconfig b/configs/pico-pi-imx7d_defconfig
index 48afb39efd0d..d8e3c54aab44 100644
--- a/configs/pico-pi-imx7d_defconfig
+++ b/configs/pico-pi-imx7d_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PICO_IMX7D=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
diff --git a/configs/platinum_picon_defconfig b/configs/platinum_picon_defconfig
index 1683e9d14480..58edba04e80c 100644
--- a/configs/platinum_picon_defconfig
+++ b/configs/platinum_picon_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PLATINUM_PICON=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x1000000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
@@ -49,6 +51,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:14M(spl),2M(uboot),512k(env1),512k(e
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x1080000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/platinum_titanium_defconfig b/configs/platinum_titanium_defconfig
index 8c67a92c6575..dca2037ae106 100644
--- a/configs/platinum_titanium_defconfig
+++ b/configs/platinum_titanium_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_PLATINUM_TITANIUM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x1000000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
@@ -49,6 +51,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:14M(spl),2M(uboot),512k(env1),512k(e
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x1080000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/plutux_defconfig b/configs/plutux_defconfig
index 7475130ef7f7..9bd314a94fba 100644
--- a/configs/plutux_defconfig
+++ b/configs/plutux_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x1FFE0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA20=y
 CONFIG_TARGET_PLUTUX=y
diff --git a/configs/pm9261_defconfig b/configs/pm9261_defconfig
index 604e83dd3a2e..b833ecc85cd3 100644
--- a/configs/pm9261_defconfig
+++ b/configs/pm9261_defconfig
@@ -5,7 +5,6 @@ CONFIG_SYS_TEXT_BASE=0
 CONFIG_TARGET_PM9261=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_ENV_SIZE=0x10000
-CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_EXTRA_OPTIONS="AT91SAM9261"
@@ -32,6 +31,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=physmap-flash.0:256k(u-boot)ro,64k(u-boot-env)
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9261ek"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x10040000
 CONFIG_DM=y
 CONFIG_BLK=y
 CONFIG_CLK=y
diff --git a/configs/pm9263_defconfig b/configs/pm9263_defconfig
index a1d22af2a3fc..37825a34db02 100644
--- a/configs/pm9263_defconfig
+++ b/configs/pm9263_defconfig
@@ -5,7 +5,6 @@ CONFIG_SYS_TEXT_BASE=0
 CONFIG_TARGET_PM9263=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_ENV_SIZE=0x10000
-CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_EXTRA_OPTIONS="AT91SAM9263"
@@ -32,6 +31,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=physmap-flash.0:256k(u-boot)ro,64k(u-boot-env)
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9263ek"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x10040000
 CONFIG_DM=y
 CONFIG_BLK=y
 CONFIG_CLK=y
diff --git a/configs/pm9g45_defconfig b/configs/pm9g45_defconfig
index e2ee1c8707aa..8a554a72f5ba 100644
--- a/configs/pm9g45_defconfig
+++ b/configs/pm9g45_defconfig
@@ -33,6 +33,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9m10g45ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_DM=y
diff --git a/configs/pogo_e02_defconfig b/configs/pogo_e02_defconfig
index 026a556fa011..d31a13de220e 100644
--- a/configs/pogo_e02_defconfig
+++ b/configs/pogo_e02_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_POGO_E02=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nPogo E02"
 CONFIG_BOOTDELAY=3
diff --git a/configs/poplar_defconfig b/configs/poplar_defconfig
index 1e068acb63cf..c71aa4dae4a9 100644
--- a/configs/poplar_defconfig
+++ b/configs/poplar_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_TARGET_POPLAR=y
 CONFIG_SYS_TEXT_BASE=0x37000000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x1F0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="poplar"
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/popmetal-rk3288_defconfig b/configs/popmetal-rk3288_defconfig
index a692c2c6dc34..1f0431415762 100644
--- a/configs/popmetal-rk3288_defconfig
+++ b/configs/popmetal-rk3288_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_ROCKCHIP_RK3288=y
 CONFIG_SPL_ROCKCHIP_BACK_TO_BROM=y
 CONFIG_TARGET_POPMETAL_RK3288=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff690000
diff --git a/configs/porter_defconfig b/configs/porter_defconfig
index 581f2812ad10..d496a26369d5 100644
--- a/configs/porter_defconfig
+++ b/configs/porter_defconfig
@@ -12,9 +12,12 @@ CONFIG_ARCH_RMOBILE_BOARD_STRING="Porter"
 CONFIG_R8A7791=y
 CONFIG_TARGET_PORTER=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0xe6300000
@@ -54,6 +57,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7791-porter-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xC0000
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/puma-rk3399_defconfig b/configs/puma-rk3399_defconfig
index 6a5e89dc585c..4d97ad8683ae 100644
--- a/configs/puma-rk3399_defconfig
+++ b/configs/puma-rk3399_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_ROCKCHIP_RK3399=y
 CONFIG_ROCKCHIP_BOOT_MODE_REG=0x0
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_TARGET_PUMA_RK3399=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF180000
diff --git a/configs/pumpkin_defconfig b/configs/pumpkin_defconfig
index 1bb6fb2c28f7..7ca42d09e471 100644
--- a/configs/pumpkin_defconfig
+++ b/configs/pumpkin_defconfig
@@ -4,6 +4,7 @@ CONFIG_ARCH_MEDIATEK=y
 CONFIG_SYS_TEXT_BASE=0x4C000000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_MT8516=y
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0x11005000
 CONFIG_DEBUG_UART_CLOCK=26000000
diff --git a/configs/qemu-ppce500_defconfig b/configs/qemu-ppce500_defconfig
index 8b2ad8b028db..4f50142ad6be 100644
--- a/configs/qemu-ppce500_defconfig
+++ b/configs/qemu-ppce500_defconfig
@@ -1,5 +1,6 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xf01000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_QEMU_PPCE500=y
diff --git a/configs/qemu-riscv32_defconfig b/configs/qemu-riscv32_defconfig
index d21f18575a1b..d3f8fed58c1b 100644
--- a/configs/qemu-riscv32_defconfig
+++ b/configs/qemu-riscv32_defconfig
@@ -1,4 +1,5 @@
 CONFIG_RISCV=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_QEMU_VIRT=y
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/qemu-riscv32_smode_defconfig b/configs/qemu-riscv32_smode_defconfig
index e60eaa974935..20fc8f34725c 100644
--- a/configs/qemu-riscv32_smode_defconfig
+++ b/configs/qemu-riscv32_smode_defconfig
@@ -1,4 +1,5 @@
 CONFIG_RISCV=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_QEMU_VIRT=y
 CONFIG_RISCV_SMODE=y
diff --git a/configs/qemu-riscv32_spl_defconfig b/configs/qemu-riscv32_spl_defconfig
index eb0dd2ee94b1..fcaf0d5f6716 100644
--- a/configs/qemu-riscv32_spl_defconfig
+++ b/configs/qemu-riscv32_spl_defconfig
@@ -1,4 +1,5 @@
 CONFIG_RISCV=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_TARGET_QEMU_VIRT=y
diff --git a/configs/qemu-riscv64_defconfig b/configs/qemu-riscv64_defconfig
index e41bcc134801..7cda5e5a59d7 100644
--- a/configs/qemu-riscv64_defconfig
+++ b/configs/qemu-riscv64_defconfig
@@ -1,4 +1,5 @@
 CONFIG_RISCV=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_QEMU_VIRT=y
 CONFIG_ARCH_RV64I=y
diff --git a/configs/qemu-riscv64_smode_defconfig b/configs/qemu-riscv64_smode_defconfig
index 20f1def3dad5..33776f039094 100644
--- a/configs/qemu-riscv64_smode_defconfig
+++ b/configs/qemu-riscv64_smode_defconfig
@@ -1,4 +1,5 @@
 CONFIG_RISCV=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_QEMU_VIRT=y
 CONFIG_ARCH_RV64I=y
diff --git a/configs/qemu-riscv64_spl_defconfig b/configs/qemu-riscv64_spl_defconfig
index 70cd66e4e43a..6da9dd754de5 100644
--- a/configs/qemu-riscv64_spl_defconfig
+++ b/configs/qemu-riscv64_spl_defconfig
@@ -1,4 +1,5 @@
 CONFIG_RISCV=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_TARGET_QEMU_VIRT=y
diff --git a/configs/qemu-x86_64_defconfig b/configs/qemu-x86_64_defconfig
index 1f0bd6aa0e37..099062800787 100644
--- a/configs/qemu-x86_64_defconfig
+++ b/configs/qemu-x86_64_defconfig
@@ -2,6 +2,7 @@ CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0x1110000
 CONFIG_SYS_MALLOC_F_LEN=0x1000
 CONFIG_MAX_CPUS=2
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
diff --git a/configs/qemu-x86_defconfig b/configs/qemu-x86_defconfig
index 30a55f013c24..dc69aa5f7a5b 100644
--- a/configs/qemu-x86_defconfig
+++ b/configs/qemu-x86_defconfig
@@ -1,6 +1,7 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
 CONFIG_MAX_CPUS=2
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_SMP=y
 CONFIG_GENERATE_PIRQ_TABLE=y
diff --git a/configs/qemu_arm64_defconfig b/configs/qemu_arm64_defconfig
index 533195bc05ee..d2d7c38271d6 100644
--- a/configs/qemu_arm64_defconfig
+++ b/configs/qemu_arm64_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_ARCH_QEMU=y
 CONFIG_TARGET_QEMU_ARM_64BIT=y
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_USE_PREBOOT=y
@@ -14,6 +16,7 @@ CONFIG_CMD_PCI=y
 CONFIG_CMD_USB=y
 CONFIG_OF_BOARD=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x4000000
 CONFIG_SCSI_AHCI=y
 CONFIG_AHCI_PCI=y
 CONFIG_BLK=y
diff --git a/configs/qemu_arm_defconfig b/configs/qemu_arm_defconfig
index 6491a5e29e36..ed6d591f9360 100644
--- a/configs/qemu_arm_defconfig
+++ b/configs/qemu_arm_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARM_SMCCC=y
 CONFIG_ARCH_QEMU=y
 CONFIG_TARGET_QEMU_ARM_32BIT=y
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_AHCI=y
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_USE_PREBOOT=y
@@ -15,6 +17,7 @@ CONFIG_CMD_PCI=y
 CONFIG_CMD_USB=y
 CONFIG_OF_BOARD=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x4000000
 CONFIG_SCSI_AHCI=y
 CONFIG_AHCI_PCI=y
 CONFIG_BLK=y
diff --git a/configs/qemu_mips64_defconfig b/configs/qemu_mips64_defconfig
index aff109512e33..eae64add37be 100644
--- a/configs/qemu_mips64_defconfig
+++ b/configs/qemu_mips64_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xFFFFFFFFBFC00000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x8000
 CONFIG_TARGET_QEMU_MIPS=y
 CONFIG_CPU_MIPS64_R1=y
 CONFIG_BOOTDELAY=10
@@ -17,6 +19,7 @@ CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFFFFFFBFFF8000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/qemu_mips64el_defconfig b/configs/qemu_mips64el_defconfig
index 63cbd44c0d21..bdbe48b6768e 100644
--- a/configs/qemu_mips64el_defconfig
+++ b/configs/qemu_mips64el_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xFFFFFFFFBFC00000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x8000
 CONFIG_TARGET_QEMU_MIPS=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS64_R1=y
@@ -18,6 +20,7 @@ CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFFFFFFFBFFF8000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/qemu_mips_defconfig b/configs/qemu_mips_defconfig
index 37bf69f9e8e6..f12fddc15ceb 100644
--- a/configs/qemu_mips_defconfig
+++ b/configs/qemu_mips_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xBFC00000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x8000
 CONFIG_TARGET_QEMU_MIPS=y
 CONFIG_BOOTDELAY=10
 CONFIG_MISC_INIT_R=y
@@ -15,6 +17,7 @@ CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBFFF8000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/qemu_mipsel_defconfig b/configs/qemu_mipsel_defconfig
index 82091b97df43..29df92c4c99b 100644
--- a/configs/qemu_mipsel_defconfig
+++ b/configs/qemu_mipsel_defconfig
@@ -1,5 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xBFC00000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x8000
 CONFIG_TARGET_QEMU_MIPS=y
 CONFIG_SYS_LITTLE_ENDIAN=y
 CONFIG_BOOTDELAY=10
@@ -16,6 +18,7 @@ CONFIG_CMD_EXT2=y
 CONFIG_CMD_FAT=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBFFF8000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
diff --git a/configs/r2dplus_defconfig b/configs/r2dplus_defconfig
index e10ac939c5b9..8ae4ba1a1c8d 100644
--- a/configs/r2dplus_defconfig
+++ b/configs/r2dplus_defconfig
@@ -1,5 +1,7 @@
 CONFIG_SH=y
 CONFIG_SYS_TEXT_BASE=0x8FE00000
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_TARGET_R2DPLUS=y
 # CONFIG_SYS_MALLOC_F is not set
 CONFIG_BOOTDELAY=-1
@@ -20,6 +22,7 @@ CONFIG_DOS_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="sh7751-r2dplus"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xA0040000
 CONFIG_DM=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/r7780mp_defconfig b/configs/r7780mp_defconfig
index 7862312d23cf..daacd43ba336 100644
--- a/configs/r7780mp_defconfig
+++ b/configs/r7780mp_defconfig
@@ -1,5 +1,7 @@
 CONFIG_SH=y
 CONFIG_SYS_TEXT_BASE=0x0FFC0000
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_TARGET_R7780MP=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
@@ -28,6 +30,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xA0040000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
diff --git a/configs/r8a7795_salvator-x_defconfig b/configs/r8a7795_salvator-x_defconfig
index 708bbe4aa9ab..497b1483db42 100644
--- a/configs/r8a7795_salvator-x_defconfig
+++ b/configs/r8a7795_salvator-x_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_RMOBILE=y
 CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_SALVATOR_X=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xFFFE0000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6338000
 CONFIG_FIT=y
diff --git a/configs/r8a7795_ulcb_defconfig b/configs/r8a7795_ulcb_defconfig
index 314397396506..5df54dc6610c 100644
--- a/configs/r8a7795_ulcb_defconfig
+++ b/configs/r8a7795_ulcb_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_ULCB=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xFFFE0000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6338000
 CONFIG_FIT=y
diff --git a/configs/r8a77965_salvator-x_defconfig b/configs/r8a77965_salvator-x_defconfig
index a759fee9f595..fa0b5a44592d 100644
--- a/configs/r8a77965_salvator-x_defconfig
+++ b/configs/r8a77965_salvator-x_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_SALVATOR_X=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xFFFE0000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6338000
 CONFIG_FIT=y
diff --git a/configs/r8a77965_ulcb_defconfig b/configs/r8a77965_ulcb_defconfig
index db46f0348bd3..2e8c3f2b1ab3 100644
--- a/configs/r8a77965_ulcb_defconfig
+++ b/configs/r8a77965_ulcb_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_ULCB=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xFFFE0000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6338000
 CONFIG_FIT=y
diff --git a/configs/r8a7796_salvator-x_defconfig b/configs/r8a7796_salvator-x_defconfig
index a3cecb65f290..2c78df0bfeef 100644
--- a/configs/r8a7796_salvator-x_defconfig
+++ b/configs/r8a7796_salvator-x_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_SALVATOR_X=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xFFFE0000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6338000
 CONFIG_FIT=y
diff --git a/configs/r8a7796_ulcb_defconfig b/configs/r8a7796_ulcb_defconfig
index f6d3ef5146b7..a8f3c8a5a676 100644
--- a/configs/r8a7796_ulcb_defconfig
+++ b/configs/r8a7796_ulcb_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_ULCB=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xFFFE0000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6338000
 CONFIG_FIT=y
diff --git a/configs/r8a77970_eagle_defconfig b/configs/r8a77970_eagle_defconfig
index c348b912e7b2..eca37d72cdb2 100644
--- a/configs/r8a77970_eagle_defconfig
+++ b/configs/r8a77970_eagle_defconfig
@@ -5,6 +5,9 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_EAGLE=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x700000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6318000
 CONFIG_FIT=y
diff --git a/configs/r8a77980_condor_defconfig b/configs/r8a77980_condor_defconfig
index 190b4d8195fc..9169a9e06d11 100644
--- a/configs/r8a77980_condor_defconfig
+++ b/configs/r8a77980_condor_defconfig
@@ -5,6 +5,9 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_CONDOR=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0x700000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6318000
 CONFIG_FIT=y
diff --git a/configs/r8a77990_ebisu_defconfig b/configs/r8a77990_ebisu_defconfig
index 79a1e9a92582..f968be678733 100644
--- a/configs/r8a77990_ebisu_defconfig
+++ b/configs/r8a77990_ebisu_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_EBISU=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xFFFE0000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6318000
 CONFIG_FIT=y
diff --git a/configs/r8a77995_draak_defconfig b/configs/r8a77995_draak_defconfig
index 75b11d65d690..9fc9b393c13b 100644
--- a/configs/r8a77995_draak_defconfig
+++ b/configs/r8a77995_draak_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_TEXT_BASE=0x50000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_RCAR_GEN3=y
 CONFIG_TARGET_DRAAK=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0xFFFE0000
 CONFIG_SMBIOS_PRODUCT_NAME=""
 CONFIG_SPL_TEXT_BASE=0xe6318000
 CONFIG_FIT=y
diff --git a/configs/rastaban_defconfig b/configs/rastaban_defconfig
index b676d4e041dd..4cbf6d4ae132 100644
--- a/configs/rastaban_defconfig
+++ b/configs/rastaban_defconfig
@@ -60,6 +60,7 @@ CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-draco"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x2E0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index 735542031419..a234dd123ab4 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_EMBESTMX6BOARDS=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/boundary/nitrogen6x/nitrogen6s1g.cfg,MX6S,DDR_MB=1024"
diff --git a/configs/riotboard_spl_defconfig b/configs/riotboard_spl_defconfig
index 4174322f27cd..79c3570185c3 100644
--- a/configs/riotboard_spl_defconfig
+++ b/configs/riotboard_spl_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_EMBESTMX6BOARDS=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/roc-rk3399-pc_defconfig b/configs/roc-rk3399-pc_defconfig
index 11d8bcd2e31b..305baa712cd0 100644
--- a/configs/roc-rk3399-pc_defconfig
+++ b/configs/roc-rk3399-pc_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/rock-pi-4-rk3399_defconfig b/configs/rock-pi-4-rk3399_defconfig
index 5faecb3f3fac..2c01bf1f8751 100644
--- a/configs/rock-pi-4-rk3399_defconfig
+++ b/configs/rock-pi-4-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/rock2_defconfig b/configs/rock2_defconfig
index 75546faa46bb..a28b3f14942a 100644
--- a/configs/rock2_defconfig
+++ b/configs/rock2_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_ROCKCHIP_RK3288=y
 CONFIG_SPL_ROCKCHIP_BACK_TO_BROM=y
 CONFIG_TARGET_ROCK2=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff690000
diff --git a/configs/rock64-rk3328_defconfig b/configs/rock64-rk3328_defconfig
index bdcd8fe7ede3..ec6dcf80f901 100644
--- a/configs/rock64-rk3328_defconfig
+++ b/configs/rock64-rk3328_defconfig
@@ -6,6 +6,7 @@ CONFIG_TPL_ROCKCHIP_COMMON_BOARD=y
 CONFIG_TPL_LIBCOMMON_SUPPORT=y
 CONFIG_TPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x600000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF130000
diff --git a/configs/rock960-rk3399_defconfig b/configs/rock960-rk3399_defconfig
index 609f17ac66d8..0d3c3a0bf386 100644
--- a/configs/rock960-rk3399_defconfig
+++ b/configs/rock960-rk3399_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
 CONFIG_ROCKCHIP_SPL_RESERVE_IRAM=0x4000
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_TARGET_ROCK960_RK3399=y
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/rock_defconfig b/configs/rock_defconfig
index 11174faa7a4b..3ce9aa10670a 100644
--- a/configs/rock_defconfig
+++ b/configs/rock_defconfig
@@ -6,6 +6,7 @@ CONFIG_SYS_TEXT_BASE=0x60000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_ROCKCHIP_RK3188=y
 CONFIG_TARGET_ROCK=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x60080000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0x20064000
diff --git a/configs/rockpro64-rk3399_defconfig b/configs/rockpro64-rk3399_defconfig
index 67030c852e5d..abba6b98f693 100644
--- a/configs/rockpro64-rk3399_defconfig
+++ b/configs/rockpro64-rk3399_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00200000
 CONFIG_ROCKCHIP_RK3399=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xFF1A0000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/rpi_0_w_defconfig b/configs/rpi_0_w_defconfig
index ecfd3efc4014..52f15ce3e4a2 100644
--- a/configs/rpi_0_w_defconfig
+++ b/configs/rpi_0_w_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_BCM283X=y
 CONFIG_SYS_TEXT_BASE=0x00008000
 CONFIG_TARGET_RPI_0_W=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/rpi_2_defconfig b/configs/rpi_2_defconfig
index 4cec41a8fe20..8c3335c5ed3c 100644
--- a/configs/rpi_2_defconfig
+++ b/configs/rpi_2_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_BCM283X=y
 CONFIG_SYS_TEXT_BASE=0x00008000
 CONFIG_TARGET_RPI_2=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/rpi_3_32b_defconfig b/configs/rpi_3_32b_defconfig
index 366eba564c23..571d2cd23c02 100644
--- a/configs/rpi_3_32b_defconfig
+++ b/configs/rpi_3_32b_defconfig
@@ -4,6 +4,7 @@ CONFIG_ARCH_BCM283X=y
 CONFIG_SYS_TEXT_BASE=0x00008000
 CONFIG_TARGET_RPI_3_32B=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/rpi_3_b_plus_defconfig b/configs/rpi_3_b_plus_defconfig
index 35c5951c91f9..169c6fdb9d89 100644
--- a/configs/rpi_3_b_plus_defconfig
+++ b/configs/rpi_3_b_plus_defconfig
@@ -4,6 +4,7 @@ CONFIG_ARCH_BCM283X=y
 CONFIG_SYS_TEXT_BASE=0x00080000
 CONFIG_TARGET_RPI_3=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/rpi_3_defconfig b/configs/rpi_3_defconfig
index ecfae610b23d..3fb2c3f09062 100644
--- a/configs/rpi_3_defconfig
+++ b/configs/rpi_3_defconfig
@@ -4,6 +4,7 @@ CONFIG_ARCH_BCM283X=y
 CONFIG_SYS_TEXT_BASE=0x00080000
 CONFIG_TARGET_RPI_3=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/rpi_4_32b_defconfig b/configs/rpi_4_32b_defconfig
index 899c1cc78213..7ff390cd24af 100644
--- a/configs/rpi_4_32b_defconfig
+++ b/configs/rpi_4_32b_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_BCM283X=y
 CONFIG_SYS_TEXT_BASE=0x00008000
 CONFIG_TARGET_RPI_4_32B=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/rpi_4_defconfig b/configs/rpi_4_defconfig
index 98d185a5ed10..c5089eb9c8d4 100644
--- a/configs/rpi_4_defconfig
+++ b/configs/rpi_4_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_BCM283X=y
 CONFIG_SYS_TEXT_BASE=0x00080000
 CONFIG_TARGET_RPI_4=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
index 83a36143006b..a7ccab17102b 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -3,6 +3,7 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_BCM283X=y
 CONFIG_SYS_TEXT_BASE=0x00008000
 CONFIG_TARGET_RPI=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
diff --git a/configs/s32v234evb_defconfig b/configs/s32v234evb_defconfig
index 52f6dd99a356..1fb25ee2ba1f 100644
--- a/configs/s32v234evb_defconfig
+++ b/configs/s32v234evb_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TARGET_S32V234EVB=y
 CONFIG_SYS_TEXT_BASE=0x3E800000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/s32v234evb/s32v234evb.cfg"
diff --git a/configs/s400_defconfig b/configs/s400_defconfig
index f61bd53c5dcf..6b9e790973df 100644
--- a/configs/s400_defconfig
+++ b/configs/s400_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_AXG=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff803000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/s5p_goni_defconfig b/configs/s5p_goni_defconfig
index d1f3f9aa2afb..a33ae3c5f088 100644
--- a/configs/s5p_goni_defconfig
+++ b/configs/s5p_goni_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_S5PC1XX=y
 CONFIG_SYS_TEXT_BASE=0x34800000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x7000
 CONFIG_TARGET_S5P_GONI=y
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
diff --git a/configs/s5pc210_universal_defconfig b/configs/s5pc210_universal_defconfig
index 7e6237a70481..db764e82bed3 100644
--- a/configs/s5pc210_universal_defconfig
+++ b/configs/s5pc210_universal_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x44800000
 CONFIG_ARCH_EXYNOS4=y
 CONFIG_TARGET_S5PC210_UNIVERSAL=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x7000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/sagem_f@st1704_ram_defconfig b/configs/sagem_f@st1704_ram_defconfig
index d25a7e1c653c..423360e38712 100644
--- a/configs/sagem_f@st1704_ram_defconfig
+++ b/configs/sagem_f@st1704_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6338=y
diff --git a/configs/sam9x60ek_nandflash_defconfig b/configs/sam9x60ek_nandflash_defconfig
index c9b821a02e87..f270b6828a80 100644
--- a/configs/sam9x60ek_nandflash_defconfig
+++ b/configs/sam9x60ek_nandflash_defconfig
@@ -35,6 +35,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="sam9x60ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/sama5d2_ptc_ek_nandflash_defconfig b/configs/sama5d2_ptc_ek_nandflash_defconfig
index fb27cbb6e809..33ec13ff16a8 100644
--- a/configs/sama5d2_ptc_ek_nandflash_defconfig
+++ b/configs/sama5d2_ptc_ek_nandflash_defconfig
@@ -35,6 +35,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d2_ptc_ek"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_CLK=y
diff --git a/configs/sama5d36ek_cmp_nandflash_defconfig b/configs/sama5d36ek_cmp_nandflash_defconfig
index 4275f27fc3b8..cd2b75c3b4bc 100644
--- a/configs/sama5d36ek_cmp_nandflash_defconfig
+++ b/configs/sama5d36ek_cmp_nandflash_defconfig
@@ -33,6 +33,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="sama5d36ek_cmp"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/sama5d3_xplained_nandflash_defconfig b/configs/sama5d3_xplained_nandflash_defconfig
index 90c83ada4b3f..b7e8dd93446d 100644
--- a/configs/sama5d3_xplained_nandflash_defconfig
+++ b/configs/sama5d3_xplained_nandflash_defconfig
@@ -46,6 +46,7 @@ CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d3_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/sama5d3xek_nandflash_defconfig b/configs/sama5d3xek_nandflash_defconfig
index 41c38b492d85..6104a9f829d5 100644
--- a/configs/sama5d3xek_nandflash_defconfig
+++ b/configs/sama5d3xek_nandflash_defconfig
@@ -45,6 +45,7 @@ CONFIG_DEFAULT_DEVICE_TREE="sama5d36ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dmas dma-names"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM=y
diff --git a/configs/sama5d4_xplained_nandflash_defconfig b/configs/sama5d4_xplained_nandflash_defconfig
index 8d7380c3a555..9373f9ddb443 100644
--- a/configs/sama5d4_xplained_nandflash_defconfig
+++ b/configs/sama5d4_xplained_nandflash_defconfig
@@ -41,6 +41,7 @@ CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d4_xplained"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dma-names dmas"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/sama5d4ek_nandflash_defconfig b/configs/sama5d4ek_nandflash_defconfig
index df8502482ea0..c9df00c41673 100644
--- a/configs/sama5d4ek_nandflash_defconfig
+++ b/configs/sama5d4ek_nandflash_defconfig
@@ -43,6 +43,7 @@ CONFIG_DEFAULT_DEVICE_TREE="at91-sama5d4ek"
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-parent dma-names dmas"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x100000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_SPL_DM=y
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index 10355ce319a7..716096abc543 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -1,4 +1,5 @@
 CONFIG_SYS_TEXT_BASE=0
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_PRE_CON_BUF_ADDR=0x100000
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 9b11a9e1e2f5..a8144436ebdc 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -1,4 +1,5 @@
 CONFIG_SYS_TEXT_BASE=0
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_PRE_CON_BUF_ADDR=0xf0000
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index 4cdc17f9724c..774c278bce82 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -1,4 +1,5 @@
 CONFIG_SYS_TEXT_BASE=0
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 3399ec1aae65..02702fa7a557 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -3,6 +3,7 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_BOOTSTAGE_STASH_ADDR=0x0
diff --git a/configs/sansa_fuze_plus_defconfig b/configs/sansa_fuze_plus_defconfig
index 5e6a05ea8cdc..5ee5ef0c1697 100644
--- a/configs/sansa_fuze_plus_defconfig
+++ b/configs/sansa_fuze_plus_defconfig
@@ -6,6 +6,7 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_SANSA_FUZE_PLUS=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/sbc8349_PCI_33_defconfig b/configs/sbc8349_PCI_33_defconfig
index c0e513dc2733..a042b1e886ee 100644
--- a/configs/sbc8349_PCI_33_defconfig
+++ b/configs/sbc8349_PCI_33_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=33000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -100,6 +102,8 @@ CONFIG_CMD_PCI=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFF840000
+CONFIG_ENV_ADDR_REDUND=0xFF860000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sbc8349_PCI_66_defconfig b/configs/sbc8349_PCI_66_defconfig
index f35973f94ce1..6d09d61fd388 100644
--- a/configs/sbc8349_PCI_66_defconfig
+++ b/configs/sbc8349_PCI_66_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -100,6 +102,8 @@ CONFIG_CMD_PCI=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFF840000
+CONFIG_ENV_ADDR_REDUND=0xFF860000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sbc8349_defconfig b/configs/sbc8349_defconfig
index 0c90e576a4bc..efcaae90c1b1 100644
--- a/configs/sbc8349_defconfig
+++ b/configs/sbc8349_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFF800000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -77,6 +79,8 @@ CONFIG_CMD_I2C=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFF840000
+CONFIG_ENV_ADDR_REDUND=0xFF860000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sbc8548_PCI_33_PCIE_defconfig b/configs/sbc8548_PCI_33_PCIE_defconfig
index 5a04646a7ecd..e3eca06cd026 100644
--- a/configs/sbc8548_PCI_33_PCIE_defconfig
+++ b/configs/sbc8548_PCI_33_PCIE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFFA0000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_SBC8548=y
@@ -19,6 +21,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 # CONFIG_CMD_IRQ is not set
+CONFIG_ENV_ADDR=0xFFFE0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sbc8548_PCI_33_defconfig b/configs/sbc8548_PCI_33_defconfig
index 36291e0e7a98..9583402ebfb1 100644
--- a/configs/sbc8548_PCI_33_defconfig
+++ b/configs/sbc8548_PCI_33_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFFA0000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_SBC8548=y
@@ -19,6 +21,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 # CONFIG_CMD_IRQ is not set
+CONFIG_ENV_ADDR=0xFFFE0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sbc8548_PCI_66_PCIE_defconfig b/configs/sbc8548_PCI_66_PCIE_defconfig
index cfe0f3a340ef..3d8033f6b4dd 100644
--- a/configs/sbc8548_PCI_66_PCIE_defconfig
+++ b/configs/sbc8548_PCI_66_PCIE_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFFA0000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_SBC8548=y
@@ -19,6 +21,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 # CONFIG_CMD_IRQ is not set
+CONFIG_ENV_ADDR=0xFFFE0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sbc8548_PCI_66_defconfig b/configs/sbc8548_PCI_66_defconfig
index e4b3c63def03..0eb0cc542ac1 100644
--- a/configs/sbc8548_PCI_66_defconfig
+++ b/configs/sbc8548_PCI_66_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFFA0000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_SBC8548=y
@@ -19,6 +21,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 # CONFIG_CMD_IRQ is not set
+CONFIG_ENV_ADDR=0xFFFE0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sbc8548_defconfig b/configs/sbc8548_defconfig
index 33be2b90df74..4e090770a80a 100644
--- a/configs/sbc8548_defconfig
+++ b/configs/sbc8548_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFFA0000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_SBC8548=y
@@ -17,6 +19,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 # CONFIG_CMD_HASH is not set
 # CONFIG_CMD_IRQ is not set
+CONFIG_ENV_ADDR=0xFFFE0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sbc8641d_defconfig b/configs/sbc8641d_defconfig
index 47cec18a95ec..767428a04d96 100644
--- a/configs/sbc8641d_defconfig
+++ b/configs/sbc8641d_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC86xx=y
 CONFIG_HIGH_BATS=y
 CONFIG_TARGET_SBC8641D=y
@@ -16,6 +18,7 @@ CONFIG_CMD_PCI=y
 CONFIG_CMD_PING=y
 CONFIG_MP=y
 CONFIG_DOS_PARTITION=y
+CONFIG_ENV_ADDR=0xFFF60000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/sc_sps_1_defconfig b/configs/sc_sps_1_defconfig
index 596c628baada..679d10a8345c 100644
--- a/configs/sc_sps_1_defconfig
+++ b/configs/sc_sps_1_defconfig
@@ -6,6 +6,8 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_SC_SPS_1=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/seaboard_defconfig b/configs/seaboard_defconfig
index 3b3f5c330433..a6402483df59 100644
--- a/configs/seaboard_defconfig
+++ b/configs/seaboard_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA20=y
 CONFIG_TARGET_SEABOARD=y
diff --git a/configs/secomx6quq7_defconfig b/configs/secomx6quq7_defconfig
index 48fb20bb8e32..2ef64b7fe125 100644
--- a/configs/secomx6quq7_defconfig
+++ b/configs/secomx6quq7_defconfig
@@ -5,6 +5,8 @@ CONFIG_TARGET_SECOMX6=y
 CONFIG_SECOMX6_UQ7=y
 CONFIG_SECOMX6Q=y
 CONFIG_SECOMX6_2GB=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_BOOTDELAY=3
 CONFIG_SUPPORT_RAW_INITRD=y
diff --git a/configs/sei510_defconfig b/configs/sei510_defconfig
index 4bb75a02f4fd..9914e286c716 100644
--- a/configs/sei510_defconfig
+++ b/configs/sei510_defconfig
@@ -4,6 +4,8 @@ CONFIG_SYS_CONFIG_NAME="sei510"
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_G12A=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xFFFF0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff803000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/sei610_defconfig b/configs/sei610_defconfig
index 83c5834b2527..37934fb9886d 100644
--- a/configs/sei610_defconfig
+++ b/configs/sei610_defconfig
@@ -4,6 +4,8 @@ CONFIG_SYS_CONFIG_NAME="sei610"
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_G12A=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xFFFF0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff803000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/sfr_nb4-ser_ram_defconfig b/configs/sfr_nb4-ser_ram_defconfig
index eea1409d6f29..325893aad9e9 100644
--- a/configs/sfr_nb4-ser_ram_defconfig
+++ b/configs/sfr_nb4-ser_ram_defconfig
@@ -1,5 +1,6 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0x80010000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARCH_BMIPS=y
 CONFIG_SOC_BMIPS_BCM6358=y
diff --git a/configs/sh7752evb_defconfig b/configs/sh7752evb_defconfig
index d9fa1ca57fc9..12651028c59d 100644
--- a/configs/sh7752evb_defconfig
+++ b/configs/sh7752evb_defconfig
@@ -1,5 +1,6 @@
 CONFIG_SH=y
 CONFIG_SYS_TEXT_BASE=0x5ff80000
+CONFIG_ENV_SIZE=0x10000
 CONFIG_SH_32BIT=y
 CONFIG_TARGET_SH7752EVB=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/sh7753evb_defconfig b/configs/sh7753evb_defconfig
index e5698d802f78..bcece6f5328e 100644
--- a/configs/sh7753evb_defconfig
+++ b/configs/sh7753evb_defconfig
@@ -1,5 +1,6 @@
 CONFIG_SH=y
 CONFIG_SYS_TEXT_BASE=0x5ff80000
+CONFIG_ENV_SIZE=0x10000
 CONFIG_TARGET_SH7753EVB=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
diff --git a/configs/sh7757lcr_defconfig b/configs/sh7757lcr_defconfig
index f9b7379cee75..91579b83ea2e 100644
--- a/configs/sh7757lcr_defconfig
+++ b/configs/sh7757lcr_defconfig
@@ -1,5 +1,6 @@
 CONFIG_SH=y
 CONFIG_SYS_TEXT_BASE=0x8ef80000
+CONFIG_ENV_SIZE=0x10000
 CONFIG_SH_32BIT=y
 CONFIG_TARGET_SH7757LCR=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/sh7763rdp_defconfig b/configs/sh7763rdp_defconfig
index 74c174b27b91..2ec6939caabd 100644
--- a/configs/sh7763rdp_defconfig
+++ b/configs/sh7763rdp_defconfig
@@ -1,5 +1,7 @@
 CONFIG_SH=y
 CONFIG_SYS_TEXT_BASE=0x8FFC0000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_TARGET_SH7763RDP=y
 CONFIG_BOOTDELAY=-1
 CONFIG_USE_BOOTARGS=y
@@ -28,6 +30,8 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_JFFS2=y
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xA0020000
+CONFIG_ENV_ADDR_REDUND=0xA0040000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index cc485364153a..7bcfdadffe31 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -5,6 +5,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_KIRKWOOD=y
 CONFIG_SYS_TEXT_BASE=0x600000
 CONFIG_TARGET_SHEEVAPLUG=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_IDENT_STRING="\nMarvell-Sheevaplug"
 # CONFIG_SYS_MALLOC_F is not set
diff --git a/configs/sifive_fu540_defconfig b/configs/sifive_fu540_defconfig
index 5f6d1c765f10..790da97667f8 100644
--- a/configs/sifive_fu540_defconfig
+++ b/configs/sifive_fu540_defconfig
@@ -1,4 +1,5 @@
 CONFIG_RISCV=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_TARGET_SIFIVE_FU540=y
 CONFIG_ARCH_RV64I=y
diff --git a/configs/silk_defconfig b/configs/silk_defconfig
index b24f51c4d104..3043e17eb16a 100644
--- a/configs/silk_defconfig
+++ b/configs/silk_defconfig
@@ -12,9 +12,12 @@ CONFIG_ARCH_RMOBILE_BOARD_STRING="Silk"
 CONFIG_R8A7794=y
 CONFIG_TARGET_SILK=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0xe6300000
@@ -54,6 +57,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7794-silk-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xC0000
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/sksimx6_defconfig b/configs/sksimx6_defconfig
index d5897e940c96..cc4f0abc921d 100644
--- a/configs/sksimx6_defconfig
+++ b/configs/sksimx6_defconfig
@@ -8,6 +8,8 @@ CONFIG_MX6_DDRCAL=y
 CONFIG_TARGET_SKSIMX6=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
@@ -32,6 +34,7 @@ CONFIG_CMD_CACHE=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x64000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_FSL_USDHC=y
diff --git a/configs/slimbootloader_defconfig b/configs/slimbootloader_defconfig
index 5171cf59526c..4a4fb1100d40 100644
--- a/configs/slimbootloader_defconfig
+++ b/configs/slimbootloader_defconfig
@@ -1,4 +1,5 @@
 CONFIG_X86=y
+CONFIG_ENV_SIZE=0x1000
 CONFIG_VENDOR_INTEL=y
 CONFIG_TARGET_SLIMBOOTLOADER=y
 # CONFIG_USE_CAR is not set
diff --git a/configs/smartweb_defconfig b/configs/smartweb_defconfig
index 5d2837d8e2a7..1a7437b7e149 100644
--- a/configs/smartweb_defconfig
+++ b/configs/smartweb_defconfig
@@ -44,6 +44,7 @@ CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="at91sam9260-smartweb"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x180000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_CLK=y
 CONFIG_CLK_AT91=y
diff --git a/configs/smdk5250_defconfig b/configs/smdk5250_defconfig
index 4456e51f3b3d..b3e58281a359 100644
--- a/configs/smdk5250_defconfig
+++ b/configs/smdk5250_defconfig
@@ -6,8 +6,11 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
 CONFIG_ARCH_EXYNOS5=y
 CONFIG_TARGET_SMDK5250=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x3FC000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x4000
 CONFIG_IDENT_STRING=" for SMDK5250"
 CONFIG_SPL_TEXT_BASE=0x02023400
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/smdk5420_defconfig b/configs/smdk5420_defconfig
index 00460c487e74..968f3a1afefb 100644
--- a/configs/smdk5420_defconfig
+++ b/configs/smdk5420_defconfig
@@ -4,8 +4,11 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x23E00000
 CONFIG_ARCH_EXYNOS5=y
 CONFIG_TARGET_SMDK5420=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x3FC000
 CONFIG_NR_DRAM_BANKS=7
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x4000
 CONFIG_IDENT_STRING=" for SMDK5420"
 CONFIG_SPL_TEXT_BASE=0x02024410
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/smdkc100_defconfig b/configs/smdkc100_defconfig
index 88b56cbb814e..76bb74df8523 100644
--- a/configs/smdkc100_defconfig
+++ b/configs/smdkc100_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_S5PC1XX=y
 CONFIG_SYS_TEXT_BASE=0x34800000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_SMDKC100=y
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING=" for SMDKC100"
@@ -21,6 +22,7 @@ CONFIG_MTDIDS_DEFAULT="onenand0=s3c-onenand"
 CONFIG_MTDPARTS_DEFAULT="mtdparts=s3c-onenand:256k(bootloader),128k@0x40000(params),3m@0x60000(kernel),16m@0x360000(test),-(UBI)"
 CONFIG_DEFAULT_DEVICE_TREE="s5pc1xx-smdkc100"
 CONFIG_ENV_IS_IN_ONENAND=y
+CONFIG_ENV_ADDR=0x40000
 # CONFIG_MMC is not set
 CONFIG_MTD_DEVICE=y
 CONFIG_SMC911X=y
diff --git a/configs/smdkv310_defconfig b/configs/smdkv310_defconfig
index 981010bd9b48..95d83cff04f3 100644
--- a/configs/smdkv310_defconfig
+++ b/configs/smdkv310_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARCH_CPU_INIT=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
 CONFIG_ARCH_EXYNOS4=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x4200
 CONFIG_SPL=y
 CONFIG_IDENT_STRING=" for SMDKC210/V310"
 CONFIG_SPL_TEXT_BASE=0x02021410
diff --git a/configs/snow_defconfig b/configs/snow_defconfig
index b10d8ed5bf18..c0d43e68d6b7 100644
--- a/configs/snow_defconfig
+++ b/configs/snow_defconfig
@@ -6,10 +6,13 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
 CONFIG_ARCH_EXYNOS5=y
 CONFIG_TARGET_SNOW=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x3FC000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0x12c30000
 CONFIG_DEBUG_UART_CLOCK=100000000
+CONFIG_ENV_SECT_SIZE=0x4000
 CONFIG_IDENT_STRING=" for snow"
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x02023400
diff --git a/configs/socfpga_arria10_defconfig b/configs/socfpga_arria10_defconfig
index 016379967fad..e822cdcc4ee4 100644
--- a/configs/socfpga_arria10_defconfig
+++ b/configs/socfpga_arria10_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_ARRIA10_SOCDK=y
 CONFIG_IDENT_STRING="socfpga_arria10"
 CONFIG_SPL_FS_FAT=y
diff --git a/configs/socfpga_arria5_defconfig b/configs/socfpga_arria5_defconfig
index c4c71177b953..94dbe566b0c8 100644
--- a/configs/socfpga_arria5_defconfig
+++ b/configs/socfpga_arria5_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_ARRIA5_SOCDK=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/socfpga_cyclone5_defconfig b/configs/socfpga_cyclone5_defconfig
index 6bf7172c2c0f..290e9697571b 100644
--- a/configs/socfpga_cyclone5_defconfig
+++ b/configs/socfpga_cyclone5_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_CYCLONE5_SOCDK=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/socfpga_dbm_soc1_defconfig b/configs/socfpga_dbm_soc1_defconfig
index 298b66c2eb08..3b4a1f54127b 100644
--- a/configs/socfpga_dbm_soc1_defconfig
+++ b/configs/socfpga_dbm_soc1_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_DEVBOARDS_DBM_SOC1=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_FIT=y
diff --git a/configs/socfpga_de0_nano_soc_defconfig b/configs/socfpga_de0_nano_soc_defconfig
index ebb34f5b7311..ddf17ada963e 100644
--- a/configs/socfpga_de0_nano_soc_defconfig
+++ b/configs/socfpga_de0_nano_soc_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_TERASIC_DE0_NANO=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/socfpga_de10_nano_defconfig b/configs/socfpga_de10_nano_defconfig
index 7a0e1c75242f..98ec7b32de29 100644
--- a/configs/socfpga_de10_nano_defconfig
+++ b/configs/socfpga_de10_nano_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_TERASIC_DE10_NANO=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/socfpga_de1_soc_defconfig b/configs/socfpga_de1_soc_defconfig
index c14be93621b9..c70ff1ff7b34 100644
--- a/configs/socfpga_de1_soc_defconfig
+++ b/configs/socfpga_de1_soc_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_TERASIC_DE1_SOC=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/socfpga_is1_defconfig b/configs/socfpga_is1_defconfig
index 30d3b2a2a261..f86a955b9c57 100644
--- a/configs/socfpga_is1_defconfig
+++ b/configs/socfpga_is1_defconfig
@@ -1,7 +1,10 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_TARGET_SOCFPGA_IS1=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0xfffffff8
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
diff --git a/configs/socfpga_mcvevk_defconfig b/configs/socfpga_mcvevk_defconfig
index 1eb57a60d309..600acfd9f1ad 100644
--- a/configs/socfpga_mcvevk_defconfig
+++ b/configs/socfpga_mcvevk_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_ARIES_MCVEVK=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/socfpga_sockit_defconfig b/configs/socfpga_sockit_defconfig
index f9b5ee2d00b5..20535719ef29 100644
--- a/configs/socfpga_sockit_defconfig
+++ b/configs/socfpga_sockit_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_TERASIC_SOCKIT=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/socfpga_socrates_defconfig b/configs/socfpga_socrates_defconfig
index e24723673c10..ffead58383c5 100644
--- a/configs/socfpga_socrates_defconfig
+++ b/configs/socfpga_socrates_defconfig
@@ -1,5 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x4400
 CONFIG_TARGET_SOCFPGA_EBV_SOCRATES=y
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/socfpga_sr1500_defconfig b/configs/socfpga_sr1500_defconfig
index 08b829ddb8f5..78cb072abf7a 100644
--- a/configs/socfpga_sr1500_defconfig
+++ b/configs/socfpga_sr1500_defconfig
@@ -1,7 +1,10 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0xE0000
 CONFIG_TARGET_SOCFPGA_SR1500=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0xfffffff8
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
@@ -36,6 +39,7 @@ CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_sr1500"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xF0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_BOOTCOUNT_LIMIT=y
diff --git a/configs/socfpga_stratix10_defconfig b/configs/socfpga_stratix10_defconfig
index c7e8bf6aca23..de3a2cb25277 100644
--- a/configs/socfpga_stratix10_defconfig
+++ b/configs/socfpga_stratix10_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
 CONFIG_SYS_TEXT_BASE=0x1000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x200
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TARGET_SOCFPGA_STRATIX10_SOCDK=y
 CONFIG_IDENT_STRING="socfpga_stratix10"
diff --git a/configs/socfpga_vining_fpga_defconfig b/configs/socfpga_vining_fpga_defconfig
index 5175c6493d69..130282c5af82 100644
--- a/configs/socfpga_vining_fpga_defconfig
+++ b/configs/socfpga_vining_fpga_defconfig
@@ -1,6 +1,9 @@
 CONFIG_ARM=y
 CONFIG_ARCH_SOCFPGA=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_TARGET_SOCFPGA_SOFTING_VINING_FPGA=y
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_TEXT_BASE=0xFFFF0000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
@@ -41,6 +44,7 @@ CONFIG_CMD_UBI=y
 CONFIG_DEFAULT_DEVICE_TREE="socfpga_cyclone5_vining_fpga"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x110000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
diff --git a/configs/socrates_defconfig b/configs/socrates_defconfig
index 99e65f495dfe..ae99637d47a5 100644
--- a/configs/socrates_defconfig
+++ b/configs/socrates_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff80000
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_SOCRATES=y
@@ -37,6 +39,8 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="socrates"
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFFF40000
+CONFIG_ENV_ADDR_REDUND=0xFFF20000
 CONFIG_DM=y
 CONFIG_BLK=y
 CONFIG_DM_I2C=y
diff --git a/configs/som-db5800-som-6867_defconfig b/configs/som-db5800-som-6867_defconfig
index 692b75a2c163..4c0ba53b0436 100644
--- a/configs/som-db5800-som-6867_defconfig
+++ b/configs/som-db5800-som-6867_defconfig
@@ -1,8 +1,11 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x6EF000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_DEBUG_UART_BASE=0x3f8
 CONFIG_DEBUG_UART_CLOCK=1843200
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_ADVANTECH=y
 CONFIG_TARGET_SOM_DB5800_SOM_6867=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/spear300_defconfig b/configs/spear300_defconfig
index 8e22c1e9d1f0..f020249aa443 100644
--- a/configs/spear300_defconfig
+++ b/configs/spear300_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR300=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR300"
 CONFIG_BOOTDELAY=1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF8040000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear300_nand_defconfig b/configs/spear300_nand_defconfig
index acd2d8b08bba..3bd39c37bb05 100644
--- a/configs/spear300_nand_defconfig
+++ b/configs/spear300_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR300=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR300"
diff --git a/configs/spear300_usbtty_defconfig b/configs/spear300_usbtty_defconfig
index fbdd4a31afee..11b62c4ce952 100644
--- a/configs/spear300_usbtty_defconfig
+++ b/configs/spear300_usbtty_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR300=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR300,USBTTY"
 CONFIG_BOOTDELAY=-1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF8040000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear300_usbtty_nand_defconfig b/configs/spear300_usbtty_nand_defconfig
index 3136f482b7c7..fd0c66d2eead 100644
--- a/configs/spear300_usbtty_nand_defconfig
+++ b/configs/spear300_usbtty_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR300=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR300,USBTTY"
diff --git a/configs/spear310_defconfig b/configs/spear310_defconfig
index 423e1ff00937..e210ea79d4bf 100644
--- a/configs/spear310_defconfig
+++ b/configs/spear310_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR310=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR310"
 CONFIG_BOOTDELAY=1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF8040000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear310_nand_defconfig b/configs/spear310_nand_defconfig
index cd29bb7e75c3..669bb79033ca 100644
--- a/configs/spear310_nand_defconfig
+++ b/configs/spear310_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR310=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR310"
diff --git a/configs/spear310_pnor_defconfig b/configs/spear310_pnor_defconfig
index dea51b9efe82..27cdb6bdb9e4 100644
--- a/configs/spear310_pnor_defconfig
+++ b/configs/spear310_pnor_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR310=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR310,FLASH_PNOR"
 CONFIG_BOOTDELAY=1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x50060000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear310_usbtty_defconfig b/configs/spear310_usbtty_defconfig
index 722c84804d25..33fd690b3750 100644
--- a/configs/spear310_usbtty_defconfig
+++ b/configs/spear310_usbtty_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR310=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR310,USBTTY"
 CONFIG_BOOTDELAY=-1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF8040000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear310_usbtty_nand_defconfig b/configs/spear310_usbtty_nand_defconfig
index dc78280c18ff..badcae64a49c 100644
--- a/configs/spear310_usbtty_nand_defconfig
+++ b/configs/spear310_usbtty_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR310=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR310,USBTTY"
diff --git a/configs/spear310_usbtty_pnor_defconfig b/configs/spear310_usbtty_pnor_defconfig
index 7fd7dda43114..79686cbb2dcd 100644
--- a/configs/spear310_usbtty_pnor_defconfig
+++ b/configs/spear310_usbtty_pnor_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR310=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR310,USBTTY,FLASH_PNOR"
 CONFIG_BOOTDELAY=-1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x50060000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear320_defconfig b/configs/spear320_defconfig
index 979bf04121fd..0864acd6b389 100644
--- a/configs/spear320_defconfig
+++ b/configs/spear320_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR320=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR320"
 CONFIG_BOOTDELAY=1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF8040000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear320_nand_defconfig b/configs/spear320_nand_defconfig
index 13aeff87c605..4286d94ce9cf 100644
--- a/configs/spear320_nand_defconfig
+++ b/configs/spear320_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR320=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR320"
diff --git a/configs/spear320_pnor_defconfig b/configs/spear320_pnor_defconfig
index f7dd48711500..958be6b90f54 100644
--- a/configs/spear320_pnor_defconfig
+++ b/configs/spear320_pnor_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR320=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR320,FLASH_PNOR"
 CONFIG_BOOTDELAY=1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x44060000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear320_usbtty_defconfig b/configs/spear320_usbtty_defconfig
index 9fab406f13a4..954d325e983e 100644
--- a/configs/spear320_usbtty_defconfig
+++ b/configs/spear320_usbtty_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR320=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR320,USBTTY"
 CONFIG_BOOTDELAY=-1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF8040000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear320_usbtty_nand_defconfig b/configs/spear320_usbtty_nand_defconfig
index c38e75475847..d9e4e0539e7c 100644
--- a/configs/spear320_usbtty_nand_defconfig
+++ b/configs/spear320_usbtty_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR320=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR320,USBTTY"
diff --git a/configs/spear320_usbtty_pnor_defconfig b/configs/spear320_usbtty_pnor_defconfig
index 1dfac113d35c..0c2468715eaf 100644
--- a/configs/spear320_usbtty_pnor_defconfig
+++ b/configs/spear320_usbtty_pnor_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR320=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR320,USBTTY,FLASH_PNOR"
 CONFIG_BOOTDELAY=-1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x44060000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear600_defconfig b/configs/spear600_defconfig
index eeb2746a9e76..d1369a9e88d4 100644
--- a/configs/spear600_defconfig
+++ b/configs/spear600_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR600=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR600"
 CONFIG_BOOTDELAY=1
@@ -23,6 +25,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF8040000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear600_nand_defconfig b/configs/spear600_nand_defconfig
index b1202f601a66..0bc5fa935afe 100644
--- a/configs/spear600_nand_defconfig
+++ b/configs/spear600_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR600=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR600"
diff --git a/configs/spear600_usbtty_defconfig b/configs/spear600_usbtty_defconfig
index 2e6f3f159cf9..2affcfe8e0de 100644
--- a/configs/spear600_usbtty_defconfig
+++ b/configs/spear600_usbtty_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR600=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR600,USBTTY"
 CONFIG_BOOTDELAY=-1
@@ -20,6 +22,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF8040000
 CONFIG_SYS_I2C_DW=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/spear600_usbtty_nand_defconfig b/configs/spear600_usbtty_nand_defconfig
index 8265eb49e064..207068da71eb 100644
--- a/configs/spear600_usbtty_nand_defconfig
+++ b/configs/spear600_usbtty_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_CPU_INIT=y
 CONFIG_TARGET_SPEAR600=y
 CONFIG_SYS_TEXT_BASE=0x00700000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SYS_EXTRA_OPTIONS="SPEAR600,USBTTY"
diff --git a/configs/spring_defconfig b/configs/spring_defconfig
index 4ccef7fff492..ce9899136156 100644
--- a/configs/spring_defconfig
+++ b/configs/spring_defconfig
@@ -6,10 +6,13 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43E00000
 CONFIG_ARCH_EXYNOS5=y
 CONFIG_TARGET_SPRING=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x3FC000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0x12c30000
 CONFIG_DEBUG_UART_CLOCK=100000000
+CONFIG_ENV_SECT_SIZE=0x4000
 CONFIG_IDENT_STRING=" for spring"
 CONFIG_DEBUG_UART=y
 CONFIG_SPL_TEXT_BASE=0x02023400
diff --git a/configs/stih410-b2260_defconfig b/configs/stih410-b2260_defconfig
index 7b5fafe5bf6a..3c159ce39dd0 100644
--- a/configs/stih410-b2260_defconfig
+++ b/configs/stih410-b2260_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STI=y
 CONFIG_SYS_TEXT_BASE=0x7D600000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_IDENT_STRING="STMicroelectronics STiH410-B2260"
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
index 45fdb9d2ad7f..54cc51782467 100644
--- a/configs/stm32f429-discovery_defconfig
+++ b/configs/stm32f429-discovery_defconfig
@@ -2,9 +2,11 @@ CONFIG_ARM=y
 CONFIG_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_F_LEN=0xF00
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_STM32F4=y
 CONFIG_TARGET_STM32F429_DISCOVERY=y
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_BOOTDELAY=3
 CONFIG_USE_BOOTARGS=y
@@ -21,6 +23,7 @@ CONFIG_CMD_TIMER=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="stm32f429-disco"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x8040000
 # CONFIG_NET is not set
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/stm32f429-evaluation_defconfig b/configs/stm32f429-evaluation_defconfig
index a9c27959ebb1..24f79b51bf4d 100644
--- a/configs/stm32f429-evaluation_defconfig
+++ b/configs/stm32f429-evaluation_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_F_LEN=0xF00
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_STM32F4=y
 CONFIG_TARGET_STM32F429_EVALUATION=y
diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
index 5cf46aeecbd3..61ae8dc539df 100644
--- a/configs/stm32f469-discovery_defconfig
+++ b/configs/stm32f469-discovery_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_F_LEN=0xF00
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_STM32F4=y
 CONFIG_TARGET_STM32F469_DISCOVERY=y
diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
index 2a018c7dc96e..bd03a5322cba 100644
--- a/configs/stm32f746-disco_defconfig
+++ b/configs/stm32f746-disco_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08008000
 CONFIG_SYS_MALLOC_F_LEN=0xE00
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_STM32F7=y
 CONFIG_TARGET_STM32F746_DISCO=y
diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
index 3517a16aac38..44affcce33aa 100644
--- a/configs/stm32f769-disco_defconfig
+++ b/configs/stm32f769-disco_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08008000
 CONFIG_SYS_MALLOC_F_LEN=0xE00
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_STM32F7=y
 CONFIG_TARGET_STM32F746_DISCO=y
diff --git a/configs/stm32h743-disco_defconfig b/configs/stm32h743-disco_defconfig
index ac001f844b03..3b7e152d44f6 100644
--- a/configs/stm32h743-disco_defconfig
+++ b/configs/stm32h743-disco_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_F_LEN=0xF00
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_STM32H7=y
 CONFIG_TARGET_STM32H743_DISCO=y
diff --git a/configs/stm32h743-eval_defconfig b/configs/stm32h743-eval_defconfig
index 3823ec9a86c7..24e250abf8a8 100644
--- a/configs/stm32h743-eval_defconfig
+++ b/configs/stm32h743-eval_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_STM32=y
 CONFIG_SYS_TEXT_BASE=0x08000000
 CONFIG_SYS_MALLOC_F_LEN=0xF00
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_STM32H7=y
 CONFIG_TARGET_STM32H743_EVAL=y
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 8f1ce400b729..db653daac015 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -58,6 +58,7 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_ENV_EXT4_INTERFACE="mmc"
 CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
 CONFIG_ENV_EXT4_FILE="/uboot.env"
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index e156aaf31b2c..8f4199d24d6c 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -45,6 +45,7 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_ENV_EXT4_INTERFACE="mmc"
 CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
 CONFIG_ENV_EXT4_FILE="/uboot.env"
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 439370b6c805..5e5528f37bc3 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -44,6 +44,7 @@ CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
 CONFIG_ENV_EXT4_INTERFACE="mmc"
 CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
 CONFIG_ENV_EXT4_FILE="/uboot.env"
+CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_ENV_UBI_PART="UBI"
 CONFIG_ENV_UBI_VOLUME="uboot_config"
 CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
diff --git a/configs/stmark2_defconfig b/configs/stmark2_defconfig
index eb130857aef3..4c5de0833bca 100644
--- a/configs/stmark2_defconfig
+++ b/configs/stmark2_defconfig
@@ -1,5 +1,8 @@
 CONFIG_M68K=y
 CONFIG_SYS_TEXT_BASE=0x47E00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x40000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_STMARK2=y
 CONFIG_SYS_EXTRA_OPTIONS="CF_SBF,SYS_SERIAL_BOOT,SYS_INPUT_CLKSRC=30000000"
 # CONFIG_DISPLAY_BOARDINFO is not set
diff --git a/configs/stout_defconfig b/configs/stout_defconfig
index a06098a8efff..69a914bbda05 100644
--- a/configs/stout_defconfig
+++ b/configs/stout_defconfig
@@ -12,9 +12,12 @@ CONFIG_ARCH_RMOBILE_BOARD_STRING="Stout"
 CONFIG_R8A7790=y
 CONFIG_TARGET_STOUT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x40000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_SPL_SYS_MALLOC_F_LEN=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0xe6300000
@@ -54,6 +57,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:256k(u-boot-spl),512k(u-boot-env1),512k
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="r8a7790-stout-u-boot"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0xC0000
 CONFIG_CLK=y
 CONFIG_CLK_RENESAS=y
 CONFIG_DM_GPIO=y
diff --git a/configs/strider_con_defconfig b/configs/strider_con_defconfig
index 8fb955c6f478..1c3146ed1800 100644
--- a/configs/strider_con_defconfig
+++ b/configs/strider_con_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" strider con 0.01"
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
@@ -117,6 +119,8 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE060000
+CONFIG_ENV_ADDR_REDUND=0xFE070000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/strider_con_dp_defconfig b/configs/strider_con_dp_defconfig
index 05272bd26679..0cea69d0c0a0 100644
--- a/configs/strider_con_dp_defconfig
+++ b/configs/strider_con_dp_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" strider con dp 0.01"
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
@@ -117,6 +119,8 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE060000
+CONFIG_ENV_ADDR_REDUND=0xFE070000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/strider_cpu_defconfig b/configs/strider_cpu_defconfig
index f6bb254319a9..3a5db81a598e 100644
--- a/configs/strider_cpu_defconfig
+++ b/configs/strider_cpu_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" strider cpu 0.01"
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
@@ -117,6 +119,8 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE060000
+CONFIG_ENV_ADDR_REDUND=0xFE070000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/strider_cpu_dp_defconfig b/configs/strider_cpu_dp_defconfig
index 0b1f16134f71..3897d864f9ba 100644
--- a/configs/strider_cpu_dp_defconfig
+++ b/configs/strider_cpu_dp_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" strider cpu dp 0.01"
 CONFIG_SYS_CLK_FREQ=33333333
 CONFIG_MPC83xx=y
@@ -117,6 +119,8 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_EXT2=y
 CONFIG_DOS_PARTITION=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE060000
+CONFIG_ENV_ADDR_REDUND=0xFE070000
 CONFIG_FSL_ESDHC=y
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/stv0991_defconfig b/configs/stv0991_defconfig
index eca2f2df6ba9..55fdf4b8f783 100644
--- a/configs/stv0991_defconfig
+++ b/configs/stv0991_defconfig
@@ -3,7 +3,10 @@ CONFIG_SYS_DCACHE_OFF=y
 CONFIG_TARGET_STV0991=y
 CONFIG_SYS_TEXT_BASE=0x00010000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x30000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SYS_EXTRA_OPTIONS="STV0991"
 CONFIG_BOOTDELAY=3
 # CONFIG_DISPLAY_CPUINFO is not set
@@ -22,6 +25,7 @@ CONFIG_CMD_PING=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="stv0991"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x188000
 # CONFIG_MMC is not set
 CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
diff --git a/configs/suvd3_defconfig b/configs/suvd3_defconfig
index a7782d50cd1d..659baa2bef1d 100644
--- a/configs/suvd3_defconfig
+++ b/configs/suvd3_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE0113FF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -162,6 +164,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=boot:768k(u-boot),128k(env),128k(envred),-(ubi
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF00C0000
+CONFIG_ENV_ADDR_REDUND=0xF00E0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/taurus_defconfig b/configs/taurus_defconfig
index db8804179f03..63a12f89444f 100644
--- a/configs/taurus_defconfig
+++ b/configs/taurus_defconfig
@@ -59,6 +59,7 @@ CONFIG_DEFAULT_DEVICE_TREE="at91sam9g20-taurus"
 CONFIG_SPL_OF_PLATDATA=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x180000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_SPL_DM=y
 CONFIG_BLK=y
diff --git a/configs/tbs2910_defconfig b/configs/tbs2910_defconfig
index 9ab608abb072..ffe043678cdf 100644
--- a/configs/tbs2910_defconfig
+++ b/configs/tbs2910_defconfig
@@ -3,6 +3,8 @@ CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_TBS2910=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_PRE_CON_BUF_ADDR=0x7c000000
 CONFIG_CMD_HDMIDETECT=y
diff --git a/configs/tec-ng_defconfig b/configs/tec-ng_defconfig
index f720f3743f9d..8554e42f74a0 100644
--- a/configs/tec-ng_defconfig
+++ b/configs/tec-ng_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA30=y
 CONFIG_TARGET_TEC_NG=y
diff --git a/configs/tec_defconfig b/configs/tec_defconfig
index 48945a8fada2..b09de07291a3 100644
--- a/configs/tec_defconfig
+++ b/configs/tec_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x1FFE0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA20=y
 CONFIG_TARGET_TEC=y
diff --git a/configs/theadorable-x86-conga-qa3-e3845-pcie-x4_defconfig b/configs/theadorable-x86-conga-qa3-e3845-pcie-x4_defconfig
index ee94863ccd6f..edc201ac2541 100644
--- a/configs/theadorable-x86-conga-qa3-e3845-pcie-x4_defconfig
+++ b/configs/theadorable-x86-conga-qa3-e3845-pcie-x4_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x6EC000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_CONGATEC=y
 CONFIG_TARGET_THEADORABLE_X86_CONGA_QA3_E3845=y
 CONFIG_INTERNAL_UART=y
@@ -46,6 +49,7 @@ CONFIG_AMIGA_PARTITION=y
 CONFIG_EFI_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="conga-qeval20-qa3-e3845"
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x6EE000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/theadorable-x86-conga-qa3-e3845_defconfig b/configs/theadorable-x86-conga-qa3-e3845_defconfig
index 94d082b0d58f..eb96f672fb56 100644
--- a/configs/theadorable-x86-conga-qa3-e3845_defconfig
+++ b/configs/theadorable-x86-conga-qa3-e3845_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x6EC000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_CONGATEC=y
 CONFIG_TARGET_THEADORABLE_X86_CONGA_QA3_E3845=y
 CONFIG_INTERNAL_UART=y
@@ -45,6 +48,7 @@ CONFIG_ISO_PARTITION=y
 CONFIG_EFI_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="conga-qeval20-qa3-e3845"
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x6EE000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/theadorable-x86-dfi-bt700_defconfig b/configs/theadorable-x86-dfi-bt700_defconfig
index 10a9c78a5a18..8becc51de4e3 100644
--- a/configs/theadorable-x86-dfi-bt700_defconfig
+++ b/configs/theadorable-x86-dfi-bt700_defconfig
@@ -1,6 +1,9 @@
 CONFIG_X86=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x6EC000
 CONFIG_NR_DRAM_BANKS=8
+CONFIG_ENV_SECT_SIZE=0x1000
 CONFIG_VENDOR_DFI=y
 CONFIG_TARGET_THEADORABLE_X86_DFI_BT700=y
 CONFIG_SMP=y
@@ -43,6 +46,7 @@ CONFIG_ISO_PARTITION=y
 CONFIG_EFI_PARTITION=y
 CONFIG_DEFAULT_DEVICE_TREE="theadorable-x86-dfi-bt700"
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x6EE000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
diff --git a/configs/theadorable_debug_defconfig b/configs/theadorable_debug_defconfig
index b395ad35ab10..ef57644fafd8 100644
--- a/configs/theadorable_debug_defconfig
+++ b/configs/theadorable_debug_defconfig
@@ -7,10 +7,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_THEADORABLE=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/thuban_defconfig b/configs/thuban_defconfig
index 0e0ceb7cdab0..ee8da7b0a52d 100644
--- a/configs/thuban_defconfig
+++ b/configs/thuban_defconfig
@@ -60,6 +60,7 @@ CONFIG_OF_EMBED=y
 CONFIG_DEFAULT_DEVICE_TREE="am335x-draco"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x2E0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_ENV=y
diff --git a/configs/thunderx_88xx_defconfig b/configs/thunderx_88xx_defconfig
index 002d2c958a97..a4ff74e07179 100644
--- a/configs/thunderx_88xx_defconfig
+++ b/configs/thunderx_88xx_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_TARGET_THUNDERX_88XX=y
 CONFIG_SYS_TEXT_BASE=0x00500000
+CONFIG_ENV_SIZE=0x1000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0x87e024000000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/ti816x_evm_defconfig b/configs/ti816x_evm_defconfig
index 13b0c89374b5..f6f58976b970 100644
--- a/configs/ti816x_evm_defconfig
+++ b/configs/ti816x_evm_defconfig
@@ -8,7 +8,7 @@ CONFIG_TARGET_TI816X_EVM=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_ENV_SIZE=0x2000
-CONFIG_ENV_OFFSET=0x001c0000
+CONFIG_ENV_OFFSET=0x1C0000
 CONFIG_SPL=y
 CONFIG_SPL_FS_FAT=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
@@ -41,6 +41,7 @@ CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="dm8168-evm"
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x1E0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_DM=y
 CONFIG_DM_GPIO=y
diff --git a/configs/tinker-rk3288_defconfig b/configs/tinker-rk3288_defconfig
index a48b17f0da39..ad3fe651069f 100644
--- a/configs/tinker-rk3288_defconfig
+++ b/configs/tinker-rk3288_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_ROCKCHIP_RK3288=y
 CONFIG_TARGET_TINKER_RK3288=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL_SIZE_LIMIT=0x4b000
diff --git a/configs/titanium_defconfig b/configs/titanium_defconfig
index 624ce71a6d92..023c99ebb982 100644
--- a/configs/titanium_defconfig
+++ b/configs/titanium_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x17800000
 CONFIG_TARGET_TITANIUM=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x1000000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/barco/titanium/imximage.cfg"
 CONFIG_BOOTDELAY=3
@@ -35,6 +37,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=gpmi-nand:16M(uboot),512k(env1),512k(env2),-(u
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x1080000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_NAND=y
diff --git a/configs/tools-only_defconfig b/configs/tools-only_defconfig
index 381b16959ddd..e36c9debf6d2 100644
--- a/configs/tools-only_defconfig
+++ b/configs/tools-only_defconfig
@@ -1,4 +1,5 @@
 CONFIG_SYS_TEXT_BASE=0
+CONFIG_ENV_SIZE=0x2000
 CONFIG_ANDROID_BOOT_IMAGE=y
 CONFIG_FIT=y
 CONFIG_FIT_SIGNATURE=y
diff --git a/configs/topic_miami_defconfig b/configs/topic_miami_defconfig
index 5be7813078e6..4c3ddc56bd3e 100644
--- a/configs/topic_miami_defconfig
+++ b/configs/topic_miami_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_CONFIG_NAME="topic_miami"
 CONFIG_SPL_SYS_DCACHE_OFF=y
 CONFIG_ARCH_ZYNQ=y
 CONFIG_SYS_TEXT_BASE=0x4000000
+CONFIG_ENV_SIZE=0x8000
 CONFIG_SPL_STACK_R_ADDR=0x200000
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xe0000000
diff --git a/configs/topic_miamilite_defconfig b/configs/topic_miamilite_defconfig
index 15999de90b08..9ea7068ce470 100644
--- a/configs/topic_miamilite_defconfig
+++ b/configs/topic_miamilite_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_CONFIG_NAME="topic_miami"
 CONFIG_SPL_SYS_DCACHE_OFF=y
 CONFIG_ARCH_ZYNQ=y
 CONFIG_SYS_TEXT_BASE=0x4000000
+CONFIG_ENV_SIZE=0x8000
 CONFIG_SPL_STACK_R_ADDR=0x200000
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xe0000000
diff --git a/configs/topic_miamiplus_defconfig b/configs/topic_miamiplus_defconfig
index af58d702d44e..c841ca45e239 100644
--- a/configs/topic_miamiplus_defconfig
+++ b/configs/topic_miamiplus_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_CONFIG_NAME="topic_miami"
 CONFIG_SPL_SYS_DCACHE_OFF=y
 CONFIG_ARCH_ZYNQ=y
 CONFIG_SYS_TEXT_BASE=0x4000000
+CONFIG_ENV_SIZE=0x8000
 CONFIG_SPL_STACK_R_ADDR=0x200000
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xe0000000
diff --git a/configs/tplink_wdr4300_defconfig b/configs/tplink_wdr4300_defconfig
index ba2b76f1b8b6..3a518d062a83 100644
--- a/configs/tplink_wdr4300_defconfig
+++ b/configs/tplink_wdr4300_defconfig
@@ -1,6 +1,7 @@
 CONFIG_MIPS=y
 CONFIG_SYS_TEXT_BASE=0xA1000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x10000
 CONFIG_ARCH_ATH79=y
 CONFIG_BOARD_TPLINK_WDR4300=y
 CONFIG_BOOTDELAY=3
diff --git a/configs/tqma6dl_mba6_mmc_defconfig b/configs/tqma6dl_mba6_mmc_defconfig
index 3065ee9fffab..fe8f2b53fcd0 100644
--- a/configs/tqma6dl_mba6_mmc_defconfig
+++ b/configs/tqma6dl_mba6_mmc_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x4fc00000
 CONFIG_TARGET_TQMA6=y
 CONFIG_TQMA6DL=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/tqma6dl_mba6_spi_defconfig b/configs/tqma6dl_mba6_spi_defconfig
index 5d82a9866cf5..ff8bca966355 100644
--- a/configs/tqma6dl_mba6_spi_defconfig
+++ b/configs/tqma6dl_mba6_spi_defconfig
@@ -4,7 +4,10 @@ CONFIG_SYS_TEXT_BASE=0x4fc00000
 CONFIG_TARGET_TQMA6=y
 CONFIG_TQMA6DL=y
 CONFIG_TQMA6X_SPI_BOOT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_OF_BOARD_SETUP=y
@@ -34,6 +37,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x90000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/tqma6q_mba6_mmc_defconfig b/configs/tqma6q_mba6_mmc_defconfig
index c4c5604ca67e..21af99938051 100644
--- a/configs/tqma6q_mba6_mmc_defconfig
+++ b/configs/tqma6q_mba6_mmc_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x4fc00000
 CONFIG_TARGET_TQMA6=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/tqma6q_mba6_spi_defconfig b/configs/tqma6q_mba6_spi_defconfig
index db71e5f13429..3de61fbe2bbc 100644
--- a/configs/tqma6q_mba6_spi_defconfig
+++ b/configs/tqma6q_mba6_spi_defconfig
@@ -3,7 +3,10 @@ CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x4fc00000
 CONFIG_TARGET_TQMA6=y
 CONFIG_TQMA6X_SPI_BOOT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_OF_BOARD_SETUP=y
@@ -33,6 +36,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x90000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/tqma6s_mba6_mmc_defconfig b/configs/tqma6s_mba6_mmc_defconfig
index ee2a0f91b415..3cb8cf6849f0 100644
--- a/configs/tqma6s_mba6_mmc_defconfig
+++ b/configs/tqma6s_mba6_mmc_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x2fc00000
 CONFIG_TARGET_TQMA6=y
 CONFIG_TQMA6S=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/tqma6s_mba6_spi_defconfig b/configs/tqma6s_mba6_spi_defconfig
index d007d3277602..c0320e3b7837 100644
--- a/configs/tqma6s_mba6_spi_defconfig
+++ b/configs/tqma6s_mba6_spi_defconfig
@@ -4,7 +4,10 @@ CONFIG_SYS_TEXT_BASE=0x2fc00000
 CONFIG_TARGET_TQMA6=y
 CONFIG_TQMA6S=y
 CONFIG_TQMA6X_SPI_BOOT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
 CONFIG_OF_BOARD_SETUP=y
@@ -34,6 +37,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x90000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_FSL_USDHC=y
 CONFIG_SPI_FLASH=y
diff --git a/configs/tqma6s_wru4_mmc_defconfig b/configs/tqma6s_wru4_mmc_defconfig
index 47cb33b5d083..9feced743e4d 100644
--- a/configs/tqma6s_wru4_mmc_defconfig
+++ b/configs/tqma6s_wru4_mmc_defconfig
@@ -4,6 +4,8 @@ CONFIG_SYS_TEXT_BASE=0x2fc00000
 CONFIG_TARGET_TQMA6=y
 CONFIG_TQMA6S=y
 CONFIG_WRU4=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_BOOTCOUNT_ADDR=0x00900000
 CONFIG_FIT=y
diff --git a/configs/trats2_defconfig b/configs/trats2_defconfig
index 3cabd16e0f40..3c247c16d43e 100644
--- a/configs/trats2_defconfig
+++ b/configs/trats2_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x43e00000
 CONFIG_ARCH_EXYNOS4=y
 CONFIG_TARGET_TRATS2=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x7000
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_FIT=y
diff --git a/configs/trats_defconfig b/configs/trats_defconfig
index ed2129cc5aee..cdf38271a4db 100644
--- a/configs/trats_defconfig
+++ b/configs/trats_defconfig
@@ -4,6 +4,8 @@ CONFIG_ARCH_EXYNOS=y
 CONFIG_SYS_TEXT_BASE=0x63300000
 CONFIG_ARCH_EXYNOS4=y
 CONFIG_TARGET_TRATS=y
+CONFIG_ENV_SIZE=0x1000
+CONFIG_ENV_OFFSET=0x7000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_FIT_VERBOSE=y
diff --git a/configs/tricorder_defconfig b/configs/tricorder_defconfig
index 8e2e214f0945..6adc90a9252d 100644
--- a/configs/tricorder_defconfig
+++ b/configs/tricorder_defconfig
@@ -27,6 +27,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=omap2-nand.0:128k(SPL),1m(u-boot),384k(u-boot-
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x2A0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 # CONFIG_NET is not set
 CONFIG_LED_STATUS=y
diff --git a/configs/trimslice_defconfig b/configs/trimslice_defconfig
index ee947c801d51..f4feafe5d4e4 100644
--- a/configs/trimslice_defconfig
+++ b/configs/trimslice_defconfig
@@ -1,7 +1,10 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFE000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x2000
 CONFIG_TEGRA20=y
 CONFIG_TARGET_TRIMSLICE=y
 CONFIG_SPL_TEXT_BASE=0x00108000
diff --git a/configs/ts4600_defconfig b/configs/ts4600_defconfig
index 5a7d72b93c32..85074c7171b6 100644
--- a/configs/ts4600_defconfig
+++ b/configs/ts4600_defconfig
@@ -4,6 +4,8 @@ CONFIG_SYS_TEXT_BASE=0x40002000
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_TS4600=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x40000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/ts4800_defconfig b/configs/ts4800_defconfig
index 58a8d9b5aae2..6a6b3e8e8bc9 100644
--- a/configs/ts4800_defconfig
+++ b/configs/ts4800_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x90008000
 CONFIG_TARGET_TS4800=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_BOOTDELAY=1
diff --git a/configs/tuge1_defconfig b/configs/tuge1_defconfig
index 30a36ee03941..b8df1f57f8e4 100644
--- a/configs/tuge1_defconfig
+++ b/configs/tuge1_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE0113FF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -141,6 +143,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=boot:768k(u-boot),128k(env),128k(envred),-(ubi
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF00C0000
+CONFIG_ENV_ADDR_REDUND=0xF00E0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/turris_mox_defconfig b/configs/turris_mox_defconfig
index 412adbd2ded3..fafc47119369 100644
--- a/configs/turris_mox_defconfig
+++ b/configs/turris_mox_defconfig
@@ -4,9 +4,12 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_TURRIS_MOX=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=25804800
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_DEBUG_UART=y
 CONFIG_DISTRO_DEFAULTS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/turris_omnia_defconfig b/configs/turris_omnia_defconfig
index 7c10b67cab8e..a1d829797145 100644
--- a/configs/turris_omnia_defconfig
+++ b/configs/turris_omnia_defconfig
@@ -9,10 +9,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_TURRIS_OMNIA=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0xF0000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
diff --git a/configs/tuxx1_defconfig b/configs/tuxx1_defconfig
index bccc459002ca..562dcbd1ede5 100644
--- a/configs/tuxx1_defconfig
+++ b/configs/tuxx1_defconfig
@@ -1,6 +1,8 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xF0000000
+CONFIG_ENV_SIZE=0x4000
 CONFIG_SYS_BOOTCOUNT_ADDR=0xE0113FF8
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -163,6 +165,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=boot:768k(u-boot),128k(env),128k(envred),-(ubi
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF00C0000
+CONFIG_ENV_ADDR_REDUND=0xF00E0000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_BOOTCOUNT_BOOTLIMIT=3
 # CONFIG_MMC is not set
diff --git a/configs/u200_defconfig b/configs/u200_defconfig
index bb01718689ca..d96906f2ff4d 100644
--- a/configs/u200_defconfig
+++ b/configs/u200_defconfig
@@ -2,6 +2,7 @@ CONFIG_ARM=y
 CONFIG_ARCH_MESON=y
 CONFIG_SYS_TEXT_BASE=0x01000000
 CONFIG_MESON_G12A=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff803000
 CONFIG_DEBUG_UART_CLOCK=24000000
diff --git a/configs/uDPU_defconfig b/configs/uDPU_defconfig
index 3a23a9b5c2d7..2c31d22a28fe 100644
--- a/configs/uDPU_defconfig
+++ b/configs/uDPU_defconfig
@@ -4,8 +4,11 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_MVEBU_ARMADA_37XX=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=25804800
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_SMBIOS_PRODUCT_NAME="uDPU"
 CONFIG_DEBUG_UART=y
 CONFIG_AHCI=y
diff --git a/configs/udoo_defconfig b/configs/udoo_defconfig
index c33fe0f3dc5f..9b05ee6c9d97 100644
--- a/configs/udoo_defconfig
+++ b/configs/udoo_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_UDOO=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/udoo_neo_defconfig b/configs/udoo_neo_defconfig
index 4a91c12d5053..d85555f5fb4f 100644
--- a/configs/udoo_neo_defconfig
+++ b/configs/udoo_neo_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_UDOO_NEO=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/uniphier_ld4_sld8_defconfig b/configs/uniphier_ld4_sld8_defconfig
index a53b545c1841..643610c48cea 100644
--- a/configs/uniphier_ld4_sld8_defconfig
+++ b/configs/uniphier_ld4_sld8_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x84000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_ARCH_UNIPHIER_LD4_SLD8=y
diff --git a/configs/uniphier_v7_defconfig b/configs/uniphier_v7_defconfig
index af094c244564..3ee599bbd175 100644
--- a/configs/uniphier_v7_defconfig
+++ b/configs/uniphier_v7_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYS_TEXT_BASE=0x84000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_SPL=y
 CONFIG_MICRO_SUPPORT_CARD=y
diff --git a/configs/uniphier_v8_defconfig b/configs/uniphier_v8_defconfig
index 39a862eba6e1..1e336ea12b50 100644
--- a/configs/uniphier_v8_defconfig
+++ b/configs/uniphier_v8_defconfig
@@ -5,6 +5,7 @@ CONFIG_ARM_SMCCC=y
 CONFIG_ARCH_UNIPHIER=y
 CONFIG_SYS_TEXT_BASE=0x00000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=3
 CONFIG_ARCH_UNIPHIER_V8_MULTI=y
 CONFIG_MICRO_SUPPORT_CARD=y
diff --git a/configs/usbarmory_defconfig b/configs/usbarmory_defconfig
index c4fb98360bf9..f66cad7c7ffa 100644
--- a/configs/usbarmory_defconfig
+++ b/configs/usbarmory_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX5=y
 CONFIG_SYS_TEXT_BASE=0x77800000
 CONFIG_TARGET_USBARMORY=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_DISTRO_DEFAULTS=y
diff --git a/configs/variscite_dart6ul_defconfig b/configs/variscite_dart6ul_defconfig
index 9e2065c57e8b..7178b8ea7424 100644
--- a/configs/variscite_dart6ul_defconfig
+++ b/configs/variscite_dart6ul_defconfig
@@ -7,6 +7,7 @@ CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_DART_6UL=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=8
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00908000
diff --git a/configs/vct_platinum_defconfig b/configs/vct_platinum_defconfig
index 2dacc1c2f0d5..ecb3358c292f 100644
--- a/configs/vct_platinum_defconfig
+++ b/configs/vct_platinum_defconfig
@@ -1,4 +1,6 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PLATINUM=y
 CONFIG_BOOTDELAY=5
@@ -16,6 +18,8 @@ CONFIG_CMD_SNTP=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xB0040000
+CONFIG_ENV_ADDR_REDUND=0xB0050000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
diff --git a/configs/vct_platinum_onenand_defconfig b/configs/vct_platinum_onenand_defconfig
index ded3de04993a..2788dca4ad99 100644
--- a/configs/vct_platinum_onenand_defconfig
+++ b/configs/vct_platinum_onenand_defconfig
@@ -1,4 +1,5 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PLATINUM=y
 CONFIG_VCT_ONENAND=y
@@ -23,6 +24,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=onenand:128k(u-boot),128k(env),20m(kernel),-(r
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_ENV_IS_IN_ONENAND=y
+CONFIG_ENV_ADDR=0x20000
 CONFIG_MTD_DEVICE=y
 CONFIG_SMC911X=y
 CONFIG_SMC911X_BASE=0x00000000
diff --git a/configs/vct_platinum_onenand_small_defconfig b/configs/vct_platinum_onenand_small_defconfig
index 4afb03ee9eb8..56be171e7694 100644
--- a/configs/vct_platinum_onenand_small_defconfig
+++ b/configs/vct_platinum_onenand_small_defconfig
@@ -1,4 +1,5 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PLATINUM=y
 CONFIG_VCT_ONENAND=y
@@ -28,6 +29,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_ONENAND=y
+CONFIG_ENV_ADDR=0x20000
 # CONFIG_NET is not set
 CONFIG_MTD_DEVICE=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/vct_platinum_small_defconfig b/configs/vct_platinum_small_defconfig
index d53fd4fe513d..4a0d53e555bb 100644
--- a/configs/vct_platinum_small_defconfig
+++ b/configs/vct_platinum_small_defconfig
@@ -1,4 +1,6 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PLATINUM=y
 CONFIG_VCT_SMALL_IMAGE=y
@@ -21,6 +23,8 @@ CONFIG_CMD_IMLS=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xB0040000
+CONFIG_ENV_ADDR_REDUND=0xB0050000
 # CONFIG_NET is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/vct_platinumavc_defconfig b/configs/vct_platinumavc_defconfig
index 21f04a763543..03ab55de703d 100644
--- a/configs/vct_platinumavc_defconfig
+++ b/configs/vct_platinumavc_defconfig
@@ -1,4 +1,6 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PLATINUMAVC=y
 CONFIG_BOOTDELAY=5
@@ -13,6 +15,8 @@ CONFIG_CMD_I2C=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xB0040000
+CONFIG_ENV_ADDR_REDUND=0xB0050000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
diff --git a/configs/vct_platinumavc_onenand_defconfig b/configs/vct_platinumavc_onenand_defconfig
index e7e9c6cde1f0..8fd81dd51e27 100644
--- a/configs/vct_platinumavc_onenand_defconfig
+++ b/configs/vct_platinumavc_onenand_defconfig
@@ -1,4 +1,5 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PLATINUMAVC=y
 CONFIG_VCT_ONENAND=y
@@ -20,6 +21,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_ONENAND=y
+CONFIG_ENV_ADDR=0x20000
 CONFIG_MTD_DEVICE=y
 CONFIG_SYS_NS16550=y
 # CONFIG_REGEX is not set
diff --git a/configs/vct_platinumavc_onenand_small_defconfig b/configs/vct_platinumavc_onenand_small_defconfig
index 776472666c57..fa2c91f06355 100644
--- a/configs/vct_platinumavc_onenand_small_defconfig
+++ b/configs/vct_platinumavc_onenand_small_defconfig
@@ -1,4 +1,5 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PLATINUMAVC=y
 CONFIG_VCT_ONENAND=y
@@ -28,6 +29,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_ONENAND=y
+CONFIG_ENV_ADDR=0x20000
 # CONFIG_NET is not set
 CONFIG_MTD_DEVICE=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/vct_platinumavc_small_defconfig b/configs/vct_platinumavc_small_defconfig
index e7b2b1b19894..5f897a89ec9e 100644
--- a/configs/vct_platinumavc_small_defconfig
+++ b/configs/vct_platinumavc_small_defconfig
@@ -1,4 +1,6 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PLATINUMAVC=y
 CONFIG_VCT_SMALL_IMAGE=y
@@ -21,6 +23,8 @@ CONFIG_CMD_IMLS=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xB0040000
+CONFIG_ENV_ADDR_REDUND=0xB0050000
 # CONFIG_NET is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/vct_premium_defconfig b/configs/vct_premium_defconfig
index 2b53b0904808..0762194e3332 100644
--- a/configs/vct_premium_defconfig
+++ b/configs/vct_premium_defconfig
@@ -1,4 +1,6 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PREMIUM=y
 CONFIG_BOOTDELAY=5
@@ -16,6 +18,8 @@ CONFIG_CMD_SNTP=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xB0040000
+CONFIG_ENV_ADDR_REDUND=0xB0050000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
 CONFIG_SYS_FLASH_CFI=y
diff --git a/configs/vct_premium_onenand_defconfig b/configs/vct_premium_onenand_defconfig
index f1d01d9c90b5..a6851d9eb8f3 100644
--- a/configs/vct_premium_onenand_defconfig
+++ b/configs/vct_premium_onenand_defconfig
@@ -1,4 +1,5 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PREMIUM=y
 CONFIG_VCT_ONENAND=y
@@ -23,6 +24,7 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=onenand:128k(u-boot),128k(env),20m(kernel),-(r
 CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 CONFIG_ENV_IS_IN_ONENAND=y
+CONFIG_ENV_ADDR=0x20000
 CONFIG_MTD_DEVICE=y
 CONFIG_SMC911X=y
 CONFIG_SMC911X_BASE=0x00000000
diff --git a/configs/vct_premium_onenand_small_defconfig b/configs/vct_premium_onenand_small_defconfig
index 751f8819426d..7dd68887d70c 100644
--- a/configs/vct_premium_onenand_small_defconfig
+++ b/configs/vct_premium_onenand_small_defconfig
@@ -1,4 +1,5 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PREMIUM=y
 CONFIG_VCT_ONENAND=y
@@ -28,6 +29,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_CMD_UBIFS is not set
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_ONENAND=y
+CONFIG_ENV_ADDR=0x20000
 # CONFIG_NET is not set
 CONFIG_MTD_DEVICE=y
 CONFIG_SYS_NS16550=y
diff --git a/configs/vct_premium_small_defconfig b/configs/vct_premium_small_defconfig
index 706799a89e5d..b19d3a607784 100644
--- a/configs/vct_premium_small_defconfig
+++ b/configs/vct_premium_small_defconfig
@@ -1,4 +1,6 @@
 CONFIG_MIPS=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_TARGET_VCT=y
 CONFIG_VCT_PREMIUM=y
 CONFIG_VCT_SMALL_IMAGE=y
@@ -21,6 +23,8 @@ CONFIG_CMD_IMLS=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xB0040000
+CONFIG_ENV_ADDR_REDUND=0xB0050000
 # CONFIG_NET is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/ve8313_defconfig b/configs/ve8313_defconfig
index 2581d3cf2559..08597ab43420 100644
--- a/configs/ve8313_defconfig
+++ b/configs/ve8313_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFE000000
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=32000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -135,6 +137,8 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFE060000
+CONFIG_ENV_ADDR_REDUND=0xFE080000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/venice2_defconfig b/configs/venice2_defconfig
index 63d03d945b28..3d81c8a354c6 100644
--- a/configs/venice2_defconfig
+++ b/configs/venice2_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x80110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA124=y
 CONFIG_TARGET_VENICE2=y
diff --git a/configs/ventana_defconfig b/configs/ventana_defconfig
index d6131f71764f..726927b8b7d1 100644
--- a/configs/ventana_defconfig
+++ b/configs/ventana_defconfig
@@ -1,6 +1,8 @@
 CONFIG_ARM=y
 CONFIG_TEGRA=y
 CONFIG_SYS_TEXT_BASE=0x00110000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA20=y
 CONFIG_TARGET_VENTANA=y
diff --git a/configs/vexpress_aemv8a_juno_defconfig b/configs/vexpress_aemv8a_juno_defconfig
index 0823d17c1158..d95d40f4bcfc 100644
--- a/configs/vexpress_aemv8a_juno_defconfig
+++ b/configs/vexpress_aemv8a_juno_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_VEXPRESS64_JUNO=y
 CONFIG_SYS_TEXT_BASE=0xe0000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x10000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING=" vexpress_aemv8a"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=1
@@ -27,6 +29,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_EFI_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xBFC0000
 CONFIG_DM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
index db5ad3dfa5a4..12302c62768a 100644
--- a/configs/vexpress_aemv8a_semi_defconfig
+++ b/configs/vexpress_aemv8a_semi_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_TARGET_VEXPRESS64_BASE_FVP=y
 CONFIG_SYS_TEXT_BASE=0x88000000
 CONFIG_SYS_MALLOC_F_LEN=0x2000
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_IDENT_STRING=" vexpress_aemv8a"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTDELAY=1
@@ -27,6 +29,7 @@ CONFIG_CMD_UBI=y
 # CONFIG_ISO_PARTITION is not set
 # CONFIG_EFI_PARTITION is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFC0000
 CONFIG_DM=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/vexpress_ca15_tc2_defconfig b/configs/vexpress_ca15_tc2_defconfig
index 904c75614fd7..a1690dcc60e0 100644
--- a/configs/vexpress_ca15_tc2_defconfig
+++ b/configs/vexpress_ca15_tc2_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_VEXPRESS_CA15_TC2=y
 CONFIG_SYS_TEXT_BASE=0x80800000
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_OF_BOARD_SETUP=y
 CONFIG_BOOTCOMMAND="run distro_bootcmd; run bootflash"
@@ -20,6 +22,7 @@ CONFIG_CMD_MMC=y
 # CONFIG_CMD_MISC is not set
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFF80000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_MTD_DEVICE=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/vexpress_ca5x2_defconfig b/configs/vexpress_ca5x2_defconfig
index ca847a2f9a39..c95cc38be0c9 100644
--- a/configs/vexpress_ca5x2_defconfig
+++ b/configs/vexpress_ca5x2_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_VEXPRESS_CA5X2=y
 CONFIG_SYS_TEXT_BASE=0x80800000
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTCOMMAND="run distro_bootcmd; run bootflash"
 # CONFIG_DISPLAY_CPUINFO is not set
@@ -19,6 +21,7 @@ CONFIG_CMD_MMC=y
 # CONFIG_CMD_MISC is not set
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFF80000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_MTD_DEVICE=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/vexpress_ca9x4_defconfig b/configs/vexpress_ca9x4_defconfig
index 06fcfee1d3d7..4007c5cb3d61 100644
--- a/configs/vexpress_ca9x4_defconfig
+++ b/configs/vexpress_ca9x4_defconfig
@@ -1,7 +1,9 @@
 CONFIG_ARM=y
 CONFIG_TARGET_VEXPRESS_CA9X4=y
 CONFIG_SYS_TEXT_BASE=0x60800000
+CONFIG_ENV_SIZE=0x40000
 CONFIG_NR_DRAM_BANKS=2
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_BOOTCOMMAND="run distro_bootcmd; run bootflash"
 # CONFIG_DISPLAY_CPUINFO is not set
@@ -19,6 +21,7 @@ CONFIG_CMD_MMC=y
 # CONFIG_CMD_MISC is not set
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0x47F80000
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_MTD_DEVICE=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/vf610twr_defconfig b/configs/vf610twr_defconfig
index 54365da9853c..36a8b9028ff8 100644
--- a/configs/vf610twr_defconfig
+++ b/configs/vf610twr_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_VF610=y
 CONFIG_SYS_TEXT_BASE=0x3f401000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/vf610twr/imximage.cfg"
 CONFIG_BOOTDELAY=3
diff --git a/configs/vf610twr_nand_defconfig b/configs/vf610twr_nand_defconfig
index 329bdccd4cbe..942ee6426662 100644
--- a/configs/vf610twr_nand_defconfig
+++ b/configs/vf610twr_nand_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_SYS_THUMB_BUILD=y
 CONFIG_ARCH_VF610=y
 CONFIG_SYS_TEXT_BASE=0x3f401000
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x180000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/freescale/vf610twr/imximage.cfg"
 CONFIG_BOOTDELAY=3
diff --git a/configs/vining_2000_defconfig b/configs/vining_2000_defconfig
index 350af3ee1cb1..32ef01b63996 100644
--- a/configs/vining_2000_defconfig
+++ b/configs/vining_2000_defconfig
@@ -3,6 +3,8 @@ CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_SYS_MALLOC_F_LEN=0x4000
 CONFIG_TARGET_SOFTING_VINING_2000=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/softing/vining_2000/imximage.cfg"
@@ -36,6 +38,7 @@ CONFIG_EFI_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="imx6sx-softing-vining-2000"
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x90000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_DM_GPIO=y
diff --git a/configs/vme8349_defconfig b/configs/vme8349_defconfig
index 8533c4da94d3..536c2d1466c7 100644
--- a/configs/vme8349_defconfig
+++ b/configs/vme8349_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF00000
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SYS_CLK_FREQ=66000000
 CONFIG_MPC83xx=y
 CONFIG_HIGH_BATS=y
@@ -109,6 +111,8 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_DATE=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xFFFC0000
+CONFIG_ENV_ADDR_REDUND=0xFFFE0000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/vyasa-rk3288_defconfig b/configs/vyasa-rk3288_defconfig
index 220e0ad7acca..cff61677cb97 100644
--- a/configs/vyasa-rk3288_defconfig
+++ b/configs/vyasa-rk3288_defconfig
@@ -5,6 +5,7 @@ CONFIG_ARCH_ROCKCHIP=y
 CONFIG_SYS_TEXT_BASE=0x00100000
 CONFIG_ROCKCHIP_RK3288=y
 CONFIG_TARGET_VYASA_RK3288=y
+CONFIG_ENV_OFFSET=0x3F8000
 CONFIG_SPL_STACK_R_ADDR=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff690000
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index fc382833fb6e..eac4af95a4ad 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_WANDBOARD=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0xC0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/warp7_bl33_defconfig b/configs/warp7_bl33_defconfig
index 72123d2fb994..e75afc782ef6 100644
--- a/configs/warp7_bl33_defconfig
+++ b/configs/warp7_bl33_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX7=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_WARP7=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_IMX_HAB=y
 CONFIG_FIT=y
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 869cfe4c73d7..72cdb684a702 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX7=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_WARP7=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 # CONFIG_ARMV7_VIRT is not set
diff --git a/configs/warp_defconfig b/configs/warp_defconfig
index 47d55ddae6b4..ed89615d31e1 100644
--- a/configs/warp_defconfig
+++ b/configs/warp_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_WARP=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x60000
 CONFIG_NR_DRAM_BANKS=1
 # CONFIG_CMD_BMODE is not set
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/warp/imximage.cfg"
diff --git a/configs/wb45n_defconfig b/configs/wb45n_defconfig
index 60c9db7f353a..672fbc7e472c 100644
--- a/configs/wb45n_defconfig
+++ b/configs/wb45n_defconfig
@@ -7,7 +7,7 @@ CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
-CONFIG_ENV_OFFSET=0xa0000
+CONFIG_ENV_OFFSET=0xA0000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x300000
@@ -29,6 +29,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xC0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NAND=y
 # CONFIG_SYS_NAND_USE_FLASH_BBT is not set
diff --git a/configs/wb50n_defconfig b/configs/wb50n_defconfig
index fc08bae49b58..f3a7aee1a4f7 100644
--- a/configs/wb50n_defconfig
+++ b/configs/wb50n_defconfig
@@ -28,6 +28,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0xC0000
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG=y
 CONFIG_NAND=y
diff --git a/configs/woodburn_defconfig b/configs/woodburn_defconfig
index 40cd074e3c05..81cb1796fb06 100644
--- a/configs/woodburn_defconfig
+++ b/configs/woodburn_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_SYS_DCACHE_OFF=y
 CONFIG_TARGET_WOODBURN=y
 CONFIG_SYS_TEXT_BASE=0xA0000000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_BOOTDELAY=3
 # CONFIG_DISPLAY_BOARDINFO is not set
 CONFIG_BOARD_EARLY_INIT_F=y
@@ -28,6 +30,8 @@ CONFIG_EFI_PARTITION=y
 # CONFIG_PARTITION_UUIDS is not set
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xA0080000
+CONFIG_ENV_ADDR_REDUND=0xA00A0000
 CONFIG_MXC_GPIO=y
 CONFIG_FSL_ESDHC_IMX=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/woodburn_sd_defconfig b/configs/woodburn_sd_defconfig
index c4826f4f01c5..443837f92350 100644
--- a/configs/woodburn_sd_defconfig
+++ b/configs/woodburn_sd_defconfig
@@ -7,8 +7,10 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_SPL_LIBDISK_SUPPORT=y
 CONFIG_SPL_TEXT_BASE=0x10002300
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/woodburn/imximage.cfg"
@@ -40,6 +42,8 @@ CONFIG_EFI_PARTITION=y
 # CONFIG_SPL_PARTITION_UUIDS is not set
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xA0080000
+CONFIG_ENV_ADDR_REDUND=0xA00A0000
 CONFIG_MXC_GPIO=y
 CONFIG_FSL_ESDHC_IMX=y
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/work_92105_defconfig b/configs/work_92105_defconfig
index 1196b7806c67..1f4e71fea25e 100644
--- a/configs/work_92105_defconfig
+++ b/configs/work_92105_defconfig
@@ -10,6 +10,8 @@ CONFIG_TARGET_WORK_92105=y
 CONFIG_CMD_HD44760=y
 CONFIG_CMD_MAX6957=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00000000
@@ -37,6 +39,7 @@ CONFIG_CMD_DATE=y
 CONFIG_DOS_PARTITION=y
 CONFIG_ENV_IS_IN_NAND=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_OFFSET_REDUND=0x120000
 # CONFIG_MMC is not set
 CONFIG_PHYLIB=y
 CONFIG_PHY_ADDR_ENABLE=y
diff --git a/configs/x530_defconfig b/configs/x530_defconfig
index 325390493466..f4013ed3cb24 100644
--- a/configs/x530_defconfig
+++ b/configs/x530_defconfig
@@ -7,10 +7,13 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_TARGET_X530=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x10000
+CONFIG_ENV_OFFSET=0x100000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_SPL=y
 CONFIG_DEBUG_UART_BASE=0xd0012000
 CONFIG_DEBUG_UART_CLOCK=250000000
+CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEBUG_UART=y
@@ -44,6 +47,7 @@ CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_DEFAULT_DEVICE_TREE="armada-385-atl-x530"
 CONFIG_ENV_IS_IN_SPI_FLASH=y
+CONFIG_ENV_ADDR=0x100000
 CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_BLK=y
 CONFIG_DM_GPIO=y
diff --git a/configs/x600_defconfig b/configs/x600_defconfig
index c7c9dc4d2cc5..824ef6a2162e 100644
--- a/configs/x600_defconfig
+++ b/configs/x600_defconfig
@@ -8,9 +8,11 @@ CONFIG_SYS_TEXT_BASE=0x00800040
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SYS_BOOTCOUNT_ADDR=0xD2801FF8
+CONFIG_ENV_SECT_SIZE=0x10000
 CONFIG_IDENT_STRING="-SPEAr"
 CONFIG_SPL_TEXT_BASE=0xd2800b00
 CONFIG_BOOTDELAY=3
@@ -45,6 +47,8 @@ CONFIG_MTDPARTS_DEFAULT="mtdparts=nand:64M(ubi0),64M(ubi1)"
 CONFIG_CMD_UBI=y
 CONFIG_ENV_IS_IN_FLASH=y
 CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+CONFIG_ENV_ADDR=0xF8060000
+CONFIG_ENV_ADDR_REDUND=0xF8070000
 CONFIG_BOOTCOUNT_LIMIT=y
 CONFIG_FPGA_XILINX=y
 CONFIG_FPGA_SPARTAN3=y
diff --git a/configs/xfi3_defconfig b/configs/xfi3_defconfig
index 4087f6e00eca..07d22765a1ae 100644
--- a/configs/xfi3_defconfig
+++ b/configs/xfi3_defconfig
@@ -6,6 +6,7 @@ CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_XFI3=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_TEXT_BASE=0x00001000
diff --git a/configs/xilinx_zynqmp_r5_defconfig b/configs/xilinx_zynqmp_r5_defconfig
index fa2960b5b245..512b4b9c0f85 100644
--- a/configs/xilinx_zynqmp_r5_defconfig
+++ b/configs/xilinx_zynqmp_r5_defconfig
@@ -1,6 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_ZYNQMP_R5=y
 CONFIG_SYS_TEXT_BASE=0x10000000
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_DEBUG_UART_BASE=0xff010000
 CONFIG_DEBUG_UART_CLOCK=100000000
diff --git a/configs/xpedite517x_defconfig b/configs/xpedite517x_defconfig
index 86819427fa2f..8068a2f6ff9f 100644
--- a/configs/xpedite517x_defconfig
+++ b/configs/xpedite517x_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xfff00000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC86xx=y
 CONFIG_HIGH_BATS=y
 CONFIG_TARGET_XPEDITE517X=y
@@ -26,6 +28,7 @@ CONFIG_CMD_SNTP=y
 CONFIG_CMD_DATE=y
 CONFIG_CMD_JFFS2=y
 CONFIG_CMD_IRQ=y
+CONFIG_ENV_ADDR=0xFFF80000
 CONFIG_CMD_PCA953X=y
 CONFIG_DS4510=y
 # CONFIG_MMC is not set
diff --git a/configs/xpedite520x_defconfig b/configs/xpedite520x_defconfig
index 81689a44d5f5..b2c0cb00cd3c 100644
--- a/configs/xpedite520x_defconfig
+++ b/configs/xpedite520x_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_XPEDITE520X=y
@@ -27,6 +29,7 @@ CONFIG_CMD_DATE=y
 # CONFIG_CMD_HASH is not set
 CONFIG_CMD_JFFS2=y
 # CONFIG_CMD_IRQ is not set
+CONFIG_ENV_ADDR=0xFFF40000
 CONFIG_CMD_PCA953X=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/xpedite537x_defconfig b/configs/xpedite537x_defconfig
index 72a2a424e286..5a5bc3019e98 100644
--- a/configs/xpedite537x_defconfig
+++ b/configs/xpedite537x_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_XPEDITE537X=y
@@ -28,6 +30,7 @@ CONFIG_MP=y
 # CONFIG_CMD_HASH is not set
 CONFIG_CMD_JFFS2=y
 # CONFIG_CMD_IRQ is not set
+CONFIG_ENV_ADDR=0xFFF40000
 CONFIG_SYS_FSL_DDR2=y
 CONFIG_CMD_PCA953X=y
 CONFIG_DS4510=y
diff --git a/configs/xpedite550x_defconfig b/configs/xpedite550x_defconfig
index f86d1bdc2d14..daa356771f0e 100644
--- a/configs/xpedite550x_defconfig
+++ b/configs/xpedite550x_defconfig
@@ -1,5 +1,7 @@
 CONFIG_PPC=y
 CONFIG_SYS_TEXT_BASE=0xFFF80000
+CONFIG_ENV_SIZE=0x8000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_MPC85xx=y
 # CONFIG_CMD_ERRATA is not set
 CONFIG_TARGET_XPEDITE550X=y
@@ -28,6 +30,7 @@ CONFIG_MP=y
 CONFIG_CMD_JFFS2=y
 # CONFIG_CMD_IRQ is not set
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xFFF40000
 CONFIG_CMD_PCA953X=y
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
diff --git a/configs/xpress_defconfig b/configs/xpress_defconfig
index 852a53478e64..5e3e3b8d848f 100644
--- a/configs/xpress_defconfig
+++ b/configs/xpress_defconfig
@@ -2,6 +2,8 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX6=y
 CONFIG_SYS_TEXT_BASE=0x87800000
 CONFIG_TARGET_XPRESS=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/ccv/xpress/imximage.cfg"
 CONFIG_BOOTDELAY=3
diff --git a/configs/xpress_spl_defconfig b/configs/xpress_spl_defconfig
index e8e54109c3f3..a7bb6e9a534a 100644
--- a/configs/xpress_spl_defconfig
+++ b/configs/xpress_spl_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_XPRESS=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x4000
+CONFIG_ENV_OFFSET=0x80000
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/xtfpga_defconfig b/configs/xtfpga_defconfig
index 051bba0ceb7f..1911cdadaf20 100644
--- a/configs/xtfpga_defconfig
+++ b/configs/xtfpga_defconfig
@@ -1,5 +1,7 @@
 CONFIG_XTENSA=y
 CONFIG_SYS_CPU="dc233c"
+CONFIG_ENV_SIZE=0x20000
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_XTFPGA_KC705=y
 CONFIG_SHOW_BOOT_PROGRESS=y
 CONFIG_BOOTDELAY=10
@@ -19,6 +21,7 @@ CONFIG_CMD_DHCP=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_DIAG=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xF7FE0000
 CONFIG_DM=y
 # CONFIG_DM_WARN is not set
 # CONFIG_DM_DEVICE_REMOVE is not set
diff --git a/configs/zc5202_defconfig b/configs/zc5202_defconfig
index 1d8484ff26a8..57553611a3e7 100644
--- a/configs/zc5202_defconfig
+++ b/configs/zc5202_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_ZC5202=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/zc5601_defconfig b/configs/zc5601_defconfig
index 6eac854d07d5..49d5f4a84035 100644
--- a/configs/zc5601_defconfig
+++ b/configs/zc5601_defconfig
@@ -7,6 +7,8 @@ CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_TARGET_ZC5601=y
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_ENV_SIZE=0x2000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_NR_DRAM_BANKS=1
 CONFIG_SPL=y
 CONFIG_SPL_LIBDISK_SUPPORT=y
diff --git a/configs/zmx25_defconfig b/configs/zmx25_defconfig
index 3bba1ec74aa5..2513feff51b0 100644
--- a/configs/zmx25_defconfig
+++ b/configs/zmx25_defconfig
@@ -2,7 +2,9 @@ CONFIG_ARM=y
 CONFIG_ARCH_MX25=y
 CONFIG_SYS_TEXT_BASE=0xA0000000
 CONFIG_TARGET_ZMX25=y
+CONFIG_ENV_SIZE=0x20000
 CONFIG_NR_DRAM_BANKS=1
+CONFIG_ENV_SECT_SIZE=0x20000
 CONFIG_BOOTDELAY=5
 CONFIG_USE_PREBOOT=y
 # CONFIG_DISPLAY_CPUINFO is not set
@@ -22,6 +24,7 @@ CONFIG_CMD_PING=y
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_FAT=y
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xA0040000
 # CONFIG_MMC is not set
 CONFIG_MTD_NOR_FLASH=y
 CONFIG_FLASH_CFI_DRIVER=y
diff --git a/configs/zynq_zc770_xm012_defconfig b/configs/zynq_zc770_xm012_defconfig
index 997836ca38df..55ac82352851 100644
--- a/configs/zynq_zc770_xm012_defconfig
+++ b/configs/zynq_zc770_xm012_defconfig
@@ -30,6 +30,7 @@ CONFIG_CMD_CACHE=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_DEFAULT_DEVICE_TREE="zynq-zc770-xm012"
 CONFIG_ENV_IS_IN_FLASH=y
+CONFIG_ENV_ADDR=0xE20E0000
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM_SEQ_ALIAS=y
 CONFIG_BLK=y
diff --git a/env/Kconfig b/env/Kconfig
index 0b97af42b1c8..bc88c59cd54d 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -467,11 +467,25 @@ config ENV_EXT4_FILE
 	  It's a string of the EXT4 file name. This file use to store the
 	  environment (explicit path to the file)
 
-if ARCH_ROCKCHIP || ARCH_SUNXI || ARCH_ZYNQ || ARCH_ZYNQMP || ARCH_VERSAL || ARC || ARCH_STM32MP || ARCH_OMAP2PLUS || ARCH_AT91
+config ENV_ADDR
+	hex "Environment address"
+	depends on ENV_IS_IN_FLASH || ENV_IS_IN_NVRAM || ENV_IS_IN_ONENAND || \
+		     ENV_IS_IN_REMOTE || ENV_IS_IN_SPI_FLASH
+	default 0x0 if ENV_IS_IN_SPI_FLASH
+	help
+	  Offset from the start of the device (or partition)
+
+config ENV_ADDR_REDUND
+	hex "Redundant environment address"
+	depends on ENV_IS_IN_FLASH && SYS_REDUNDAND_ENVIRONMENT
+	help
+	  Offset from the start of the device (or partition) of the redundant
+	  environment location.
 
 config ENV_OFFSET
-	hex "Environment Offset"
-	depends on (!ENV_IS_IN_UBI && !ENV_IS_NOWHERE) || ARCH_STM32MP
+	hex "Environment offset"
+	depends on ENV_IS_IN_EEPROM || ENV_IS_IN_MMC || ENV_IS_IN_NAND || \
+		    ENV_IS_IN_SPI_FLASH
 	default 0x3f8000 if ARCH_ROCKCHIP
 	default 0x88000 if ARCH_SUNXI
 	default 0xE0000 if ARCH_ZYNQ
@@ -483,6 +497,14 @@ config ENV_OFFSET
 	help
 	  Offset from the start of the device (or partition)
 
+config ENV_OFFSET_REDUND
+	hex "Redundant environment offset"
+	depends on (ENV_IS_IN_EEPROM || ENV_IS_IN_MMC || ENV_IS_IN_NAND || \
+		    ENV_IS_IN_SPI_FLASH) && SYS_REDUNDAND_ENVIRONMENT
+	help
+	  Offset from the start of the device (or partition) of the redundant
+	  environment location.
+
 config ENV_SIZE
 	hex "Environment Size"
 	default 0x40000 if ENV_IS_IN_SPI_FLASH && ARCH_ZYNQMP
@@ -495,7 +517,7 @@ config ENV_SIZE
 
 config ENV_SECT_SIZE
 	hex "Environment Sector-Size"
-	depends on (!ENV_IS_NOWHERE && (ARCH_ZYNQ || ARCH_ZYNQMP || ARCH_VERSAL || ARCH_OMAP2PLUS || ARCH_AT91) )|| ARCH_STM32MP
+	depends on ENV_IS_IN_FLASH || ENV_IS_IN_SPI_FLASH
 	default 0x40000 if ARCH_ZYNQMP || ARCH_VERSAL
 	default 0x20000 if ARCH_ZYNQ || ARCH_OMAP2PLUS || ARCH_AT91
 	help
@@ -526,8 +548,6 @@ config ENV_UBI_VID_OFFSET
 	help
 	  UBI VID offset for environment. If 0, no custom VID offset is used.
 
-endif
-
 config SYS_RELOC_GD_ENV_ADDR
 	bool "Relocate gd->en_addr"
 	help
diff --git a/env/embedded.c b/env/embedded.c
index a38e169fe0b4..208553e6af17 100644
--- a/env/embedded.c
+++ b/env/embedded.c
@@ -91,6 +91,6 @@ unsigned long env_size __UBOOT_ENV_SECTION__(env_size) = sizeof(env_t);
 /*
  * Add in absolutes.
  */
-GEN_ABS(env_offset, CONFIG_ENV_OFFSET);
+GEN_ABS(env_offset, (CONFIG_ENV_ADDR - CONFIG_SYS_FLASH_BASE));
 
 #endif /* ENV_IS_EMBEDDED */
diff --git a/env/mmc.c b/env/mmc.c
index fee9f0674edc..b24c35cec94e 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -24,10 +24,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if !defined(CONFIG_ENV_OFFSET)
-#define CONFIG_ENV_OFFSET 0
-#endif
-
 #if CONFIG_IS_ENABLED(OF_CONTROL)
 static inline int mmc_offset_try_partition(const char *str, s64 *val)
 {
diff --git a/env/remote.c b/env/remote.c
index 02531f427ba8..55faa1e5d0e8 100644
--- a/env/remote.c
+++ b/env/remote.c
@@ -18,10 +18,6 @@ env_t *env_ptr = (env_t *)CONFIG_ENV_ADDR;
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if !defined(CONFIG_ENV_OFFSET)
-#define CONFIG_ENV_OFFSET 0
-#endif
-
 static int env_remote_init(void)
 {
 	if (crc32(0, env_ptr->data, ENV_SIZE) == env_ptr->crc) {
diff --git a/env/sf.c b/env/sf.c
index 590d0cedd852..16dba1157835 100644
--- a/env/sf.c
+++ b/env/sf.c
@@ -284,14 +284,14 @@ out:
 }
 #endif
 
-#ifdef CONFIG_ENV_ADDR
+#if CONFIG_ENV_ADDR != 0x0
 __weak void *env_sf_get_env_addr(void)
 {
 	return (void *)CONFIG_ENV_ADDR;
 }
 #endif
 
-#if defined(INITENV) && defined(CONFIG_ENV_ADDR)
+#if defined(INITENV) && (CONFIG_ENV_ADDR != 0x0)
 static int env_sf_init(void)
 {
 	env_t *env_ptr = (env_t *)env_sf_get_env_addr();
@@ -315,7 +315,7 @@ U_BOOT_ENV_LOCATION(sf) = {
 #ifdef CMD_SAVEENV
 	.save		= env_save_ptr(env_sf_save),
 #endif
-#if defined(INITENV) && defined(CONFIG_ENV_ADDR)
+#if defined(INITENV) && (CONFIG_ENV_ADDR != 0x0)
 	.init		= env_sf_init,
 #endif
 };
diff --git a/include/configs/10m50_devboard.h b/include/configs/10m50_devboard.h
index 4843a27cbf2f..3948d68014a1 100644
--- a/include/configs/10m50_devboard.h
+++ b/include/configs/10m50_devboard.h
@@ -62,9 +62,7 @@
  * (which is common practice).
  */
 
-#define CONFIG_ENV_SIZE			0x10000	/* 64k, 1 sector */
 #define CONFIG_ENV_OVERWRITE		/* Serial change Ok	*/
-#define CONFIG_ENV_ADDR			(0xf4000000 + CONFIG_SYS_MONITOR_LEN)
 
 /*
  * MISC
diff --git a/include/configs/3c120_devboard.h b/include/configs/3c120_devboard.h
index f6ce4303a445..97bce43ce438 100644
--- a/include/configs/3c120_devboard.h
+++ b/include/configs/3c120_devboard.h
@@ -62,9 +62,7 @@
  * (which is common practice).
  */
 
-#define CONFIG_ENV_SIZE			0x20000	/* 128k, 1 sector */
 #define CONFIG_ENV_OVERWRITE		/* Serial change Ok	*/
-#define CONFIG_ENV_ADDR			(0xe2800000 + CONFIG_SYS_MONITOR_LEN)
 
 /*
  * MISC
diff --git a/include/configs/B4860QDS.h b/include/configs/B4860QDS.h
index 3ccd0925e2a5..d2133751287a 100644
--- a/include/configs/B4860QDS.h
+++ b/include/configs/B4860QDS.h
@@ -96,25 +96,8 @@
 #define CONFIG_ENV_OVERWRITE
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE                 0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET               0x100000        /* 1MB */
-#define CONFIG_ENV_SECT_SIZE            0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV          0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 1097)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(10 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_SRIO_PCIE_BOOT_SLAVE)
-#define CONFIG_ENV_ADDR		0xffe20000
-#define CONFIG_ENV_SIZE		0x2000
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #ifndef __ASSEMBLY__
@@ -154,9 +137,7 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_SYS_INIT_L3_ADDR		0xFFFC0000
 #define CONFIG_SYS_L3_SIZE		256 << 10
 #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_ADDR + 32 * 1024)
-#ifdef CONFIG_NAND
-#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
-#endif
+#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_SIZE	(30 << 10)
 #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
diff --git a/include/configs/BSC9131RDB.h b/include/configs/BSC9131RDB.h
index b5d759ce025d..cd8589f0c9be 100644
--- a/include/configs/BSC9131RDB.h
+++ b/include/configs/BSC9131RDB.h
@@ -250,16 +250,8 @@ extern unsigned long get_sdram_size(void);
  * Environment
  */
 #if defined(CONFIG_RAMBOOT_SPIFLASH)
-#define CONFIG_ENV_OFFSET	0x100000	/* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#define CONFIG_ENV_SIZE		0x2000
 #elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE		CONFIG_SYS_NAND_BLOCK_SIZE
-#define CONFIG_ENV_OFFSET	((768 * 1024) + CONFIG_SYS_NAND_BLOCK_SIZE)
 #define CONFIG_ENV_RANGE	(3 * CONFIG_ENV_SIZE)
-#elif defined(CONFIG_SYS_RAMBOOT)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE		0x2000
 #endif
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
diff --git a/include/configs/BSC9132QDS.h b/include/configs/BSC9132QDS.h
index 1c615acb3b3b..58841d5a92e1 100644
--- a/include/configs/BSC9132QDS.h
+++ b/include/configs/BSC9132QDS.h
@@ -448,22 +448,8 @@ combinations. this should be removed later
 #if defined(CONFIG_RAMBOOT_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#elif defined(CONFIG_RAMBOOT_SPIFLASH)
-#define CONFIG_ENV_OFFSET	0x100000	/* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#define CONFIG_ENV_SIZE		0x2000
 #elif defined(CONFIG_NAND) || defined(CONFIG_NAND_SECBOOT)
-#define CONFIG_ENV_SIZE		CONFIG_SYS_NAND_BLOCK_SIZE
-#define CONFIG_ENV_OFFSET	((768 * 1024) + CONFIG_SYS_NAND_BLOCK_SIZE)
 #define CONFIG_ENV_RANGE	(3 * CONFIG_ENV_SIZE)
-#elif defined(CONFIG_SYS_RAMBOOT)
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE			0x2000
-#else
-#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000
 #endif
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
diff --git a/include/configs/C29XPCIE.h b/include/configs/C29XPCIE.h
index 5a1a29bd9ead..dea196dd17ef 100644
--- a/include/configs/C29XPCIE.h
+++ b/include/configs/C29XPCIE.h
@@ -375,24 +375,12 @@
  * Environment
  */
 #if defined(CONFIG_SYS_RAMBOOT)
-#if defined(CONFIG_RAMBOOT_SPIFLASH)
-#define CONFIG_ENV_OFFSET	0x100000	/* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#define CONFIG_ENV_SIZE		0x2000
-#endif
 #elif defined(CONFIG_NAND)
 #ifdef CONFIG_TPL_BUILD
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_INIT_L2_ADDR + (160 << 10))
+#define SPL_ENV_ADDR		(CONFIG_SYS_INIT_L2_ADDR + (160 << 10))
 #else
-#define CONFIG_ENV_SIZE		CONFIG_SYS_NAND_BLOCK_SIZE
 #define CONFIG_ENV_RANGE	CONFIG_ENV_SIZE
 #endif
-#define CONFIG_ENV_OFFSET	CONFIG_SYS_NAND_BLOCK_SIZE
-#else
-#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000
 #endif
 
 #define CONFIG_LOADS_ECHO
diff --git a/include/configs/M5208EVBE.h b/include/configs/M5208EVBE.h
index 0a356f483ee7..867ae8be6de9 100644
--- a/include/configs/M5208EVBE.h
+++ b/include/configs/M5208EVBE.h
@@ -141,9 +141,6 @@
  * Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#define CONFIG_ENV_OFFSET		0x2000
-#define CONFIG_ENV_SIZE			0x1000
-#define CONFIG_ENV_SECT_SIZE		0x2000
 
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
diff --git a/include/configs/M52277EVB.h b/include/configs/M52277EVB.h
index a9c260d5cfcf..a5a1c38f6e7d 100644
--- a/include/configs/M52277EVB.h
+++ b/include/configs/M52277EVB.h
@@ -174,16 +174,10 @@
 #ifdef CONFIG_SYS_STMICRO_BOOT
 #	define CONFIG_SYS_FLASH_BASE	CONFIG_SYS_CS0_BASE
 #	define CONFIG_SYS_FLASH0_BASE	CONFIG_SYS_CS0_BASE
-#	define CONFIG_ENV_OFFSET	0x30000
-#	define CONFIG_ENV_SIZE		0x1000
-#	define CONFIG_ENV_SECT_SIZE	0x10000
 #endif
 #ifdef CONFIG_SYS_SPANSION_BOOT
 #	define CONFIG_SYS_FLASH_BASE	CONFIG_SYS_CS0_BASE
 #	define CONFIG_SYS_FLASH0_BASE	CONFIG_SYS_CS0_BASE
-#	define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + 0x40000)
-#	define CONFIG_ENV_SIZE		0x1000
-#	define CONFIG_ENV_SECT_SIZE	0x8000
 #endif
 
 #ifdef CONFIG_SYS_FLASH_CFI
diff --git a/include/configs/M5235EVB.h b/include/configs/M5235EVB.h
index a197c3a853c5..3c56cec425c4 100644
--- a/include/configs/M5235EVB.h
+++ b/include/configs/M5235EVB.h
@@ -160,16 +160,6 @@
 	. = DEFINED(env_offset) ? env_offset : .; \
 	env/embedded.o(.text);
 
-#ifdef NORFLASH_PS32BIT
-#	define CONFIG_ENV_OFFSET		(0x8000)
-#	define CONFIG_ENV_SIZE		0x4000
-#	define CONFIG_ENV_SECT_SIZE	0x4000
-#else
-#	define CONFIG_ENV_OFFSET		(0x4000)
-#	define CONFIG_ENV_SIZE		0x2000
-#	define CONFIG_ENV_SECT_SIZE	0x2000
-#endif
-
 /*-----------------------------------------------------------------------
  * Cache Configuration
  */
diff --git a/include/configs/M5249EVB.h b/include/configs/M5249EVB.h
index f214dc90bc72..97c09f94c7b7 100644
--- a/include/configs/M5249EVB.h
+++ b/include/configs/M5249EVB.h
@@ -71,10 +71,6 @@
 	. = DEFINED(env_offset) ? env_offset : .; \
 	env/embedded.o(.text);
 
-#define CONFIG_ENV_OFFSET		0x4000	/* Address of Environment Sector*/
-#define CONFIG_ENV_SIZE		0x2000	/* Total Size of Environment Sector	*/
-#define CONFIG_ENV_SECT_SIZE	0x2000 /* see README - env sector total size	*/
-
 /*-----------------------------------------------------------------------
  * Start addresses for the final memory configuration
  * (Set up by the startup code)
diff --git a/include/configs/M5253DEMO.h b/include/configs/M5253DEMO.h
index 1199fa3151cd..9fc0f5f4d19b 100644
--- a/include/configs/M5253DEMO.h
+++ b/include/configs/M5253DEMO.h
@@ -17,13 +17,6 @@
 /* Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#ifdef CONFIG_MONITOR_IS_IN_RAM
-#	define CONFIG_ENV_OFFSET		0x4000
-#	define CONFIG_ENV_SECT_SIZE	0x1000
-#else
-#	define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + 0x4000)
-#	define CONFIG_ENV_SECT_SIZE	0x1000
-#endif
 
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
diff --git a/include/configs/M5272C3.h b/include/configs/M5272C3.h
index 9d3bf42974d4..bd9ae53d20f1 100644
--- a/include/configs/M5272C3.h
+++ b/include/configs/M5272C3.h
@@ -29,13 +29,6 @@
 /* Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#ifndef CONFIG_MONITOR_IS_IN_RAM
-#define CONFIG_ENV_OFFSET		0x4000
-#define CONFIG_ENV_SECT_SIZE	0x2000
-#else
-#define CONFIG_ENV_ADDR		0xffe04000
-#define CONFIG_ENV_SECT_SIZE	0x2000
-#endif
 
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
diff --git a/include/configs/M5275EVB.h b/include/configs/M5275EVB.h
index 682e2e397912..e9fcb5dfbc4e 100644
--- a/include/configs/M5275EVB.h
+++ b/include/configs/M5275EVB.h
@@ -29,13 +29,6 @@
 /* Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#ifndef CONFIG_MONITOR_IS_IN_RAM
-#define CONFIG_ENV_OFFSET		0x4000
-#define CONFIG_ENV_SECT_SIZE	0x2000
-#else
-#define CONFIG_ENV_ADDR		0xffe04000
-#define CONFIG_ENV_SECT_SIZE	0x2000
-#endif
 
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
diff --git a/include/configs/M5282EVB.h b/include/configs/M5282EVB.h
index a06872668199..dfaa847af3fd 100644
--- a/include/configs/M5282EVB.h
+++ b/include/configs/M5282EVB.h
@@ -26,8 +26,6 @@
 /* Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#define CONFIG_ENV_ADDR		0xffe04000
-#define CONFIG_ENV_SIZE		0x2000
 
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
diff --git a/include/configs/M53017EVB.h b/include/configs/M53017EVB.h
index 39e2748373bd..24eb36159b30 100644
--- a/include/configs/M53017EVB.h
+++ b/include/configs/M53017EVB.h
@@ -161,9 +161,6 @@
 /* Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#define CONFIG_ENV_OFFSET		(CONFIG_SYS_FLASH_BASE + 0x40000)
-#define CONFIG_ENV_SIZE			0x1000
-#define CONFIG_ENV_SECT_SIZE		0x8000
 
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
diff --git a/include/configs/M5329EVB.h b/include/configs/M5329EVB.h
index 7a96dd1b7129..2cff0d6cf602 100644
--- a/include/configs/M5329EVB.h
+++ b/include/configs/M5329EVB.h
@@ -166,8 +166,6 @@
 /* Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#define CONFIG_ENV_OFFSET		0x4000
-#define CONFIG_ENV_SECT_SIZE	0x2000
 
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
diff --git a/include/configs/M5373EVB.h b/include/configs/M5373EVB.h
index f62fb5ac63ff..576c075a174c 100644
--- a/include/configs/M5373EVB.h
+++ b/include/configs/M5373EVB.h
@@ -166,8 +166,6 @@
 /* Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#define CONFIG_ENV_OFFSET		0x4000
-#define CONFIG_ENV_SECT_SIZE	0x2000
 
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
diff --git a/include/configs/M54418TWR.h b/include/configs/M54418TWR.h
index e07684d82034..72cc13ab79fc 100644
--- a/include/configs/M54418TWR.h
+++ b/include/configs/M54418TWR.h
@@ -220,21 +220,7 @@
 /* Configuration for environment
  * Environment is embedded in u-boot in the second sector of the flash
  */
-#if !defined(CONFIG_SERIAL_BOOT)  /*MRAM boot*/
-#define CONFIG_ENV_ADDR		(0x40000 - 0x1000) /*MRAM size 40000*/
-#define CONFIG_ENV_SIZE		0x1000
-#endif
 
-#if defined(CONFIG_CF_SBF)
-#define CONFIG_ENV_OFFSET		0x40000
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#endif
-#if defined(CONFIG_SYS_NAND_BOOT)
-#define CONFIG_ENV_OFFSET	0x80000
-#define CONFIG_ENV_SIZE	0x20000
-#define CONFIG_ENV_SECT_SIZE	0x20000
-#endif
 #undef CONFIG_ENV_OVERWRITE
 
 /* FLASH organization */
diff --git a/include/configs/M54451EVB.h b/include/configs/M54451EVB.h
index 2bd0e6223172..5482edeb2d91 100644
--- a/include/configs/M54451EVB.h
+++ b/include/configs/M54451EVB.h
@@ -185,15 +185,6 @@
  * Environment is not embedded in u-boot. First time runing may have env
  * crc error warning if there is no correct environment on the flash.
  */
-#if defined(CONFIG_SYS_STMICRO_BOOT)
-#	define CONFIG_ENV_OFFSET		0x20000
-#	define CONFIG_ENV_SIZE		0x2000
-#	define CONFIG_ENV_SECT_SIZE	0x10000
-#else
-#	define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + 0x40000)
-#	define CONFIG_ENV_SIZE		0x2000
-#	define CONFIG_ENV_SECT_SIZE	0x20000
-#endif
 #undef CONFIG_ENV_OVERWRITE
 
 /* FLASH organization */
diff --git a/include/configs/M54455EVB.h b/include/configs/M54455EVB.h
index d73101f96c5e..9434cc278e2c 100644
--- a/include/configs/M54455EVB.h
+++ b/include/configs/M54455EVB.h
@@ -246,25 +246,16 @@
 #ifdef CONFIG_SYS_STMICRO_BOOT
 #	define CONFIG_SYS_FLASH_BASE		CONFIG_SYS_CS0_BASE
 #	define CONFIG_SYS_FLASH0_BASE		CONFIG_SYS_CS1_BASE
-#	define CONFIG_ENV_OFFSET		0x30000
-#	define CONFIG_ENV_SIZE		0x2000
-#	define CONFIG_ENV_SECT_SIZE	0x10000
 #endif
 #ifdef CONFIG_SYS_ATMEL_BOOT
 #	define CONFIG_SYS_FLASH_BASE		CONFIG_SYS_CS0_BASE
 #	define CONFIG_SYS_FLASH0_BASE		CONFIG_SYS_CS0_BASE
 #	define CONFIG_SYS_FLASH1_BASE		CONFIG_SYS_CS1_BASE
-#	define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + 0x40000)
-#	define CONFIG_ENV_SIZE		0x2000
-#	define CONFIG_ENV_SECT_SIZE	0x10000
 #endif
 #ifdef CONFIG_SYS_INTEL_BOOT
 #	define CONFIG_SYS_FLASH_BASE		CONFIG_SYS_CS0_BASE
 #	define CONFIG_SYS_FLASH0_BASE		CONFIG_SYS_CS0_BASE
 #	define CONFIG_SYS_FLASH1_BASE		CONFIG_SYS_CS1_BASE
-#	define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + 0x40000)
-#	define CONFIG_ENV_SIZE		0x2000
-#	define CONFIG_ENV_SECT_SIZE	0x20000
 #endif
 
 #ifdef CONFIG_SYS_FLASH_CFI
diff --git a/include/configs/M5475EVB.h b/include/configs/M5475EVB.h
index 7cc09ab7cc9a..721592350713 100644
--- a/include/configs/M5475EVB.h
+++ b/include/configs/M5475EVB.h
@@ -208,8 +208,6 @@
  * First time runing may have env crc error warning if there is
  * no correct environment on the flash.
  */
-#define CONFIG_ENV_OFFSET		0x40000
-#define CONFIG_ENV_SECT_SIZE	0x10000
 
 /*-----------------------------------------------------------------------
  * Cache Configuration
diff --git a/include/configs/M5485EVB.h b/include/configs/M5485EVB.h
index 3f5ced28ec8b..49d5d9cf1106 100644
--- a/include/configs/M5485EVB.h
+++ b/include/configs/M5485EVB.h
@@ -195,8 +195,6 @@
  * Environment is not embedded in u-boot. First time runing may have env
  * crc error warning if there is no correct environment on the flash.
  */
-#define CONFIG_ENV_OFFSET		0x40000
-#define CONFIG_ENV_SECT_SIZE	0x10000
 
 /*-----------------------------------------------------------------------
  * Cache Configuration
diff --git a/include/configs/MCR3000.h b/include/configs/MCR3000.h
index 3c46ae039626..72533bc80723 100644
--- a/include/configs/MCR3000.h
+++ b/include/configs/MCR3000.h
@@ -94,8 +94,6 @@
 /* Environment Configuration */
 
 /* environment is in FLASH */
-#define CONFIG_ENV_SECT_SIZE	0x2000
-#define CONFIG_ENV_OFFSET	0x4000
 #define CONFIG_ENV_OVERWRITE	1
 
 /* Ethernet configuration part */
diff --git a/include/configs/MPC8308RDB.h b/include/configs/MPC8308RDB.h
index e4a51d2d27e2..29561c41016c 100644
--- a/include/configs/MPC8308RDB.h
+++ b/include/configs/MPC8308RDB.h
@@ -248,11 +248,6 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-				 CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x10000 /* 64K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8313ERDB_NAND.h b/include/configs/MPC8313ERDB_NAND.h
index fb09c2630f9c..4389d66dc0cb 100644
--- a/include/configs/MPC8313ERDB_NAND.h
+++ b/include/configs/MPC8313ERDB_NAND.h
@@ -297,11 +297,7 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_OFFSET		(512 * 1024)
-#define CONFIG_ENV_SECT_SIZE	CONFIG_SYS_NAND_BLOCK_SIZE
-#define CONFIG_ENV_SIZE		CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_RANGE		(CONFIG_ENV_SECT_SIZE * 4)
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_RANGE)
+#define CONFIG_ENV_RANGE		(CONFIG_SYS_NAND_BLOCK_SIZE * 4)
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8313ERDB_NOR.h b/include/configs/MPC8313ERDB_NOR.h
index ff8dedf03e46..20aaa83f460b 100644
--- a/include/configs/MPC8313ERDB_NOR.h
+++ b/include/configs/MPC8313ERDB_NOR.h
@@ -266,15 +266,7 @@
  * Environment
  */
 #if !defined(CONFIG_SYS_RAMBOOT)
-	#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-	#define CONFIG_ENV_SECT_SIZE	0x10000	/* 64K(one sector) for env */
-	#define CONFIG_ENV_SIZE		0x2000
-
 /* Address and size of Redundant Environment Sector */
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
 #endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
diff --git a/include/configs/MPC8315ERDB.h b/include/configs/MPC8315ERDB.h
index 521c5ca6eec5..169d747af9b5 100644
--- a/include/configs/MPC8315ERDB.h
+++ b/include/configs/MPC8315ERDB.h
@@ -299,15 +299,6 @@
 /*
  * Environment
  */
-#if !defined(CONFIG_SYS_RAMBOOT)
-	#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-	#define CONFIG_ENV_SECT_SIZE	0x10000 /* 64K(one sector) for env */
-	#define CONFIG_ENV_SIZE		0x2000
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8323ERDB.h b/include/configs/MPC8323ERDB.h
index 94c2a6170f61..d39ba8f5d95c 100644
--- a/include/configs/MPC8323ERDB.h
+++ b/include/configs/MPC8323ERDB.h
@@ -211,15 +211,6 @@
 /*
  * Environment
  */
-#ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-	#define CONFIG_ENV_SECT_SIZE	0x20000
-	#define CONFIG_ENV_SIZE		0x2000
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC832XEMDS.h b/include/configs/MPC832XEMDS.h
index 26a44071efd5..f410763a7ec8 100644
--- a/include/configs/MPC832XEMDS.h
+++ b/include/configs/MPC832XEMDS.h
@@ -237,15 +237,6 @@
 /*
  * Environment
  */
-#ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-	#define CONFIG_ENV_SECT_SIZE	0x20000
-	#define CONFIG_ENV_SIZE		0x2000
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8349EMDS.h b/include/configs/MPC8349EMDS.h
index 10293bd5f1b5..295cb169903d 100644
--- a/include/configs/MPC8349EMDS.h
+++ b/include/configs/MPC8349EMDS.h
@@ -269,17 +269,7 @@
  * Environment
  */
 #ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-	#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-	#define CONFIG_ENV_SIZE		0x2000
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
-
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
 #endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
diff --git a/include/configs/MPC8349EMDS_SDRAM.h b/include/configs/MPC8349EMDS_SDRAM.h
index 0193a6bfb736..79f2e38e952b 100644
--- a/include/configs/MPC8349EMDS_SDRAM.h
+++ b/include/configs/MPC8349EMDS_SDRAM.h
@@ -324,17 +324,7 @@
  * Environment
  */
 #ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-	#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-	#define CONFIG_ENV_SIZE		0x2000
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
-
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
 #endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
diff --git a/include/configs/MPC8349ITX.h b/include/configs/MPC8349ITX.h
index c395d6237903..d0ae923ec3e7 100644
--- a/include/configs/MPC8349ITX.h
+++ b/include/configs/MPC8349ITX.h
@@ -340,16 +340,6 @@ boards, we say we have two, but don't display a message if we find only one. */
  */
 #define CONFIG_ENV_OVERWRITE
 
-#ifndef CONFIG_SYS_RAMBOOT
-  #define CONFIG_ENV_ADDR	\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-  #define CONFIG_ENV_SECT_SIZE	0x10000 /* 64K (one sector) for environment */
-  #define CONFIG_ENV_SIZE	0x2000
-#else
-  #define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - 0x1000)
-  #define CONFIG_ENV_SIZE	0x2000
-#endif
-
 #define CONFIG_LOADS_ECHO	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	/* allow baudrate change */
 
diff --git a/include/configs/MPC837XEMDS.h b/include/configs/MPC837XEMDS.h
index 724f8afb76d1..f6420da21deb 100644
--- a/include/configs/MPC837XEMDS.h
+++ b/include/configs/MPC837XEMDS.h
@@ -299,15 +299,6 @@ extern int board_pci_host_broken(void);
 /*
  * Environment
  */
-#ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-	#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K(one sector) for env */
-	#define CONFIG_ENV_SIZE		0x2000
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC837XERDB.h b/include/configs/MPC837XERDB.h
index 37f51ba743bc..1ba6f07e9296 100644
--- a/include/configs/MPC837XERDB.h
+++ b/include/configs/MPC837XERDB.h
@@ -315,15 +315,6 @@
 /*
  * Environment
  */
-#ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE+CONFIG_SYS_MONITOR_LEN)
-	#define CONFIG_ENV_SECT_SIZE	0x10000	/* 64K (one sector) for env */
-	#define CONFIG_ENV_SIZE		0x4000
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE-0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8536DS.h b/include/configs/MPC8536DS.h
index 7697e8d3e061..8fc8dfd2b2f1 100644
--- a/include/configs/MPC8536DS.h
+++ b/include/configs/MPC8536DS.h
@@ -523,21 +523,10 @@
 
 #if defined(CONFIG_SYS_RAMBOOT)
 #if defined(CONFIG_RAMBOOT_SPIFLASH)
-#define CONFIG_ENV_SIZE		0x2000	/* 8KB */
-#define CONFIG_ENV_OFFSET	0xF0000
-#define CONFIG_ENV_SECT_SIZE	0x10000
 #elif defined(CONFIG_RAMBOOT_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
-#define CONFIG_ENV_SIZE		0x2000
 #define CONFIG_SYS_MMC_ENV_DEV  0
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
 #endif
-#else
-	#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-	#define CONFIG_ENV_SIZE		0x2000
-	#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
diff --git a/include/configs/MPC8540ADS.h b/include/configs/MPC8540ADS.h
index 13ca2c395df3..a5483dabaf82 100644
--- a/include/configs/MPC8540ADS.h
+++ b/include/configs/MPC8540ADS.h
@@ -282,14 +282,6 @@
 /*
  * Environment
  */
-#ifndef CONFIG_SYS_RAMBOOT
-  #define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0x40000)
-  #define CONFIG_ENV_SECT_SIZE	0x40000	/* 256K(one sector) for env */
-  #define CONFIG_ENV_SIZE		0x2000
-#else
-  #define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-  #define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8541CDS.h b/include/configs/MPC8541CDS.h
index e00a56e2fd9f..f81f4b0e6468 100644
--- a/include/configs/MPC8541CDS.h
+++ b/include/configs/MPC8541CDS.h
@@ -314,9 +314,6 @@ extern unsigned long get_clock_freq(void);
 /*
  * Environment
  */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0x40000)
-#define CONFIG_ENV_SECT_SIZE	0x40000	/* 256K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8544DS.h b/include/configs/MPC8544DS.h
index 2cbe8552358a..4eb2888caeae 100644
--- a/include/configs/MPC8544DS.h
+++ b/include/configs/MPC8544DS.h
@@ -307,13 +307,6 @@ extern unsigned long get_board_sys_clk(unsigned long dummy);
 /*
  * Environment
  */
-#define CONFIG_ENV_SECT_SIZE	0x10000 /* 64K (one sector) */
-#if CONFIG_SYS_MONITOR_BASE > 0xfff80000
-#define CONFIG_ENV_ADDR		0xfff80000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#endif
-#define CONFIG_ENV_SIZE		0x2000
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8548CDS.h b/include/configs/MPC8548CDS.h
index 3a8c074dc55e..a68d190f6ab5 100644
--- a/include/configs/MPC8548CDS.h
+++ b/include/configs/MPC8548CDS.h
@@ -429,13 +429,6 @@ extern unsigned long get_clock_freq(void);
 /*
  * Environment
  */
-#if CONFIG_SYS_MONITOR_BASE > 0xfff80000
-#define CONFIG_ENV_ADDR	0xfff80000
-#else
-#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#endif
-#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K for env */
-#define CONFIG_ENV_SIZE		0x2000
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8555CDS.h b/include/configs/MPC8555CDS.h
index 5b3933412c23..d53e156f3089 100644
--- a/include/configs/MPC8555CDS.h
+++ b/include/configs/MPC8555CDS.h
@@ -312,9 +312,6 @@ extern unsigned long get_clock_freq(void);
 /*
  * Environment
  */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0x40000)
-#define CONFIG_ENV_SECT_SIZE	0x40000	/* 256K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8560ADS.h b/include/configs/MPC8560ADS.h
index 5ba2b6d64348..20684dc6f3d3 100644
--- a/include/configs/MPC8560ADS.h
+++ b/include/configs/MPC8560ADS.h
@@ -315,14 +315,6 @@
 /*
  * Environment
  */
-#ifndef CONFIG_SYS_RAMBOOT
-  #define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0x40000)
-  #define CONFIG_ENV_SECT_SIZE	0x40000	/* 256K(one sector) for env */
-  #define CONFIG_ENV_SIZE		0x2000
-#else
-  #define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-  #define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8568MDS.h b/include/configs/MPC8568MDS.h
index 01ee69c0131b..3a078a363c36 100644
--- a/include/configs/MPC8568MDS.h
+++ b/include/configs/MPC8568MDS.h
@@ -325,9 +325,6 @@ extern unsigned long get_clock_freq(void);
 /*
  * Environment
  */
-#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8569MDS.h b/include/configs/MPC8569MDS.h
index de187bf9a4f5..da86f94e544f 100644
--- a/include/configs/MPC8569MDS.h
+++ b/include/configs/MPC8569MDS.h
@@ -409,12 +409,6 @@ extern unsigned long get_clock_freq(void);
 /*
  * Environment
  */
-#if defined(CONFIG_SYS_RAMBOOT)
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8572DS.h b/include/configs/MPC8572DS.h
index e3952f423bfb..0f4c7e6f4885 100644
--- a/include/configs/MPC8572DS.h
+++ b/include/configs/MPC8572DS.h
@@ -506,18 +506,6 @@
  * Environment
  */
 
-#if defined(CONFIG_SYS_RAMBOOT)
-
-#else
-	#if CONFIG_SYS_MONITOR_BASE > 0xfff80000
-	#define CONFIG_ENV_ADDR	0xfff80000
-	#else
-	#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-	#endif
-	#define CONFIG_ENV_SIZE	0x2000
-	#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
-#endif
-
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
 
diff --git a/include/configs/MPC8610HPCD.h b/include/configs/MPC8610HPCD.h
index 04f55e399041..8b10a6cfef94 100644
--- a/include/configs/MPC8610HPCD.h
+++ b/include/configs/MPC8610HPCD.h
@@ -383,14 +383,6 @@
 /*
  * Environment
  */
-#ifndef CONFIG_SYS_RAMBOOT
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x20000	/* 126k (one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE		0x2000
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MPC8641HPCN.h b/include/configs/MPC8641HPCN.h
index 8c01891e263a..db05a6cb077a 100644
--- a/include/configs/MPC8641HPCN.h
+++ b/include/configs/MPC8641HPCN.h
@@ -545,14 +545,6 @@ extern unsigned long get_board_sys_clk(unsigned long dummy);
 /*
  * Environment
  */
-#ifndef CONFIG_SYS_RAMBOOT
-    #define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-    #define CONFIG_ENV_SECT_SIZE		0x10000	/* 64K(one sector) for env */
-#else
-    #define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#endif
-#define CONFIG_ENV_SIZE		0x2000
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/MigoR.h b/include/configs/MigoR.h
index fab355e1f2a4..c58b7814ba94 100644
--- a/include/configs/MigoR.h
+++ b/include/configs/MigoR.h
@@ -78,11 +78,7 @@
 
 /* ENV setting */
 #define CONFIG_ENV_OVERWRITE	1
-#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + CONFIG_SYS_MONITOR_LEN)
 /* Offset of env Flash sector relative to CONFIG_SYS_FLASH_BASE */
-#define CONFIG_ENV_OFFSET		(CONFIG_ENV_ADDR - CONFIG_SYS_FLASH_BASE)
 
 /* Board Clock */
 #define CONFIG_SYS_CLK_FREQ	33333333
diff --git a/include/configs/P1010RDB.h b/include/configs/P1010RDB.h
index 344e19d2c55c..9244feea8bdf 100644
--- a/include/configs/P1010RDB.h
+++ b/include/configs/P1010RDB.h
@@ -629,32 +629,16 @@ extern unsigned long get_sdram_size(void);
 #if defined(CONFIG_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#elif defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_OFFSET	0x100000	/* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#define CONFIG_ENV_SIZE		0x2000
 #elif defined(CONFIG_NAND)
 #ifdef CONFIG_TPL_BUILD
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_INIT_L2_ADDR + (160 << 10))
+#define SPL_ENV_ADDR		(CONFIG_SYS_INIT_L2_ADDR + (160 << 10))
 #else
 #if defined(CONFIG_TARGET_P1010RDB_PA)
-#define CONFIG_ENV_SIZE		CONFIG_SYS_NAND_BLOCK_SIZE
 #define CONFIG_ENV_RANGE	(3 * CONFIG_ENV_SIZE) /* 3*16=48K for env */
 #elif defined(CONFIG_TARGET_P1010RDB_PB)
-#define CONFIG_ENV_SIZE		(16 * 1024)
 #define CONFIG_ENV_RANGE	(32 * CONFIG_ENV_SIZE) /* new block size 512K */
 #endif
 #endif
-#define CONFIG_ENV_OFFSET	(1024 * 1024)
-#elif defined(CONFIG_SYS_RAMBOOT)
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE			0x2000
-#else
-#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
diff --git a/include/configs/P1022DS.h b/include/configs/P1022DS.h
index 4b2eb6525bde..db4b94ec1ecb 100644
--- a/include/configs/P1022DS.h
+++ b/include/configs/P1022DS.h
@@ -492,30 +492,16 @@
 /*
  * Environment
  */
-#ifdef CONFIG_SPIFLASH
-#define CONFIG_ENV_SIZE		0x2000	/* 8KB */
-#define CONFIG_ENV_OFFSET	0x100000	/* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#elif defined(CONFIG_SDCARD)
+#if defined(CONFIG_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
-#define CONFIG_ENV_SIZE		0x2000
 #define CONFIG_SYS_MMC_ENV_DEV	0
 #elif defined(CONFIG_NAND)
+#define CONFIG_ENV_RANGE	(3 * CONFIG_ENV_SIZE)
 #ifdef CONFIG_TPL_BUILD
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_INIT_L2_ADDR + (160 << 10))
-#else
-#define CONFIG_ENV_SIZE		CONFIG_SYS_NAND_BLOCK_SIZE
+#define SPL_ENV_ADDR		(CONFIG_SYS_INIT_L2_ADDR + (160 << 10))
 #endif
-#define CONFIG_ENV_OFFSET	(1024 * 1024)
-#define CONFIG_ENV_RANGE	(3 * CONFIG_ENV_SIZE)
 #elif defined(CONFIG_SYS_RAMBOOT)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
+#define SPL_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
 #endif
 
 #define CONFIG_LOADS_ECHO
diff --git a/include/configs/P1023RDB.h b/include/configs/P1023RDB.h
index 9535a7bbb2fa..1818b4b70d7c 100644
--- a/include/configs/P1023RDB.h
+++ b/include/configs/P1023RDB.h
@@ -214,10 +214,6 @@ extern unsigned long get_clock_freq(void);
  */
 #define CONFIG_ENV_OVERWRITE
 
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
-
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	/* allow baudrate change */
 
diff --git a/include/configs/P2041RDB.h b/include/configs/P2041RDB.h
index f8cfef7b2d75..d0a935c41124 100644
--- a/include/configs/P2041RDB.h
+++ b/include/configs/P2041RDB.h
@@ -48,27 +48,9 @@
 #define CONFIG_ENV_OVERWRITE
 
 #if defined(CONFIG_SPIFLASH)
-	#define CONFIG_ENV_SIZE                 0x2000          /* 8KB */
-	#define CONFIG_ENV_OFFSET               0x100000        /* 1MB */
-	#define CONFIG_ENV_SECT_SIZE            0x10000
 #elif defined(CONFIG_SDCARD)
 	#define CONFIG_FSL_FIXED_MMC_LOCATION
 	#define CONFIG_SYS_MMC_ENV_DEV          0
-	#define CONFIG_ENV_SIZE			0x2000
-	#define CONFIG_ENV_OFFSET		(512 * 1658)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE			CONFIG_SYS_NAND_BLOCK_SIZE
-#define CONFIG_ENV_OFFSET		(7 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_SRIO_PCIE_BOOT_SLAVE)
-#define CONFIG_ENV_ADDR		0xffe20000
-#define CONFIG_ENV_SIZE		0x2000
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE \
-			- CONFIG_ENV_SECT_SIZE)
-	#define CONFIG_ENV_SIZE		0x2000
-	#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #ifndef __ASSEMBLY__
diff --git a/include/configs/SBx81LIFKW.h b/include/configs/SBx81LIFKW.h
index f24cd23af223..b17113ab9a82 100644
--- a/include/configs/SBx81LIFKW.h
+++ b/include/configs/SBx81LIFKW.h
@@ -56,9 +56,6 @@
 /*
  *  Environment variables configurations
  */
-#define CONFIG_ENV_SECT_SIZE		0x40000		/* 256K */
-#define CONFIG_ENV_SIZE			0x02000
-#define CONFIG_ENV_OFFSET		0xc0000		/* env starts here - 768K */
 
 /*
  * U-Boot bootcode configuration
diff --git a/include/configs/SBx81LIFXCAT.h b/include/configs/SBx81LIFXCAT.h
index b60232326271..462e62c7c204 100644
--- a/include/configs/SBx81LIFXCAT.h
+++ b/include/configs/SBx81LIFXCAT.h
@@ -56,9 +56,6 @@
 /*
  *  Environment variables configurations
  */
-#define CONFIG_ENV_SECT_SIZE		0x40000		/* 256K */
-#define CONFIG_ENV_SIZE			0x02000
-#define CONFIG_ENV_OFFSET		0xc0000		/* env starts here - 768K */
 
 /*
  * U-Boot bootcode configuration
diff --git a/include/configs/T102xQDS.h b/include/configs/T102xQDS.h
index fe9a9097ce9a..c6b88c16545c 100644
--- a/include/configs/T102xQDS.h
+++ b/include/configs/T102xQDS.h
@@ -122,25 +122,8 @@
 #endif
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE			0x2000		/* 8KB */
-#define CONFIG_ENV_OFFSET		0x100000	/* 1MB */
-#define CONFIG_ENV_SECT_SIZE		0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 0x800)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(10 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_SRIO_PCIE_BOOT_SLAVE)
-#define CONFIG_ENV_ADDR		0xffe20000
-#define CONFIG_ENV_SIZE		0x2000
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #ifndef __ASSEMBLY__
@@ -173,9 +156,7 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_SYS_INIT_L3_ADDR		0xFFFC0000
 #define CONFIG_SYS_L3_SIZE		(256 << 10)
 #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_ADDR + 32 * 1024)
-#ifdef CONFIG_RAMBOOT_PBL
-#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
-#endif
+#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_SIZE	(30 << 10)
 #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
diff --git a/include/configs/T102xRDB.h b/include/configs/T102xRDB.h
index 8c1434fb10e0..88a6f0361a65 100644
--- a/include/configs/T102xRDB.h
+++ b/include/configs/T102xRDB.h
@@ -137,33 +137,8 @@
 #endif
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE			0x2000		/* 8KB */
-#define CONFIG_ENV_OFFSET		0x100000	/* 1MB */
-#if defined(CONFIG_TARGET_T1024RDB)
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#elif defined(CONFIG_TARGET_T1023RDB)
-#define CONFIG_ENV_SECT_SIZE		0x40000
-#endif
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 0x800)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE			0x2000
-#if defined(CONFIG_TARGET_T1024RDB)
-#define CONFIG_ENV_OFFSET		(2 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_TARGET_T1023RDB)
-#define CONFIG_ENV_OFFSET		(10 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#endif
-#elif defined(CONFIG_SRIO_PCIE_BOOT_SLAVE)
-#define CONFIG_ENV_ADDR		0xffe20000
-#define CONFIG_ENV_SIZE		0x2000
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #ifndef __ASSEMBLY__
@@ -196,9 +171,7 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_SYS_INIT_L3_ADDR		0xFFFC0000
 #define CONFIG_SYS_L3_SIZE		(256 << 10)
 #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_ADDR + 32 * 1024)
-#ifdef CONFIG_RAMBOOT_PBL
-#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
-#endif
+#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_SIZE	(30 << 10)
 #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
diff --git a/include/configs/T1040QDS.h b/include/configs/T1040QDS.h
index d8b65e699c93..2881ee9e1841 100644
--- a/include/configs/T1040QDS.h
+++ b/include/configs/T1040QDS.h
@@ -59,24 +59,9 @@
 
 #ifdef CONFIG_MTD_NOR_FLASH
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE                 0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET               0x100000        /* 1MB */
-#define CONFIG_ENV_SECT_SIZE            0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV          0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 1658)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE			CONFIG_SYS_NAND_BLOCK_SIZE
-#define CONFIG_ENV_OFFSET		(7 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
-#else /* CONFIG_MTD_NOR_FLASH */
-#define CONFIG_ENV_SIZE                0x2000
-#define CONFIG_ENV_SECT_SIZE   0x20000 /* 128K (one sector) */
 #endif
 
 #ifndef __ASSEMBLY__
diff --git a/include/configs/T104xRDB.h b/include/configs/T104xRDB.h
index 7cc3db943e50..a8e51e72c639 100644
--- a/include/configs/T104xRDB.h
+++ b/include/configs/T104xRDB.h
@@ -155,24 +155,13 @@ $(SRCTREE)/board/freescale/t104xrdb/t1042d4_sd_rcw.cfg
 #define CONFIG_ENV_OVERWRITE
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE                 0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET               0x100000        /* 1MB */
-#define CONFIG_ENV_SECT_SIZE            0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV          0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 0x800)
 #elif defined(CONFIG_NAND)
 #ifdef CONFIG_NXP_ESBC
 #define CONFIG_RAMBOOT_NAND
 #define CONFIG_BOOTSCRIPT_COPY_RAM
 #endif
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(3 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #define CONFIG_SYS_CLK_FREQ	100000000
@@ -211,9 +200,7 @@ $(SRCTREE)/board/freescale/t104xrdb/t1042d4_sd_rcw.cfg
 #define CONFIG_SYS_INIT_L3_VADDR	0xFFFC0000
 #define CONFIG_SYS_L3_SIZE		256 << 10
 #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_VADDR + 32 * 1024)
-#ifdef CONFIG_RAMBOOT_PBL
-#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
-#endif
+#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_SIZE	(30 << 10)
 #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
diff --git a/include/configs/T208xQDS.h b/include/configs/T208xQDS.h
index 54ec1abd66a2..f485e4e6da6d 100644
--- a/include/configs/T208xQDS.h
+++ b/include/configs/T208xQDS.h
@@ -118,25 +118,8 @@
 #endif
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE		0x2000	   /* 8KB */
-#define CONFIG_ENV_OFFSET	0x100000   /* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV	0
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_OFFSET	(512 * 0x800)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_OFFSET	(10 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_SRIO_PCIE_BOOT_SLAVE)
-#define CONFIG_ENV_ADDR		0xffe20000
-#define CONFIG_ENV_SIZE		0x2000
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #ifndef __ASSEMBLY__
@@ -153,9 +136,7 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_SYS_INIT_L3_ADDR		0xFFFC0000
 #define CONFIG_SYS_L3_SIZE		(512 << 10)
 #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_ADDR + 32 * 1024)
-#ifdef CONFIG_RAMBOOT_PBL
-#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
-#endif
+#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_SIZE	(50 << 10)
 #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
diff --git a/include/configs/T208xRDB.h b/include/configs/T208xRDB.h
index 3d95c4afa262..b64bafdb330e 100644
--- a/include/configs/T208xRDB.h
+++ b/include/configs/T208xRDB.h
@@ -103,25 +103,8 @@
 #define CONFIG_SYS_MEMTEST_END		0x00400000
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE		0x2000	   /* 8KB */
-#define CONFIG_ENV_OFFSET	0x100000   /* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV	0
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_OFFSET	(512 * 0x800)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_OFFSET	(2 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_SRIO_PCIE_BOOT_SLAVE)
-#define CONFIG_ENV_ADDR		0xffe20000
-#define CONFIG_ENV_SIZE		0x2000
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #ifndef __ASSEMBLY__
@@ -138,9 +121,7 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_SYS_INIT_L3_ADDR		0xFFFC0000
 #define CONFIG_SYS_L3_SIZE		(512 << 10)
 #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_ADDR + 32 * 1024)
-#ifdef CONFIG_RAMBOOT_PBL
-#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
-#endif
+#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_SIZE	(50 << 10)
 #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
diff --git a/include/configs/T4240QDS.h b/include/configs/T4240QDS.h
index f17625365e14..a7ef469375e0 100644
--- a/include/configs/T4240QDS.h
+++ b/include/configs/T4240QDS.h
@@ -69,25 +69,8 @@
 #include "t4qds.h"
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE                 0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET               0x100000        /* 1MB */
-#define CONFIG_ENV_SECT_SIZE            0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV          0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 0x800)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(10 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_SRIO_PCIE_BOOT_SLAVE)
-#define CONFIG_ENV_ADDR		0xffe20000
-#define CONFIG_ENV_SIZE		0x2000
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #define CONFIG_SYS_CLK_FREQ	get_board_sys_clk()
diff --git a/include/configs/T4240RDB.h b/include/configs/T4240RDB.h
index 57d8d171a7db..fc2aed335688 100644
--- a/include/configs/T4240RDB.h
+++ b/include/configs/T4240RDB.h
@@ -89,9 +89,7 @@
 #define CONFIG_SYS_INIT_L3_ADDR		0xFFFC0000
 #define CONFIG_SYS_L3_SIZE		(512 << 10)
 #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_ADDR + 32 * 1024)
-#ifdef CONFIG_RAMBOOT_PBL
-#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
-#endif
+#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_SIZE	(50 << 10)
 #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
@@ -280,22 +278,8 @@
 	"bootm 0x01000000 - 0x00f00000"
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE                 0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET               0x100000        /* 1MB */
-#define CONFIG_ENV_SECT_SIZE            0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_SYS_MMC_ENV_DEV          0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 0x800)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE			CONFIG_SYS_NAND_BLOCK_SIZE
-#define CONFIG_ENV_OFFSET		(7 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #define CONFIG_SYS_CLK_FREQ	66666666
diff --git a/include/configs/TQM834x.h b/include/configs/TQM834x.h
index c8537e03139e..f557a3c93624 100644
--- a/include/configs/TQM834x.h
+++ b/include/configs/TQM834x.h
@@ -186,11 +186,6 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K (one sector) for env */
-#define CONFIG_ENV_SIZE		0x8000	/*  32K max size */
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_LOADS_ECHO		1 /* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1 /* allow baudrate change */
diff --git a/include/configs/UCP1020.h b/include/configs/UCP1020.h
index b2778a93c984..68276a15a748 100644
--- a/include/configs/UCP1020.h
+++ b/include/configs/UCP1020.h
@@ -370,49 +370,11 @@
 /*
  * Environment
  */
-#ifdef CONFIG_ENV_FIT_UCBOOT
-
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + 0x20000)
-#define CONFIG_ENV_SIZE		0x20000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
-
-#else
-
-
-#ifdef CONFIG_RAMBOOT_SPIFLASH
-
-#define CONFIG_ENV_SIZE		0x3000		/* 12KB */
-#define CONFIG_ENV_OFFSET	0x2000		/* 8KB */
-#define CONFIG_ENV_SECT_SIZE	0x1000
-
-#if defined(CONFIG_SYS_REDUNDAND_ENVIRONMENT)
-/* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
-#endif
-
-#elif defined(CONFIG_RAMBOOT_SDCARD)
+#if !defined(CONFIG_ENV_FIT_UCBOOT) && defined(CONFIG_RAMBOOT_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
-#define CONFIG_ENV_SIZE		0x2000
 #define CONFIG_SYS_MMC_ENV_DEV	0
-
-#elif defined(CONFIG_SYS_RAMBOOT)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE		0x2000
-
-#else
-#define CONFIG_ENV_BASE		(CONFIG_SYS_FLASH_BASE)
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
-#define CONFIG_ENV_SIZE		CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_ADDR		(CONFIG_ENV_BASE + 0xC0000)
-#if defined(CONFIG_SYS_REDUNDAND_ENVIRONMENT)
-/* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SIZE)
 #endif
 
-#endif
-
-#endif	/* CONFIG_ENV_FIT_UCBOOT */
-
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	/* allow baudrate change */
 
diff --git a/include/configs/adp-ae3xx.h b/include/configs/adp-ae3xx.h
index 1fe33917d01f..5b035c7ec5a3 100644
--- a/include/configs/adp-ae3xx.h
+++ b/include/configs/adp-ae3xx.h
@@ -201,9 +201,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	512
 
 /* environments */
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x140000
-#define CONFIG_ENV_SIZE			8192
 #define CONFIG_ENV_OVERWRITE
 
 
diff --git a/include/configs/adp-ag101p.h b/include/configs/adp-ag101p.h
index 6cf494e73f5b..71c7fe929d3d 100644
--- a/include/configs/adp-ag101p.h
+++ b/include/configs/adp-ag101p.h
@@ -316,12 +316,9 @@
 
 /* max number of sectors on one chip */
 #define CONFIG_FLASH_SECTOR_SIZE	(0x10000*2)
-#define CONFIG_ENV_SECT_SIZE		CONFIG_FLASH_SECTOR_SIZE
 #define CONFIG_SYS_MAX_FLASH_SECT	512
 
 /* environments */
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_MONITOR_BASE + 0x140000)
-#define CONFIG_ENV_SIZE			8192
 #define CONFIG_ENV_OVERWRITE
 
 /*
diff --git a/include/configs/advantech_dms-ba16.h b/include/configs/advantech_dms-ba16.h
index 129885981217..a115676d4cf1 100644
--- a/include/configs/advantech_dms-ba16.h
+++ b/include/configs/advantech_dms-ba16.h
@@ -204,10 +204,6 @@
 
 /* FLASH and environment organization */
 
-#define CONFIG_ENV_SIZE                 (8 * 1024)
-#define CONFIG_ENV_OFFSET               (768 * 1024)
-#define CONFIG_ENV_SECT_SIZE            (64 * 1024)
-
 #define CONFIG_SYS_FSL_USDHC_NUM        3
 
 /* Framebuffer */
diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
index 15cda803cc2b..085b2bcac048 100644
--- a/include/configs/am335x_evm.h
+++ b/include/configs/am335x_evm.h
@@ -274,23 +274,11 @@
  */
 #if defined(CONFIG_SPI_BOOT)
 /* SPL related */
-
-#define CONFIG_ENV_SECT_SIZE		(4 << 10) /* 4 KB sectors */
-#define CONFIG_ENV_OFFSET		(768 << 10) /* 768 KiB in */
-#define CONFIG_ENV_OFFSET_REDUND	(896 << 10) /* 896 KiB in */
 #elif defined(CONFIG_EMMC_BOOT)
 #define CONFIG_SYS_MMC_ENV_DEV		1
 #define CONFIG_SYS_MMC_ENV_PART		0
-#define CONFIG_ENV_OFFSET		0x260000
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_MAX_DEVICE	2
-#elif defined(CONFIG_NOR_BOOT)
-#define CONFIG_ENV_SECT_SIZE		(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_OFFSET		(512 << 10)	/* 512 KiB */
-#define CONFIG_ENV_OFFSET_REDUND	(768 << 10)	/* 768 KiB */
 #elif defined(CONFIG_ENV_IS_IN_NAND)
-#define CONFIG_ENV_OFFSET		0x001c0000
-#define CONFIG_ENV_OFFSET_REDUND	0x001e0000
 #define CONFIG_SYS_ENV_SECT_SIZE	CONFIG_SYS_NAND_BLOCK_SIZE
 #endif
 
diff --git a/include/configs/am335x_shc.h b/include/configs/am335x_shc.h
index b34e48cb454e..eabf19ddebd0 100644
--- a/include/configs/am335x_shc.h
+++ b/include/configs/am335x_shc.h
@@ -45,13 +45,9 @@
  * ENV at MMC Boot0 Partition - 0/Undefined=user, 1=boot0, 2=boot1,
  * 4..7=general0..3
  */
-#define CONFIG_ENV_SIZE				0x1000 /* 4 KB */
-#define CONFIG_ENV_OFFSET			0x7000 /* 28 kB */
 
 #define CONFIG_HSMMC2_8BIT
 
-#define CONFIG_ENV_OFFSET_REDUND    0x9000 /* 36 kB */
-
 #ifndef CONFIG_SHC_ICT
 /*
  * In builds other than ICT, reset to retry after timeout
diff --git a/include/configs/am335x_sl50.h b/include/configs/am335x_sl50.h
index 7bb2bff5d18e..0453cb2965f0 100644
--- a/include/configs/am335x_sl50.h
+++ b/include/configs/am335x_sl50.h
@@ -78,8 +78,6 @@
 #if defined(CONFIG_EMMC_BOOT)
 #define CONFIG_SYS_MMC_ENV_DEV		1
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		0x0
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #endif
 
 /* Network. */
diff --git a/include/configs/am3517_crane.h b/include/configs/am3517_crane.h
index 5fa393d45d5d..6087a29ef4c4 100644
--- a/include/configs/am3517_crane.h
+++ b/include/configs/am3517_crane.h
@@ -182,7 +182,6 @@
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
 
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB sector */
-#define CONFIG_ENV_ADDR			0x260000
 
 /*-----------------------------------------------------------------------
  * CFI FLASH driver setup
diff --git a/include/configs/am3517_evm.h b/include/configs/am3517_evm.h
index 3e5f0b1992f3..05ee21b08c26 100644
--- a/include/configs/am3517_evm.h
+++ b/include/configs/am3517_evm.h
@@ -176,7 +176,6 @@
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
 
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_ADDR			0x260000
 
 /* Defines for SPL */
 
diff --git a/include/configs/am43xx_evm.h b/include/configs/am43xx_evm.h
index 9db006880b88..487083294cea 100644
--- a/include/configs/am43xx_evm.h
+++ b/include/configs/am43xx_evm.h
@@ -108,10 +108,6 @@
 #define DFUARGS
 #endif
 
-#ifdef CONFIG_QSPI_BOOT
-#define CONFIG_ENV_OFFSET_REDUND       0x120000
-#endif
-
 #ifndef CONFIG_SPL_BUILD
 #include <environment/ti/dfu.h>
 #include <environment/ti/mmc.h>
diff --git a/include/configs/am57xx_evm.h b/include/configs/am57xx_evm.h
index baeca5417d22..cdab9246f2c5 100644
--- a/include/configs/am57xx_evm.h
+++ b/include/configs/am57xx_evm.h
@@ -19,7 +19,6 @@
 /* MMC ENV related defines */
 #define CONFIG_SYS_MMC_ENV_DEV		1		/* eMMC */
 #define CONFIG_SYS_MMC_ENV_PART		0
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 #define CONFIG_SYS_BOOTM_LEN		SZ_64M
 
diff --git a/include/configs/am65x_evm.h b/include/configs/am65x_evm.h
index 9c06f10a2f18..06be7cc8a469 100644
--- a/include/configs/am65x_evm.h
+++ b/include/configs/am65x_evm.h
@@ -14,8 +14,6 @@
 #include <environment/ti/mmc.h>
 #include <environment/ti/k3_rproc.h>
 
-#define CONFIG_ENV_SIZE			(128 << 10)
-
 /* DDR Configuration */
 #define CONFIG_SYS_SDRAM_BASE1		0x880000000
 
@@ -118,9 +116,6 @@
 #ifdef CONFIG_ENV_IS_IN_MMC
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART	1
-#define CONFIG_ENV_SIZE		(128 << 10)
-#define CONFIG_ENV_OFFSET		0x680000
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #endif
 
 #define CONFIG_SUPPORT_EMMC_BOOT
diff --git a/include/configs/amcore.h b/include/configs/amcore.h
index 26d6fef290bc..bc1fc8c7b015 100644
--- a/include/configs/amcore.h
+++ b/include/configs/amcore.h
@@ -64,11 +64,6 @@
 #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
 #define CONFIG_SYS_BOOTPARAMS_LEN	(64 * 1024)
 
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + \
-					 CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SIZE			0x1000
-#define CONFIG_ENV_SECT_SIZE		0x1000
-
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
 	env/embedded.o(.text*);
diff --git a/include/configs/ap121.h b/include/configs/ap121.h
index 0e8c3f70d959..07ba195a126c 100644
--- a/include/configs/ap121.h
+++ b/include/configs/ap121.h
@@ -30,10 +30,6 @@
 					"mtdparts default;" \
 					"bootm 0x9f650000"
 
-#define CONFIG_ENV_OFFSET               0x40000
-#define CONFIG_ENV_SECT_SIZE            0x10000
-#define CONFIG_ENV_SIZE                 0x10000
-
 /* Miscellaneous configurable options */
 
 /*
diff --git a/include/configs/ap143.h b/include/configs/ap143.h
index fa6921022d05..d6c22d54893a 100644
--- a/include/configs/ap143.h
+++ b/include/configs/ap143.h
@@ -34,10 +34,6 @@
 					"mtdparts default;" \
 					"bootm 0x9f680000"
 
-#define CONFIG_ENV_OFFSET               0x40000
-#define CONFIG_ENV_SECT_SIZE            0x10000
-#define CONFIG_ENV_SIZE                 0x10000
-
 /* Miscellaneous configurable options */
 
 /*
diff --git a/include/configs/ap152.h b/include/configs/ap152.h
index c948a4405412..73378b95f3f4 100644
--- a/include/configs/ap152.h
+++ b/include/configs/ap152.h
@@ -35,9 +35,6 @@
 					"bootm 0x9f060000"
 
 #define CONFIG_ENV_SPI_MAX_HZ           25000000
-#define CONFIG_ENV_OFFSET               0x40000
-#define CONFIG_ENV_SECT_SIZE            0x10000
-#define CONFIG_ENV_SIZE                 0x10000
 
 /* Miscellaneous configurable options */
 
diff --git a/include/configs/apalis-imx8.h b/include/configs/apalis-imx8.h
index 3a8d2d40d776..bea035c3e23b 100644
--- a/include/configs/apalis-imx8.h
+++ b/include/configs/apalis-imx8.h
@@ -86,9 +86,6 @@
 #define CONFIG_SYS_MEMTEST_END		0x89000000
 
 /* Environment in eMMC, before config block at the end of 1st "boot sector" */
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE + \
-					 CONFIG_TDX_CFG_BLOCK_OFFSET)
 #define CONFIG_SYS_MMC_ENV_DEV		0	/* USDHC1 eMMC */
 #define CONFIG_SYS_MMC_ENV_PART		1
 
diff --git a/include/configs/apalis-tk1.h b/include/configs/apalis-tk1.h
index fe45917b885d..4127f2d6c624 100644
--- a/include/configs/apalis-tk1.h
+++ b/include/configs/apalis-tk1.h
@@ -22,8 +22,6 @@
 #define FDT_MODULE_V1_0			"apalis"
 
 /* Environment in eMMC, before config block at the end of 1st "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE + \
-					 CONFIG_TDX_CFG_BLOCK_OFFSET)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		1
 
diff --git a/include/configs/apalis_imx6.h b/include/configs/apalis_imx6.h
index a5f9a96732fd..50a4391cd47d 100644
--- a/include/configs/apalis_imx6.h
+++ b/include/configs/apalis_imx6.h
@@ -225,12 +225,9 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
 #if defined(CONFIG_ENV_IS_IN_MMC)
 /* Environment in eMMC, before config block at the end of 1st "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE + \
-					 CONFIG_TDX_CFG_BLOCK_OFFSET)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		1
 #endif
diff --git a/include/configs/apalis_t30.h b/include/configs/apalis_t30.h
index f6adfeb96a56..821162a2be8a 100644
--- a/include/configs/apalis_t30.h
+++ b/include/configs/apalis_t30.h
@@ -19,8 +19,6 @@
 #define CONFIG_MACH_TYPE		MACH_TYPE_APALIS_T30
 
 /* Environment in eMMC, before config block at the end of 1st "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE + \
-					 CONFIG_TDX_CFG_BLOCK_OFFSET)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		1
 
diff --git a/include/configs/apf27.h b/include/configs/apf27.h
index 16a257406321..351b27094a61 100644
--- a/include/configs/apf27.h
+++ b/include/configs/apf27.h
@@ -66,11 +66,7 @@
 #define	ACFG_MONITOR_OFFSET		0x00000000
 #define	CONFIG_SYS_MONITOR_LEN		0x00100000	/* 1MiB */
 #define	CONFIG_ENV_OVERWRITE
-#define	CONFIG_ENV_OFFSET		0x00100000	/* NAND offset */
-#define	CONFIG_ENV_SIZE			0x00020000	/* 128kB  */
 #define CONFIG_ENV_RANGE		0X00080000	/* 512kB */
-#define	CONFIG_ENV_OFFSET_REDUND	\
-		(CONFIG_ENV_OFFSET + CONFIG_ENV_RANGE)	/* +512kB */
 #define	CONFIG_FIRMWARE_OFFSET		0x00200000
 #define	CONFIG_FIRMWARE_SIZE		0x00080000	/* 512kB  */
 #define	CONFIG_KERNEL_OFFSET		0x00300000
diff --git a/include/configs/apx4devkit.h b/include/configs/apx4devkit.h
index 66b616c80bb1..b66069c81a81 100644
--- a/include/configs/apx4devkit.h
+++ b/include/configs/apx4devkit.h
@@ -26,19 +26,12 @@
 
 /* Environment is in MMC */
 #if defined(CONFIG_CMD_MMC) && defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET		(256 * 1024)
-#define CONFIG_ENV_SIZE			(16 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #endif
 
 /* Environment is in NAND */
 #if defined(CONFIG_CMD_NAND) && defined(CONFIG_ENV_IS_IN_NAND)
-#define CONFIG_ENV_SECT_SIZE		(128 * 1024)
-#define CONFIG_ENV_SIZE			(128 * 1024)
 #define CONFIG_ENV_RANGE		(384 * 1024)
-#define CONFIG_ENV_OFFSET		0x120000
-#define CONFIG_ENV_OFFSET_REDUND	\
-		(CONFIG_ENV_OFFSET + CONFIG_ENV_RANGE)
 #endif
 
 /* UBI and NAND partitioning */
diff --git a/include/configs/aristainetos-common.h b/include/configs/aristainetos-common.h
index 041abb5ac1f6..1d84db509834 100644
--- a/include/configs/aristainetos-common.h
+++ b/include/configs/aristainetos-common.h
@@ -146,10 +146,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(12 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(0x010000)
-#define CONFIG_ENV_OFFSET		(0x0d0000)
-#define CONFIG_ENV_OFFSET_REDUND	(0x0e0000)
 
 #define CONFIG_SYS_FSL_USDHC_NUM	2
 
diff --git a/include/configs/armadillo-800eva.h b/include/configs/armadillo-800eva.h
index dc611da035f4..e9f1eb21426b 100644
--- a/include/configs/armadillo-800eva.h
+++ b/include/configs/armadillo-800eva.h
@@ -70,11 +70,6 @@
 
 /* ENV setting */
 #define CONFIG_ENV_OVERWRITE	1
-#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + \
-				 CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_OFFSET	(CONFIG_ENV_ADDR)
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
 
 /* SH Ether */
 #define CONFIG_SH_ETHER_USE_PORT	0
diff --git a/include/configs/arndale.h b/include/configs/arndale.h
index 8aa6e1d0c326..308cd30cb3d5 100644
--- a/include/configs/arndale.h
+++ b/include/configs/arndale.h
@@ -23,8 +23,6 @@
 /* Miscellaneous configurable options */
 #define CONFIG_DEFAULT_CONSOLE		"console=ttySAC2,115200n8\0"
 
-#define CONFIG_ENV_OFFSET	(CONFIG_BL2_OFFSET + CONFIG_BL2_SIZE)
-
 #define CONFIG_IRAM_STACK	0x02050000
 
 #define CONFIG_SYS_INIT_SP_ADDR	CONFIG_IRAM_STACK
diff --git a/include/configs/aspenite.h b/include/configs/aspenite.h
index 79bf8f26e932..717ed53d839e 100644
--- a/include/configs/aspenite.h
+++ b/include/configs/aspenite.h
@@ -35,6 +35,5 @@
 /*
  * Environment variables configurations
  */
-#define CONFIG_ENV_SIZE	0x20000	/* 64k */
 
 #endif	/* __CONFIG_ASPENITE_H */
diff --git a/include/configs/astro_mcf5373l.h b/include/configs/astro_mcf5373l.h
index 2e7fbfb396ce..3d79311d625f 100644
--- a/include/configs/astro_mcf5373l.h
+++ b/include/configs/astro_mcf5373l.h
@@ -109,8 +109,6 @@
  */
 
 #ifndef CONFIG_MONITOR_IS_IN_RAM
-#define CONFIG_ENV_OFFSET		0x1FF8000
-#define CONFIG_ENV_SECT_SIZE		0x8000
 #else
 /*
  * environment in RAM - This is used to use a single PC-based application
@@ -118,8 +116,6 @@
  * to execute the commands from the environment. Feedback is done via setting
  * and reading memory locations.
  */
-#define CONFIG_ENV_ADDR		0x40060000
-#define CONFIG_ENV_SECT_SIZE	0x8000
 #endif
 
 /* here we put our FPGA configuration... */
diff --git a/include/configs/at91-sama5_common.h b/include/configs/at91-sama5_common.h
index 61312773671d..d19fd3153c37 100644
--- a/include/configs/at91-sama5_common.h
+++ b/include/configs/at91-sama5_common.h
@@ -49,7 +49,6 @@
 
 #ifdef CONFIG_NAND_BOOT
 /* u-boot env in nand flash */
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
 #define CONFIG_BOOTCOMMAND		"nand read 0x21000000 0x180000 0x80000;"	\
 					"nand read 0x22000000 0x200000 0x600000;"	\
 					"bootz 0x22000000 - 0x21000000"
diff --git a/include/configs/at91rm9200ek.h b/include/configs/at91rm9200ek.h
index 8bfba35e16a7..e52f7e440bb9 100644
--- a/include/configs/at91rm9200ek.h
+++ b/include/configs/at91rm9200ek.h
@@ -143,8 +143,6 @@
 /*
  * after u-boot.bin
  */
-#define CONFIG_ENV_ADDR			\
-		(CONFIG_SYS_FLASH_BASE + CONFIG_SYS_MONITOR_LEN)
 
 /* The following #defines are needed to get flash environment right */
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
diff --git a/include/configs/at91sam9260ek.h b/include/configs/at91sam9260ek.h
index b283c9d8737f..3156118e9637 100644
--- a/include/configs/at91sam9260ek.h
+++ b/include/configs/at91sam9260ek.h
@@ -114,18 +114,12 @@
 #ifdef CONFIG_SYS_USE_DATAFLASH_CS0
 
 /* bootstrap + u-boot + env + linux in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 #define CONFIG_BOOTCOMMAND	"sf probe 0:0; " \
 				"sf read 0x22000000 0x84000 0x294000; " \
 				"bootm 0x22000000"
 
 #elif CONFIG_SYS_USE_DATAFLASH_CS1
 
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 #define CONFIG_BOOTCOMMAND	"sf probe 0:1; " \
 				"sf read 0x22000000 0x84000 0x294000; " \
 				"bootm 0x22000000"
@@ -133,16 +127,11 @@
 #elif defined(CONFIG_SYS_USE_NANDFLASH)
 
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET		0x140000
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
-#define CONFIG_ENV_SIZE		0x20000		/* 1 sector = 128 kB */
 #define CONFIG_BOOTCOMMAND	"nand read 0x22000000 0x200000 0x300000; bootm"
 
 #else	/* CONFIG_SYS_USE_MMC */
 /* bootstrap + u-boot + env + linux in mmc */
 /* For FAT system, most cases it should be in the reserved sector */
-#define CONFIG_ENV_OFFSET		0x2000
-#define CONFIG_ENV_SIZE			0x1000
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 #define CONFIG_BOOTCOMMAND						\
diff --git a/include/configs/at91sam9261ek.h b/include/configs/at91sam9261ek.h
index 599e2627f6cc..39b879b3b1bc 100644
--- a/include/configs/at91sam9261ek.h
+++ b/include/configs/at91sam9261ek.h
@@ -101,9 +101,6 @@
 #ifdef CONFIG_SYS_USE_DATAFLASH_CS0
 
 /* bootstrap + u-boot + env + linux in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 #define CONFIG_BOOTCOMMAND	"sf probe 0; " \
 				"sf read 0x22000000 0x84000 0x294000; " \
 				"bootm 0x22000000"
@@ -111,9 +108,6 @@
 #elif CONFIG_SYS_USE_DATAFLASH_CS3
 
 /* bootstrap + u-boot + env + linux in dataflash on CS3 */
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 #define CONFIG_BOOTCOMMAND	"sf probe 0:3; " \
 				"sf read 0x22000000 0x84000 0x294000; " \
 				"bootm 0x22000000"
@@ -121,9 +115,6 @@
 #else /* CONFIG_SYS_USE_NANDFLASH */
 
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET		0x140000
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
-#define CONFIG_ENV_SIZE		0x20000		/* 1 sector = 128 kB */
 #define CONFIG_BOOTCOMMAND	"nand read 0x22000000 0x200000 0x300000; bootm"
 #endif
 
diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
index 3e7adf63f30e..c08845b3c8d3 100644
--- a/include/configs/at91sam9263ek.h
+++ b/include/configs/at91sam9263ek.h
@@ -66,11 +66,8 @@
 #define CONFIG_SYS_MONITOR_SEC	1:0-3
 #define CONFIG_SYS_MONITOR_BASE	CONFIG_SYS_FLASH_BASE
 #define CONFIG_SYS_MONITOR_LEN	(256 << 10)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + 0x007E0000)
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR - CONFIG_ENV_SIZE)
 
 /* Address and size of Primary Environment Sector */
-#define CONFIG_ENV_SIZE		0x10000
 
 #define CONFIG_EXTRA_ENV_SETTINGS	\
 	"monitor_base=" __stringify(CONFIG_SYS_MONITOR_BASE) "\0" \
@@ -217,9 +214,6 @@
 #ifdef CONFIG_SYS_USE_DATAFLASH
 
 /* bootstrap + u-boot + env + linux in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 #define CONFIG_BOOTCOMMAND	"sf probe 0; " \
 				"sf read 0x22000000 0x84000 0x294000; " \
 				"bootm 0x22000000"
@@ -227,9 +221,6 @@
 #elif CONFIG_SYS_USE_NANDFLASH
 
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET		0x140000
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
-#define CONFIG_ENV_SIZE		0x20000		/* 1 sector = 128 kB */
 #define CONFIG_BOOTCOMMAND	"nand read 0x22000000 0x200000 0x300000; bootm"
 #endif
 
diff --git a/include/configs/at91sam9m10g45ek.h b/include/configs/at91sam9m10g45ek.h
index 044c428a716a..ee207cfcca2f 100644
--- a/include/configs/at91sam9m10g45ek.h
+++ b/include/configs/at91sam9m10g45ek.h
@@ -74,16 +74,12 @@
 
 #ifdef CONFIG_NAND_BOOT
 /* bootstrap + u-boot + env in nandflash */
-#define CONFIG_ENV_OFFSET		0x140000
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
-#define CONFIG_ENV_SIZE			0x20000
 
 #define CONFIG_BOOTCOMMAND						\
 	"nand read 0x70000000 0x200000 0x300000;"			\
 	"bootm 0x70000000"
 #elif CONFIG_SD_BOOT
 /* bootstrap + u-boot + env + linux in mmc */
-#define CONFIG_ENV_SIZE		0x4000
 
 #define CONFIG_BOOTCOMMAND	"fatload mmc 0:1 0x71000000 dtb; " \
 				"fatload mmc 0:1 0x72000000 zImage; " \
diff --git a/include/configs/at91sam9n12ek.h b/include/configs/at91sam9n12ek.h
index bc79e1739ba9..caa487b038b8 100644
--- a/include/configs/at91sam9n12ek.h
+++ b/include/configs/at91sam9n12ek.h
@@ -85,9 +85,6 @@
 #ifdef CONFIG_SPI_BOOT
 
 /* bootstrap + u-boot + env + linux in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET		0x5000
-#define CONFIG_ENV_SIZE			0x3000
-#define CONFIG_ENV_SECT_SIZE		0x1000
 #define CONFIG_BOOTCOMMAND						\
 	"setenv bootargs ${console} ${mtdparts} ${bootargs_nand};"	\
 	"sf probe 0; sf read 0x22000000 0x100000 0x300000; "		\
@@ -96,9 +93,6 @@
 #elif defined(CONFIG_NAND_BOOT)
 
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET		0x140000
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
-#define CONFIG_ENV_SIZE			0x20000		/* 1 sector = 128 kB */
 #define CONFIG_BOOTCOMMAND						\
 	"setenv bootargs ${console} ${mtdparts} ${bootargs_nand};"	\
 	"nand read 0x21000000 0x180000 0x080000;"			\
@@ -111,12 +105,9 @@
 
 #ifdef CONFIG_ENV_IS_IN_MMC
 /* Use raw reserved sectors to save environment */
-#define CONFIG_ENV_OFFSET		0x2000
-#define CONFIG_ENV_SIZE			0x1000
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #else
 /* Use file in FAT file to save environment */
-#define CONFIG_ENV_SIZE			0x4000
 #endif
 
 #define CONFIG_BOOTCOMMAND						\
diff --git a/include/configs/at91sam9rlek.h b/include/configs/at91sam9rlek.h
index 1c67be56b02b..1da26049fd9a 100644
--- a/include/configs/at91sam9rlek.h
+++ b/include/configs/at91sam9rlek.h
@@ -72,9 +72,6 @@
 #ifdef CONFIG_SYS_USE_DATAFLASH
 
 /* bootstrap + u-boot + env + linux in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 #define CONFIG_BOOTCOMMAND	"sf probe 0; " \
 				"sf read 0x22000000 0x84000 0x294000; " \
 				"bootm 0x22000000"
@@ -82,9 +79,6 @@
 #elif CONFIG_SYS_USE_NANDFLASH
 
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET		0x140000
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
-#define CONFIG_ENV_SIZE		0x20000		/* 1 sector = 128 kB */
 #define CONFIG_BOOTCOMMAND	"nand read 0x22000000 0x200000 0x600000; "	\
 				"nand read 0x21000000 0x180000 0x80000; "	\
 				"bootz 0x22000000 - 0x21000000"
@@ -92,7 +86,6 @@
 #else /* CONFIG_SYS_USE_MMC */
 
 /* bootstrap + u-boot + env + linux in mmc */
-#define CONFIG_ENV_SIZE		0x4000
 #define CONFIG_BOOTCOMMAND	"fatload mmc 0:1 0x21000000 at91sam9rlek.dtb; " \
 				"fatload mmc 0:1 0x22000000 zImage; " \
 				"bootz 0x22000000 - 0x21000000"
diff --git a/include/configs/at91sam9x5ek.h b/include/configs/at91sam9x5ek.h
index f9a100ba2462..d85a4867648a 100644
--- a/include/configs/at91sam9x5ek.h
+++ b/include/configs/at91sam9x5ek.h
@@ -72,7 +72,6 @@
 
 #ifdef CONFIG_NAND_BOOT
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
 #define CONFIG_BOOTCOMMAND	"nand read " \
 				"0x22000000 0x200000 0x600000; " \
 				"nand read 0x21000000 0x180000 0x20000; " \
diff --git a/include/configs/ax25-ae350.h b/include/configs/ax25-ae350.h
index a4037f33dd25..5fd7a6043f51 100644
--- a/include/configs/ax25-ae350.h
+++ b/include/configs/ax25-ae350.h
@@ -113,7 +113,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	512
 
 /* environments */
-#define CONFIG_ENV_SECT_SIZE		0x1000
 #define CONFIG_ENV_OVERWRITE
 
 /* SPI FLASH */
@@ -130,7 +129,6 @@
 #define CONFIG_SYS_BOOTM_LEN	(64 << 20)
 
 /* When we use RAM as ENV */
-#define CONFIG_ENV_SIZE 0x2000
 
 /* Enable distro boot */
 #define BOOT_TARGET_DEVICES(func) \
diff --git a/include/configs/bav335x.h b/include/configs/bav335x.h
index 4ecf8de33344..a31b71ea98dd 100644
--- a/include/configs/bav335x.h
+++ b/include/configs/bav335x.h
@@ -360,8 +360,6 @@ DEFAULT_LINUX_BOOT_ENV \
 #define CONFIG_SYS_NAND_ONFI_DETECTION
 #define CONFIG_NAND_OMAP_ECCSCHEME	OMAP_ECC_BCH8_CODE_HW
 #define CONFIG_SYS_NAND_U_BOOT_OFFS	0x000c0000
-#define CONFIG_ENV_OFFSET		0x001c0000
-#define CONFIG_ENV_OFFSET_REDUND	0x001e0000
 #define CONFIG_SYS_ENV_SECT_SIZE	CONFIG_SYS_NAND_BLOCK_SIZE
 /* NAND: SPL related configs */
 #ifdef CONFIG_SPL_OS_BOOT
@@ -443,15 +441,9 @@ DEFAULT_LINUX_BOOT_ENV \
  */
 #if defined(CONFIG_SPI_BOOT)
 /* SPL related */
-
-#define CONFIG_ENV_SECT_SIZE		(4 << 10) /* 4 KB sectors */
-#define CONFIG_ENV_OFFSET		(768 << 10) /* 768 KiB in */
-#define CONFIG_ENV_OFFSET_REDUND	(896 << 10) /* 896 KiB in */
 #elif defined(CONFIG_EMMC_BOOT)
 #define CONFIG_SYS_MMC_ENV_DEV		1
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		0x0
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #endif
 
 /* SPI flash. */
@@ -479,11 +471,6 @@ DEFAULT_LINUX_BOOT_ENV \
 #define CONFIG_SYS_FLASH_SIZE		0x01000000
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
 /* Reduce SPL size by removing unlikey targets */
-#ifdef CONFIG_NOR_BOOT
-#define CONFIG_ENV_SECT_SIZE		(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_OFFSET		(512 << 10)	/* 512 KiB */
-#define CONFIG_ENV_OFFSET_REDUND	(768 << 10)	/* 768 KiB */
-#endif
 #endif  /* NOR support */
 
 #endif	/* ! __CONFIG_AM335X_EVM_H */
diff --git a/include/configs/bayleybay.h b/include/configs/bayleybay.h
index 288bb8e425d3..0198051bcf26 100644
--- a/include/configs/bayleybay.h
+++ b/include/configs/bayleybay.h
@@ -19,7 +19,5 @@
 					"stderr=serial,vidconsole\0"
 
 /* Environment configuration */
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x006ff000
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/bcm23550_w1d.h b/include/configs/bcm23550_w1d.h
index f59cd75d6898..e771548aa670 100644
--- a/include/configs/bcm23550_w1d.h
+++ b/include/configs/bcm23550_w1d.h
@@ -77,8 +77,6 @@
 
 /* must fit into GPT:u-boot-env partition */
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_OFFSET		(0x00011a00 * 512)
-#define CONFIG_ENV_SIZE			(8 * 512)
 
 /* console configuration */
 #define CONFIG_SYS_CBSIZE		1024	/* Console buffer size */
diff --git a/include/configs/bcm28155_ap.h b/include/configs/bcm28155_ap.h
index 111858ffb043..d807997277ae 100644
--- a/include/configs/bcm28155_ap.h
+++ b/include/configs/bcm28155_ap.h
@@ -76,8 +76,6 @@
 
 /* must fit into GPT:u-boot-env partition */
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_OFFSET		(0x00011a00 * 512)
-#define CONFIG_ENV_SIZE			(8 * 512)
 
 /* console configuration */
 #define CONFIG_SYS_CBSIZE		1024	/* Console buffer size */
diff --git a/include/configs/bcm7260.h b/include/configs/bcm7260.h
index 967bde54c866..3bd85ffe281b 100644
--- a/include/configs/bcm7260.h
+++ b/include/configs/bcm7260.h
@@ -30,7 +30,6 @@
 /*
  * Environment configuration for eMMC.
  */
-#define CONFIG_ENV_OFFSET	(0x000040a4 * 512)
 #define CONFIG_SYS_MMC_ENV_DEV	0
 #define CONFIG_SYS_MMC_ENV_PART	0
 
diff --git a/include/configs/bcm7445.h b/include/configs/bcm7445.h
index 3ff4677f0af1..ce865cb4564e 100644
--- a/include/configs/bcm7445.h
+++ b/include/configs/bcm7445.h
@@ -30,8 +30,6 @@
 /*
  * Environment configuration for SPI flash.
  */
-#define CONFIG_ENV_OFFSET	0x1e0000
-#define CONFIG_ENV_SECT_SIZE	CONFIG_ENV_SIZE
 
 #define CONFIG_SYS_MAX_FLASH_BANKS	1
 
diff --git a/include/configs/bcm_ep_board.h b/include/configs/bcm_ep_board.h
index b67100aa3aa4..273f08e5e15d 100644
--- a/include/configs/bcm_ep_board.h
+++ b/include/configs/bcm_ep_board.h
@@ -42,8 +42,6 @@
 /* Serial Info */
 #define CONFIG_SYS_NS16550_SERIAL
 
-#define CONFIG_ENV_SIZE			0x2000
-
 /* console configuration */
 #define CONFIG_SYS_CBSIZE		1024	/* Console buffer size */
 #define CONFIG_SYS_MAXARGS		64
diff --git a/include/configs/bcm_northstar2.h b/include/configs/bcm_northstar2.h
index 754bf2e0dbef..45dc7b29c9e4 100644
--- a/include/configs/bcm_northstar2.h
+++ b/include/configs/bcm_northstar2.h
@@ -33,8 +33,6 @@
 #define CONFIG_SYS_NS16550_COM4			0x66130000
 #define CONFIG_BAUDRATE				115200
 
-#define CONFIG_ENV_SIZE				SZ_8K
-
 /* console configuration */
 #define CONFIG_SYS_CBSIZE			SZ_1K
 #define CONFIG_SYS_MAXARGS			64
diff --git a/include/configs/bcmstb.h b/include/configs/bcmstb.h
index 2feabdd6c6df..ba5eb7a4a8aa 100644
--- a/include/configs/bcmstb.h
+++ b/include/configs/bcmstb.h
@@ -149,8 +149,6 @@ extern phys_addr_t prior_stage_fdt_address;
 /*
  * Environment configuration.
  */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64 KiB */
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #define CONFIG_ENV_OVERWRITE
 
 /*
diff --git a/include/configs/beaver.h b/include/configs/beaver.h
index 4c5826cd983d..1b6ba8c85d24 100644
--- a/include/configs/beaver.h
+++ b/include/configs/beaver.h
@@ -23,7 +23,6 @@
 #define CONFIG_MACH_TYPE		MACH_TYPE_BEAVER
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/bg0900.h b/include/configs/bg0900.h
index c05b06a417bb..5a17a2a1c1dc 100644
--- a/include/configs/bg0900.h
+++ b/include/configs/bg0900.h
@@ -11,7 +11,6 @@
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 
 /* Environment */
-#define CONFIG_ENV_SIZE			(16 * 1024)
 #define CONFIG_ENV_OVERWRITE
 
 /* FEC Ethernet on SoC */
diff --git a/include/configs/bk4r1.h b/include/configs/bk4r1.h
index 2575a0de3f93..0566892e157a 100644
--- a/include/configs/bk4r1.h
+++ b/include/configs/bk4r1.h
@@ -259,11 +259,4 @@
 #define CONFIG_SYS_INIT_SP_ADDR \
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
-#ifdef CONFIG_ENV_IS_IN_NAND
-#define CONFIG_ENV_SECT_SIZE	(SZ_128K)
-#define CONFIG_ENV_SIZE		(SZ_8K)
-#define CONFIG_ENV_OFFSET	0x200000
-#define CONFIG_ENV_OFFSET_REDUND	0x220000
-#endif
-
 #endif /* __CONFIG_H */
diff --git a/include/configs/blanche.h b/include/configs/blanche.h
index 7f4a204a3959..7ee38a7ef9bc 100644
--- a/include/configs/blanche.h
+++ b/include/configs/blanche.h
@@ -52,13 +52,5 @@
 #define CONFIG_SYS_CLK_FREQ	RMOBILE_XTAL_CLK
 
 /* ENV setting */
-#if !defined(CONFIG_MTD_NOR_FLASH)
-#else
-#undef  CONFIG_ENV_ADDR
-#define CONFIG_ENV_SECT_SIZE	(256 * 1024)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_OFFSET	(CONFIG_ENV_ADDR)
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
-#endif
 
 #endif	/* __BLANCHE_H */
diff --git a/include/configs/boston.h b/include/configs/boston.h
index 61aaa26989de..e5dc0c8e3286 100644
--- a/include/configs/boston.h
+++ b/include/configs/boston.h
@@ -53,14 +53,5 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
-#ifdef CONFIG_64BIT
-# define CONFIG_ENV_ADDR \
-	(0xffffffffb8000000 + (128 << 20) - CONFIG_ENV_SIZE)
-#else
-# define CONFIG_ENV_ADDR \
-	(0xb8000000 + (128 << 20) - CONFIG_ENV_SIZE)
-#endif
 
 #endif /* __CONFIGS_BOSTON_H__ */
diff --git a/include/configs/broadcom_bcm963158.h b/include/configs/broadcom_bcm963158.h
index a0f7ead4c749..f73ee2508abf 100644
--- a/include/configs/broadcom_bcm963158.h
+++ b/include/configs/broadcom_bcm963158.h
@@ -40,4 +40,3 @@
  * bcm963158
  */
 
-#define CONFIG_ENV_SIZE			(8 * 1024)
diff --git a/include/configs/broadcom_bcm968380gerg.h b/include/configs/broadcom_bcm968380gerg.h
index b0e93376fe37..a1c54cf615b1 100644
--- a/include/configs/broadcom_bcm968380gerg.h
+++ b/include/configs/broadcom_bcm968380gerg.h
@@ -6,8 +6,6 @@
 #include <configs/bmips_common.h>
 #include <configs/bmips_bcm6838.h>
 
-#define CONFIG_ENV_SIZE	SZ_8K
-
 #ifdef CONFIG_NAND
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 #define CONFIG_SYS_NAND_SELF_INIT
diff --git a/include/configs/broadcom_bcm968580xref.h b/include/configs/broadcom_bcm968580xref.h
index fdb620341dc7..95615180311e 100644
--- a/include/configs/broadcom_bcm968580xref.h
+++ b/include/configs/broadcom_bcm968580xref.h
@@ -39,4 +39,3 @@
  * 968580xref
  */
 
-#define CONFIG_ENV_SIZE			(8 * 1024)
diff --git a/include/configs/brppt1.h b/include/configs/brppt1.h
index c9c28bef0421..ccdaebdf06b2 100644
--- a/include/configs/brppt1.h
+++ b/include/configs/brppt1.h
@@ -182,17 +182,12 @@ NANDTGTS \
 #if defined(CONFIG_SPI)
 /* SPI Flash */
 /* Environment */
-#define CONFIG_ENV_OFFSET_REDUND		(CONFIG_ENV_OFFSET + \
-						 CONFIG_ENV_SECT_SIZE)
 #elif defined(CONFIG_ENV_IS_IN_MMC)
 #define CONFIG_SYS_MMC_ENV_DEV		1
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		0x40000	/* TODO: Adresse definieren */
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 #elif defined(CONFIG_ENV_IS_IN_NAND)
 /* No NAND env support in SPL */
-#define CONFIG_ENV_OFFSET		0x60000
 #define CONFIG_SYS_ENV_SECT_SIZE	CONFIG_ENV_SIZE
 #else
 #error "no storage for Environment defined!"
diff --git a/include/configs/brppt2.h b/include/configs/brppt2.h
index d36931509084..6c073ab383d2 100644
--- a/include/configs/brppt2.h
+++ b/include/configs/brppt2.h
@@ -37,9 +37,6 @@
 
 /* Environment */
 #define CONFIG_ENV_OVERWRITE
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#define CONFIG_ENV_SIZE			0x10000
-#define CONFIG_ENV_OFFSET		0x20000
 
 #define CONFIG_EXTRA_ENV_SETTINGS \
 BUR_COMMON_ENV \
diff --git a/include/configs/brsmarc1.h b/include/configs/brsmarc1.h
index 47d7a8772899..4bff349a0328 100644
--- a/include/configs/brsmarc1.h
+++ b/include/configs/brsmarc1.h
@@ -69,8 +69,6 @@ BUR_COMMON_ENV \
 /* SPI Flash */
 
 /* Environment */
-#define CONFIG_ENV_OFFSET_REDUND		(CONFIG_ENV_OFFSET + \
-						 CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_CONS_INDEX			1
 #endif	/* __CONFIG_BRSMARC1_H__ */
diff --git a/include/configs/brxre1.h b/include/configs/brxre1.h
index 30bd8cb3837b..ea15912c900e 100644
--- a/include/configs/brxre1.h
+++ b/include/configs/brxre1.h
@@ -66,8 +66,5 @@ BUR_COMMON_ENV \
 /* Environment */
 #define CONFIG_SYS_MMC_ENV_DEV		1
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_SIZE			0x10000
-#define CONFIG_ENV_OFFSET		0x40000	/* TODO: Adresse definieren */
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 #endif	/* __CONFIG_BRXRE1_H__ */
diff --git a/include/configs/bubblegum_96.h b/include/configs/bubblegum_96.h
index e1dc37b68722..c739d665f662 100644
--- a/include/configs/bubblegum_96.h
+++ b/include/configs/bubblegum_96.h
@@ -32,8 +32,6 @@
 /* UART Definitions */
 #define CONFIG_BAUDRATE			115200
 
-#define CONFIG_ENV_SIZE			0x2000
-
 /* Console configuration */
 #define CONFIG_SYS_CBSIZE		1024	/* Console buffer size */
 #define CONFIG_SYS_MAXARGS		64
diff --git a/include/configs/caddy2.h b/include/configs/caddy2.h
index 2c4f2c5b730b..63a7581d6821 100644
--- a/include/configs/caddy2.h
+++ b/include/configs/caddy2.h
@@ -199,16 +199,7 @@
  * Environment
  */
 #ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0xc0000)
-	#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-	#define CONFIG_ENV_SIZE		0x2000
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
-
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
 #endif
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
diff --git a/include/configs/cardhu.h b/include/configs/cardhu.h
index 8d541a18ee8b..7eeadfc9c3d2 100644
--- a/include/configs/cardhu.h
+++ b/include/configs/cardhu.h
@@ -27,7 +27,6 @@
 #define CONFIG_MACH_TYPE		MACH_TYPE_CARDHU
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/cei-tk1-som.h b/include/configs/cei-tk1-som.h
index e6abfe2eb3d3..dbebef34e386 100644
--- a/include/configs/cei-tk1-som.h
+++ b/include/configs/cei-tk1-som.h
@@ -23,7 +23,6 @@
 #define CONFIG_SYS_NS16550_COM1		NV_PA_APB_UARTD_BASE
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/cgtqmx6eval.h b/include/configs/cgtqmx6eval.h
index f109b22fdace..befa06faaae3 100644
--- a/include/configs/cgtqmx6eval.h
+++ b/include/configs/cgtqmx6eval.h
@@ -206,15 +206,7 @@
 
 /* Environment organization */
 #if defined (CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #endif
 
-#define CONFIG_ENV_SIZE			(8 * 1024)
-
-#if defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-#define CONFIG_ENV_OFFSET		(768 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
-#endif
-
 #endif			       /* __CONFIG_CGTQMX6EVAL_H */
diff --git a/include/configs/cherryhill.h b/include/configs/cherryhill.h
index 77ace93b96c3..6c7f9ea83bae 100644
--- a/include/configs/cherryhill.h
+++ b/include/configs/cherryhill.h
@@ -15,7 +15,5 @@
 					"stderr=vidconsole,serial\0"
 
 /* Environment configuration */
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#define CONFIG_ENV_OFFSET		0x005f0000
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/chiliboard.h b/include/configs/chiliboard.h
index 8141aece410d..ca7ce31e1a3f 100644
--- a/include/configs/chiliboard.h
+++ b/include/configs/chiliboard.h
@@ -161,11 +161,9 @@
 #endif
 
 #if defined(CONFIG_ENV_IS_IN_NAND)
-#define CONFIG_ENV_OFFSET_REDUND	0x001e0000
 #define CONFIG_SYS_ENV_SECT_SIZE	CONFIG_SYS_NAND_BLOCK_SIZE
 #else
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #endif
 
 /* Network. */
diff --git a/include/configs/chromebook_link.h b/include/configs/chromebook_link.h
index f26e463fe53b..96d5cf1a3389 100644
--- a/include/configs/chromebook_link.h
+++ b/include/configs/chromebook_link.h
@@ -15,9 +15,6 @@
 #include <configs/x86-common.h>
 #include <configs/x86-chromebook.h>
 
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x003f8000
-
 #define CONFIG_SPL_BOARD_LOAD_IMAGE
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/chromebook_samus.h b/include/configs/chromebook_samus.h
index 2f7dd69fb82d..dfeede7e91a4 100644
--- a/include/configs/chromebook_samus.h
+++ b/include/configs/chromebook_samus.h
@@ -20,9 +20,6 @@
 					"stdout=vidconsole,serial\0" \
 					"stderr=vidconsole,serial\0"
 
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x003f8000
-
 #define CONFIG_TPL_TEXT_BASE		0xfffd8000
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/ci20.h b/include/configs/ci20.h
index 21a86323c267..0f9c2ac53a34 100644
--- a/include/configs/ci20.h
+++ b/include/configs/ci20.h
@@ -42,8 +42,6 @@
 
 /* Environment */
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			(32 << 10)
-#define CONFIG_ENV_OFFSET		((14 + 512) << 10)
 #define CONFIG_ENV_OVERWRITE
 
 /* Command line configuration. */
diff --git a/include/configs/cl-som-imx7.h b/include/configs/cl-som-imx7.h
index d0a60c25f7a2..f9ffb4de8066 100644
--- a/include/configs/cl-som-imx7.h
+++ b/include/configs/cl-som-imx7.h
@@ -134,9 +134,6 @@
 /* SPI Flash support */
 
 /* FLASH and environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET		(768 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
 
 /* MMC Config*/
 #ifdef CONFIG_FSL_USDHC
diff --git a/include/configs/clearfog.h b/include/configs/clearfog.h
index 9d20a5e88c1d..633187d86fe0 100644
--- a/include/configs/clearfog.h
+++ b/include/configs/clearfog.h
@@ -33,16 +33,12 @@
 
 /* Environment in MMC */
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SECT_SIZE		0x200
-#define CONFIG_ENV_SIZE			0x10000
 /*
  * For SD - reserve 1 LBA for MBR + 1M for u-boot image. The MMC/eMMC
  * boot image starts @ LBA-0.
  * As result in MMC/eMMC case it will be a 1 sector gap between u-boot
  * image and environment
  */
-#define CONFIG_ENV_OFFSET		0xf0000
-#define CONFIG_ENV_ADDR			CONFIG_ENV_OFFSET
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 
diff --git a/include/configs/cm_fx6.h b/include/configs/cm_fx6.h
index c1a6625fcb10..eb29f07032b2 100644
--- a/include/configs/cm_fx6.h
+++ b/include/configs/cm_fx6.h
@@ -39,9 +39,6 @@
 #define CONFIG_SYS_BAUDRATE_TABLE	{9600, 19200, 38400, 57600, 115200}
 
 /* Environment */
-#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
-#define CONFIG_ENV_SIZE			(8 * 1024)
-#define CONFIG_ENV_OFFSET		(768 * 1024)
 
 #ifndef CONFIG_SPL_BUILD
 #define CONFIG_EXTRA_ENV_SETTINGS \
diff --git a/include/configs/cm_t335.h b/include/configs/cm_t335.h
index 54f2cea864b9..e0fc7fc3b125 100644
--- a/include/configs/cm_t335.h
+++ b/include/configs/cm_t335.h
@@ -116,7 +116,6 @@
 #undef CONFIG_SYS_NAND_U_BOOT_OFFS
 #define CONFIG_SYS_NAND_U_BOOT_OFFS	0x200000
 
-#define CONFIG_ENV_OFFSET		0x300000 /* environment starts here */
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
 #define CONFIG_SYS_NAND_ONFI_DETECTION
 #ifdef CONFIG_SPL_OS_BOOT
diff --git a/include/configs/cm_t35.h b/include/configs/cm_t35.h
index f9a6444d1d52..5bd9a49f4d01 100644
--- a/include/configs/cm_t35.h
+++ b/include/configs/cm_t35.h
@@ -178,8 +178,6 @@
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
 #define CONFIG_SYS_MONITOR_LEN		(256 << 10)	/* Reserve 2 sectors */
 
-#define CONFIG_ENV_ADDR			0x260000
-
 /* additions for new relocation code, must be added to all boards */
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 #define CONFIG_SYS_INIT_RAM_ADDR	0x4020f800
diff --git a/include/configs/cm_t54.h b/include/configs/cm_t54.h
index 7368fd85bb0a..50308fb28f2a 100644
--- a/include/configs/cm_t54.h
+++ b/include/configs/cm_t54.h
@@ -29,14 +29,9 @@
 #define CONFIG_SYS_NS16550_COM4		UART4_BASE
 
 /* MMC ENV related defines */
-#undef CONFIG_ENV_OFFSET
-#undef CONFIG_ENV_SIZE
 
 #define CONFIG_SYS_MMC_ENV_DEV		1		/* SLOT2: eMMC(1) */
 #define CONFIG_SYS_MMC_ENV_PART		0
-#define CONFIG_ENV_OFFSET		0xc0000		/* (in bytes) 768 KB */
-#define CONFIG_ENV_SIZE			(16 << 10)	/* 16 KB */
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 /* Enhance our eMMC support / experience. */
 #define CONFIG_HSMMC2_8BIT
diff --git a/include/configs/cobra5272.h b/include/configs/cobra5272.h
index 337c875655cc..b6c3cd88ba3e 100644
--- a/include/configs/cobra5272.h
+++ b/include/configs/cobra5272.h
@@ -92,14 +92,6 @@
  * ---
  */
 
-#ifndef CONFIG_MONITOR_IS_IN_RAM
-#define CONFIG_ENV_OFFSET		0x4000
-#define CONFIG_ENV_SECT_SIZE	0x2000
-#else
-#define CONFIG_ENV_ADDR		0xffe04000
-#define CONFIG_ENV_SECT_SIZE	0x2000
-#endif
-
 #define LDS_BOARD_TEXT \
 	. = DEFINED(env_offset) ? env_offset : .; \
 	env/embedded.o(.text);
diff --git a/include/configs/colibri-imx6ull.h b/include/configs/colibri-imx6ull.h
index de94eb95fe96..0c36a57a0e07 100644
--- a/include/configs/colibri-imx6ull.h
+++ b/include/configs/colibri-imx6ull.h
@@ -125,12 +125,6 @@
 #define CONFIG_SYS_INIT_SP_ADDR \
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
-#if defined(CONFIG_ENV_IS_IN_NAND)
-#define CONFIG_ENV_SECT_SIZE		(128 * 1024)
-#define CONFIG_ENV_OFFSET		(28 * CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
-#endif
-
 /* NAND stuff */
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 /* used to initialize CONFIG_SYS_NAND_BASE_LIST which is unused */
diff --git a/include/configs/colibri-imx8x.h b/include/configs/colibri-imx8x.h
index ab98da6da397..311ed439f61b 100644
--- a/include/configs/colibri-imx8x.h
+++ b/include/configs/colibri-imx8x.h
@@ -118,9 +118,6 @@
 #define CONFIG_SYS_MEMTEST_END		0x89000000
 
 /* Environment in eMMC, before config block at the end of 1st "boot sector" */
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE + \
-					 CONFIG_TDX_CFG_BLOCK_OFFSET)
 #define CONFIG_SYS_MMC_ENV_DEV		0	/* USDHC1 eMMC */
 #define CONFIG_SYS_MMC_ENV_PART		1
 
diff --git a/include/configs/colibri_imx6.h b/include/configs/colibri_imx6.h
index 1f2b89e72257..95b5a14b595c 100644
--- a/include/configs/colibri_imx6.h
+++ b/include/configs/colibri_imx6.h
@@ -206,12 +206,9 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
 #if defined(CONFIG_ENV_IS_IN_MMC)
 /* Environment in eMMC, before config block at the end of 1st "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE + \
-					 CONFIG_TDX_CFG_BLOCK_OFFSET)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		1
 #endif
diff --git a/include/configs/colibri_imx7.h b/include/configs/colibri_imx7.h
index c2d98291b0cd..d92db7192ee3 100644
--- a/include/configs/colibri_imx7.h
+++ b/include/configs/colibri_imx7.h
@@ -212,15 +212,8 @@
 
 #if defined(CONFIG_ENV_IS_IN_MMC)
 /* Environment in eMMC, before config block at the end of 1st "boot sector" */
-#define CONFIG_ENV_SIZE			(8 * 1024)
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE + \
-					 CONFIG_TDX_CFG_BLOCK_OFFSET)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		1
-#elif defined(CONFIG_ENV_IS_IN_NAND)
-#define CONFIG_ENV_SECT_SIZE		(128 * 1024)
-#define CONFIG_ENV_OFFSET		(28 * CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
 #endif
 
 #ifdef CONFIG_TARGET_COLIBRI_IMX7_NAND
diff --git a/include/configs/colibri_pxa270.h b/include/configs/colibri_pxa270.h
index bc3d40e667ce..111bb27126ae 100644
--- a/include/configs/colibri_pxa270.h
+++ b/include/configs/colibri_pxa270.h
@@ -116,10 +116,6 @@
 #define	CONFIG_SYS_MONITOR_LEN		0x40000
 
 /* Skip factory configuration block */
-#define	CONFIG_ENV_ADDR			\
-			(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN + 0x40000)
-#define	CONFIG_ENV_SIZE			0x40000
-#define	CONFIG_ENV_SECT_SIZE		0x40000
 
 /*
  * GPIO settings
diff --git a/include/configs/colibri_t20.h b/include/configs/colibri_t20.h
index cd7e1687812c..122294de6fc3 100644
--- a/include/configs/colibri_t20.h
+++ b/include/configs/colibri_t20.h
@@ -28,9 +28,6 @@
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 
 /* Environment in NAND, 64K is a bit excessive but erase block is 512K anyway */
-#define CONFIG_ENV_OFFSET		(SZ_2M)
-#undef CONFIG_ENV_SIZE		/* undef size from tegra20-common.h */
-#define CONFIG_ENV_SIZE			(SZ_64K)
 
 #define BOARD_EXTRA_ENV_SETTINGS \
 	"mtdparts=" CONFIG_MTDPARTS_DEFAULT "\0"
diff --git a/include/configs/colibri_t30.h b/include/configs/colibri_t30.h
index 8ff6433f45d2..5aecf14393ad 100644
--- a/include/configs/colibri_t30.h
+++ b/include/configs/colibri_t30.h
@@ -21,8 +21,6 @@
 #define CONFIG_MACH_TYPE		MACH_TYPE_COLIBRI_T30
 
 /* Environment in eMMC, before config block at the end of 1st "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE + \
-					 CONFIG_TDX_CFG_BLOCK_OFFSET)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		1
 
diff --git a/include/configs/colibri_vf.h b/include/configs/colibri_vf.h
index da9a8426ecdd..40c050a27e7a 100644
--- a/include/configs/colibri_vf.h
+++ b/include/configs/colibri_vf.h
@@ -156,9 +156,7 @@
 
 /* Environment organization */
 #ifdef CONFIG_ENV_IS_IN_NAND
-#define CONFIG_ENV_SIZE			(64 * 2048)
 #define CONFIG_ENV_RANGE		(4 * 64 * 2048)
-#define CONFIG_ENV_OFFSET		(12 * 64 * 2048)
 #endif
 
 /* USB Host Support */
diff --git a/include/configs/comtrend_ar5315u.h b/include/configs/comtrend_ar5315u.h
index 1da96c163a16..71a1af1cddce 100644
--- a/include/configs/comtrend_ar5315u.h
+++ b/include/configs/comtrend_ar5315u.h
@@ -8,4 +8,3 @@
 
 #define CONFIG_REMAKE_ELF
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/comtrend_ar5387un.h b/include/configs/comtrend_ar5387un.h
index 73e6a5dac79b..7b195749ac4c 100644
--- a/include/configs/comtrend_ar5387un.h
+++ b/include/configs/comtrend_ar5387un.h
@@ -8,4 +8,3 @@
 
 #define CONFIG_REMAKE_ELF
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/comtrend_ct5361.h b/include/configs/comtrend_ct5361.h
index 72f9ecbb06f3..2a28e6c624dc 100644
--- a/include/configs/comtrend_ct5361.h
+++ b/include/configs/comtrend_ct5361.h
@@ -8,4 +8,3 @@
 
 #define CONFIG_REMAKE_ELF
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/comtrend_vr3032u.h b/include/configs/comtrend_vr3032u.h
index cb888056bcfb..3c3c4df01533 100644
--- a/include/configs/comtrend_vr3032u.h
+++ b/include/configs/comtrend_vr3032u.h
@@ -8,8 +8,6 @@
 
 #define CONFIG_REMAKE_ELF
 
-#define CONFIG_ENV_SIZE	SZ_8K
-
 #ifdef CONFIG_NAND
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 #define CONFIG_SYS_NAND_SELF_INIT
diff --git a/include/configs/comtrend_wap5813n.h b/include/configs/comtrend_wap5813n.h
index b67f6548e682..c8cddaf126e0 100644
--- a/include/configs/comtrend_wap5813n.h
+++ b/include/configs/comtrend_wap5813n.h
@@ -8,4 +8,3 @@
 
 #define CONFIG_REMAKE_ELF
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/condor.h b/include/configs/condor.h
index c84d127f49f6..c286dbb40663 100644
--- a/include/configs/condor.h
+++ b/include/configs/condor.h
@@ -16,9 +16,6 @@
 #define CONFIG_BITBANGMII_MULTI
 
 /* Environment compatibility */
-#undef CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_SECT_SIZE	(256 * 1024)
-#define CONFIG_ENV_OFFSET	0x700000
 
 /* SH Ether */
 #define CONFIG_SH_ETHER_USE_PORT	0
diff --git a/include/configs/conga-qeval20-qa3-e3845.h b/include/configs/conga-qeval20-qa3-e3845.h
index 93dcad4b6652..01b67f7e2d8b 100644
--- a/include/configs/conga-qeval20-qa3-e3845.h
+++ b/include/configs/conga-qeval20-qa3-e3845.h
@@ -21,9 +21,6 @@
 #define VIDEO_IO_OFFSET				0
 #define CONFIG_X86EMU_RAW_IO
 
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x006ef000
-
 #undef CONFIG_BOOTCOMMAND
 #define CONFIG_BOOTCOMMAND	\
 	"load scsi 0:2 03000000 /boot/vmlinuz-${kernel-ver}-generic;"	\
diff --git a/include/configs/controlcenterd.h b/include/configs/controlcenterd.h
index 19223e29472c..d62c784e5b79 100644
--- a/include/configs/controlcenterd.h
+++ b/include/configs/controlcenterd.h
@@ -272,14 +272,8 @@
  * Environment
  */
 #if defined(CONFIG_TRAILBLAZER)
-#define CONFIG_ENV_SIZE		0x2000		/* 8KB */
-#elif defined(CONFIG_RAMBOOT_SPIFLASH)
-#define CONFIG_ENV_SIZE		0x2000		/* 8KB */
-#define CONFIG_ENV_OFFSET	0x100000	/* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
 #elif defined(CONFIG_RAMBOOT_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
-#define CONFIG_ENV_SIZE		0x2000
 #define CONFIG_SYS_MMC_ENV_DEV	0
 #endif
 
diff --git a/include/configs/controlcenterdc.h b/include/configs/controlcenterdc.h
index f6d53284d7d5..1f6d0c533c90 100644
--- a/include/configs/controlcenterdc.h
+++ b/include/configs/controlcenterdc.h
@@ -43,9 +43,6 @@
 #define CONFIG_EHCI_IS_TDI
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 
diff --git a/include/configs/corenet_ds.h b/include/configs/corenet_ds.h
index df602f696461..48746873bf17 100644
--- a/include/configs/corenet_ds.h
+++ b/include/configs/corenet_ds.h
@@ -59,26 +59,9 @@
 #define CONFIG_ENV_OVERWRITE
 
 #if defined(CONFIG_SPIFLASH)
-#define CONFIG_ENV_SIZE                 0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET               0x100000        /* 1MB */
-#define CONFIG_ENV_SECT_SIZE            0x10000
 #elif defined(CONFIG_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
 #define CONFIG_SYS_MMC_ENV_DEV          0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 1658)
-#elif defined(CONFIG_NAND)
-#define CONFIG_ENV_SIZE			CONFIG_SYS_NAND_BLOCK_SIZE
-#define CONFIG_ENV_OFFSET		(7 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#elif defined(CONFIG_SRIO_PCIE_BOOT_SLAVE)
-#define CONFIG_ENV_ADDR		0xffe20000
-#define CONFIG_ENV_SIZE		0x2000
-#elif defined(CONFIG_ENV_IS_NOWHERE)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #define CONFIG_SYS_CLK_FREQ	get_board_sys_clk() /* sysclk for MPC85xx */
diff --git a/include/configs/corvus.h b/include/configs/corvus.h
index f2df66eaa36f..e9064a200d32 100644
--- a/include/configs/corvus.h
+++ b/include/configs/corvus.h
@@ -88,7 +88,6 @@
 #define CONFIG_SYS_LOAD_ADDR	ATMEL_BASE_CS6
 
 /* bootstrap + u-boot + env in nandflash */
-#define CONFIG_ENV_OFFSET_REDUND	0x180000
 
 #define CONFIG_BOOTCOMMAND						\
 	"nand read 0x70000000 0x200000 0x300000;"			\
diff --git a/include/configs/cougarcanyon2.h b/include/configs/cougarcanyon2.h
index 8070af780a96..353756193eee 100644
--- a/include/configs/cougarcanyon2.h
+++ b/include/configs/cougarcanyon2.h
@@ -17,7 +17,5 @@
 					"stderr=serial,vga\0"
 
 /* Environment configuration */
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x5ff000
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/crownbay.h b/include/configs/crownbay.h
index 75f677fe6da2..4c118080cb5c 100644
--- a/include/configs/crownbay.h
+++ b/include/configs/crownbay.h
@@ -21,7 +21,5 @@
 					"stderr=serial,vidconsole\0"
 
 /* Environment configuration */
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/crs305-1g-4s.h b/include/configs/crs305-1g-4s.h
index a2df69adc779..617c8af83a0d 100644
--- a/include/configs/crs305-1g-4s.h
+++ b/include/configs/crs305-1g-4s.h
@@ -18,9 +18,6 @@
 #define CONFIG_EHCI_IS_TDI
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
 
 /* Keep device tree and initrd in lower memory so the kernel can access them */
 #define CONFIG_EXTRA_ENV_SETTINGS	\
diff --git a/include/configs/cyrus.h b/include/configs/cyrus.h
index d152f23e7c28..49fee9249bf9 100644
--- a/include/configs/cyrus.h
+++ b/include/configs/cyrus.h
@@ -51,8 +51,6 @@
 #if defined(CONFIG_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
 #define CONFIG_SYS_MMC_ENV_DEV          0
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(512 * 1658)
 #endif
 
 /*
diff --git a/include/configs/da850evm.h b/include/configs/da850evm.h
index 6876134a00cb..e4c8dc3e01bf 100644
--- a/include/configs/da850evm.h
+++ b/include/configs/da850evm.h
@@ -124,11 +124,6 @@
  * Flash & Environment
  */
 #ifdef CONFIG_NAND
-#ifdef CONFIG_ENV_IS_IN_NAND
-#define CONFIG_ENV_OFFSET		0x0 /* Block 0--not used by bootcode */
-#define CONFIG_ENV_SIZE			(128 << 10)
-#define CONFIG_ENV_SECT_SIZE	(128 << 10)
-#endif
 #define CONFIG_SYS_NAND_4BIT_HW_ECC_OOBFIRST
 #define	CONFIG_SYS_NAND_PAGE_2K
 #define CONFIG_SYS_NAND_CS		3
@@ -181,19 +176,10 @@
 #ifdef CONFIG_USE_NOR
 #define CONFIG_SYS_MAX_FLASH_BANKS	1 /* max number of flash banks */
 #define CONFIG_SYS_FLASH_SECT_SZ	(128 << 10) /* 128KB */
-#define CONFIG_ENV_OFFSET		(SZ_1M)
-#define CONFIG_ENV_SIZE			(10 << 10) /* 10KB */
 #define CONFIG_SYS_FLASH_BASE		DAVINCI_ASYNC_EMIF_DATA_CE2_BASE
 #define PHYS_FLASH_SIZE			(8 << 20) /* Flash size 8MB */
 #define CONFIG_SYS_MAX_FLASH_SECT ((PHYS_FLASH_SIZE/CONFIG_SYS_FLASH_SECT_SZ)\
 	       + 3)
-#define CONFIG_ENV_SECT_SIZE		CONFIG_SYS_FLASH_SECT_SZ
-#endif
-
-#if defined(CONFIG_USE_SPIFLASH) && defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-#define CONFIG_ENV_SIZE			(64 << 10)
-#define CONFIG_ENV_OFFSET		(512 << 10)
-#define CONFIG_ENV_SECT_SIZE	(64 << 10)
 #endif
 
 /*
@@ -243,7 +229,6 @@
 #if !defined(CONFIG_NAND) && \
 	!defined(CONFIG_USE_NOR) && \
 	!defined(CONFIG_USE_SPIFLASH)
-#define CONFIG_ENV_SIZE		(16 << 10)
 #endif
 
 /* USB Configs */
diff --git a/include/configs/dalmore.h b/include/configs/dalmore.h
index e8a4e3c1f4f6..0cfc197142e5 100644
--- a/include/configs/dalmore.h
+++ b/include/configs/dalmore.h
@@ -22,7 +22,6 @@
 /* Environment in eMMC, at the end of 2nd "boot sector" */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 
 /* SPI */
 #define CONFIG_SPI_FLASH_SIZE          (4 << 20)
diff --git a/include/configs/dart_6ul.h b/include/configs/dart_6ul.h
index 801011cf7799..894a8d7973fc 100644
--- a/include/configs/dart_6ul.h
+++ b/include/configs/dart_6ul.h
@@ -39,10 +39,6 @@
 #define CONFIG_SYS_MALLOC_LEN		(16 * SZ_1M)
 
 /* Environment settings */
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET		(14 * SZ_64K)
-#define CONFIG_ENV_OFFSET_REDUND	\
-	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 /* Environment in SD */
 #define CONFIG_SYS_MMC_ENV_DEV		0
diff --git a/include/configs/db-88f6281-bp.h b/include/configs/db-88f6281-bp.h
index 1b5541e49e38..749adb29075b 100644
--- a/include/configs/db-88f6281-bp.h
+++ b/include/configs/db-88f6281-bp.h
@@ -45,9 +45,6 @@
 #define CONFIG_ENV_SPI_CS		0
 #define CONFIG_ENV_SPI_MAX_HZ		20000000	/* 20Mhz */
 #define CONFIG_ENV_SPI_MODE		CONFIG_SF_DEFAULT_MODE
-#define CONFIG_ENV_SECT_SIZE		0x40000		/* 256K */
-#define CONFIG_ENV_SIZE			0x01000
-#define CONFIG_ENV_OFFSET		0xC0000
 
 /*
  * U-Boot bootcode configuration
diff --git a/include/configs/db-88f6720.h b/include/configs/db-88f6720.h
index 79b9ccfaa0bd..0735ab221576 100644
--- a/include/configs/db-88f6720.h
+++ b/include/configs/db-88f6720.h
@@ -33,9 +33,6 @@
 #define CONFIG_USB_MAX_CONTROLLER_COUNT 3
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB sectors */
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 
diff --git a/include/configs/db-88f6820-amc.h b/include/configs/db-88f6820-amc.h
index 61b91dd91f0f..f06853b74efe 100644
--- a/include/configs/db-88f6820-amc.h
+++ b/include/configs/db-88f6820-amc.h
@@ -20,9 +20,6 @@
 #define CONFIG_EHCI_IS_TDI
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 
diff --git a/include/configs/db-88f6820-gp.h b/include/configs/db-88f6820-gp.h
index 900c96267901..26c2240dbec1 100644
--- a/include/configs/db-88f6820-gp.h
+++ b/include/configs/db-88f6820-gp.h
@@ -41,9 +41,6 @@
 #define CONFIG_EHCI_IS_TDI
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 
diff --git a/include/configs/db-mv784mp-gp.h b/include/configs/db-mv784mp-gp.h
index 907bd0d032f7..3e20516e94b3 100644
--- a/include/configs/db-mv784mp-gp.h
+++ b/include/configs/db-mv784mp-gp.h
@@ -30,9 +30,6 @@
 #define CONFIG_USB_MAX_CONTROLLER_COUNT 3
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB sectors */
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 
diff --git a/include/configs/db-xc3-24g4xg.h b/include/configs/db-xc3-24g4xg.h
index 86d11e40b1de..0e9ccd9b4419 100644
--- a/include/configs/db-xc3-24g4xg.h
+++ b/include/configs/db-xc3-24g4xg.h
@@ -17,9 +17,6 @@
 #define CONFIG_EHCI_IS_TDI
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
 
 /* NAND */
 #define CONFIG_SYS_NAND_ONFI_DETECTION
diff --git a/include/configs/devkit3250.h b/include/configs/devkit3250.h
index 16031c1da6b3..911ab9aa4ed8 100644
--- a/include/configs/devkit3250.h
+++ b/include/configs/devkit3250.h
@@ -118,8 +118,6 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_SIZE			SZ_128K
-#define CONFIG_ENV_OFFSET		0x000A0000
 
 #define CONFIG_BOOTCOMMAND			\
 	"dhcp; "				\
diff --git a/include/configs/dfi-bt700.h b/include/configs/dfi-bt700.h
index a8e1850f2b38..6d0e68e5df1f 100644
--- a/include/configs/dfi-bt700.h
+++ b/include/configs/dfi-bt700.h
@@ -26,9 +26,6 @@
 #define VIDEO_IO_OFFSET				0
 #define CONFIG_X86EMU_RAW_IO
 
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x006ef000
-
 #undef CONFIG_BOOTCOMMAND
 #define CONFIG_BOOTCOMMAND	\
 	"load scsi 0:1 03000000 /boot/vmlinuz-${kernel-ver}-generic;"	\
diff --git a/include/configs/dh_imx6.h b/include/configs/dh_imx6.h
index 66a1b980eee9..d762d2cb19b5 100644
--- a/include/configs/dh_imx6.h
+++ b/include/configs/dh_imx6.h
@@ -137,13 +137,5 @@
 #define CONFIG_SYS_MEMTEST_SCRATCH	0x10800000
 
 /* Environment */
-#define CONFIG_ENV_SIZE			(16 * 1024)
-
-#if defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-#define CONFIG_ENV_OFFSET		(1024 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
-#define CONFIG_ENV_OFFSET_REDUND	\
-	(CONFIG_ENV_OFFSET + CONFIG_ENV_SECT_SIZE)
-#endif
 
 #endif	/* __DH_IMX6_CONFIG_H */
diff --git a/include/configs/display5.h b/include/configs/display5.h
index b353cffbfcc2..6600b94ac3a7 100644
--- a/include/configs/display5.h
+++ b/include/configs/display5.h
@@ -348,12 +348,7 @@
 
 /* ENV config */
 #ifdef CONFIG_ENV_IS_IN_SPI_FLASH
-#define CONFIG_ENV_SIZE		(SZ_64K)
 /* The 0x120000 value corresponds to above SPI-NOR memory MAP */
-#define CONFIG_ENV_OFFSET		(0x120000)
-#define CONFIG_ENV_SECT_SIZE		(SZ_64K)
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + \
-						CONFIG_ENV_SECT_SIZE)
 #endif
 
 #define CONFIG_MXC_USB_PORTSC           (PORT_PTS_UTMI | PORT_PTS_PTW)
diff --git a/include/configs/dns325.h b/include/configs/dns325.h
index f72ee90ab57e..41079e834549 100644
--- a/include/configs/dns325.h
+++ b/include/configs/dns325.h
@@ -60,13 +60,6 @@
 /*
  * Environment variables configurations
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE		0x20000	/* 128KB */
-#endif
-
-#define CONFIG_ENV_SIZE			0x20000	/* 128KB */
-#define CONFIG_ENV_ADDR			0xe0000
-#define CONFIG_ENV_OFFSET		0xe0000	/* env starts here */
 
 /*
  * Default environment variables
diff --git a/include/configs/dockstar.h b/include/configs/dockstar.h
index f33978829d6c..04dd0f68c370 100644
--- a/include/configs/dockstar.h
+++ b/include/configs/dockstar.h
@@ -27,16 +27,10 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE		0x20000	/* 128K */
-#endif
 /*
  * max 4k env size is enough, but in case of nand
  * it has to be rounded to sector size
  */
-#define CONFIG_ENV_SIZE			0x20000	/* 128k */
-#define CONFIG_ENV_ADDR			0x80000
-#define CONFIG_ENV_OFFSET		0x80000	/* env starts here */
 
 /*
  * Default environment variables
diff --git a/include/configs/dra7xx_evm.h b/include/configs/dra7xx_evm.h
index 0ad23ce4b943..1255999de60c 100644
--- a/include/configs/dra7xx_evm.h
+++ b/include/configs/dra7xx_evm.h
@@ -21,7 +21,6 @@
 #ifndef CONFIG_QSPI_BOOT
 /* MMC ENV related defines */
 #define CONFIG_SYS_MMC_ENV_DEV		1	/* SLOT2: eMMC(1) */
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #endif
 
 #if (CONFIG_CONS_INDEX == 1)
@@ -82,12 +81,6 @@
 #define CONFIG_SYS_SPI_KERNEL_OFFS	0x1E0000
 #define CONFIG_SYS_SPI_ARGS_OFFS	0x140000
 #define CONFIG_SYS_SPI_ARGS_SIZE	0x80000
-#if defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			(64 << 10)
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64 KB sectors */
-#define CONFIG_ENV_OFFSET		0x1C0000
-#define CONFIG_ENV_OFFSET_REDUND	0x1D0000
-#endif
 
 /* SPI SPL */
 
@@ -140,11 +133,6 @@
 #define CONFIG_SYS_FLASH_BASE		(0x08000000)
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
 /* Reduce SPL size by removing unlikey targets */
-#ifdef CONFIG_NOR_BOOT
-#define CONFIG_ENV_SECT_SIZE		(128 * 1024)	/* 128 KiB */
-#define CONFIG_ENV_OFFSET		0x001c0000
-#define CONFIG_ENV_OFFSET_REDUND	0x001e0000
-#endif
 #endif  /* NOR support */
 
 #endif /* __CONFIG_DRA7XX_EVM_H */
diff --git a/include/configs/draak.h b/include/configs/draak.h
index 9a8d6a4e79ab..78ec444af544 100644
--- a/include/configs/draak.h
+++ b/include/configs/draak.h
@@ -19,7 +19,6 @@
 #define COUNTER_FREQUENCY	0xFE502A	/* 16.66MHz from CPclk */
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/draco.h b/include/configs/draco.h
index e566ccef2a19..016532f3363b 100644
--- a/include/configs/draco.h
+++ b/include/configs/draco.h
@@ -41,7 +41,6 @@
 #define CONFIG_FACTORYSET
 
 /* Define own nand partitions */
-#define CONFIG_ENV_OFFSET_REDUND    0x2E0000
 #define CONFIG_ENV_RANGE        (4 * CONFIG_SYS_ENV_SECT_SIZE)
 
 #ifndef CONFIG_SPL_BUILD
diff --git a/include/configs/dragonboard410c.h b/include/configs/dragonboard410c.h
index bf0e0315c26d..65149ad44149 100644
--- a/include/configs/dragonboard410c.h
+++ b/include/configs/dragonboard410c.h
@@ -80,7 +80,6 @@ REFLASH(dragonboard/u-boot.img, 8)\
 	"pxefile_addr_r=0x90100000\0"\
 	BOOTENV
 
-#define CONFIG_ENV_SIZE			0x2000
 #define CONFIG_SYS_MMC_ENV_DEV		0	/* mmc0 = emmc, mmc1 = sd */
 #define CONFIG_SYS_MMC_ENV_PART 2 /* Set env partition to BOOT2 partition */
 
diff --git a/include/configs/dragonboard820c.h b/include/configs/dragonboard820c.h
index a41df22273e6..4256e6f06077 100644
--- a/include/configs/dragonboard820c.h
+++ b/include/configs/dragonboard820c.h
@@ -50,8 +50,6 @@
 	"pxefile_addr_r=0x90100000\0"\
 	BOOTENV
 
-#define CONFIG_ENV_SIZE			0x4000
-
 /* Size of malloc() pool */
 #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + SZ_8M)
 
diff --git a/include/configs/dreamplug.h b/include/configs/dreamplug.h
index f7f9141dd0e1..3e3f4c17f8b3 100644
--- a/include/configs/dreamplug.h
+++ b/include/configs/dreamplug.h
@@ -30,17 +30,11 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_SPI_FLASH
-#define CONFIG_ENV_SECT_SIZE		0x10000	/* 64k */
-#endif
 
 /*
  * max 4k env size is enough, but in case of nand
  * it has to be rounded to sector size
  */
-#define CONFIG_ENV_SIZE			0x1000  /* 4k */
-#define CONFIG_ENV_ADDR			0x100000
-#define CONFIG_ENV_OFFSET		0x100000 /* env starts here */
 
 /*
  * Default environment variables
diff --git a/include/configs/ds109.h b/include/configs/ds109.h
index 31abb4bc85f1..594cc82234bc 100644
--- a/include/configs/ds109.h
+++ b/include/configs/ds109.h
@@ -33,17 +33,11 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_SPI_FLASH
-#define CONFIG_ENV_SECT_SIZE		0x10000	/* 64k */
-#endif
 
 /*
  * max 4k env size is enough, but in case of nand
  * it has to be rounded to sector size
  */
-#define CONFIG_ENV_SIZE			0x10000
-#define CONFIG_ENV_ADDR			0x3d0000
-#define CONFIG_ENV_OFFSET		0x3d0000 /* env starts here */
 
 /*
  * Default environment variables
diff --git a/include/configs/ds414.h b/include/configs/ds414.h
index 552c7449d59c..e3693767b66d 100644
--- a/include/configs/ds414.h
+++ b/include/configs/ds414.h
@@ -29,9 +29,6 @@
 #define CONFIG_SYS_I2C_SPEED		100000
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		0x7E0000   /* RedBoot config partition in DTS */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB sectors */
 
 #define CONFIG_SYS_NETA_INTERFACE_TYPE	PHY_INTERFACE_MODE_RGMII
 
diff --git a/include/configs/durian.h b/include/configs/durian.h
index c42a98b9a094..fa48e5c02400 100644
--- a/include/configs/durian.h
+++ b/include/configs/durian.h
@@ -16,7 +16,6 @@
 #define CONFIG_SYS_LOAD_ADDR	(CONFIG_SYS_SDRAM_BASE + 0x10000000)
 
 /* Size of Malloc Pool */
-#define CONFIG_ENV_SIZE 4096
 #define CONFIG_SYS_MALLOC_LEN	(1 * 1024 * 1024  + CONFIG_ENV_SIZE)
 
 #define CONFIG_SYS_INIT_SP_ADDR		(0x88000000 - 0x100000)
diff --git a/include/configs/e2220-1170.h b/include/configs/e2220-1170.h
index c636bf945792..c4349bda4592 100644
--- a/include/configs/e2220-1170.h
+++ b/include/configs/e2220-1170.h
@@ -20,7 +20,6 @@
 /* Environment in eMMC, at the end of 2nd "boot sector" */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 
 /* SPI */
 #define CONFIG_SPI_FLASH_SIZE		(4 << 20)
diff --git a/include/configs/eagle.h b/include/configs/eagle.h
index 5f2fe42d2eb0..b567caa17485 100644
--- a/include/configs/eagle.h
+++ b/include/configs/eagle.h
@@ -16,9 +16,6 @@
 #define CONFIG_BITBANGMII_MULTI
 
 /* Environment compatibility */
-#undef CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_SECT_SIZE	(256 * 1024)
-#define CONFIG_ENV_OFFSET	0x700000
 
 /* Board Clock */
 /* XTAL_CLK : 33.33MHz */
diff --git a/include/configs/eb_cpu5282.h b/include/configs/eb_cpu5282.h
index e266e1f5428c..f8de8d3467ba 100644
--- a/include/configs/eb_cpu5282.h
+++ b/include/configs/eb_cpu5282.h
@@ -38,9 +38,6 @@
  * Environment is in the second sector of the first 256k of flash	*
  *----------------------------------------------------------------------*/
 
-#define CONFIG_ENV_ADDR		0xFF040000
-#define CONFIG_ENV_SECT_SIZE	0x00020000
-
 /*
  * BOOTP options
  */
diff --git a/include/configs/ebisu.h b/include/configs/ebisu.h
index 2e4974acb2f1..0e246629bc0b 100644
--- a/include/configs/ebisu.h
+++ b/include/configs/ebisu.h
@@ -22,7 +22,6 @@
 #define COUNTER_FREQUENCY	0xFE502A	/* 16.66MHz from CPclk */
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		2
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/edb93xx.h b/include/configs/edb93xx.h
index 6526a83141f1..d801c6605084 100644
--- a/include/configs/edb93xx.h
+++ b/include/configs/edb93xx.h
@@ -33,35 +33,27 @@
 
 #ifdef CONFIG_EDB9301
 #define CONFIG_MACH_TYPE		MACH_TYPE_EDB9301
-#define CONFIG_ENV_SECT_SIZE		0x00020000
 #elif defined(CONFIG_EDB9302)
 #define CONFIG_EP9302
 #define CONFIG_MACH_TYPE		MACH_TYPE_EDB9302
-#define CONFIG_ENV_SECT_SIZE		0x00020000
 #elif defined(CONFIG_EDB9302A)
 #define CONFIG_EP9302
 #define CONFIG_MACH_TYPE		MACH_TYPE_EDB9302A
-#define CONFIG_ENV_SECT_SIZE		0x00020000
 #elif defined(CONFIG_EDB9307)
 #define CONFIG_EP9307
 #define CONFIG_MACH_TYPE		MACH_TYPE_EDB9307
-#define CONFIG_ENV_SECT_SIZE		0x00040000
 #elif defined(CONFIG_EDB9307A)
 #define CONFIG_EP9307
 #define CONFIG_MACH_TYPE		MACH_TYPE_EDB9307A
-#define CONFIG_ENV_SECT_SIZE		0x00020000
 #elif defined(CONFIG_EDB9312)
 #define CONFIG_EP9312
 #define CONFIG_MACH_TYPE		MACH_TYPE_EDB9312
-#define CONFIG_ENV_SECT_SIZE		0x00040000
 #elif defined(CONFIG_EDB9315)
 #define CONFIG_EP9315
 #define CONFIG_MACH_TYPE		MACH_TYPE_EDB9315
-#define CONFIG_ENV_SECT_SIZE		0x00040000
 #elif defined(CONFIG_EDB9315A)
 #define CONFIG_EP9315
 #define CONFIG_MACH_TYPE		MACH_TYPE_EDB9315A
-#define CONFIG_ENV_SECT_SIZE		0x00020000
 #else
 #error "no board defined"
 #endif
@@ -179,11 +171,6 @@
 
 #define CONFIG_ENV_OVERWRITE		/* Vendor params unprotected */
 
-#define CONFIG_ENV_ADDR			0x60040000
-#define CONFIG_ENV_ADDR_REDUND		(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
-
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
-
 #define CONFIG_USB_OHCI_NEW
 #define CONFIG_USB_OHCI_EP93XX
 #define CONFIG_SYS_USB_OHCI_CPU_INIT
diff --git a/include/configs/edison.h b/include/configs/edison.h
index 218b50a1d9bb..3e174e9aa535 100644
--- a/include/configs/edison.h
+++ b/include/configs/edison.h
@@ -31,9 +31,6 @@
 /* Environment */
 #define CONFIG_SYS_MMC_ENV_DEV			0
 #define CONFIG_SYS_MMC_ENV_PART			0
-#define CONFIG_ENV_SIZE				(64 * 1024)
-#define CONFIG_ENV_OFFSET			(3 * 1024 * 1024)
-#define CONFIG_ENV_OFFSET_REDUND		(6 * 1024 * 1024)
 
 /* RTC */
 #define CONFIG_SYS_ISA_IO_BASE_ADDRESS	0
diff --git a/include/configs/edminiv2.h b/include/configs/edminiv2.h
index f07171894462..60dfee81b71b 100644
--- a/include/configs/edminiv2.h
+++ b/include/configs/edminiv2.h
@@ -171,9 +171,6 @@
 /*
  *  Environment variables configurations
  */
-#define CONFIG_ENV_SECT_SIZE		0x2000	/* 16K */
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		0x4000	/* env starts here */
 
 /*
  * Size of malloc() pool
diff --git a/include/configs/el6x_common.h b/include/configs/el6x_common.h
index fe28154dc19d..95c04c379706 100644
--- a/include/configs/el6x_common.h
+++ b/include/configs/el6x_common.h
@@ -92,12 +92,9 @@
 
 /* environment organization */
 
-#define CONFIG_ENV_SIZE			(8 * 1024)
-
 #if defined(CONFIG_ENV_IS_IN_MMC)
 #define CONFIG_SYS_MMC_ENV_DEV		1
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		0x0
 #endif
 
 #endif                         /* __EL6Q_COMMON_CONFIG_H */
diff --git a/include/configs/embestmx6boards.h b/include/configs/embestmx6boards.h
index 8bc7a3ad2e13..481066b71e96 100644
--- a/include/configs/embestmx6boards.h
+++ b/include/configs/embestmx6boards.h
@@ -68,20 +68,16 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
 #if defined(CONFIG_ENV_IS_IN_MMC)
 /* RiOTboard */
 #define CONFIG_FDTFILE	"imx6dl-riotboard.dtb"
 #define CONFIG_SYS_FSL_USDHC_NUM	3
 #define CONFIG_SYS_MMC_ENV_DEV		2	/* SDHC4 */
-#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 #elif defined(CONFIG_ENV_IS_IN_SPI_FLASH)
 /* MarSBoard */
 #define CONFIG_FDTFILE	"imx6q-marsboard.dtb"
 #define CONFIG_SYS_FSL_USDHC_NUM	2
-#define CONFIG_ENV_OFFSET		(768 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(8 * 1024)
 #endif
 
 /* Framebuffer */
diff --git a/include/configs/etamin.h b/include/configs/etamin.h
index 8e09f73a887f..4ce8f93103c2 100644
--- a/include/configs/etamin.h
+++ b/include/configs/etamin.h
@@ -20,11 +20,9 @@
 #undef CONFIG_SYS_NAND_ECCPOS
 #undef CONFIG_SYS_NAND_U_BOOT_OFFS
 #undef CONFIG_SYS_ENV_SECT_SIZE
-#undef CONFIG_ENV_OFFSET
 #undef CONFIG_NAND_OMAP_ECCSCHEME
 #define CONFIG_NAND_OMAP_ECCSCHEME	OMAP_ECC_BCH16_CODE_HW
 
-#define CONFIG_ENV_OFFSET       0x980000
 #define CONFIG_SYS_ENV_SECT_SIZE       (512 << 10)     /* 512 KiB */
 #define CONFIG_SYS_NAND_PAGE_SIZE       4096
 #define CONFIG_SYS_NAND_OOBSIZE         224
@@ -111,7 +109,6 @@
 #endif
 
 /* Define own nand partitions */
-#define CONFIG_ENV_OFFSET_REDUND	0xB80000
 #define CONFIG_ENV_RANGE		(4 * CONFIG_SYS_ENV_SECT_SIZE)
 
 
diff --git a/include/configs/ethernut5.h b/include/configs/ethernut5.h
index c9e7c8c0e2b6..39a4a066ad04 100644
--- a/include/configs/ethernut5.h
+++ b/include/configs/ethernut5.h
@@ -50,7 +50,6 @@
 
 
 /* bootstrap + u-boot + env + linux in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET	0x3DE000
 
 /* NAND flash */
 #ifdef CONFIG_CMD_NAND
diff --git a/include/configs/evb_ast2500.h b/include/configs/evb_ast2500.h
index e4b07e3bd686..7a0ea753be03 100644
--- a/include/configs/evb_ast2500.h
+++ b/include/configs/evb_ast2500.h
@@ -19,6 +19,4 @@
 /* Memory Info */
 #define CONFIG_SYS_LOAD_ADDR		0x83000000
 
-#define CONFIG_ENV_SIZE			0x20000
-
 #endif	/* __CONFIG_H */
diff --git a/include/configs/exynos5-common.h b/include/configs/exynos5-common.h
index e0a4d76d5380..5911a8a63992 100644
--- a/include/configs/exynos5-common.h
+++ b/include/configs/exynos5-common.h
@@ -89,7 +89,6 @@
 #define CONFIG_RES_BLOCK_SIZE	(512)
 #define CONFIG_BL1_SIZE	(16 << 10) /*16 K reserved for BL1*/
 #define CONFIG_BL2_SIZE	(512UL << 10UL) /* 512 KB */
-#define CONFIG_ENV_SIZE	(16 << 10) /* 16 KB */
 
 #define CONFIG_BL1_OFFSET	(CONFIG_RES_BLOCK_SIZE + CONFIG_SEC_FW_SIZE)
 #define CONFIG_BL2_OFFSET	(CONFIG_BL1_OFFSET + CONFIG_BL1_SIZE)
@@ -108,10 +107,6 @@
 
 /* SPI */
 
-#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
-#define CONFIG_ENV_SECT_SIZE	CONFIG_ENV_SIZE
-#endif
-
 /* Ethernet Controllor Driver */
 #ifdef CONFIG_CMD_NET
 #define CONFIG_ENV_SROM_BANK		1
diff --git a/include/configs/exynos5-dt-common.h b/include/configs/exynos5-dt-common.h
index a87182ae8481..cc9ffda669ee 100644
--- a/include/configs/exynos5-dt-common.h
+++ b/include/configs/exynos5-dt-common.h
@@ -19,7 +19,6 @@
 
 #define CONFIG_SYS_SPI_BASE	0x12D30000
 #define FLASH_SIZE		(4 << 20)
-#define CONFIG_ENV_OFFSET	(FLASH_SIZE - CONFIG_ENV_SECT_SIZE)
 #define CONFIG_SPI_BOOTING
 
 #define CONFIG_BOARD_COMMON
diff --git a/include/configs/exynos7420-common.h b/include/configs/exynos7420-common.h
index 157260ca03b8..6c0aa9bcd4a6 100644
--- a/include/configs/exynos7420-common.h
+++ b/include/configs/exynos7420-common.h
@@ -62,7 +62,6 @@
 #define PHYS_SDRAM_8_SIZE	SDRAM_BANK_SIZE
 
 /* Configuration of ENV Blocks */
-#define CONFIG_ENV_SIZE	(16 << 10) /* 16 KB */
 
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 1) \
diff --git a/include/configs/flea3.h b/include/configs/flea3.h
index 4b8b2dc4ad65..fded5a11dac7 100644
--- a/include/configs/flea3.h
+++ b/include/configs/flea3.h
@@ -112,14 +112,7 @@
 #define CONFIG_SYS_MONITOR_BASE	CONFIG_SYS_FLASH_BASE
 #define CONFIG_SYS_MONITOR_LEN		(512 * 1024)
 
-#define CONFIG_ENV_SECT_SIZE	(64 * 1024)
-#define CONFIG_ENV_SIZE		CONFIG_ENV_SECT_SIZE
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
-
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-				CONFIG_SYS_MONITOR_LEN)
 
 /*
  * CFI FLASH driver setup
diff --git a/include/configs/galileo.h b/include/configs/galileo.h
index 507d08cb1107..57483a2af960 100644
--- a/include/configs/galileo.h
+++ b/include/configs/galileo.h
@@ -26,7 +26,5 @@
 #define CONFIG_DW_ALTDESCRIPTOR
 
 /* Environment configuration */
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0
 
 #endif	/* __CONFIG_H */
diff --git a/include/configs/gardena-smart-gateway-mt7688.h b/include/configs/gardena-smart-gateway-mt7688.h
index cfa7d1c674a0..59c60743d24c 100644
--- a/include/configs/gardena-smart-gateway-mt7688.h
+++ b/include/configs/gardena-smart-gateway-mt7688.h
@@ -38,11 +38,6 @@
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_TEXT_BASE
 
 /* Environment settings */
-#define CONFIG_ENV_OFFSET		0xa0000
-#define CONFIG_ENV_SIZE			(64 << 10)
-#define CONFIG_ENV_SECT_SIZE		(64 << 10)
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + \
-						CONFIG_ENV_SECT_SIZE)
 
 /*
  * Environment is right behind U-Boot in flash. Make sure U-Boot
diff --git a/include/configs/gazerbeam.h b/include/configs/gazerbeam.h
index 8c01097245ed..6a7a93144bf2 100644
--- a/include/configs/gazerbeam.h
+++ b/include/configs/gazerbeam.h
@@ -55,11 +55,6 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-				 CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x10000 /* 64K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	/* allow baudrate change */
diff --git a/include/configs/ge_bx50v3.h b/include/configs/ge_bx50v3.h
index 6de5119d7fbe..73cdc5b489fb 100644
--- a/include/configs/ge_bx50v3.h
+++ b/include/configs/ge_bx50v3.h
@@ -184,9 +184,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_SIZE		(8 * 1024)
-#define CONFIG_ENV_OFFSET		(768 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
 
 #define CONFIG_SYS_FSL_USDHC_NUM	3
 
diff --git a/include/configs/goflexhome.h b/include/configs/goflexhome.h
index 1d69a4e51802..afd48d5ad046 100644
--- a/include/configs/goflexhome.h
+++ b/include/configs/goflexhome.h
@@ -50,16 +50,10 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE		0x20000	/* 128K */
-#endif
 /*
  * max 4k env size is enough, but in case of nand
  * it has to be rounded to sector size
  */
-#define CONFIG_ENV_SIZE			0x20000	/* 128k */
-#define CONFIG_ENV_ADDR			0xC0000
-#define CONFIG_ENV_OFFSET		0xC0000	/* env starts here */
 
 /*
  * Default environment variables
diff --git a/include/configs/gplugd.h b/include/configs/gplugd.h
index 7da8739a1960..2f66af344725 100644
--- a/include/configs/gplugd.h
+++ b/include/configs/gplugd.h
@@ -70,7 +70,6 @@
 /*
  * Environment variables configurations
  */
-#define CONFIG_ENV_SIZE			0x4000
 
 #ifdef CONFIG_CMD_USB
 #define CONFIG_USB_EHCI_ARMADA100
diff --git a/include/configs/grpeach.h b/include/configs/grpeach.h
index 26ca6943b12a..b875f9b132ef 100644
--- a/include/configs/grpeach.h
+++ b/include/configs/grpeach.h
@@ -28,9 +28,6 @@
 	(CONFIG_SYS_SDRAM_BASE + 4 * 1024 * 1024)
 
 #define CONFIG_ENV_OVERWRITE		1
-#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
-#define CONFIG_ENV_SIZE			(CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_OFFSET		0x80000
 
 /* Malloc */
 #define CONFIG_SYS_MALLOC_LEN		(1024 * 1024)
diff --git a/include/configs/guruplug.h b/include/configs/guruplug.h
index 739ab320f637..768f4ebcbb8d 100644
--- a/include/configs/guruplug.h
+++ b/include/configs/guruplug.h
@@ -28,15 +28,10 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE		0x20000	/* 128K */
-#endif
 /*
  * max 4k env size is enough, but in case of nand
  * it has to be rounded to sector size
  */
-#define CONFIG_ENV_SIZE			0x20000	/* 128k */
-#define CONFIG_ENV_OFFSET		0xE0000	/* env starts here */
 /*
  * Environment is right behind U-Boot in flash. Make sure U-Boot
  * doesn't grow into the environment area.
diff --git a/include/configs/gw_ventana.h b/include/configs/gw_ventana.h
index 8b0f4d4d9019..894f8b11142b 100644
--- a/include/configs/gw_ventana.h
+++ b/include/configs/gw_ventana.h
@@ -155,18 +155,6 @@
 #if defined(CONFIG_ENV_IS_IN_MMC)
   #define CONFIG_SYS_MMC_ENV_DEV         0
   #define CONFIG_SYS_MMC_ENV_PART        1
-  #define CONFIG_ENV_OFFSET              (709 * SZ_1K)
-  #define CONFIG_ENV_SIZE                (128 * SZ_1K)
-  #define CONFIG_ENV_OFFSET_REDUND       (CONFIG_ENV_OFFSET + (128 * SZ_1K))
-#elif defined(CONFIG_ENV_IS_IN_NAND)
-  #define CONFIG_ENV_OFFSET              (16 * SZ_1M)
-  #define CONFIG_ENV_SECT_SIZE           (128 * SZ_1K)
-  #define CONFIG_ENV_SIZE                CONFIG_ENV_SECT_SIZE
-  #define CONFIG_ENV_OFFSET_REDUND       (CONFIG_ENV_OFFSET + (512 * SZ_1K))
-#elif defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-  #define CONFIG_ENV_OFFSET		(512 * SZ_1K)
-  #define CONFIG_ENV_SECT_SIZE		(64 * SZ_1K)
-  #define CONFIG_ENV_SIZE		(8 * SZ_1K)
 #endif
 
 /* Environment */
diff --git a/include/configs/harmony.h b/include/configs/harmony.h
index f873cea26533..b2464f90dea2 100644
--- a/include/configs/harmony.h
+++ b/include/configs/harmony.h
@@ -30,7 +30,6 @@
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 
 /* Environment in NAND (which is 512M), aligned to start of last sector */
-#define CONFIG_ENV_OFFSET	(SZ_512M - SZ_128K) /* 128K sector size */
 
 #include "tegra-common-post.h"
 
diff --git a/include/configs/helios4.h b/include/configs/helios4.h
index 4df32002e094..5a4c9ae066eb 100644
--- a/include/configs/helios4.h
+++ b/include/configs/helios4.h
@@ -44,19 +44,12 @@
 
 #ifdef CONFIG_MVEBU_SPL_BOOT_DEVICE_SPI
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_SECT_SIZE		SZ_64K
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_OFFSET		SZ_1M
 #endif
 
 #ifdef CONFIG_MVEBU_SPL_BOOT_DEVICE_MMC
 /* Environment in MMC */
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SECT_SIZE		0x200
-#define CONFIG_ENV_SIZE			0x2000
 /* stay within first 1M */
-#define CONFIG_ENV_OFFSET		(SZ_1M - CONFIG_ENV_SIZE)
-#define CONFIG_ENV_ADDR			CONFIG_ENV_OFFSET
 #endif
 
 #define CONFIG_PHY_MARVELL		/* there is a marvell phy */
diff --git a/include/configs/highbank.h b/include/configs/highbank.h
index c0e295b6b745..8d16e18d8b6e 100644
--- a/include/configs/highbank.h
+++ b/include/configs/highbank.h
@@ -58,8 +58,6 @@
 */
 #define CONFIG_SYS_NVRAM_BASE_ADDR	0xfff88000	/* NVRAM base address */
 #define CONFIG_SYS_NVRAM_SIZE		0x8000		/* NVRAM size */
-#define CONFIG_ENV_SIZE			0x2000		/* Size of Environ */
-#define CONFIG_ENV_ADDR			CONFIG_SYS_NVRAM_BASE_ADDR
 
 #define CONFIG_SYS_SDRAM_BASE		0x00000000
 #define CONFIG_SYS_INIT_SP_ADDR		0x01000000
diff --git a/include/configs/hikey.h b/include/configs/hikey.h
index 60c6bde16ea9..2732c019c426 100644
--- a/include/configs/hikey.h
+++ b/include/configs/hikey.h
@@ -82,7 +82,6 @@
 				BOOTENV
 
 /* Preserve environment on eMMC */
-#define CONFIG_ENV_SIZE			0x1000
 #define CONFIG_SYS_MMC_ENV_DEV		0	/* Use eMMC */
 #define CONFIG_SYS_MMC_ENV_PART		2	/* Use Boot1 partition */
 
diff --git a/include/configs/hikey960.h b/include/configs/hikey960.h
index f6f9c8d85a2d..04d458798a17 100644
--- a/include/configs/hikey960.h
+++ b/include/configs/hikey960.h
@@ -36,8 +36,6 @@
 /* Size of malloc() pool */
 #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + SZ_8M)
 
-#define CONFIG_ENV_SIZE			0x1000
-
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 0)
 #include <config_distro_bootcmd.h>
@@ -52,8 +50,6 @@
 				"initrd_high=0xffffffffffffffff\0" \
 				BOOTENV
 
-#define CONFIG_ENV_SIZE			0x1000
-
 /* TODO: Remove this once the SD clock is fixed */
 #define CONFIG_SYS_MMC_MAX_BLK_COUNT	1024
 
diff --git a/include/configs/hrcon.h b/include/configs/hrcon.h
index cd59b840e9f9..43c31e6a2c2a 100644
--- a/include/configs/hrcon.h
+++ b/include/configs/hrcon.h
@@ -351,15 +351,6 @@ void fpga_control_clear(unsigned int bus, int pin);
 /*
  * Environment
  */
-#if 1
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-				 CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x10000 /* 64K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
-#else
-#define CONFIG_ENV_SIZE		0x2000		/* 8KB */
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/huawei_hg556a.h b/include/configs/huawei_hg556a.h
index 2aa5c6664325..529fc9495ef4 100644
--- a/include/configs/huawei_hg556a.h
+++ b/include/configs/huawei_hg556a.h
@@ -8,4 +8,3 @@
 
 #define CONFIG_REMAKE_ELF
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/ib62x0.h b/include/configs/ib62x0.h
index 5e54441c73d1..71738bfb7d8e 100644
--- a/include/configs/ib62x0.h
+++ b/include/configs/ib62x0.h
@@ -33,11 +33,6 @@
 /*
  * Environment variables configuration
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE	0x20000
-#endif
-#define CONFIG_ENV_SIZE		0x20000
-#define CONFIG_ENV_OFFSET	0xe0000
 
 /*
  * Default environment variables
diff --git a/include/configs/iconnect.h b/include/configs/iconnect.h
index 87113d7805c1..a694b2e92be9 100644
--- a/include/configs/iconnect.h
+++ b/include/configs/iconnect.h
@@ -38,11 +38,6 @@
 /*
  * Environment variables configuration
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE	0x20000
-#endif
-#define CONFIG_ENV_SIZE		0x20000
-#define CONFIG_ENV_OFFSET	0x80000
 
 /*
  * Default environment variables
diff --git a/include/configs/ids8313.h b/include/configs/ids8313.h
index 71063653fadc..d37a5b7a4f50 100644
--- a/include/configs/ids8313.h
+++ b/include/configs/ids8313.h
@@ -223,10 +223,6 @@
 /*
  * Environment Configuration
  */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE \
-				+ CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SIZE		0x20000
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SIZE)
 
 #define CONFIG_NETDEV			eth1
 #define CONFIG_HOSTNAME		"ids8313"
diff --git a/include/configs/imgtec_xilfpga.h b/include/configs/imgtec_xilfpga.h
index 8e2d72323d62..fcf1b7f990e1 100644
--- a/include/configs/imgtec_xilfpga.h
+++ b/include/configs/imgtec_xilfpga.h
@@ -45,7 +45,6 @@
 /* -------------------------------------------------
  * Environment
  */
-#define CONFIG_ENV_SIZE		0x4000
 
 /* ---------------------------------------------------------------------
  * Board boot configuration
diff --git a/include/configs/imx27lite-common.h b/include/configs/imx27lite-common.h
index a2d0ade0151f..82ac4242bbf3 100644
--- a/include/configs/imx27lite-common.h
+++ b/include/configs/imx27lite-common.h
@@ -95,9 +95,7 @@
 		CONFIG_SYS_FLASH_SECT_SZ)
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
 #define CONFIG_SYS_MONITOR_LEN		0x40000		/* Reserve 256KiB */
-#define CONFIG_ENV_SIZE		CONFIG_ENV_SECT_SIZE
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 /*
  * Ethernet
diff --git a/include/configs/imx6-engicam.h b/include/configs/imx6-engicam.h
index 0826195f4838..46529a61da3c 100644
--- a/include/configs/imx6-engicam.h
+++ b/include/configs/imx6-engicam.h
@@ -16,7 +16,6 @@
 #define CONFIG_SYS_MALLOC_LEN		(16 * SZ_1M)
 
 /* Total Size of Environment Sector */
-#define CONFIG_ENV_SIZE			SZ_128K
 
 /* Allow to overwrite serial and ethaddr */
 #define CONFIG_ENV_OVERWRITE
@@ -25,11 +24,7 @@
 #ifndef CONFIG_ENV_IS_NOWHERE
 /* Environment in MMC */
 # if defined(CONFIG_ENV_IS_IN_MMC)
-#  define CONFIG_ENV_OFFSET		0x100000
 /* Environment in NAND */
-# elif defined(CONFIG_ENV_IS_IN_NAND)
-#  define CONFIG_ENV_OFFSET		0x400000
-#  define CONFIG_ENV_SECT_SIZE		CONFIG_ENV_SIZE
 # endif
 #endif
 
diff --git a/include/configs/imx6_logic.h b/include/configs/imx6_logic.h
index d6b7477ee912..2274db0e2295 100644
--- a/include/configs/imx6_logic.h
+++ b/include/configs/imx6_logic.h
@@ -132,9 +132,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE               (1024 * 1024)
-#define CONFIG_ENV_OFFSET             0x400000
-#define CONFIG_ENV_SECT_SIZE          CONFIG_ENV_SIZE
 
 /* NAND stuff */
 #define CONFIG_SYS_MAX_NAND_DEVICE     1
diff --git a/include/configs/imx6dl-mamoj.h b/include/configs/imx6dl-mamoj.h
index 7605e145c2f3..b6e336a33d99 100644
--- a/include/configs/imx6dl-mamoj.h
+++ b/include/configs/imx6dl-mamoj.h
@@ -17,7 +17,6 @@
 #define CONFIG_SYS_MALLOC_LEN		(35 * SZ_1M)
 
 /* Total Size of Environment Sector */
-#define CONFIG_ENV_SIZE			SZ_128K
 
 /* Allow to overwrite serial and ethaddr */
 #define CONFIG_ENV_OVERWRITE
@@ -25,9 +24,6 @@
 /* Environment */
 #ifndef CONFIG_ENV_IS_NOWHERE
 /* Environment in MMC */
-# if defined(CONFIG_ENV_IS_IN_MMC)
-#  define CONFIG_ENV_OFFSET		0x100000
-# endif
 #endif
 
 #ifndef CONFIG_SPL_BUILD
diff --git a/include/configs/imx8mm_evk.h b/include/configs/imx8mm_evk.h
index e0c5f5a62651..acbab05ae93a 100644
--- a/include/configs/imx8mm_evk.h
+++ b/include/configs/imx8mm_evk.h
@@ -113,10 +113,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 #define CONFIG_ENV_OVERWRITE
-#if defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET               (64 * SZ_64K)
-#endif
-#define CONFIG_ENV_SIZE			SZ_4K
 #define CONFIG_SYS_MMC_ENV_DEV		0   /* USDHC2 */
 #define CONFIG_MMCROOT			"/dev/mmcblk1p2"  /* USDHC2 */
 
diff --git a/include/configs/imx8mn_evk.h b/include/configs/imx8mn_evk.h
index 8d4a88b332e2..62037c7387af 100644
--- a/include/configs/imx8mn_evk.h
+++ b/include/configs/imx8mn_evk.h
@@ -116,10 +116,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 #define CONFIG_ENV_OVERWRITE
-#if defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET               (64 * SZ_64K)
-#endif
-#define CONFIG_ENV_SIZE			SZ_4K
 #define CONFIG_SYS_MMC_ENV_DEV		0   /* USDHC2 */
 #define CONFIG_MMCROOT			"/dev/mmcblk1p2"  /* USDHC2 */
 
diff --git a/include/configs/imx8mq_evk.h b/include/configs/imx8mq_evk.h
index 84fae3477702..b29989db8f92 100644
--- a/include/configs/imx8mq_evk.h
+++ b/include/configs/imx8mq_evk.h
@@ -177,8 +177,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 #define CONFIG_ENV_OVERWRITE
-#define CONFIG_ENV_OFFSET               (64 * SZ_64K)
-#define CONFIG_ENV_SIZE			0x1000
 #define CONFIG_SYS_MMC_ENV_DEV		1   /* USDHC2 */
 #define CONFIG_MMCROOT			"/dev/mmcblk1p2"  /* USDHC2 */
 
diff --git a/include/configs/imx8qm_mek.h b/include/configs/imx8qm_mek.h
index 37ef595e4ead..97170dc94949 100644
--- a/include/configs/imx8qm_mek.h
+++ b/include/configs/imx8qm_mek.h
@@ -162,8 +162,6 @@
 #define CONFIG_SYS_INIT_SP_ADDR         0x80200000
 
 /* Default environment is in SD */
-#define CONFIG_ENV_SIZE			0x1000
-#define CONFIG_ENV_OFFSET		(64 * SZ_64K)
 #define CONFIG_SYS_MMC_ENV_PART		0	/* user area */
 
 #define CONFIG_SYS_MMC_IMG_LOAD_PART	1
diff --git a/include/configs/imx8qm_rom7720.h b/include/configs/imx8qm_rom7720.h
index fb31dc4627f7..865863eb7cb0 100644
--- a/include/configs/imx8qm_rom7720.h
+++ b/include/configs/imx8qm_rom7720.h
@@ -130,17 +130,13 @@
 #define CONFIG_SYS_INIT_SP_ADDR		0x80200000
 
 /* Default environment is in SD */
-#define CONFIG_ENV_SIZE			0x2000
 
 #ifdef CONFIG_QSPI_BOOT
-#define CONFIG_ENV_OFFSET	(4 * 1024 * 1024)
-#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
 #define CONFIG_ENV_SPI_BUS	CONFIG_SF_DEFAULT_BUS
 #define CONFIG_ENV_SPI_CS	CONFIG_SF_DEFAULT_CS
 #define CONFIG_ENV_SPI_MODE	CONFIG_SF_DEFAULT_MODE
 #define CONFIG_ENV_SPI_MAX_HZ	CONFIG_SF_DEFAULT_SPEED
 #else
-#define CONFIG_ENV_OFFSET	(64 * SZ_64K)
 #define CONFIG_SYS_MMC_ENV_PART		0	/* user area */
 #endif
 
diff --git a/include/configs/imx8qxp_mek.h b/include/configs/imx8qxp_mek.h
index 59f88bd2033b..cb39bcdebf5d 100644
--- a/include/configs/imx8qxp_mek.h
+++ b/include/configs/imx8qxp_mek.h
@@ -161,8 +161,6 @@
 #define CONFIG_SYS_INIT_SP_ADDR         0x80200000
 
 /* Default environment is in SD */
-#define CONFIG_ENV_SIZE			0x1000
-#define CONFIG_ENV_OFFSET		(64 * SZ_64K)
 #define CONFIG_SYS_MMC_ENV_PART		0	/* user area */
 
 #define CONFIG_SYS_MMC_IMG_LOAD_PART	1
diff --git a/include/configs/integratorap.h b/include/configs/integratorap.h
index 4a9c60d758a9..f15e08f39763 100644
--- a/include/configs/integratorap.h
+++ b/include/configs/integratorap.h
@@ -32,7 +32,6 @@
 /* Flash settings */
 #define CONFIG_SYS_FLASH_SIZE		0x02000000 /* 32 MiB */
 #define CONFIG_SYS_MAX_FLASH_SECT	128
-#define CONFIG_ENV_SIZE			32768
 
 /*-----------------------------------------------------------------------
  * PCI definitions
diff --git a/include/configs/integratorcp.h b/include/configs/integratorcp.h
index 56931b78a621..d8a474db2e5b 100644
--- a/include/configs/integratorcp.h
+++ b/include/configs/integratorcp.h
@@ -52,22 +52,16 @@
  */
 #if ( PHYS_FLASH_SIZE == 0x04000000 )
 
-#define CONFIG_ENV_ADDR		0x27F00000
 #define CONFIG_SYS_MONITOR_BASE	0x27F40000
 
 #elif (PHYS_FLASH_SIZE == 0x02000000 )
 
-#define CONFIG_ENV_ADDR		0x25F00000
 #define CONFIG_SYS_MONITOR_BASE	0x25F40000
 
 #else
 
-#define CONFIG_ENV_ADDR		0x24F00000
 #define CONFIG_SYS_MONITOR_BASE	0x27F40000
 
 #endif
 
-#define CONFIG_ENV_SECT_SIZE	0x40000		/* 256KB */
-#define CONFIG_ENV_SIZE		8192		/* 8KB */
-
 #endif /* __CONFIG_H */
diff --git a/include/configs/j721e_evm.h b/include/configs/j721e_evm.h
index 639d87a4e578..84518786c747 100644
--- a/include/configs/j721e_evm.h
+++ b/include/configs/j721e_evm.h
@@ -15,8 +15,6 @@
 #include <environment/ti/k3_rproc.h>
 #include <environment/ti/ufs.h>
 
-#define CONFIG_ENV_SIZE			(128 << 10)
-
 /* DDR Configuration */
 #define CONFIG_SYS_SDRAM_BASE1		0x880000000
 
diff --git a/include/configs/jetson-tk1.h b/include/configs/jetson-tk1.h
index 65044690d64a..98248876e8eb 100644
--- a/include/configs/jetson-tk1.h
+++ b/include/configs/jetson-tk1.h
@@ -19,7 +19,6 @@
 #define CONFIG_SYS_NS16550_COM1		NV_PA_APB_UARTD_BASE
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/k2e_evm.h b/include/configs/k2e_evm.h
index 547127490c92..716ae3b0d4aa 100644
--- a/include/configs/k2e_evm.h
+++ b/include/configs/k2e_evm.h
@@ -35,9 +35,6 @@
 	"name_uboot=u-boot-spi-k2e-evm.gph\0"				\
 	"name_fs=arago-console-image-k2e-evm.cpio.gz\0"
 
-#define CONFIG_ENV_SIZE				(256 << 10)  /* 256 KiB */
-#define CONFIG_ENV_OFFSET			0x100000
-
 #include <configs/ti_armv7_keystone2.h>
 
 #define SPI_MTD_PARTS KEYSTONE_SPI0_MTD_PARTS
diff --git a/include/configs/k2g_evm.h b/include/configs/k2g_evm.h
index b39e956defd6..25f3959533c6 100644
--- a/include/configs/k2g_evm.h
+++ b/include/configs/k2g_evm.h
@@ -81,8 +81,6 @@
 #define CONFIG_KSNET_MDIO_PHY_CONFIG_ENABLE
 #define PHY_ANEG_TIMEOUT	10000 /* PHY needs longer aneg time */
 
-#define CONFIG_ENV_SIZE			(256 << 10)  /* 256 KiB */
-
 #ifndef CONFIG_SPL_BUILD
 #define CONFIG_CADENCE_QSPI
 #define CONFIG_CQSPI_REF_CLK 384000000
diff --git a/include/configs/k2hk_evm.h b/include/configs/k2hk_evm.h
index d4f2e96bab08..d90b2648185a 100644
--- a/include/configs/k2hk_evm.h
+++ b/include/configs/k2hk_evm.h
@@ -35,9 +35,6 @@
 	"name_uboot=u-boot-spi-k2hk-evm.gph\0"				\
 	"name_fs=arago-console-image-k2hk-evm.cpio.gz\0"
 
-#define CONFIG_ENV_SIZE				(256 << 10)  /* 256 KiB */
-#define CONFIG_ENV_OFFSET			0x100000
-
 #include <configs/ti_armv7_keystone2.h>
 
 #define SPI_MTD_PARTS KEYSTONE_SPI0_MTD_PARTS
diff --git a/include/configs/k2l_evm.h b/include/configs/k2l_evm.h
index cfdb36e2d7ff..152cea01b55b 100644
--- a/include/configs/k2l_evm.h
+++ b/include/configs/k2l_evm.h
@@ -35,9 +35,6 @@
 	"name_uboot=u-boot-spi-k2l-evm.gph\0"				\
 	"name_fs=arago-console-image-k2l-evm.cpio.gz\0"
 
-#define CONFIG_ENV_SIZE				(256 << 10)  /* 256 KiB */
-#define CONFIG_ENV_OFFSET			0x100000
-
 #include <configs/ti_armv7_keystone2.h>
 
 #define SPI_MTD_PARTS KEYSTONE_SPI0_MTD_PARTS
diff --git a/include/configs/km/km-mpc83xx.h b/include/configs/km/km-mpc83xx.h
index a9899fe4591e..dfb78c50f4b1 100644
--- a/include/configs/km/km-mpc83xx.h
+++ b/include/configs/km/km-mpc83xx.h
@@ -105,22 +105,7 @@
  */
 
 #ifndef CONFIG_SYS_RAMBOOT
-#ifndef CONFIG_ENV_ADDR
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-					CONFIG_SYS_MONITOR_LEN)
-#endif
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K(one sector) for env */
-#ifndef CONFIG_ENV_OFFSET
-#define CONFIG_ENV_OFFSET	(CONFIG_SYS_MONITOR_LEN)
-#endif
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + \
-						CONFIG_ENV_SECT_SIZE)
-
-#else /* CFG_SYS_RAMBOOT */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE		0x2000
 #endif /* CFG_SYS_RAMBOOT */
 
 /*
diff --git a/include/configs/km/km-powerpc.h b/include/configs/km/km-powerpc.h
index 20b596f54140..84594874b88e 100644
--- a/include/configs/km/km-powerpc.h
+++ b/include/configs/km/km-powerpc.h
@@ -16,8 +16,6 @@
 #define CONFIG_SYS_EEPROM_PAGE_WRITE_BITS	3  /* 8 Byte write page */
 #define CONFIG_SYS_EEPROM_PAGE_WRITE_DELAY_MS	10
 
-#define CONFIG_ENV_SIZE		0x04000		/* Size of Environment */
-
 #define CONFIG_SYS_MEMTEST_START 0x00100000	/* memtest works on */
 
 #define CONFIG_SYS_MEMTEST_END	0x00f00000	/* 1 ... 15 MB in DRAM	*/
diff --git a/include/configs/km/km_arm.h b/include/configs/km/km_arm.h
index 63fa6675ff92..156edfba2269 100644
--- a/include/configs/km/km_arm.h
+++ b/include/configs/km/km_arm.h
@@ -141,20 +141,12 @@ int get_scl(void);
  *  Environment variables configurations
  */
 #if defined CONFIG_KM_ENV_IS_IN_SPI_NOR
-#define CONFIG_ENV_OFFSET		0xc0000     /* no bracets! */
-#define CONFIG_ENV_SIZE			0x02000     /* Size of Environment */
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + \
-					CONFIG_ENV_SECT_SIZE)
 #define CONFIG_ENV_TOTAL_SIZE		0x20000     /* no bracets! */
 #else
 #define CONFIG_SYS_DEF_EEPROM_ADDR	0x50
 #define CONFIG_ENV_EEPROM_IS_ON_I2C
 #define CONFIG_SYS_EEPROM_WREN
-#define CONFIG_ENV_OFFSET		0x0 /* no bracets! */
-#define CONFIG_ENV_SIZE			(0x2000 - CONFIG_ENV_OFFSET)
 #define CONFIG_I2C_ENV_EEPROM_BUS 5 /* I2C2 (Mux-Port 5) */
-#define CONFIG_ENV_OFFSET_REDUND	0x2000 /* no bracets! */
 #endif
 
 #define KM_FLASH_GPIO_PIN	16
diff --git a/include/configs/kmp204x.h b/include/configs/kmp204x.h
index f83b98c879b6..771d0248f791 100644
--- a/include/configs/kmp204x.h
+++ b/include/configs/kmp204x.h
@@ -50,10 +50,6 @@
 #define CONFIG_SYS_DPAA_RMAN		/* RMan */
 
 /* Environment in SPI Flash */
-#define CONFIG_ENV_OFFSET               0x100000	/* 1MB for u-boot */
-#define CONFIG_ENV_SIZE			0x004000	/* 16K env */
-#define CONFIG_ENV_SECT_SIZE            0x010000
-#define CONFIG_ENV_OFFSET_REDUND	0x110000
 #define CONFIG_ENV_TOTAL_SIZE		0x020000
 
 #ifndef __ASSEMBLY__
diff --git a/include/configs/kmtegr1.h b/include/configs/kmtegr1.h
index 701eb53f631d..e62760622285 100644
--- a/include/configs/kmtegr1.h
+++ b/include/configs/kmtegr1.h
@@ -25,9 +25,6 @@
 #define CONFIG_KM_UBI_PARTITION_NAME_BOOT	"ubi0"
 #define CONFIG_KM_UBI_PARTITION_NAME_APP	"ubi1"
 
-#define CONFIG_ENV_ADDR		0xF0100000
-#define CONFIG_ENV_OFFSET	0x100000
-
 #define CONFIG_NAND_ECC_BCH
 #define CONFIG_NAND_KMETER1
 #define CONFIG_SYS_MAX_NAND_DEVICE		1
diff --git a/include/configs/kp_imx53.h b/include/configs/kp_imx53.h
index 85224c3f46ae..5e2af76c6e4b 100644
--- a/include/configs/kp_imx53.h
+++ b/include/configs/kp_imx53.h
@@ -97,9 +97,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_OFFSET      (SZ_1M)
-#define CONFIG_ENV_SIZE        (SZ_8K)
-#define CONFIG_ENV_OFFSET_REDUND        (CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 
 #endif				/* __CONFIG_H_ */
diff --git a/include/configs/kp_imx6q_tpc.h b/include/configs/kp_imx6q_tpc.h
index fc3896e7d10f..0f0fe63f4fbf 100644
--- a/include/configs/kp_imx6q_tpc.h
+++ b/include/configs/kp_imx6q_tpc.h
@@ -126,8 +126,5 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment */
-#define CONFIG_ENV_SIZE	(SZ_8K)
-#define CONFIG_ENV_OFFSET       0x100000
-#define CONFIG_ENV_OFFSET_REDUND (CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 #endif	/* __KP_IMX6Q_TPC_IMX6_CONFIG_H_ */
diff --git a/include/configs/kzm9g.h b/include/configs/kzm9g.h
index 5a2b040225bb..cceabdf66363 100644
--- a/include/configs/kzm9g.h
+++ b/include/configs/kzm9g.h
@@ -62,9 +62,6 @@
 #undef  CONFIG_SYS_FLASH_QUIET_TEST
 #define CONFIG_SYS_FLASH_EMPTY_INFO
 #define FLASH_SECTOR_SIZE	(256 * 1024)	/* 256 KB sectors */
-#define CONFIG_ENV_SIZE		FLASH_SECTOR_SIZE
-#define CONFIG_ENV_OFFSET	FLASH_SECTOR_SIZE
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + CONFIG_ENV_OFFSET)
 
 /* Timeout for Flash erase operations (in ms) */
 #define CONFIG_SYS_FLASH_ERASE_TOUT	(3 * 1000)
diff --git a/include/configs/lacie_kw.h b/include/configs/lacie_kw.h
index 1ba28b501f58..5bb0255a74d5 100644
--- a/include/configs/lacie_kw.h
+++ b/include/configs/lacie_kw.h
@@ -125,10 +125,6 @@
 /*
  * Environment variables configurations
  */
-#define CONFIG_ENV_SECT_SIZE		0x10000	/* 64KB */
-#define CONFIG_ENV_SIZE			0x1000	/* 4KB */
-#define CONFIG_ENV_ADDR			0x70000
-#define CONFIG_ENV_OFFSET		0x70000	/* env starts here */
 
 /*
  * Default environment variables
diff --git a/include/configs/legoev3.h b/include/configs/legoev3.h
index c1eeca0c60bb..0bfa67a7c09c 100644
--- a/include/configs/legoev3.h
+++ b/include/configs/legoev3.h
@@ -135,8 +135,6 @@
 #define CONFIG_CLOCKS
 #endif
 
-#define CONFIG_ENV_SIZE		(16 << 10)
-
 /* additions for new relocation code, must added to all boards */
 #define CONFIG_SYS_SDRAM_BASE		0xc0000000
 
diff --git a/include/configs/libretech-ac.h b/include/configs/libretech-ac.h
index 419dc615874d..bf20d3154302 100644
--- a/include/configs/libretech-ac.h
+++ b/include/configs/libretech-ac.h
@@ -9,9 +9,6 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#define CONFIG_ENV_OFFSET	(-0x10000)
-
 #define BOOT_TARGET_DEVICES(func) \
 	func(ROMUSB, romusb, na)  \
 	func(MMC, mmc, 0) \
diff --git a/include/configs/linkit-smart-7688.h b/include/configs/linkit-smart-7688.h
index 4d30d98abfae..ca5b693e4ccb 100644
--- a/include/configs/linkit-smart-7688.h
+++ b/include/configs/linkit-smart-7688.h
@@ -38,9 +38,6 @@
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_TEXT_BASE
 
 /* Environment settings */
-#define CONFIG_ENV_OFFSET		0x80000
-#define CONFIG_ENV_SIZE			(16 << 10)
-#define CONFIG_ENV_SECT_SIZE		(64 << 10)
 
 /*
  * Environment is right behind U-Boot in flash. Make sure U-Boot
diff --git a/include/configs/liteboard.h b/include/configs/liteboard.h
index 975f32474c4a..14008fec3613 100644
--- a/include/configs/liteboard.h
+++ b/include/configs/liteboard.h
@@ -123,8 +123,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* FLASH and environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		0
 #define CONFIG_MMCROOT			"/dev/mmcblk0p2"
diff --git a/include/configs/ls1012a_common.h b/include/configs/ls1012a_common.h
index dd2a679b799a..2579e2fb37ee 100644
--- a/include/configs/ls1012a_common.h
+++ b/include/configs/ls1012a_common.h
@@ -53,14 +53,6 @@
  * Environment
  */
 #define CONFIG_ENV_OVERWRITE
-
-#define CONFIG_ENV_SIZE			0x40000          /* 256KB */
-#ifdef CONFIG_TFABOOT
-#define CONFIG_ENV_OFFSET		0x500000        /* 5MB */
-#else
-#define CONFIG_ENV_OFFSET		0x300000        /* 3MB */
-#endif
-#define CONFIG_ENV_SECT_SIZE		0x40000
 #endif
 
 /* SATA */
diff --git a/include/configs/ls1012afrwy.h b/include/configs/ls1012afrwy.h
index 1b0f1566d3eb..44b37c5475b6 100644
--- a/include/configs/ls1012afrwy.h
+++ b/include/configs/ls1012afrwy.h
@@ -25,8 +25,6 @@
 
 /* ENV */
 #define CONFIG_SYS_FSL_QSPI_BASE	0x40000000
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FSL_QSPI_BASE + \
-				CONFIG_ENV_OFFSET)
 
 #ifndef CONFIG_SPL_BUILD
 #undef BOOT_TARGET_DEVICES
@@ -35,14 +33,8 @@
 	func(USB, usb, 0)
 #endif
 
-#undef CONFIG_ENV_OFFSET
-#define CONFIG_ENV_OFFSET              0x1D0000
 #undef FSL_QSPI_FLASH_SIZE
 #define FSL_QSPI_FLASH_SIZE            SZ_16M
-#undef CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_SECT_SIZE		0x10000 /*64 KB*/
-#undef CONFIG_ENV_SIZE
-#define CONFIG_ENV_SIZE			0x10000 /*64 KB*/
 
 /*  MMC  */
 #ifdef CONFIG_MMC
diff --git a/include/configs/ls1012ardb.h b/include/configs/ls1012ardb.h
index a5e27404f86a..3cd7baf21dad 100644
--- a/include/configs/ls1012ardb.h
+++ b/include/configs/ls1012ardb.h
@@ -19,8 +19,6 @@
 
 /* ENV */
 #define CONFIG_SYS_FSL_QSPI_BASE	0x40000000
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FSL_QSPI_BASE + \
-					 CONFIG_ENV_OFFSET)
 /*
  * I2C IO expander
  */
diff --git a/include/configs/ls1021aiot.h b/include/configs/ls1021aiot.h
index ee570bc1a9cf..0b2d331b9b9c 100644
--- a/include/configs/ls1021aiot.h
+++ b/include/configs/ls1021aiot.h
@@ -234,13 +234,7 @@
 #define CONFIG_ENV_OVERWRITE
 
 #if defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		0x100000
 #define CONFIG_SYS_MMC_ENV_DEV	0
-#define CONFIG_ENV_SIZE			0x2000
-#elif defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		0x100000
-#define CONFIG_ENV_SECT_SIZE	0x10000
 #endif
 
 #define CONFIG_OF_BOARD_SETUP
diff --git a/include/configs/ls1021aqds.h b/include/configs/ls1021aqds.h
index 66771e279beb..8427be5adc18 100644
--- a/include/configs/ls1021aqds.h
+++ b/include/configs/ls1021aqds.h
@@ -493,20 +493,7 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_ENV_OVERWRITE
 
 #if defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		0x300000
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#elif defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET		0x300000        /* 3MB */
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#elif defined(CONFIG_NAND_BOOT)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(10 * CONFIG_SYS_NAND_BLOCK_SIZE)
-#else
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_SECT_SIZE		0x20000 /* 128K (one sector) */
 #endif
 
 #include <asm/fsl_secure_boot.h>
diff --git a/include/configs/ls1021atsn.h b/include/configs/ls1021atsn.h
index b011cb2a8414..bdb4273cf5c6 100644
--- a/include/configs/ls1021atsn.h
+++ b/include/configs/ls1021atsn.h
@@ -236,13 +236,7 @@
 #define CONFIG_ENV_OVERWRITE
 
 #if defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		0x300000
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x20000
-#elif defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		0x300000
-#define CONFIG_ENV_SECT_SIZE		0x40000
 #endif
 
 #define CONFIG_SYS_BOOTM_LEN		0x8000000 /* 128 MB */
diff --git a/include/configs/ls1021atwr.h b/include/configs/ls1021atwr.h
index 1363d3084d44..1919d1e14f9e 100644
--- a/include/configs/ls1021atwr.h
+++ b/include/configs/ls1021atwr.h
@@ -458,17 +458,7 @@
 #define CONFIG_ENV_OVERWRITE
 
 #if defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		0x300000
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x20000
-#elif defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		0x300000
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#else
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SIZE			0x20000
-#define CONFIG_ENV_SECT_SIZE		0x20000 /* 128K (one sector) */
 #endif
 
 #include <asm/fsl_secure_boot.h>
diff --git a/include/configs/ls1028a_common.h b/include/configs/ls1028a_common.h
index 39f931800709..09fc33381064 100644
--- a/include/configs/ls1028a_common.h
+++ b/include/configs/ls1028a_common.h
@@ -171,11 +171,7 @@
 
 #define CONFIG_SYS_MMC_ENV_DEV         0
 #define OCRAM_NONSECURE_SIZE		0x00010000
-#define CONFIG_ENV_OFFSET              0x500000        /* 5MB */
 #define CONFIG_SYS_FSL_QSPI_BASE	0x20000000
-#define CONFIG_ENV_ADDR	CONFIG_SYS_FSL_QSPI_BASE + CONFIG_ENV_OFFSET
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_SECT_SIZE           0x40000
 
 #define CONFIG_SYS_MONITOR_BASE CONFIG_SYS_TEXT_BASE
 
diff --git a/include/configs/ls1028aqds.h b/include/configs/ls1028aqds.h
index b0e9441a48bd..982df07bb013 100644
--- a/include/configs/ls1028aqds.h
+++ b/include/configs/ls1028aqds.h
@@ -59,7 +59,6 @@
 #define I2C_MUX_CH_RTC                 0xB
 
 /* Store environment at top of flash */
-#define CONFIG_ENV_SIZE			0x2000
 
 #ifdef CONFIG_SPL_BUILD
 #define CONFIG_SYS_MONITOR_BASE CONFIG_SPL_TEXT_BASE
diff --git a/include/configs/ls1028ardb.h b/include/configs/ls1028ardb.h
index b77c36d2798e..a4c3d73d2a13 100644
--- a/include/configs/ls1028ardb.h
+++ b/include/configs/ls1028ardb.h
@@ -15,7 +15,6 @@
 #define CONFIG_SYS_RTC_BUS_NUM         0
 
 /* Store environment at top of flash */
-#define CONFIG_ENV_SIZE			0x2000
 
 #define CONFIG_DIMM_SLOTS_PER_CTLR          1
 
diff --git a/include/configs/ls1043aqds.h b/include/configs/ls1043aqds.h
index 0ea3ca033244..37080629a13f 100644
--- a/include/configs/ls1043aqds.h
+++ b/include/configs/ls1043aqds.h
@@ -414,27 +414,10 @@ unsigned long get_board_ddr_clk(void);
 
 #ifdef CONFIG_TFABOOT
 #define CONFIG_SYS_MMC_ENV_DEV		0
-
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		0x500000        /* 5MB */
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x500000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
 #else
 #ifdef CONFIG_NAND_BOOT
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(24 * CONFIG_SYS_NAND_BLOCK_SIZE)
 #elif defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		(3 * 1024 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#elif defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET		0x300000        /* 3MB */
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#else
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x20000
 #endif
 #endif
 
diff --git a/include/configs/ls1043ardb.h b/include/configs/ls1043ardb.h
index d2979efcdf95..f7b110cffcf8 100644
--- a/include/configs/ls1043ardb.h
+++ b/include/configs/ls1043ardb.h
@@ -247,23 +247,10 @@
 
 #ifdef CONFIG_TFABOOT
 #define CONFIG_SYS_MMC_ENV_DEV		0
-
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		0x500000
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x500000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
 #else
 #if defined(CONFIG_NAND_BOOT)
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(24 * CONFIG_SYS_NAND_BLOCK_SIZE)
 #elif defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		(3 * 1024 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#else
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x20000
 #endif
 #endif
 
diff --git a/include/configs/ls1046afrwy.h b/include/configs/ls1046afrwy.h
index 8609ebfecc14..4ccd3b05609e 100644
--- a/include/configs/ls1046afrwy.h
+++ b/include/configs/ls1046afrwy.h
@@ -100,12 +100,7 @@
 
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
-#define CONFIG_ENV_SIZE			0x2000		/* 8KB */
-#define CONFIG_ENV_OFFSET		0x500000	/* 5MB */
-#define CONFIG_ENV_SECT_SIZE		0x40000		/* 256KB */
 #define CONFIG_SYS_FSL_QSPI_BASE	0x40000000
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FSL_QSPI_BASE + \
-					 CONFIG_ENV_OFFSET)
 
 /* FMan */
 #ifdef CONFIG_SYS_DPAA_FMAN
diff --git a/include/configs/ls1046aqds.h b/include/configs/ls1046aqds.h
index eea738e6021f..0b17b1e99432 100644
--- a/include/configs/ls1046aqds.h
+++ b/include/configs/ls1046aqds.h
@@ -429,27 +429,10 @@ unsigned long get_board_ddr_clk(void);
 
 #ifdef CONFIG_TFABOOT
 #define CONFIG_SYS_MMC_ENV_DEV		0
-
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		0x500000        /* 5MB */
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x500000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
 #else
 #ifdef CONFIG_NAND_BOOT
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		(12 * CONFIG_SYS_NAND_BLOCK_SIZE)
 #elif defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		(3 * 1024 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#elif defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET		0x300000        /* 3MB */
-#define CONFIG_ENV_SECT_SIZE		0x10000
-#else
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x20000
 #endif
 #endif
 
diff --git a/include/configs/ls1046ardb.h b/include/configs/ls1046ardb.h
index 2d20f156835a..efedfd59236c 100644
--- a/include/configs/ls1046ardb.h
+++ b/include/configs/ls1046ardb.h
@@ -160,20 +160,10 @@
 #ifdef CONFIG_TFABOOT
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
-#define CONFIG_ENV_SIZE			0x2000		/* 8KB */
-#define CONFIG_ENV_OFFSET		0x500000	/* 5MB */
-#define CONFIG_ENV_SECT_SIZE		0x40000		/* 256KB */
 #define CONFIG_SYS_FSL_QSPI_BASE        0x40000000
-#define CONFIG_ENV_ADDR CONFIG_SYS_FSL_QSPI_BASE + CONFIG_ENV_OFFSET
 #else
 #if defined(CONFIG_SD_BOOT)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_OFFSET		(3 * 1024 * 1024)
-#define CONFIG_ENV_SIZE			0x2000
-#else
-#define CONFIG_ENV_SIZE			0x2000		/* 8KB */
-#define CONFIG_ENV_OFFSET		0x300000	/* 3MB */
-#define CONFIG_ENV_SECT_SIZE		0x40000		/* 256KB */
 #endif
 #endif
 
diff --git a/include/configs/ls1088a_common.h b/include/configs/ls1088a_common.h
index 73c56296ff48..ab5b396e1a59 100644
--- a/include/configs/ls1088a_common.h
+++ b/include/configs/ls1088a_common.h
@@ -40,9 +40,6 @@
 #else
 #ifdef CONFIG_QSPI_BOOT
 #define CONFIG_SYS_FSL_QSPI_BASE	0x20000000
-#define CONFIG_ENV_OFFSET		0x300000        /* 3MB */
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FSL_QSPI_BASE + \
-						CONFIG_ENV_OFFSET)
 #endif
 #endif
 
diff --git a/include/configs/ls1088aqds.h b/include/configs/ls1088aqds.h
index c9c517f93ec9..a5125c8f37fc 100644
--- a/include/configs/ls1088aqds.h
+++ b/include/configs/ls1088aqds.h
@@ -18,24 +18,10 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 #define CONFIG_MISC_INIT_R
-
-#define CONFIG_ENV_SIZE			0x20000
-#define CONFIG_ENV_OFFSET		0x500000
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + \
-					 CONFIG_ENV_OFFSET)
-#define CONFIG_ENV_SECT_SIZE		0x40000
 #else
 #if defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_SECT_SIZE		0x40000
 #elif defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		(3 * 1024 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
-#else
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x20000
 #endif
 #endif
 
diff --git a/include/configs/ls1088ardb.h b/include/configs/ls1088ardb.h
index b71f70426cff..b082d8549ab0 100644
--- a/include/configs/ls1088ardb.h
+++ b/include/configs/ls1088ardb.h
@@ -10,25 +10,12 @@
 
 #ifdef CONFIG_TFABOOT
 #define CONFIG_SYS_MMC_ENV_DEV		0
-
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET		0x500000
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + \
-					 CONFIG_ENV_OFFSET)
-#define CONFIG_ENV_SECT_SIZE		0x40000
 #else
 #if defined(CONFIG_QSPI_BOOT)
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_SECT_SIZE		0x40000
 #elif defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		(3 * 1024 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x2000
 #else
 #define CONFIG_ENV_IS_IN_FLASH
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x20000
 #endif
 #endif /* CONFIG_TFABOOT */
 
diff --git a/include/configs/ls2080a_common.h b/include/configs/ls2080a_common.h
index 6be581a229ca..b58776a788b1 100644
--- a/include/configs/ls2080a_common.h
+++ b/include/configs/ls2080a_common.h
@@ -23,14 +23,6 @@
 /* We need architecture specific misc initializations */
 
 /* Link Definitions */
-#ifndef CONFIG_TFABOOT
-#ifndef CONFIG_QSPI_BOOT
-#else
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_OFFSET		0x300000        /* 3MB */
-#define CONFIG_ENV_SECT_SIZE		0x40000
-#endif
-#endif
 
 #define CONFIG_SKIP_LOWLEVEL_INIT
 
diff --git a/include/configs/ls2080a_emu.h b/include/configs/ls2080a_emu.h
index d5cb3e4df972..3e0ad48ddacc 100644
--- a/include/configs/ls2080a_emu.h
+++ b/include/configs/ls2080a_emu.h
@@ -76,6 +76,5 @@
 #define CONFIG_SYS_LS_MC_BOOT_TIMEOUT_MS 200000
 
 /* Store environment at top of flash */
-#define CONFIG_ENV_SIZE			0x1000
 
 #endif /* __LS2_EMU_H */
diff --git a/include/configs/ls2080a_simu.h b/include/configs/ls2080a_simu.h
index a52665884056..ab46df76007f 100644
--- a/include/configs/ls2080a_simu.h
+++ b/include/configs/ls2080a_simu.h
@@ -143,6 +143,5 @@
 #define CONFIG_SYS_LS_MC_BOOT_TIMEOUT_MS 200000
 
 /* Store environment at top of flash */
-#define CONFIG_ENV_SIZE			0x1000
 
 #endif /* __LS2_SIMU_H */
diff --git a/include/configs/ls2080aqds.h b/include/configs/ls2080aqds.h
index 08696fa9a3af..9539e2a8db27 100644
--- a/include/configs/ls2080aqds.h
+++ b/include/configs/ls2080aqds.h
@@ -58,11 +58,6 @@ unsigned long get_board_ddr_clk(void);
 
 #ifdef CONFIG_TFABOOT
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x20000
-#define CONFIG_ENV_OFFSET		0x500000
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + \
-					 CONFIG_ENV_OFFSET)
-#define CONFIG_ENV_SECT_SIZE		0x20000
 #endif
 
 #define CONFIG_SYS_NOR0_CSPR_EXT	(0x0)
@@ -229,16 +224,11 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_SYS_CS0_FTIM2		CONFIG_SYS_NAND_FTIM2
 #define CONFIG_SYS_CS0_FTIM3		CONFIG_SYS_NAND_FTIM3
 
-#define CONFIG_ENV_OFFSET		(896 * 1024)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x2000
 #define CONFIG_SPL_PAD_TO		0x20000
 #define CONFIG_SYS_NAND_U_BOOT_OFFS	(256 * 1024)
 #define CONFIG_SYS_NAND_U_BOOT_SIZE	(640 * 1024)
 #elif defined(CONFIG_SD_BOOT)
-#define CONFIG_ENV_OFFSET		0x300000
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			0x20000
 #endif
 #else
 #define CONFIG_SYS_CSPR0_EXT		CONFIG_SYS_NOR0_CSPR_EXT
@@ -268,12 +258,6 @@ unsigned long get_board_ddr_clk(void);
 #define CONFIG_SYS_CS2_FTIM1		CONFIG_SYS_NAND_FTIM1
 #define CONFIG_SYS_CS2_FTIM2		CONFIG_SYS_NAND_FTIM2
 #define CONFIG_SYS_CS2_FTIM3		CONFIG_SYS_NAND_FTIM3
-
-#if !defined(CONFIG_QSPI_BOOT) && !defined(CONFIG_TFABOOT)
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x2000
-#endif
 #endif
 
 /* Debug Server firmware */
diff --git a/include/configs/ls2080ardb.h b/include/configs/ls2080ardb.h
index 2bf821768588..c5d57cfdd43b 100644
--- a/include/configs/ls2080ardb.h
+++ b/include/configs/ls2080ardb.h
@@ -72,12 +72,6 @@ unsigned long get_board_sys_clk(void);
 						CONFIG_SYS_SCSI_MAX_LUN)
 #ifdef CONFIG_TFABOOT
 #define CONFIG_SYS_MMC_ENV_DEV         0
-
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_OFFSET		0x500000	/* 5MB */
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + \
-					 CONFIG_ENV_OFFSET)
-#define CONFIG_ENV_SECT_SIZE		0x40000
 #endif
 
 #if !defined(CONFIG_FSL_QSPI) || defined(CONFIG_TFABOOT)
@@ -221,11 +215,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_CS0_FTIM2		CONFIG_SYS_NAND_FTIM2
 #define CONFIG_SYS_CS0_FTIM3		CONFIG_SYS_NAND_FTIM3
 
-#ifndef CONFIG_TFABOOT
-#define CONFIG_ENV_OFFSET		(2048 * 1024)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x2000
-#endif
 #define CONFIG_SPL_PAD_TO		0x80000
 #define CONFIG_SYS_NAND_U_BOOT_OFFS	(1024 * 1024)
 #define CONFIG_SYS_NAND_U_BOOT_SIZE	(512 * 1024)
@@ -247,12 +236,6 @@ unsigned long get_board_sys_clk(void);
 #define CONFIG_SYS_CS2_FTIM1		CONFIG_SYS_NAND_FTIM1
 #define CONFIG_SYS_CS2_FTIM2		CONFIG_SYS_NAND_FTIM2
 #define CONFIG_SYS_CS2_FTIM3		CONFIG_SYS_NAND_FTIM3
-
-#ifndef CONFIG_TFABOOT
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x300000)
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			0x2000
-#endif
 #endif
 
 /* Debug Server firmware */
diff --git a/include/configs/lsxl.h b/include/configs/lsxl.h
index 3ba5548f25ac..faa74c613fbd 100644
--- a/include/configs/lsxl.h
+++ b/include/configs/lsxl.h
@@ -50,12 +50,8 @@
 #ifdef CONFIG_SPI_FLASH
 #define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	8
-#define CONFIG_ENV_SECT_SIZE		0x10000 /* 64K */
 #endif
 
-#define CONFIG_ENV_SIZE			0x10000 /* 64k */
-#define CONFIG_ENV_OFFSET		0x70000 /* env starts here */
-
 /*
  * Default environment variables
  */
diff --git a/include/configs/lx2160a_common.h b/include/configs/lx2160a_common.h
index 110d49726693..cfb20d3fb035 100644
--- a/include/configs/lx2160a_common.h
+++ b/include/configs/lx2160a_common.h
@@ -173,11 +173,6 @@ unsigned long get_board_ddr_clk(void);
 #define HWCONFIG_BUFFER_SIZE		128
 
 #define CONFIG_SYS_MMC_ENV_DEV          0
-#define CONFIG_ENV_SIZE			0x2000          /* 8KB */
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_OFFSET		0x500000
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + \
-					 CONFIG_ENV_OFFSET)
 
 /* Allow to overwrite serial and ethaddr */
 #define CONFIG_ENV_OVERWRITE
diff --git a/include/configs/m53menlo.h b/include/configs/m53menlo.h
index 701bf2a597ba..af6fc3ae7aec 100644
--- a/include/configs/m53menlo.h
+++ b/include/configs/m53menlo.h
@@ -62,7 +62,6 @@
 /*
  * NAND
  */
-#define CONFIG_ENV_SIZE			(16 * 1024)
 #ifdef CONFIG_CMD_NAND
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 #define CONFIG_SYS_NAND_BASE		NFC_BASE_ADDR_AXI
@@ -72,11 +71,7 @@
 #define CONFIG_MXC_NAND_HWECC
 
 /* Environment is in NAND */
-#define CONFIG_ENV_SECT_SIZE		(128 * 1024)
-#define CONFIG_ENV_RANGE		(4 * CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_OFFSET		(8 * CONFIG_ENV_SECT_SIZE) /* 1 MiB */
-#define CONFIG_ENV_OFFSET_REDUND	\
-		(CONFIG_ENV_OFFSET + CONFIG_ENV_RANGE)
+#define CONFIG_ENV_RANGE		(0x00080000) /* 512 KiB */
 #endif
 
 /*
diff --git a/include/configs/malta.h b/include/configs/malta.h
index f536234f4890..bb8a44433eba 100644
--- a/include/configs/malta.h
+++ b/include/configs/malta.h
@@ -68,10 +68,6 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_SECT_SIZE		0x20000
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_ADDR \
-	(CONFIG_SYS_FLASH_BASE + (4 << 20) - CONFIG_ENV_SIZE)
 
 /*
  * IDE/ATA
diff --git a/include/configs/maxbcm.h b/include/configs/maxbcm.h
index 9d5fbcd516ee..9cc13052cc75 100644
--- a/include/configs/maxbcm.h
+++ b/include/configs/maxbcm.h
@@ -31,9 +31,6 @@
 /* SPI NOR flash default params, used by sf commands */
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB sectors */
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 
diff --git a/include/configs/mccmon6.h b/include/configs/mccmon6.h
index 50afc7c60808..045a9f7bdf9d 100644
--- a/include/configs/mccmon6.h
+++ b/include/configs/mccmon6.h
@@ -245,12 +245,7 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(SZ_128K)
 
 /* Envs are stored in NOR flash */
-#define CONFIG_ENV_SECT_SIZE    (SZ_128K)
-#define CONFIG_ENV_ADDR	(CONFIG_SYS_FLASH_BASE + 0x40000)
-
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_SYS_FLASH_BASE + 0x60000)
 
 #endif			       /* __CONFIG_H * */
diff --git a/include/configs/medcom-wide.h b/include/configs/medcom-wide.h
index d212a7f680fe..84b998e23af8 100644
--- a/include/configs/medcom-wide.h
+++ b/include/configs/medcom-wide.h
@@ -23,7 +23,6 @@
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 
 /* Environment in NAND, aligned to start of last sector */
-#define CONFIG_ENV_OFFSET		(SZ_512M - SZ_128K) /* 128K sectors */
 
 #include "tegra-common-post.h"
 
diff --git a/include/configs/meerkat96.h b/include/configs/meerkat96.h
index d0450af9542f..2dc3156b266d 100644
--- a/include/configs/meerkat96.h
+++ b/include/configs/meerkat96.h
@@ -38,8 +38,6 @@
 /* Environment configs */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		0
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
 
 /* USB configs */
 #define CONFIG_EHCI_HCD_INIT_AFTER_RESET
diff --git a/include/configs/meesc.h b/include/configs/meesc.h
index 3a173a2665a3..9d6c3b83006e 100644
--- a/include/configs/meesc.h
+++ b/include/configs/meesc.h
@@ -93,15 +93,10 @@
 #ifdef CONFIG_SYS_USE_DATAFLASH
 
 /* bootstrap + u-boot + env in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 
 #elif CONFIG_SYS_USE_NANDFLASH
 
 /* bootstrap + u-boot + env + linux in nandflash */
-# define CONFIG_ENV_OFFSET		0xC0000
-# define CONFIG_ENV_SIZE		0x20000
 
 #endif
 
diff --git a/include/configs/meson64.h b/include/configs/meson64.h
index f8d3eee29222..736081277d41 100644
--- a/include/configs/meson64.h
+++ b/include/configs/meson64.h
@@ -37,9 +37,6 @@
 
 #define CONFIG_CPU_ARMV8
 #define CONFIG_REMAKE_ELF
-#ifndef CONFIG_ENV_SIZE
-#define CONFIG_ENV_SIZE			0x2000
-#endif
 #define CONFIG_SYS_MAXARGS		32
 #define CONFIG_SYS_MALLOC_LEN		(32 << 20)
 #define CONFIG_SYS_CBSIZE		1024
diff --git a/include/configs/meson64_android.h b/include/configs/meson64_android.h
index 055fb44e9364..a4d9779667f4 100644
--- a/include/configs/meson64_android.h
+++ b/include/configs/meson64_android.h
@@ -11,8 +11,6 @@
 
 #define CONFIG_SYS_MMC_ENV_DEV	2
 #define CONFIG_SYS_MMC_ENV_PART	1
-#define CONFIG_ENV_SIZE		0x10000
-#define CONFIG_ENV_OFFSET	(-0x10000)
 
 
 #define BOOTENV_DEV_FASTBOOT(devtypeu, devtypel, instance) \
diff --git a/include/configs/microblaze-generic.h b/include/configs/microblaze-generic.h
index f1d0def3c163..385b30c99b75 100644
--- a/include/configs/microblaze-generic.h
+++ b/include/configs/microblaze-generic.h
@@ -70,35 +70,20 @@
 /* hardware flash protection */
 /* use buffered writes (20x faster) */
 # ifdef	RAMENV
-#  define CONFIG_ENV_SIZE	0x1000
-#  define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SIZE)
-
 # else	/* FLASH && !RAMENV */
 /* 128K(one sector) for env */
-#  define CONFIG_ENV_SECT_SIZE	0x20000
-#  define CONFIG_ENV_ADDR \
-			(CONFIG_SYS_FLASH_BASE + (2 * CONFIG_ENV_SECT_SIZE))
-#  define CONFIG_ENV_SIZE	0x20000
 # endif /* FLASH && !RAMBOOT */
 #else /* !FLASH */
 
 #ifdef SPIFLASH
 # ifdef	RAMENV
-#  define CONFIG_ENV_SIZE	0x1000
-#  define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SIZE)
-
 # else	/* SPIFLASH && !RAMENV */
 /* 128K(two sectors) for env */
-#  define CONFIG_ENV_SECT_SIZE	0x10000
-#  define CONFIG_ENV_SIZE	(2 * CONFIG_ENV_SECT_SIZE)
 /* Warning: adjust the offset in respect of other flash content and size */
-#  define CONFIG_ENV_OFFSET	(128 * CONFIG_ENV_SECT_SIZE) /* at 8MB */
 # endif /* SPIFLASH && !RAMBOOT */
 #else /* !SPIFLASH */
 
 /* ENV in RAM */
-# define CONFIG_ENV_SIZE	0x1000
-# define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SIZE)
 #endif /* !SPIFLASH */
 #endif /* !FLASH */
 
diff --git a/include/configs/microchip_mpfs_icicle.h b/include/configs/microchip_mpfs_icicle.h
index 82c7fbbdf22f..2f90ab317571 100644
--- a/include/configs/microchip_mpfs_icicle.h
+++ b/include/configs/microchip_mpfs_icicle.h
@@ -58,6 +58,5 @@
 #define CONFIG_SYS_MEMTEST_END		(PHYS_SDRAM_0 + PHYS_SDRAM_0_SIZE)
 
 /* When we use RAM as ENV */
-#define CONFIG_ENV_SIZE	0x2000
 
 #endif /* __CONFIG_H */
diff --git a/include/configs/minnowmax.h b/include/configs/minnowmax.h
index d0fe582c9094..6bcae31cb61b 100644
--- a/include/configs/minnowmax.h
+++ b/include/configs/minnowmax.h
@@ -22,7 +22,4 @@
 #define VIDEO_IO_OFFSET				0
 #define CONFIG_X86EMU_RAW_IO
 
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x006ef000
-
 #endif	/* __CONFIG_H */
diff --git a/include/configs/mpc8308_p1m.h b/include/configs/mpc8308_p1m.h
index 5a8546838fe3..cc58e806defc 100644
--- a/include/configs/mpc8308_p1m.h
+++ b/include/configs/mpc8308_p1m.h
@@ -227,11 +227,6 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-				 CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/mt7623.h b/include/configs/mt7623.h
index 5f67893f3127..e5182aeea872 100644
--- a/include/configs/mt7623.h
+++ b/include/configs/mt7623.h
@@ -27,7 +27,6 @@
 #define CONFIG_SYS_NONCACHED_MEMORY	SZ_1M
 
 /* Environment */
-#define CONFIG_ENV_SIZE			SZ_4K
 /* Allow to overwrite serial and ethaddr */
 #define CONFIG_ENV_OVERWRITE
 
@@ -58,6 +57,5 @@
 #define CONFIG_SERVERIP			192.168.1.2
 
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_OFFSET		0x100000
 
 #endif
diff --git a/include/configs/mt7629.h b/include/configs/mt7629.h
index 741b6fbc1b18..4aef894c6ebe 100644
--- a/include/configs/mt7629.h
+++ b/include/configs/mt7629.h
@@ -27,7 +27,6 @@
 #define CONFIG_SYS_NONCACHED_MEMORY	SZ_1M
 
 /* Environment */
-#define CONFIG_ENV_SIZE			SZ_4K
 /* Allow to overwrite serial and ethaddr */
 #define CONFIG_ENV_OVERWRITE
 
diff --git a/include/configs/mvebu_armada-37xx.h b/include/configs/mvebu_armada-37xx.h
index bc249039c8e2..172bfc88b64b 100644
--- a/include/configs/mvebu_armada-37xx.h
+++ b/include/configs/mvebu_armada-37xx.h
@@ -60,9 +60,6 @@
 #define CONFIG_MTD_PARTITIONS		/* required for UBI partition support */
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		0x180000 /* as Marvell U-Boot version */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB sectors */
 
 /*
  * Ethernet Driver configuration
diff --git a/include/configs/mvebu_armada-8k.h b/include/configs/mvebu_armada-8k.h
index 3be36833de05..b72a0a5b9ed7 100644
--- a/include/configs/mvebu_armada-8k.h
+++ b/include/configs/mvebu_armada-8k.h
@@ -47,10 +47,6 @@
 /* End of 16M scrubbed by training in bootrom */
 #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_TEXT_BASE + 0xFF0000)
 
-#define CONFIG_ENV_OFFSET		0x180000 /* as Marvell U-Boot version */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB sectors */
-
 /* When runtime detection fails this is the default */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
diff --git a/include/configs/mx23_olinuxino.h b/include/configs/mx23_olinuxino.h
index 330f020f7896..1f55e9209191 100644
--- a/include/configs/mx23_olinuxino.h
+++ b/include/configs/mx23_olinuxino.h
@@ -20,8 +20,6 @@
 
 /* Environment is in MMC */
 #if defined(CONFIG_CMD_MMC) && defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET	(256 * 1024)
-#define CONFIG_ENV_SIZE		(16 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV	0
 #endif
 
diff --git a/include/configs/mx23evk.h b/include/configs/mx23evk.h
index da1d53c883d9..595727aa3071 100644
--- a/include/configs/mx23evk.h
+++ b/include/configs/mx23evk.h
@@ -23,8 +23,6 @@
 
 /* Environment is in MMC */
 #if defined(CONFIG_CMD_MMC) && defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET	(256 * 1024)
-#define CONFIG_ENV_SIZE		(16 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV	0
 #endif
 
diff --git a/include/configs/mx25pdk.h b/include/configs/mx25pdk.h
index 6537e3a20445..174f038be8eb 100644
--- a/include/configs/mx25pdk.h
+++ b/include/configs/mx25pdk.h
@@ -49,8 +49,6 @@
 #define CONFIG_MXC_UART_BASE	UART1_BASE
 
 /* No NOR flash present */
-#define CONFIG_ENV_OFFSET      (6 * 64 * 1024)
-#define CONFIG_ENV_SIZE        (8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 /* U-Boot general configuration */
diff --git a/include/configs/mx28evk.h b/include/configs/mx28evk.h
index 7e7637ebecd8..15b64ee03eca 100644
--- a/include/configs/mx28evk.h
+++ b/include/configs/mx28evk.h
@@ -19,34 +19,19 @@
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 
 /* Environment */
-#ifndef CONFIG_ENV_IS_IN_SPI_FLASH
-#define CONFIG_ENV_SIZE			(16 * 1024)
-#else
-#define CONFIG_ENV_SIZE			(4 * 1024)
-#endif
 #define CONFIG_ENV_OVERWRITE
 
 /* Environment is in MMC */
 #if defined(CONFIG_CMD_MMC) && defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET		(256 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #endif
 
 /* Environment is in NAND */
 #if defined(CONFIG_CMD_NAND) && defined(CONFIG_ENV_IS_IN_NAND)
-#define CONFIG_ENV_SECT_SIZE		(128 * 1024)
 #define CONFIG_ENV_RANGE		(512 * 1024)
-#define CONFIG_ENV_OFFSET		0x300000
-#define CONFIG_ENV_OFFSET_REDUND	\
-		(CONFIG_ENV_OFFSET + CONFIG_ENV_RANGE)
 #endif
 
 /* Environment is in SPI flash */
-#if defined(CONFIG_CMD_SF) && defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-#define CONFIG_ENV_OFFSET		0x40000		/* 256K */
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#endif
 
 /* UBI and NAND partitioning */
 
diff --git a/include/configs/mx31pdk.h b/include/configs/mx31pdk.h
index 04e3b8ff28ce..4082a0bd6424 100644
--- a/include/configs/mx31pdk.h
+++ b/include/configs/mx31pdk.h
@@ -94,9 +94,6 @@
 /*
  * environment organization
  */
-#define CONFIG_ENV_OFFSET		0x40000
-#define CONFIG_ENV_OFFSET_REDUND	0x60000
-#define CONFIG_ENV_SIZE			(128 * 1024)
 
 /*
  * NAND driver
diff --git a/include/configs/mx35pdk.h b/include/configs/mx35pdk.h
index 4ec36193c0b2..222d13eb1fdd 100644
--- a/include/configs/mx35pdk.h
+++ b/include/configs/mx35pdk.h
@@ -128,18 +128,7 @@
 #define CONFIG_SYS_MONITOR_BASE	CONFIG_SYS_FLASH_BASE
 #define CONFIG_SYS_MONITOR_LEN		(512 * 1024)
 
-#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
-#define CONFIG_ENV_SIZE		CONFIG_ENV_SECT_SIZE
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
-
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-				CONFIG_SYS_MONITOR_LEN)
-
-#if defined(CONFIG_FSL_ENV_IN_NAND)
-	#define CONFIG_ENV_OFFSET       (1024 * 1024)
-#endif
 
 /*
  * CFI FLASH driver setup
diff --git a/include/configs/mx51evk.h b/include/configs/mx51evk.h
index fc498b2481e1..71ff7893810f 100644
--- a/include/configs/mx51evk.h
+++ b/include/configs/mx51evk.h
@@ -182,8 +182,6 @@
 /*-----------------------------------------------------------------------
  * environment organization
  */
-#define CONFIG_ENV_OFFSET      (6 * 64 * 1024)
-#define CONFIG_ENV_SIZE        (8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 
 #endif
diff --git a/include/configs/mx53ard.h b/include/configs/mx53ard.h
index d25629f41553..ff71435776a4 100644
--- a/include/configs/mx53ard.h
+++ b/include/configs/mx53ard.h
@@ -168,8 +168,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_OFFSET      (6 * 64 * 1024)
-#define CONFIG_ENV_SIZE        (8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV	0
 
 #define MX53ARD_CS1GCR1		(CSEN | DSZ(2))
diff --git a/include/configs/mx53cx9020.h b/include/configs/mx53cx9020.h
index bbe057403300..af23762396f4 100644
--- a/include/configs/mx53cx9020.h
+++ b/include/configs/mx53cx9020.h
@@ -154,8 +154,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_OFFSET      (6 * 64 * 1024)
-#define CONFIG_ENV_SIZE        (8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 
 /* Framebuffer and LCD */
diff --git a/include/configs/mx53evk.h b/include/configs/mx53evk.h
index 17ff13df3e42..2e687b9bdc0b 100644
--- a/include/configs/mx53evk.h
+++ b/include/configs/mx53evk.h
@@ -119,8 +119,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_OFFSET      (6 * 64 * 1024)
-#define CONFIG_ENV_SIZE        (8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 
 #endif				/* __CONFIG_H */
diff --git a/include/configs/mx53loco.h b/include/configs/mx53loco.h
index 65a5993f6147..1798a92efc53 100644
--- a/include/configs/mx53loco.h
+++ b/include/configs/mx53loco.h
@@ -164,7 +164,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment starts at 768k = 768 * 1024 = 786432 */
-#define CONFIG_ENV_OFFSET		786432
 /*
  * Detect overlap between U-Boot image and environment area in build-time
  *
@@ -175,7 +174,6 @@
  * write the direct value here
  */
 #define CONFIG_BOARD_SIZE_LIMIT		785408
-#define CONFIG_ENV_SIZE        (8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 
 #ifdef CONFIG_CMD_SATA
diff --git a/include/configs/mx53ppd.h b/include/configs/mx53ppd.h
index 59988efc9b32..f7667eca7c09 100644
--- a/include/configs/mx53ppd.h
+++ b/include/configs/mx53ppd.h
@@ -183,8 +183,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* FLASH and environment organization */
-#define CONFIG_ENV_OFFSET      (12 * 64 * 1024)
-#define CONFIG_ENV_SIZE        (10 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 
 #define CONFIG_CMD_FUSE
diff --git a/include/configs/mx53smd.h b/include/configs/mx53smd.h
index e606ee81b5f8..610e6e8a11fb 100644
--- a/include/configs/mx53smd.h
+++ b/include/configs/mx53smd.h
@@ -114,8 +114,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_OFFSET      (6 * 64 * 1024)
-#define CONFIG_ENV_SIZE        (8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 
 #endif				/* __CONFIG_H */
diff --git a/include/configs/mx6cuboxi.h b/include/configs/mx6cuboxi.h
index 3cf2f1ce28a0..c8d91dcfa05d 100644
--- a/include/configs/mx6cuboxi.h
+++ b/include/configs/mx6cuboxi.h
@@ -131,7 +131,5 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
-#define CONFIG_ENV_OFFSET		(SZ_1M - CONFIG_ENV_SIZE)
 
 #endif                         /* __MX6CUBOXI_CONFIG_H */
diff --git a/include/configs/mx6memcal.h b/include/configs/mx6memcal.h
index 58d5ebf56473..6fd87c2abcd4 100644
--- a/include/configs/mx6memcal.h
+++ b/include/configs/mx6memcal.h
@@ -50,8 +50,6 @@
 #define CONFIG_SYS_INIT_SP_ADDR \
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
-#define CONFIG_ENV_SIZE			(8 * 1024)
-
 #define CONFIG_MXC_USB_PORTSC	PORT_PTS_UTMI
 
 #endif	       /* __CONFIG_H */
diff --git a/include/configs/mx6qarm2.h b/include/configs/mx6qarm2.h
index 6e4e7519356c..7e6917b9670e 100644
--- a/include/configs/mx6qarm2.h
+++ b/include/configs/mx6qarm2.h
@@ -118,8 +118,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
-#define CONFIG_ENV_SIZE			(8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		1
 
 /* USB Configs */
diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
index 56b10d8eb294..9309e0320f2a 100644
--- a/include/configs/mx6sabre_common.h
+++ b/include/configs/mx6sabre_common.h
@@ -179,11 +179,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
-
-#if defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET		(768 * 1024)
-#endif
 
 /* Framebuffer */
 #define CONFIG_VIDEO_BMP_RLE8
diff --git a/include/configs/mx6slevk.h b/include/configs/mx6slevk.h
index 5d649f6e2f08..6b2a174e7a46 100644
--- a/include/configs/mx6slevk.h
+++ b/include/configs/mx6slevk.h
@@ -131,14 +131,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
-
-#if defined CONFIG_SPI_BOOT
-#define CONFIG_ENV_OFFSET               (768 * 1024)
-#define CONFIG_ENV_SECT_SIZE            (64 * 1024)
-#else
-#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
-#endif
 
 /* USB Configs */
 #ifdef CONFIG_CMD_USB
diff --git a/include/configs/mx6sllevk.h b/include/configs/mx6sllevk.h
index b96e63198d11..8ae1e0a2e636 100644
--- a/include/configs/mx6sllevk.h
+++ b/include/configs/mx6sllevk.h
@@ -120,12 +120,9 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
 #define CONFIG_SYS_MMC_ENV_PART		0   /* user partition */
 #define CONFIG_MMCROOT			"/dev/mmcblk0p2"  /* USDHC1 */
 
-#define CONFIG_ENV_OFFSET		(12 * SZ_64K)
-
 /* MMC Configs */
 #define CONFIG_SYS_FSL_ESDHC_ADDR	USDHC1_BASE_ADDR
 #define CONFIG_SYS_FSL_USDHC_NUM	3
diff --git a/include/configs/mx6sxsabreauto.h b/include/configs/mx6sxsabreauto.h
index c4d8a8939cf9..0bcf031953f7 100644
--- a/include/configs/mx6sxsabreauto.h
+++ b/include/configs/mx6sxsabreauto.h
@@ -151,9 +151,6 @@
 #define FSL_QSPI_FLASH_NUM		2
 #endif
 
-#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
-#define CONFIG_ENV_SIZE			SZ_8K
-
 #define CONFIG_SYS_FSL_USDHC_NUM	2
 #if defined(CONFIG_ENV_IS_IN_MMC)
 #define CONFIG_SYS_MMC_ENV_DEV		0  /*USDHC3*/
diff --git a/include/configs/mx6sxsabresd.h b/include/configs/mx6sxsabresd.h
index dc4181dbf839..704d9f3dcb89 100644
--- a/include/configs/mx6sxsabresd.h
+++ b/include/configs/mx6sxsabresd.h
@@ -199,9 +199,6 @@
 #endif
 #endif
 
-#define CONFIG_ENV_OFFSET		(14 * SZ_64K)
-#define CONFIG_ENV_SIZE			SZ_8K
-
 #define CONFIG_SYS_FSL_USDHC_NUM	3
 #if defined(CONFIG_ENV_IS_IN_MMC)
 #define CONFIG_SYS_MMC_ENV_DEV		2  /*USDHC4*/
diff --git a/include/configs/mx6ul_14x14_evk.h b/include/configs/mx6ul_14x14_evk.h
index 87f88693c5aa..c21d633ca069 100644
--- a/include/configs/mx6ul_14x14_evk.h
+++ b/include/configs/mx6ul_14x14_evk.h
@@ -157,8 +157,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
 #define CONFIG_SYS_MMC_ENV_DEV		1   /* USDHC2 */
 #define CONFIG_SYS_MMC_ENV_PART		0	/* user area */
 #define CONFIG_MMCROOT			"/dev/mmcblk1p2"  /* USDHC2 */
diff --git a/include/configs/mx6ullevk.h b/include/configs/mx6ullevk.h
index 3bcd0d3ee345..7cce911314b3 100644
--- a/include/configs/mx6ullevk.h
+++ b/include/configs/mx6ullevk.h
@@ -154,9 +154,6 @@
 #define CONFIG_SYS_MMC_ENV_PART		0	/* user area */
 #define CONFIG_MMCROOT			"/dev/mmcblk1p2"  /* USDHC2 */
 
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET		(12 * SZ_64K)
-
 #define CONFIG_IMX_THERMAL
 
 #define CONFIG_IOMUX_LPSR
diff --git a/include/configs/mx7dsabresd.h b/include/configs/mx7dsabresd.h
index e1f92da48ca6..745507571dde 100644
--- a/include/configs/mx7dsabresd.h
+++ b/include/configs/mx7dsabresd.h
@@ -174,7 +174,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
 
 /*
  * If want to use nand, define CONFIG_NAND_MXS and rework board
@@ -190,7 +189,6 @@
 /* DMA stuff, needed for GPMI/MXS NAND support */
 #endif
 
-#define CONFIG_ENV_OFFSET		(12 * SZ_64K)
 #ifdef CONFIG_NAND_MXS
 #define CONFIG_SYS_FSL_USDHC_NUM	1
 #else
diff --git a/include/configs/mx7ulp_evk.h b/include/configs/mx7ulp_evk.h
index 3b023624984d..cdc1a487c494 100644
--- a/include/configs/mx7ulp_evk.h
+++ b/include/configs/mx7ulp_evk.h
@@ -26,9 +26,6 @@
 #define CONFIG_MMCROOT                  "/dev/mmcblk0p2"  /* USDHC1 */
 #define CONFIG_SYS_MMC_IMG_LOAD_PART    1
 
-#define CONFIG_ENV_OFFSET		(12 * SZ_64K)
-#define CONFIG_ENV_SIZE			SZ_8K
-
 /* Using ULP WDOG for reset */
 #define WDOG_BASE_ADDR			WDG1_RBASE
 
diff --git a/include/configs/nas220.h b/include/configs/nas220.h
index bdfa42fd30c2..5251db9389cc 100644
--- a/include/configs/nas220.h
+++ b/include/configs/nas220.h
@@ -50,12 +50,6 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE 0x10000
-#endif
-
-#define CONFIG_ENV_SIZE	0x10000
-#define CONFIG_ENV_OFFSET 0xa0000
 
 /*
  * Default environment variables
diff --git a/include/configs/netgear_cg3100d.h b/include/configs/netgear_cg3100d.h
index e5a96015197b..8d2b3e73a048 100644
--- a/include/configs/netgear_cg3100d.h
+++ b/include/configs/netgear_cg3100d.h
@@ -6,4 +6,3 @@
 #include <configs/bmips_common.h>
 #include <configs/bmips_bcm3380.h>
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/netgear_dgnd3700v2.h b/include/configs/netgear_dgnd3700v2.h
index 3baa17ae6183..779c20700a9a 100644
--- a/include/configs/netgear_dgnd3700v2.h
+++ b/include/configs/netgear_dgnd3700v2.h
@@ -8,4 +8,3 @@
 
 #define CONFIG_REMAKE_ELF
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/nitrogen6x.h b/include/configs/nitrogen6x.h
index 23c370b07c39..9ef6ea90a3f6 100644
--- a/include/configs/nitrogen6x.h
+++ b/include/configs/nitrogen6x.h
@@ -147,14 +147,9 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
 #if defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#elif defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-#define CONFIG_ENV_OFFSET		(768 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(8 * 1024)
 #endif
 
 /*
diff --git a/include/configs/novena.h b/include/configs/novena.h
index fff2396e98f2..c03b8db2bad9 100644
--- a/include/configs/novena.h
+++ b/include/configs/novena.h
@@ -18,7 +18,6 @@
 /* U-Boot general configurations */
 
 /* U-Boot environment */
-#define CONFIG_ENV_SIZE			(16 * 1024)
 /*
  * Environment is on MMC, starting at offset 512KiB from start of the card.
  * Please place first partition at offset 1MiB from the start of the card
@@ -27,9 +26,6 @@
  */
 #ifdef CONFIG_CMD_MMC
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_OFFSET		(512 * 1024)
-#define CONFIG_ENV_OFFSET_REDUND	\
-		(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 #endif
 
 /* Booting Linux */
diff --git a/include/configs/nsa310s.h b/include/configs/nsa310s.h
index eb465e069054..e59ef11e66a7 100644
--- a/include/configs/nsa310s.h
+++ b/include/configs/nsa310s.h
@@ -27,11 +27,6 @@
 #include "mv-common.h"
 
 /* environment variables configuration */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE	0x20000
-#endif
-#define CONFIG_ENV_SIZE		0x20000
-#define CONFIG_ENV_OFFSET	0xe0000
 
 /* default environment variables */
 #define CONFIG_BOOTCOMMAND \
diff --git a/include/configs/nyan-big.h b/include/configs/nyan-big.h
index fca4eb59a4ad..97dd168b0180 100644
--- a/include/configs/nyan-big.h
+++ b/include/configs/nyan-big.h
@@ -21,7 +21,6 @@
 /* Environment in eMMC, at the end of 2nd "boot sector" */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 
 /* Align LCD to 1MB boundary */
 #define CONFIG_LCD_ALIGNMENT	MMU_SECTION_SIZE
diff --git a/include/configs/odroid.h b/include/configs/odroid.h
index 9f2d43e3fa38..77fca32fcaf6 100644
--- a/include/configs/odroid.h
+++ b/include/configs/odroid.h
@@ -48,8 +48,6 @@
 #define CONFIG_SYS_MONITOR_BASE	0x00000000
 
 #define CONFIG_SYS_MMC_ENV_DEV		CONFIG_MMC_DEFAULT_DEV
-#define CONFIG_ENV_SIZE			SZ_16K
-#define CONFIG_ENV_OFFSET		(SZ_1K * 1280) /* 1.25 MiB offset */
 #define CONFIG_ENV_OVERWRITE
 
 /* Partitions name */
diff --git a/include/configs/odroid_xu3.h b/include/configs/odroid_xu3.h
index af6004eaf511..47c30543f8f0 100644
--- a/include/configs/odroid_xu3.h
+++ b/include/configs/odroid_xu3.h
@@ -23,11 +23,6 @@
 #define CONFIG_SYS_MEM_TOP_HIDE		(22UL << 20UL)
 #define CONFIG_TZSW_RESERVED_DRAM_SIZE	CONFIG_SYS_MEM_TOP_HIDE
 
-#undef CONFIG_ENV_SIZE
-#undef CONFIG_ENV_OFFSET
-#define CONFIG_ENV_SIZE			(SZ_1K * 16)
-#define CONFIG_ENV_OFFSET		(SZ_1K * 3136) /* ~3 MiB offset */
-
 #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_LOAD_ADDR - 0x1000000)
 
 #define CONFIG_DEFAULT_CONSOLE		"console=ttySAC2,115200n8\0"
diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
index e8c60838b72b..800e22b486ed 100644
--- a/include/configs/omap3_beagle.h
+++ b/include/configs/omap3_beagle.h
@@ -40,7 +40,6 @@
 #define CONFIG_NAND_OMAP_ECCSCHEME      OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
 #define CONFIG_SYS_NAND_U_BOOT_OFFS     0x80000
 #define CONFIG_SYS_ENV_SECT_SIZE        SZ_128K
-#define CONFIG_ENV_ADDR                 0x260000
 #define CONFIG_ENV_OVERWRITE
 /* NAND: SPL falcon mode configs */
 #if defined(CONFIG_SPL_OS_BOOT)
diff --git a/include/configs/omap3_cairo.h b/include/configs/omap3_cairo.h
index 9e2b7523e5d1..1b1a56d7cd42 100644
--- a/include/configs/omap3_cairo.h
+++ b/include/configs/omap3_cairo.h
@@ -161,7 +161,6 @@
 #define CONFIG_SYS_ONENAND_BASE		ONENAND_MAP
 
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_ADDR			0x260000
 
 /* Defines for SPL */
 
diff --git a/include/configs/omap3_evm.h b/include/configs/omap3_evm.h
index 8e98977de8e8..a04499ec10cc 100644
--- a/include/configs/omap3_evm.h
+++ b/include/configs/omap3_evm.h
@@ -44,7 +44,6 @@
 #define CONFIG_SYS_NAND_ECCBYTES        3
 #define CONFIG_NAND_OMAP_ECCSCHEME      OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
 #define CONFIG_SYS_ENV_SECT_SIZE        SZ_128K
-#define CONFIG_ENV_ADDR                 0x260000
 #define CONFIG_ENV_OVERWRITE
 /* NAND: SPL falcon mode configs */
 #if defined(CONFIG_SPL_OS_BOOT)
diff --git a/include/configs/omap3_logic.h b/include/configs/omap3_logic.h
index 90292ae31211..207cd9399e50 100644
--- a/include/configs/omap3_logic.h
+++ b/include/configs/omap3_logic.h
@@ -198,7 +198,6 @@
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
 
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_ADDR			0x260000
 
 /* Defines for SPL */
 
diff --git a/include/configs/omap3_overo.h b/include/configs/omap3_overo.h
index 38a10e23d917..da67cbbf1ea5 100644
--- a/include/configs/omap3_overo.h
+++ b/include/configs/omap3_overo.h
@@ -155,8 +155,6 @@
 
 #define ONENAND_ENV_OFFSET		0x240000 /* environment starts here */
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_OFFSET		0x240000
-#define CONFIG_ENV_ADDR			0x240000
 
 /* Initial RAM setup */
 #define CONFIG_SYS_INIT_RAM_ADDR	0x4020f800
diff --git a/include/configs/omap3_pandora.h b/include/configs/omap3_pandora.h
index 98f243f4ddde..9e6a8684589b 100644
--- a/include/configs/omap3_pandora.h
+++ b/include/configs/omap3_pandora.h
@@ -61,6 +61,5 @@
 
 
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_ADDR			0x260000
 
 #endif				/* __CONFIG_H */
diff --git a/include/configs/omap3_zoom1.h b/include/configs/omap3_zoom1.h
index 4dc22a7a1994..a4ba7dbcc56b 100644
--- a/include/configs/omap3_zoom1.h
+++ b/include/configs/omap3_zoom1.h
@@ -130,6 +130,5 @@
 #define ONENAND_ENV_OFFSET		0x260000 /* environment starts here */
 
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_ADDR			0x260000
 
 #endif				/* __CONFIG_H */
diff --git a/include/configs/omap4_sdp4430.h b/include/configs/omap4_sdp4430.h
index 1a0f9cace07b..884f45df2256 100644
--- a/include/configs/omap4_sdp4430.h
+++ b/include/configs/omap4_sdp4430.h
@@ -21,6 +21,5 @@
 
 /* ENV related config options */
 #define CONFIG_SYS_MMC_ENV_DEV		1	/* SLOT2: eMMC(1) */
-#define CONFIG_ENV_OFFSET		0xE0000
 
 #endif /* __CONFIG_SDP4430_H */
diff --git a/include/configs/omap5_uevm.h b/include/configs/omap5_uevm.h
index ff811569b99c..53589c03ead8 100644
--- a/include/configs/omap5_uevm.h
+++ b/include/configs/omap5_uevm.h
@@ -32,7 +32,6 @@
 
 /* MMC ENV related defines */
 #define CONFIG_SYS_MMC_ENV_DEV		1	/* SLOT2: eMMC(1) */
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 /* Enhance our eMMC support / experience. */
 #define CONFIG_HSMMC2_8BIT
diff --git a/include/configs/omapl138_lcdk.h b/include/configs/omapl138_lcdk.h
index 1c41e7e97adc..fc5c87cc9ae3 100644
--- a/include/configs/omapl138_lcdk.h
+++ b/include/configs/omapl138_lcdk.h
@@ -117,8 +117,6 @@
  * Flash & Environment
  */
 #ifdef CONFIG_NAND
-#define CONFIG_ENV_OFFSET		0x0 /* Block 0--not used by bootcode */
-#define CONFIG_ENV_SIZE			(128 << 9)
 #define CONFIG_SYS_NAND_4BIT_HW_ECC_OOBFIRST
 #define	CONFIG_SYS_NAND_PAGE_2K
 #define CONFIG_SYS_NAND_CS		3
@@ -215,13 +213,6 @@
 
 /* SD/MMC */
 
-#ifdef CONFIG_ENV_IS_IN_MMC
-#undef CONFIG_ENV_SIZE
-#undef CONFIG_ENV_OFFSET
-#define CONFIG_ENV_SIZE		(16 << 10)	/* 16 KiB */
-#define CONFIG_ENV_OFFSET	(51 << 9)	/* Sector 51 */
-#endif
-
 /* defines for SPL */
 #define CONFIG_SYS_SPL_MALLOC_START	(CONFIG_SYS_TEXT_BASE - \
 						CONFIG_SYS_MALLOC_LEN)
diff --git a/include/configs/openrd.h b/include/configs/openrd.h
index 62d8862cc755..5c59cabc0885 100644
--- a/include/configs/openrd.h
+++ b/include/configs/openrd.h
@@ -33,15 +33,10 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE		0x20000	/* 128K */
-#endif
 /*
  * max 4k env size is enough, but in case of nand
  * it has to be rounded to sector size
  */
-#define CONFIG_ENV_SIZE			0x20000	/* 128k */
-#define CONFIG_ENV_OFFSET		0x80000	/* env starts here */
 /*
  * Environment is right behind U-Boot in flash. Make sure U-Boot
  * doesn't grow into the environment area.
diff --git a/include/configs/opos6uldev.h b/include/configs/opos6uldev.h
index f80e34729a69..3ef5ebbac793 100644
--- a/include/configs/opos6uldev.h
+++ b/include/configs/opos6uldev.h
@@ -61,9 +61,6 @@
 /* Environment is stored in the eMMC boot partition */
 #define CONFIG_SYS_MMC_ENV_DEV          0
 #define CONFIG_SYS_MMC_ENV_PART         1
-#define CONFIG_ENV_SIZE                 (10 * 1024)
-#define CONFIG_ENV_OFFSET               (1024 * 1024) /* 1 MB */
-#define CONFIG_ENV_OFFSET_REDUND        (1536 * 1024) /* 512KB from CONFIG_ENV_OFFSET */
 
 #define CONFIG_ENV_VERSION	100
 #define CONFIG_BOARD_NAME	opos6ul
diff --git a/include/configs/origen.h b/include/configs/origen.h
index 44561acbf4a6..ff9318a81b8f 100644
--- a/include/configs/origen.h
+++ b/include/configs/origen.h
@@ -80,10 +80,8 @@
 #define CONFIG_MIU_2BIT_21_7_INTERLEAVED
 
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			(16 << 10)	/* 16 KB */
 #define RESERVE_BLOCK_SIZE		(512)
 #define BL1_SIZE			(16 << 10) /*16 K reserved for BL1*/
-#define CONFIG_ENV_OFFSET		(RESERVE_BLOCK_SIZE + BL1_SIZE)
 
 #define CONFIG_SPL_MAX_FOOTPRINT	(14 * 1024)
 
diff --git a/include/configs/ot1200.h b/include/configs/ot1200.h
index 4efef892a840..c8ebe3e390d9 100644
--- a/include/configs/ot1200.h
+++ b/include/configs/ot1200.h
@@ -92,10 +92,7 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE                 (64 * 1024)	/* 64 kb */
-#define CONFIG_ENV_OFFSET               (1024 * 1024)
 /* M25P16 has an erase size of 64 KiB */
-#define CONFIG_ENV_SECT_SIZE            (64 * 1024)
 
 #define CONFIG_BOOTP_SERVERIP
 #define CONFIG_BOOTP_BOOTFILE
diff --git a/include/configs/p1_p2_rdb_pc.h b/include/configs/p1_p2_rdb_pc.h
index 1481d683e5c3..39cec354d899 100644
--- a/include/configs/p1_p2_rdb_pc.h
+++ b/include/configs/p1_p2_rdb_pc.h
@@ -696,30 +696,16 @@
 /*
  * Environment
  */
-#ifdef CONFIG_SPIFLASH
-#define CONFIG_ENV_SIZE		0x2000	/* 8KB */
-#define CONFIG_ENV_OFFSET	0x100000	/* 1MB */
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#elif defined(CONFIG_SDCARD)
+#if defined(CONFIG_SDCARD)
 #define CONFIG_FSL_FIXED_MMC_LOCATION
-#define CONFIG_ENV_SIZE		0x2000
 #define CONFIG_SYS_MMC_ENV_DEV	0
 #elif defined(CONFIG_NAND)
+#define CONFIG_ENV_RANGE	(3 * CONFIG_ENV_SIZE)
 #ifdef CONFIG_TPL_BUILD
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_INIT_L2_ADDR + (160 << 10))
-#else
-#define CONFIG_ENV_SIZE		CONFIG_SYS_NAND_BLOCK_SIZE
+#define SPL_ENV_ADDR		(CONFIG_SYS_INIT_L2_ADDR + (160 << 10))
 #endif
-#define CONFIG_ENV_OFFSET	(1024 * 1024)
-#define CONFIG_ENV_RANGE	(3 * CONFIG_ENV_SIZE)
 #elif defined(CONFIG_SYS_RAMBOOT)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE		0x2000
-#else
-#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
+#define SPL_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
 #endif
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
diff --git a/include/configs/p1_twr.h b/include/configs/p1_twr.h
index 1e0708a71bda..3ff75663ea16 100644
--- a/include/configs/p1_twr.h
+++ b/include/configs/p1_twr.h
@@ -322,16 +322,8 @@ extern unsigned long get_board_sys_clk(unsigned long dummy);
  */
 #ifdef CONFIG_SYS_RAMBOOT
 #ifdef CONFIG_RAMBOOT_SDCARD
-#define CONFIG_ENV_SIZE		0x2000
 #define CONFIG_SYS_MMC_ENV_DEV	0
-#else
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-#define CONFIG_ENV_SIZE		0x2000
 #endif
-#else
-#define CONFIG_ENV_ADDR	(CONFIG_SYS_MONITOR_BASE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K (one sector) */
 #endif
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
diff --git a/include/configs/p2371-0000.h b/include/configs/p2371-0000.h
index 177e8d8dfea8..8e3e1a77f5ae 100644
--- a/include/configs/p2371-0000.h
+++ b/include/configs/p2371-0000.h
@@ -20,7 +20,6 @@
 /* Environment in eMMC, at the end of 2nd "boot sector" */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 
 /* SPI */
 #define CONFIG_SPI_FLASH_SIZE		(4 << 20)
diff --git a/include/configs/p2371-2180.h b/include/configs/p2371-2180.h
index 7205a17e5d8d..7998eabd30cb 100644
--- a/include/configs/p2371-2180.h
+++ b/include/configs/p2371-2180.h
@@ -20,7 +20,6 @@
 /* Environment in eMMC, at the end of 2nd "boot sector" */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 
 /* SPI */
 #define CONFIG_SPI_FLASH_SIZE		(4 << 20)
diff --git a/include/configs/p2571.h b/include/configs/p2571.h
index 02db6bb79fb3..e7b860a30ec4 100644
--- a/include/configs/p2571.h
+++ b/include/configs/p2571.h
@@ -21,7 +21,6 @@
 /* Environment in eMMC, at the end of 2nd "boot sector" */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 
 /* SPI */
 #define CONFIG_SPI_FLASH_SIZE		(4 << 20)
diff --git a/include/configs/p2771-0000.h b/include/configs/p2771-0000.h
index e546c1d73fd2..7c6d68a4f11a 100644
--- a/include/configs/p2771-0000.h
+++ b/include/configs/p2771-0000.h
@@ -16,7 +16,6 @@
 /* Environment in eMMC, at the end of 2nd "boot sector" */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 
 #define BOARD_EXTRA_ENV_SETTINGS \
 	"calculated_vars=kernel_addr_r fdt_addr_r scriptaddr pxefile_addr_r " \
diff --git a/include/configs/paz00.h b/include/configs/paz00.h
index b76958c36d80..ae8e0dee2cd1 100644
--- a/include/configs/paz00.h
+++ b/include/configs/paz00.h
@@ -22,7 +22,6 @@
 #define CONFIG_MACH_TYPE		MACH_TYPE_PAZ00
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET (-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 #define CONFIG_SYS_MMC_ENV_PART 2
 
diff --git a/include/configs/pcl063.h b/include/configs/pcl063.h
index 943fca937764..238b03f600eb 100644
--- a/include/configs/pcl063.h
+++ b/include/configs/pcl063.h
@@ -54,9 +54,6 @@
 #define CONFIG_SYS_INIT_SP_ADDR \
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
-#define CONFIG_ENV_SIZE			(16 << 10)
-#define CONFIG_ENV_OFFSET		(512 << 10)
-
 /* NAND */
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 #define CONFIG_SYS_NAND_BASE		0x40000000
diff --git a/include/configs/pcl063_ull.h b/include/configs/pcl063_ull.h
index 23e491236cb4..d2459874706a 100644
--- a/include/configs/pcl063_ull.h
+++ b/include/configs/pcl063_ull.h
@@ -21,10 +21,6 @@
 #define CONFIG_SYS_MALLOC_LEN		(16 * SZ_1M)
 
 /* Environment settings */
-#define CONFIG_ENV_SIZE			(0x4000)
-#define CONFIG_ENV_OFFSET		(0x80000)
-#define CONFIG_ENV_OFFSET_REDUND	\
-	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 /* Environment in SD */
 #define CONFIG_SYS_MMC_ENV_DEV		0
diff --git a/include/configs/pcm052.h b/include/configs/pcm052.h
index b68d205bfb3a..72f8d08a665c 100644
--- a/include/configs/pcm052.h
+++ b/include/configs/pcm052.h
@@ -168,17 +168,7 @@
 
 /* environment organization */
 #ifdef CONFIG_ENV_IS_IN_MMC
-#define CONFIG_ENV_SIZE			(SZ_8K)
-
-#define CONFIG_ENV_OFFSET		(12 * SZ_64K)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #endif
 
-#ifdef CONFIG_ENV_IS_IN_NAND
-#define CONFIG_ENV_SECT_SIZE		(SZ_128K)
-#define CONFIG_ENV_SIZE			(SZ_8K)
-#define CONFIG_ENV_OFFSET		0xA0000
-#define CONFIG_ENV_OFFSET_REDUND	0xC0000
-#endif
-
 #endif
diff --git a/include/configs/pcm058.h b/include/configs/pcm058.h
index 6c4a619433b6..7c27ebb811da 100644
--- a/include/configs/pcm058.h
+++ b/include/configs/pcm058.h
@@ -73,15 +73,5 @@
 #define CONFIG_SYS_FSL_USDHC_NUM	1
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE                (16 * 1024)
-#define CONFIG_ENV_OFFSET		(1024 * SZ_1K)
-#define CONFIG_ENV_SECT_SIZE		(64 * SZ_1K)
-#define CONFIG_ENV_OFFSET_REDUND       (CONFIG_ENV_OFFSET + \
-						CONFIG_ENV_SECT_SIZE)
-
-#ifdef CONFIG_ENV_IS_IN_NAND
-#define CONFIG_ENV_OFFSET              (0x1E0000)
-#define CONFIG_ENV_SECT_SIZE           (128 * SZ_1K)
-#endif
 
 #endif
diff --git a/include/configs/pdu001.h b/include/configs/pdu001.h
index e4c2872fe955..78a1a86431ce 100644
--- a/include/configs/pdu001.h
+++ b/include/configs/pdu001.h
@@ -13,7 +13,6 @@
 #include <configs/ti_am335x_common.h>
 
 /* Using 32K of volatile storage for environment */
-#define CONFIG_ENV_SIZE		0x4000
 
 #define MACH_TYPE_PDU001	5075
 #define CONFIG_MACH_TYPE	MACH_TYPE_PDU001
diff --git a/include/configs/pengwyn.h b/include/configs/pengwyn.h
index a535d0c2f2d0..8a0506911d27 100644
--- a/include/configs/pengwyn.h
+++ b/include/configs/pengwyn.h
@@ -18,7 +18,6 @@
 #define V_SCLK				V_OSCK
 
 /* set env size */
-#define CONFIG_ENV_SIZE			0x4000
 
 #ifndef CONFIG_SPL_BUILD
 #define CONFIG_EXTRA_ENV_SETTINGS \
@@ -144,7 +143,6 @@
 #define CONFIG_SYS_NAND_U_BOOT_OFFS	0x200000
 
 /* Size must be a multiple of Nand erase size (524288 b) */
-#define CONFIG_ENV_OFFSET		0x260000 /* environment starts here */
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
 /* NAND: SPL falcon mode configs */
 #ifdef CONFIG_SPL_OS_BOOT
diff --git a/include/configs/pfla02.h b/include/configs/pfla02.h
index a4d0e4898a48..d4a7de7df6a2 100644
--- a/include/configs/pfla02.h
+++ b/include/configs/pfla02.h
@@ -74,16 +74,6 @@
 #define CONFIG_SYS_FSL_USDHC_NUM	2
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE                (16 * 1024)
-#define CONFIG_ENV_OFFSET		(1024 * SZ_1K)
-#define CONFIG_ENV_SECT_SIZE		(64 * SZ_1K)
-#define CONFIG_ENV_OFFSET_REDUND       (CONFIG_ENV_OFFSET + \
-						CONFIG_ENV_SECT_SIZE)
-
-#ifdef CONFIG_ENV_IS_IN_NAND
-#define CONFIG_ENV_OFFSET              (0x1E0000)
-#define CONFIG_ENV_SECT_SIZE           (128 * SZ_1K)
-#endif
 
 /* Default environment */
 #define CONFIG_EXTRA_ENV_SETTINGS \
diff --git a/include/configs/pic32mzdask.h b/include/configs/pic32mzdask.h
index d3ab5575ee70..2f641d3831de 100644
--- a/include/configs/pic32mzdask.h
+++ b/include/configs/pic32mzdask.h
@@ -74,7 +74,6 @@
 /* -------------------------------------------------
  * Environment
  */
-#define CONFIG_ENV_SIZE		0x4000
 
 /* ---------------------------------------------------------------------
  * Board boot configuration
diff --git a/include/configs/pico-imx6.h b/include/configs/pico-imx6.h
index 5bbb9ea8f701..376370b07de2 100644
--- a/include/configs/pico-imx6.h
+++ b/include/configs/pico-imx6.h
@@ -125,10 +125,8 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
 /* Environment starts at 768k = 768 * 1024 = 786432 */
-#define CONFIG_ENV_OFFSET		786432
 /*
  * Detect overlap between U-Boot image and environment area in build-time
  *
diff --git a/include/configs/pico-imx6ul.h b/include/configs/pico-imx6ul.h
index 22dfac7fec05..27e83b47cd63 100644
--- a/include/configs/pico-imx6ul.h
+++ b/include/configs/pico-imx6ul.h
@@ -135,9 +135,7 @@
 #define CONFIG_SYS_I2C_SPEED		100000
 
 /* environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
 /* Environment starts at 768k = 768 * 1024 = 786432 */
-#define CONFIG_ENV_OFFSET		786432
 /*
  * Detect overlap between U-Boot image and environment area in build-time
  *
diff --git a/include/configs/pico-imx7d.h b/include/configs/pico-imx7d.h
index 607784e42363..1d0df9dd447f 100644
--- a/include/configs/pico-imx7d.h
+++ b/include/configs/pico-imx7d.h
@@ -164,10 +164,8 @@
 #endif
 
 /* FLASH and environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
 
 /* Environment starts at 768k = 768 * 1024 = 786432 */
-#define CONFIG_ENV_OFFSET		786432
 /*
  * Detect overlap between U-Boot image and environment area in build-time
  *
diff --git a/include/configs/picosam9g45.h b/include/configs/picosam9g45.h
index ad41d161493a..cb8338f38477 100644
--- a/include/configs/picosam9g45.h
+++ b/include/configs/picosam9g45.h
@@ -91,7 +91,6 @@
 
 #ifdef CONFIG_SYS_USE_MMC
 /* bootstrap + u-boot + env + linux in mmc */
-#define CONFIG_ENV_SIZE		0x4000
 
 #define CONFIG_BOOTCOMMAND	"fatload mmc 0:1 0x21000000 dtb; " \
 				"fatload mmc 0:1 0x22000000 zImage; " \
diff --git a/include/configs/platinum.h b/include/configs/platinum.h
index 58e590a1fd3b..210927f4de00 100644
--- a/include/configs/platinum.h
+++ b/include/configs/platinum.h
@@ -74,16 +74,10 @@
 /* DMA config, needed for GPMI/MXS NAND support */
 
 /* Environment in NAND */
-#define CONFIG_ENV_OFFSET		(16 << 20)
-#define CONFIG_ENV_SECT_SIZE		(128 << 10)
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + (512 << 10))
 
 #else /* CONFIG_CMD_NAND */
 
 /* Environment in MMC */
-#define CONFIG_ENV_SIZE			(8 << 10)
-#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 #endif /* CONFIG_CMD_NAND */
diff --git a/include/configs/plutux.h b/include/configs/plutux.h
index 43856bad2c1a..7fc06e8326bb 100644
--- a/include/configs/plutux.h
+++ b/include/configs/plutux.h
@@ -23,7 +23,6 @@
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 
 /* Environment in NAND, aligned to start of last sector */
-#define CONFIG_ENV_OFFSET		(SZ_512M - SZ_128K) /* 128K sectors */
 
 #include "tegra-common-post.h"
 
diff --git a/include/configs/pm9261.h b/include/configs/pm9261.h
index 99ca1f730e60..f958ceb30531 100644
--- a/include/configs/pm9261.h
+++ b/include/configs/pm9261.h
@@ -203,9 +203,6 @@
 #ifdef CONFIG_SYS_USE_DATAFLASH_CS0
 
 /* bootstrap + u-boot + env + linux in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 #define CONFIG_BOOTCOMMAND	"sf probe 0; " \
 				"sf read 0x22000000 0x84000 0x210000; " \
 				"bootm 0x22000000"
@@ -213,16 +210,10 @@
 #elif defined(CONFIG_SYS_USE_NANDFLASH) /* CONFIG_SYS_USE_NANDFLASH */
 
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET		0x60000
-#define CONFIG_ENV_OFFSET_REDUND	0x80000
-#define CONFIG_ENV_SIZE			0x20000		/* 1 sector = 128 kB */
 #define CONFIG_BOOTCOMMAND	"nand read 0x22000000 0xA0000 0x200000; bootm"
 
 #elif defined (CONFIG_SYS_USE_FLASH)
 
-#define CONFIG_ENV_OFFSET	0x40000
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#define	CONFIG_ENV_SIZE		0x10000
 #define CONFIG_ENV_OVERWRITE	1
 
 /* JFFS Partition offset set */
diff --git a/include/configs/pm9263.h b/include/configs/pm9263.h
index 595acf1b9434..50d953a8e891 100644
--- a/include/configs/pm9263.h
+++ b/include/configs/pm9263.h
@@ -232,9 +232,6 @@
 #ifdef CONFIG_SYS_USE_DATAFLASH
 
 /* bootstrap + u-boot + env + linux in dataflash on CS0 */
-#define CONFIG_ENV_OFFSET	0x4200
-#define CONFIG_ENV_SIZE		0x4200
-#define CONFIG_ENV_SECT_SIZE	0x210
 #define CONFIG_BOOTCOMMAND	"sf probe 0; " \
 				"sf read 0x22000000 0x84000 0x294000; " \
 				"bootm 0x22000000"
@@ -242,16 +239,10 @@
 #elif defined(CONFIG_SYS_USE_NANDFLASH) /* CFG_USE_NANDFLASH */
 
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET		0x60000
-#define CONFIG_ENV_OFFSET_REDUND	0x80000
-#define CONFIG_ENV_SIZE		0x20000		/* 1 sector = 128 kB */
 #define CONFIG_BOOTCOMMAND	"nand read 0x22000000 0xA0000 0x200000; bootm"
 
 #elif defined(CONFIG_SYS_USE_FLASH) /* CFG_USE_FLASH */
 
-#define CONFIG_ENV_OFFSET	0x40000
-#define CONFIG_ENV_SECT_SIZE	0x10000
-#define	CONFIG_ENV_SIZE		0x10000
 #define CONFIG_ENV_OVERWRITE	1
 
 /* JFFS Partition offset set */
diff --git a/include/configs/pm9g45.h b/include/configs/pm9g45.h
index ae87f9be7920..8c181e64afdb 100644
--- a/include/configs/pm9g45.h
+++ b/include/configs/pm9g45.h
@@ -64,16 +64,12 @@
 
 #ifdef CONFIG_NAND_BOOT
 /* bootstrap + u-boot + env in nandflash */
-#define CONFIG_ENV_OFFSET		0x140000
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
-#define CONFIG_ENV_SIZE			0x20000
 
 #define CONFIG_BOOTCOMMAND						\
 	"nand read 0x70000000 0x200000 0x300000;"			\
 	"bootm 0x70000000"
 #elif CONFIG_SD_BOOT
 /* bootstrap + u-boot + env + linux in mmc */
-#define CONFIG_ENV_SIZE		0x4000
 
 #define CONFIG_BOOTCOMMAND	"fatload mmc 0:1 0x71000000 dtb; " \
 				"fatload mmc 0:1 0x72000000 zImage; " \
diff --git a/include/configs/pogo_e02.h b/include/configs/pogo_e02.h
index 68d726835ca8..bb24739a9083 100644
--- a/include/configs/pogo_e02.h
+++ b/include/configs/pogo_e02.h
@@ -37,12 +37,6 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE		0x20000	/* 128K */
-#endif
-
-#define CONFIG_ENV_SIZE			0x20000	/* 128k */
-#define CONFIG_ENV_OFFSET		0x60000	/* env starts here */
 
 /*
  * Default environment variables
diff --git a/include/configs/poplar.h b/include/configs/poplar.h
index be9a0b51a96f..81c7f251bcca 100644
--- a/include/configs/poplar.h
+++ b/include/configs/poplar.h
@@ -54,8 +54,6 @@
 
 /* Command line configuration */
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_OFFSET		(0xf80 * 512) /* env_mmc_blknum bytes */
-#define CONFIG_ENV_SIZE			(0x80 * 512)  /* env_mmc_nblks bytes */
 
 /* Monitor Command Prompt */
 #define CONFIG_SYS_CBSIZE		512
diff --git a/include/configs/puma_rk3399.h b/include/configs/puma_rk3399.h
index 4d6085d2dd83..27a8a7d9c3af 100644
--- a/include/configs/puma_rk3399.h
+++ b/include/configs/puma_rk3399.h
@@ -10,8 +10,6 @@
 
 #if defined(CONFIG_ENV_IS_IN_MMC)
 #define CONFIG_SYS_MMC_ENV_DEV 1
-#elif defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-#define CONFIG_ENV_SECT_SIZE		(8 * 1024)
 #endif
 
 #define SDRAM_BANK_SIZE			(2UL << 30)
diff --git a/include/configs/pumpkin.h b/include/configs/pumpkin.h
index b2dda642ccb9..35e28be950ca 100644
--- a/include/configs/pumpkin.h
+++ b/include/configs/pumpkin.h
@@ -11,7 +11,6 @@
 
 #include <linux/sizes.h>
 
-#define CONFIG_ENV_SIZE			SZ_4K
 #define CONFIG_SYS_LOAD_ADDR		CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_MALLOC_LEN		SZ_4M
 
diff --git a/include/configs/qemu-arm.h b/include/configs/qemu-arm.h
index c7aaafaad468..fb599c951022 100644
--- a/include/configs/qemu-arm.h
+++ b/include/configs/qemu-arm.h
@@ -21,8 +21,6 @@
 #define CONFIG_SYS_HZ                       1000
 
 /* Environment options */
-#define CONFIG_ENV_ADDR			0x4000000
-#define CONFIG_ENV_SIZE			SZ_256K
 
 #define BOOT_TARGET_DEVICES(func) \
 	func(USB, usb, 0) \
diff --git a/include/configs/qemu-mips.h b/include/configs/qemu-mips.h
index 193782939481..42a25623c37b 100644
--- a/include/configs/qemu-mips.h
+++ b/include/configs/qemu-mips.h
@@ -90,8 +90,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	128
 
 /* Address and size of Primary Environment Sector */
-#define CONFIG_ENV_SIZE		0x8000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + (4 << 20) - CONFIG_ENV_SIZE)
 
 #define CONFIG_ENV_OVERWRITE	1
 
diff --git a/include/configs/qemu-mips64.h b/include/configs/qemu-mips64.h
index fe384ec84e78..e4a78fbddadd 100644
--- a/include/configs/qemu-mips64.h
+++ b/include/configs/qemu-mips64.h
@@ -90,8 +90,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	128
 
 /* Address and size of Primary Environment Sector */
-#define CONFIG_ENV_SIZE		0x8000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + (4 << 20) - CONFIG_ENV_SIZE)
 
 #define CONFIG_ENV_OVERWRITE	1
 
diff --git a/include/configs/qemu-ppce500.h b/include/configs/qemu-ppce500.h
index 424235e7774a..47fb18169324 100644
--- a/include/configs/qemu-ppce500.h
+++ b/include/configs/qemu-ppce500.h
@@ -107,7 +107,6 @@ extern unsigned long long get_phys_ccsrbar_addr_early(void);
 /*
  * Environment
  */
-#define CONFIG_ENV_SIZE		0x2000
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
 
diff --git a/include/configs/qemu-riscv.h b/include/configs/qemu-riscv.h
index fa9b9af93461..5fe9dcfc58f8 100644
--- a/include/configs/qemu-riscv.h
+++ b/include/configs/qemu-riscv.h
@@ -32,7 +32,6 @@
 #define CONFIG_STANDALONE_LOAD_ADDR	0x80200000
 
 /* Environment options */
-#define CONFIG_ENV_SIZE			SZ_128K
 
 #ifndef CONFIG_SPL_BUILD
 #define BOOT_TARGET_DEVICES(func) \
diff --git a/include/configs/qemu-x86.h b/include/configs/qemu-x86.h
index c5574201dd68..49e307b43006 100644
--- a/include/configs/qemu-x86.h
+++ b/include/configs/qemu-x86.h
@@ -22,9 +22,6 @@
 #include <config_distro_bootcmd.h>
 #include <configs/x86-common.h>
 
-#undef CONFIG_ENV_SIZE
-#define CONFIG_ENV_SIZE			SZ_256K
-
 #define CONFIG_PREBOOT "pci enum"
 
 #define CONFIG_SYS_MONITOR_LEN		(1 << 20)
diff --git a/include/configs/r2dplus.h b/include/configs/r2dplus.h
index 0b16fb0f64ec..afa446f53a4b 100644
--- a/include/configs/r2dplus.h
+++ b/include/configs/r2dplus.h
@@ -36,10 +36,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT  256
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE }
 
-#define CONFIG_ENV_SECT_SIZE	0x40000
-#define CONFIG_ENV_SIZE        (CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_ADDR        (CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-
 /*
  * SuperH Clock setting
  */
diff --git a/include/configs/r7780mp.h b/include/configs/r7780mp.h
index 6ea7f38a176d..b562308db8bf 100644
--- a/include/configs/r7780mp.h
+++ b/include/configs/r7780mp.h
@@ -61,9 +61,6 @@
 /* print 'E' for empty sector on flinfo */
 #define CONFIG_SYS_FLASH_EMPTY_INFO
 
-#define CONFIG_ENV_SECT_SIZE	(256 * 1024)
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
 #define CONFIG_SYS_FLASH_ERASE_TOUT	120000
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500
 
diff --git a/include/configs/rastaban.h b/include/configs/rastaban.h
index c34b68a374f7..bd5e00e10cdf 100644
--- a/include/configs/rastaban.h
+++ b/include/configs/rastaban.h
@@ -46,7 +46,6 @@
 #define CONFIG_FACTORYSET
 
 /* Define own nand partitions */
-#define CONFIG_ENV_OFFSET_REDUND	0x2E0000
 #define CONFIG_ENV_RANGE		(4 * CONFIG_SYS_ENV_SECT_SIZE)
 
 #ifndef CONFIG_SPL_BUILD
diff --git a/include/configs/rcar-gen2-common.h b/include/configs/rcar-gen2-common.h
index 3a763336ed17..b6c5cad43384 100644
--- a/include/configs/rcar-gen2-common.h
+++ b/include/configs/rcar-gen2-common.h
@@ -36,13 +36,9 @@
 #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
 
 /* ENV setting */
-#define CONFIG_ENV_ADDR	0xC0000
 
 /* Common ENV setting */
 #define CONFIG_ENV_OVERWRITE
-#define CONFIG_ENV_SECT_SIZE	(256 * 1024)
-#define CONFIG_ENV_OFFSET	(CONFIG_ENV_ADDR)
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
 
 /* SF MTD */
 #ifdef CONFIG_SPL_BUILD
diff --git a/include/configs/rcar-gen3-common.h b/include/configs/rcar-gen3-common.h
index 0f7a00f95782..520da5027ef2 100644
--- a/include/configs/rcar-gen3-common.h
+++ b/include/configs/rcar-gen3-common.h
@@ -52,8 +52,6 @@
 
 /* ENV setting */
 #define CONFIG_ENV_OVERWRITE
-#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_EXTRA_ENV_SETTINGS	\
 	"bootm_size=0x10000000\0"
diff --git a/include/configs/rpi.h b/include/configs/rpi.h
index 77d2d5458a1f..c03bad811ba9 100644
--- a/include/configs/rpi.h
+++ b/include/configs/rpi.h
@@ -74,7 +74,6 @@
 #define CONFIG_SYS_CBSIZE		1024
 
 /* Environment */
-#define CONFIG_ENV_SIZE			SZ_16K
 #define CONFIG_SYS_LOAD_ADDR		0x1000000
 
 /* Shell */
diff --git a/include/configs/s32v234evb.h b/include/configs/s32v234evb.h
index cc6d9206373c..53c94ed70e6f 100644
--- a/include/configs/s32v234evb.h
+++ b/include/configs/s32v234evb.h
@@ -178,9 +178,7 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
-#define CONFIG_ENV_OFFSET		(12 * 64 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 
diff --git a/include/configs/s5p_goni.h b/include/configs/s5p_goni.h
index be6f011ab058..20538df0252b 100644
--- a/include/configs/s5p_goni.h
+++ b/include/configs/s5p_goni.h
@@ -165,8 +165,6 @@
 /* FLASH and environment organization */
 #define CONFIG_MMC_DEFAULT_DEV	0
 #define CONFIG_SYS_MMC_ENV_DEV		CONFIG_MMC_DEFAULT_DEV
-#define CONFIG_ENV_SIZE			4096
-#define CONFIG_ENV_OFFSET		((32 - 4) << 10) /* 32KiB - 4KiB */
 #define CONFIG_ENV_OVERWRITE
 
 #define CONFIG_USE_ONENAND_BOARD_INIT
diff --git a/include/configs/s5pc210_universal.h b/include/configs/s5pc210_universal.h
index 832032da1853..ec9abaf584ed 100644
--- a/include/configs/s5pc210_universal.h
+++ b/include/configs/s5pc210_universal.h
@@ -56,8 +56,6 @@
 #define CONFIG_UBIBLOCK		"9"
 
 #define CONFIG_SYS_MMC_ENV_DEV		CONFIG_MMC_DEFAULT_DEV
-#define CONFIG_ENV_SIZE			4096
-#define CONFIG_ENV_OFFSET		((32 - 4) << 10) /* 32KiB - 4KiB */
 
 #define CONFIG_ENV_UBIFS_OPTION	" rootflags=bulk_read,no_chk_data_crc "
 #define CONFIG_ENV_FLASHBOOT	CONFIG_ENV_UBI_MTD CONFIG_ENV_UBIFS_OPTION \
diff --git a/include/configs/sagem_f@st1704.h b/include/configs/sagem_f@st1704.h
index 5a526d9d8b32..e5bb4e50d123 100644
--- a/include/configs/sagem_f@st1704.h
+++ b/include/configs/sagem_f@st1704.h
@@ -6,4 +6,3 @@
 #include <configs/bmips_common.h>
 #include <configs/bmips_bcm6338.h>
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/salvator-x.h b/include/configs/salvator-x.h
index 1bf223491882..669602eb60eb 100644
--- a/include/configs/salvator-x.h
+++ b/include/configs/salvator-x.h
@@ -19,7 +19,6 @@
 #define COUNTER_FREQUENCY	0xFE502A	/* 16.66MHz from CPclk */
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		1
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/sam9x60ek.h b/include/configs/sam9x60ek.h
index 5f89ae4a511a..3dda8696e4f7 100644
--- a/include/configs/sam9x60ek.h
+++ b/include/configs/sam9x60ek.h
@@ -73,7 +73,6 @@
 
 #elif defined(CONFIG_NAND_BOOT)
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET_REDUND	0x100000
 #define CONFIG_BOOTCOMMAND	"nand read " \
 				"0x22000000 0x200000 0x600000; " \
 				"nand read 0x21000000 0x180000 0x20000; " \
diff --git a/include/configs/sandbox.h b/include/configs/sandbox.h
index 5d75021ed6b7..1c13055cdc05 100644
--- a/include/configs/sandbox.h
+++ b/include/configs/sandbox.h
@@ -37,8 +37,6 @@
 
 /* turn on command-line edit/c/auto */
 
-#define CONFIG_ENV_SIZE		8192
-
 /* SPI - enable all SPI flash types for testing purposes */
 
 #define CONFIG_I2C_EDID
diff --git a/include/configs/sansa_fuze_plus.h b/include/configs/sansa_fuze_plus.h
index 1beff234db17..555b5ce68681 100644
--- a/include/configs/sansa_fuze_plus.h
+++ b/include/configs/sansa_fuze_plus.h
@@ -13,7 +13,6 @@
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 
 /* Environment */
-#define CONFIG_ENV_SIZE			(16 * 1024)
 #define CONFIG_ENV_OVERWRITE
 
 /* Booting Linux */
diff --git a/include/configs/sbc8349.h b/include/configs/sbc8349.h
index 01d480288578..9d6558483882 100644
--- a/include/configs/sbc8349.h
+++ b/include/configs/sbc8349.h
@@ -223,16 +223,7 @@
  * Environment
  */
 #ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0x40000)
-	#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-	#define CONFIG_ENV_SIZE		0x2000
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
-
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
 #endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
diff --git a/include/configs/sbc8548.h b/include/configs/sbc8548.h
index 6aa40caa7c3d..f4113e03c464 100644
--- a/include/configs/sbc8548.h
+++ b/include/configs/sbc8548.h
@@ -462,20 +462,6 @@
 #define CONFIG_ETHPRIME		"eTSEC0"
 #endif	/* CONFIG_TSEC_ENET */
 
-/*
- * Environment
- */
-#define CONFIG_ENV_SIZE		0x2000
-#if CONFIG_SYS_TEXT_BASE == 0xfff00000	/* Boot from 64MB SODIMM */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0x80000)
-#define CONFIG_ENV_SECT_SIZE	0x80000	/* 512K(one sector) for env */
-#elif CONFIG_SYS_TEXT_BASE == 0xfffa0000	/* Boot from 8MB soldered flash */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0x40000)
-#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-#else
-#warning undefined environment size/location.
-#endif
-
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
 
diff --git a/include/configs/sbc8641d.h b/include/configs/sbc8641d.h
index d1535b6facc7..011e5736e272 100644
--- a/include/configs/sbc8641d.h
+++ b/include/configs/sbc8641d.h
@@ -426,9 +426,6 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128k(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/sc_sps_1.h b/include/configs/sc_sps_1.h
index cc108920dc6a..8db2772d7580 100644
--- a/include/configs/sc_sps_1.h
+++ b/include/configs/sc_sps_1.h
@@ -19,11 +19,9 @@
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 
 /* Environment */
-#define CONFIG_ENV_SIZE			(16 * 1024)
 
 /* Environment is in MMC */
 #if defined(CONFIG_CMD_MMC) && defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET		(256 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #endif
 
diff --git a/include/configs/seaboard.h b/include/configs/seaboard.h
index 5df013b0b321..857e2e349e2b 100644
--- a/include/configs/seaboard.h
+++ b/include/configs/seaboard.h
@@ -27,7 +27,6 @@
 #define CONFIG_MACH_TYPE		MACH_TYPE_SEABOARD
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET (-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 #define CONFIG_SYS_MMC_ENV_PART 2
 
diff --git a/include/configs/secomx6quq7.h b/include/configs/secomx6quq7.h
index 2d219b2b5fe1..20acc4036348 100644
--- a/include/configs/secomx6quq7.h
+++ b/include/configs/secomx6quq7.h
@@ -77,10 +77,8 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
 #if defined(CONFIG_ENV_IS_IN_MMC)
-	#define CONFIG_ENV_OFFSET		(6 * 128 * 1024)
 	#define CONFIG_SYS_MMC_ENV_DEV		0
 	#define CONFIG_DYNAMIC_MMC_DEVNO
 #endif
diff --git a/include/configs/sfr_nb4_ser.h b/include/configs/sfr_nb4_ser.h
index 2aa5c6664325..529fc9495ef4 100644
--- a/include/configs/sfr_nb4_ser.h
+++ b/include/configs/sfr_nb4_ser.h
@@ -8,4 +8,3 @@
 
 #define CONFIG_REMAKE_ELF
 
-#define CONFIG_ENV_SIZE	SZ_8K
diff --git a/include/configs/sh7752evb.h b/include/configs/sh7752evb.h
index 02c5143491a6..3a1f1ac288c1 100644
--- a/include/configs/sh7752evb.h
+++ b/include/configs/sh7752evb.h
@@ -62,11 +62,7 @@
 #define CONFIG_SH_MMCIF_CLK		48000000
 
 /* ENV setting */
-#define CONFIG_ENV_SECT_SIZE	(64 * 1024)
-#define CONFIG_ENV_ADDR		(0x00080000)
-#define CONFIG_ENV_OFFSET	(CONFIG_ENV_ADDR)
 #define CONFIG_ENV_OVERWRITE	1
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 		"netboot=bootp; bootm\0"
 
diff --git a/include/configs/sh7753evb.h b/include/configs/sh7753evb.h
index ae76254589b3..5253a5be3221 100644
--- a/include/configs/sh7753evb.h
+++ b/include/configs/sh7753evb.h
@@ -62,11 +62,7 @@
 #define CONFIG_SH_MMCIF_CLK		48000000
 
 /* ENV setting */
-#define CONFIG_ENV_SECT_SIZE	(64 * 1024)
-#define CONFIG_ENV_ADDR		(0x00080000)
-#define CONFIG_ENV_OFFSET	(CONFIG_ENV_ADDR)
 #define CONFIG_ENV_OVERWRITE	1
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 		"netboot=bootp; bootm\0"
 
diff --git a/include/configs/sh7757lcr.h b/include/configs/sh7757lcr.h
index 04b6879644b7..d46aaad44107 100644
--- a/include/configs/sh7757lcr.h
+++ b/include/configs/sh7757lcr.h
@@ -74,11 +74,7 @@
 #define SH7757LCR_PCIEBRG_SIZE		(96 * 1024)
 
 /* ENV setting */
-#define CONFIG_ENV_SECT_SIZE	(64 * 1024)
-#define CONFIG_ENV_ADDR		(0x00080000)
-#define CONFIG_ENV_OFFSET	(CONFIG_ENV_ADDR)
 #define CONFIG_ENV_OVERWRITE	1
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 		"netboot=bootp; bootm\0"
 
diff --git a/include/configs/sh7763rdp.h b/include/configs/sh7763rdp.h
index 620cf5af5009..2e79fea053a8 100644
--- a/include/configs/sh7763rdp.h
+++ b/include/configs/sh7763rdp.h
@@ -55,12 +55,7 @@
 #define CONFIG_SYS_FLASH_UNLOCK_TOUT	(3 * 1000)
 /* Use hardware flash sectors protection instead of U-Boot software protection */
 #undef  CONFIG_SYS_DIRECT_FLASH_TFTP
-#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
-#define CONFIG_ENV_SIZE		(CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + (1 * CONFIG_ENV_SECT_SIZE))
 /* Offset of env Flash sector relative to CONFIG_SYS_FLASH_BASE */
-#define CONFIG_ENV_OFFSET		(CONFIG_ENV_ADDR - CONFIG_SYS_FLASH_BASE)
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_SYS_FLASH_BASE + (2 * CONFIG_ENV_SECT_SIZE))
 
 /* Clock */
 #define CONFIG_SYS_CLK_FREQ	66666666
diff --git a/include/configs/sheevaplug.h b/include/configs/sheevaplug.h
index deec71734dc7..ed5e284077db 100644
--- a/include/configs/sheevaplug.h
+++ b/include/configs/sheevaplug.h
@@ -32,16 +32,10 @@
 /*
  *  Environment variables configurations
  */
-#ifdef CONFIG_CMD_NAND
-#define CONFIG_ENV_SECT_SIZE		0x20000	/* 128K */
-#endif
 /*
  * max 4k env size is enough, but in case of nand
  * it has to be rounded to sector size
  */
-#define CONFIG_ENV_SIZE			0x20000	/* 128k */
-#define CONFIG_ENV_ADDR			0x80000
-#define CONFIG_ENV_OFFSET		0x80000	/* env starts here */
 /*
  * Environment is right behind U-Boot in flash. Make sure U-Boot
  * doesn't grow into the environment area.
diff --git a/include/configs/siemens-am33x-common.h b/include/configs/siemens-am33x-common.h
index ea6cc38fc139..09e4836316ad 100644
--- a/include/configs/siemens-am33x-common.h
+++ b/include/configs/siemens-am33x-common.h
@@ -172,10 +172,6 @@
  * 0xE0000 - 0x442000 : Linux Kernel
  * 0x442000 - 0x800000 : Userland
  */
-#if defined(CONFIG_SPI_BOOT)
-# define CONFIG_ENV_OFFSET		(892 << 10) /* 892 KiB in */
-# define CONFIG_ENV_SECT_SIZE		(4 << 10) /* 4 KB sectors */
-#endif /* SPI support */
 
 #define CONFIG_BOOTP_DEFAULT
 #define CONFIG_BOOTP_DNS2
diff --git a/include/configs/sifive-fu540.h b/include/configs/sifive-fu540.h
index 736ceb1f4855..2756ed5a77f3 100644
--- a/include/configs/sifive-fu540.h
+++ b/include/configs/sifive-fu540.h
@@ -23,7 +23,6 @@
 #define CONFIG_STANDALONE_LOAD_ADDR	0x80200000
 
 /* Environment options */
-#define CONFIG_ENV_SIZE			SZ_128K
 
 #define BOOT_TARGET_DEVICES(func) \
 	func(MMC, mmc, 0) \
diff --git a/include/configs/sksimx6.h b/include/configs/sksimx6.h
index b2ca7b1a7257..63c168ccdd19 100644
--- a/include/configs/sksimx6.h
+++ b/include/configs/sksimx6.h
@@ -53,11 +53,7 @@
 #define CONFIG_SYS_FSL_USDHC_NUM	1
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE                (16 * 1024)
-#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_OFFSET_REDUND       (CONFIG_ENV_OFFSET + \
-						CONFIG_ENV_SIZE)
 
 /* Default environment */
 #define CONFIG_EXTRA_ENV_SETTINGS \
diff --git a/include/configs/smartweb.h b/include/configs/smartweb.h
index c1a43a5e550a..624ad3b7688e 100644
--- a/include/configs/smartweb.h
+++ b/include/configs/smartweb.h
@@ -144,7 +144,6 @@
 /*
  * The NAND Flash partitions:
  */
-#define CONFIG_ENV_OFFSET_REDUND	(0x180000)
 #define CONFIG_ENV_RANGE		(SZ_512K)
 
 /*
diff --git a/include/configs/smdkc100.h b/include/configs/smdkc100.h
index 1d09792ce996..dbdb9a4a07a5 100644
--- a/include/configs/smdkc100.h
+++ b/include/configs/smdkc100.h
@@ -139,9 +139,6 @@
 /*-----------------------------------------------------------------------
  * Boot configuration
  */
-#define CONFIG_ENV_SIZE			(128 << 10)	/* 128KiB, 0x20000 */
-#define CONFIG_ENV_ADDR			(256 << 10)	/* 256KiB, 0x40000 */
-#define CONFIG_ENV_OFFSET		(256 << 10)	/* 256KiB, 0x40000 */
 
 #define CONFIG_USE_ONENAND_BOARD_INIT
 #define CONFIG_SAMSUNG_ONENAND		1
diff --git a/include/configs/smdkv310.h b/include/configs/smdkv310.h
index 68af0ef450fc..13e81ee2ffed 100644
--- a/include/configs/smdkv310.h
+++ b/include/configs/smdkv310.h
@@ -65,10 +65,8 @@
 #define CONFIG_MIU_2BIT_INTERLEAVED
 
 #define CONFIG_SYS_MMC_ENV_DEV		0
-#define CONFIG_ENV_SIZE			(16 << 10)	/* 16 KB */
 #define RESERVE_BLOCK_SIZE		(512)
 #define BL1_SIZE			(16 << 10) /*16 K reserved for BL1*/
-#define CONFIG_ENV_OFFSET		(RESERVE_BLOCK_SIZE + BL1_SIZE)
 
 #define CONFIG_SPL_MAX_FOOTPRINT	(14 * 1024)
 
diff --git a/include/configs/socfpga_common.h b/include/configs/socfpga_common.h
index baa214399ff9..05bfef75c0df 100644
--- a/include/configs/socfpga_common.h
+++ b/include/configs/socfpga_common.h
@@ -157,21 +157,13 @@ unsigned int cm_get_qspi_controller_clk_hz(void);
 /*
  * U-Boot environment
  */
-#if !defined(CONFIG_ENV_SIZE)
-#define CONFIG_ENV_SIZE			(8 * 1024)
-#endif
 
 /* Environment for SDMMC boot */
-#if defined(CONFIG_ENV_IS_IN_MMC) && !defined(CONFIG_ENV_OFFSET)
+#if defined(CONFIG_ENV_IS_IN_MMC)
 #define CONFIG_SYS_MMC_ENV_DEV		0 /* device 0 */
-#define CONFIG_ENV_OFFSET		(34 * 512) /* just after the GPT */
 #endif
 
 /* Environment for QSPI boot */
-#if defined(CONFIG_ENV_IS_IN_SPI_FLASH) && !defined(CONFIG_ENV_OFFSET)
-#define CONFIG_ENV_OFFSET		0x00100000
-#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
-#endif
 
 /*
  * SPL
diff --git a/include/configs/socfpga_sr1500.h b/include/configs/socfpga_sr1500.h
index e1a48715fb0d..ccaa050ae597 100644
--- a/include/configs/socfpga_sr1500.h
+++ b/include/configs/socfpga_sr1500.h
@@ -28,10 +28,6 @@
 #define CONFIG_SYS_BOOTCOUNT_BE
 
 /* Environment setting for SPI flash */
-#define CONFIG_ENV_SECT_SIZE	(64 * 1024)
-#define CONFIG_ENV_SIZE		(16 * 1024)
-#define CONFIG_ENV_OFFSET	0x000e0000
-#define CONFIG_ENV_OFFSET_REDUND (CONFIG_ENV_OFFSET + CONFIG_ENV_SECT_SIZE)
 
 /* The rest of the configuration is shared */
 #include <configs/socfpga_common.h>
diff --git a/include/configs/socfpga_stratix10_socdk.h b/include/configs/socfpga_stratix10_socdk.h
index 8e6ecf4bed34..e8e66fa4ae67 100644
--- a/include/configs/socfpga_stratix10_socdk.h
+++ b/include/configs/socfpga_stratix10_socdk.h
@@ -48,9 +48,7 @@
 /*
  * U-Boot environment configurations
  */
-#define CONFIG_ENV_SIZE			0x1000
 #define CONFIG_SYS_MMC_ENV_DEV		0	/* device 0 */
-#define CONFIG_ENV_OFFSET		512	/* just after the MBR */
 
 /*
  * QSPI support
@@ -62,13 +60,6 @@
 /* Flash device info */
 
 /*#define CONFIG_ENV_IS_IN_SPI_FLASH*/
-#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
-#undef CONFIG_ENV_OFFSET
-#undef CONFIG_ENV_SIZE
-#define CONFIG_ENV_OFFSET		0x710000
-#define CONFIG_ENV_SIZE			(4 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(4 * 1024)
-#endif /* CONFIG_ENV_IS_IN_SPI_FLASH */
 
 #ifndef CONFIG_SPL_BUILD
 #define CONFIG_MTD_DEVICE
diff --git a/include/configs/socfpga_vining_fpga.h b/include/configs/socfpga_vining_fpga.h
index 5cc12419a692..8b97cd93a78a 100644
--- a/include/configs/socfpga_vining_fpga.h
+++ b/include/configs/socfpga_vining_fpga.h
@@ -195,11 +195,6 @@
 		"fi\0"							\
 		"socfpga_legacy_reset_compat=1\0"
 
-#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
-#define CONFIG_ENV_OFFSET		0x100000
-#define CONFIG_ENV_OFFSET_REDUND	\
-	(CONFIG_ENV_OFFSET + CONFIG_ENV_SECT_SIZE)
-
 /* Support changing the prompt string */
 #define CONFIG_CMDLINE_PS_SUPPORT
 
diff --git a/include/configs/socrates.h b/include/configs/socrates.h
index f5f3316b9030..4fe67dced850 100644
--- a/include/configs/socrates.h
+++ b/include/configs/socrates.h
@@ -187,11 +187,6 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_SECT_SIZE	0x20000 /* 128K(one sector) for env	*/
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - \
-				CONFIG_ENV_SECT_SIZE - CONFIG_ENV_SECT_SIZE)
-#define CONFIG_ENV_SIZE		0x4000
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR - CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download	*/
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change	*/
diff --git a/include/configs/som-db5800-som-6867.h b/include/configs/som-db5800-som-6867.h
index cfcc9c866d63..201f2c2ece57 100644
--- a/include/configs/som-db5800-som-6867.h
+++ b/include/configs/som-db5800-som-6867.h
@@ -21,7 +21,4 @@
 #define VIDEO_IO_OFFSET				0
 #define CONFIG_X86EMU_RAW_IO
 
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x006ef000
-
 #endif	/* __CONFIG_H */
diff --git a/include/configs/spear-common.h b/include/configs/spear-common.h
index d21ff9771693..85e498dc6687 100644
--- a/include/configs/spear-common.h
+++ b/include/configs/spear-common.h
@@ -99,7 +99,6 @@
  * Environment is in serial NOR flash
  */
 #define CONFIG_SYS_MONITOR_LEN			0x00040000
-#define CONFIG_ENV_SECT_SIZE			0x00010000
 #define CONFIG_FSMTDBLK				"/dev/mtdblock3 "
 
 #define CONFIG_BOOTCOMMAND			"bootm 0xf8050000"
@@ -109,21 +108,16 @@
  * Environment is in parallel NOR flash
  */
 #define CONFIG_SYS_MONITOR_LEN			0x00060000
-#define CONFIG_ENV_SECT_SIZE			0x00020000
 #define CONFIG_FSMTDBLK				"/dev/mtdblock3 "
 
 #define CONFIG_BOOTCOMMAND			"cp.b 0x50080000 0x1600000 " \
 						"0x4C0000; bootm 0x1600000"
 #endif
-
-#define CONFIG_ENV_ADDR				(CONFIG_SYS_FLASH_BASE + \
-						CONFIG_SYS_MONITOR_LEN)
 #elif defined(CONFIG_ENV_IS_IN_NAND)
 /*
  * Environment is in NAND
  */
 
-#define CONFIG_ENV_OFFSET			0x60000
 #define CONFIG_ENV_RANGE			0x10000
 #define CONFIG_FSMTDBLK				"/dev/mtdblock7 "
 
@@ -146,7 +140,6 @@
 		"console=ttyAMA0,115200 $(othbootargs);"		\
 	CONFIG_BOOTCOMMAND
 
-#define CONFIG_ENV_SIZE				0x02000
 #define CONFIG_SYS_MONITOR_BASE			CONFIG_SYS_TEXT_BASE
 
 /* Miscellaneous configurable options */
diff --git a/include/configs/stih410-b2260.h b/include/configs/stih410-b2260.h
index b67efbb16830..a8a58f395068 100644
--- a/include/configs/stih410-b2260.h
+++ b/include/configs/stih410-b2260.h
@@ -39,9 +39,6 @@
 			"ramdisk_addr_r=0x48000000\0"		\
 			BOOTENV
 
-
-#define CONFIG_ENV_SIZE 0x4000
-
 /* Extra Commands */
 #define CONFIG_CMD_ASKENV
 
diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
index 31c17d081867..a8b3a173096f 100644
--- a/include/configs/stm32f429-discovery.h
+++ b/include/configs/stm32f429-discovery.h
@@ -20,10 +20,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	12
 #define CONFIG_SYS_MAX_FLASH_BANKS	2
 
-#define CONFIG_ENV_OFFSET		(256 << 10)
-#define CONFIG_ENV_SECT_SIZE		(128 << 10)
-#define CONFIG_ENV_SIZE			(8 << 10)
-
 #define CONFIG_RED_LED			110
 #define CONFIG_GREEN_LED		109
 
diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
index a5390f874284..7a17222d7b81 100644
--- a/include/configs/stm32f429-evaluation.h
+++ b/include/configs/stm32f429-evaluation.h
@@ -20,10 +20,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	12
 #define CONFIG_SYS_MAX_FLASH_BANKS	2
 
-#define CONFIG_ENV_OFFSET		(256 << 10)
-#define CONFIG_ENV_SECT_SIZE		(128 << 10)
-#define CONFIG_ENV_SIZE			(8 << 10)
-
 #define CONFIG_STM32_FLASH
 
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
index 1c7efd13b835..463f1c4396d0 100644
--- a/include/configs/stm32f469-discovery.h
+++ b/include/configs/stm32f469-discovery.h
@@ -20,10 +20,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	12
 #define CONFIG_SYS_MAX_FLASH_BANKS	2
 
-#define CONFIG_ENV_OFFSET		(256 << 10)
-#define CONFIG_ENV_SECT_SIZE		(128 << 10)
-#define CONFIG_ENV_SIZE			(8 << 10)
-
 #define CONFIG_STM32_FLASH
 
 #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index cc26f83e7462..337b99977b80 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -24,8 +24,6 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	8
 #define CONFIG_SYS_MAX_FLASH_BANKS	1
 
-#define CONFIG_ENV_SIZE			(8 << 10)
-
 #define CONFIG_STM32_FLASH
 
 #define CONFIG_DW_GMAC_DEFAULT_DMA_PBL	(8)
diff --git a/include/configs/stm32h743-disco.h b/include/configs/stm32h743-disco.h
index f110e2994c71..74c69eba39d3 100644
--- a/include/configs/stm32h743-disco.h
+++ b/include/configs/stm32h743-disco.h
@@ -18,8 +18,6 @@
 #define CONFIG_SYS_LOAD_ADDR		0xD0400000
 #define CONFIG_LOADADDR			0xD0400000
 
-#define CONFIG_ENV_SIZE			(8 << 10)
-
 #define CONFIG_SYS_HZ_CLOCK		1000000
 
 #define CONFIG_CMDLINE_TAG
diff --git a/include/configs/stm32h743-eval.h b/include/configs/stm32h743-eval.h
index e3bf5b27e859..b7c84922ab84 100644
--- a/include/configs/stm32h743-eval.h
+++ b/include/configs/stm32h743-eval.h
@@ -18,8 +18,6 @@
 #define CONFIG_SYS_LOAD_ADDR		0xD0400000
 #define CONFIG_LOADADDR			0xD0400000
 
-#define CONFIG_ENV_SIZE			(8 << 10)
-
 #define CONFIG_SYS_HZ_CLOCK		1000000
 
 #define CONFIG_CMDLINE_TAG
diff --git a/include/configs/stmark2.h b/include/configs/stmark2.h
index 35966580a918..a08d9950bd87 100644
--- a/include/configs/stmark2.h
+++ b/include/configs/stmark2.h
@@ -139,9 +139,6 @@
 
 #if defined(CONFIG_CF_SBF)
 #define CONFIG_ENV_IS_IN_SPI_FLASH	1
-#define CONFIG_ENV_OFFSET		0x40000
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_SECT_SIZE		0x10000
 #endif
 
 #undef CONFIG_ENV_OVERWRITE
diff --git a/include/configs/strider.h b/include/configs/strider.h
index d270d8a2dd4f..ac9fce80cec3 100644
--- a/include/configs/strider.h
+++ b/include/configs/strider.h
@@ -384,15 +384,6 @@ void fpga_control_clear(unsigned int bus, int pin);
 /*
  * Environment
  */
-#if 1
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-				 CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x10000 /* 64K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x2000
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
-#else
-#define CONFIG_ENV_SIZE		0x2000		/* 8KB */
-#endif
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/stv0991.h b/include/configs/stv0991.h
index e5262085fc75..81e1e49c928a 100644
--- a/include/configs/stv0991.h
+++ b/include/configs/stv0991.h
@@ -13,11 +13,6 @@
 #define CONFIG_SYS_SDRAM_BASE			PHYS_SDRAM_1
 #define PHYS_SDRAM_1_SIZE			0x00198000
 
-#define CONFIG_ENV_SIZE				0x10000
-#define CONFIG_ENV_SECT_SIZE			CONFIG_ENV_SIZE
-#define CONFIG_ENV_OFFSET			0x30000
-#define CONFIG_ENV_ADDR				\
-	(PHYS_SDRAM_1_SIZE - CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MALLOC_LEN			(CONFIG_ENV_SIZE + 16 * 1024)
 
 /* user interface */
diff --git a/include/configs/t4qds.h b/include/configs/t4qds.h
index bf3750191281..5d087caf31e4 100644
--- a/include/configs/t4qds.h
+++ b/include/configs/t4qds.h
@@ -54,9 +54,7 @@
 #define CONFIG_SYS_INIT_L3_ADDR		0xFFFC0000
 #define CONFIG_SYS_L3_SIZE		(512 << 10)
 #define CONFIG_SPL_GD_ADDR		(CONFIG_SYS_INIT_L3_ADDR + 32 * 1024)
-#ifdef CONFIG_RAMBOOT_PBL
-#define CONFIG_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
-#endif
+#define SPL_ENV_ADDR			(CONFIG_SPL_GD_ADDR + 4 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_ADDR	(CONFIG_SPL_GD_ADDR + 12 * 1024)
 #define CONFIG_SPL_RELOC_MALLOC_SIZE	(50 << 10)
 #define CONFIG_SPL_RELOC_STACK		(CONFIG_SPL_GD_ADDR + 64 * 1024)
diff --git a/include/configs/tam3517-common.h b/include/configs/tam3517-common.h
index 69819da492fd..a2bb1b55eb12 100644
--- a/include/configs/tam3517-common.h
+++ b/include/configs/tam3517-common.h
@@ -110,10 +110,6 @@
 
 /* Redundant Environment */
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)	/* 128 KiB */
-#define CONFIG_ENV_OFFSET		0x180000
-#define CONFIG_ENV_ADDR			0x180000
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + \
-						2 * CONFIG_SYS_ENV_SECT_SIZE)
 
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 #define CONFIG_SYS_INIT_RAM_ADDR	0x4020f800
diff --git a/include/configs/tao3530.h b/include/configs/tao3530.h
index 7a54fe3e1e37..e95cd0087d3f 100644
--- a/include/configs/tao3530.h
+++ b/include/configs/tao3530.h
@@ -169,7 +169,6 @@
 #define ONENAND_ENV_OFFSET		0x260000 /* environment starts here */
 
 #define CONFIG_SYS_ENV_SECT_SIZE	(128 << 10)
-#define CONFIG_ENV_ADDR			CONFIG_ENV_OFFSET
 
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 #define CONFIG_SYS_INIT_RAM_ADDR	0x4020f800
diff --git a/include/configs/taurus.h b/include/configs/taurus.h
index fdd1c5224b78..9990c9340a3d 100644
--- a/include/configs/taurus.h
+++ b/include/configs/taurus.h
@@ -108,7 +108,6 @@
 #define CONFIG_SYS_LOAD_ADDR			0x22000000
 
 /* bootstrap in spi flash , u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET_REDUND	0x180000
 
 #ifndef CONFIG_SPL_BUILD
 #if defined(CONFIG_BOARD_AXM)
diff --git a/include/configs/tbs2910.h b/include/configs/tbs2910.h
index 46d67a7fcfd0..b598fca1ecb3 100644
--- a/include/configs/tbs2910.h
+++ b/include/configs/tbs2910.h
@@ -75,8 +75,6 @@
 /* Environment organization */
 #define CONFIG_SYS_MMC_ENV_DEV		2 /* overwritten on SD boot */
 #define CONFIG_SYS_MMC_ENV_PART		1 /* overwritten on SD boot */
-#define CONFIG_ENV_SIZE			(8 * 1024)
-#define CONFIG_ENV_OFFSET		(384 * 1024)
 #define CONFIG_ENV_OVERWRITE
 
 #define CONFIG_BOARD_SIZE_LIMIT		392192 /* (CONFIG_ENV_OFFSET - 1024) */
diff --git a/include/configs/tec-ng.h b/include/configs/tec-ng.h
index b637832a5ee7..1047372105e2 100644
--- a/include/configs/tec-ng.h
+++ b/include/configs/tec-ng.h
@@ -17,7 +17,6 @@
 #define CONFIG_SYS_NS16550_COM1		NV_PA_APB_UARTD_BASE
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/tec.h b/include/configs/tec.h
index 907c8d5e2301..aa9665eab59a 100644
--- a/include/configs/tec.h
+++ b/include/configs/tec.h
@@ -23,7 +23,6 @@
 #define CONFIG_SYS_MAX_NAND_DEVICE	1
 
 /* Environment in NAND, aligned to start of last sector */
-#define CONFIG_ENV_OFFSET		(SZ_512M - SZ_128K) /* 128K sectors */
 
 #include "tegra-common-post.h"
 
diff --git a/include/configs/tegra-common.h b/include/configs/tegra-common.h
index 84f671d00c37..b4da1f8428ca 100644
--- a/include/configs/tegra-common.h
+++ b/include/configs/tegra-common.h
@@ -25,7 +25,6 @@
 #define CONFIG_CMDLINE_TAG		/* enable passing of ATAGs */
 
 /* Environment */
-#define CONFIG_ENV_SIZE			0x2000	/* Total Size Environment */
 
 /*
  * NS16550 Configuration
diff --git a/include/configs/theadorable-x86-common.h b/include/configs/theadorable-x86-common.h
index 2d7be7d5b96e..0a1261fa2017 100644
--- a/include/configs/theadorable-x86-common.h
+++ b/include/configs/theadorable-x86-common.h
@@ -23,12 +23,6 @@
 #define CONFIG_BMP_16BPP
 
 /* Environment settings */
-#undef CONFIG_ENV_SIZE
-#define CONFIG_ENV_SIZE			0x2000
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x006ec000
-#define CONFIG_ENV_OFFSET_REDUND	\
-	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
 
 #undef CONFIG_BOOTCOMMAND
 #undef CONFIG_EXTRA_ENV_SETTINGS
diff --git a/include/configs/theadorable.h b/include/configs/theadorable.h
index 45cd7e2b83ac..6d42ec1aa194 100644
--- a/include/configs/theadorable.h
+++ b/include/configs/theadorable.h
@@ -40,9 +40,6 @@
 #define CONFIG_USB_MAX_CONTROLLER_COUNT 3
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
 #define CONFIG_ENV_OVERWRITE
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
diff --git a/include/configs/thuban.h b/include/configs/thuban.h
index 954b063e293a..d909be9b019c 100644
--- a/include/configs/thuban.h
+++ b/include/configs/thuban.h
@@ -39,7 +39,6 @@
 #define CONFIG_FACTORYSET
 
 /* Define own nand partitions */
-#define CONFIG_ENV_OFFSET_REDUND    0x2E0000
 #define CONFIG_ENV_RANGE        (4 * CONFIG_SYS_ENV_SECT_SIZE)
 
 #ifndef CONFIG_SPL_BUILD
diff --git a/include/configs/thunderx_88xx.h b/include/configs/thunderx_88xx.h
index 619571d45ba6..dac7e4ad9594 100644
--- a/include/configs/thunderx_88xx.h
+++ b/include/configs/thunderx_88xx.h
@@ -61,7 +61,6 @@
 					"fdt_high=0x9fffffff\0"
 
 /* Do not preserve environment */
-#define CONFIG_ENV_SIZE			0x1000
 
 /* Monitor Command Prompt */
 #define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
diff --git a/include/configs/ti816x_evm.h b/include/configs/ti816x_evm.h
index fc5608b3fd47..1d3b2a392237 100644
--- a/include/configs/ti816x_evm.h
+++ b/include/configs/ti816x_evm.h
@@ -12,7 +12,6 @@
 #include <configs/ti_armv7_omap.h>
 #include <asm/arch/omap.h>
 
-#define CONFIG_ENV_SIZE			0x2000
 #define CONFIG_MACH_TYPE		MACH_TYPE_TI8168EVM
 
 #define CONFIG_EXTRA_ENV_SETTINGS	\
@@ -84,8 +83,6 @@
 #define CONFIG_SYS_NAND_ONFI_DETECTION
 #define CONFIG_NAND_OMAP_ECCSCHEME	OMAP_ECC_BCH8_CODE_HW
 #define CONFIG_SYS_NAND_U_BOOT_OFFS	0x000c0000
-#define CONFIG_ENV_OFFSET		0x001c0000
-#define CONFIG_ENV_OFFSET_REDUND	0x001e0000
 #define CONFIG_SYS_ENV_SECT_SIZE	CONFIG_SYS_NAND_BLOCK_SIZE
 
 /* SPL */
diff --git a/include/configs/titanium.h b/include/configs/titanium.h
index 64ec06da8599..d6ab5e4393ee 100644
--- a/include/configs/titanium.h
+++ b/include/configs/titanium.h
@@ -145,16 +145,10 @@
 /* DMA stuff, needed for GPMI/MXS NAND support */
 
 /* Environment in NAND */
-#define CONFIG_ENV_OFFSET		(16 << 20)
-#define CONFIG_ENV_SECT_SIZE		(128 << 10)
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + (512 << 10))
 
 #else /* CONFIG_CMD_NAND */
 
 /* Environment in MMC */
-#define CONFIG_ENV_SIZE			(8 << 10)
-#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 #endif /* CONFIG_CMD_NAND */
diff --git a/include/configs/topic_miami.h b/include/configs/topic_miami.h
index b98656dd4c17..73fdfae4610c 100644
--- a/include/configs/topic_miami.h
+++ b/include/configs/topic_miami.h
@@ -15,10 +15,6 @@
 #include "zynq-common.h"
 
 /* Fixup settings */
-#undef CONFIG_ENV_SIZE
-#define CONFIG_ENV_SIZE			0x8000
-#undef CONFIG_ENV_OFFSET
-#define CONFIG_ENV_OFFSET		0x80000
 
 /* SPL settings */
 #undef CONFIG_SPL_ETH_SUPPORT
diff --git a/include/configs/tplink_wdr4300.h b/include/configs/tplink_wdr4300.h
index 436715824b23..8f13744c322f 100644
--- a/include/configs/tplink_wdr4300.h
+++ b/include/configs/tplink_wdr4300.h
@@ -34,8 +34,6 @@
 #define CONFIG_BOOTCOMMAND		\
 	"dhcp 192.168.1.1:wdr4300.fit && bootm $loadaddr"
 
-#define CONFIG_ENV_SIZE			0x10000
-
 /*
  * Command
  */
diff --git a/include/configs/tqma6.h b/include/configs/tqma6.h
index 3c1d629d251f..1ea6332878fe 100644
--- a/include/configs/tqma6.h
+++ b/include/configs/tqma6.h
@@ -68,7 +68,6 @@
 
 #define CONFIG_ARP_TIMEOUT		200UL
 
-#define CONFIG_ENV_SIZE			(SZ_8K)
 /* Size of malloc() pool */
 #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + 2 * SZ_1M)
 
@@ -78,7 +77,6 @@
 #define TQMA6_UBOOT_SECTOR_START	0x2
 #define TQMA6_UBOOT_SECTOR_COUNT	0x7fe
 
-#define CONFIG_ENV_OFFSET		SZ_1M
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 #define TQMA6_FDT_OFFSET		(2 * SZ_1M)
@@ -148,11 +146,6 @@
 #define TQMA6_UBOOT_SIZE		(TQMA6_UBOOT_SECTOR_SIZE * \
 					 TQMA6_UBOOT_SECTOR_COUNT)
 
-#define CONFIG_ENV_OFFSET		(TQMA6_UBOOT_SIZE)
-#define CONFIG_ENV_SECT_SIZE		TQMA6_SPI_FLASH_SECTOR_SIZE
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + \
-					 CONFIG_ENV_SECT_SIZE)
-
 #define TQMA6_FDT_OFFSET		(CONFIG_ENV_OFFSET_REDUND + \
 					 CONFIG_ENV_SECT_SIZE)
 #define TQMA6_FDT_SECT_SIZE		(TQMA6_SPI_FLASH_SECTOR_SIZE)
diff --git a/include/configs/trats.h b/include/configs/trats.h
index af8e8ce3b6cc..37fadc52102a 100644
--- a/include/configs/trats.h
+++ b/include/configs/trats.h
@@ -49,8 +49,6 @@
 #define CONFIG_ENV_COMMON_BOOT		"${console} ${meminfo}"
 
 #define CONFIG_SYS_MMC_ENV_DEV		CONFIG_MMC_DEFAULT_DEV
-#define CONFIG_ENV_SIZE			4096
-#define CONFIG_ENV_OFFSET		((32 - 4) << 10) /* 32KiB - 4KiB */
 
 #define CONFIG_ENV_OVERWRITE
 
diff --git a/include/configs/trats2.h b/include/configs/trats2.h
index 9c6b2bbc8d60..8b71c2575735 100644
--- a/include/configs/trats2.h
+++ b/include/configs/trats2.h
@@ -44,8 +44,6 @@
 #define CONFIG_SYS_MONITOR_BASE	0x00000000
 
 #define CONFIG_SYS_MMC_ENV_DEV		CONFIG_MMC_DEFAULT_DEV
-#define CONFIG_ENV_SIZE			4096
-#define CONFIG_ENV_OFFSET		((32 - 4) << 10) /* 32KiB - 4KiB */
 
 #define CONFIG_ENV_OVERWRITE
 
diff --git a/include/configs/tricorder.h b/include/configs/tricorder.h
index 2106f4e5b043..1e4459747d54 100644
--- a/include/configs/tricorder.h
+++ b/include/configs/tricorder.h
@@ -78,7 +78,6 @@
 
 /* environment placement (for NAND), is different for FLASHCARD but does not
  * harm there */
-#define CONFIG_ENV_OFFSET_REDUND	0x2A0000    /* redundant env start */
 #define CONFIG_ENV_RANGE		(384 << 10) /* allow badblocks in env */
 
 /* the loadaddr is the same as CONFIG_SYS_LOAD_ADDR, unfortunately the defiend
diff --git a/include/configs/trimslice.h b/include/configs/trimslice.h
index 93db175288c1..b914e444b6e7 100644
--- a/include/configs/trimslice.h
+++ b/include/configs/trimslice.h
@@ -23,9 +23,7 @@
 /* SPI */
 
 /* Environment in SPI */
-#define CONFIG_ENV_SECT_SIZE		CONFIG_ENV_SIZE
 /* 1MiB flash, environment located as high as possible */
-#define CONFIG_ENV_OFFSET		(SZ_1M - CONFIG_ENV_SIZE)
 
 #include "tegra-common-post.h"
 
diff --git a/include/configs/ts4600.h b/include/configs/ts4600.h
index a107e96530ec..6aab8a06a963 100644
--- a/include/configs/ts4600.h
+++ b/include/configs/ts4600.h
@@ -21,11 +21,9 @@
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 
 /* Environment */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
 /* Environment is in MMC */
 #if defined(CONFIG_CMD_MMC) && defined(CONFIG_ENV_IS_IN_MMC)
-#define CONFIG_ENV_OFFSET		(256 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #endif
 
diff --git a/include/configs/ts4800.h b/include/configs/ts4800.h
index 4e274bd4141d..bd50d3b19c32 100644
--- a/include/configs/ts4800.h
+++ b/include/configs/ts4800.h
@@ -135,8 +135,6 @@
  * Environment organization
  */
 
-#define CONFIG_ENV_OFFSET      (6 * 64 * 1024)
-#define CONFIG_ENV_SIZE        (8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 
 #endif
diff --git a/include/configs/turris_mox.h b/include/configs/turris_mox.h
index 16a49c766f28..9409344338e1 100644
--- a/include/configs/turris_mox.h
+++ b/include/configs/turris_mox.h
@@ -62,9 +62,6 @@
 #define CONFIG_SYS_I2C_SLAVE		0x0
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		0x180000 /* as Marvell U-Boot version */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB sectors */
 
 /*
  * Ethernet Driver configuration
diff --git a/include/configs/turris_omnia.h b/include/configs/turris_omnia.h
index abe1e99acda5..0b55c14d8bff 100644
--- a/include/configs/turris_omnia.h
+++ b/include/configs/turris_omnia.h
@@ -22,9 +22,6 @@
 #define CONFIG_EHCI_IS_TDI
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_OFFSET		((1 << 20) - CONFIG_ENV_SIZE)
-#define CONFIG_ENV_SECT_SIZE		(64 << 10) /* 64KiB */
 
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
 
diff --git a/include/configs/udoo.h b/include/configs/udoo.h
index 3378b4a601c4..bf9106e239fe 100644
--- a/include/configs/udoo.h
+++ b/include/configs/udoo.h
@@ -87,9 +87,7 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
-#define CONFIG_ENV_OFFSET		(6 * 64 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 #endif			       /* __CONFIG_H * */
diff --git a/include/configs/udoo_neo.h b/include/configs/udoo_neo.h
index 6ba4270b72db..f4a2837b3913 100644
--- a/include/configs/udoo_neo.h
+++ b/include/configs/udoo_neo.h
@@ -75,8 +75,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
-#define CONFIG_ENV_SIZE			SZ_8K
 
 #define CONFIG_IMX_THERMAL
 
diff --git a/include/configs/ulcb.h b/include/configs/ulcb.h
index 6f2a0cc56dce..1d99dcaba666 100644
--- a/include/configs/ulcb.h
+++ b/include/configs/ulcb.h
@@ -19,7 +19,6 @@
 #define COUNTER_FREQUENCY	0xFE502A	/* 16.66MHz from CPclk */
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV		1
 #define CONFIG_SYS_MMC_ENV_PART		2
 
diff --git a/include/configs/uniphier.h b/include/configs/uniphier.h
index 68568f412245..29866668c491 100644
--- a/include/configs/uniphier.h
+++ b/include/configs/uniphier.h
@@ -72,10 +72,6 @@
 /* Boot Argument Buffer Size */
 #define CONFIG_SYS_BARGSIZE		(CONFIG_SYS_CBSIZE)
 
-#define CONFIG_ENV_OFFSET			0x100000
-#define CONFIG_ENV_SIZE				0x2000
-/* #define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE) */
-
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		1
 
diff --git a/include/configs/usbarmory.h b/include/configs/usbarmory.h
index 128f02db66fa..91c8b478b3af 100644
--- a/include/configs/usbarmory.h
+++ b/include/configs/usbarmory.h
@@ -15,8 +15,6 @@
 #include <asm/arch/imx-regs.h>
 
 /* U-Boot environment */
-#define CONFIG_ENV_OFFSET	(6 * 64 * 1024)
-#define CONFIG_ENV_SIZE		(8 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV	0
 
 /* U-Boot general configurations */
diff --git a/include/configs/vcoreiii.h b/include/configs/vcoreiii.h
index 6ff68cd6a085..e69456ef7ce2 100644
--- a/include/configs/vcoreiii.h
+++ b/include/configs/vcoreiii.h
@@ -25,15 +25,6 @@
 
 #define CONFIG_BOARD_TYPES
 
-#if defined(CONFIG_ENV_IS_IN_SPI_FLASH) && !defined(CONFIG_ENV_OFFSET)
-#define CONFIG_ENV_OFFSET		(1024 * 1024)
-#define CONFIG_ENV_SIZE			(8 * 1024)
-#define CONFIG_ENV_SECT_SIZE		(256 * 1024)
-
-#define CONFIG_ENV_OFFSET_REDUND      (CONFIG_ENV_OFFSET + CONFIG_ENV_SECT_SIZE)
-
-#endif
-
 #define CONFIG_SYS_SDRAM_BASE		0x80000000
 #if defined(CONFIG_DDRTYPE_H5TQ1G63BFA) || defined(CONFIG_DDRTYPE_MT47H128M8HQ)
 #define CONFIG_SYS_SDRAM_SIZE		(128 * SZ_1M)
diff --git a/include/configs/vct.h b/include/configs/vct.h
index 890f347b4395..284d2682593d 100644
--- a/include/configs/vct.h
+++ b/include/configs/vct.h
@@ -128,12 +128,7 @@
 #define CONFIG_SYS_FLASH_WRITE_TOUT	500	/* Timeout for Flash Write (in ms)	*/
 
 #ifdef CONFIG_ENV_IS_IN_FLASH
-#define CONFIG_ENV_SECT_SIZE	0x10000		/* size of one complete sector	*/
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_FLASH_BASE + CONFIG_SYS_MONITOR_LEN)
-#define	CONFIG_ENV_SIZE		0x4000	/* Total Size of Environment Sector	*/
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
 #endif /* CONFIG_ENV_IS_IN_FLASH */
 #endif /* CONFIG_VCT_NOR */
 
@@ -141,8 +136,6 @@
 #define CONFIG_USE_ONENAND_BOARD_INIT
 #define	CONFIG_SYS_ONENAND_BASE		0x00000000	/* this is not real address */
 #define CONFIG_SYS_FLASH_BASE		0x00000000
-#define CONFIG_ENV_ADDR			(128 << 10)	/* after compr. U-Boot image */
-#define	CONFIG_ENV_SIZE			(128 << 10)	/* erase size */
 #endif /* CONFIG_VCT_ONENAND */
 
 /*
diff --git a/include/configs/ve8313.h b/include/configs/ve8313.h
index 2608b2b23220..a31e6f4abe35 100644
--- a/include/configs/ve8313.h
+++ b/include/configs/ve8313.h
@@ -195,13 +195,7 @@
 /*
  * Environment
  */
-#define CONFIG_ENV_ADDR		\
-			(CONFIG_SYS_FLASH_BASE + CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-#define CONFIG_ENV_SIZE		0x4000
 /* Address and size of Redundant Environment Sector */
-#define CONFIG_ENV_OFFSET_REDUND	\
-			(CONFIG_ENV_OFFSET + CONFIG_ENV_SECT_SIZE)
 
 #define CONFIG_LOADS_ECHO	1	/* echo on for serial download */
 #define CONFIG_SYS_LOADS_BAUD_CHANGE	1	/* allow baudrate change */
diff --git a/include/configs/venice2.h b/include/configs/venice2.h
index 8ad872d94f37..b62a43054a21 100644
--- a/include/configs/venice2.h
+++ b/include/configs/venice2.h
@@ -21,7 +21,6 @@
 /* Environment in eMMC, at the end of 2nd "boot sector" */
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #define CONFIG_SYS_MMC_ENV_PART		2
-#define CONFIG_ENV_OFFSET		(-CONFIG_ENV_SIZE)
 
 /* SPI */
 #define CONFIG_SPI_FLASH_SIZE          (4 << 20)
diff --git a/include/configs/ventana.h b/include/configs/ventana.h
index 09f90db1f515..2c2d66cdc099 100644
--- a/include/configs/ventana.h
+++ b/include/configs/ventana.h
@@ -20,7 +20,6 @@
 #define CONFIG_MACH_TYPE		MACH_TYPE_VENTANA
 
 /* Environment in eMMC, at the end of 2nd "boot sector" */
-#define CONFIG_ENV_OFFSET (-CONFIG_ENV_SIZE)
 #define CONFIG_SYS_MMC_ENV_DEV 0
 #define CONFIG_SYS_MMC_ENV_PART 2
 
diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
index b2c14f9e10f6..9a9cec414c87 100644
--- a/include/configs/vexpress_aemv8a.h
+++ b/include/configs/vexpress_aemv8a.h
@@ -201,15 +201,11 @@
 #define CONFIG_SYS_MAX_FLASH_SECT	259
 /* Store environment at top of flash in the same location as blank.img */
 /* in the Juno firmware. */
-#define CONFIG_ENV_ADDR			0x0BFC0000
-#define CONFIG_ENV_SECT_SIZE		0x00010000
 #else
 #define CONFIG_SYS_FLASH_BASE		0x0C000000
 /* 256 x 256KiB sectors */
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 /* Store environment at top of flash */
-#define CONFIG_ENV_ADDR			0x0FFC0000
-#define CONFIG_ENV_SECT_SIZE		0x00040000
 #endif
 
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
@@ -217,6 +213,5 @@
 
 #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
 #define FLASH_MAX_SECTOR_SIZE		0x00040000
-#define CONFIG_ENV_SIZE			CONFIG_ENV_SECT_SIZE
 
 #endif /* __VEXPRESS_AEMV8A_H */
diff --git a/include/configs/vexpress_common.h b/include/configs/vexpress_common.h
index 47ea89df6607..7f215a670771 100644
--- a/include/configs/vexpress_common.h
+++ b/include/configs/vexpress_common.h
@@ -226,21 +226,15 @@
 #define FLASH_MAX_SECTOR_SIZE		0x00040000	/* 256 KB sectors */
 
 /* Room required on the stack for the environment data */
-#define CONFIG_ENV_SIZE			FLASH_MAX_SECTOR_SIZE
 
 /*
  * Amount of flash used for environment:
  * We don't know which end has the small erase blocks so we use the penultimate
  * sector location for the environment
  */
-#define CONFIG_ENV_SECT_SIZE		FLASH_MAX_SECTOR_SIZE
 #define CONFIG_ENV_OVERWRITE		1
 
 /* Store environment at top of flash */
-#define CONFIG_ENV_OFFSET		(PHYS_FLASH_SIZE - \
-					(2 * CONFIG_ENV_SECT_SIZE))
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE1 + \
-					 CONFIG_ENV_OFFSET)
 #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ CONFIG_SYS_FLASH_BASE0, \
 					  CONFIG_SYS_FLASH_BASE1 }
diff --git a/include/configs/vf610twr.h b/include/configs/vf610twr.h
index ba85bc91e74d..3ab323194387 100644
--- a/include/configs/vf610twr.h
+++ b/include/configs/vf610twr.h
@@ -187,17 +187,11 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 #ifdef CONFIG_ENV_IS_IN_MMC
-#define CONFIG_ENV_SIZE			(8 * 1024)
-
-#define CONFIG_ENV_OFFSET		(12 * 64 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 #endif
 
 #ifdef CONFIG_ENV_IS_IN_NAND
-#define CONFIG_ENV_SIZE			(64 * 2048)
-#define CONFIG_ENV_SECT_SIZE		(64 * 2048)
 #define CONFIG_ENV_RANGE		(512 * 1024)
-#define CONFIG_ENV_OFFSET		0x180000
 #endif
 
 #endif
diff --git a/include/configs/vinco.h b/include/configs/vinco.h
index eebb3f7ca789..a709502d4373 100644
--- a/include/configs/vinco.h
+++ b/include/configs/vinco.h
@@ -63,11 +63,6 @@
 #ifdef CONFIG_SPI_BOOT
 /* bootstrap + u-boot + env + linux in serial flash */
 /* Use our own mapping for the VInCo platform */
-#undef CONFIG_ENV_OFFSET
-#undef CONFIG_ENV_SIZE
-
-#define CONFIG_ENV_OFFSET       0x10000
-#define CONFIG_ENV_SIZE         0x10000
 
 /* Update the bootcommand according to our mapping for the VInCo platform */
 #undef CONFIG_BOOTCOMMAND
diff --git a/include/configs/vining_2000.h b/include/configs/vining_2000.h
index 6672930fb39c..54c8c2f62efc 100644
--- a/include/configs/vining_2000.h
+++ b/include/configs/vining_2000.h
@@ -85,10 +85,6 @@
 
 #define CONFIG_IMX6_PWM_PER_CLK 66000000
 
-#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
-#define CONFIG_ENV_SIZE			SZ_8K
-#define CONFIG_ENV_OFFSET_REDUND	(9 * SZ_64K)
-
 #ifdef CONFIG_ENV_IS_IN_MMC
 #define CONFIG_SYS_MMC_ENV_DEV		0 /* USDHC4 eMMC */
 /* 0=user, 1=boot0, 2=boot1, * 4..7=general0..3. */
diff --git a/include/configs/vme8349.h b/include/configs/vme8349.h
index 74e8d3925bf2..f40c9002e590 100644
--- a/include/configs/vme8349.h
+++ b/include/configs/vme8349.h
@@ -199,16 +199,7 @@
  * Environment
  */
 #ifndef CONFIG_SYS_RAMBOOT
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + 0xc0000)
-	#define CONFIG_ENV_SECT_SIZE	0x20000	/* 128K(one sector) for env */
-	#define CONFIG_ENV_SIZE		0x2000
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_ADDR_REDUND	(CONFIG_ENV_ADDR + CONFIG_ENV_SECT_SIZE)
-
-#else
-	#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - 0x1000)
-	#define CONFIG_ENV_SIZE		0x2000
 #endif
 
 #define CONFIG_LOADS_ECHO		/* echo on for serial download */
diff --git a/include/configs/wandboard.h b/include/configs/wandboard.h
index a0a78eab27bf..a65d23bbe80a 100644
--- a/include/configs/wandboard.h
+++ b/include/configs/wandboard.h
@@ -124,9 +124,7 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment organization */
-#define CONFIG_ENV_SIZE			(8 * 1024)
 
-#define CONFIG_ENV_OFFSET		(768 * 1024)
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 #endif			       /* __CONFIG_H * */
diff --git a/include/configs/warp.h b/include/configs/warp.h
index 41fd6c759eba..68361a6199ee 100644
--- a/include/configs/warp.h
+++ b/include/configs/warp.h
@@ -41,8 +41,6 @@
 #define CONFIG_SYS_INIT_SP_ADDR \
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
-#define CONFIG_ENV_OFFSET		(6 * SZ_64K)
-#define CONFIG_ENV_SIZE			SZ_8K
 #define CONFIG_SYS_MMC_ENV_DEV		0
 
 /* VDD voltage 1.65 - 1.95 */
diff --git a/include/configs/warp7.h b/include/configs/warp7.h
index 73541fe17608..9a82581c5f3a 100644
--- a/include/configs/warp7.h
+++ b/include/configs/warp7.h
@@ -130,9 +130,7 @@
 #define CONFIG_SYS_I2C_SPEED		100000
 
 /* environment organization */
-#define CONFIG_ENV_SIZE			SZ_8K
 
-#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
 #define CONFIG_SYS_FSL_USDHC_NUM	1
 
 #define CONFIG_SYS_MMC_ENV_DEV		0
diff --git a/include/configs/wb45n.h b/include/configs/wb45n.h
index 43de2e111933..36060975c10e 100644
--- a/include/configs/wb45n.h
+++ b/include/configs/wb45n.h
@@ -66,9 +66,6 @@
 
 #ifdef CONFIG_SYS_USE_NANDFLASH
 /* bootstrap + u-boot + env + linux in nandflash */
-#define CONFIG_ENV_OFFSET           0xa0000
-#define CONFIG_ENV_OFFSET_REDUND    0xc0000
-#define CONFIG_ENV_SIZE             0x20000	/* 1 block = 128 kB */
 
 #define CONFIG_BOOTCOMMAND  "nand read 0x22000000 0xe0000 0x280000; " \
     "run _mtd; bootm"
diff --git a/include/configs/wb50n.h b/include/configs/wb50n.h
index 6e471f62e6be..ca1619f25116 100644
--- a/include/configs/wb50n.h
+++ b/include/configs/wb50n.h
@@ -72,7 +72,6 @@
     "autostart=no\0"
 
 /* bootstrap + u-boot + env in nandflash */
-#define CONFIG_ENV_OFFSET_REDUND    0xC0000
 #define CONFIG_BOOTCOMMAND \
     "nand read 0x22000000 0x000e0000 0x500000; " \
     "bootm"
diff --git a/include/configs/woodburn_common.h b/include/configs/woodburn_common.h
index d7c4a6f1f4d8..194e43ecc612 100644
--- a/include/configs/woodburn_common.h
+++ b/include/configs/woodburn_common.h
@@ -119,14 +119,7 @@
 #define CONFIG_SYS_MONITOR_BASE	CONFIG_SYS_FLASH_BASE
 #define CONFIG_SYS_MONITOR_LEN		(512 * 1024)
 
-#define CONFIG_ENV_SECT_SIZE	(128 * 1024)
-#define CONFIG_ENV_SIZE		CONFIG_ENV_SECT_SIZE
-
 /* Address and size of Redundant Environment Sector	*/
-#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
-
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + \
-				CONFIG_SYS_MONITOR_LEN)
 
 /*
  * CFI FLASH driver setup
diff --git a/include/configs/work_92105.h b/include/configs/work_92105.h
index e260a637d6fd..f73946b935a4 100644
--- a/include/configs/work_92105.h
+++ b/include/configs/work_92105.h
@@ -116,11 +116,6 @@
  * Environment
  */
 
-#define CONFIG_ENV_SIZE			0x00020000
-#define CONFIG_ENV_OFFSET		0x00100000
-#define CONFIG_ENV_OFFSET_REDUND	0x00120000
-#define CONFIG_ENV_ADDR			0x80000100
-
 /*
  * Boot Linux
  */
diff --git a/include/configs/x530.h b/include/configs/x530.h
index 2269d1ed8cd0..b4e986ebccdf 100644
--- a/include/configs/x530.h
+++ b/include/configs/x530.h
@@ -59,10 +59,6 @@
 #define CONFIG_EHCI_IS_TDI
 
 /* Environment in SPI NOR flash */
-#define CONFIG_ENV_OFFSET		(1 << 20) /* 1MiB in */
-#define CONFIG_ENV_SIZE			(64 << 10) /* 64KiB */
-#define CONFIG_ENV_SECT_SIZE		(256 << 10) /* 256KiB sectors */
-#define CONFIG_ENV_ADDR			CONFIG_ENV_OFFSET
 
 #define CONFIG_PHY_MARVELL		/* there is a marvell phy */
 #define PHY_ANEG_TIMEOUT	8000	/* PHY needs a longer aneg time */
diff --git a/include/configs/x600.h b/include/configs/x600.h
index f6779213a896..63092b24a53a 100644
--- a/include/configs/x600.h
+++ b/include/configs/x600.h
@@ -87,12 +87,6 @@
 /*
  * U-Boot Environment placing definitions.
  */
-#define CONFIG_ENV_SECT_SIZE			0x00010000
-#define CONFIG_ENV_ADDR				(CONFIG_SYS_MONITOR_BASE + \
-						 CONFIG_SYS_MONITOR_LEN)
-#define CONFIG_ENV_SIZE				0x02000
-#define CONFIG_ENV_ADDR_REDUND			(CONFIG_ENV_ADDR + \
-						 CONFIG_ENV_SECT_SIZE)
 
 /* Miscellaneous configurable options */
 #define CONFIG_BOOT_PARAMS_ADDR			0x00000100
diff --git a/include/configs/x86-chromebook.h b/include/configs/x86-chromebook.h
index 5a33223b7ddf..0efc7156a6dd 100644
--- a/include/configs/x86-chromebook.h
+++ b/include/configs/x86-chromebook.h
@@ -28,11 +28,6 @@
 #define VIDEO_IO_OFFSET				0
 #define CONFIG_X86EMU_RAW_IO
 
-#undef CONFIG_ENV_SIZE
-#define CONFIG_ENV_SIZE			0x1000
-#define CONFIG_ENV_SECT_SIZE		0x1000
-#define CONFIG_ENV_OFFSET		0x003f8000
-
 #define CONFIG_STD_DEVICES_SETTINGS	"stdin=usbkbd,i8042-kbd,serial\0" \
 					"stdout=vidconsole,serial\0" \
 					"stderr=vidconsole,serial\0"
diff --git a/include/configs/x86-common.h b/include/configs/x86-common.h
index 54214f99e9a6..329b270467e2 100644
--- a/include/configs/x86-common.h
+++ b/include/configs/x86-common.h
@@ -79,7 +79,6 @@
 /*-----------------------------------------------------------------------
  * Environment configuration
  */
-#define CONFIG_ENV_SIZE			0x01000
 
 /*-----------------------------------------------------------------------
  * PCI configuration
diff --git a/include/configs/xfi3.h b/include/configs/xfi3.h
index afc4b82fd80f..51efab1d2c1a 100644
--- a/include/configs/xfi3.h
+++ b/include/configs/xfi3.h
@@ -13,7 +13,6 @@
 #define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM_1
 
 /* Environment */
-#define CONFIG_ENV_SIZE			(16 * 1024)
 #define CONFIG_ENV_OVERWRITE
 
 /* Booting Linux */
diff --git a/include/configs/xilinx_zynqmp_r5.h b/include/configs/xilinx_zynqmp_r5.h
index 4eb3312e2d2b..38d952d0c0cc 100644
--- a/include/configs/xilinx_zynqmp_r5.h
+++ b/include/configs/xilinx_zynqmp_r5.h
@@ -16,8 +16,6 @@
 #define CONFIG_SYS_BAUDRATE_TABLE  \
 	{300, 600, 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200, 230400}
 
-# define CONFIG_ENV_SIZE	(128 << 10)
-
 /* Allow to overwrite serial and ethaddr */
 #define CONFIG_ENV_OVERWRITE
 
diff --git a/include/configs/xpedite517x.h b/include/configs/xpedite517x.h
index 23f038961574..634ee4240993 100644
--- a/include/configs/xpedite517x.h
+++ b/include/configs/xpedite517x.h
@@ -485,9 +485,6 @@ extern unsigned long get_board_sys_clk(unsigned long dummy);
 /*
  * Environment Configuration
  */
-#define CONFIG_ENV_SECT_SIZE	0x20000		/* 128k (one sector) for env */
-#define CONFIG_ENV_SIZE		0x8000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE + CONFIG_SYS_MONITOR_LEN)
 
 /*
  * Flash memory map:
diff --git a/include/configs/xpedite520x.h b/include/configs/xpedite520x.h
index 21e91ee1a4dd..0186aaa10277 100644
--- a/include/configs/xpedite520x.h
+++ b/include/configs/xpedite520x.h
@@ -285,9 +285,6 @@
 /*
  * Environment Configuration
  */
-#define CONFIG_ENV_SECT_SIZE	0x20000		/* 128k (one sector) for env */
-#define CONFIG_ENV_SIZE		0x8000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - (256 * 1024))
 
 /*
  * Flash memory map:
diff --git a/include/configs/xpedite537x.h b/include/configs/xpedite537x.h
index 73e1fa313f88..5e027bebcabe 100644
--- a/include/configs/xpedite537x.h
+++ b/include/configs/xpedite537x.h
@@ -335,9 +335,6 @@ extern unsigned long get_board_ddr_clk(unsigned long dummy);
 /*
  * Environment Configuration
  */
-#define CONFIG_ENV_SECT_SIZE	0x20000		/* 128k (one sector) for env */
-#define CONFIG_ENV_SIZE		0x8000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - (256 * 1024))
 
 /*
  * Flash memory map:
diff --git a/include/configs/xpedite550x.h b/include/configs/xpedite550x.h
index e5a41abd4b52..611089cbb935 100644
--- a/include/configs/xpedite550x.h
+++ b/include/configs/xpedite550x.h
@@ -333,9 +333,6 @@ extern unsigned long get_board_ddr_clk(unsigned long dummy);
 /*
  * Environment Configuration
  */
-#define CONFIG_ENV_SECT_SIZE	0x20000		/* 128k (one sector) for env */
-#define CONFIG_ENV_SIZE		0x8000
-#define CONFIG_ENV_ADDR		(CONFIG_SYS_MONITOR_BASE - (256 * 1024))
 
 /*
  * Flash memory map:
diff --git a/include/configs/xpress.h b/include/configs/xpress.h
index 4cbf8aa5261d..dbdd812506b5 100644
--- a/include/configs/xpress.h
+++ b/include/configs/xpress.h
@@ -51,8 +51,6 @@
 	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
 
 /* Environment is in stored in the eMMC boot partition */
-#define CONFIG_ENV_SIZE			(16 << 10)
-#define CONFIG_ENV_OFFSET		(512 << 10)
 #define CONFIG_SYS_MMC_ENV_DEV		0	/* USDHC2 */
 #define CONFIG_SYS_MMC_ENV_PART		1	/* boot parition */
 #define CONFIG_MMCROOT			"/dev/mmcblk0p2"  /* USDHC2 */
diff --git a/include/configs/xtfpga.h b/include/configs/xtfpga.h
index 2f20273572d2..8b73900130d7 100644
--- a/include/configs/xtfpga.h
+++ b/include/configs/xtfpga.h
@@ -220,8 +220,6 @@
  * Put environment in top block (64kB)
  * Another option would be to put env. in 2nd param block offs 8KB, size 8KB
  */
-#define CONFIG_ENV_OFFSET    (CONFIG_SYS_FLASH_SIZE - CONFIG_SYS_FLASH_SECT_SZ)
-#define CONFIG_ENV_SIZE	     CONFIG_SYS_FLASH_SECT_SZ
 
 /* print 'E' for empty sector on flinfo */
 #define CONFIG_SYS_FLASH_EMPTY_INFO
diff --git a/include/configs/zmx25.h b/include/configs/zmx25.h
index 9d683768f4cf..a8c6f0be10d4 100644
--- a/include/configs/zmx25.h
+++ b/include/configs/zmx25.h
@@ -85,10 +85,6 @@
 #define CONFIG_SYS_MAX_FLASH_BANKS	1
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 
-#define CONFIG_ENV_ADDR			(CONFIG_SYS_FLASH_BASE + 0x00040000)
-#define CONFIG_ENV_SECT_SIZE		(128 * 1024)
-#define CONFIG_ENV_SIZE			(128 * 1024)
-
 /*
  * CFI FLASH driver setup
  */
diff --git a/include/env_internal.h b/include/env_internal.h
index b8158c0e0bc5..90a4df8a7273 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -30,26 +30,6 @@
  *************************************************************************/
 
 #if defined(CONFIG_ENV_IS_IN_FLASH)
-# ifndef	CONFIG_ENV_ADDR
-#  define	CONFIG_ENV_ADDR	(CONFIG_SYS_FLASH_BASE + CONFIG_ENV_OFFSET)
-# endif
-# ifndef	CONFIG_ENV_OFFSET
-#  define	CONFIG_ENV_OFFSET (CONFIG_ENV_ADDR - CONFIG_SYS_FLASH_BASE)
-# endif
-# if !defined(CONFIG_ENV_ADDR_REDUND) && defined(CONFIG_ENV_OFFSET_REDUND)
-#  define	CONFIG_ENV_ADDR_REDUND	\
-		(CONFIG_SYS_FLASH_BASE + CONFIG_ENV_OFFSET_REDUND)
-# endif
-# if defined(CONFIG_ENV_SECT_SIZE) || defined(CONFIG_ENV_SIZE)
-#  ifndef	CONFIG_ENV_SECT_SIZE
-#   define	CONFIG_ENV_SECT_SIZE	CONFIG_ENV_SIZE
-#  endif
-#  ifndef	CONFIG_ENV_SIZE
-#   define	CONFIG_ENV_SIZE	CONFIG_ENV_SECT_SIZE
-#  endif
-# else
-#  error "Both CONFIG_ENV_SECT_SIZE and CONFIG_ENV_SIZE undefined"
-# endif
 # if	defined(CONFIG_ENV_ADDR_REDUND) && \
 	((CONFIG_ENV_ADDR >= CONFIG_SYS_MONITOR_BASE) &&		\
 	(CONFIG_ENV_ADDR_REDUND + CONFIG_ENV_SIZE) <=		\
@@ -75,41 +55,9 @@
 #  endif
 extern unsigned long nand_env_oob_offset;
 #  define CONFIG_ENV_OFFSET nand_env_oob_offset
-# else
-#  ifndef CONFIG_ENV_OFFSET
-#   error "Need to define CONFIG_ENV_OFFSET when using CONFIG_ENV_IS_IN_NAND"
-#  endif
 # endif /* CONFIG_ENV_OFFSET_OOB */
-# ifndef CONFIG_ENV_SIZE
-#  error "Need to define CONFIG_ENV_SIZE when using CONFIG_ENV_IS_IN_NAND"
-# endif
 #endif /* CONFIG_ENV_IS_IN_NAND */
 
-#if defined(CONFIG_ENV_IS_IN_UBI)
-# ifndef CONFIG_ENV_UBI_PART
-#  error "Need to define CONFIG_ENV_UBI_PART when using CONFIG_ENV_IS_IN_UBI"
-# endif
-# ifndef CONFIG_ENV_UBI_VOLUME
-#  error "Need to define CONFIG_ENV_UBI_VOLUME when using CONFIG_ENV_IS_IN_UBI"
-# endif
-# ifndef CONFIG_ENV_SIZE
-#  error "Need to define CONFIG_ENV_SIZE when using CONFIG_ENV_IS_IN_UBI"
-# endif
-# ifndef CONFIG_CMD_UBI
-#  error "Need to define CONFIG_CMD_UBI when using CONFIG_ENV_IS_IN_UBI"
-# endif
-#endif /* CONFIG_ENV_IS_IN_UBI */
-
-/* Embedded env is only supported for some flash types */
-#ifdef CONFIG_ENV_IS_EMBEDDED
-# if	!defined(CONFIG_ENV_IS_IN_FLASH)	&& \
-	!defined(CONFIG_ENV_IS_IN_NAND)		&& \
-	!defined(CONFIG_ENV_IS_IN_ONENAND)	&& \
-	!defined(CONFIG_ENV_IS_IN_SPI_FLASH)
-#  error "CONFIG_ENV_IS_EMBEDDED not supported for your flash type"
-# endif
-#endif
-
 /*
  * For the flash types where embedded env is supported, but it cannot be
  * calculated automatically (i.e. NAND), take the board opt-in.
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index d73e433cffb1..284fb62e54c1 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -426,9 +426,7 @@ CONFIG_ENABLE_MMU
 CONFIG_ENABLE_MUST_CHECK
 CONFIG_ENABLE_WARN_DEPRECATED
 CONFIG_ENV_ACCESS_IGNORE_FORCE
-CONFIG_ENV_ADDR
 CONFIG_ENV_ADDR_FLEX
-CONFIG_ENV_ADDR_REDUND
 CONFIG_ENV_BASE
 CONFIG_ENV_CALLBACK_LIST_DEFAULT
 CONFIG_ENV_CALLBACK_LIST_STATIC
@@ -443,7 +441,6 @@ CONFIG_ENV_IS_IN_
 CONFIG_ENV_MAX_ENTRIES
 CONFIG_ENV_MIN_ENTRIES
 CONFIG_ENV_OFFSET_OOB
-CONFIG_ENV_OFFSET_REDUND
 CONFIG_ENV_OVERWRITE
 CONFIG_ENV_RANGE
 CONFIG_ENV_RDADDR
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEDE42719D
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFED8C5719E;
	Fri,  8 Oct 2021 19:57:01 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EA1CC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:00 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 h11-20020a4aa74b000000b002a933d156cbso3237621oom.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k6LydwOo/46kcAV9en4A5H7IRtw2Z1Ot26P82O9k5hk=;
 b=G8xvNqtpO+sex4zKNFi5ddMkkadPL/oKWkN+jOGo1HvAGuUKGwVYA47C10G0fe8mpk
 EGx00tCrgnolYtMOhXIKxQoinM2Z5hMCaR922uzg9bH18nDqTzB6eYIyeWzQ59zU6DWY
 0Z0zKwpCDo0Ubd8IYK6jh0H0kbepKkqUxqJxSSHxSftzTirmciAm0rRlYlg/qkfXiYXO
 afeCg3n6t0v7ulI1LoVzrkQR4gfvXC2+YQIhn3ZbKXS1ZjTm8I24Q+Z10hmjNZberZbw
 ktK6Ldk1DRy88qKdfb1VFCljMmmq3N2ZfscIGDnEkL9xm6O+bpDgWS+spO4NiEsNSWBl
 X9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k6LydwOo/46kcAV9en4A5H7IRtw2Z1Ot26P82O9k5hk=;
 b=5g4yEYeVf24qiJXDIZipI1Ea4kZjeXJi175aYQQzLyOEQzYn82e1M4u90dOzry1HMt
 CjOgn/n5sZhRVZB2+0i6siX+ar+yirIROVyzIc7AusXt2tmp0q473l/ebyEO8avndYq7
 272Vyqlf8aWSEmVyqs5y1HbxxPa8+trZB2UDrDzj2X9SoOO210BnXEJlODg/zgJds9i4
 l41QHdR3kCrf/uy/rdEdzNpD2dh7Mn3A5UoBAZrSbyUvrmaBUTpeORpP9pZhiYTCNs/h
 gPdj+uBwP2kIU3+O6wEmkwq9JS904RkmxqjUqcX2ya0P9gjnD/6EG1QRdG4x9tuSesO7
 ezEA==
X-Gm-Message-State: AOAM5338831evQhrtqaAMgSFeNckmda39Taiqqxl1yZVUv1O0LXnX+/x
 KvjU9PqM7a6ZqtzRPqE7pdPTL2l6zf8=
X-Google-Smtp-Source: ABdhPJxuGryYmcx5OwZLcOe05IuPbgH0Y24nSZNeyoS9UWFalcJFesFJTVvd9p++7ssNxoUNvwsmtw==
X-Received: by 2002:a4a:a442:: with SMTP id w2mr9445584ool.44.1633723018821;
 Fri, 08 Oct 2021 12:56:58 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:56:58 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:42 -0500
Message-Id: <20211008195655.46046-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 00/13] stm32mp1: Support falcon mode with
	OP-TEE payloads
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

The goal of this project is to to get to linux userspace within a
second from power on, and be secure! This is my last full-time day on
this project, so I don't expect to do a v4.

I chose to use SPL with a FIT payload. We have to add certain logic to
SPL, as well as some FDT modifications that would be normally done in
u-boot. The boot flow is

	SPL -> OP-TEE -> Linux


Patrick suggested more changes, but I decided against the following:


  I) Use SPL_OPTEE_IMAGE  in mach-stm32mp Kconfig selection

I explained in more detail in another email why this is a bad idea.


  II) Don't use USER2 button for falcon mode.

This already exists as "fastboot-gpios", but I wasn't supposed to use
it. So I aliased it as "falcon-gpios", but I'm again not supposed to
use it because it aliases an existing GPIO. This makes absolutely no
sense to me. I need a GPIO for this. This is America! I paid for the
button, I intend to use the button! [*]


  III) Use env_get_yesno("boot_os") to select falcon mode

I like this idea, but I feel it is part of the OS/SPL communication
mechanism, which is beyond the scope of this series.


  IV) Use if (serial_getc() == 'c') in spl_start_uboot()

I don't like the idea of doing serial input in SPL.


  V) Move SYS_MMCSD_RAW_MODE_ARGS_* to Kconfig

The boot flow herein does not use the ARGS partition.  It would
destroy the security model to allow an external unsigned devicetree.
I don't want to encourage others to use it, and I don't want to waste
time with it. I hope the args partition just fizzles away into
nothingness.


  VI) What the heck is "spl export"

"spl export" is the u-boot (not SPL) command used to patch the
devicetree and save it to the args partition mentioned above. This
series avoids "spl export" because:
it's a poor security choice (explained above).


  VII) Wait what? How does the devicetree work? Huh?

A complete kernel devicetree is obtained using two methods:
    a) FDT patching done by SPL to the FIT devicetree
    b) devicetree overlays from the FIT
Both (a) and (b) can be signed. In my specific use case, the bootargs
are applied as a devicetree overlay. It's super effective.

[*] This is meant to be humorous

Changes since v2:
    - Drop armv7_boot_nonsec() hack
    - Introduce CONFIG_SPL_FALCON_BOOT_MMCSD
    - Remove superfluous spl_start_uboot() symbol

Changes since v1:
    - Move SYS_MMCSD_RAW_MODE_KERNEL_SECTOR to Kconfig instead of stm32mp1.h
    - Create a new defconfig for STM32MP in falcon mode
    - Rework board_fit_config_name_match() per Patrick's suggestions
    - Use "u-boot,falcon-gpios" instead of "st,fastboot-gpios"
    - Only update shadow registers in SPL for BSEC .probe()
    
Alexandru Gagniuc (13):
  spl: Untagle spl_start_uboot() from spl_mmc.c
  spl: Move SYS_MMCSD_RAW_MODE_KERNEL_SECTOR to Kconfig
  stm32mp1: Add support for baudrates higher than 115200
  stm32mp1: Add support for falcon mode boot from SD card
  board: stm32mp1:  Implement board_fit_config_name_match() for SPL
  fdt_support: Implement fdt_ethernet_set_macaddr()
  arm: stm32mp: bsec: Update OTP shadow registers in SPL
  arm: stm32mp: Factor out reading MAC address from OTP
  stm32mp1: spl: Configure MAC address when booting OP-TEE
  lib: Makefile: Make optee library available in SPL
  ARM: dts: stm32mp: Add OP-TEE "/firmware" node to SPL dtb
  stm32mp1: spl: Copy optee nodes to target FDT for OP-TEE payloads
  ARM: dts: stm32mp: dts: Don't remove OPTEE nodes for DK2 boards

 README                                        |   4 -
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   6 +-
 arch/arm/mach-stm32mp/bsec.c                  |   4 +-
 arch/arm/mach-stm32mp/cpu.c                   |  59 ++++--
 .../arm/mach-stm32mp/include/mach/sys_proto.h |   3 +
 arch/arm/mach-stm32mp/spl.c                   |   3 +
 board/st/stm32mp1/spl.c                       |  43 ++++
 common/fdt_support.c                          |  30 +++
 common/spl/Kconfig                            |  16 ++
 common/spl/spl.c                              |  10 +-
 common/spl/spl_mmc.c                          |   6 +-
 configs/am335x_boneblack_vboot_defconfig      |   2 +
 configs/am335x_evm_defconfig                  |   2 +
 configs/am335x_igep003x_defconfig             |   2 +
 configs/am335x_shc_defconfig                  |   2 +
 configs/am335x_shc_ict_defconfig              |   2 +
 configs/am335x_shc_netboot_defconfig          |   2 +
 configs/am335x_shc_sdboot_defconfig           |   2 +
 configs/am335x_sl50_defconfig                 |   2 +
 configs/am3517_evm_defconfig                  |   2 +
 configs/am43xx_evm_defconfig                  |   2 +
 configs/am43xx_evm_rtconly_defconfig          |   2 +
 configs/am43xx_evm_usbhost_boot_defconfig     |   2 +
 configs/am57xx_evm_defconfig                  |   2 +
 configs/devkit8000_defconfig                  |   2 +
 configs/display5_defconfig                    |   2 +
 configs/display5_factory_defconfig            |   2 +
 configs/dra7xx_evm_defconfig                  |   2 +
 configs/gwventana_emmc_defconfig              |   2 +
 configs/gwventana_gw5904_defconfig            |   2 +
 configs/gwventana_nand_defconfig              |   2 +
 configs/igep00x0_defconfig                    |   2 +
 configs/imx6dl_mamoj_defconfig                |   2 +
 configs/imx6q_logic_defconfig                 |   2 +
 configs/omap35_logic_defconfig                |   2 +
 configs/omap35_logic_somlv_defconfig          |   2 +
 configs/omap3_logic_defconfig                 |   2 +
 configs/omap3_logic_somlv_defconfig           |   2 +
 configs/omap4_panda_defconfig                 |   2 +
 configs/omap5_uevm_defconfig                  |   2 +
 configs/stm32mp15_falcon_defconfig            | 183 ++++++++++++++++++
 include/configs/brppt1.h                      |   1 -
 include/configs/devkit8000.h                  |   2 -
 include/configs/display5.h                    |   1 -
 include/configs/embestmx6boards.h             |   1 -
 include/configs/gw_ventana.h                  |   1 -
 include/configs/imx6-engicam.h                |   1 -
 include/configs/imx6_logic.h                  |   1 -
 include/configs/imx6dl-mamoj.h                |   1 -
 include/configs/ls1043ardb.h                  |   1 -
 include/configs/mccmon6.h                     |   1 -
 include/configs/mx6sabreauto.h                |   1 -
 include/configs/mx6sabresd.h                  |   1 -
 include/configs/pico-imx6.h                   |   1 -
 include/configs/pico-imx6ul.h                 |   1 -
 include/configs/pico-imx7d.h                  |   1 -
 include/configs/sama5d3_xplained.h            |   1 -
 include/configs/stm32mp1.h                    |   4 +
 include/configs/tam3517-common.h              |   1 -
 include/configs/ti_armv7_common.h             |   1 -
 include/configs/vyasa-rk3288.h                |   1 -
 include/configs/xea.h                         |   1 -
 include/configs/xilinx_zynqmp.h               |   1 -
 include/configs/zynq-common.h                 |   1 -
 include/fdt_support.h                         |  17 ++
 lib/Makefile                                  |   2 +-
 scripts/config_whitelist.txt                  |   1 -
 67 files changed, 415 insertions(+), 57 deletions(-)
 create mode 100644 configs/stm32mp15_falcon_defconfig

-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

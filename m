Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2019F4031A9
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5C16C59781;
	Tue,  7 Sep 2021 23:59:40 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15195C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:37 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id z12so407922qvx.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aoCGuC/rJ2CHQGrc6bA6H6mqyDgnFDVuc7Im7+QEmQk=;
 b=LdELytZHHSsySwJCfjo/j9eMvNEnahX9VfATd7to03Qc+B1OFSGpXYEYMBOAHRxYJt
 uMGtqwb5ugJO0HqJvrspTMp92fqtHDq4i51qHbvKihuZmp008u0vLWBe0pBqqzeYRQhX
 vbNu5pujjLTHnzWBoE/6MOg6ihQDCQM55Lo5OTH5EfUoSENGCFutJRc3cftik/5aVdzq
 R+ytklOmcD9rfRQkmnh/r6UFz8hx0K4ML7Oyy4ztUfYkEggPlNR2wRkMTbnhrRsA1TFV
 LKR8JSTFfowrpDRLjsHMLxi7rFHXMHlrqmJu8KvG2HrQQCvMV+Ek1iL77CGfknv7FHYj
 cG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aoCGuC/rJ2CHQGrc6bA6H6mqyDgnFDVuc7Im7+QEmQk=;
 b=lMOiCaZvq2BYD+Dtnn5fwq1Z3tMkVmxsoUNY6P7rbCqWdLLHKwLJohtM6mMRBhw59v
 OOWppaIuH0YsKq/5jNYNnD/ogQlKolVZigoYVJIinF4TgXUd9nC1I1D0z4/ylqUzJROA
 hQ8QQag2IpZYo0JhB2Si5BJLIB02Ushijn6c3lGGYSs6lOdimSofpbW0q5Suxg7IqImy
 cXO1WaDuJMQJdIj3VWRkviFcdQCTSHXp02dRSFahiUjque4ts/yu61+FtpE8WR2MQfrx
 pQ1DSgAKWggyrdhk72Y2ykHdcMZNYBojolg5t5+XH6lAr9msGzLqwe0S6VCKEPM7CRid
 wZxA==
X-Gm-Message-State: AOAM533qyTj03KF8owsT3MxQeWP/Da3801W/50+jBWLjkrDt2fKWWx7s
 cx1EDZAZ9s8pMXZNYA6gMxY=
X-Google-Smtp-Source: ABdhPJyqU7kSDo3FAUnzILAy7yMyxG6Dk9ZDcdRYgaeBLQ5az5fJI85+vDfo+TFjypQhxez240zpxQ==
X-Received: by 2002:a0c:aa55:: with SMTP id e21mr959492qvb.41.1631059176504;
 Tue, 07 Sep 2021 16:59:36 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:35 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:22 -0500
Message-Id: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 00/11] stm32mp1: Support falcon mode with
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

My goal when I started on this project a year ago was to get to linux
userspace within a second from power on. Oh, and it had to be secure!
Contrast that to the two minutes it took the STLinux demo to come up.

It was obvious that the accepted way of running an FSBL, then SSBL was
going to blow the time budget. There really wasn't a good solution,
and traditional falcon mode with "spl export" command was not secure.

I chose to use SPL with a FIT payload. We have to add certain logic to
SPL, as well as some FDT modifications that would be normally done in
u-boot. The boot flow is

	SPL -> OP-TEE -> Linux


One of the major complaints of v1 was that we shouldn't be patching
the devicetree with optee nodes in SPL. Instead, we should let OP-TEE
add the required nodes. I tried it, found a huge boot time penalty,
and decided against it.

Another issue from v1 that I was unable to address is the MAC address.
It was suggested to use the "nvmem-cells" FDT property to tell linux
where in the OTP to read the MAC. Because of the way the linux BSEC
driver is written, this would only work with TF-A, but fails with SPL.

There is also the issue of how to make the optee/ library available to
SPL. Patrick has a couple of patches up regarding the issue, so I have
not touched it in this series.


Changes since v1:
    - Move SYS_MMCSD_RAW_MODE_KERNEL_SECTOR to Kconfig instead of stm32mp1.h
    - Create a new defconfig for STM32MP in falcon mode
    - Rework board_fit_config_name_match() per Patrick's suggestions
    - Use "u-boot,falcon-gpios" instead of "st,fastboot-gpios"
    - Only update shadow registers in SPL for BSEC .probe()

Alexandru Gagniuc (11):
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

 README                                        |   4 -
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   3 +
 arch/arm/mach-stm32mp/bsec.c                  |   4 +-
 arch/arm/mach-stm32mp/cpu.c                   |  59 ++++--
 .../arm/mach-stm32mp/include/mach/sys_proto.h |   3 +
 arch/arm/mach-stm32mp/spl.c                   |   3 +
 board/st/stm32mp1/spl.c                       |  53 +++++
 common/fdt_support.c                          |  30 +++
 common/spl/Kconfig                            |  11 ++
 configs/am335x_boneblack_vboot_defconfig      |   1 +
 configs/am335x_evm_defconfig                  |   1 +
 configs/am335x_igep003x_defconfig             |   1 +
 configs/am335x_shc_defconfig                  |   1 +
 configs/am335x_shc_ict_defconfig              |   1 +
 configs/am335x_shc_netboot_defconfig          |   1 +
 configs/am335x_shc_sdboot_defconfig           |   1 +
 configs/am335x_sl50_defconfig                 |   1 +
 configs/am3517_evm_defconfig                  |   1 +
 configs/am43xx_evm_defconfig                  |   1 +
 configs/am43xx_evm_rtconly_defconfig          |   1 +
 configs/am43xx_evm_usbhost_boot_defconfig     |   1 +
 configs/am57xx_evm_defconfig                  |   1 +
 configs/devkit8000_defconfig                  |   1 +
 configs/display5_defconfig                    |   1 +
 configs/display5_factory_defconfig            |   1 +
 configs/dra7xx_evm_defconfig                  |   1 +
 configs/gwventana_emmc_defconfig              |   1 +
 configs/gwventana_gw5904_defconfig            |   1 +
 configs/gwventana_nand_defconfig              |   1 +
 configs/igep00x0_defconfig                    |   1 +
 configs/imx6dl_mamoj_defconfig                |   1 +
 configs/imx6q_logic_defconfig                 |   1 +
 configs/imx6qdl_icore_mipi_defconfig          |   1 +
 configs/imx6qdl_icore_mmc_defconfig           |   1 +
 configs/imx6qdl_icore_rqs_defconfig           |   1 +
 configs/mccmon6_nor_defconfig                 |   1 +
 configs/omap35_logic_defconfig                |   1 +
 configs/omap35_logic_somlv_defconfig          |   1 +
 configs/omap3_logic_defconfig                 |   1 +
 configs/omap3_logic_somlv_defconfig           |   1 +
 configs/omap4_panda_defconfig                 |   1 +
 configs/omap5_uevm_defconfig                  |   1 +
 configs/stm32mp15_falcon_defconfig            | 181 ++++++++++++++++++
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
 69 files changed, 386 insertions(+), 45 deletions(-)
 create mode 100644 configs/stm32mp15_falcon_defconfig

-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

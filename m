Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC43450892
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 16:32:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA639C5EC6B;
	Mon, 15 Nov 2021 15:32:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35E2CC5EC56
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 15:32:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AF9us2o013912;
 Mon, 15 Nov 2021 16:32:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=BCnR8kj6R65q8enM2jFmDFM8MIj2dv2cbzsa/d1b/Xw=;
 b=AbZwhK6rt6difvybKh9zg+k1nMP+ZiX5OKoXCnXlGjzauDskKeXhpT6/4wJHIKOM+p4D
 MgTL4iwBq0aYjxS5e+ruZf6UBEDjZd4auf6KY3VTBAZojHl6pxSI2fANenjoVmKxAucb
 goJ0w9msnwsOIPFjyVlhvrXourt6vxavDwcWHzvYcrDcKr7GuihUXsyg6/f+1MAvDFDI
 Y+lexb3zfvfjuAneydq59tnxntL276rTm8AhbMdvmNY6qyUEFTh+8a0eLVjxt9fvAQGQ
 wdReV6bqI1MKth3JO20pILBnqe0T770MrEGpWq8MJgP9NijucoPH9ps1wW50oyvnSpA2 zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben34p6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 16:32:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E3E410002A;
 Mon, 15 Nov 2021 16:32:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0B18237D6D;
 Mon, 15 Nov 2021 16:32:35 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 16:32:35
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 16:32:16 +0100
Message-ID: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
Cc: Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Asherah Connor <ashe@kivikakk.ee>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>, Anatolij Gustschin <agust@denx.de>,
 Thomas Huth <thuth@redhat.com>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, Joel Peshkin <joel.peshkin@broadcom.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>, Artem Lapkin <email2tema@gmail.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@foss.st.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 0/7] stm32mp1: enable simple framebuffer node
	for splashscreen
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


Use simple framebuffer node in the Linux kernel device tree
to preserved the resources (clock, memory) used by the stm32 video
driver to display the splashscreen.

See Linux documentation for details:
Documentation/devicetree/bindings/display/simple-framebuffer.yaml

The 3 first commits of the series are cleanup steps:
migration to Kconfig and rename files and function to fdt_simplefb_
(it seems like a good time time as this function is only used today
 in RPI boards)

patch 4 is a preliminary step = add video_is_active function

patch 5 add a new API fdt_simplefb_enable_and_mem_rsv
to activate node and add reserved memory for video memory

patch 6 avoid a issue in kernel when the reserved video memory by
LTDC driver is not aligned with Linux kernel MMU_SECTION_SIZE

patch 7 use this new function in stm32mp1 code for STMicroelectronics
boards when the simple-framebuffer node is present in Linux device tree



Patrick Delaunay (7):
  Convert CONFIG_LCD_DT_SIMPLEFB to Kconfig
  common: rename lcd_simplefb.c file to fdt_simplefb.c
  common: rename functions lcd_dt_simplefb to fdt_simplefb
  video: Add video_is_active function
  common: add fdt_simplefb_enable_and_mem_rsv function
  video: stm32: stm32_ltdc: align framebuffer on 2MB
  board: stm32mp1: enable simple framebuffer node for splashscreen

 board/raspberrypi/rpi/rpi.c               |  2 +-
 board/st/stm32mp1/stm32mp1.c              |  4 +++
 common/Kconfig                            |  9 ++++++
 common/Makefile                           |  2 +-
 common/{lcd_simplefb.c => fdt_simplefb.c} | 37 ++++++++++++++++++++---
 configs/rpi_0_w_defconfig                 |  1 +
 configs/rpi_2_defconfig                   |  1 +
 configs/rpi_3_32b_defconfig               |  1 +
 configs/rpi_3_b_plus_defconfig            |  1 +
 configs/rpi_3_defconfig                   |  1 +
 configs/rpi_4_32b_defconfig               |  1 +
 configs/rpi_4_defconfig                   |  1 +
 configs/rpi_arm64_defconfig               |  1 +
 configs/rpi_defconfig                     |  1 +
 configs/stm32mp15_basic_defconfig         |  1 +
 configs/stm32mp15_defconfig               |  1 +
 configs/stm32mp15_trusted_defconfig       |  1 +
 drivers/video/stm32/stm32_ltdc.c          |  5 ++-
 drivers/video/video-uclass.c              | 14 +++++++++
 include/configs/rpi.h                     |  1 -
 include/fdt_simplefb.h                    |  5 +--
 include/video.h                           |  7 +++++
 scripts/config_whitelist.txt              |  1 -
 23 files changed, 87 insertions(+), 12 deletions(-)
 rename common/{lcd_simplefb.c => fdt_simplefb.c} (65%)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

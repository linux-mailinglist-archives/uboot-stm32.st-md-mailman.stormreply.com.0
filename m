Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D74305D7E
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 14:47:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 013ECC57183;
	Wed, 27 Jan 2021 13:47:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1999CC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 13:47:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10RDg5xK010574; Wed, 27 Jan 2021 14:46:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=98mZdO3esKbB5pSKRzjAFFH9WLGd+abyKnBBSwx1erA=;
 b=PqAbtETIuy9IQg1woq+BAGmERy2rJVb6qkAK2XbsTZk49i70nq8Chjb/K28+3TJJoxVH
 s6PW7pJaUowbonB91DTORFC7XYIINY8AmiHYlUD2iUGJzKgtUJB8PRpyj8eCVSPU72N2
 FqhF6Pyr9qYwlBTsAyMQwMfNnZ6vADE7MKfmR3YVLoclKnPOmNq8WAcZapJ6HFoaVgLk
 L9CjF4gPZBM1x0YsISqM0r1C8OGQ0DByB5XU+ufwEOjAyjd+JRsdeyb0ecq8GX7quQc5
 DQbUsZT52qH1z+8xP8Od8tDxPkediJQGS5sDN9lnrq3523e3fAZT3sPNMyvi+miYtmAg 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjngbc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 14:46:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02C24100038;
 Wed, 27 Jan 2021 14:46:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4C49243711;
 Wed, 27 Jan 2021 14:46:51 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan 2021 14:46:51
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Jan 2021 14:46:45 +0100
Message-ID: <20210127134649.27380-1-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabien Parent <fparent@baylibre.com>,
 Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
 Filip Brozovic <fbrozovic@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sam Protsenko <joe.skb7@gmail.com>,
 Roman Stratiienko <r.stratiienko@gmail.com>,
 Mingming lee <mingming.lee@mediatek.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [Uboot-stm32] [PATCH v2 0/4] fastboot: mmc: Add
	CONFIG_FASTBOOT_MMC_USER_SUPPORT
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


Hi,

It is a rebased V2 version of the serie [1].

This serie adds a lot of new #if and doesn't respect the last
U-Boot coding rules with 14 warnings detected by checkpatch:

  warning: Use 'if (IS_ENABLED(CONFIG...))'
           instead of '#if or #ifdef' where possible

But I chose to copy the existing code of the fastboot files
fb_command.c to a have an easier review.

So I prefer sent a patch (if it is required) to remove all the
#ifdef in this file when the serie will be accepted.

I check compilation of the added features on stm32mp1 platform
with the serie [2].

The compilation for modified boards (with already activated config
CONFIG_FASTBOOT_MMC_BOOT1_SUPPORT) is verified with buildman:

tools/buildman/buildman mt8512_bm1_emmc mt8518_ap1_emmc pumpkin
Building current source for 3 boards (3 threads, 4 jobs per thread)
   aarch64:  w+   pumpkin
+===================== WARNING ======================
+This board does not use CONFIG_DM_ETH (Driver Model
+for Ethernet drivers). Please update the board to use
+CONFIG_DM_ETH before the v2020.07 release. Failure to
+update by the deadline may result in board removal.
+See doc/driver-model/migration.rst for more info.
+====================================================
   aarch64:  w+   mt8518_ap1_emmc
+===================== WARNING ======================
+This board does not use CONFIG_DM_ETH (Driver Model
+for Ethernet drivers). Please update the board to use
+CONFIG_DM_ETH before the v2020.07 release. Failure to
+update by the deadline may result in board removal.
+See doc/driver-model/migration.rst for more info.
+====================================================
   aarch64:  w+   mt8512_bm1_emmc
+===================== WARNING ======================
+This board does not use CONFIG_DM_ETH (Driver Model
+for Ethernet drivers). Please update the board to use
+CONFIG_DM_ETH before the v2020.07 release. Failure to
+update by the deadline may result in board removal.
+See doc/driver-model/migration.rst for more info.
+====================================================
    0    3    0 /3              0:00:07  : mt8512_bm1_emmc
Completed: 3 total built, duration 0:00:23, rate 0.13

[1] "fastboot: mmc: Add CONFIG_FASTBOOT_MMC_USER_SUPPORT"
    http://patchwork.ozlabs.org/project/uboot/list/?series=200509&state=*

[2] "configs: stm32mp1: enable fastboot support of eMMC boot partition"
    http://patchwork.ozlabs.org/project/uboot/list/?series=200510

Regards

Patrick


Changes in v2:
- rebase on master branch
- new impact on pumpkin_defconfig and mt8512_bm1_emmc_defconfig
- new impact on pumpkin_defconfig and mt8512_bm1_emmc_defconfig

Patrick Delaunay (4):
  fastboot: mmc: Add CONFIG_FASTBOOT_MMC_USER_SUPPORT
  fastboot: mmc: extend flash/erase for both emmc hwpart 1 and 2
  fastboot: add command to select the default emmc hwpart for boot
  fastboot: add command to select the eMMC boot configuration

 configs/mt8512_bm1_emmc_defconfig |  3 +-
 configs/mt8518_ap1_emmc_defconfig |  3 +-
 configs/pumpkin_defconfig         |  3 +-
 doc/android/fastboot.rst          |  3 ++
 drivers/fastboot/Kconfig          | 62 ++++++++++++++++++++------
 drivers/fastboot/fb_command.c     | 72 +++++++++++++++++++++++++++++++
 drivers/fastboot/fb_mmc.c         | 52 ++++++++++++++--------
 include/fastboot.h                |  6 +++
 8 files changed, 171 insertions(+), 33 deletions(-)

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

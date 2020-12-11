Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E862D77DC
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Dec 2020 15:32:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDCC6C3FADC;
	Fri, 11 Dec 2020 14:32:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2D46C3FADB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Dec 2020 14:32:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BBEQxuZ008343; Fri, 11 Dec 2020 15:32:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=WGIO+am41VQcTI6q2TW4ruZs3ZpZ/hvuNVw11xzWI+4=;
 b=kvSUdQ6KDjPPH1RV59AR5gg+vokwxWqNVNdrztK+nd0TPZESGrzqBXfQ9tvb6npw13Wn
 zDlVkjuQRhFebLFHPj7ERBrPb50hEZDXRpHBvsQrownB1ijl7hvB+tcM1U0OhwpGp3Ze
 o1vam0tJfeDDTCNi8IPOzGBBwRjV2DXQiCkyIswfBOGglyNp3MqY1xl0N7gnKLppvxVl
 akyk15dCdA9NQNpWaEV9rWCq2toGYu0iSbrrnPgdntvhgsUf3R2herY3tpHwN7IRna9J
 k0d2LEA/5EyaKuyQ1UhZl8RPmUtUKvNVsJ8NnBmgaIfXlQE93ladJ4qM/hpuWYZJ/JSp yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35agwg388f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 15:32:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20EE0100034;
 Fri, 11 Dec 2020 15:32:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D5E42A4D64;
 Fri, 11 Dec 2020 15:32:33 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec 2020 15:32:32
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 11 Dec 2020 15:32:30 +0100
Message-ID: <20201211153227.1.Ia09f70e65ce3bc2d845ad37b802d6096f690fc94@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_02:2020-12-11,
 2020-12-11 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp1: activate OF_LIVE for DT
	live support
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

Activate the live DT to reduce the DT parsing time.

For example the boot time is reduced by 200ms on STM32MP157C-EV1 board
for stm32mp15_basic_defconfig (boot with SPL) or
stm32mp15_trusted_defconfig (boot with TF-A).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Commit for u-boot/next = v2021.04

The result on v2020.10 is:

1/stm32mp15_trusted_defconfig

After the activation

       Mark    Elapsed  Stage
          0          0  reset
    594,115    594,115  board_init_f
    764,062    169,947  board_init_r
  1,025,234    261,172  id=64
  1,025,493        259  id=65
  1,027,413      1,920  main_loop
  3,545,057  2,517,644  id=175

Accumulated time:
                 1,430  dm_r
                15,112  of_live
                54,715  dm_f

Before the activation
       Mark    Elapsed  Stage
          0          0  reset
    596,882    596,882  board_init_f
    766,787    169,905  board_init_r
  1,228,988    462,201  id=64
  1,251,699     22,711  id=65
  1,252,401        702  main_loop
  4,028,952  2,776,551  id=175

Accumulated time:
                54,671  dm_f
                66,176  dm_r

2/stm32mp15_basic_defconfig
After the activation

STM32MP> bootstage report
Timer summary in microseconds (13 records):
       Mark    Elapsed  Stage
          0          0  reset
    223,315    223,315  SPL
  1,093,158    869,843  end SPL
  1,095,947      2,789  board_init_f
  1,317,473    221,526  board_init_r
  1,580,003    262,530  id=64
  1,580,265        262  id=65
  1,582,181      1,916  main_loop
  4,465,148  2,882,967  id=175

Accumulated time:
                 1,405  dm_r
                15,107  of_live
                54,606  dm_f
                89,236  dm_spl

Before the activation

STM32MP>  bootstage report
Timer summary in microseconds (12 records):
       Mark    Elapsed  Stage
          0          0  reset
    223,304    223,304  SPL
  1,083,749    860,445  end SPL
  1,086,755      3,006  board_init_f
  1,309,658    222,903  board_init_r
  1,771,209    461,551  id=64
  1,794,252     23,043  id=65
  1,794,953        701  main_loop
  4,348,874  2,553,921  id=175

Accumulated time:
                55,045  dm_f
                66,755  dm_r
                87,872  dm_spl

This patch depends on 2 patches already merged in u-boot/next branch:

[1] gpio: Convert to use APIs which support live DT
http://patchwork.ozlabs.org/project/uboot/patch/20200909162617.31576-1-patrick.delaunay@st.com/

[2] power: regulator: gpio-regulator: Convert to use APIs which support live DT
http://patchwork.ozlabs.org/project/uboot/patch/20200910161817.27535-2-patrick.delaunay@st.com/


 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 1843bbcc78..9d3d40c4c4 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -56,6 +56,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_UBI=y
 # CONFIG_SPL_DOS_PARTITION is not set
+CONFIG_OF_LIVE=y
 CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_MMC=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 964f4c2885..4cd7d1265d 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -39,6 +39,7 @@ CONFIG_CMD_REGULATOR=y
 CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_CMD_UBI=y
+CONFIG_OF_LIVE=y
 CONFIG_ENV_IS_NOWHERE=y
 CONFIG_ENV_IS_IN_MMC=y
 CONFIG_ENV_IS_IN_SPI_FLASH=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

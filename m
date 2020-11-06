Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E882A9B68
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D499C36B36;
	Fri,  6 Nov 2020 18:02:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED0F6C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HvRhJ007306; Fri, 6 Nov 2020 19:02:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uxLKrUI04ofG28S3MZahmZp2MdgSvaLF/u/4RYRSw0Y=;
 b=iRZcberRuspTkjQ4O8NtbQWvEVzU1/xgcx1LQp575GDX67Q91bDO6S5KxKc+q1MbfUaR
 K5dH1Lvk6yfjYKV8O212gty09qQrLA15poG1EU8bv1wKfocshfO6Bdu/gMQtmvdxlvkF
 8hX2sfW+tVFbAsYzJyniq7eeddgQ7UpUfLp49/glSM2vDfl1HjthAlij2CRcwOkysi46
 pIWMKuGo2JC+6XTFeM87P4XD7IHP//yWRzIyhhaiCBUp6lY/CC6dlB8uRvCMeiG+ltcb
 t8BOy9ygq7kD7TOk/RjqLT+NUaqEcdOPU0NccEwSmXY7QMQybgogUdSLyeXZauJU7ojR rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h0328rw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFB70100038;
 Fri,  6 Nov 2020 19:02:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A93D824C782;
 Fri,  6 Nov 2020 19:02:18 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:17
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:36 +0100
Message-ID: <20201106180201.31784-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 08/33] ram: stm32mp1: migrate trace to dev
	or log macro
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

Define LOG_CATEGORY, use dev_ macro when it is possible
and migrate other trace to log_ macro.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2:
- Add dm/device_compat.h

 drivers/ram/stm32mp1/stm32mp1_ddr.c         |  36 +++---
 drivers/ram/stm32mp1/stm32mp1_interactive.c |   4 +-
 drivers/ram/stm32mp1/stm32mp1_ram.c         |  38 +++---
 drivers/ram/stm32mp1/stm32mp1_tests.c       |  19 +--
 drivers/ram/stm32mp1/stm32mp1_tuning.c      | 124 ++++++++++----------
 5 files changed, 117 insertions(+), 104 deletions(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr.c b/drivers/ram/stm32mp1/stm32mp1_ddr.c
index bf3a4c97a4..0457166b12 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ddr.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ddr.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_RAM
+
 #include <common.h>
 #include <clk.h>
 #include <log.h>
@@ -311,17 +313,17 @@ static void set_reg(const struct ddr_info *priv,
 	u32 base_addr = get_base_addr(priv, base);
 	const struct reg_desc *desc = ddr_registers[type].desc;
 
-	debug("init %s\n", ddr_registers[type].name);
+	log_debug("init %s\n", ddr_registers[type].name);
 	for (i = 0; i < ddr_registers[type].size; i++) {
 		ptr = (unsigned int *)(base_addr + desc[i].offset);
 		if (desc[i].par_offset == INVALID_OFFSET) {
-			pr_err("invalid parameter offset for %s", desc[i].name);
+			log_err("invalid parameter offset for %s", desc[i].name);
 		} else {
 			value = *((u32 *)((u32)param +
 					       desc[i].par_offset));
 			writel(value, ptr);
-			debug("[0x%x] %s= 0x%08x\n",
-			      (u32)ptr, desc[i].name, value);
+			log_debug("[0x%x] %s= 0x%08x\n",
+				  (u32)ptr, desc[i].name, value);
 		}
 	}
 }
@@ -564,16 +566,16 @@ static void ddrphy_idone_wait(struct stm32mp1_ddrphy *phy)
 					 DDRPHYC_PGSR_RVERR |
 					 DDRPHYC_PGSR_RVEIRR),
 				1000000);
-	debug("\n[0x%08x] pgsr = 0x%08x ret=%d\n",
-	      (u32)&phy->pgsr, pgsr, ret);
+	log_debug("\n[0x%08x] pgsr = 0x%08x ret=%d\n",
+		  (u32)&phy->pgsr, pgsr, ret);
 }
 
 void stm32mp1_ddrphy_init(struct stm32mp1_ddrphy *phy, u32 pir)
 {
 	pir |= DDRPHYC_PIR_INIT;
 	writel(pir, &phy->pir);
-	debug("[0x%08x] pir = 0x%08x -> 0x%08x\n",
-	      (u32)&phy->pir, pir, readl(&phy->pir));
+	log_debug("[0x%08x] pir = 0x%08x -> 0x%08x\n",
+		  (u32)&phy->pir, pir, readl(&phy->pir));
 
 	/* need to wait 10 configuration clock before start polling */
 	udelay(10);
@@ -603,7 +605,7 @@ static void wait_sw_done_ack(struct stm32mp1_ddrctl *ctl)
 		panic("Timeout initialising DRAM : DDR->swstat = %x\n",
 		      swstat);
 
-	debug("[0x%08x] swstat = 0x%08x\n", (u32)&ctl->swstat, swstat);
+	log_debug("[0x%08x] swstat = 0x%08x\n", (u32)&ctl->swstat, swstat);
 }
 
 /* wait quasi dynamic register update */
@@ -634,7 +636,7 @@ static void wait_operating_mode(struct ddr_info *priv, int mode)
 	if (ret)
 		panic("Timeout DRAM : DDR->stat = %x\n", stat);
 
-	debug("[0x%08x] stat = 0x%08x\n", (u32)&priv->ctl->stat, stat);
+	log_debug("[0x%08x] stat = 0x%08x\n", (u32)&priv->ctl->stat, stat);
 }
 
 void stm32mp1_refresh_disable(struct stm32mp1_ddrctl *ctl)
@@ -706,9 +708,9 @@ void stm32mp1_ddr_init(struct ddr_info *priv,
 		panic("ddr power init failed\n");
 
 start:
-	debug("name = %s\n", config->info.name);
-	debug("speed = %d kHz\n", config->info.speed);
-	debug("size  = 0x%x\n", config->info.size);
+	log_debug("name = %s\n", config->info.name);
+	log_debug("speed = %d kHz\n", config->info.speed);
+	log_debug("size  = 0x%x\n", config->info.size);
 /*
  * 1. Program the DWC_ddr_umctl2 registers
  * 1.1 RESETS: presetn, core_ddrc_rstn, aresetn
@@ -745,8 +747,8 @@ start:
 /* 1.5. initialize registers ddr_umctl2 */
 	/* Stop uMCTL2 before PHY is ready */
 	clrbits_le32(&priv->ctl->dfimisc, DDRCTRL_DFIMISC_DFI_INIT_COMPLETE_EN);
-	debug("[0x%08x] dfimisc = 0x%08x\n",
-	      (u32)&priv->ctl->dfimisc, readl(&priv->ctl->dfimisc));
+	log_debug("[0x%08x] dfimisc = 0x%08x\n",
+		  (u32)&priv->ctl->dfimisc, readl(&priv->ctl->dfimisc));
 
 	set_reg(priv, REG_REG, &config->c_reg);
 	set_reg(priv, REG_TIMING, &config->c_timing);
@@ -809,9 +811,9 @@ start:
 	wait_operating_mode(priv, DDRCTRL_STAT_OPERATING_MODE_NORMAL);
 
 	if (config->p_cal_present) {
-		debug("DDR DQS training skipped.\n");
+		log_debug("DDR DQS training skipped.\n");
 	} else {
-		debug("DDR DQS training : ");
+		log_debug("DDR DQS training : ");
 /*  8. Disable Auto refresh and power down by setting
  *    - RFSHCTL3.dis_au_refresh = 1
  *    - PWRCTL.powerdown_en = 0
diff --git a/drivers/ram/stm32mp1/stm32mp1_interactive.c b/drivers/ram/stm32mp1/stm32mp1_interactive.c
index 5a5d067046..e45a2489c5 100644
--- a/drivers/ram/stm32mp1/stm32mp1_interactive.c
+++ b/drivers/ram/stm32mp1/stm32mp1_interactive.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_RAM
+
 #include <common.h>
 #include <command.h>
 #include <console.h>
@@ -404,7 +406,7 @@ bool stm32mp1_ddr_interactive(void *priv,
 #endif
 	}
 
-	debug("** step %d ** %s / %d\n", step, step_str[step], next_step);
+	log_debug("** step %d ** %s / %d\n", step, step_str[step], next_step);
 
 	if (next_step < 0)
 		return false;
diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index 9022679703..4c4807bfa6 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_RAM
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -12,6 +14,7 @@
 #include <regmap.h>
 #include <syscon.h>
 #include <asm/io.h>
+#include <dm/device_compat.h>
 #include "stm32mp1_ddr.h"
 
 static const char *const clkname[] = {
@@ -37,7 +40,7 @@ int stm32mp1_ddr_clk_enable(struct ddr_info *priv, uint32_t mem_speed)
 			ret = clk_enable(&clk);
 
 		if (ret) {
-			printf("error for %s : %d\n", clkname[idx], ret);
+			log_err("error for %s : %d\n", clkname[idx], ret);
 			return ret;
 		}
 	}
@@ -45,13 +48,13 @@ int stm32mp1_ddr_clk_enable(struct ddr_info *priv, uint32_t mem_speed)
 	priv->clk = clk;
 	ddrphy_clk = clk_get_rate(&priv->clk);
 
-	debug("DDR: mem_speed (%d kHz), RCC %d kHz\n",
-	      mem_speed, (u32)(ddrphy_clk / 1000));
+	log_debug("DDR: mem_speed (%d kHz), RCC %d kHz\n",
+		  mem_speed, (u32)(ddrphy_clk / 1000));
 	/* max 10% frequency delta */
 	ddr_clk = abs(ddrphy_clk - mem_speed * 1000);
 	if (ddr_clk > (mem_speed * 100)) {
-		pr_err("DDR expected freq %d kHz, current is %d kHz\n",
-		       mem_speed, (u32)(ddrphy_clk / 1000));
+		log_err("DDR expected freq %d kHz, current is %d kHz\n",
+			mem_speed, (u32)(ddrphy_clk / 1000));
 		return -EINVAL;
 	}
 
@@ -118,7 +121,7 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
 	config.info.size = ofnode_read_u32_default(node, "st,mem-size", 0);
 	config.info.name = ofnode_read_string(node, "st,mem-name");
 	if (!config.info.name) {
-		debug("%s: no st,mem-name\n", __func__);
+		dev_dbg(dev, "no st,mem-name\n");
 		return -EINVAL;
 	}
 	printf("RAM: %s\n", config.info.name);
@@ -128,12 +131,12 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
 					 (void *)((u32)&config +
 						  param[idx].offset),
 					 param[idx].size);
-		debug("%s: %s[0x%x] = %d\n", __func__,
-		      param[idx].name, param[idx].size, ret);
+		dev_dbg(dev, "%s: %s[0x%x] = %d\n", __func__,
+			param[idx].name, param[idx].size, ret);
 		if (ret &&
 		    (ret != -FDT_ERR_NOTFOUND || !param[idx].present)) {
-			pr_err("%s: Cannot read %s, error=%d\n",
-			       __func__, param[idx].name, ret);
+			dev_err(dev, "Cannot read %s, error=%d\n",
+				param[idx].name, ret);
 			return -EINVAL;
 		}
 		if (param[idx].present) {
@@ -153,7 +156,7 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
 
 	ret = clk_get_by_name(dev, "axidcg", &axidcg);
 	if (ret) {
-		debug("%s: Cannot found axidcg\n", __func__);
+		dev_dbg(dev, "%s: Cannot found axidcg\n", __func__);
 		return -EINVAL;
 	}
 	clk_disable(&axidcg); /* disable clock gating during init */
@@ -163,13 +166,13 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
 	clk_enable(&axidcg); /* enable clock gating */
 
 	/* check size */
-	debug("%s : get_ram_size(%x, %x)\n", __func__,
-	      (u32)priv->info.base, (u32)STM32_DDR_SIZE);
+	dev_dbg(dev, "get_ram_size(%x, %x)\n",
+		(u32)priv->info.base, (u32)STM32_DDR_SIZE);
 
 	priv->info.size = get_ram_size((long *)priv->info.base,
 				       STM32_DDR_SIZE);
 
-	debug("%s : %x\n", __func__, (u32)priv->info.size);
+	dev_dbg(dev, "info.size: %x\n", (u32)priv->info.size);
 
 	/* check memory access for all memory */
 	if (config.info.size != priv->info.size) {
@@ -186,12 +189,11 @@ static int stm32mp1_ddr_probe(struct udevice *dev)
 	struct regmap *map;
 	int ret;
 
-	debug("STM32MP1 DDR probe\n");
 	priv->dev = dev;
 
 	ret = regmap_init_mem(dev_ofnode(dev), &map);
 	if (ret)
-		return ret;
+		return log_ret(ret);
 
 	priv->ctl = regmap_get_range(map, 0);
 	priv->phy = regmap_get_range(map, 1);
@@ -203,7 +205,9 @@ static int stm32mp1_ddr_probe(struct udevice *dev)
 #if !defined(CONFIG_TFABOOT) && \
 	(!defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD))
 	priv->info.size = 0;
-	return stm32mp1_ddr_setup(dev);
+	ret = stm32mp1_ddr_setup(dev);
+
+	return log_ret(ret);
 #else
 	ofnode node = stm32mp1_ddr_get_ofnode(dev);
 	priv->info.size = ofnode_read_u32_default(node, "st,mem-size", 0);
diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
index 952006aa14..1fcc7cfd69 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tests.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
@@ -2,6 +2,9 @@
 /*
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
  */
+
+#define LOG_CATEGORY UCLASS_RAM
+
 #include <common.h>
 #include <console.h>
 #include <init.h>
@@ -197,8 +200,8 @@ static u32 databus(u32 *address)
 
 		/* Read it back (immediately is okay for this test). */
 		read_value = readl(address);
-		debug("%x: %x <=> %x\n",
-		      (u32)address, read_value, pattern);
+		log_debug("%x: %x <=> %x\n",
+			  (u32)address, read_value, pattern);
 
 		if (read_value != pattern)
 			return pattern;
@@ -252,8 +255,8 @@ static u32 *addressbus(u32 *address, u32 nb_bytes)
 
 	for (offset = 1; (offset & mask) != 0; offset <<= 1) {
 		read_value = readl(&address[offset]);
-		debug("%x: %x <=> %x\n",
-		      (u32)&address[offset], read_value, pattern);
+		log_debug("%x: %x <=> %x\n",
+			  (u32)&address[offset], read_value, pattern);
 		if (read_value != pattern)
 			return &address[offset];
 	}
@@ -363,8 +366,8 @@ static enum test_result databuswalk0(struct stm32mp1_ddrctl *ctl,
 			data = readl(addr + 4 * i);
 			if (~(1 << i) !=  data) {
 				error |= 1 << i;
-				debug("%x: error %x expected %x => error:%x\n",
-				      addr + 4 * i, data, ~(1 << i), error);
+				log_debug("%x: error %x expected %x => error:%x\n",
+					  addr + 4 * i, data, ~(1 << i), error);
 			}
 		}
 		if (test_loop_end(&loop, nb_loop, 1000))
@@ -403,8 +406,8 @@ static enum test_result databuswalk1(struct stm32mp1_ddrctl *ctl,
 			data = readl(addr + 4 * i);
 			if ((1 << i) !=  data) {
 				error |= 1 << i;
-				debug("%x: error %x expected %x => error:%x\n",
-				      addr + 4 * i, data, (1 << i), error);
+				log_debug("%x: error %x expected %x => error:%x\n",
+					  addr + 4 * i, data, (1 << i), error);
 			}
 		}
 		if (test_loop_end(&loop, nb_loop, 1000))
diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
index a8d6892bb0..c8cd7c3cea 100644
--- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
+++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
@@ -2,6 +2,9 @@
 /*
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
  */
+
+#define LOG_CATEGORY UCLASS_RAM
+
 #include <common.h>
 #include <console.h>
 #include <clk.h>
@@ -227,8 +230,7 @@ static u8 DQ_unit_index(struct stm32mp1_ddrphy *phy, u8 byte, u8 bit)
 	index = (readl(addr) >> DDRPHYC_DXNDQTR_DQDLY_SHIFT(bit))
 		& DDRPHYC_DXNDQTR_DQDLY_LOW_MASK;
 
-	pr_debug("%s: [%x]: %x => DQ unit index = %x\n",
-		 __func__, addr, readl(addr), index);
+	log_debug("[%x]: %x => DQ unit index = %x\n", addr, readl(addr), index);
 
 	return index;
 }
@@ -470,13 +472,13 @@ static void apply_deskew_results(struct stm32mp1_ddrphy *phy, u8 byte,
 	for (bit_i = 0; bit_i < 8; bit_i++) {
 		set_DQ_unit_delay(phy, byte, bit_i, deskew_delay[byte][bit_i]);
 		index = DQ_unit_index(phy, byte, bit_i);
-		pr_debug("Byte %d ; bit %d : The new DQ delay (%d) index=%d [delta=%d, 3 is the default]",
-			 byte, bit_i, deskew_delay[byte][bit_i],
-			 index, index - 3);
+		log_debug("Byte %d ; bit %d : The new DQ delay (%d) index=%d [delta=%d, 3 is the default]",
+			  byte, bit_i, deskew_delay[byte][bit_i],
+			  index, index - 3);
 		printf("Byte %d, bit %d, DQ delay = %d",
 		       byte, bit_i, deskew_delay[byte][bit_i]);
 		if (deskew_non_converge[byte][bit_i] == 1)
-			pr_debug(" - not converged : still more skew");
+			log_debug(" - not converged : still more skew");
 		printf("\n");
 	}
 }
@@ -536,7 +538,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 
 	/* Config the BIST block */
 	config_BIST(ctl, phy);
-	pr_debug("BIST Config done.\n");
+	log_debug("BIST Config done.\n");
 
 	/* Train each byte */
 	for (datx8 = 0; datx8 < nb_bytes; datx8++) {
@@ -545,9 +547,9 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 				datx8 + 1, nb_bytes, error);
 			return TEST_FAILED;
 		}
-		pr_debug("\n======================\n");
-		pr_debug("Start deskew byte %d .\n", datx8);
-		pr_debug("======================\n");
+		log_debug("\n======================\n");
+		log_debug("Start deskew byte %d .\n", datx8);
+		log_debug("======================\n");
 		/* Enable Byte (DXNGCR, bit DXEN) */
 		setbits_le32(DXNGCR(phy, datx8), DDRPHYC_DXNGCR_DXEN);
 
@@ -584,7 +586,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 		 * Else, look for Pass init condition
 		 */
 		if (!success) {
-			pr_debug("Fail at init condtion. Let's look for a good init condition.\n");
+			log_debug("Fail at init condtion. Let's look for a good init condition.\n");
 			success = 0; /* init */
 			/* Make sure we start with a PASS condition before
 			 * looking for a fail condition.
@@ -592,7 +594,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 			 */
 
 			/* escape if we find a PASS */
-			pr_debug("increase Phase idx\n");
+			log_debug("increase Phase idx\n");
 			while (!success && (phase_idx <= MAX_DQS_PHASE_IDX)) {
 				DQS_phase_delay(phy, datx8, phase_idx);
 				BIST_test(phy, datx8, &result);
@@ -618,7 +620,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 			 * we have hold violation, lets try reduce DQS_unit
 			 * Delay
 			 */
-			pr_debug("Still fail. Try decrease DQS Unit delay\n");
+			log_debug("Still fail. Try decrease DQS Unit delay\n");
 
 			phase_idx = 0;
 			dqs_unit_delay_index = 0;
@@ -665,9 +667,9 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 			return TEST_FAILED;
 		}
 
-		pr_debug("there is a pass region for phase idx %d\n",
-			 phase_idx);
-		pr_debug("Step1: Find the first failing condition\n");
+		log_debug("there is a pass region for phase idx %d\n",
+			  phase_idx);
+		log_debug("Step1: Find the first failing condition\n");
 		/* Look for the first failing condition by PHASE stepping.
 		 * This part of the algo can finish without converging.
 		 */
@@ -692,9 +694,9 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 		 * stepping (minimal delay)
 		 */
 		if (!success) {
-			pr_debug("Fail region (PHASE) found phase idx %d\n",
-				 phase_idx);
-			pr_debug("Let's look for first success by DQS Unit steps\n");
+			log_debug("Fail region (PHASE) found phase idx %d\n",
+				  phase_idx);
+			log_debug("Let's look for first success by DQS Unit steps\n");
 			/* This part, the algo always converge */
 			phase_idx--;
 
@@ -721,7 +723,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 				/*+1 to get back to current condition */
 				last_right_ok.unit = dqs_unit_delay_index + 1;
 				last_right_ok.bits_delay = 0xFFFFFFFF;
-				pr_debug("Found %d\n", dqs_unit_delay_index);
+				log_debug("Found %d\n", dqs_unit_delay_index);
 			} else {
 				/* the last OK condition is then with the
 				 * previous phase_idx.
@@ -735,8 +737,8 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 				 */
 				last_right_ok.unit = 1;
 				last_right_ok.bits_delay = 0xFFFFFFFF;
-				pr_debug("Not Found : try previous phase %d\n",
-					 phase_idx - 1);
+				log_debug("Not Found : try previous phase %d\n",
+					  phase_idx - 1);
 
 				DQS_phase_delay(phy, datx8, phase_idx - 1);
 				dqs_unit_delay_index = 0;
@@ -749,8 +751,8 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 					BIST_test(phy, datx8, &result);
 					success = result.test_result;
 					dqs_unit_delay_index++;
-					pr_debug("dqs_unit_delay_index = %d, result = %d\n",
-						 dqs_unit_delay_index, success);
+					log_debug("dqs_unit_delay_index = %d, result = %d\n",
+						  dqs_unit_delay_index, success);
 				}
 
 				if (!success) {
@@ -758,7 +760,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 						 dqs_unit_delay_index - 1;
 				} else {
 					last_right_ok.unit = 0;
-					pr_debug("ERROR: failed region not FOUND");
+					log_debug("ERROR: failed region not FOUND");
 				}
 			}
 		} else {
@@ -775,7 +777,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 			last_right_ok.phase = MAX_DQS_PHASE_IDX;
 			last_right_ok.unit = MAX_DQS_UNIT_IDX;
 			last_right_ok.bits_delay = 0xFFFFFFFF;
-			pr_debug("Can't find the a fail condition\n");
+			log_debug("Can't find the a fail condition\n");
 		}
 
 		/* step 2:
@@ -787,9 +789,9 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 		 */
 		printf("Byte %d, DQS unit = %d, phase = %d\n",
 		       datx8, last_right_ok.unit, last_right_ok.phase);
-		pr_debug("Step2, unit = %d, phase = %d, bits delay=%x\n",
-			 last_right_ok.unit, last_right_ok.phase,
-			 last_right_ok.bits_delay);
+		log_debug("Step2, unit = %d, phase = %d, bits delay=%x\n",
+			  last_right_ok.unit, last_right_ok.phase,
+			  last_right_ok.bits_delay);
 
 		/* Restore the last_right_ok condtion. */
 		DQS_unit_delay(phy, datx8, last_right_ok.unit);
@@ -812,7 +814,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 					datx8 + 1, nb_bytes, error);
 				return error;
 			}
-			pr_debug("deskewing bit %d:\n", bit_i);
+			log_debug("deskewing bit %d:\n", bit_i);
 			success = 1; /* init */
 			/* Set all DQDLYn to maximum value.
 			 * Only bit_i will be down-delayed
@@ -855,10 +857,10 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 				 * at one bit.
 				 */
 				fail_found = 1;
-				pr_debug("Fail found on bit %d, for delay = %d => deskew[%d][%d] = %d\n",
-					 bit_i, bit_i_delay_index + 1,
-					 datx8, bit_i,
-					 deskew_delay[datx8][bit_i]);
+				log_debug("Fail found on bit %d, for delay = %d => deskew[%d][%d] = %d\n",
+					  bit_i, bit_i_delay_index + 1,
+					  datx8, bit_i,
+					  deskew_delay[datx8][bit_i]);
 			} else {
 				/* if we can find a success condition by
 				 * back-delaying this bit, just set the delay
@@ -870,20 +872,20 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
 				 * in the report.
 				 */
 				deskew_non_converge[datx8][bit_i] = 1;
-				pr_debug("Fail not found on bit %d => deskew[%d][%d] = %d\n",
-					 bit_i, datx8, bit_i,
-					 deskew_delay[datx8][bit_i]);
+				log_debug("Fail not found on bit %d => deskew[%d][%d] = %d\n",
+					  bit_i, datx8, bit_i,
+					  deskew_delay[datx8][bit_i]);
 			}
 		}
-		pr_debug("**********byte %d tuning complete************\n",
-			 datx8);
+		log_debug("**********byte %d tuning complete************\n",
+			  datx8);
 		/* If we can't find any failure by back delaying DQ lines,
 		 * hold the default values
 		 */
 		if (!fail_found) {
 			for (bit_i = 0; bit_i < 8; bit_i++)
 				deskew_delay[datx8][bit_i] = 0;
-			pr_debug("The Deskew algorithm can't converge, there is too much margin in your design. Good job!\n");
+			log_debug("The Deskew algorithm can't converge, there is too much margin in your design. Good job!\n");
 		}
 
 		apply_deskew_results(phy, datx8, deskew_delay,
@@ -986,7 +988,7 @@ static enum test_result eye_training(struct stm32mp1_ddrctl *ctl,
 		dqs_unit_delay_index_pass = dqs_unit_delay_index;
 		success = 0;
 
-		pr_debug("STEP0: Find Init delay\n");
+		log_debug("STEP0: Find Init delay\n");
 		/* STEP0: Find Init delay: a delay that put the system
 		 * in a "Pass" condition then (TODO) update
 		 * dqs_unit_delay_index_pass & phase_idx_pass
@@ -1035,7 +1037,7 @@ static enum test_result eye_training(struct stm32mp1_ddrctl *ctl,
 				byte + 1, nb_bytes, error);
 			return TEST_FAILED;
 		}
-		pr_debug("STEP1: Find LEFT PHASE DQS Bound\n");
+		log_debug("STEP1: Find LEFT PHASE DQS Bound\n");
 		/* STEP1: Find LEFT PHASE DQS Bound */
 		while ((phase_idx >= 0) &&
 		       (phase_idx <= MAX_DQS_PHASE_IDX) &&
@@ -1069,7 +1071,7 @@ static enum test_result eye_training(struct stm32mp1_ddrctl *ctl,
 				byte + 1, nb_bytes, error);
 			return TEST_FAILED;
 		}
-		pr_debug("STEP2: Find UNIT left bound\n");
+		log_debug("STEP2: Find UNIT left bound\n");
 		/* STEP2: Find UNIT left bound */
 		while ((dqs_unit_delay_index >= 0) &&
 		       !left_unit_bound_found) {
@@ -1097,7 +1099,7 @@ static enum test_result eye_training(struct stm32mp1_ddrctl *ctl,
 				byte + 1, nb_bytes, error);
 			return TEST_FAILED;
 		}
-		pr_debug("STEP3: Find PHase right bound\n");
+		log_debug("STEP3: Find PHase right bound\n");
 		/* STEP3: Find PHase right bound, start with "pass"
 		 * condition
 		 */
@@ -1135,7 +1137,7 @@ static enum test_result eye_training(struct stm32mp1_ddrctl *ctl,
 				byte + 1, nb_bytes, error);
 			return TEST_FAILED;
 		}
-		pr_debug("STEP4: Find UNIT right bound\n");
+		log_debug("STEP4: Find UNIT right bound\n");
 		/* STEP4: Find UNIT right bound */
 		while ((dqs_unit_delay_index <= MAX_DQS_UNIT_IDX) &&
 		       !right_unit_bound_found) {
@@ -1174,12 +1176,12 @@ static enum test_result eye_training(struct stm32mp1_ddrctl *ctl,
 			if (((right_bound.phase + left_bound.phase) % 2 == 1) &&
 			    eye_training_val[byte][1] != MAX_DQS_UNIT_IDX)
 				eye_training_val[byte][1]++;
-			pr_debug("** found phase : %d -  %d & unit %d - %d\n",
-				 right_bound.phase, left_bound.phase,
-				 right_bound.unit, left_bound.unit);
-			pr_debug("** calculating mid region: phase: %d  unit: %d (nominal is 3)\n",
-				 eye_training_val[byte][0],
-				 eye_training_val[byte][1]);
+			log_debug("** found phase : %d -  %d & unit %d - %d\n",
+				  right_bound.phase, left_bound.phase,
+				  right_bound.unit, left_bound.unit);
+			log_debug("** calculating mid region: phase: %d  unit: %d (nominal is 3)\n",
+				  eye_training_val[byte][0],
+				  eye_training_val[byte][1]);
 		} else {
 			/* PPPPPPPPPP, we're already good.
 			 * Set nominal values.
@@ -1280,11 +1282,11 @@ static u8 set_midpoint_read_dqs_gating(struct stm32mp1_ddrphy *phy, u8 byte,
 		 * or pppppff  or ffppppp
 		 */
 		if (left_bound_found || right_bound_found) {
-			pr_debug("idx0(%d): %d %d      idx1(%d) : %d %d\n",
-				 left_bound_found,
-				 right_bound_idx[0], left_bound_idx[0],
-				 right_bound_found,
-				 right_bound_idx[1], left_bound_idx[1]);
+			log_debug("idx0(%d): %d %d      idx1(%d) : %d %d\n",
+				  left_bound_found,
+				  right_bound_idx[0], left_bound_idx[0],
+				  right_bound_found,
+				  right_bound_idx[1], left_bound_idx[1]);
 			dqs_gate_values[byte][0] =
 				(right_bound_idx[0] + left_bound_idx[0]) / 2;
 			dqs_gate_values[byte][1] =
@@ -1319,14 +1321,14 @@ static u8 set_midpoint_read_dqs_gating(struct stm32mp1_ddrphy *phy, u8 byte,
 						left_bound_idx[0];
 				}
 			}
-			pr_debug("*******calculating mid region: system latency: %d  phase: %d********\n",
-				 dqs_gate_values[byte][0],
-				 dqs_gate_values[byte][1]);
-			pr_debug("*******the nominal values were system latency: 0  phase: 2*******\n");
+			log_debug("*******calculating mid region: system latency: %d  phase: %d********\n",
+				  dqs_gate_values[byte][0],
+				  dqs_gate_values[byte][1]);
+			log_debug("*******the nominal values were system latency: 0  phase: 2*******\n");
 		}
 	} else {
 		/* if intermitant, restore defaut values */
-		pr_debug("dqs gating:no regular fail/pass/fail found. defaults values restored.\n");
+		log_debug("dqs gating:no regular fail/pass/fail found. defaults values restored.\n");
 		dqs_gate_values[byte][0] = 0;
 		dqs_gate_values[byte][1] = 2;
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

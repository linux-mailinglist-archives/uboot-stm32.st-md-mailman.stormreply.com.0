Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093B28DC8F
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C124DC424B7;
	Wed, 14 Oct 2020 09:17:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE729C424B3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9DCHu008317; Wed, 14 Oct 2020 11:16:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BY8CMvaiK0bgjbcHB462T6frH45B8MI3zDDF5LLjU44=;
 b=RG9W85Y9BPLW0Sik+q3cf1nrnQgsFyxiQ0m3x89JyOp/dmxw4xtbK+3TroR99wBuaXxV
 0J2s/tfoY9lk2zUb7DpPN4m3kv7MR7p2wZdDXXFVyRNor8x+9ATUvtNXjSg0kAiTPhIr
 9EHeLzHx0DCCkgWwzr20xitfSF1XUgSSPbpRVK/o8kgoB1nNkR/wU7GMaXwHVeS8MDH9
 4gLvHakPDSFv2SU4P8oaumr6PzrDk607rwwR+OBWwrnKh+aF3enubpxvvDAZ/IN5+JFm
 LKHen/akC67qqiXY+X3FjuWMbG8O0yM/Toi0ilkif2q5qDuIOpWHK109XGHycxBXgvsr Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356ecfgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:16:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7074F100038;
 Wed, 14 Oct 2020 11:16:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 653BC2ABA3E;
 Wed, 14 Oct 2020 11:16:57 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:16:56
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:22 +0200
Message-ID: <20201014091646.4233-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Peng Fan <peng.fan@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 09/33] mmc: stm32_sdmmc2: migrate trace to dev
	and log macro
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

Define LOG_CATEGORY, use dev_ macro when it is possible.
Remove the "%s:" __func__  header as it is managed by dev macro
(dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 85 ++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 6d50356217..483660c9d3 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -4,6 +4,8 @@
  * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_MMC
+
 #include <common.h>
 #include <clk.h>
 #include <cpu_func.h>
@@ -200,10 +202,11 @@ struct stm32_sdmmc2_ctx {
 #define SDMMC_CMD_TIMEOUT		0xFFFFFFFF
 #define SDMMC_BUSYD0END_TIMEOUT_US	2000000
 
-static void stm32_sdmmc2_start_data(struct stm32_sdmmc2_priv *priv,
+static void stm32_sdmmc2_start_data(struct udevice *dev,
 				    struct mmc_data *data,
 				    struct stm32_sdmmc2_ctx *ctx)
 {
+	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
 	u32 data_ctrl, idmabase0;
 
 	/* Configure the SDMMC DPSM (Data Path State Machine) */
@@ -241,10 +244,11 @@ static void stm32_sdmmc2_start_data(struct stm32_sdmmc2_priv *priv,
 	writel(SDMMC_IDMACTRL_IDMAEN, priv->base + SDMMC_IDMACTRL);
 }
 
-static void stm32_sdmmc2_start_cmd(struct stm32_sdmmc2_priv *priv,
+static void stm32_sdmmc2_start_cmd(struct udevice *dev,
 				   struct mmc_cmd *cmd, u32 cmd_param,
 				   struct stm32_sdmmc2_ctx *ctx)
 {
+	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
 	u32 timeout = 0;
 
 	if (readl(priv->base + SDMMC_CMD) & SDMMC_CMD_CPSMEN)
@@ -290,10 +294,11 @@ static void stm32_sdmmc2_start_cmd(struct stm32_sdmmc2_priv *priv,
 	writel(cmd_param, priv->base + SDMMC_CMD);
 }
 
-static int stm32_sdmmc2_end_cmd(struct stm32_sdmmc2_priv *priv,
+static int stm32_sdmmc2_end_cmd(struct udevice *dev,
 				struct mmc_cmd *cmd,
 				struct stm32_sdmmc2_ctx *ctx)
 {
+	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
 	u32 mask = SDMMC_STA_CTIMEOUT;
 	u32 status;
 	int ret;
@@ -311,22 +316,22 @@ static int stm32_sdmmc2_end_cmd(struct stm32_sdmmc2_priv *priv,
 				 10000);
 
 	if (ret < 0) {
-		debug("%s: timeout reading SDMMC_STA register\n", __func__);
+		dev_dbg(dev, "timeout reading SDMMC_STA register\n");
 		ctx->dpsm_abort = true;
 		return ret;
 	}
 
 	/* Check status */
 	if (status & SDMMC_STA_CTIMEOUT) {
-		debug("%s: error SDMMC_STA_CTIMEOUT (0x%x) for cmd %d\n",
-		      __func__, status, cmd->cmdidx);
+		dev_dbg(dev, "error SDMMC_STA_CTIMEOUT (0x%x) for cmd %d\n",
+			status, cmd->cmdidx);
 		ctx->dpsm_abort = true;
 		return -ETIMEDOUT;
 	}
 
 	if (status & SDMMC_STA_CCRCFAIL && cmd->resp_type & MMC_RSP_CRC) {
-		debug("%s: error SDMMC_STA_CCRCFAIL (0x%x) for cmd %d\n",
-		      __func__, status, cmd->cmdidx);
+		dev_dbg(dev, "error SDMMC_STA_CCRCFAIL (0x%x) for cmd %d\n",
+			status, cmd->cmdidx);
 		ctx->dpsm_abort = true;
 		return -EILSEQ;
 	}
@@ -350,15 +355,15 @@ static int stm32_sdmmc2_end_cmd(struct stm32_sdmmc2_priv *priv,
 						 SDMMC_BUSYD0END_TIMEOUT_US);
 
 			if (ret < 0) {
-				debug("%s: timeout reading SDMMC_STA\n",
-				      __func__);
+				dev_dbg(dev, "timeout reading SDMMC_STA\n");
 				ctx->dpsm_abort = true;
 				return ret;
 			}
 
 			if (status & SDMMC_STA_DTIMEOUT) {
-				debug("%s: error SDMMC_STA_DTIMEOUT (0x%x)\n",
-				      __func__, status);
+				dev_dbg(dev,
+					"error SDMMC_STA_DTIMEOUT (0x%x)\n",
+					status);
 				ctx->dpsm_abort = true;
 				return -ETIMEDOUT;
 			}
@@ -368,11 +373,12 @@ static int stm32_sdmmc2_end_cmd(struct stm32_sdmmc2_priv *priv,
 	return 0;
 }
 
-static int stm32_sdmmc2_end_data(struct stm32_sdmmc2_priv *priv,
+static int stm32_sdmmc2_end_data(struct udevice *dev,
 				 struct mmc_cmd *cmd,
 				 struct mmc_data *data,
 				 struct stm32_sdmmc2_ctx *ctx)
 {
+	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
 	u32 mask = SDMMC_STA_DCRCFAIL | SDMMC_STA_DTIMEOUT |
 		   SDMMC_STA_IDMATE | SDMMC_STA_DATAEND;
 	u32 status;
@@ -394,37 +400,37 @@ static int stm32_sdmmc2_end_data(struct stm32_sdmmc2_priv *priv,
 		invalidate_dcache_range(ctx->cache_start, ctx->cache_end);
 
 	if (status & SDMMC_STA_DCRCFAIL) {
-		debug("%s: error SDMMC_STA_DCRCFAIL (0x%x) for cmd %d\n",
-		      __func__, status, cmd->cmdidx);
+		dev_dbg(dev, "error SDMMC_STA_DCRCFAIL (0x%x) for cmd %d\n",
+			status, cmd->cmdidx);
 		if (readl(priv->base + SDMMC_DCOUNT))
 			ctx->dpsm_abort = true;
 		return -EILSEQ;
 	}
 
 	if (status & SDMMC_STA_DTIMEOUT) {
-		debug("%s: error SDMMC_STA_DTIMEOUT (0x%x) for cmd %d\n",
-		      __func__, status, cmd->cmdidx);
+		dev_dbg(dev, "error SDMMC_STA_DTIMEOUT (0x%x) for cmd %d\n",
+			status, cmd->cmdidx);
 		ctx->dpsm_abort = true;
 		return -ETIMEDOUT;
 	}
 
 	if (status & SDMMC_STA_TXUNDERR) {
-		debug("%s: error SDMMC_STA_TXUNDERR (0x%x) for cmd %d\n",
-		      __func__, status, cmd->cmdidx);
+		dev_dbg(dev, "error SDMMC_STA_TXUNDERR (0x%x) for cmd %d\n",
+			status, cmd->cmdidx);
 		ctx->dpsm_abort = true;
 		return -EIO;
 	}
 
 	if (status & SDMMC_STA_RXOVERR) {
-		debug("%s: error SDMMC_STA_RXOVERR (0x%x) for cmd %d\n",
-		      __func__, status, cmd->cmdidx);
+		dev_dbg(dev, "error SDMMC_STA_RXOVERR (0x%x) for cmd %d\n",
+			status, cmd->cmdidx);
 		ctx->dpsm_abort = true;
 		return -EIO;
 	}
 
 	if (status & SDMMC_STA_IDMATE) {
-		debug("%s: error SDMMC_STA_IDMATE (0x%x) for cmd %d\n",
-		      __func__, status, cmd->cmdidx);
+		dev_dbg(dev, "error SDMMC_STA_IDMATE (0x%x) for cmd %d\n",
+			status, cmd->cmdidx);
 		ctx->dpsm_abort = true;
 		return -EIO;
 	}
@@ -448,19 +454,18 @@ retry_cmd:
 
 	if (data) {
 		ctx.data_length = data->blocks * data->blocksize;
-		stm32_sdmmc2_start_data(priv, data, &ctx);
+		stm32_sdmmc2_start_data(dev, data, &ctx);
 	}
 
-	stm32_sdmmc2_start_cmd(priv, cmd, cmdat, &ctx);
+	stm32_sdmmc2_start_cmd(dev, cmd, cmdat, &ctx);
 
-	debug("%s: send cmd %d data: 0x%x @ 0x%x\n",
-	      __func__, cmd->cmdidx,
-	      data ? ctx.data_length : 0, (unsigned int)data);
+	dev_dbg(dev, "send cmd %d data: 0x%x @ 0x%x\n",
+		cmd->cmdidx, data ? ctx.data_length : 0, (unsigned int)data);
 
-	ret = stm32_sdmmc2_end_cmd(priv, cmd, &ctx);
+	ret = stm32_sdmmc2_end_cmd(dev, cmd, &ctx);
 
 	if (data && !ret)
-		ret = stm32_sdmmc2_end_data(priv, cmd, data, &ctx);
+		ret = stm32_sdmmc2_end_data(dev, cmd, data, &ctx);
 
 	/* Clear flags */
 	writel(SDMMC_ICR_STATIC_FLAGS, priv->base + SDMMC_ICR);
@@ -478,26 +483,24 @@ retry_cmd:
 		stop_cmd.cmdarg = 0;
 		stop_cmd.resp_type = MMC_RSP_R1b;
 
-		debug("%s: send STOP command to abort dpsm treatments\n",
-		      __func__);
+		dev_dbg(dev, "send STOP command to abort dpsm treatments\n");
 
 		ctx.data_length = 0;
 
-		stm32_sdmmc2_start_cmd(priv, &stop_cmd,
+		stm32_sdmmc2_start_cmd(dev, &stop_cmd,
 				       SDMMC_CMD_CMDSTOP, &ctx);
-		stm32_sdmmc2_end_cmd(priv, &stop_cmd, &ctx);
+		stm32_sdmmc2_end_cmd(dev, &stop_cmd, &ctx);
 
 		writel(SDMMC_ICR_STATIC_FLAGS, priv->base + SDMMC_ICR);
 	}
 
 	if ((ret != -ETIMEDOUT) && (ret != 0) && retry) {
-		printf("%s: cmd %d failed, retrying ...\n",
-		       __func__, cmd->cmdidx);
+		dev_err(dev, "cmd %d failed, retrying ...\n", cmd->cmdidx);
 		retry--;
 		goto retry_cmd;
 	}
 
-	debug("%s: end for CMD %d, ret = %d\n", __func__, cmd->cmdidx, ret);
+	dev_dbg(dev, "end for CMD %d, ret = %d\n", cmd->cmdidx, ret);
 
 	return ret;
 }
@@ -579,8 +582,8 @@ static int stm32_sdmmc2_set_ios(struct udevice *dev)
 	u32 sys_clock = clk_get_rate(&priv->clk);
 	u32 clk = 0;
 
-	debug("%s: bus_with = %d, clock = %d\n", __func__,
-	      mmc->bus_width, mmc->clock);
+	dev_dbg(dev, "bus_with = %d, clock = %d\n",
+		mmc->bus_width, mmc->clock);
 
 	if (mmc->clk_disable)
 		stm32_sdmmc2_pwrcycle(priv);
@@ -616,7 +619,7 @@ static int stm32_sdmmc2_getcd(struct udevice *dev)
 {
 	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
 
-	debug("stm32_sdmmc2_getcd called\n");
+	dev_dbg(dev, "%s called\n", __func__);
 
 	if (dm_gpio_is_valid(&priv->cd_gpio))
 		return dm_gpio_get_value(&priv->cd_gpio);
@@ -695,7 +698,7 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
 	case 1:
 		break;
 	default:
-		pr_err("invalid \"bus-width\" property, force to 1\n");
+		dev_err(dev, "invalid \"bus-width\" property, force to 1\n");
 	}
 
 	upriv->mmc = &plat->mmc;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

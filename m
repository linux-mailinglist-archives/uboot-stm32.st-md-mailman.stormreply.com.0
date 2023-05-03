Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E45906F602F
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 May 2023 22:38:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A5D3C6A60C;
	Wed,  3 May 2023 20:38:08 +0000 (UTC)
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10A72C0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 20:38:07 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 6A7B05FD06;
 Wed,  3 May 2023 23:38:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1683146286;
 bh=2y0Mk2eeuISOG3yNFVx2Cg7lfIUDyrlPlYaBueiKAIg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=FGA4FMUsDBqJGqodMdmvEbErTDv9ieqM63KdKSW9rRZGhfnLYHKZ1sM50y7xzcuvN
 iZx6HEAHxNAe4i+TxBcLxzlmpUWUqHo6p1I+/eqkvREpTb0ClqihK3CZLAcWh4+etz
 zY4EVeDm/bVTjM7t++uCgxIFj0ismEOqmA1fboVYRR5Tc/7pji8j0Vg+PfHrgF3fgE
 tdF5MPyt4zVlfqAYJpDrbxmOS8oM1+uKVinyRWeuA2yaZU7z77PG67CzBdWw/9gF2Y
 aRG2+wi4ELM96ljbroeFRezA4l7jmKNdXqFBwApPLlo/udiJsFTpamEvazh1dCxAw/
 NDGkaDoKOThTA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Wed,  3 May 2023 23:38:06 +0300 (MSK)
From: Igor Prusov <ivprusov@sberdevices.ru>
To: Michal Simek <michal.simek@amd.com>, Daniel Schwierzeck
 <daniel.schwierzeck@gmail.com>, Lukasz Majewski <lukma@denx.de>, Sean
 Anderson <seanga2@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Chia-Wei
 Wang <chiawei_wang@aspeedtech.com>, Aspeed BMC SW team
 <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stefan Roese
 <sr@denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>
Date: Wed, 3 May 2023 23:37:14 +0300
Message-ID: <20230503203720.4128156-2-ivprusov@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503203720.4128156-1-ivprusov@sberdevices.ru>
References: <20230503203720.4128156-1-ivprusov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/05/03 17:34:00 #21213138
X-KSMG-AntiVirus-Status: Clean, skipped
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com,
 Igor Prusov <ivprusov@sberdevices.ru>
Subject: [Uboot-stm32] [RFC PATCH v2 1/7] clk: zynq: Move soc_clk_dump to
	Zynq clock driver
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

Move clock dump function in preparation for switching to dump function
in clk_ops.

Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
---
 arch/arm/mach-zynq/clk.c | 57 ---------------------------------------
 drivers/clk/clk_zynq.c   | 58 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 57 deletions(-)

diff --git a/arch/arm/mach-zynq/clk.c b/arch/arm/mach-zynq/clk.c
index 1945f60e08..e6a67326dd 100644
--- a/arch/arm/mach-zynq/clk.c
+++ b/arch/arm/mach-zynq/clk.c
@@ -13,20 +13,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-static const char * const clk_names[clk_max] = {
-	"armpll", "ddrpll", "iopll",
-	"cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x",
-	"ddr2x", "ddr3x", "dci",
-	"lqspi", "smc", "pcap", "gem0", "gem1",
-	"fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1",
-	"sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1", "dma",
-	"usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper",
-	"sdio0_aper", "sdio1_aper", "spi0_aper", "spi1_aper",
-	"can0_aper", "can1_aper", "i2c0_aper", "i2c1_aper",
-	"uart0_aper", "uart1_aper", "gpio_aper", "lqspi_aper",
-	"smc_aper", "swdt", "dbg_trc", "dbg_apb"
-};
-
 /**
  * set_cpu_clk_info() - Setup clock information
  *
@@ -65,46 +51,3 @@ int set_cpu_clk_info(void)
 
 	return 0;
 }
-
-/**
- * soc_clk_dump() - Print clock frequencies
- * Returns zero on success
- *
- * Implementation for the clk dump command.
- */
-int soc_clk_dump(void)
-{
-	struct udevice *dev;
-	int i, ret;
-
-	ret = uclass_get_device_by_driver(UCLASS_CLK,
-		DM_DRIVER_GET(zynq_clk), &dev);
-	if (ret)
-		return ret;
-
-	printf("clk\t\tfrequency\n");
-	for (i = 0; i < clk_max; i++) {
-		const char *name = clk_names[i];
-		if (name) {
-			struct clk clk;
-			unsigned long rate;
-
-			clk.id = i;
-			ret = clk_request(dev, &clk);
-			if (ret < 0)
-				return ret;
-
-			rate = clk_get_rate(&clk);
-
-			clk_free(&clk);
-
-			if ((rate == (unsigned long)-ENOSYS) ||
-			    (rate == (unsigned long)-ENXIO))
-				printf("%10s%20s\n", name, "unknown");
-			else
-				printf("%10s%20lu\n", name, rate);
-		}
-	}
-
-	return 0;
-}
diff --git a/drivers/clk/clk_zynq.c b/drivers/clk/clk_zynq.c
index e80500e382..be5226175f 100644
--- a/drivers/clk/clk_zynq.c
+++ b/drivers/clk/clk_zynq.c
@@ -454,6 +454,64 @@ static int dummy_enable(struct clk *clk)
 	return 0;
 }
 
+static const char * const clk_names[clk_max] = {
+	"armpll", "ddrpll", "iopll",
+	"cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x",
+	"ddr2x", "ddr3x", "dci",
+	"lqspi", "smc", "pcap", "gem0", "gem1",
+	"fclk0", "fclk1", "fclk2", "fclk3", "can0", "can1",
+	"sdio0", "sdio1", "uart0", "uart1", "spi0", "spi1", "dma",
+	"usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper",
+	"sdio0_aper", "sdio1_aper", "spi0_aper", "spi1_aper",
+	"can0_aper", "can1_aper", "i2c0_aper", "i2c1_aper",
+	"uart0_aper", "uart1_aper", "gpio_aper", "lqspi_aper",
+	"smc_aper", "swdt", "dbg_trc", "dbg_apb"
+};
+
+/**
+ * soc_clk_dump() - Print clock frequencies
+ * Returns zero on success
+ *
+ * Implementation for the clk dump command.
+ */
+int soc_clk_dump(void)
+{
+	struct udevice *dev;
+	int i, ret;
+
+	ret = uclass_get_device_by_driver(UCLASS_CLK,
+					  DM_DRIVER_GET(zynq_clk), &dev);
+	if (ret)
+		return ret;
+
+	printf("clk\t\tfrequency\n");
+	for (i = 0; i < clk_max; i++) {
+		const char *name = clk_names[i];
+
+		if (name) {
+			struct clk clk;
+			unsigned long rate;
+
+			clk.id = i;
+			ret = clk_request(dev, &clk);
+			if (ret < 0)
+				return ret;
+
+			rate = clk_get_rate(&clk);
+
+			clk_free(&clk);
+
+			if ((rate == (unsigned long)-ENOSYS) ||
+			    (rate == (unsigned long)-ENXIO))
+				printf("%10s%20s\n", name, "unknown");
+			else
+				printf("%10s%20lu\n", name, rate);
+		}
+	}
+
+	return 0;
+}
+
 static struct clk_ops zynq_clk_ops = {
 	.get_rate = zynq_clk_get_rate,
 #ifndef CONFIG_SPL_BUILD
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

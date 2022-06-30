Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9725615B2
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 11:10:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B3F9C04000;
	Thu, 30 Jun 2022 09:10:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4667AC03FC0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 09:10:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U5LKWn017896;
 Thu, 30 Jun 2022 11:10:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=AL1l35wwYfxYKaaeWsg/3rdOyPqK0az6Pb05rmQtXi0=;
 b=TDgdHWmhtWfLFeJWIUrsCCtpaMJrlMh3IZu4+jgwRV1LzT8i5jqBz2A9Zmx9qz32SHb6
 0TGuWcJHkrEdiDVPZmYAFNNBwoubCkUe5PJz5q/ydn2MOUZKfocBn1WVwvMVyAqf58hp
 yWrJUhqYUf80ciJi5Oi3csLs65+JKBbEDn1/PZNhmxW5nHsdXo57Qtu8ToTqrNvV3rHI
 AMT1j/gQst/wWaxbHmvx3y55e4MIV15gjm6b2ZUmBY7NUM+aJ/KeIRtnMUBxGe456Q+t
 2mulD2CqA57KiLWCLk/68pzKIGFoDX/NcNEgVIZja7paP1w3jTuwQ8pJhCq9chkRjoMI jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h0kbxqu1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 11:10:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62A8A10002A;
 Thu, 30 Jun 2022 11:10:23 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D0CF214D18;
 Thu, 30 Jun 2022 11:10:23 +0200 (CEST)
Received: from localhost (10.75.127.47) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 11:09:43 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 11:09:40 +0200
Message-ID: <20220630110938.1.Iada23492743e3af977e07c1f1b8c2f32550436f7@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_05,2022-06-28_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: restore support of not
	cache-aligned descriptor
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

Solve an issue with AXI_WIDTH_32 on a the 64 bytes cache line platform;
in this case the requested descriptor padding length should be 12 but the
associated parameter EQOS_DMA_CH0_CONTROL.DSL is limited to 3bits = 7.

As the DMA descriptor can't be correctly aligned with the cache line,
the maintenance of each descriptor can't be guaranteed by a simple cache
line operation: flush or invalid.

To avoid all the maintenance issues, these descriptors need to be allocated
in a NOT CACHEABLE memory by noncached_alloc() when
CONFIG_SYS_NONCACHED_MEMORY is enable.

This patch doesn't change the current behavior when the descriptors
can be cache-aligned with the field "Descriptor Skip Length" of
the DMA channel control register, when eqos->desc_pad = true.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
This patch is required for ETH support on STM32MP13x family
with AXI_WIDTH_32 value.

This patch doesn't change the behavior for other parameters, tested on
STM32MP15x boards.

 drivers/net/dwc_eth_qos.c | 79 ++++++++++++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 22 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 9d255cf95ff..0c2ba206056 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -51,6 +51,7 @@
 #include <asm/arch/clock.h>
 #include <asm/mach-imx/sys_proto.h>
 #endif
+#include <dm/device_compat.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 
@@ -210,6 +211,7 @@ struct eqos_dma_regs {
 #define EQOS_DMA_SYSBUS_MODE_BLEN4			BIT(1)
 
 #define EQOS_DMA_CH0_CONTROL_DSL_SHIFT			18
+#define EQOS_DMA_CH0_CONTROL_DSL_MAX			7
 #define EQOS_DMA_CH0_CONTROL_PBLX8			BIT(16)
 
 #define EQOS_DMA_CH0_TX_CONTROL_TXPBL_SHIFT		16
@@ -274,9 +276,11 @@ struct eqos_config {
 	struct eqos_ops *ops;
 };
 
+struct eqos_priv;
+
 struct eqos_ops {
-	void (*eqos_inval_desc)(void *desc);
-	void (*eqos_flush_desc)(void *desc);
+	void (*eqos_inval_desc)(struct eqos_priv *eqos, void *desc);
+	void (*eqos_flush_desc)(struct eqos_priv *eqos, void *desc);
 	void (*eqos_inval_buffer)(void *buf, size_t size);
 	void (*eqos_flush_buffer)(void *buf, size_t size);
 	int (*eqos_probe_resources)(struct udevice *dev);
@@ -319,6 +323,7 @@ struct eqos_priv {
 	bool started;
 	bool reg_access_ok;
 	bool clk_ck_enabled;
+	bool use_cached_mem;
 };
 
 /*
@@ -341,15 +346,38 @@ struct eqos_priv {
  */
 static void *eqos_alloc_descs(struct eqos_priv *eqos, unsigned int num)
 {
+	void *descs = NULL;
+	ulong desc_pad;
+
+	/*
+	 * if descriptors can to be cache-line aligned with the DSL =
+	 * "Descriptor Skip Length" field of the DMA channel control register
+	 */
 	eqos->desc_size = ALIGN(sizeof(struct eqos_desc),
 				(unsigned int)ARCH_DMA_MINALIGN);
+	desc_pad = (eqos->desc_size - sizeof(struct eqos_desc)) /
+		   eqos->config->axi_bus_width;
+	if (desc_pad <= EQOS_DMA_CH0_CONTROL_DSL_MAX) {
+		eqos->use_cached_mem = true;
+		descs = memalign(eqos->desc_size, num * eqos->desc_size);
+	} else {
+		eqos->use_cached_mem = false;
+		eqos->desc_size = sizeof(struct eqos_desc);
+#ifdef CONFIG_SYS_NONCACHED_MEMORY
+		descs = (void *)noncached_alloc(num * eqos->desc_size, ARCH_DMA_MINALIGN);
+#else
+		log_err("DMA descriptors with cached memory.");
+#endif
+	}
 
-	return memalign(eqos->desc_size, num * eqos->desc_size);
+	return descs;
 }
 
-static void eqos_free_descs(void *descs)
+static void eqos_free_descs(struct eqos_priv *eqos)
 {
-	free(descs);
+	if (eqos->use_cached_mem)
+		free(eqos->descs);
+	/* memory allocated by noncached_alloc() can't be freed */
 }
 
 static struct eqos_desc *eqos_get_desc(struct eqos_priv *eqos,
@@ -359,22 +387,24 @@ static struct eqos_desc *eqos_get_desc(struct eqos_priv *eqos,
 		((rx ? EQOS_DESCRIPTORS_TX : 0) + num) * eqos->desc_size;
 }
 
-static void eqos_inval_desc_generic(void *desc)
+static void eqos_inval_desc_generic(struct eqos_priv *eqos, void *desc)
 {
 	unsigned long start = (unsigned long)desc;
 	unsigned long end = ALIGN(start + sizeof(struct eqos_desc),
 				  ARCH_DMA_MINALIGN);
 
-	invalidate_dcache_range(start, end);
+	if (eqos->use_cached_mem)
+		invalidate_dcache_range(start, end);
 }
 
-static void eqos_flush_desc_generic(void *desc)
+static void eqos_flush_desc_generic(struct eqos_priv *eqos, void *desc)
 {
 	unsigned long start = (unsigned long)desc;
 	unsigned long end = ALIGN(start + sizeof(struct eqos_desc),
 				  ARCH_DMA_MINALIGN);
 
-	flush_dcache_range(start, end);
+	if (eqos->use_cached_mem)
+		flush_dcache_range(start, end);
 }
 
 static void eqos_inval_buffer_tegra186(void *buf, size_t size)
@@ -1262,12 +1292,17 @@ static int eqos_start(struct udevice *dev)
 			EQOS_MAX_PACKET_SIZE <<
 			EQOS_DMA_CH0_RX_CONTROL_RBSZ_SHIFT);
 
-	desc_pad = (eqos->desc_size - sizeof(struct eqos_desc)) /
-		   eqos->config->axi_bus_width;
+	setbits_le32(&eqos->dma_regs->ch0_control, EQOS_DMA_CH0_CONTROL_PBLX8);
 
-	setbits_le32(&eqos->dma_regs->ch0_control,
-		     EQOS_DMA_CH0_CONTROL_PBLX8 |
-		     (desc_pad << EQOS_DMA_CH0_CONTROL_DSL_SHIFT));
+	/* "Descriptor Skip Length" field of the DMA channel control register */
+	if (eqos->use_cached_mem) {
+		desc_pad = (eqos->desc_size - sizeof(struct eqos_desc)) /
+			    eqos->config->axi_bus_width;
+		setbits_le32(&eqos->dma_regs->ch0_control,
+			     desc_pad << EQOS_DMA_CH0_CONTROL_DSL_SHIFT);
+		if (desc_pad > EQOS_DMA_CH0_CONTROL_DSL_MAX)
+			dev_dbg(dev, "DMA_CH0_CONTROL.DSL overflow");
+	}
 
 	/*
 	 * Burst length must be < 1/2 FIFO size.
@@ -1300,7 +1335,7 @@ static int eqos_start(struct udevice *dev)
 
 	for (i = 0; i < EQOS_DESCRIPTORS_TX; i++) {
 		struct eqos_desc *tx_desc = eqos_get_desc(eqos, i, false);
-		eqos->config->ops->eqos_flush_desc(tx_desc);
+		eqos->config->ops->eqos_flush_desc(eqos, tx_desc);
 	}
 
 	for (i = 0; i < EQOS_DESCRIPTORS_RX; i++) {
@@ -1309,7 +1344,7 @@ static int eqos_start(struct udevice *dev)
 					     (i * EQOS_MAX_PACKET_SIZE));
 		rx_desc->des3 = EQOS_DESC3_OWN | EQOS_DESC3_BUF1V;
 		mb();
-		eqos->config->ops->eqos_flush_desc(rx_desc);
+		eqos->config->ops->eqos_flush_desc(eqos, rx_desc);
 		eqos->config->ops->eqos_inval_buffer(eqos->rx_dma_buf +
 						(i * EQOS_MAX_PACKET_SIZE),
 						EQOS_MAX_PACKET_SIZE);
@@ -1437,13 +1472,13 @@ static int eqos_send(struct udevice *dev, void *packet, int length)
 	 */
 	mb();
 	tx_desc->des3 = EQOS_DESC3_OWN | EQOS_DESC3_FD | EQOS_DESC3_LD | length;
-	eqos->config->ops->eqos_flush_desc(tx_desc);
+	eqos->config->ops->eqos_flush_desc(eqos, tx_desc);
 
 	writel((ulong)eqos_get_desc(eqos, eqos->tx_desc_idx, false),
 		&eqos->dma_regs->ch0_txdesc_tail_pointer);
 
 	for (i = 0; i < 1000000; i++) {
-		eqos->config->ops->eqos_inval_desc(tx_desc);
+		eqos->config->ops->eqos_inval_desc(eqos, tx_desc);
 		if (!(readl(&tx_desc->des3) & EQOS_DESC3_OWN))
 			return 0;
 		udelay(1);
@@ -1463,7 +1498,7 @@ static int eqos_recv(struct udevice *dev, int flags, uchar **packetp)
 	debug("%s(dev=%p, flags=%x):\n", __func__, dev, flags);
 
 	rx_desc = eqos_get_desc(eqos, eqos->rx_desc_idx, true);
-	eqos->config->ops->eqos_inval_desc(rx_desc);
+	eqos->config->ops->eqos_inval_desc(eqos, rx_desc);
 	if (rx_desc->des3 & EQOS_DESC3_OWN) {
 		debug("%s: RX packet not available\n", __func__);
 		return -EAGAIN;
@@ -1501,7 +1536,7 @@ static int eqos_free_pkt(struct udevice *dev, uchar *packet, int length)
 
 	rx_desc->des0 = 0;
 	mb();
-	eqos->config->ops->eqos_flush_desc(rx_desc);
+	eqos->config->ops->eqos_flush_desc(eqos, rx_desc);
 	eqos->config->ops->eqos_inval_buffer(packet, length);
 	rx_desc->des0 = (u32)(ulong)packet;
 	rx_desc->des1 = 0;
@@ -1512,7 +1547,7 @@ static int eqos_free_pkt(struct udevice *dev, uchar *packet, int length)
 	 */
 	mb();
 	rx_desc->des3 = EQOS_DESC3_OWN | EQOS_DESC3_BUF1V;
-	eqos->config->ops->eqos_flush_desc(rx_desc);
+	eqos->config->ops->eqos_flush_desc(eqos, rx_desc);
 
 	writel((ulong)rx_desc, &eqos->dma_regs->ch0_rxdesc_tail_pointer);
 
@@ -1587,7 +1622,7 @@ static int eqos_remove_resources_core(struct udevice *dev)
 	free(eqos->rx_pkt);
 	free(eqos->rx_dma_buf);
 	free(eqos->tx_dma_buf);
-	eqos_free_descs(eqos->descs);
+	eqos_free_descs(eqos);
 
 	debug("%s: OK\n", __func__);
 	return 0;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

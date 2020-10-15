Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D87728F5B3
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 17:18:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB7FEC3FADE;
	Thu, 15 Oct 2020 15:18:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FCC9C32EA3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 15:18:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FFCZl3017765; Thu, 15 Oct 2020 17:18:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=88tPXa28tQAqJiUmRGZINAnfBMnBugqAhrJoMO2CIfY=;
 b=HD2TKt65uBuJNbcfP46/BV1va9xP2oCq6G96YbGZKtnta8JfNe235aQCQaierO/y7dpn
 GIA2zafpN9pG8VdgYMat4chqJcGFiHkv0Y7rtq47fnEzJfr8E1CzC/QnV33cQJ7GeuNk
 GgLBQ8mlRZWZPojQljCC7ibVtvWbAA/SL4hdcWCz3hjnveskEYI20KTbqoTXjVjMGp0n
 VYWmgXTKLCPa3rfUzddsBJ5UlZIucYn186rBPXvOdi6Fh6MATJ0lRxnvtdTSoQjDUqyh
 +gCq+LBZuuHTaIpObi5d9uFzeDO9xfmP0RLJH3GPq/4Ly1d9fMZNNRRYvve223Y9IHp/ Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wqmgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 17:18:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FEFE10002A;
 Thu, 15 Oct 2020 17:18:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 647092B8A07;
 Thu, 15 Oct 2020 17:18:20 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct 2020 17:18:19
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Oct 2020 17:18:17 +0200
Message-ID: <20201015151817.29513-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_08:2020-10-14,
 2020-10-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] spi: migrate trace to dev and log macro in
	spi uclass
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

Define LOG_CATEGORY and change printf and pr_*
to dev_ (when dev is available) or log_ macro.

This patch adds the support of logging feature with log command
(filtering, display of device name in trace) and allows to
suppress traces via the syslog driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/spi/spi-uclass.c | 51 ++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-uclass.c b/drivers/spi/spi-uclass.c
index 55a8eed890..d5a1e3a676 100644
--- a/drivers/spi/spi-uclass.c
+++ b/drivers/spi/spi-uclass.c
@@ -3,12 +3,15 @@
  * Copyright (c) 2014 Google, Inc
  */
 
+#define LOG_CATEGORY UCLASS_SPI
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
 #include <log.h>
 #include <malloc.h>
 #include <spi.h>
+#include <dm/device_compat.h>
 #include <dm/device-internal.h>
 #include <dm/uclass-internal.h>
 #include <dm/lists.h>
@@ -29,7 +32,7 @@ static int spi_set_speed_mode(struct udevice *bus, int speed, int mode)
 	else
 		ret = -EINVAL;
 	if (ret) {
-		printf("Cannot set speed (err=%d)\n", ret);
+		dev_err(bus, "Cannot set speed (err=%d)\n", ret);
 		return ret;
 	}
 
@@ -38,7 +41,7 @@ static int spi_set_speed_mode(struct udevice *bus, int speed, int mode)
 	else
 		ret = -EINVAL;
 	if (ret) {
-		printf("Cannot set mode (err=%d)\n", ret);
+		dev_err(bus, "Cannot set mode (err=%d)\n", ret);
 		return ret;
 	}
 
@@ -138,13 +141,15 @@ int spi_write_then_read(struct spi_slave *slave, const u8 *opcode,
 
 	ret = spi_xfer(slave, n_opcode * 8, opcode, NULL, flags);
 	if (ret) {
-		debug("spi: failed to send command (%zu bytes): %d\n",
-		      n_opcode, ret);
+		dev_dbg(slave->dev,
+			"spi: failed to send command (%zu bytes): %d\n",
+			n_opcode, ret);
 	} else if (n_buf != 0) {
 		ret = spi_xfer(slave, n_buf * 8, txbuf, rxbuf, SPI_XFER_END);
 		if (ret)
-			debug("spi: failed to transfer %zu bytes of data: %d\n",
-			      n_buf, ret);
+			dev_dbg(slave->dev,
+				"spi: failed to transfer %zu bytes of data: %d\n",
+				n_buf, ret);
 	}
 
 	return ret;
@@ -248,7 +253,7 @@ int spi_find_chip_select(struct udevice *bus, int cs, struct udevice **devp)
 	}
 
 	if (ret) {
-		printf("Invalid cs %d (err=%d)\n", cs, ret);
+		dev_err(bus, "Invalid cs %d (err=%d)\n", cs, ret);
 		return ret;
 	}
 
@@ -257,7 +262,7 @@ int spi_find_chip_select(struct udevice *bus, int cs, struct udevice **devp)
 		struct dm_spi_slave_platdata *plat;
 
 		plat = dev_get_parent_platdata(dev);
-		debug("%s: plat=%p, cs=%d\n", __func__, plat, plat->cs);
+		dev_dbg(bus, "%s: plat=%p, cs=%d\n", __func__, plat, plat->cs);
 		if (plat->cs == cs) {
 			*devp = dev;
 			return 0;
@@ -275,7 +280,7 @@ int spi_cs_is_valid(unsigned int busnum, unsigned int cs)
 
 	ret = uclass_find_device_by_seq(UCLASS_SPI, busnum, false, &bus);
 	if (ret) {
-		debug("%s: No bus %d\n", __func__, busnum);
+		log_debug("%s: No bus %d\n", __func__, busnum);
 		return ret;
 	}
 
@@ -304,12 +309,12 @@ int spi_find_bus_and_cs(int busnum, int cs, struct udevice **busp,
 
 	ret = uclass_find_device_by_seq(UCLASS_SPI, busnum, false, &bus);
 	if (ret) {
-		debug("%s: No bus %d\n", __func__, busnum);
+		log_debug("%s: No bus %d\n", __func__, busnum);
 		return ret;
 	}
 	ret = spi_find_chip_select(bus, cs, &dev);
 	if (ret) {
-		debug("%s: No cs %d\n", __func__, cs);
+		dev_dbg(bus, "%s: No cs %d\n", __func__, cs);
 		return ret;
 	}
 	*busp = bus;
@@ -334,7 +339,7 @@ int spi_get_bus_and_cs(int busnum, int cs, int speed, int mode,
 	ret = uclass_get_device_by_seq(UCLASS_SPI, busnum, &bus);
 #endif
 	if (ret) {
-		printf("Invalid bus %d (err=%d)\n", busnum, ret);
+		log_err("Invalid bus %d (err=%d)\n", busnum, ret);
 		return ret;
 	}
 	ret = spi_find_chip_select(bus, cs, &dev);
@@ -345,12 +350,12 @@ int spi_get_bus_and_cs(int busnum, int cs, int speed, int mode,
 	 * SPI flash chip - we will bind to the correct driver.
 	 */
 	if (ret == -ENODEV && drv_name) {
-		debug("%s: Binding new device '%s', busnum=%d, cs=%d, driver=%s\n",
-		      __func__, dev_name, busnum, cs, drv_name);
+		dev_dbg(bus, "%s: Binding new device '%s', busnum=%d, cs=%d, driver=%s\n",
+			__func__, dev_name, busnum, cs, drv_name);
 		ret = device_bind_driver(bus, drv_name, dev_name, &dev);
 		if (ret) {
-			debug("%s: Unable to bind driver (ret=%d)\n", __func__,
-			      ret);
+			dev_dbg(bus, "%s: Unable to bind driver (ret=%d)\n",
+				__func__, ret);
 			return ret;
 		}
 		plat = dev_get_parent_platdata(dev);
@@ -358,15 +363,15 @@ int spi_get_bus_and_cs(int busnum, int cs, int speed, int mode,
 		if (speed) {
 			plat->max_hz = speed;
 		} else {
-			printf("Warning: SPI speed fallback to %u kHz\n",
-			       SPI_DEFAULT_SPEED_HZ / 1000);
+			dev_warn(bus,
+				 "Warning: SPI speed fallback to %u kHz\n",
+				 SPI_DEFAULT_SPEED_HZ / 1000);
 			plat->max_hz = SPI_DEFAULT_SPEED_HZ;
 		}
 		plat->mode = mode;
 		created = true;
 	} else if (ret) {
-		printf("Invalid chip select %d:%d (err=%d)\n", busnum, cs,
-		       ret);
+		dev_err(bus, "Invalid chip select %d:%d (err=%d)\n", busnum, cs, ret);
 		return ret;
 	}
 
@@ -394,13 +399,13 @@ int spi_get_bus_and_cs(int busnum, int cs, int speed, int mode,
 
 	*busp = bus;
 	*devp = slave;
-	debug("%s: bus=%p, slave=%p\n", __func__, bus, *devp);
+	log_debug("%s: bus=%p, slave=%p\n", __func__, bus, *devp);
 
 	return 0;
 
 err:
-	debug("%s: Error path, created=%d, device '%s'\n", __func__,
-	      created, dev->name);
+	log_debug("%s: Error path, created=%d, device '%s'\n", __func__,
+		  created, dev->name);
 	if (created) {
 		device_remove(dev, DM_REMOVE_NORMAL);
 		device_unbind(dev);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

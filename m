Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A47F5C1
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:08:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D451C35E0D
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 11:08:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D35A1C35E03
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 11:08:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72B1JWT028843; Fri, 2 Aug 2019 13:08:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=WfRKj7uql+7fVJ1e8DXQ4u5dm7+JqT/yoAQUA4nBip0=;
 b=uk8Ti4xn9fy18/cQxKKBgJib8VIC0YFfm53CklHQhA2Fa4ymgQRnr0BP/sbpZVdt8ZF5
 4eaOfOSn/NM4TR+360Izs5+9klQ1MyEQX1RRIDCAMPgOLjsTuzNh1+fY+H7Smo3OB2ct
 szi8IjgO4s/KHxHrJ3KPS9vkk8Cq5V2Y3uYbkXamIga1qAmHccha7WR5FSCIKoRZAK7C
 R54acKLiVMaHSk3Iep+0KD1vl8KmkjFlm6XKAYuD6A+u2L/oxYyOEHVySWi/RksaBNDY
 J9PxpuYklmwwJz4dpMWw4jfjKGSfHb0NRZHT8veFnyaFuu3S5RuknyI7DZj3WsPzpCoK DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u3vd06vuq-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 13:08:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3290231;
 Fri,  2 Aug 2019 11:08:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A823207409;
 Fri,  2 Aug 2019 13:08:14 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 13:08:14 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 13:08:13
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 13:08:03 +0200
Message-ID: <1564744088-16896-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
References: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_05:, , signatures=0
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/7] pmu: stpmic1: change specific NVM api
	to MISC
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

Use MISC u-class to export the NVM register (starting at 0xF8 offset)
and avoid specific API.
- SHADOW have offset < 0.
- NVM have register > 0

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 drivers/misc/stm32mp_fuse.c  | 44 ++++++++++++++++++--
 drivers/power/pmic/stpmic1.c | 98 +++++++++++++++++++++++++-------------------
 include/power/stpmic1.h      |  7 ----
 3 files changed, 96 insertions(+), 53 deletions(-)

diff --git a/drivers/misc/stm32mp_fuse.c b/drivers/misc/stm32mp_fuse.c
index a1a27d1..0eed345 100644
--- a/drivers/misc/stm32mp_fuse.c
+++ b/drivers/misc/stm32mp_fuse.c
@@ -40,8 +40,17 @@ int fuse_read(u32 bank, u32 word, u32 *val)
 
 #ifdef CONFIG_PMIC_STPMIC1
 	case STM32MP_NVM_BANK:
+		ret = uclass_get_device_by_driver(UCLASS_MISC,
+						  DM_GET_DRIVER(stpmic1_nvm),
+						  &dev);
+		if (ret)
+			return ret;
 		*val = 0;
-		ret = stpmic1_shadow_read_byte(word, (u8 *)val);
+		ret = misc_read(dev, -word, val, 1);
+		if (ret != 1)
+			ret = -EINVAL;
+		else
+			ret = 0;
 		break;
 #endif /* CONFIG_PMIC_STPMIC1 */
 
@@ -76,7 +85,16 @@ int fuse_prog(u32 bank, u32 word, u32 val)
 
 #ifdef CONFIG_PMIC_STPMIC1
 	case STM32MP_NVM_BANK:
-		ret = stpmic1_nvm_write_byte(word, (u8 *)&val);
+		ret = uclass_get_device_by_driver(UCLASS_MISC,
+						  DM_GET_DRIVER(stpmic1_nvm),
+						  &dev);
+		if (ret)
+			return ret;
+		ret = misc_write(dev, word, &val, 1);
+		if (ret != 1)
+			ret = -EINVAL;
+		else
+			ret = 0;
 		break;
 #endif /* CONFIG_PMIC_STPMIC1 */
 
@@ -110,8 +128,17 @@ int fuse_sense(u32 bank, u32 word, u32 *val)
 
 #ifdef CONFIG_PMIC_STPMIC1
 	case STM32MP_NVM_BANK:
+		ret = uclass_get_device_by_driver(UCLASS_MISC,
+						  DM_GET_DRIVER(stpmic1_nvm),
+						  &dev);
+		if (ret)
+			return ret;
 		*val = 0;
-		ret = stpmic1_nvm_read_byte(word, (u8 *)val);
+		ret = misc_read(dev, word, val, 1);
+		if (ret != 1)
+			ret = -EINVAL;
+		else
+			ret = 0;
 		break;
 #endif /* CONFIG_PMIC_STPMIC1 */
 
@@ -146,7 +173,16 @@ int fuse_override(u32 bank, u32 word, u32 val)
 
 #ifdef CONFIG_PMIC_STPMIC1
 	case STM32MP_NVM_BANK:
-		ret = stpmic1_shadow_write_byte(word, (u8 *)&val);
+		ret = uclass_get_device_by_driver(UCLASS_MISC,
+						  DM_GET_DRIVER(stpmic1_nvm),
+						  &dev);
+		if (ret)
+			return ret;
+		ret = misc_write(dev, -word, &val, 1);
+		if (ret != 1)
+			ret = -EINVAL;
+		else
+			ret = 0;
 		break;
 #endif /* CONFIG_PMIC_STPMIC1 */
 
diff --git a/drivers/power/pmic/stpmic1.c b/drivers/power/pmic/stpmic1.c
index c338148..509baed 100644
--- a/drivers/power/pmic/stpmic1.c
+++ b/drivers/power/pmic/stpmic1.c
@@ -7,6 +7,7 @@
 #include <dm.h>
 #include <errno.h>
 #include <i2c.h>
+#include <misc.h>
 #include <sysreset.h>
 #include <dm/device.h>
 #include <dm/lists.h>
@@ -69,6 +70,7 @@ static int stpmic1_read(struct udevice *dev, uint reg, uint8_t *buff, int len)
 
 static int stpmic1_bind(struct udevice *dev)
 {
+	int ret;
 #if CONFIG_IS_ENABLED(DM_REGULATOR)
 	ofnode regulators_node;
 	int children;
@@ -86,6 +88,13 @@ static int stpmic1_bind(struct udevice *dev)
 		dev_dbg(dev, "no child found\n");
 #endif /* DM_REGULATOR */
 
+	if (!IS_ENABLED(CONFIG_SPL_BUILD)) {
+		ret = device_bind_driver(dev, "stpmic1-nvm",
+					 "stpmic1-nvm", NULL);
+		if (ret)
+			return ret;
+	}
+
 	if (CONFIG_IS_ENABLED(SYSRESET))
 		return device_bind_driver(dev, "stpmic1-sysreset",
 					  "stpmic1-sysreset", NULL);
@@ -113,32 +122,38 @@ U_BOOT_DRIVER(pmic_stpmic1) = {
 };
 
 #ifndef CONFIG_SPL_BUILD
-static int stpmic1_nvm_rw(u8 addr, u8 *buf, int buf_len, enum pmic_nvm_op op)
+static int stpmic1_nvm_rw(struct udevice *dev, u8 addr, u8 *buf, int buf_len,
+			  enum pmic_nvm_op op)
 {
-	struct udevice *dev;
 	unsigned long timeout;
 	u8 cmd = STPMIC1_NVM_CMD_READ;
-	int ret;
-
-	ret = uclass_get_device_by_driver(UCLASS_PMIC,
-					  DM_GET_DRIVER(pmic_stpmic1), &dev);
-	if (ret)
-		/* No PMIC on power discrete board */
-		return -EOPNOTSUPP;
+	int ret, len = buf_len;
 
 	if (addr < STPMIC1_NVM_START_ADDRESS)
 		return -EACCES;
+	if (addr + buf_len > STPMIC1_NVM_START_ADDRESS + STPMIC1_NVM_SIZE)
+		len = STPMIC1_NVM_START_ADDRESS + STPMIC1_NVM_SIZE - addr;
 
-	if (op == SHADOW_READ)
-		return pmic_read(dev, addr, buf, buf_len);
+	if (op == SHADOW_READ) {
+		ret = pmic_read(dev, addr, buf, len);
+		if (ret < 0)
+			return ret;
+		else
+			return len;
+	}
 
-	if (op == SHADOW_WRITE)
-		return pmic_write(dev, addr, buf, buf_len);
+	if (op == SHADOW_WRITE) {
+		ret = pmic_write(dev, addr, buf, len);
+		if (ret < 0)
+			return ret;
+		else
+			return len;
+	}
 
 	if (op == NVM_WRITE) {
 		cmd = STPMIC1_NVM_CMD_PROGRAM;
 
-		ret = pmic_write(dev, addr, buf, buf_len);
+		ret = pmic_write(dev, addr, buf, len);
 		if (ret < 0)
 			return ret;
 	}
@@ -168,51 +183,50 @@ static int stpmic1_nvm_rw(u8 addr, u8 *buf, int buf_len, enum pmic_nvm_op op)
 		return -ETIMEDOUT;
 
 	if (op == NVM_READ) {
-		ret = pmic_read(dev, addr, buf, buf_len);
+		ret = pmic_read(dev, addr, buf, len);
 		if (ret < 0)
 			return ret;
 	}
 
-	return 0;
+	return len;
 }
 
-int stpmic1_shadow_read_byte(u8 addr, u8 *buf)
+static int stpmic1_nvm_read(struct udevice *dev, int offset,
+			    void *buf, int size)
 {
-	return stpmic1_nvm_rw(addr, buf, 1, SHADOW_READ);
-}
+	enum pmic_nvm_op op = NVM_READ;
 
-int stpmic1_shadow_write_byte(u8 addr, u8 *buf)
-{
-	return stpmic1_nvm_rw(addr, buf, 1, SHADOW_WRITE);
-}
+	if (offset < 0) {
+		op = SHADOW_READ;
+		offset = -offset;
+	}
 
-int stpmic1_nvm_read_byte(u8 addr, u8 *buf)
-{
-	return stpmic1_nvm_rw(addr, buf, 1, NVM_READ);
+	return stpmic1_nvm_rw(dev->parent, offset, buf, size, op);
 }
 
-int stpmic1_nvm_write_byte(u8 addr, u8 *buf)
+static int stpmic1_nvm_write(struct udevice *dev, int offset,
+			     const void *buf, int size)
 {
-	return stpmic1_nvm_rw(addr, buf, 1, NVM_WRITE);
-}
+	enum pmic_nvm_op op = NVM_WRITE;
 
-int stpmic1_nvm_read_all(u8 *buf, int buf_len)
-{
-	if (buf_len != STPMIC1_NVM_SIZE)
-		return -EINVAL;
+	if (offset < 0) {
+		op = SHADOW_WRITE;
+		offset = -offset;
+	}
 
-	return stpmic1_nvm_rw(STPMIC1_NVM_START_ADDRESS,
-			     buf, buf_len, NVM_READ);
+	return stpmic1_nvm_rw(dev->parent, offset, (void *)buf, size, op);
 }
 
-int stpmic1_nvm_write_all(u8 *buf, int buf_len)
-{
-	if (buf_len != STPMIC1_NVM_SIZE)
-		return -EINVAL;
+static const struct misc_ops stpmic1_nvm_ops = {
+	.read = stpmic1_nvm_read,
+	.write = stpmic1_nvm_write,
+};
 
-	return stpmic1_nvm_rw(STPMIC1_NVM_START_ADDRESS,
-			     buf, buf_len, NVM_WRITE);
-}
+U_BOOT_DRIVER(stpmic1_nvm) = {
+	.name = "stpmic1-nvm",
+	.id = UCLASS_MISC,
+	.ops = &stpmic1_nvm_ops,
+};
 #endif /* CONFIG_SPL_BUILD */
 
 #ifdef CONFIG_SYSRESET
diff --git a/include/power/stpmic1.h b/include/power/stpmic1.h
index 0e6721d..ea91b75 100644
--- a/include/power/stpmic1.h
+++ b/include/power/stpmic1.h
@@ -107,11 +107,4 @@ enum {
 	STPMIC1_PWR_SW2,
 	STPMIC1_MAX_PWR_SW,
 };
-
-int stpmic1_shadow_read_byte(u8 addr, u8 *buf);
-int stpmic1_shadow_write_byte(u8 addr, u8 *buf);
-int stpmic1_nvm_read_byte(u8 addr, u8 *buf);
-int stpmic1_nvm_write_byte(u8 addr, u8 *buf);
-int stpmic1_nvm_read_all(u8 *buf, int buf_len);
-int stpmic1_nvm_write_all(u8 *buf, int buf_len);
 #endif
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0286E392
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 11:39:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBF25C62756
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 09:39:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B700C61F97
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 09:39:51 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6J9aNYw003750; Fri, 19 Jul 2019 11:39:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ah9ZRoummVovaEayu1B2RlWVFpi5Aws0cesectWiKvw=;
 b=ZEMEtKxUQ0ON2N9AqOWtbXSM3LvzgJ4cCA7GGIDGODgmJPT78X5rlIJm3JO31cN6nw6K
 /JE2iUouZwldC5U4Wx8I/UzCt5nqLVF8JGIkYGtZADnbtff4wjxS01cHlDdKWH5EY0Ug
 3OZvfTOe0EXXK0DAIuZ+Pyg21dsgTNcFep5XlpGjNFsNb556EBSqVlMexFnOvBXkxolR
 zGne8cEaNsRv3Rpbs5Q7RPHpkBxahBexPHaLZPXU3LNbeAT26ZPAvhhlAF/Iw4Q4GofN
 uIayJLNLnghZXAt1TTC+vCSOOeZILXRVdhCkreQrPQCOx1ZHwUKX7gBb3MXGENQZg0O2 Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdepu6v5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 11:39:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCD593D;
 Fri, 19 Jul 2019 09:39:43 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B9B2E27E8;
 Fri, 19 Jul 2019 09:39:43 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 11:39:43 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 11:39:43
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 11:39:28 +0200
Message-ID: <1563529171-16796-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
References: <1563529171-16796-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_07:, , signatures=0
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/5] pmu: stpmic1: change specific NVM api to
	MISC
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

 drivers/misc/stm32mp_fuse.c  | 44 ++++++++++++++++++--
 drivers/power/pmic/stpmic1.c | 98 +++++++++++++++++++++++++-------------------
 include/power/stpmic1.h      |  7 ----
 3 files changed, 96 insertions(+), 53 deletions(-)

diff --git a/drivers/misc/stm32mp_fuse.c b/drivers/misc/stm32mp_fuse.c
index ac33130..1850f08 100644
--- a/drivers/misc/stm32mp_fuse.c
+++ b/drivers/misc/stm32mp_fuse.c
@@ -39,8 +39,17 @@ int fuse_read(u32 bank, u32 word, u32 *val)
 
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
 
@@ -75,7 +84,16 @@ int fuse_prog(u32 bank, u32 word, u32 val)
 
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
 
@@ -109,8 +127,17 @@ int fuse_sense(u32 bank, u32 word, u32 *val)
 
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
 
@@ -145,7 +172,16 @@ int fuse_override(u32 bank, u32 word, u32 val)
 
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
index 65296c5..9f20c31 100644
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

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C29A215AFFB
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18B2CC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C377AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIWcHv015143; Wed, 12 Feb 2020 19:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NeSQTgwfqYkQwo8kapU8NmNxlN4lXGiUSpICGs8VO0Q=;
 b=edMz6GegIeRSmCjOktSYsSWRbIfzGV/xa0KI68GtaJKoy1lU0ILu2SlgXHo8Gt1POhod
 E5T6+w7ugkYWsu8NlTX8WOumWCaEV8FHwO1ZAR557GMcPTs0zU9wXUFM/d8PqBUJzE73
 WV6ZmGZvAgxrz+oB7QfxvQB1e/pfSHPHltJ+dYuYrmKrycniv+SKvhdAd0oTiAP0nY9k
 cVJuMYy49tHqKvXAvMO+PEEKMJ3c/60E8SBPAN5FKrKIchh66xA1G/rB8XSxWDzCmIsu
 cSkEJjbJuf22wUhxlx6t7SR2RxsYN34Ge458swxFy26u0nrHZJ//SgCGXbxbAhBkXXUY Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uda03ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA743100088;
 Wed, 12 Feb 2020 19:37:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D18082C60AA;
 Wed, 12 Feb 2020 19:37:50 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:49 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:38 +0100
Message-ID: <20200212183744.5309-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Fabien Dessenne <fabien.dessenne@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 04/10] arm: stm32mp: bsec: add permanent lock
	support in bsec driver
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

Add BSEC lock access (read / write) at 0xC0000000 offset of misc driver.
The write access only available for Trusted boot mode, based on new
SMC STM32_SMC_WRLOCK_OTP.

With the fuse command, the permanent lock status is accessed with
0x10000000 offset (0xC0000000 - 0x8000000 for OTP sense/program
divided by u32 size), for example:

Read lock status of fuse 57 (0x39)

  STM32MP> fuse sense 0 0x10000039 1

  Sensing bank 0:

  Word 0x10000039: 00000000

Set permanent lock of fuse 57 (0x39)

  STM32MP> fuse prog 0 0x10000039 1

  Sensing bank 0:

  Word 0x10000039: 00000000

WARNING: the OTP lock is updated only after reboot

WARING: Programming lock or fuses is an irreversible operation!
        This may brick your system.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/bsec.c                  | 88 +++++++++++++------
 arch/arm/mach-stm32mp/cpu.c                   |  6 --
 arch/arm/mach-stm32mp/include/mach/stm32.h    |  9 +-
 .../mach-stm32mp/include/mach/stm32mp1_smc.h  |  1 +
 doc/board/st/stm32mp1.rst                     | 34 ++++---
 5 files changed, 95 insertions(+), 43 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 1d904caae1..3b923f088e 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -12,8 +12,6 @@
 #include <linux/iopoll.h>
 
 #define BSEC_OTP_MAX_VALUE		95
-
-#ifndef CONFIG_STM32MP1_TRUSTED
 #define BSEC_TIMEOUT_US			10000
 
 /* BSEC REGISTER OFFSET (base relative) */
@@ -24,9 +22,10 @@
 #define BSEC_OTP_LOCK_OFF		0x010
 #define BSEC_DISTURBED_OFF		0x01C
 #define BSEC_ERROR_OFF			0x034
-#define BSEC_SPLOCK_OFF			0x064 /* Program safmem sticky lock */
-#define BSEC_SWLOCK_OFF			0x07C /* write in OTP sticky lock */
-#define BSEC_SRLOCK_OFF			0x094 /* shadowing sticky lock */
+#define BSEC_WRLOCK_OFF			0x04C /* OTP write permananet lock */
+#define BSEC_SPLOCK_OFF			0x064 /* OTP write sticky lock */
+#define BSEC_SWLOCK_OFF			0x07C /* shadow write sticky lock */
+#define BSEC_SRLOCK_OFF			0x094 /* shadow read sticky lock */
 #define BSEC_OTP_DATA_OFF		0x200
 
 /* BSEC_CONFIGURATION Register MASK */
@@ -53,12 +52,12 @@
 #define BSEC_LOCK_PROGRAM		0x04
 
 /**
- * bsec_check_error() - Check status of one otp
- * @base: base address of bsec IP
+ * bsec_lock() - manage lock for each type SR/SP/SW
+ * @address: address of bsec IP register
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
- * Return: 0 if no error, -EAGAIN or -ENOTSUPP
+ * Return: true if locked else false
  */
-static u32 bsec_check_error(u32 base, u32 otp)
+static bool bsec_read_lock(u32 address, u32 otp)
 {
 	u32 bit;
 	u32 bank;
@@ -66,21 +65,17 @@ static u32 bsec_check_error(u32 base, u32 otp)
 	bit = 1 << (otp & OTP_LOCK_MASK);
 	bank = ((otp >> OTP_LOCK_BANK_SHIFT) & OTP_LOCK_MASK) * sizeof(u32);
 
-	if (readl(base + BSEC_DISTURBED_OFF + bank) & bit)
-		return -EAGAIN;
-	else if (readl(base + BSEC_ERROR_OFF + bank) & bit)
-		return -ENOTSUPP;
-
-	return 0;
+	return !!(readl(address + bank) & bit);
 }
 
+#ifndef CONFIG_STM32MP1_TRUSTED
 /**
- * bsec_lock() - manage lock for each type SR/SP/SW
- * @address: address of bsec IP register
+ * bsec_check_error() - Check status of one otp
+ * @base: base address of bsec IP
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
- * Return: true if locked else false
+ * Return: 0 if no error, -EAGAIN or -ENOTSUPP
  */
-static bool bsec_read_lock(u32 address, u32 otp)
+static u32 bsec_check_error(u32 base, u32 otp)
 {
 	u32 bit;
 	u32 bank;
@@ -88,7 +83,12 @@ static bool bsec_read_lock(u32 address, u32 otp)
 	bit = 1 << (otp & OTP_LOCK_MASK);
 	bank = ((otp >> OTP_LOCK_BANK_SHIFT) & OTP_LOCK_MASK) * sizeof(u32);
 
-	return !!(readl(address + bank) & bit);
+	if (readl(base + BSEC_DISTURBED_OFF + bank) & bit)
+		return -EAGAIN;
+	else if (readl(base + BSEC_ERROR_OFF + bank) & bit)
+		return -ENOTSUPP;
+
+	return 0;
 }
 
 /**
@@ -324,6 +324,16 @@ static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
 #endif
 }
 
+static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
+{
+	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
+
+	/* return OTP permanent write lock status */
+	*val = bsec_read_lock(plat->base + BSEC_WRLOCK_OFF, otp);
+
+	return 0;
+}
+
 static int stm32mp_bsec_write_otp(struct udevice *dev, u32 val, u32 otp)
 {
 #ifdef CONFIG_STM32MP1_TRUSTED
@@ -350,17 +360,36 @@ static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
 #endif
 }
 
+static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
+{
+#ifdef CONFIG_STM32MP1_TRUSTED
+	if (val == 1)
+		return stm32_smc_exec(STM32_SMC_BSEC,
+				      STM32_SMC_WRLOCK_OTP,
+				      otp, 0);
+	if (val == 0)
+		return 0; /* nothing to do */
+
+	return -EINVAL;
+#else
+	return -ENOTSUPP;
+#endif
+}
+
 static int stm32mp_bsec_read(struct udevice *dev, int offset,
 			     void *buf, int size)
 {
 	int ret;
 	int i;
-	bool shadow = true;
+	bool shadow = true, lock = false;
 	int nb_otp = size / sizeof(u32);
 	int otp;
 	unsigned int offs = offset;
 
-	if (offs >= STM32_BSEC_OTP_OFFSET) {
+	if (offs >= STM32_BSEC_LOCK_OFFSET) {
+		offs -= STM32_BSEC_LOCK_OFFSET;
+		lock = true;
+	} else if (offs >= STM32_BSEC_OTP_OFFSET) {
 		offs -= STM32_BSEC_OTP_OFFSET;
 		shadow = false;
 	}
@@ -373,7 +402,9 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
 	for (i = otp; i < (otp + nb_otp) && i <= BSEC_OTP_MAX_VALUE; i++) {
 		u32 *addr = &((u32 *)buf)[i - otp];
 
-		if (shadow)
+		if (lock)
+			ret = stm32mp_bsec_read_lock(dev, addr, i);
+		else if (shadow)
 			ret = stm32mp_bsec_read_shadow(dev, addr, i);
 		else
 			ret = stm32mp_bsec_read_otp(dev, addr, i);
@@ -392,12 +423,15 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 {
 	int ret = 0;
 	int i;
-	bool shadow = true;
+	bool shadow = true, lock = false;
 	int nb_otp = size / sizeof(u32);
 	int otp;
 	unsigned int offs = offset;
 
-	if (offs >= STM32_BSEC_OTP_OFFSET) {
+	if (offs >= STM32_BSEC_LOCK_OFFSET) {
+		offs -= STM32_BSEC_LOCK_OFFSET;
+		lock = true;
+	} else if (offs >= STM32_BSEC_OTP_OFFSET) {
 		offs -= STM32_BSEC_OTP_OFFSET;
 		shadow = false;
 	}
@@ -410,7 +444,9 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 	for (i = otp; i < otp + nb_otp && i <= BSEC_OTP_MAX_VALUE; i++) {
 		u32 *val = &((u32 *)buf)[i - otp];
 
-		if (shadow)
+		if (lock)
+			ret = stm32mp_bsec_write_lock(dev, *val, i);
+		else if (shadow)
 			ret = stm32mp_bsec_write_shadow(dev, *val, i);
 		else
 			ret = stm32mp_bsec_write_otp(dev, *val, i);
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index ea0bd94605..5febed735c 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -61,12 +61,6 @@
 #define BOOTROM_INSTANCE_MASK	 GENMASK(31, 16)
 #define BOOTROM_INSTANCE_SHIFT	16
 
-/* BSEC OTP index */
-#define BSEC_OTP_RPN	1
-#define BSEC_OTP_SERIAL	13
-#define BSEC_OTP_PKG	16
-#define BSEC_OTP_MAC	57
-
 /* Device Part Number (RPN) = OTP_DATA1 lower 8 bits */
 #define RPN_SHIFT	0
 #define RPN_MASK	GENMASK(7, 0)
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index f0636005e5..6daf9f7121 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -119,7 +119,14 @@ enum forced_boot_mode {
 #define STM32_BSEC_SHADOW(id)		(STM32_BSEC_SHADOW_OFFSET + (id) * 4)
 #define STM32_BSEC_OTP_OFFSET		0x80000000
 #define STM32_BSEC_OTP(id)		(STM32_BSEC_OTP_OFFSET + (id) * 4)
-
+#define STM32_BSEC_LOCK_OFFSET		0xC0000000
+#define STM32_BSEC_LOCK(id)		(STM32_BSEC_LOCK_OFFSET + (id) * 4)
+
+/* BSEC OTP index */
+#define BSEC_OTP_RPN	1
+#define BSEC_OTP_SERIAL	13
+#define BSEC_OTP_PKG	16
+#define BSEC_OTP_MAC	57
 #define BSEC_OTP_BOARD	59
 
 #endif /* __ASSEMBLY__*/
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h b/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
index 8130546b27..7b9167c356 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32mp1_smc.h
@@ -27,6 +27,7 @@
 #define STM32_SMC_READ_OTP		0x04
 #define STM32_SMC_READ_ALL		0x05
 #define STM32_SMC_WRITE_ALL		0x06
+#define STM32_SMC_WRLOCK_OTP		0x07
 
 /* SMC error codes */
 #define STM32_SMC_OK			0x0
diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
index 131f4902a3..274f8d9710 100644
--- a/doc/board/st/stm32mp1.rst
+++ b/doc/board/st/stm32mp1.rst
@@ -402,20 +402,26 @@ For STMicroelectonics board, it is retrieved in STM32MP15x OTP :
  - OTP_58[15:0] = MAC_ADDR[47:32]
 
 To program a MAC address on virgin OTP words above, you can use the fuse command
-on bank 0 to access to internal OTP:
+on bank 0 to access to internal OTP and lock them:
 
 Prerequisite: check if a MAC address isn't yet programmed in OTP
 
-1) check OTP: their value must be equal to 0
+1) check OTP: their value must be equal to 0::
 
-   STM32MP> fuse sense 0 57 2
-   Sensing bank 0:
-   Word 0x00000039: 00000000 00000000
+    STM32MP> fuse sense 0 57 2
+    Sensing bank 0:
+    Word 0x00000039: 00000000 00000000
+
+2) check environment variable::
+
+    STM32MP> env print ethaddr
+    ## Error: "ethaddr" not defined
 
-2) check environment variable
+3) check lock status of fuse 57 & 58 (at 0x39, 0=unlocked, 1=locked)::
 
-   STM32MP> env print ethaddr
-   ## Error: "ethaddr" not defined
+    STM32MP> fuse sense 0 0x10000039 2
+    Sensing bank 0:
+       Word 0x10000039: 00000000 00000000
 
 Example to set mac address "12:34:56:78:9a:bc"
 
@@ -429,11 +435,19 @@ Example to set mac address "12:34:56:78:9a:bc"
     Sensing bank 0:
     Word 0x00000039: 78563412 0000bc9a
 
-3) next REBOOT, in the trace::
+3) Lock OTP::
+
+    STM32MP> fuse prog 0 0x10000039 1 1
+
+    STM32MP> fuse sense 0 0x10000039 2
+    Sensing bank 0:
+       Word 0x10000039: 00000001 00000001
+
+4) next REBOOT, in the trace::
 
     ### Setting environment from OTP MAC address = "12:34:56:78:9a:bc"
 
-4) check env update::
+5) check env update::
 
     STM32MP> env print ethaddr
     ethaddr=12:34:56:78:9a:bc
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

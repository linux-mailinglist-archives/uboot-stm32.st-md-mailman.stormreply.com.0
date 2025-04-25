Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB1A9C9EA
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Apr 2025 15:16:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DAA0C78F8B;
	Fri, 25 Apr 2025 13:16:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EDE7C78F88
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 13:16:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P814Dk018337;
 Fri, 25 Apr 2025 15:16:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 9d4VjwCRQz75s50vr9ZgdxUvJPMR6AlmE5vGomZ2Y68=; b=W3mcZ+xI33FKN4bU
 +08rr9p2C0DayS4RfzmKRUYEtBnZOC4U0BrQAAqTQavSvMLeU3pHjtjoTk5bQ8X0
 YUkAb17llPQGzofvPBFWB5MtO80ZmSSCudeBoUD8p3/jPeTUGCl1IV59Rmv6x9wm
 MmzdFCl9Ld9wO9kY4tF5KFEav7R/cFFXaX2oglD4Qn6kjpZR7UxNLMAXhhD/vIn2
 rIsQJ1LxTe1q9TMluelLwL8lQrceVlplldj3odmTKpjqbQTPd8PMwAlEtBuTT6ZT
 xW23AWHu6bcFvzTz6DNTIGVHxtU4gBmFCyG4/oXPQxArFjYGvxPuK/X6bXx2DvBG
 THM35g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjvc8yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 15:16:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8946840058;
 Fri, 25 Apr 2025 15:16:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D99419114A4;
 Fri, 25 Apr 2025 15:15:54 +0200 (CEST)
Received: from localhost (10.252.18.92) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 15:15:54 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Apr 2025 15:15:29 +0200
Message-ID: <20250425131533.392747-19-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425131533.392747-1-patrice.chotard@foss.st.com>
References: <20250425131533.392747-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.18.92]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 18/22] arm: stm32mp: cmd_stm32key: update
	command for stm32mp25x
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

Update key table for stm32mp25 platform.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/cmd_stm32key.c | 264 +++++++++++++++++++++++----
 1 file changed, 225 insertions(+), 39 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 040a70f581c..d6bf72d8e32 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -14,12 +14,23 @@
 
 /*
  * Closed device: OTP0
- * STM32MP15x: bit 6 of OPT0
+ * STM32MP15x: bit 6 of OTP0
  * STM32MP13x: 0b111111 = 0x3F for OTP_SECURED closed device
+ * STM32MP25x: bit 0 of OTP18
  */
-#define STM32_OTP_CLOSE_ID		0
-#define STM32_OTP_STM32MP13X_CLOSE_MASK	0x3F
-#define STM32_OTP_STM32MP15X_CLOSE_MASK	BIT(6)
+#define STM32MP1_OTP_CLOSE_ID				0
+#define STM32_OTP_STM32MP13X_CLOSE_MASK		GENMASK(5, 0)
+#define STM32_OTP_STM32MP15X_CLOSE_MASK		BIT(6)
+#define STM32MP25_OTP_WORD8				8
+#define STM32_OTP_STM32MP25X_BOOTROM_CLOSE_MASK	GENMASK(7, 0)
+#define STM32MP25_OTP_CLOSE_ID			18
+#define STM32_OTP_STM32MP25X_CLOSE_MASK		GENMASK(3, 0)
+#define STM32_OTP_STM32MP25X_PROVISIONING_DONE_MASK	GENMASK(7, 4)
+#define STM32MP25_OTP_HWCONFIG			124
+#define STM32_OTP_STM32MP25X_DISABLE_SCAN_MASK	BIT(20)
+
+#define STM32MP25_OTP_BOOTROM_CONF8	17
+#define STM32_OTP_STM32MP25X_OEM_KEY2_EN	BIT(8)
 
 /* PKH is the first element of the key list */
 #define STM32KEY_PKH 0
@@ -27,8 +38,9 @@
 struct stm32key {
 	char *name;
 	char *desc;
-	u8 start;
+	u16 start;
 	u8 size;
+	int (*post_process)(struct udevice *dev);
 };
 
 const struct stm32key stm32mp13_list[] = {
@@ -55,6 +67,99 @@ const struct stm32key stm32mp15_list[] = {
 	}
 };
 
+static int post_process_oem_key2(struct udevice *dev);
+
+const struct stm32key stm32mp25_list[] = {
+	[STM32KEY_PKH] = {
+		.name = "OEM-KEY1",
+		.desc = "Hash of the 8 ECC Public Keys Hashes Table (ECDSA is the authentication algorithm) for FSBLA or M",
+		.start = 144,
+		.size = 8,
+	},
+	{
+		.name = "OEM-KEY2",
+		.desc = "Hash of the 8 ECC Public Keys Hashes Table (ECDSA is the authentication algorithm) for FSBLM",
+		.start = 152,
+		.size = 8,
+		.post_process = post_process_oem_key2,
+	},
+	{
+		.name = "FIP-EDMK",
+		.desc = "Encryption/Decryption Master Key for FIP",
+		.start = 260,
+		.size = 8,
+	},
+	{
+		.name = "EDMK1",
+		.desc = "Encryption/Decryption Master Key for FSBLA or M",
+		.start = 364,
+		.size = 4,
+	},
+	{
+		.name = "EDMK2",
+		.desc = "Encryption/Decryption Master Key for FSBLM",
+		.start = 360,
+		.size = 4,
+	}
+};
+
+struct otp_close {
+	u32 word;
+	u32 mask_wr;
+	u32 mask_rd;
+	bool (*close_status_ops)(u32 value, u32 mask);
+};
+
+static bool compare_mask_exact(u32 value, u32 mask)
+{
+	return ((value & mask) == mask);
+}
+
+static bool compare_any_bits(u32 value, u32 mask)
+{
+	return ((value & mask) != 0);
+}
+
+const struct otp_close stm32mp13_close_state_otp[] = {
+	{
+		.word = STM32MP1_OTP_CLOSE_ID,
+		.mask_wr = STM32_OTP_STM32MP13X_CLOSE_MASK,
+		.mask_rd = STM32_OTP_STM32MP13X_CLOSE_MASK,
+		.close_status_ops = compare_mask_exact,
+	}
+};
+
+const struct otp_close stm32mp15_close_state_otp[] = {
+	{
+		.word = STM32MP1_OTP_CLOSE_ID,
+		.mask_wr = STM32_OTP_STM32MP15X_CLOSE_MASK,
+		.mask_rd = STM32_OTP_STM32MP15X_CLOSE_MASK,
+		.close_status_ops = compare_mask_exact,
+	}
+};
+
+const struct otp_close stm32mp25_close_state_otp[] = {
+	{
+		.word = STM32MP25_OTP_WORD8,
+		.mask_wr = STM32_OTP_STM32MP25X_BOOTROM_CLOSE_MASK,
+		.mask_rd = 0,
+		.close_status_ops = NULL
+	},
+	{
+		.word = STM32MP25_OTP_CLOSE_ID,
+		.mask_wr = STM32_OTP_STM32MP25X_CLOSE_MASK |
+			   STM32_OTP_STM32MP25X_PROVISIONING_DONE_MASK,
+		.mask_rd = STM32_OTP_STM32MP25X_CLOSE_MASK,
+		.close_status_ops = compare_any_bits
+	},
+	{
+		.word = STM32MP25_OTP_HWCONFIG,
+		.mask_wr = STM32_OTP_STM32MP25X_DISABLE_SCAN_MASK,
+		.mask_rd = 0,
+		.close_status_ops = NULL
+	},
+};
+
 /* index of current selected key in stm32key list, 0 = PKH by default */
 static u8 stm32key_index;
 
@@ -65,6 +170,9 @@ static u8 get_key_nb(void)
 
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return ARRAY_SIZE(stm32mp15_list);
+
+	if (IS_ENABLED(CONFIG_STM32MP25X))
+		return ARRAY_SIZE(stm32mp25_list);
 }
 
 static const struct stm32key *get_key(u8 index)
@@ -74,15 +182,33 @@ static const struct stm32key *get_key(u8 index)
 
 	if (IS_ENABLED(CONFIG_STM32MP15X))
 		return &stm32mp15_list[index];
+
+	if (IS_ENABLED(CONFIG_STM32MP25X))
+		return &stm32mp25_list[index];
+}
+
+static u8 get_otp_close_state_nb(void)
+{
+	if (IS_ENABLED(CONFIG_STM32MP13X))
+		return ARRAY_SIZE(stm32mp13_close_state_otp);
+
+	if (IS_ENABLED(CONFIG_STM32MP15X))
+		return ARRAY_SIZE(stm32mp15_close_state_otp);
+
+	if (IS_ENABLED(CONFIG_STM32MP25X))
+		return ARRAY_SIZE(stm32mp25_close_state_otp);
 }
 
-static u32 get_otp_close_mask(void)
+static const struct otp_close *get_otp_close_state(u8 index)
 {
 	if (IS_ENABLED(CONFIG_STM32MP13X))
-		return STM32_OTP_STM32MP13X_CLOSE_MASK;
+		return &stm32mp13_close_state_otp[index];
 
 	if (IS_ENABLED(CONFIG_STM32MP15X))
-		return STM32_OTP_STM32MP15X_CLOSE_MASK;
+		return &stm32mp15_close_state_otp[index];
+
+	if (IS_ENABLED(CONFIG_STM32MP25X))
+		return &stm32mp25_close_state_otp[index];
 }
 
 static int get_misc_dev(struct udevice **dev)
@@ -96,13 +222,13 @@ static int get_misc_dev(struct udevice **dev)
 	return ret;
 }
 
-static void read_key_value(const struct stm32key *key, u32 addr)
+static void read_key_value(const struct stm32key *key, unsigned long addr)
 {
 	int i;
 
 	for (i = 0; i < key->size; i++) {
 		printf("%s OTP %i: [%08x] %08x\n", key->name, key->start + i,
-		       addr, __be32_to_cpu(*(u32 *)addr));
+		       (u32)addr, __be32_to_cpu(*(u32 *)addr));
 		addr += 4;
 	}
 }
@@ -157,26 +283,42 @@ static int read_key_otp(struct udevice *dev, const struct stm32key *key, bool pr
 
 static int read_close_status(struct udevice *dev, bool print, bool *closed)
 {
-	int word, ret, result;
-	u32 val, lock, mask;
-	bool status;
+	int ret, result, i;
+	const struct otp_close *otp_close = NULL;
+	u32 otp_close_nb = get_otp_close_state_nb();
+	u32 val, lock, mask, word = 0;
+	bool status = true;
+	bool tested_once = false;
 
 	result = 0;
-	word = STM32_OTP_CLOSE_ID;
-	ret = misc_read(dev, STM32_BSEC_OTP(word), &val, 4);
-	if (ret < 0)
-		result = ret;
-	if (ret != 4)
-		val = 0x0;
-
-	ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
-	if (ret < 0)
-		result = ret;
-	if (ret != 4)
-		lock = BSEC_LOCK_ERROR;
-
-	mask = get_otp_close_mask();
-	status = (val & mask) == mask;
+	for (i = 0; status && (i < otp_close_nb); i++) {
+		otp_close = get_otp_close_state(i);
+
+		if (!otp_close->close_status_ops)
+			continue;
+
+		mask = otp_close->mask_rd;
+		word = otp_close->word;
+
+		ret = misc_read(dev, STM32_BSEC_OTP(word), &val, 4);
+		if (ret < 0)
+			result = ret;
+		if (ret != 4)
+			val = 0x0;
+
+		ret = misc_read(dev, STM32_BSEC_LOCK(word), &lock, 4);
+		if (ret < 0)
+			result = ret;
+		if (ret != 4)
+			lock = BSEC_LOCK_ERROR;
+
+		status = otp_close->close_status_ops(val, mask);
+		tested_once = true;
+	}
+
+	if (!tested_once)
+		status = false;
+
 	if (closed)
 		*closed = status;
 	if (print)
@@ -185,7 +327,49 @@ static int read_close_status(struct udevice *dev, bool print, bool *closed)
 	return result;
 }
 
-static int fuse_key_value(struct udevice *dev, const struct stm32key *key, u32 addr, bool print)
+static int write_close_status(struct udevice *dev)
+{
+	int i;
+	u32 val, word, ret;
+	const struct otp_close *otp_close = NULL;
+	u32 otp_num = get_otp_close_state_nb();
+
+	for (i = 0; i < otp_num; i++) {
+		otp_close = get_otp_close_state(i);
+		val = otp_close->mask_wr;
+		word = otp_close->word;
+		ret = misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
+		if (ret != 4) {
+			log_err("Error: can't update OTP %d\n", word);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int post_process_oem_key2(struct udevice *dev)
+{
+	int ret;
+	u32 val;
+
+	ret = misc_read(dev, STM32_BSEC_OTP(STM32MP25_OTP_BOOTROM_CONF8), &val, 4);
+	if (ret != 4) {
+		log_err("Error %d failed to read STM32MP25_OTP_BOOTROM_CONF8\n", ret);
+		return -EIO;
+	}
+
+	val |= STM32_OTP_STM32MP25X_OEM_KEY2_EN;
+	ret = misc_write(dev, STM32_BSEC_OTP(STM32MP25_OTP_BOOTROM_CONF8), &val, 4);
+	if (ret != 4) {
+		log_err("Error %d failed to write OEM_KEY2_ENABLE\n", ret);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int fuse_key_value(struct udevice *dev, const struct stm32key *key, unsigned long addr,
+			  bool print)
 {
 	u32 word, val;
 	int i, ret;
@@ -229,7 +413,7 @@ static int confirm_prog(void)
 static void display_key_info(const struct stm32key *key)
 {
 	printf("%s : %s\n", key->name, key->desc);
-	printf("\tOTP%d..%d\n", key->start, key->start + key->size);
+	printf("\tOTP%d..%d\n", key->start, key->start + key->size - 1);
 }
 
 static int do_stm32key_list(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
@@ -272,7 +456,7 @@ static int do_stm32key_read(struct cmd_tbl *cmdtp, int flag, int argc, char *con
 {
 	const struct stm32key *key;
 	struct udevice *dev;
-	u32 addr;
+	unsigned long addr;
 	int ret, i;
 	int result;
 
@@ -310,7 +494,7 @@ static int do_stm32key_read(struct cmd_tbl *cmdtp, int flag, int argc, char *con
 		return CMD_RET_USAGE;
 
 	key = get_key(stm32key_index);
-	printf("Read %s at 0x%08x\n", key->name, addr);
+	printf("Read %s at 0x%08x\n", key->name, (u32)addr);
 	read_key_value(key, addr);
 
 	return CMD_RET_SUCCESS;
@@ -320,7 +504,7 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
 {
 	const struct stm32key *key = get_key(stm32key_index);
 	struct udevice *dev;
-	u32 addr;
+	unsigned long addr;
 	int ret;
 	bool yes = false, lock;
 
@@ -361,6 +545,13 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
 	if (fuse_key_value(dev, key, addr, !yes))
 		return CMD_RET_FAILURE;
 
+	if (key->post_process) {
+		if (key->post_process(dev)) {
+			printf("Error: %s for post process\n", key->name);
+			return CMD_RET_FAILURE;
+		}
+	}
+
 	printf("%s updated !\n", key->name);
 
 	return CMD_RET_SUCCESS;
@@ -371,7 +562,6 @@ static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *co
 	const struct stm32key *key;
 	bool yes, lock, closed;
 	struct udevice *dev;
-	u32 val;
 	int ret;
 
 	yes = false;
@@ -407,12 +597,8 @@ static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *co
 	if (!yes && !confirm_prog())
 		return CMD_RET_FAILURE;
 
-	val = get_otp_close_mask();
-	ret = misc_write(dev, STM32_BSEC_OTP(STM32_OTP_CLOSE_ID), &val, 4);
-	if (ret != 4) {
-		printf("Error: can't update OTP %d\n", STM32_OTP_CLOSE_ID);
+	if (write_close_status(dev))
 		return CMD_RET_FAILURE;
-	}
 
 	printf("Device is closed !\n");
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

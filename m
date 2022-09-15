Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 059315B9F69
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 18:11:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C552FC63326;
	Thu, 15 Sep 2022 16:11:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E437CC63324
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 16:11:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FFsMg7009686;
 Thu, 15 Sep 2022 18:11:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1H1ht6egYNakS2mVlGfcMJWn02Mzh3EBvjGZ3/yA8RQ=;
 b=djk59WBZbkiJ3MH8iIw5lgZxxcdK5g6b5JYv9z6Z6LfGn+HZuv6v3DNvxYUCcBWiITj8
 5UA4OFnmtgp/5p1QTCSDvdGkpEv3zck4uZh40CT0z5x5rRK90KHG8C8pgrxlGlFPrR4L
 Or6I5tI3DFVy/cSKld8hYwb+5WN+9UW0+6qNvh6SKoQkYbEEKh6iftxbc/R9d+I22EOh
 vG2wAZFt0U+KUOSzMl4qaBCr/3EWjfiRGgbOJXINffh2kEORgkhK47XGa/IkXqsUyYWk
 b8c5WT5vjwj2IV+WSyUzxIjI33ai5TZNPFhNJIDFnSlyAKRAex5o0PLeJL9cyOdDnUtz VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjxxaxnbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 18:11:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 760D710002A;
 Thu, 15 Sep 2022 18:11:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 722C5235F18;
 Thu, 15 Sep 2022 18:11:50 +0200 (CEST)
Received: from localhost (10.75.127.49) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 18:11:49 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 15 Sep 2022 18:11:40 +0200
Message-ID: <20220915181132.3.Ic9d9cb1cf9d05b9e305f158b26076cf908d7c0b8@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
References: <20220915161141.301299-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/4] arm: stm32mp: support several key in
	command stm32key
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

Update the command stm32key to support several keys selected by
key name and managed by the new sub-command:

stm32key list
stm32key select [<key>]
stm32key read -a

This patch doesn't change the STM32MP15 behavior, only PKH is
supported, but it is a preliminary patch for STM32MP13 support.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32key.c | 195 ++++++++++++++++++++-------
 1 file changed, 149 insertions(+), 46 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 68f9b1a9a59..4eac56082db 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -15,9 +15,37 @@
 #define STM32_OTP_CLOSE_ID		0
 #define STM32_OTP_CLOSE_MASK		BIT(6)
 
-/* HASH of key: 8 OTPs, starting with OTP24) */
-#define STM32_OTP_HASH_KEY_START	24
-#define STM32_OTP_HASH_KEY_SIZE		8
+/* PKH is the first element of the key list */
+#define STM32KEY_PKH 0
+
+struct stm32key {
+	char *name;
+	char *desc;
+	u8 start;
+	u8 size;
+};
+
+const struct stm32key stm32mp15_list[] = {
+	[STM32KEY_PKH] = {
+		.name = "PKH",
+		.desc = "Hash of the ECC Public Key (ECDSA is the authentication algorithm)",
+		.start = 24,
+		.size = 8,
+	}
+};
+
+/* index of current selected key in stm32key list, 0 = PKH by default */
+static u8 stm32key_index;
+
+static u8 get_key_nb(void)
+{
+	return ARRAY_SIZE(stm32mp15_list);
+}
+
+static const struct stm32key *get_key(u8 index)
+{
+	return &stm32mp15_list[index];
+}
 
 #define BSEC_LOCK_ERROR			(-1)
 #define BSEC_LOCK_PERM			BIT(0)
@@ -33,26 +61,25 @@ static int get_misc_dev(struct udevice **dev)
 	return ret;
 }
 
-static void read_hash_value(u32 addr)
+static void read_key_value(const struct stm32key *key, u32 addr)
 {
 	int i;
 
-	printf("Read KEY at 0x%x\n", addr);
-	for (i = 0; i < STM32_OTP_HASH_KEY_SIZE; i++) {
-		printf("OTP value %i: %x\n", STM32_OTP_HASH_KEY_START + i,
-		       __be32_to_cpu(*(u32 *)addr));
+	for (i = 0; i < key->size; i++) {
+		printf("%s OTP %i: [%08x] %08x\n", key->name, key->start + i,
+		       addr, __be32_to_cpu(*(u32 *)addr));
 		addr += 4;
 	}
 }
 
-static int read_hash_otp(struct udevice *dev, bool print, bool *locked)
+static int read_key_otp(struct udevice *dev, const struct stm32key *key, bool print, bool *locked)
 {
 	int i, word, ret;
-	int nb_invalid = 0, nb_zero = 0, nb_lock = 0;
+	int nb_invalid = 0, nb_zero = 0, nb_lock = 0, nb_lock_err = 0;
 	u32 val, lock;
 	bool status;
 
-	for (i = 0, word = STM32_OTP_HASH_KEY_START; i < STM32_OTP_HASH_KEY_SIZE; i++, word++) {
+	for (i = 0, word = key->start; i < key->size; i++, word++) {
 		ret = misc_read(dev, STM32_BSEC_OTP(word), &val, 4);
 		if (ret != 4)
 			val = ~0x0;
@@ -60,29 +87,33 @@ static int read_hash_otp(struct udevice *dev, bool print, bool *locked)
 		if (ret != 4)
 			lock = BSEC_LOCK_ERROR;
 		if (print)
-			printf("OTP HASH %i: %x lock : %x\n", word, val, lock);
+			printf("%s OTP %i: %08x lock : %08x\n", key->name, word, val, lock);
 		if (val == ~0x0)
 			nb_invalid++;
 		else if (val == 0x0)
 			nb_zero++;
 		if (lock & BSEC_LOCK_PERM)
 			nb_lock++;
+		if (lock & BSEC_LOCK_ERROR)
+			nb_lock_err++;
 	}
 
-	status = (nb_lock == STM32_OTP_HASH_KEY_SIZE);
+	status = nb_lock_err || (nb_lock == key->size);
 	if (locked)
 		*locked = status;
-	if (!status && print)
-		printf("Hash of key is not locked!\n");
+	if (nb_lock_err && print)
+		printf("%s lock is invalid!\n", key->name);
+	else if (!status && print)
+		printf("%s is not locked!\n", key->name);
 
-	if (nb_invalid == STM32_OTP_HASH_KEY_SIZE) {
+	if (nb_invalid == key->size) {
 		if (print)
-			printf("Hash of key is invalid!\n");
+			printf("%s is invalid!\n", key->name);
 		return -EINVAL;
 	}
-	if (nb_zero == STM32_OTP_HASH_KEY_SIZE) {
+	if (nb_zero == key->size) {
 		if (print)
-			printf("Hash of key is free!\n");
+			printf("%s is free!\n", key->name);
 		return -ENOENT;
 	}
 
@@ -113,33 +144,31 @@ static int read_close_status(struct udevice *dev, bool print, bool *closed)
 	if (closed)
 		*closed = status;
 	if (print)
-		printf("OTP %d: closed status: %d lock : %x\n", word, status, lock);
+		printf("OTP %d: closed status: %d lock : %08x\n", word, status, lock);
 
 	return result;
 }
 
-static int fuse_hash_value(struct udevice *dev, u32 addr, bool print)
+static int fuse_key_value(struct udevice *dev, const struct stm32key *key, u32 addr, bool print)
 {
 	u32 word, val;
 	int i, ret;
 
-	for (i = 0, word = STM32_OTP_HASH_KEY_START;
-	     i < STM32_OTP_HASH_KEY_SIZE;
-	     i++, word++, addr += 4) {
+	for (i = 0, word = key->start; i < key->size; i++, word++, addr += 4) {
 		val = __be32_to_cpu(*(u32 *)addr);
 		if (print)
-			printf("Fuse OTP %i : %x\n", word, val);
+			printf("Fuse %s OTP %i : %08x\n", key->name, word, val);
 
 		ret = misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
 		if (ret != 4) {
-			log_err("Fuse OTP %i failed\n", word);
+			log_err("Fuse %s OTP %i failed\n", key->name, word);
 			return ret;
 		}
-		/* on success, lock the OTP for HASH key */
+		/* on success, lock the OTP for the key */
 		val = BSEC_LOCK_PERM;
 		ret = misc_write(dev, STM32_BSEC_LOCK(word), &val, 4);
 		if (ret != 4) {
-			log_err("Lock OTP %i failed\n", word);
+			log_err("Lock %s OTP %i failed\n", key->name, word);
 			return ret;
 		}
 	}
@@ -161,36 +190,99 @@ static int confirm_prog(void)
 	return 0;
 }
 
+static void display_key_info(const struct stm32key *key)
+{
+	printf("%s : %s\n", key->name, key->desc);
+	printf("\tOTP%d..%d\n", key->start, key->start + key->size);
+}
+
+static int do_stm32key_list(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
+{
+	int i;
+
+	for (i = 0; i < get_key_nb(); i++)
+		display_key_info(get_key(i));
+
+	return CMD_RET_SUCCESS;
+}
+
+static int do_stm32key_select(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
+{
+	const struct stm32key *key;
+	int i;
+
+	if (argc == 1) {
+		printf("Selected key:\n");
+		key = get_key(stm32key_index);
+		display_key_info(key);
+		return CMD_RET_SUCCESS;
+	}
+
+	for (i = 0; i < get_key_nb(); i++) {
+		key = get_key(i);
+		if (!strcmp(key->name, argv[1])) {
+			printf("%s selected\n", key->name);
+			stm32key_index = i;
+			return CMD_RET_SUCCESS;
+		}
+	}
+
+	printf("Unknown key %s\n", argv[1]);
+
+	return CMD_RET_FAILURE;
+}
+
 static int do_stm32key_read(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 {
+	const struct stm32key *key;
 	struct udevice *dev;
 	u32 addr;
-	int ret;
+	int ret, i;
+	int result;
 
 	ret = get_misc_dev(&dev);
 
 	if (argc == 1) {
 		if (ret)
 			return CMD_RET_FAILURE;
-		read_hash_otp(dev, true, NULL);
-		ret = read_close_status(dev, true, NULL);
+		key = get_key(stm32key_index);
+		ret = read_key_otp(dev, key, true, NULL);
+		if (ret != -ENOENT)
+			return CMD_RET_FAILURE;
+		return CMD_RET_SUCCESS;
+	}
+
+	if (!strcmp("-a", argv[1])) {
 		if (ret)
 			return CMD_RET_FAILURE;
+		result = CMD_RET_SUCCESS;
+		for (i = 0; i < get_key_nb(); i++) {
+			key = get_key(i);
+			ret = read_key_otp(dev, key, true, NULL);
+			if (ret != -ENOENT)
+				result = CMD_RET_FAILURE;
+		}
+		ret = read_close_status(dev, true, NULL);
+		if (ret)
+			result = CMD_RET_FAILURE;
 
-		return CMD_RET_SUCCESS;
+		return result;
 	}
 
 	addr = hextoul(argv[1], NULL);
 	if (!addr)
 		return CMD_RET_USAGE;
 
-	read_hash_value(addr);
+	key = get_key(stm32key_index);
+	printf("Read %s at 0x%08x\n", key->name, addr);
+	read_key_value(key, addr);
 
 	return CMD_RET_SUCCESS;
 }
 
 static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 {
+	const struct stm32key *key = get_key(stm32key_index);
 	struct udevice *dev;
 	u32 addr;
 	int ret;
@@ -213,28 +305,34 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
 	if (ret)
 		return CMD_RET_FAILURE;
 
-	if (read_hash_otp(dev, !yes, &lock) != -ENOENT) {
+	if (read_key_otp(dev, key, !yes, &lock) != -ENOENT) {
 		printf("Error: can't fuse again the OTP\n");
 		return CMD_RET_FAILURE;
 	}
 	if (lock) {
-		printf("Error: PKH is locked\n");
+		printf("Error: %s is locked\n", key->name);
 		return CMD_RET_FAILURE;
 	}
 
+	if (!yes) {
+		printf("Writing %s with\n", key->name);
+		read_key_value(key, addr);
+	}
+
 	if (!yes && !confirm_prog())
 		return CMD_RET_FAILURE;
 
-	if (fuse_hash_value(dev, addr, !yes))
+	if (fuse_key_value(dev, key, addr, !yes))
 		return CMD_RET_FAILURE;
 
-	printf("Hash key updated !\n");
+	printf("%s updated !\n", key->name);
 
 	return CMD_RET_SUCCESS;
 }
 
 static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
 {
+	const struct stm32key *key;
 	bool yes, lock, closed;
 	struct udevice *dev;
 	u32 val;
@@ -260,14 +358,15 @@ static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *co
 	}
 
 	/* check PKH status before to close */
-	ret = read_hash_otp(dev, !yes, &lock);
+	key = get_key(STM32KEY_PKH);
+	ret = read_key_otp(dev, key, !yes, &lock);
 	if (ret) {
 		if (ret == -ENOENT)
-			printf("Error: OTP not programmed!\n");
+			printf("Error: %s not programmed!\n", key->name);
 		return CMD_RET_FAILURE;
 	}
 	if (!lock)
-		printf("Warning: OTP not locked!\n");
+		printf("Warning: %s not locked!\n", key->name);
 
 	if (!yes && !confirm_prog())
 		return CMD_RET_FAILURE;
@@ -275,7 +374,7 @@ static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *co
 	val = STM32_OTP_CLOSE_MASK;
 	ret = misc_write(dev, STM32_BSEC_OTP(STM32_OTP_CLOSE_ID), &val, 4);
 	if (ret != 4) {
-		printf("Error: can't update OTP\n");
+		printf("Error: can't update OTP %d\n", STM32_OTP_CLOSE_ID);
 		return CMD_RET_FAILURE;
 	}
 
@@ -285,11 +384,15 @@ static int do_stm32key_close(struct cmd_tbl *cmdtp, int flag, int argc, char *co
 }
 
 static char stm32key_help_text[] =
-	"read [<addr>]: Read the hash stored at addr in memory or in OTP\n"
-	"stm32key fuse [-y] <addr> : Fuse hash stored at addr in OTP\n"
-	"stm32key close [-y] : Close the device, the hash stored in OTP\n";
-
-U_BOOT_CMD_WITH_SUBCMDS(stm32key, "Fuse ST Hash key", stm32key_help_text,
+	"list : list the supported key with description\n"
+	"stm32key select [<key>] : Select the key identified by <key> or display the key used for read/fuse command\n"
+	"stm32key read [<addr> | -a ] : Read the curent key at <addr> or current / all (-a) key in OTP\n"
+	"stm32key fuse [-y] <addr> : Fuse the current key at addr in OTP\n"
+	"stm32key close [-y] : Close the device\n";
+
+U_BOOT_CMD_WITH_SUBCMDS(stm32key, "Manage key on STM32", stm32key_help_text,
+	U_BOOT_SUBCMD_MKENT(list, 1, 0, do_stm32key_list),
+	U_BOOT_SUBCMD_MKENT(select, 2, 0, do_stm32key_select),
 	U_BOOT_SUBCMD_MKENT(read, 2, 0, do_stm32key_read),
 	U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fuse),
 	U_BOOT_SUBCMD_MKENT(close, 2, 0, do_stm32key_close));
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

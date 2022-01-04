Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CC6484250
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jan 2022 14:24:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49C65C5F1F6;
	Tue,  4 Jan 2022 13:24:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A822C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 13:24:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2049pNRh016894;
 Tue, 4 Jan 2022 14:24:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1S1c0UicbZl9Fzi/jHiFFpFCI0q90NONzJ3InY+Emno=;
 b=MIACDjWfMWTSwM8ovWv5VSUxFY1qDVNxTIxZbrymGGksBn4pMZWhBsb3kpkoqOwuOiVf
 pedh6bktSO7b46rYwjGEGBUgOUGQyN1Yih1C0UnFGDGOdwjOHaiHpLy+/faWDpvxMvHZ
 qj38scD0nvqoYPTkTutglpxuJER9CJDVR+AdaUjx1ZmnXt0Zqxe8jmAJZSe++faBNjcD
 iIg4tvqpCAzYRIiaLLUmKwkWiJODD+sAwIb6uOJkfApMg5ehIa5IO+VdhI0SFxBDsWAz
 /UMLmu6WVRImJSZC/N2WBAzohmp+bKZUhZ5jgYEuzJvB3GXF7OxGBGdMP3XClumfbEk3 ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dccdntmcs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:24:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D8CF1100039;
 Tue,  4 Jan 2022 14:24:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF9A926029F;
 Tue,  4 Jan 2022 14:24:08 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 14:24:08
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 4 Jan 2022 14:23:58 +0100
Message-ID: <20220104142328.v1.2.I0180e07a31210ff2679a02de4221a54e12169593@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_06,2022-01-04_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH v1 2/5] mtd: cfi: introduce CFI_FLASH_BANKS
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

Replace CONFIG_SYS_MAX_FLASH_BANKS by CFI_FLASH_BANKS to prepare
Kconfig migration and avoid to redefine CONFIG_SYS_MAX_FLASH_BANKS
in cfi_flash.h.

After this patch CONFIG_SYS_MAX_FLASH_BANKS should be never used in
the cfi code: use CFI_MAX_FLASH_BANKS for struct size or CFI_FLASH_BANKS
for number of CFI banks which can be dynamic.

This patch modify all the files which include mtd/cfi_flash.h.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v1:
- update drivers/mtd/spi/spi-nor-core.c for cfi_mtd_nb
  needed after RFC rebase

 cmd/bootm.c                    |  2 +-
 cmd/flash.c                    | 34 +++++++++++++++++-----------------
 common/flash.c                 |  2 +-
 common/update.c                |  4 ++--
 drivers/mtd/cfi_flash.c        |  4 ++--
 drivers/mtd/cfi_mtd.c          |  4 ++--
 drivers/mtd/spi/spi-nor-core.c |  5 ++---
 include/mtd/cfi_flash.h        |  9 ++++++---
 8 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/cmd/bootm.c b/cmd/bootm.c
index b82a872a86..e8b7066888 100644
--- a/cmd/bootm.c
+++ b/cmd/bootm.c
@@ -338,7 +338,7 @@ static int do_imls_nor(void)
 	void *hdr;
 
 	for (i = 0, info = &flash_info[0];
-		i < CONFIG_SYS_MAX_FLASH_BANKS; ++i, ++info) {
+		i < CFI_FLASH_BANKS; ++i, ++info) {
 
 		if (info->flash_id == FLASH_UNKNOWN)
 			goto next_bank;
diff --git a/cmd/flash.c b/cmd/flash.c
index 594e2caa59..db4bb2529c 100644
--- a/cmd/flash.c
+++ b/cmd/flash.c
@@ -60,7 +60,7 @@ abbrev_spec(char *str, flash_info_t **pinfo, int *psf, int *psl)
 
 	bank = dectoul(str, &ep);
 	if (ep == str || *ep != '\0' ||
-	    bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS)
+	    bank < 1 || bank > CFI_FLASH_BANKS)
 		return -1;
 
 	fp = &flash_info[bank - 1];
@@ -104,7 +104,7 @@ int flash_sect_roundb(ulong *addr)
 
 	/* find the end addr of the sector where the *addr is */
 	found = 0;
-	for (bank = 0; bank < CONFIG_SYS_MAX_FLASH_BANKS && !found; ++bank) {
+	for (bank = 0; bank < CFI_FLASH_BANKS && !found; ++bank) {
 		info = &flash_info[bank];
 		for (i = 0; i < info->sector_count && !found; ++i) {
 			/* get the end address of the sector */
@@ -201,13 +201,13 @@ flash_fill_sect_ranges(ulong addr_first, ulong addr_last,
 
 	*s_count = 0;
 
-	for (bank = 0; bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+	for (bank = 0; bank < CFI_FLASH_BANKS; ++bank) {
 		s_first[bank] = -1;	/* first sector to erase	*/
 		s_last[bank] = -1;	/* last  sector to erase	*/
 	}
 
 	for (bank = 0, info = &flash_info[0];
-	     (bank < CONFIG_SYS_MAX_FLASH_BANKS) && (addr_first <= addr_last);
+	     (bank < CFI_FLASH_BANKS) && (addr_first <= addr_last);
 	     ++bank, ++info) {
 		ulong b_end;
 		int sect;
@@ -278,7 +278,7 @@ static int do_flinfo(struct cmd_tbl *cmdtp, int flag, int argc,
 
 #ifdef CONFIG_MTD_NOR_FLASH
 	if (argc == 1) {	/* print info for all FLASH banks */
-		for (bank = 0; bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+		for (bank = 0; bank < CFI_FLASH_BANKS; ++bank) {
 			printf("\nBank # %ld: ", bank + 1);
 
 			flash_print_info(&flash_info[bank]);
@@ -287,9 +287,9 @@ static int do_flinfo(struct cmd_tbl *cmdtp, int flag, int argc,
 	}
 
 	bank = hextoul(argv[1], NULL);
-	if (bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS) {
+	if (bank < 1 || bank > CFI_FLASH_BANKS) {
 		printf("Only FLASH Banks # 1 ... # %d supported\n",
-		       CONFIG_SYS_MAX_FLASH_BANKS);
+		       CFI_FLASH_BANKS);
 		return 1;
 	}
 	printf("\nBank # %ld: ", bank);
@@ -316,7 +316,7 @@ static int do_flerase(struct cmd_tbl *cmdtp, int flag, int argc,
 		return CMD_RET_USAGE;
 
 	if (strcmp(argv[1], "all") == 0) {
-		for (bank = 1; bank <= CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+		for (bank = 1; bank <= CFI_FLASH_BANKS; ++bank) {
 			printf("Erase Flash Bank # %ld ", bank);
 			info = &flash_info[bank - 1];
 			rcode = flash_erase(info, 0, info->sector_count - 1);
@@ -366,9 +366,9 @@ static int do_flerase(struct cmd_tbl *cmdtp, int flag, int argc,
 
 	if (strcmp(argv[1], "bank") == 0) {
 		bank = hextoul(argv[2], NULL);
-		if (bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS) {
+		if (bank < 1 || bank > CFI_FLASH_BANKS) {
 			printf("Only FLASH Banks # 1 ... # %d supported\n",
-			       CONFIG_SYS_MAX_FLASH_BANKS);
+			       CFI_FLASH_BANKS);
 			return 1;
 		}
 		printf("Erase Flash Bank # %ld ", bank);
@@ -397,7 +397,7 @@ int flash_sect_erase(ulong addr_first, ulong addr_last)
 {
 	flash_info_t *info;
 	ulong bank;
-	int s_first[CONFIG_SYS_MAX_FLASH_BANKS], s_last[CONFIG_SYS_MAX_FLASH_BANKS];
+	int s_first[CFI_FLASH_BANKS], s_last[CFI_FLASH_BANKS];
 	int erased = 0;
 	int planned;
 	int rcode = 0;
@@ -406,7 +406,7 @@ int flash_sect_erase(ulong addr_first, ulong addr_last)
 
 	if (planned && rcode == 0) {
 		for (bank = 0, info = &flash_info[0];
-		     bank < CONFIG_SYS_MAX_FLASH_BANKS && rcode == 0;
+		     bank < CFI_FLASH_BANKS && rcode == 0;
 		     ++bank, ++info) {
 			if (s_first[bank] >= 0) {
 				erased += s_last[bank] - s_first[bank] + 1;
@@ -463,7 +463,7 @@ static int do_protect(struct cmd_tbl *cmdtp, int flag, int argc,
 
 #ifdef CONFIG_MTD_NOR_FLASH
 	if (strcmp(argv[2], "all") == 0) {
-		for (bank = 1; bank <= CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+		for (bank = 1; bank <= CFI_FLASH_BANKS; ++bank) {
 			info = &flash_info[bank - 1];
 			if (info->flash_id == FLASH_UNKNOWN)
 				continue;
@@ -547,9 +547,9 @@ static int do_protect(struct cmd_tbl *cmdtp, int flag, int argc,
 
 	if (strcmp(argv[2], "bank") == 0) {
 		bank = hextoul(argv[3], NULL);
-		if (bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS) {
+		if (bank < 1 || bank > CFI_FLASH_BANKS) {
 			printf("Only FLASH Banks # 1 ... # %d supported\n",
-			       CONFIG_SYS_MAX_FLASH_BANKS);
+			       CFI_FLASH_BANKS);
 			return 1;
 		}
 		printf("%sProtect Flash Bank # %ld\n",
@@ -596,7 +596,7 @@ int flash_sect_protect(int p, ulong addr_first, ulong addr_last)
 {
 	flash_info_t *info;
 	ulong bank;
-	int s_first[CONFIG_SYS_MAX_FLASH_BANKS], s_last[CONFIG_SYS_MAX_FLASH_BANKS];
+	int s_first[CFI_FLASH_BANKS], s_last[CFI_FLASH_BANKS];
 	int protected, i;
 	int planned;
 	int rcode;
@@ -607,7 +607,7 @@ int flash_sect_protect(int p, ulong addr_first, ulong addr_last)
 
 	if (planned && rcode == 0) {
 		for (bank = 0, info = &flash_info[0];
-		     bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank, ++info) {
+		     bank < CFI_FLASH_BANKS; ++bank, ++info) {
 			if (info->flash_id == FLASH_UNKNOWN)
 				continue;
 
diff --git a/common/flash.c b/common/flash.c
index bb82385c1f..f939c2f9e9 100644
--- a/common/flash.c
+++ b/common/flash.c
@@ -91,7 +91,7 @@ addr2info(ulong addr)
 	flash_info_t *info;
 	int i;
 
-	for (i=0, info = &flash_info[0]; i<CONFIG_SYS_MAX_FLASH_BANKS; ++i, ++info) {
+	for (i = 0, info = &flash_info[0]; i < CFI_FLASH_BANKS; ++i, ++info) {
 		if (info->flash_id != FLASH_UNKNOWN &&
 		    addr >= info->start[0] &&
 		    /* WARNING - The '- 1' is needed if the flash
diff --git a/common/update.c b/common/update.c
index f5c8684f1b..b9ad475d9d 100644
--- a/common/update.c
+++ b/common/update.c
@@ -112,12 +112,12 @@ static int update_flash_protect(int prot, ulong addr_first, ulong addr_last)
 
 	if (prot == 0) {
 		saved_prot_info =
-			calloc(CONFIG_SYS_MAX_FLASH_BANKS * CONFIG_SYS_MAX_FLASH_SECT, 1);
+			calloc(CFI_FLASH_BANKS * CONFIG_SYS_MAX_FLASH_SECT, 1);
 		if (!saved_prot_info)
 			return 1;
 	}
 
-	for (bank = 0; bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+	for (bank = 0; bank < CFI_FLASH_BANKS; ++bank) {
 		cnt = 0;
 		info = &flash_info[bank];
 
diff --git a/drivers/mtd/cfi_flash.c b/drivers/mtd/cfi_flash.c
index 9c27fea5d8..71cefc125f 100644
--- a/drivers/mtd/cfi_flash.c
+++ b/drivers/mtd/cfi_flash.c
@@ -191,7 +191,7 @@ static flash_info_t *flash_get_info(ulong base)
 	int i;
 	flash_info_t *info;
 
-	for (i = 0; i < CONFIG_SYS_MAX_FLASH_BANKS; i++) {
+	for (i = 0; i < CFI_FLASH_BANKS; i++) {
 		info = &flash_info[i];
 		if (info->size && info->start[0] <= base &&
 		    base <= info->start[0] + info->size - 1)
@@ -2419,7 +2419,7 @@ unsigned long flash_init(void)
 #endif
 
 	/* Init: no FLASHes known */
-	for (i = 0; i < CONFIG_SYS_MAX_FLASH_BANKS; ++i) {
+	for (i = 0; i < CFI_FLASH_BANKS; ++i) {
 		flash_info[i].flash_id = FLASH_UNKNOWN;
 
 		/* Optionally write flash configuration register */
diff --git a/drivers/mtd/cfi_mtd.c b/drivers/mtd/cfi_mtd.c
index 2295bb7220..f998ffaf26 100644
--- a/drivers/mtd/cfi_mtd.c
+++ b/drivers/mtd/cfi_mtd.c
@@ -207,10 +207,10 @@ int cfi_mtd_init(void)
 	int error, i;
 #ifdef CONFIG_MTD_CONCAT
 	int devices_found = 0;
-	struct mtd_info *mtd_list[CONFIG_SYS_MAX_FLASH_BANKS];
+	struct mtd_info *mtd_list[CFI_FLASH_BANKS];
 #endif
 
-	for (i = 0; i < CONFIG_SYS_MAX_FLASH_BANKS; i++) {
+	for (i = 0; i < CFI_FLASH_BANKS; i++) {
 		fi = &flash_info[i];
 		mtd = &cfi_mtd_info[i];
 
diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 4388a08a90..6acaa84d2b 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -3707,9 +3707,8 @@ int spi_nor_scan(struct spi_nor *nor)
 	int ret;
 	int cfi_mtd_nb = 0;
 
-#ifdef CONFIG_SYS_MAX_FLASH_BANKS
-	cfi_mtd_nb = CONFIG_SYS_MAX_FLASH_BANKS;
-#endif
+	if (IS_ENABLED(CONFIG_FLASH_CFI_MTD))
+		cfi_mtd_nb = CFI_FLASH_BANKS;
 
 	/* Reset SPI protocol for all commands. */
 	nor->reg_proto = SNOR_PROTO_1_1_1;
diff --git a/include/mtd/cfi_flash.h b/include/mtd/cfi_flash.h
index a1af6fc200..d62c8f18fc 100644
--- a/include/mtd/cfi_flash.h
+++ b/include/mtd/cfi_flash.h
@@ -154,21 +154,24 @@ struct cfi_pri_hdr {
 /*
  * CFI_MAX_FLASH_BANKS only used for flash_info struct declaration.
  *
- * Use CONFIG_SYS_MAX_FLASH_BANKS_DETECT if defined
+ * CFI_FLASH_BANKS selects the correct number of available banks =
+ * cfi_flash_num_flash_banks when CONFIG_SYS_MAX_FLASH_BANKS_DETECT is defined
+ * or CONFIG_SYS_MAX_FLASH_BANKS
  */
 #if defined(CONFIG_SYS_MAX_FLASH_BANKS_DETECT)
 #define CFI_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 /* map to cfi_flash_num_flash_banks only when supported */
 #if IS_ENABLED(CONFIG_FLASH_CFI_DRIVER) && \
     (!IS_ENABLED(CONFIG_SPL_BUILD) || IS_ENABLED(CONFIG_SPL_MTD_SUPPORT))
-#define CONFIG_SYS_MAX_FLASH_BANKS	(cfi_flash_num_flash_banks)
+#define CFI_FLASH_BANKS		(cfi_flash_num_flash_banks)
 /* board code can update this variable before CFI detection */
 extern int cfi_flash_num_flash_banks;
 #else
-#define CONFIG_SYS_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS_DETECT
+#define CFI_FLASH_BANKS		CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #endif
 #else
 #define CFI_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS
+#define CFI_FLASH_BANKS		CONFIG_SYS_MAX_FLASH_BANKS
 #endif
 
 phys_addr_t cfi_flash_bank_addr(int i);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2B47489F
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Dec 2021 17:57:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4E27C5E2C1;
	Tue, 14 Dec 2021 16:57:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCEC6C597BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 16:57:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEFYo2U018624;
 Tue, 14 Dec 2021 17:57:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=p4eSdZPlyjkH47/Z6kfc6RgAvloRUxMQgd06qgsZ6KU=;
 b=0Tqb7IfScZGA4ar0lYkbQ6QIxS8JSEsUP2StpkOI8i5jxI4nkXJyUYzk3qF8EnqQOW/5
 GpUMCTgDtGbhIYDaRLtNWLcKtOCisK0vGviMdC6xBoafBnaxHqCdrI8ylwodk2/bfjOu
 hVcnpyLgz/x1UjJibgX2ziMfQhbgGeQmOLVUuw4R2+vEpkBl8kNQ/aUuFxlIGe/fvifo
 h0n/jeSPNaY3Fro1Kgrr5s3FiVjO7BkzcXuxtsqzzOK1zIDlR9j48oGruYKAKiYbriWL
 J7vYoGKrRlq6kWsPOuHcidHpVhrSyOsmDma7huyHRU6HdKDpmUCAJA9ULfGugDL9T2gC CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxk4hnbmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 17:57:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C00A100038;
 Tue, 14 Dec 2021 17:57:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9516120A089;
 Tue, 14 Dec 2021 17:57:07 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec 2021 17:57:07
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Dec 2021 17:57:00 +0100
Message-ID: <20211214175652.RFC.1.Iaa7c4564c1e7d57e198f7621d124cddaa3296c4a@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_07,2021-12-14_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [RFC PATCH 1/5] cmd: Fix up warnings in flash.c
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

Tidy up the warnings reported by checkpatch.pl to prepare next patches

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 cmd/flash.c | 239 +++++++++++++++++++++++++---------------------------
 1 file changed, 117 insertions(+), 122 deletions(-)

diff --git a/cmd/flash.c b/cmd/flash.c
index 819febc10e..594e2caa59 100644
--- a/cmd/flash.c
+++ b/cmd/flash.c
@@ -19,7 +19,7 @@
 int mtdparts_init(void);
 int mtd_id_parse(const char *id, const char **ret_id, u8 *dev_type, u8 *dev_num);
 int find_dev_and_part(const char *id, struct mtd_device **dev,
-		u8 *part_num, struct part_info **part);
+		      u8 *part_num, struct part_info **part);
 #endif
 
 #ifdef CONFIG_MTD_NOR_FLASH
@@ -47,34 +47,39 @@ extern flash_info_t flash_info[];	/* info for FLASH chips */
  *			  or an invalid flash bank.
  */
 static int
-abbrev_spec (char *str, flash_info_t ** pinfo, int *psf, int *psl)
+abbrev_spec(char *str, flash_info_t **pinfo, int *psf, int *psl)
 {
 	flash_info_t *fp;
 	int bank, first, last;
 	char *p, *ep;
 
-	if ((p = strchr (str, ':')) == NULL)
+	p = strchr(str, ':');
+	if (!p)
 		return 0;
 	*p++ = '\0';
 
 	bank = dectoul(str, &ep);
 	if (ep == str || *ep != '\0' ||
-		bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS ||
-		(fp = &flash_info[bank - 1])->flash_id == FLASH_UNKNOWN)
+	    bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS)
+		return -1;
+
+	fp = &flash_info[bank - 1];
+	if (fp->flash_id == FLASH_UNKNOWN)
 		return -1;
 
 	str = p;
-	if ((p = strchr (str, '-')) != NULL)
+	p = strchr(str, '-');
+	if (p)
 		*p++ = '\0';
 
 	first = dectoul(str, &ep);
 	if (ep == str || *ep != '\0' || first >= fp->sector_count)
 		return -1;
 
-	if (p != NULL) {
+	if (p) {
 		last = dectoul(p, &ep);
 		if (ep == p || *ep != '\0' ||
-			last < first || last >= fp->sector_count)
+		    last < first || last >= fp->sector_count)
 			return -1;
 	} else {
 		last = first;
@@ -107,11 +112,10 @@ int flash_sect_roundb(ulong *addr)
 				sector_end_addr = info->start[0] +
 								info->size - 1;
 			} else {
-				sector_end_addr = info->start[i+1] - 1;
+				sector_end_addr = info->start[i + 1] - 1;
 			}
 
-			if (*addr <= sector_end_addr &&
-						*addr >= info->start[i]) {
+			if (*addr <= sector_end_addr && *addr >= info->start[i]) {
 				found = 1;
 				/* adjust *addr if necessary */
 				if (*addr < sector_end_addr)
@@ -144,7 +148,7 @@ int flash_sect_roundb(ulong *addr)
  * Return:
  *    1: success
  *   -1: failure (bad format, bad address).
-*/
+ */
 static int
 addr_spec(char *arg1, char *arg2, ulong *addr_first, ulong *addr_last)
 {
@@ -156,7 +160,7 @@ addr_spec(char *arg1, char *arg2, ulong *addr_first, ulong *addr_last)
 		return -1;
 
 	len_used = 0;
-	if (arg2 && *arg2 == '+'){
+	if (arg2 && *arg2 == '+') {
 		len_used = 1;
 		++arg2;
 	}
@@ -165,7 +169,7 @@ addr_spec(char *arg1, char *arg2, ulong *addr_first, ulong *addr_last)
 	if (ep == arg2 || *ep != '\0')
 		return -1;
 
-	if (len_used){
+	if (len_used) {
 		/*
 		 * *addr_last has the length, compute correct *addr_last
 		 * XXX watch out for the integer overflow! Right now it is
@@ -187,9 +191,9 @@ addr_spec(char *arg1, char *arg2, ulong *addr_first, ulong *addr_last)
 }
 
 static int
-flash_fill_sect_ranges (ulong addr_first, ulong addr_last,
-			int *s_first, int *s_last,
-			int *s_count )
+flash_fill_sect_ranges(ulong addr_first, ulong addr_last,
+		       int *s_first, int *s_last,
+		       int *s_count)
 {
 	flash_info_t *info;
 	ulong bank;
@@ -197,27 +201,25 @@ flash_fill_sect_ranges (ulong addr_first, ulong addr_last,
 
 	*s_count = 0;
 
-	for (bank=0; bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+	for (bank = 0; bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
 		s_first[bank] = -1;	/* first sector to erase	*/
-		s_last [bank] = -1;	/* last  sector to erase	*/
+		s_last[bank] = -1;	/* last  sector to erase	*/
 	}
 
-	for (bank=0,info = &flash_info[0];
+	for (bank = 0, info = &flash_info[0];
 	     (bank < CONFIG_SYS_MAX_FLASH_BANKS) && (addr_first <= addr_last);
 	     ++bank, ++info) {
 		ulong b_end;
 		int sect;
 		short s_end;
 
-		if (info->flash_id == FLASH_UNKNOWN) {
+		if (info->flash_id == FLASH_UNKNOWN)
 			continue;
-		}
 
 		b_end = info->start[0] + info->size - 1;	/* bank end addr */
 		s_end = info->sector_count - 1;			/* last sector   */
 
-
-		for (sect=0; sect < info->sector_count; ++sect) {
+		for (sect = 0; sect < info->sector_count; ++sect) {
 			ulong end;	/* last address in current sect	*/
 
 			end = (sect == s_end) ? b_end : info->start[sect + 1] - 1;
@@ -227,40 +229,37 @@ flash_fill_sect_ranges (ulong addr_first, ulong addr_last,
 			if (addr_last < info->start[sect])
 				continue;
 
-			if (addr_first == info->start[sect]) {
+			if (addr_first == info->start[sect])
 				s_first[bank] = sect;
-			}
-			if (addr_last  == end) {
+
+			if (addr_last  == end)
 				s_last[bank]  = sect;
-			}
 		}
 		if (s_first[bank] >= 0) {
 			if (s_last[bank] < 0) {
 				if (addr_last > b_end) {
 					s_last[bank] = s_end;
 				} else {
-					puts ("Error: end address"
-						" not on sector boundary\n");
+					puts("Error: end address not on sector boundary\n");
 					rcode = 1;
 					break;
 				}
 			}
 			if (s_last[bank] < s_first[bank]) {
-				puts ("Error: end sector"
-					" precedes start sector\n");
+				puts("Error: end sector precedes start sector\n");
 				rcode = 1;
 				break;
 			}
 			sect = s_last[bank];
-			addr_first = (sect == s_end) ? b_end + 1: info->start[sect + 1];
+			addr_first = (sect == s_end) ? b_end + 1 : info->start[sect + 1];
 			(*s_count) += s_last[bank] - s_first[bank] + 1;
 		} else if (addr_first >= info->start[0] && addr_first < b_end) {
-			puts ("Error: start address not on sector boundary\n");
+			puts("Error: start address not on sector boundary\n");
 			rcode = 1;
 			break;
 		} else if (s_last[bank] >= 0) {
-			puts ("Error: cannot span across banks when they are"
-			       " mapped in reverse order\n");
+			puts("Error: cannot span across banks when they are"
+			     " mapped in reverse order\n");
 			rcode = 1;
 			break;
 		}
@@ -279,8 +278,8 @@ static int do_flinfo(struct cmd_tbl *cmdtp, int flag, int argc,
 
 #ifdef CONFIG_MTD_NOR_FLASH
 	if (argc == 1) {	/* print info for all FLASH banks */
-		for (bank=0; bank <CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
-			printf ("\nBank # %ld: ", bank+1);
+		for (bank = 0; bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+			printf("\nBank # %ld: ", bank + 1);
 
 			flash_print_info(&flash_info[bank]);
 		}
@@ -288,12 +287,12 @@ static int do_flinfo(struct cmd_tbl *cmdtp, int flag, int argc,
 	}
 
 	bank = hextoul(argv[1], NULL);
-	if ((bank < 1) || (bank > CONFIG_SYS_MAX_FLASH_BANKS)) {
-		printf ("Only FLASH Banks # 1 ... # %d supported\n",
-			CONFIG_SYS_MAX_FLASH_BANKS);
+	if (bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS) {
+		printf("Only FLASH Banks # 1 ... # %d supported\n",
+		       CONFIG_SYS_MAX_FLASH_BANKS);
 		return 1;
 	}
-	printf ("\nBank # %ld: ", bank);
+	printf("\nBank # %ld: ", bank);
 	flash_print_info(&flash_info[bank - 1]);
 #endif /* CONFIG_MTD_NOR_FLASH */
 	return 0;
@@ -317,28 +316,29 @@ static int do_flerase(struct cmd_tbl *cmdtp, int flag, int argc,
 		return CMD_RET_USAGE;
 
 	if (strcmp(argv[1], "all") == 0) {
-		for (bank=1; bank<=CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
-			printf ("Erase Flash Bank # %ld ", bank);
-			info = &flash_info[bank-1];
+		for (bank = 1; bank <= CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+			printf("Erase Flash Bank # %ld ", bank);
+			info = &flash_info[bank - 1];
 			rcode = flash_erase(info, 0, info->sector_count - 1);
 		}
 		return rcode;
 	}
 
-	if ((n = abbrev_spec(argv[1], &info, &sect_first, &sect_last)) != 0) {
+	n = abbrev_spec(argv[1], &info, &sect_first, &sect_last);
+	if (n) {
 		if (n < 0) {
-			puts ("Bad sector specification\n");
+			puts("Bad sector specification\n");
 			return 1;
 		}
-		printf ("Erase Flash Sectors %d-%d in Bank # %zu ",
-			sect_first, sect_last, (info-flash_info)+1);
+		printf("Erase Flash Sectors %d-%d in Bank # %zu ",
+		       sect_first, sect_last, (info - flash_info) + 1);
 		rcode = flash_erase(info, sect_first, sect_last);
 		return rcode;
 	}
 
 #if defined(CONFIG_CMD_MTDPARTS)
 	/* erase <part-id> - erase partition */
-	if ((argc == 2) && (mtd_id_parse(argv[1], NULL, &dev_type, &dev_num) == 0)) {
+	if (argc == 2 && mtd_id_parse(argv[1], NULL, &dev_type, &dev_num) == 0) {
 		mtdparts_init();
 		if (find_dev_and_part(argv[1], &dev, &pnum, &part) == 0) {
 			if (dev->id->type == MTD_DEV_TYPE_NOR) {
@@ -347,10 +347,9 @@ static int do_flerase(struct cmd_tbl *cmdtp, int flag, int argc,
 				addr_first = part->offset + info->start[0];
 				addr_last = addr_first + part->size - 1;
 
-				printf ("Erase Flash Partition %s, "
-						"bank %ld, 0x%08lx - 0x%08lx ",
-						argv[1], bank, addr_first,
-						addr_last);
+				printf("Erase Flash Partition %s, bank %ld, 0x%08lx - 0x%08lx ",
+				       argv[1], bank, addr_first,
+				       addr_last);
 
 				rcode = flash_sect_erase(addr_first, addr_last);
 				return rcode;
@@ -367,19 +366,19 @@ static int do_flerase(struct cmd_tbl *cmdtp, int flag, int argc,
 
 	if (strcmp(argv[1], "bank") == 0) {
 		bank = hextoul(argv[2], NULL);
-		if ((bank < 1) || (bank > CONFIG_SYS_MAX_FLASH_BANKS)) {
-			printf ("Only FLASH Banks # 1 ... # %d supported\n",
-				CONFIG_SYS_MAX_FLASH_BANKS);
+		if (bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS) {
+			printf("Only FLASH Banks # 1 ... # %d supported\n",
+			       CONFIG_SYS_MAX_FLASH_BANKS);
 			return 1;
 		}
-		printf ("Erase Flash Bank # %ld ", bank);
-		info = &flash_info[bank-1];
+		printf("Erase Flash Bank # %ld ", bank);
+		info = &flash_info[bank - 1];
 		rcode = flash_erase(info, 0, info->sector_count - 1);
 		return rcode;
 	}
 
-	if (addr_spec(argv[1], argv[2], &addr_first, &addr_last) < 0){
-		printf ("Bad address format\n");
+	if (addr_spec(argv[1], argv[2], &addr_first, &addr_last) < 0) {
+		printf("Bad address format\n");
 		return 1;
 	}
 
@@ -403,14 +402,13 @@ int flash_sect_erase(ulong addr_first, ulong addr_last)
 	int planned;
 	int rcode = 0;
 
-	rcode = flash_fill_sect_ranges (addr_first, addr_last,
-					s_first, s_last, &planned );
+	rcode = flash_fill_sect_ranges(addr_first, addr_last, s_first, s_last, &planned);
 
-	if (planned && (rcode == 0)) {
-		for (bank=0,info = &flash_info[0];
-		     (bank < CONFIG_SYS_MAX_FLASH_BANKS) && (rcode == 0);
+	if (planned && rcode == 0) {
+		for (bank = 0, info = &flash_info[0];
+		     bank < CONFIG_SYS_MAX_FLASH_BANKS && rcode == 0;
 		     ++bank, ++info) {
-			if (s_first[bank]>=0) {
+			if (s_first[bank] >= 0) {
 				erased += s_last[bank] - s_first[bank] + 1;
 				debug("Erase Flash from 0x%08lx to 0x%08lx in Bank # %ld ",
 				      info->start[s_first[bank]],
@@ -425,8 +423,7 @@ int flash_sect_erase(ulong addr_first, ulong addr_last)
 		if (rcode == 0)
 			printf("Erased %d sectors\n", erased);
 	} else if (rcode == 0) {
-		puts ("Error: start and/or end address"
-			" not on sector boundary\n");
+		puts("Error: start and/or end address not on sector boundary\n");
 		rcode = 1;
 	}
 	return rcode;
@@ -466,50 +463,52 @@ static int do_protect(struct cmd_tbl *cmdtp, int flag, int argc,
 
 #ifdef CONFIG_MTD_NOR_FLASH
 	if (strcmp(argv[2], "all") == 0) {
-		for (bank=1; bank<=CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
-			info = &flash_info[bank-1];
-			if (info->flash_id == FLASH_UNKNOWN) {
+		for (bank = 1; bank <= CONFIG_SYS_MAX_FLASH_BANKS; ++bank) {
+			info = &flash_info[bank - 1];
+			if (info->flash_id == FLASH_UNKNOWN)
 				continue;
-			}
-			printf ("%sProtect Flash Bank # %ld\n",
-				p ? "" : "Un-", bank);
 
-			for (i=0; i<info->sector_count; ++i) {
+			printf("%sProtect Flash Bank # %ld\n",
+			       p ? "" : "Un-", bank);
+
+			for (i = 0; i < info->sector_count; ++i) {
 #if defined(CONFIG_SYS_FLASH_PROTECTION)
 				if (flash_real_protect(info, i, p))
 					rcode = 1;
-				putc ('.');
+				putc('.');
 #else
 				info->protect[i] = p;
 #endif	/* CONFIG_SYS_FLASH_PROTECTION */
 			}
 #if defined(CONFIG_SYS_FLASH_PROTECTION)
-			if (!rcode) puts (" done\n");
+			if (!rcode)
+				puts(" done\n");
 #endif	/* CONFIG_SYS_FLASH_PROTECTION */
 		}
 		return rcode;
 	}
-
-	if ((n = abbrev_spec(argv[2], &info, &sect_first, &sect_last)) != 0) {
+	n = abbrev_spec(argv[2], &info, &sect_first, &sect_last);
+	if (n) {
 		if (n < 0) {
-			puts ("Bad sector specification\n");
+			puts("Bad sector specification\n");
 			return 1;
 		}
 		printf("%sProtect Flash Sectors %d-%d in Bank # %zu\n",
-			p ? "" : "Un-", sect_first, sect_last,
-			(info-flash_info)+1);
+		       p ? "" : "Un-", sect_first, sect_last,
+		       (info - flash_info) + 1);
 		for (i = sect_first; i <= sect_last; i++) {
 #if defined(CONFIG_SYS_FLASH_PROTECTION)
 			if (flash_real_protect(info, i, p))
 				rcode =  1;
-			putc ('.');
+			putc('.');
 #else
 			info->protect[i] = p;
 #endif	/* CONFIG_SYS_FLASH_PROTECTION */
 		}
 
 #if defined(CONFIG_SYS_FLASH_PROTECTION)
-		if (!rcode) puts (" done\n");
+		if (!rcode)
+			puts(" done\n");
 #endif	/* CONFIG_SYS_FLASH_PROTECTION */
 
 		return rcode;
@@ -517,7 +516,7 @@ static int do_protect(struct cmd_tbl *cmdtp, int flag, int argc,
 
 #if defined(CONFIG_CMD_MTDPARTS)
 	/* protect on/off <part-id> */
-	if ((argc == 3) && (mtd_id_parse(argv[2], NULL, &dev_type, &dev_num) == 0)) {
+	if (argc == 3 && mtd_id_parse(argv[2], NULL, &dev_type, &dev_num) == 0) {
 		mtdparts_init();
 		if (find_dev_and_part(argv[2], &dev, &pnum, &part) == 0) {
 			if (dev->id->type == MTD_DEV_TYPE_NOR) {
@@ -526,10 +525,10 @@ static int do_protect(struct cmd_tbl *cmdtp, int flag, int argc,
 				addr_first = part->offset + info->start[0];
 				addr_last = addr_first + part->size - 1;
 
-				printf ("%sProtect Flash Partition %s, "
-						"bank %ld, 0x%08lx - 0x%08lx\n",
-						p ? "" : "Un", argv[1],
-						bank, addr_first, addr_last);
+				printf("%sProtect Flash Partition %s, "
+				       "bank %ld, 0x%08lx - 0x%08lx\n",
+				       p ? "" : "Un", argv[1],
+				       bank, addr_first, addr_last);
 
 				rcode = flash_sect_protect(p, addr_first,
 							   addr_last);
@@ -537,7 +536,7 @@ static int do_protect(struct cmd_tbl *cmdtp, int flag, int argc,
 			}
 
 			printf("cannot %sprotect, not a NOR device\n",
-					p ? "" : "un");
+			       p ? "" : "un");
 			return 1;
 		}
 	}
@@ -548,37 +547,38 @@ static int do_protect(struct cmd_tbl *cmdtp, int flag, int argc,
 
 	if (strcmp(argv[2], "bank") == 0) {
 		bank = hextoul(argv[3], NULL);
-		if ((bank < 1) || (bank > CONFIG_SYS_MAX_FLASH_BANKS)) {
-			printf ("Only FLASH Banks # 1 ... # %d supported\n",
-				CONFIG_SYS_MAX_FLASH_BANKS);
+		if (bank < 1 || bank > CONFIG_SYS_MAX_FLASH_BANKS) {
+			printf("Only FLASH Banks # 1 ... # %d supported\n",
+			       CONFIG_SYS_MAX_FLASH_BANKS);
 			return 1;
 		}
-		printf ("%sProtect Flash Bank # %ld\n",
-			p ? "" : "Un-", bank);
-		info = &flash_info[bank-1];
+		printf("%sProtect Flash Bank # %ld\n",
+		       p ? "" : "Un-", bank);
+		info = &flash_info[bank - 1];
 
 		if (info->flash_id == FLASH_UNKNOWN) {
-			puts ("missing or unknown FLASH type\n");
+			puts("missing or unknown FLASH type\n");
 			return 1;
 		}
-		for (i=0; i<info->sector_count; ++i) {
+		for (i = 0; i < info->sector_count; ++i) {
 #if defined(CONFIG_SYS_FLASH_PROTECTION)
 			if (flash_real_protect(info, i, p))
 				rcode =  1;
-			putc ('.');
+			putc('.');
 #else
 			info->protect[i] = p;
 #endif	/* CONFIG_SYS_FLASH_PROTECTION */
 		}
 
 #if defined(CONFIG_SYS_FLASH_PROTECTION)
-		if (!rcode) puts (" done\n");
+		if (!rcode)
+			puts(" done\n");
 #endif	/* CONFIG_SYS_FLASH_PROTECTION */
 
 		return rcode;
 	}
 
-	if (addr_spec(argv[2], argv[3], &addr_first, &addr_last) < 0){
+	if (addr_spec(argv[2], argv[3], &addr_first, &addr_last) < 0) {
 		printf("Bad address format\n");
 		return 1;
 	}
@@ -601,26 +601,26 @@ int flash_sect_protect(int p, ulong addr_first, ulong addr_last)
 	int planned;
 	int rcode;
 
-	rcode = flash_fill_sect_ranges( addr_first, addr_last, s_first, s_last, &planned );
+	rcode = flash_fill_sect_ranges(addr_first, addr_last, s_first, s_last, &planned);
 
 	protected = 0;
 
-	if (planned && (rcode == 0)) {
-		for (bank=0,info = &flash_info[0]; bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank, ++info) {
-			if (info->flash_id == FLASH_UNKNOWN) {
+	if (planned && rcode == 0) {
+		for (bank = 0, info = &flash_info[0];
+		     bank < CONFIG_SYS_MAX_FLASH_BANKS; ++bank, ++info) {
+			if (info->flash_id == FLASH_UNKNOWN)
 				continue;
-			}
 
-			if (s_first[bank]>=0 && s_first[bank]<=s_last[bank]) {
+			if (s_first[bank] >= 0 && s_first[bank] <= s_last[bank]) {
 				debug("%sProtecting sectors %d..%d in bank %ld\n",
 				      p ? "" : "Un-", s_first[bank],
 				      s_last[bank], bank + 1);
 				protected += s_last[bank] - s_first[bank] + 1;
-				for (i=s_first[bank]; i<=s_last[bank]; ++i) {
+				for (i = s_first[bank]; i <= s_last[bank]; ++i) {
 #if defined(CONFIG_SYS_FLASH_PROTECTION)
 					if (flash_real_protect(info, i, p))
 						rcode = 1;
-					putc ('.');
+					putc('.');
 #else
 					info->protect[i] = p;
 #endif	/* CONFIG_SYS_FLASH_PROTECTION */
@@ -628,21 +628,19 @@ int flash_sect_protect(int p, ulong addr_first, ulong addr_last)
 			}
 		}
 #if defined(CONFIG_SYS_FLASH_PROTECTION)
-		puts (" done\n");
+		puts(" done\n");
 #endif	/* CONFIG_SYS_FLASH_PROTECTION */
 
-		printf ("%sProtected %d sectors\n",
-			p ? "" : "Un-", protected);
+		printf("%sProtected %d sectors\n",
+		       p ? "" : "Un-", protected);
 	} else if (rcode == 0) {
-		puts ("Error: start and/or end address"
-			" not on sector boundary\n");
+		puts("Error: start and/or end address not on sector boundary\n");
 		rcode = 1;
 	}
 	return rcode;
 }
 #endif /* CONFIG_MTD_NOR_FLASH */
 
-
 /**************************************************/
 #if defined(CONFIG_CMD_MTDPARTS)
 # define TMP_ERASE	"erase <part-id>\n    - erase partition\n"
@@ -667,8 +665,7 @@ U_BOOT_CMD(
 	"start end\n"
 	"    - erase FLASH from addr 'start' to addr 'end'\n"
 	"erase start +len\n"
-	"    - erase FLASH from addr 'start' to the end of sect "
-	"w/addr 'start'+'len'-1\n"
+	"    - erase FLASH from addr 'start' to the end of sect w/addr 'start'+'len'-1\n"
 	"erase N:SF[-SL]\n    - erase sectors SF-SL in FLASH bank # N\n"
 	"erase bank N\n    - erase FLASH bank # N\n"
 	TMP_ERASE
@@ -681,8 +678,7 @@ U_BOOT_CMD(
 	"on  start end\n"
 	"    - protect FLASH from addr 'start' to addr 'end'\n"
 	"protect on start +len\n"
-	"    - protect FLASH from addr 'start' to end of sect "
-	"w/addr 'start'+'len'-1\n"
+	"    - protect FLASH from addr 'start' to end of sect w/addr 'start'+'len'-1\n"
 	"protect on  N:SF[-SL]\n"
 	"    - protect sectors SF-SL in FLASH bank # N\n"
 	"protect on  bank N\n    - protect FLASH bank # N\n"
@@ -691,8 +687,7 @@ U_BOOT_CMD(
 	"protect off start end\n"
 	"    - make FLASH from addr 'start' to addr 'end' writable\n"
 	"protect off start +len\n"
-	"    - make FLASH from addr 'start' to end of sect "
-	"w/addr 'start'+'len'-1 wrtable\n"
+	"    - make FLASH from addr 'start' to end of sect w/addr 'start'+'len'-1 wrtable\n"
 	"protect off N:SF[-SL]\n"
 	"    - make sectors SF-SL writable in FLASH bank # N\n"
 	"protect off bank N\n    - make FLASH bank # N writable\n"
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

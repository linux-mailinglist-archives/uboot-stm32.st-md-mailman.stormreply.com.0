Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 956B8236A5
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:00:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63DCBC0D2A4
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 13:00:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13121C0D2A1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 13:00:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KCfFao010604; Mon, 20 May 2019 15:00:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=i80Myw3gTIEgls/3ENaPM3oqlVNcLhcslLgN3Sy5YBM=;
 b=K2FlfvKcNooVY3kdmQMWruRzOAJ1JBI7cX5vVKEO3Ri5MjwaYDMHolahuoVjDk5IEahs
 ei0Pwl6PgkkVCQfjnLGu/TBETweXAEZACJCo8jWWqaQS5Onl/MkqbLf80lOoKW2mpKkP
 tuOFurpG/L8S/bX68O+e62DixcotTA2e9VCrvPWbvaHNjxbVT3jrTj9AZ99J3s4A4lXh
 Cqf4uHh7m9JQ7xYHaC3JitjEjnjwrrk7Pz7e2GcxHjlkRPEn+e43RsnUrLwa5sF8siYS
 Tes7QmOPYMigHXwyDsKjXM5pmtio3DGPv6lsoDcFiWqRduBNJZx5KdQiLddBXqh6o9hb 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0kp42-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 15:00:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC7A834;
 Mon, 20 May 2019 13:00:17 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BC7A289E;
 Mon, 20 May 2019 13:00:17 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 15:00:17 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 15:00:16
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 15:00:02 +0200
Message-ID: <1558357207-7345-4-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_06:, , signatures=0
Cc: Simon Glass <sjg@chromium.org>, Alexander Graf <agraf@suse.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 3/8] sandbox: add option show_of_embedded
	for spl test
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

Add an option show_of_embedded used in SPL to dump the used device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- add new option for spl test: show embedded dtb

 arch/sandbox/cpu/spl.c           | 188 +++++++++++++++++++++++++++++++++++++++
 arch/sandbox/cpu/start.c         |   9 ++
 arch/sandbox/include/asm/state.h |   1 +
 3 files changed, 198 insertions(+)

diff --git a/arch/sandbox/cpu/spl.c b/arch/sandbox/cpu/spl.c
index 2ca4cd6..d3d9b08 100644
--- a/arch/sandbox/cpu/spl.c
+++ b/arch/sandbox/cpu/spl.c
@@ -46,6 +46,190 @@ static int spl_board_load_image(struct spl_image_info *spl_image,
 }
 SPL_LOAD_IMAGE_METHOD("sandbox", 0, BOOT_DEVICE_BOARD, spl_board_load_image);
 
+#ifdef CONFIG_OF_EMBED
+/****************************************************************************/
+/* the next functions mainly copyied from cmd fdt for SPL sandbox test */
+
+#include <linux/ctype.h>
+
+#define CMD_FDT_MAX_DUMP 64
+#define MAX_LEVEL	32		/* how deeply nested we will go */
+
+/*
+ * Heuristic to guess if this is a string or concatenated strings.
+ */
+
+static int is_printable_string(const void *data, int len)
+{
+	const char *s = data;
+
+	/* zero length is not */
+	if (len == 0)
+		return 0;
+
+	/* must terminate with zero or '\n' */
+	if (s[len - 1] != '\0' && s[len - 1] != '\n')
+		return 0;
+
+	/* printable or a null byte (concatenated strings) */
+	while (((*s == '\0') || isprint(*s) || isspace(*s)) && (len > 0)) {
+		/*
+		 * If we see a null, there are three possibilities:
+		 * 1) If len == 1, it is the end of the string, printable
+		 * 2) Next character also a null, not printable.
+		 * 3) Next character not a null, continue to check.
+		 */
+		if (s[0] == '\0') {
+			if (len == 1)
+				return 1;
+			if (s[1] == '\0')
+				return 0;
+		}
+		s++;
+		len--;
+	}
+
+	/* Not the null termination, or not done yet: not printable */
+	if (*s != '\0' || len != 0)
+		return 0;
+
+	return 1;
+}
+
+/*
+ * Print the property in the best format, a heuristic guess.  Print as
+ * a string, concatenated strings, a byte, word, double word, or (if all
+ * else fails) it is printed as a stream of bytes.
+ */
+static void print_data(const void *data, int len)
+{
+	int j;
+
+	/* no data, don't print */
+	if (len == 0)
+		return;
+
+	/*
+	 * It is a string, but it may have multiple strings (embedded '\0's).
+	 */
+	if (is_printable_string(data, len)) {
+		puts("\"");
+		j = 0;
+		while (j < len) {
+			if (j > 0)
+				puts("\", \"");
+			puts(data);
+			j    += strlen(data) + 1;
+			data += strlen(data) + 1;
+		}
+		puts("\"");
+		return;
+	}
+
+	if ((len % 4) == 0) {
+		if (len > CMD_FDT_MAX_DUMP) {
+			printf("* 0x%p [0x%08x]", data, len);
+		} else {
+			const __be32 *p;
+
+			printf("<");
+			for (j = 0, p = data; j < len / 4; j++)
+				printf("0x%08x%s", fdt32_to_cpu(p[j]),
+				       j < (len / 4 - 1) ? " " : "");
+			printf(">");
+		}
+	} else { /* anything else... hexdump */
+		if (len > CMD_FDT_MAX_DUMP) {
+			printf("* 0x%p [0x%08x]", data, len);
+		} else {
+			const u8 *s;
+
+			printf("[");
+			for (j = 0, s = data; j < len; j++)
+				printf("%02x%s", s[j], j < len - 1 ? " " : "");
+			printf("]");
+		}
+	}
+}
+
+/*
+ * Recursively print the working_fdt.
+ */
+static int fdt_print(const struct fdt_header *working_fdt)
+{
+	static char tabs[MAX_LEVEL + 1] =
+		"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t"
+		"\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t";
+	const void *nodep;	/* property node pointer */
+	int  nodeoffset = 0;	/* node offset from libfdt */
+	int  nextoffset;	/* next node offset from libfdt */
+	u32  tag;		/* tag */
+	int  len;		/* length of the property */
+	int  level = 0;		/* keep track of nesting level */
+	const struct fdt_property *fdt_prop;
+	const char *pathp;
+
+	/* print the node and all subnodes. */
+	while (level >= 0) {
+		tag = fdt_next_tag(working_fdt, nodeoffset, &nextoffset);
+		switch (tag) {
+		case FDT_BEGIN_NODE:
+			pathp = fdt_get_name(working_fdt, nodeoffset, NULL);
+			if (!pathp)
+				pathp = "/* NULL pointer error */";
+			if (*pathp == '\0')
+				pathp = "/";	/* root is nameless */
+			printf("%s%s {\n",
+			       &tabs[MAX_LEVEL - level], pathp);
+			level++;
+			break;
+		case FDT_END_NODE:
+			level--;
+			printf("%s};\n", &tabs[MAX_LEVEL - level]);
+			if (level == 0)
+				level = -1;		/* exit the loop */
+			break;
+		case FDT_PROP:
+			fdt_prop = fdt_offset_ptr(working_fdt, nodeoffset,
+						  sizeof(*fdt_prop));
+			pathp    = fdt_string(working_fdt,
+					      fdt32_to_cpu(fdt_prop->nameoff));
+			len      = fdt32_to_cpu(fdt_prop->len);
+			nodep    = fdt_prop->data;
+			if (len < 0) {
+				printf("libfdt fdt_getprop(): %s\n",
+				       fdt_strerror(len));
+				return 1;
+			} else if (len == 0) {
+				/* the property has no value */
+				printf("%s%s;\n",
+				       &tabs[MAX_LEVEL - level],
+				       pathp);
+			} else {
+				printf("%s%s = ",
+				       &tabs[MAX_LEVEL - level],
+				       pathp);
+				print_data(nodep, len);
+				printf(";\n");
+			}
+			break;
+		case FDT_NOP:
+			printf("%s/* NOP */\n", &tabs[MAX_LEVEL - level]);
+			break;
+		case FDT_END:
+			return 1;
+		default:
+			return 1;
+		}
+		nodeoffset = nextoffset;
+	}
+
+	return 0;
+}
+
+/***************************************************************************/
+#endif
+
 void spl_board_init(void)
 {
 	struct sandbox_state *state = state_get_current();
@@ -63,6 +247,10 @@ void spl_board_init(void)
 		     uclass_next_device(&dev))
 			;
 	}
+#ifdef CONFIG_OF_EMBED
+	if (state->show_of_embedded)
+		fdt_print(gd->fdt_blob);
+#endif
 }
 
 void __noreturn jump_to_image_no_args(struct spl_image_info *spl_image)
diff --git a/arch/sandbox/cpu/start.c b/arch/sandbox/cpu/start.c
index 82828f0..8116e3c 100644
--- a/arch/sandbox/cpu/start.c
+++ b/arch/sandbox/cpu/start.c
@@ -293,6 +293,15 @@ static int sandbox_cmdline_cb_show_of_platdata(struct sandbox_state *state,
 }
 SANDBOX_CMDLINE_OPT(show_of_platdata, 0, "Show of-platdata in SPL");
 
+static int sandbox_cmdline_cb_show_of_embedded(struct sandbox_state *state,
+					       const char *arg)
+{
+	state->show_of_embedded = true;
+
+	return 0;
+}
+SANDBOX_CMDLINE_OPT(show_of_embedded, 0, "Show of-embedded in SPL");
+
 int board_run_command(const char *cmdline)
 {
 	printf("## Commands are disabled. Please enable CONFIG_CMDLINE.\n");
diff --git a/arch/sandbox/include/asm/state.h b/arch/sandbox/include/asm/state.h
index 2d773d3..c8142c8 100644
--- a/arch/sandbox/include/asm/state.h
+++ b/arch/sandbox/include/asm/state.h
@@ -90,6 +90,7 @@ struct sandbox_state {
 	bool show_test_output;		/* Don't suppress stdout in tests */
 	int default_log_level;		/* Default log level for sandbox */
 	bool show_of_platdata;		/* Show of-platdata in SPL */
+	bool show_of_embedded;		/* Show of-embedded in SPL */
 	bool ram_buf_read;		/* true if we read the RAM buffer */
 
 	/* Pointer to information for each SPI bus/cs */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

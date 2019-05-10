Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C9D1A13D
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:20:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76405CA8E5F
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:20:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56A2BCA8E5C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:20:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6OvB020346; Fri, 10 May 2019 18:20:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AvlDMcc40x8Z7XIxo4OC8Nfz6sJVs5MtX9jX8VEP4Lc=;
 b=mmG561nBnsL1POgPsvoIKvAxiVs/u0W/PKru5MaRycFHTETgo76db35Dq2ZS2GhAOIc5
 qfMrfQGnoFKHGQS63KIdqXObS1EkSDZO8iiGzPmWh+YHqBSszBcR9XCKLt1dOMRSl4kq
 f59Arxro3VY3e06hYSh1+2lABckX3chV2Wb6iUcgW2IOexRWszOue0muAG4c7U3MN7ek
 r7PuR+OganXFwEVkrBjVNAyKYXPU4xzfC7mOitAtiPBuVNm9PDk2DGzlK47PE1osEugk
 IeArvyZwjFGTzSp8XQESWjrxorsXwlPrPTbL5etDbMG5TWbrYZ5fj9n5/P10w1aI1miX ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2sr2j-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB80131;
 Fri, 10 May 2019 16:20:11 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7F792C4E;
 Fri, 10 May 2019 16:20:11 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:11 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:03 +0200
Message-ID: <1557505154-3856-3-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
References: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 02/13] stm32mp1: support dynamic MTDPARTS
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

This patch configure the default value for mtdids and mtparts
dynamically according the presence of nor and nand in
the board device tree

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
 include/configs/stm32mp1.h   |  9 +++++
 2 files changed, 94 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 76917b0..360b0df 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -504,3 +504,88 @@ void board_quiesce_devices(void)
 {
 	setup_led(LEDST_OFF);
 }
+
+#ifdef CONFIG_SYS_MTDPARTS_RUNTIME
+
+#define MTDPARTS_LEN		256
+#define MTDIDS_LEN		128
+
+/**
+ * The mtdparts_nand0 and mtdparts_nor0 variable tends to be long.
+ * If we need to access it before the env is relocated, then we need
+ * to use our own stack buffer. gd->env_buf will be too small.
+ *
+ * @param buf temporary buffer pointer MTDPARTS_LEN long
+ * @return mtdparts variable string, NULL if not found
+ */
+static const char *env_get_mtdparts(const char *str, char *buf)
+{
+	if (gd->flags & GD_FLG_ENV_READY)
+		return env_get(str);
+	if (env_get_f(str, buf, MTDPARTS_LEN) != -1)
+		return buf;
+
+	return NULL;
+}
+
+/**
+ * update the variables "mtdids" and "mtdparts" with content of mtdparts_<dev>
+ */
+static void board_get_mtdparts(const char *dev,
+			       char *mtdids,
+			       char *mtdparts)
+{
+	char env_name[32] = "mtdparts_";
+	char tmp_mtdparts[MTDPARTS_LEN];
+	const char *tmp;
+
+	/* name of env variable to read = mtdparts_<dev> */
+	strcat(env_name, dev);
+	tmp = env_get_mtdparts(env_name, tmp_mtdparts);
+	if (tmp) {
+		/* mtdids: "<dev>=<dev>, ...." */
+		if (mtdids[0] != '\0')
+			strcat(mtdids, ",");
+		strcat(mtdids, dev);
+		strcat(mtdids, "=");
+		strcat(mtdids, dev);
+
+		/* mtdparts: "mtdparts=<dev>:<mtdparts_<dev>>;..." */
+		if (mtdparts[0] != '\0')
+			strncat(mtdparts, ";", MTDPARTS_LEN);
+		else
+			strcat(mtdparts, "mtdparts=");
+		strncat(mtdparts, dev, MTDPARTS_LEN);
+		strncat(mtdparts, ":", MTDPARTS_LEN);
+		strncat(mtdparts, tmp, MTDPARTS_LEN);
+	}
+}
+
+void board_mtdparts_default(const char **mtdids, const char **mtdparts)
+{
+	struct udevice *dev;
+	static char parts[2 * MTDPARTS_LEN + 1];
+	static char ids[MTDIDS_LEN + 1];
+	static bool mtd_initialized;
+
+	if (mtd_initialized) {
+		*mtdids = ids;
+		*mtdparts = parts;
+		return;
+	}
+
+	memset(parts, 0, sizeof(parts));
+	memset(ids, 0, sizeof(ids));
+
+	if (!uclass_get_device(UCLASS_MTD, 0, &dev))
+		board_get_mtdparts("nand0", ids, parts);
+
+	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
+		board_get_mtdparts("nor0", ids, parts);
+
+	mtd_initialized = true;
+	*mtdids = ids;
+	*mtdparts = parts;
+	debug("%s:mtdids=%s & mtdparts=%s\n", __func__, ids, parts);
+}
+#endif
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index a28b8b3..254aad1 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -115,6 +115,14 @@
 
 #include <config_distro_bootcmd.h>
 
+#if defined(CONFIG_STM32_QSPI) || defined(CONFIG_NAND_STM32_FMC)
+#define CONFIG_SYS_MTDPARTS_RUNTIME
+#endif
+
+#define STM32MP_MTDPARTS \
+	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),-(nor_user)\0" \
+	"mtdparts_nand0=2m(fsbl),2m(ssbl),-(UBI)\0"
+
 /*
  * memory layout for 32M uncompressed/compressed kernel,
  * 1M fdt, 1M script, 1M pxe and 1M for splashimage
@@ -130,6 +138,7 @@
 	"fdt_high=0xffffffff\0" \
 	"initrd_high=0xffffffff\0" \
 	STM32MP_BOOTCMD \
+	STM32MP_MTDPARTS \
 	BOOTENV
 
 #endif /* ifndef CONFIG_SPL_BUILD */
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

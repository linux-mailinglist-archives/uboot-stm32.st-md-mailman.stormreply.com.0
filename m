Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1F610CA3
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 11:01:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A000C640F5;
	Fri, 28 Oct 2022 09:01:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BA6DC640F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:01:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29S87nXG013085;
 Fri, 28 Oct 2022 11:01:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=JqFTFdllCPWBKe4N5yGFp5P6l+3/CTTmWiisV9YDD38=;
 b=PUQBfLohR5P0LcyaBZuQw8S6v/0hkUEGqfJcT7/qc3/HevlJOovT3GEaMsvsxrldaadK
 um30Dljvf+JzNBJUOD5KMcwvtniKHZkORJUxA9uIVHKIyJVMHPIJwrCfuKT/XDn79FkY
 gyGDR680CQu1Qhzw64FEvuG25c5fDR9CyPdqY5Pcz/XiEmv3tysTN1fK6ioygzL69OD9
 2Q6Ba5tI9yLd9SONYoio21hWO8+YYUer9Y18HXWJmXI8aEQkMVupHEL2FJvg8f6xMVSb
 UEZWWqD2ZI+4WA6cQMLJ2I+kZq6AWK6KjBYyHcrJQTOMQ7qswQNj/q5djaIdZ7Vphz3B IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfahu3dp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 11:01:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 45D34100034;
 Fri, 28 Oct 2022 11:01:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FA01215153;
 Fri, 28 Oct 2022 11:01:33 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 11:01:32 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Oct 2022 11:01:19 +0200
Message-ID: <20221028110055.2.I4662774cdd525de1992f84f0ea97255e2e43d8c2@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_04,2022-10-27_01,2022-06-22_01
Cc: Edoardo Tomelleri <e.tomell@gmail.com>, Peter Hoyes <Peter.Hoyes@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Artem Lapkin <email2tema@gmail.com>,
 Zhang Ning <zhangn1985@qq.com>, Zhaofeng Li <hello@zhaofeng.li>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 2/3] cmd: pxe: support INITRD and FDT
	selection with FIT
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

Since the commit d5ba6188dfbf ("cmd: pxe_utils: Check fdtcontroladdr
in label_boot") the FDT or the FDTDIR label is required in extlinux.conf
and the fallback done by bootm command when only the device tree present
in this command parameters is no more performed when FIT is used for
kernel.

When the label FDT or FDTDIR are absent or if the device tree file is
absent, the PXE command in U-Boot uses the default U-Boot device tree
selected by fdtcontroladdr = gd->fdt_blob, it is the "Scenario 3".

With this scenario the bootm FIP fallback is no more possible with
the extlinux.conf when only "kernel" label is present and is a FIP:

  kernel <path>#<conf>[#<extra-conf[#...]]

As the U-Boot FDT is always provided in the third bootm argument,
the device tree found in FIP is not used as fallback, it was done
previously in boot_get_fdt().

This patch adds a new field kernel_label to save the full kernel label.
The FDT bootm parameters use the kernel address (to avoid to load a
second time the same FIP) and the config when this full label is reused
for "fdt" or "initrd" label.

This FIP support in extlinux.conf is restored when the "FDT" label
can be found and select the same FIP (identical file and configuration):

  kernel <path>#<conf>[#<extra-conf[#...]]
  fdt <path>#<conf>[#<extra-conf[#...]]

The patch add also this possibility for initrd.

  initrd <path>#<conf>[#<extra-conf[#...]]

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 boot/pxe_utils.c    | 17 ++++++++++++++---
 doc/README.pxe      |  8 ++++++++
 include/pxe_utils.h |  2 ++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
index 844ab72252bf..756b201eda91 100644
--- a/boot/pxe_utils.c
+++ b/boot/pxe_utils.c
@@ -259,6 +259,7 @@ static struct pxe_label *label_create(void)
 static void label_destroy(struct pxe_label *label)
 {
 	free(label->name);
+	free(label->kernel_label);
 	free(label->kernel);
 	free(label->config);
 	free(label->append);
@@ -543,9 +544,11 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
 		kernel_addr = fit_addr;
 	}
 
-	if (label->initrd) {
+	/* For FIT, the label can be identical to kernel one */
+	if (label->initrd && !strcmp(label->kernel_label, label->initrd)) {
+		initrd_addr_str =  kernel_addr;
+	} else if (label->initrd) {
 		ulong size;
-
 		if (get_relfile_envaddr(ctx, label->initrd, "ramdisk_addr_r",
 					&size) < 0) {
 			printf("Skipping %s for failure retrieving initrd\n",
@@ -623,8 +626,11 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
 	 */
 	bootm_argv[3] = env_get("fdt_addr_r");
 
+	/* For FIT, the label can be identical to kernel one */
+	if (label->fdt && !strcmp(label->kernel_label, label->fdt)) {
+		bootm_argv[3] = kernel_addr;
 	/* if fdt label is defined then get fdt from server */
-	if (bootm_argv[3]) {
+	} else if (bootm_argv[3]) {
 		char *fdtfile = NULL;
 		char *fdtfilefree = NULL;
 
@@ -1165,6 +1171,11 @@ static int parse_label_kernel(char **c, struct pxe_label *label)
 	if (err < 0)
 		return err;
 
+	/* copy the kernel label to compare with FDT / INITRD when FIT is used */
+	label->kernel_label = strdup(label->kernel);
+	if (!label->kernel_label)
+		return -ENOMEM;
+
 	s = strstr(label->kernel, "#");
 	if (!s)
 		return 1;
diff --git a/doc/README.pxe b/doc/README.pxe
index d14d2bdcc9b0..172201093d02 100644
--- a/doc/README.pxe
+++ b/doc/README.pxe
@@ -179,11 +179,19 @@ initrd <path>	    - if this label is chosen, use tftp to retrieve the initrd
 		      at <path>. it will be stored at the address indicated in
 		      the initrd_addr_r environment variable, and that address
 		      will be passed to bootm.
+		      For FIT image, the initrd can be provided with the same value than
+		      kernel, including configuration:
+		        <path>#<conf>[#<extra-conf[#...]]
+		      In this case, kernel_addr_r is passed to bootm.
 
 fdt <path>	    - if this label is chosen, use tftp to retrieve the fdt blob
 		      at <path>. it will be stored at the address indicated in
 		      the fdt_addr_r environment variable, and that address will
 		      be passed to bootm.
+		      For FIT image, the device tree can be provided with the same value
+		      than kernel, including configuration:
+		        <path>#<conf>[#<extra-conf[#...]]
+		      In this case, kernel_addr_r is passed to bootm.
 
 devicetree <path>   - if this label is chosen, use tftp to retrieve the fdt blob
 		      at <path>. it will be stored at the address indicated in
diff --git a/include/pxe_utils.h b/include/pxe_utils.h
index 4a73b2aace34..1e5e8424f53f 100644
--- a/include/pxe_utils.h
+++ b/include/pxe_utils.h
@@ -28,6 +28,7 @@
  * Create these with the 'label_create' function given below.
  *
  * name - the name of the menu as given on the 'menu label' line.
+ * kernel_label - the kernel label, including FIT config if present.
  * kernel - the path to the kernel file to use for this label.
  * append - kernel command line to use when booting this label
  * initrd - path to the initrd to use for this label.
@@ -40,6 +41,7 @@ struct pxe_label {
 	char num[4];
 	char *name;
 	char *menu;
+	char *kernel_label;
 	char *kernel;
 	char *config;
 	char *append;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

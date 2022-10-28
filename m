Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F595610C9D
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 11:01:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF73DC03FDA;
	Fri, 28 Oct 2022 09:01:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AB16C03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:01:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29S87nXH013085;
 Fri, 28 Oct 2022 11:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=6XAE3nNxoohKGfbNnPSJsxwAtHotCs7/9pJMT2o1qjU=;
 b=avMcCJ4qVBI5s3tbWuSMCL+OzmBsktI52Z3IS4cOJlkghWFppUSpiZ9gjJ7R3Y9g+opJ
 bf8b6S3xdK846gpGpR62eXqbucKrCH+jn3I746x/UQNFGuLTaEZ5BHgFW4SCAZEl0SBZ
 nXpMzA9Q2Wkq5wyd2puDPJp5yGi3QZsJfxeR3OOVpRAFLNEM+zEhXah2UE0yGJEFJHLQ
 xanclIaXMAmaBZmzcFQoClxg5XbaLkR2OPIMcPygy0EwuHhdIjeEUl7+AgPOYcbhNqnP
 Zt/T/BVeo7SCeX1hclvpoB9TE1dDTtRh4wgys1N4JJt3U+a/D6tbekprFs91BWGwUEq3 tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfahu3dp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 11:01:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9807E100038;
 Fri, 28 Oct 2022 11:01:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 922DA215153;
 Fri, 28 Oct 2022 11:01:34 +0200 (CEST)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 11:01:31 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 28 Oct 2022 11:01:18 +0200
Message-ID: <20221028110055.1.If04f25e393f3af8cd75af331ca2f432a7a1b88e8@changeid>
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
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 1/3] cmd: pxe: reorder kernel treatment in
	label_boot
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

Reorder kernel treatment in label_boot at the beginning of the function.

This patch doesn't change the pxe command behavior, it is only a
preliminary step for next patch, build kernel_addr before parsing
the label initrd and fdt to build the next bootm arguments.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 boot/pxe_utils.c | 49 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
index d5c215ae2c1d..844ab72252bf 100644
--- a/boot/pxe_utils.c
+++ b/boot/pxe_utils.c
@@ -522,6 +522,27 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
 		return 1;
 	}
 
+	if (get_relfile_envaddr(ctx, label->kernel, "kernel_addr_r",
+				NULL) < 0) {
+		printf("Skipping %s for failure retrieving kernel\n",
+		       label->name);
+		return 1;
+	}
+
+	kernel_addr = env_get("kernel_addr_r");
+	/* for FIT, append the configuration identifier */
+	if (label->config) {
+		int len = strlen(kernel_addr) + strlen(label->config) + 1;
+
+		fit_addr = malloc(len);
+		if (!fit_addr) {
+			printf("malloc fail (FIT address)\n");
+			return 1;
+		}
+		snprintf(fit_addr, len, "%s%s", kernel_addr, label->config);
+		kernel_addr = fit_addr;
+	}
+
 	if (label->initrd) {
 		ulong size;
 
@@ -529,21 +550,14 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
 					&size) < 0) {
 			printf("Skipping %s for failure retrieving initrd\n",
 			       label->name);
-			return 1;
+			goto cleanup;
 		}
 
 		initrd_addr_str = env_get("ramdisk_addr_r");
 		size = snprintf(initrd_str, sizeof(initrd_str), "%s:%lx",
 				initrd_addr_str, size);
 		if (size >= sizeof(initrd_str))
-			return 1;
-	}
-
-	if (get_relfile_envaddr(ctx, label->kernel, "kernel_addr_r",
-				NULL) < 0) {
-		printf("Skipping %s for failure retrieving kernel\n",
-		       label->name);
-		return 1;
+			goto cleanup;
 	}
 
 	if (label->ipappend & 0x1) {
@@ -573,7 +587,7 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
 			       strlen(label->append ?: ""),
 			       strlen(ip_str), strlen(mac_str),
 			       sizeof(bootargs));
-			return 1;
+			goto cleanup;
 		}
 
 		if (label->append)
@@ -588,21 +602,6 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
 		printf("append: %s\n", finalbootargs);
 	}
 
-	kernel_addr = env_get("kernel_addr_r");
-
-	/* for FIT, append the configuration identifier */
-	if (label->config) {
-		int len = strlen(kernel_addr) + strlen(label->config) + 1;
-
-		fit_addr = malloc(len);
-		if (!fit_addr) {
-			printf("malloc fail (FIT address)\n");
-			return 1;
-		}
-		snprintf(fit_addr, len, "%s%s", kernel_addr, label->config);
-		kernel_addr = fit_addr;
-	}
-
 	/*
 	 * fdt usage is optional:
 	 * It handles the following scenarios.
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

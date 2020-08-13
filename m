Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD42437E0
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:47:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74AA8C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:47:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2721C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:47:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9gLBH014716; Thu, 13 Aug 2020 11:47:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mTk/B8ID3fJkR6cX22luZeR6zaLo6Oa4uyUjBnxPivA=;
 b=rMw+cvU6KSI55GpyGFbVfO2s+gmq7Loi058fjH6QRBIHjaZMXPJQzryWOu3JM43ZriXN
 W5r27Q8atAYp3IvpUhtndhcxoHec/1k9QVIFxeTl1BAjix4mjKmVl70wcgG60SFVSTyH
 xYvV1Tm4+nQ6UuAeGf1kWn+Yqsk4iMtiTB9t5BL88h+OlH/lqjgRWqeie+JsOJ5uC52c
 n20jMYQyDUGt8nEjNh2ZI7tAIe63mbYQtt36hBP+8CB8tEDNyx0isXu+9uK77EOwnXsq
 SKZSi2X+PtP4vIIX7kYeQBGtPCwRgM2u89d33jAnxzMYwzHWa4UQ+XRmWkDBrrAC6gl8 Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32smf9n1dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:47:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B80210002A;
 Thu, 13 Aug 2020 11:47:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E6C821F170;
 Thu, 13 Aug 2020 11:47:17 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 13 Aug 2020 11:47:16 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 13 Aug 2020 11:46:57 +0200
Message-ID: <20200813114650.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [Uboot-stm32] [PATCH 1/2] fdtdec: optionally add property no-map to
	created reserved memory node
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

From: Etienne Carriere <etienne.carriere@st.com>

Add boolean input argument @no_map to helper function
fdtdec_add_reserved_memory() to add "no-map" property for an added
reserved memory node. This is needed for example when the reserved
memory relates to secure memory that the dear Linux kernel shall
not even map unless what non-secure world speculative accesses of the
CPU can violate the memory firmware configuration.

No function change. A later change will update to OPTEE library to
add no-map property to OP-TEE reserved memory nodes.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 include/fdtdec.h  |  5 +++--
 lib/fdtdec.c      | 10 ++++++++--
 lib/optee/optee.c |  2 +-
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 760b392bdf..ad2b0879d7 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -999,7 +999,7 @@ static inline int fdtdec_set_phandle(void *blob, int node, uint32_t phandle)
  *     };
  *     uint32_t phandle;
  *
- *     fdtdec_add_reserved_memory(fdt, "framebuffer", &fb, &phandle);
+ *     fdtdec_add_reserved_memory(fdt, "framebuffer", &fb, &phandle, false);
  *
  * This results in the following subnode being added to the top-level
  * /reserved-memory node:
@@ -1026,11 +1026,12 @@ static inline int fdtdec_set_phandle(void *blob, int node, uint32_t phandle)
  * @param carveout	information about the carveout region
  * @param phandlep	return location for the phandle of the carveout region
  *			can be NULL if no phandle should be added
+ * @param no_map	add "no-map" property if true
  * @return 0 on success or a negative error code on failure
  */
 int fdtdec_add_reserved_memory(void *blob, const char *basename,
 			       const struct fdt_memory *carveout,
-			       uint32_t *phandlep);
+			       uint32_t *phandlep, bool no_map);
 
 /**
  * fdtdec_get_carveout() - reads a carveout from an FDT
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 78576b530f..303455e44b 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -1255,7 +1255,7 @@ static int fdtdec_init_reserved_memory(void *blob)
 
 int fdtdec_add_reserved_memory(void *blob, const char *basename,
 			       const struct fdt_memory *carveout,
-			       uint32_t *phandlep)
+			       uint32_t *phandlep, bool no_map)
 {
 	fdt32_t cells[4] = {}, *ptr = cells;
 	uint32_t upper, lower, phandle;
@@ -1355,6 +1355,12 @@ int fdtdec_add_reserved_memory(void *blob, const char *basename,
 	if (err < 0)
 		return err;
 
+	if (no_map) {
+		err = fdt_setprop(blob, node, "no-map", NULL, 0);
+		if (err < 0)
+			return err;
+	}
+
 	/* return the phandle for the new node for the caller to use */
 	if (phandlep)
 		*phandlep = phandle;
@@ -1420,7 +1426,7 @@ int fdtdec_set_carveout(void *blob, const char *node, const char *prop_name,
 	fdt32_t value;
 	void *prop;
 
-	err = fdtdec_add_reserved_memory(blob, name, carveout, &phandle);
+	err = fdtdec_add_reserved_memory(blob, name, carveout, &phandle, false);
 	if (err < 0) {
 		debug("failed to add reserved memory: %d\n", err);
 		return err;
diff --git a/lib/optee/optee.c b/lib/optee/optee.c
index 457d4cca8a..963c2ff430 100644
--- a/lib/optee/optee.c
+++ b/lib/optee/optee.c
@@ -192,7 +192,7 @@ int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
 				ret = fdtdec_add_reserved_memory(new_blob,
 								 nodename,
 								 &carveout,
-								 NULL);
+								 NULL, false);
 				free(oldname);
 
 				if (ret < 0)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

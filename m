Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD8B264082
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 10:50:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17B01C424B9
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 08:50:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FF23C424B8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 08:50:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08A8kwp4004330; Thu, 10 Sep 2020 10:50:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mHCbQSZfMTAScSyLeX4gIziEwxjwF2PWmJHcgenigrQ=;
 b=tEiEpNH6eWJk2kYkQ9wzx1xw5n6iHfZo9faO6+rV0zyDrQRMJxY1EMr+WgHR6KDOfRz0
 rGDgf7acboDMDy3hm29gVH9J4jEy48vIatuLw3J/k/+y7MZLWy03+UVUAOzhw1HCOXRp
 6to/jsWMRWs/lJFZpxe0tT4ujFHaUzbEk0AVyYarxhv85jbRzlfFtzTNf1FZqBaGBPzm
 5c3BCyIcHfUIqpGxadHyQWt48GaSORVRX8FIaql75O4ODVAW+cEfIBCBueq7Rl5md7iw
 2p3/nMuyxFcYFN/196rf6gOoyUsShnIthSGYrUn6zhCOLFEGpTHt+lha8DWw40CGl562 Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051j1t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 10:50:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EBFC10002A;
 Thu, 10 Sep 2020 10:50:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C908C21F69A;
 Thu, 10 Sep 2020 10:50:03 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 10 Sep 2020 10:50:03 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Sep 2020 10:49:59 +0200
Message-ID: <20200910104956.v4.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_01:2020-09-10,
 2020-09-10 signatures=0
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bin.meng@windriver.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Rick Chen <rick@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [Uboot-stm32] [PATCH v4 1/3] fdtdec: optionally add property no-map
	to created reserved memory node
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
fdtdec_add_reserved_memory() to add or not "no-map" property
for an added reserved memory node.

Property no-map is used by the Linux kernel to not not map memory
in its static memory mapping. It is needed for example for the|
consistency of system non-cached memory and to prevent speculative
accesses to some firewalled memory.

No functional change. A later change will update to OPTEE library to
add no-map property to OP-TEE reserved memory nodes.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v4:
   - Reword commit message

Changes in v2:
   - fix dm fdtdec test and arch/riscv/lib/fdt_fixup.c with
   fdtdec_add_reserved_memory() new parameter

 arch/riscv/lib/fdt_fixup.c |  2 +-
 include/fdtdec.h           |  5 +++--
 lib/fdtdec.c               | 10 ++++++++--
 lib/optee/optee.c          |  2 +-
 test/dm/fdtdec.c           |  6 +++---
 5 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/lib/fdt_fixup.c b/arch/riscv/lib/fdt_fixup.c
index 5b2420243f..d02062fd5b 100644
--- a/arch/riscv/lib/fdt_fixup.c
+++ b/arch/riscv/lib/fdt_fixup.c
@@ -75,7 +75,7 @@ int riscv_fdt_copy_resv_mem_node(const void *src, void *dst)
 		pmp_mem.start = addr;
 		pmp_mem.end = addr + size - 1;
 		err = fdtdec_add_reserved_memory(dst, basename, &pmp_mem,
-						 &phandle);
+						 &phandle, false);
 		if (err < 0 && err != -FDT_ERR_EXISTS) {
 			log_err("failed to add reserved memory: %d\n", err);
 			return err;
diff --git a/include/fdtdec.h b/include/fdtdec.h
index 152eb07b9e..62d1660973 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -1029,7 +1029,7 @@ static inline int fdtdec_set_phandle(void *blob, int node, uint32_t phandle)
  *     };
  *     uint32_t phandle;
  *
- *     fdtdec_add_reserved_memory(fdt, "framebuffer", &fb, &phandle);
+ *     fdtdec_add_reserved_memory(fdt, "framebuffer", &fb, &phandle, false);
  *
  * This results in the following subnode being added to the top-level
  * /reserved-memory node:
@@ -1056,11 +1056,12 @@ static inline int fdtdec_set_phandle(void *blob, int node, uint32_t phandle)
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
index d3b22ec323..b3cbe1223e 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -1319,7 +1319,7 @@ static int fdtdec_init_reserved_memory(void *blob)
 
 int fdtdec_add_reserved_memory(void *blob, const char *basename,
 			       const struct fdt_memory *carveout,
-			       uint32_t *phandlep)
+			       uint32_t *phandlep, bool no_map)
 {
 	fdt32_t cells[4] = {}, *ptr = cells;
 	uint32_t upper, lower, phandle;
@@ -1419,6 +1419,12 @@ int fdtdec_add_reserved_memory(void *blob, const char *basename,
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
@@ -1484,7 +1490,7 @@ int fdtdec_set_carveout(void *blob, const char *node, const char *prop_name,
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
diff --git a/test/dm/fdtdec.c b/test/dm/fdtdec.c
index 716993f706..4119003041 100644
--- a/test/dm/fdtdec.c
+++ b/test/dm/fdtdec.c
@@ -80,7 +80,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
 	resv.start = 0x1000;
 	resv.end = 0x1fff;
 	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region",
-					       &resv, &phandle));
+					       &resv, &phandle, false));
 
 	/* Test /reserve-memory and its subnode should exist */
 	parent = fdt_path_offset(blob, "/reserved-memory");
@@ -101,7 +101,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
 	resv.start = 0x2000;
 	resv.end = 0x2fff;
 	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region1",
-					       &resv, &phandle1));
+					       &resv, &phandle1, false));
 	subnode = fdt_path_offset(blob, "/reserved-memory/rsvd_region1");
 	ut_assert(subnode > 0);
 
@@ -115,7 +115,7 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
 	resv.start = 0x1000;
 	resv.end = 0x1fff;
 	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region2",
-					       &resv, &phandle1));
+					       &resv, &phandle1, false));
 	subnode = fdt_path_offset(blob, "/reserved-memory/rsvd_region2");
 	ut_assert(subnode < 0);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

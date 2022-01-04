Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF601483D1C
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jan 2022 08:42:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70E66C5F1F5;
	Tue,  4 Jan 2022 07:42:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5104C5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jan 2022 07:42:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2041FEKc016868;
 Tue, 4 Jan 2022 08:42:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=VFpD7QLGxZPueyTZJ2CWgrEam3uZ5xvmErzQFijIz48=;
 b=oG5ivyK0xOtYV+ZmB2BZ5DniUoPj9Y0vcZqE4ExZRM122z5NsXtcK4M9lL6zshQ3CXQw
 7GiKVi5SmvvjxXcv87h+obPYMIeL737hVyzNeA498mddWnqojPP20P8fxtjaVWgbu8GA
 U8YyIBvlDLhPnKbgibdE+bcwL4cvTsEZAcOEIsFMn27D0+QDczelh+kycOU4pV56Urng
 wda87DmS98CLeld1eCe+1XRZPeSOypQMt7+/hqQ4rDTeGXShByE4wOMNOlJ4sIE9G0ql
 Wyh9UNTuzjEeGHOpfEZwMWShGB2Jw7sXRPnMciY/8YwkRFQYQY/rCkJHzoOLaiuV4vM/ +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dccdns5gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 08:42:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F0C8100034;
 Tue,  4 Jan 2022 08:42:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 571DD222C9F;
 Tue,  4 Jan 2022 08:42:54 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 4 Jan 2022 08:42:53
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 4 Jan 2022 08:42:48 +0100
Message-ID: <20220104074248.25015-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_03,2022-01-01_01,2021-12-02_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2] dm: Fix OF_BAD_ADDR definition
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

When OF_LIVE flag is enabled on a 64 bits platform, there is an
issue when dev_read_addr() is called and need to perform an address
translation using __of_translate_address().

In case of error, __of_translate_address() return's value is OF_BAD_ADDR
(wich is defined in include/dm/of.h to ((u64)-1) = 0xffffffffffffffff).
The return value of dev_read_addr() is often compared to FDT_ADDR_T_NONE
which is defined as (-1U) = 0xffffffff.
In this case the comparison is always false.

To fix this issue, define FDT_ADDR_T_NONE to (ulong)(-1) in case of
AARCH64. Update accordingly related tests.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
 - define FDT_ADDR_T_NONE as ((ulong)(-1)) and keep OF_BAD_ADDR unchanged

 include/fdtdec.h   | 5 ++++-
 test/dm/ofnode.c   | 2 +-
 test/dm/pci.c      | 4 ++--
 test/dm/test-fdt.c | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 6c7ab887b2..e9e2916d6e 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -24,16 +24,19 @@
 typedef phys_addr_t fdt_addr_t;
 typedef phys_size_t fdt_size_t;
 
-#define FDT_ADDR_T_NONE (-1U)
 #define FDT_SIZE_T_NONE (-1U)
 
 #ifdef CONFIG_PHYS_64BIT
+#define FDT_ADDR_T_NONE ((ulong)(-1))
+
 #define fdt_addr_to_cpu(reg) be64_to_cpu(reg)
 #define fdt_size_to_cpu(reg) be64_to_cpu(reg)
 #define cpu_to_fdt_addr(reg) cpu_to_be64(reg)
 #define cpu_to_fdt_size(reg) cpu_to_be64(reg)
 typedef fdt64_t fdt_val_t;
 #else
+#define FDT_ADDR_T_NONE (-1U)
+
 #define fdt_addr_to_cpu(reg) be32_to_cpu(reg)
 #define fdt_size_to_cpu(reg) be32_to_cpu(reg)
 #define cpu_to_fdt_addr(reg) cpu_to_be32(reg)
diff --git a/test/dm/ofnode.c b/test/dm/ofnode.c
index cea0746bb3..e6c925eba6 100644
--- a/test/dm/ofnode.c
+++ b/test/dm/ofnode.c
@@ -286,7 +286,7 @@ static int dm_test_ofnode_get_reg(struct unit_test_state *uts)
 	ut_assert(ofnode_valid(node));
 	addr = ofnode_get_addr(node);
 	size = ofnode_get_size(node);
-	ut_asserteq(FDT_ADDR_T_NONE, addr);
+	ut_asserteq_64(FDT_ADDR_T_NONE, addr);
 	ut_asserteq(FDT_SIZE_T_NONE, size);
 
 	node = ofnode_path("/translation-test@8000/noxlatebus@3,300/dev@42");
diff --git a/test/dm/pci.c b/test/dm/pci.c
index fa2e4a8559..00e4440a9d 100644
--- a/test/dm/pci.c
+++ b/test/dm/pci.c
@@ -331,10 +331,10 @@ static int dm_test_pci_addr_live(struct unit_test_state *uts)
 	struct udevice *swap1f, *swap1;
 
 	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1f, 0), &swap1f));
-	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
+	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1f));
 
 	ut_assertok(dm_pci_bus_find_bdf(PCI_BDF(0, 0x1, 0), &swap1));
-	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
+	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr_pci(swap1));
 
 	return 0;
 }
diff --git a/test/dm/test-fdt.c b/test/dm/test-fdt.c
index 8866d4d959..e1de066226 100644
--- a/test/dm/test-fdt.c
+++ b/test/dm/test-fdt.c
@@ -768,7 +768,7 @@ static int dm_test_fdt_livetree_writing(struct unit_test_state *uts)
 	/* Test setting generic properties */
 
 	/* Non-existent in DTB */
-	ut_asserteq(FDT_ADDR_T_NONE, dev_read_addr(dev));
+	ut_asserteq_64(FDT_ADDR_T_NONE, dev_read_addr(dev));
 	/* reg = 0x42, size = 0x100 */
 	ut_assertok(ofnode_write_prop(node, "reg", 8,
 				      "\x00\x00\x00\x42\x00\x00\x01\x00"));
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

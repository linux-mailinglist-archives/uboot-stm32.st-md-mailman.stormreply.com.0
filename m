Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E3219D3E8
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 11:39:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09C5CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Apr 2020 09:39:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73BCFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Apr 2020 09:39:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0339bHv8000971; Fri, 3 Apr 2020 11:39:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=51gTk8HaavDma8ibXMtlFZNZdOypH7ZJpAErOgqTb0w=;
 b=rJ2wGhg4JQCtnN4nWH3eX9n3TypHLZMYsSrYoT7bIU/5qJvE5wh2jd115NLMmE0guuFj
 rVh9ky4k9gMXUc5ks4lEJnuiMSp8RPxb71bjRHBHm4HVTVIPyR1Wvdoa6E7VB19YVzhi
 KLppD4nq5LJ1Pz79uR3pY1Jv3plH7iseLuU/41V0EzIKnMODsEVrXcnhEBzNm+CtoNcT
 UrfjjUno7eS7dvtBRbvOYIpD1tZQsJ/K0eTQJRnI9u7RzbCnVrE5LchK4jDJAnVVolwF
 AnoPHrCh04OtmQx011RC8gSyDQ0kxE+tpapyAN2XE9fqtfYfDi8RGj/16OI7BwBP0GWh pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y54afp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 11:39:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95AED100034;
 Fri,  3 Apr 2020 11:39:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 884EE2A4D71;
 Fri,  3 Apr 2020 11:39:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 3 Apr 2020 11:39:21 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 3 Apr 2020 11:39:18 +0200
Message-ID: <20200403113844.v2.1.If3d7baadb24504a63742fe82f963f481b030fafa@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_06:2020-04-02,
 2020-04-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2] dm: core: remove the duplicated function
	dm_ofnode_pre_reloc
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

The content dm_ofnode_pre_reloc() is identical with ofnode_pre_reloc()
defined in drivers/core/ofnode.c and used only three times:
- drivers/core/lists.c:lists_bind_fdt()
- drivers/clk/at91/pmc.c::at91_clk_sub_device_bind
- drivers/clk/altera/clk-arria10.c::socfpga_a10_clk_bind

So this function dm_ofnode_pre_reloc can be removed and replaced
by these function calls by ofnode_pre_reloc().

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
Hi Simon,

It is a rebased patch for http://patchwork.ozlabs.org/patch/1035799/
marked as superseded but never resent (and I forget it).

Compilation is OK on travis:
https://travis-ci.org/github/patrickdelaunay/u-boot/builds/670029232

Patrick


Changes in v2:
- rebase on master
- udpate dm_ofnode_pre_reloc call in at91_clk_sub_device_bind and
  socfpga_a10_clk_bind

 drivers/clk/altera/clk-arria10.c |  2 +-
 drivers/clk/at91/pmc.c           |  2 +-
 drivers/core/lists.c             |  2 +-
 drivers/core/util.c              | 28 ----------------------------
 include/dm/util.h                | 27 ---------------------------
 5 files changed, 3 insertions(+), 58 deletions(-)

diff --git a/drivers/clk/altera/clk-arria10.c b/drivers/clk/altera/clk-arria10.c
index affeb31fc2..0a9bf13ac4 100644
--- a/drivers/clk/altera/clk-arria10.c
+++ b/drivers/clk/altera/clk-arria10.c
@@ -258,7 +258,7 @@ static int socfpga_a10_clk_bind(struct udevice *dev)
 			continue;
 
 		if (pre_reloc_only &&
-		    !dm_ofnode_pre_reloc(offset_to_ofnode(offset)))
+		    !ofnode_pre_reloc(offset_to_ofnode(offset)))
 			continue;
 
 		ret = device_bind_driver_to_node(dev, "clk-a10", name,
diff --git a/drivers/clk/at91/pmc.c b/drivers/clk/at91/pmc.c
index 6b55ec59d6..f5808449a6 100644
--- a/drivers/clk/at91/pmc.c
+++ b/drivers/clk/at91/pmc.c
@@ -61,7 +61,7 @@ int at91_clk_sub_device_bind(struct udevice *dev, const char *drv_name)
 	     offset > 0;
 	     offset = fdt_next_subnode(fdt, offset)) {
 		if (pre_reloc_only &&
-		    !dm_ofnode_pre_reloc(offset_to_ofnode(offset)))
+		    !ofnode_pre_reloc(offset_to_ofnode(offset)))
 			continue;
 		/*
 		 * If this node has "compatible" property, this is not
diff --git a/drivers/core/lists.c b/drivers/core/lists.c
index 68204c303f..c7db14ed56 100644
--- a/drivers/core/lists.c
+++ b/drivers/core/lists.c
@@ -175,7 +175,7 @@ int lists_bind_fdt(struct udevice *parent, ofnode node, struct udevice **devp,
 			continue;
 
 		if (pre_reloc_only) {
-			if (!dm_ofnode_pre_reloc(node) &&
+			if (!ofnode_pre_reloc(node) &&
 			    !(entry->flags & DM_FLAG_PRE_RELOC)) {
 				log_debug("Skipping device pre-relocation\n");
 				return 0;
diff --git a/drivers/core/util.c b/drivers/core/util.c
index 69f83755f0..25b0d76f43 100644
--- a/drivers/core/util.c
+++ b/drivers/core/util.c
@@ -33,34 +33,6 @@ int list_count_items(struct list_head *head)
 	return count;
 }
 
-#if CONFIG_IS_ENABLED(OF_CONTROL) && !CONFIG_IS_ENABLED(OF_PLATDATA)
-bool dm_ofnode_pre_reloc(ofnode node)
-{
-#if defined(CONFIG_SPL_BUILD) || defined(CONFIG_TPL_BUILD)
-	/* for SPL and TPL the remaining nodes after the fdtgrep 1st pass
-	 * had property dm-pre-reloc or u-boot,dm-spl/tpl.
-	 * They are removed in final dtb (fdtgrep 2nd pass)
-	 */
-	return true;
-#else
-	if (ofnode_read_bool(node, "u-boot,dm-pre-reloc"))
-		return true;
-	if (ofnode_read_bool(node, "u-boot,dm-pre-proper"))
-		return true;
-
-	/*
-	 * In regular builds individual spl and tpl handling both
-	 * count as handled pre-relocation for later second init.
-	 */
-	if (ofnode_read_bool(node, "u-boot,dm-spl") ||
-	    ofnode_read_bool(node, "u-boot,dm-tpl"))
-		return true;
-
-	return false;
-#endif
-}
-#endif
-
 #if !CONFIG_IS_ENABLED(OF_PLATDATA)
 int pci_get_devfn(struct udevice *dev)
 {
diff --git a/include/dm/util.h b/include/dm/util.h
index 0ccb3fbadf..23f8deb14e 100644
--- a/include/dm/util.h
+++ b/include/dm/util.h
@@ -42,31 +42,4 @@ static inline void dm_dump_devres(void)
 /* Dump out a list of drivers */
 void dm_dump_drivers(void);
 
-/**
- * Check if an of node should be or was bound before relocation.
- *
- * Devicetree nodes can be marked as needed to be bound
- * in the loader stages via special devicetree properties.
- *
- * Before relocation this function can be used to check if nodes
- * are required in either SPL or TPL stages.
- *
- * After relocation and jumping into the real U-Boot binary
- * it is possible to determine if a node was bound in one of
- * SPL/TPL stages.
- *
- * There are 4 settings currently in use
- * - u-boot,dm-pre-proper: U-Boot proper pre-relocation only
- * - u-boot,dm-pre-reloc: legacy and indicates any of TPL or SPL
- *   Existing platforms only use it to indicate nodes needed in
- *   SPL. Should probably be replaced by u-boot,dm-spl for
- *   existing platforms.
- * - u-boot,dm-spl: SPL and U-Boot pre-relocation
- * - u-boot,dm-tpl: TPL and U-Boot pre-relocation
- * @node: of node
- *
- * Returns true if node is needed in SPL/TL, false otherwise.
- */
-bool dm_ofnode_pre_reloc(ofnode node);
-
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

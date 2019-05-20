Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6789236A9
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:00:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94E03C0D2B3
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 13:00:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFDE6C0D2B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 13:00:31 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KCf9ho021240; Mon, 20 May 2019 15:00:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=B8P8ZNSpY9157x3C5sTW5z/OwL69U/4xVr/HvKmxiac=;
 b=HvxFl+8Pjq+vlNcHUXOcUdSDTqHYwWH0R1pycCw9d4ufaHTtNcyqjUgTZhKP05ky1MKi
 kah/N1d3hBlFiAw8906ZvCb8m0+wK/jjaCLEC/QN0BsV+jaRmHCKwsYBqdK+syNGbk76
 aW2gZ7f/2j2rFIof6h6W2QqS33ihqTbbD2anJ/kt0Q/9Qa6cDJrbAo2OOH7QuTRG3SaX
 WygD5Zpa2K9ft/rnT4u/pd8PS/cTGsMYPLeioeki+4XKbNrG3XHvv/omJYZt8kWv4Jzo
 U38aa8tlAXCQ11KbNIwX9FIUscnEUgxrXfJ8HSAu/izYzUsQqDObrlujCRS0Mumc506+ Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7ttukw8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 15:00:24 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D02A38;
 Mon, 20 May 2019 13:00:24 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 052E328C2;
 Mon, 20 May 2019 13:00:24 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 15:00:23 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 15:00:23
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 15:00:07 +0200
Message-ID: <1558357207-7345-9-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_06:, , signatures=0
Cc: Tien Fong Chee <tien.fong.chee@intel.com>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Chris Packham <judge.packham@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 8/8] dm: doc: add documentation for
	pre-reloc properties in SPL and TPL
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

Add documentation for the pre-reloc property in SPL and TPL device-tree:
- u-boot,dm-pre-proper
- u-boot,dm-pre-reloc
- u-boot,dm-spl
- u-boot,dm-tpl

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- rebase on master

 doc/README.SPL              | 16 ++++++++++++++++
 doc/README.TPL              |  4 ++++
 doc/driver-model/README.txt |  4 ++++
 include/dm/ofnode.h         |  6 ++++--
 include/dm/util.h           |  6 ++++--
 5 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/doc/README.SPL b/doc/README.SPL
index 7a30fef..6eed83f 100644
--- a/doc/README.SPL
+++ b/doc/README.SPL
@@ -66,6 +66,22 @@ CONFIG_SPL_SPI_LOAD (drivers/mtd/spi/spi_spl_load.o)
 CONFIG_SPL_RAM_DEVICE (common/spl/spl.c)
 CONFIG_SPL_WATCHDOG_SUPPORT (drivers/watchdog/libwatchdog.o)
 
+Device tree
+-----------
+The U-Boot device tree is filtered by the fdtgrep tools during the build
+process to generate a much smaller device tree used in SPL (spl/u-boot-spl.dtb)
+with:
+- the mandatory nodes (/alias, /chosen, /config)
+- the nodes with one pre-relocation property:
+  'u-boot,dm-pre-reloc' or 'u-boot,dm-spl'
+
+ftgrep is also used to remove:
+- the properties defined in CONFIG_OF_SPL_REMOVE_PROPS
+- all the pre-relocation properties
+  ('u-boot,dm-pre-reloc', 'u-boot,dm-spl' and 'u-boot,dm-tpl')
+
+All the nodes remaining in the SPL devicetree are bound
+(see driver-model/README.txt).
 
 Debugging
 ---------
diff --git a/doc/README.TPL b/doc/README.TPL
index 980debe..c94129f 100644
--- a/doc/README.TPL
+++ b/doc/README.TPL
@@ -34,6 +34,10 @@ determine which SPL options to choose based on whether CONFIG_TPL_BUILD
 is set. Source files can be compiled for TPL with options choosed in the
 board config file.
 
+TPL use a small device tree (u-boot-tpl.dtb), containing only the nodes with
+the pre-relocation properties: 'u-boot,dm-pre-reloc' and 'u-boot,dm-tpl'
+(see README.SPL for details).
+
 For example:
 
 spl/Makefile:
diff --git a/doc/driver-model/README.txt b/doc/driver-model/README.txt
index 07b120d..532a771 100644
--- a/doc/driver-model/README.txt
+++ b/doc/driver-model/README.txt
@@ -849,6 +849,10 @@ in the device tree node. For U-Boot proper you can use 'u-boot,dm-pre-proper'
 which means that it will be processed (and a driver bound) in U-Boot proper
 prior to relocation, but will not be available in SPL or TPL.
 
+To reduce the size of SPL and TPL, only the nodes with pre-relocation properties
+('u-boot,dm-pre-reloc', 'u-boot,dm-spl' or 'u-boot,dm-tpl') are keept in their
+device trees (see README.SPL for details); the remaining nodes are always bound.
+
 Then post relocation we throw that away and re-init driver model again.
 For drivers which require some sort of continuity between pre- and
 post-relocation devices, we can provide access to the pre-relocation
diff --git a/include/dm/ofnode.h b/include/dm/ofnode.h
index d206ee2..b45da5e 100644
--- a/include/dm/ofnode.h
+++ b/include/dm/ofnode.h
@@ -662,12 +662,14 @@ int ofnode_read_simple_size_cells(ofnode node);
  * After relocation and jumping into the real U-Boot binary it is possible to
  * determine if a node was bound in one of SPL/TPL stages.
  *
- * There are 3 settings currently in use
- * -
+ * There are 4 settings currently in use
+ * - u-boot,dm-pre-proper: U-Boot proper pre-relocation only
  * - u-boot,dm-pre-reloc: legacy and indicates any of TPL or SPL
  *   Existing platforms only use it to indicate nodes needed in
  *   SPL. Should probably be replaced by u-boot,dm-spl for
  *   new platforms.
+ * - u-boot,dm-spl: SPL and U-Boot pre-relocation
+ * - u-boot,dm-tpl: TPL and U-Boot pre-relocation
  *
  * @node: node to check
  * @return true if node is needed in SPL/TL, false otherwise
diff --git a/include/dm/util.h b/include/dm/util.h
index 60d3b93..348c2ac 100644
--- a/include/dm/util.h
+++ b/include/dm/util.h
@@ -52,12 +52,14 @@ static inline void dm_dump_devres(void)
  * it is possible to determine if a node was bound in one of
  * SPL/TPL stages.
  *
- * There are 3 settings currently in use
- * -
+ * There are 4 settings currently in use
+ * - u-boot,dm-pre-proper: U-Boot proper pre-relocation only
  * - u-boot,dm-pre-reloc: legacy and indicates any of TPL or SPL
  *   Existing platforms only use it to indicate nodes needed in
  *   SPL. Should probably be replaced by u-boot,dm-spl for
  *   existing platforms.
+ * - u-boot,dm-spl: SPL and U-Boot pre-relocation
+ * - u-boot,dm-tpl: TPL and U-Boot pre-relocation
  * @node: of node
  *
  * Returns true if node is needed in SPL/TL, false otherwise.
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

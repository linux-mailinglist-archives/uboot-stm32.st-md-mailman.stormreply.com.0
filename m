Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 015842567C
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 19:19:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5483C35E15
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 May 2019 17:19:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8B4DC35E0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 17:19:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4LHHf3F023014; Tue, 21 May 2019 19:19:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=xdW3mP4BQI4TcJO0T5IFPJX79AdMuh7JmrFnKlWlNzA=;
 b=ntaSIgdvTON9yFWxrR4klwzqm1ELjqU6dzLOQxD4bQiu0Qf61B0tPClqf3VikgnCsvMD
 +8Po5t4qjqtDI2n/gzKqr6GwsMYH2kxISleEd4sqT/xdha2dhZZ8s6IlNgrTjVDl+NOv
 kad0yWyKOyzaH/JTAQ2FyxjJQ1L6MHMaJp/UOdSiyQokFYoZsVZ4Qw2t9SYvt28VU+ID
 PAeuoHXw1Q2Sjvde2I0EiUuUFLbLAByOnUZDQXfVARLWUK9t7aEbnzR3k3sut3fwps4z
 lwZzDppDSkHGq4xBU2MlUT3tECEL/qaCXUlOwgpcQL4iML1aCp1N9k2y/ENZHoazLbU2 Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj8xgaxxj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 19:19:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E5FE31;
 Tue, 21 May 2019 17:19:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 331A44F13;
 Tue, 21 May 2019 17:19:31 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May
 2019 19:19:31 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 21 May 2019 19:19:30
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 May 2019 19:19:13 +0200
Message-ID: <1558459153-14104-4-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
References: <1558459153-14104-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_04:, , signatures=0
Cc: Tien Fong Chee <tien.fong.chee@intel.com>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Chris Packham <judge.packham@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 3/3] dm: doc: add documentation for
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

Changes in v3:
- rebase on u-boot-dm/sandbox-working

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

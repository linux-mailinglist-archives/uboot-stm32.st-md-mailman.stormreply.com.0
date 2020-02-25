Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80816ED62
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 19:00:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A44EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Feb 2020 18:00:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98020C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 18:00:24 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01PHihOG009316; Tue, 25 Feb 2020 19:00:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ddutcietC0DjuNwkAKAyAIURcwPks9oSyp3qvlhXZeM=;
 b=ecKItW3uojY2STmxmg7HSTEInTxGDgewtr/EC5y+7vK7Y9+qDUOoMu/EC2fpdvzzGOFi
 Kv/hoeujcWp6jhhl6KZSNmjUfoivouzF+Jw0n0geFyWxrWMnk30dgOaP98J2I91NuV5h
 utP2R6K7rMThXSBI+FJjF/WIerbcYR/iZ5OjdXEUiuMQ5VjFBfY7tUcvd2pmaVmb6Azl
 MzDU3n4NtvMfTOQSu973gaqlA/owgxTG/7W2XBbDkLjQkXWhpfcbGFNm9+UPvxX6ebQz
 PZRatynHd4Uub+kPJ92WRp9pWTjMhGuP1ku3OPTn6PVK4bI+gBXLtfQ70eSVJ/S5Q2zt rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yatn617wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2020 19:00:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91CA610002A;
 Tue, 25 Feb 2020 19:00:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83FD32BE22D;
 Tue, 25 Feb 2020 19:00:13 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 25 Feb 2020 19:00:13 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 25 Feb 2020 19:00:11 +0100
Message-ID: <20200225180011.8129-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_06:2020-02-25,
 2020-02-25 signatures=0
Cc: Breno Matheus Lima <breno.lima@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] doc: Makefile: remove target refcheckdocs
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

Remove the target refcheckdocs, based on the missing script
scripts/documentation-file-ref-check.

This script exists in Linux tree but wasn't imported when 'doc' move
to SPHINX in commit 78a88f7930be ("doc: Replace DocBook with
sphinx-based docs")

This patch avoids the error:

make refcheckdocs
/bin/sh: scripts/documentation-file-ref-check: No such file or directory
doc/Makefile:102: recipe for target 'refcheckdocs' failed
make[1]: *** [refcheckdocs] Error 127
Makefile:2094: recipe for target 'refcheckdocs' failed
make: *** [refcheckdocs] Error 2

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/doc/Makefile b/doc/Makefile
index 0e0da5666f..2ef0be7c9b 100644
--- a/doc/Makefile
+++ b/doc/Makefile
@@ -98,9 +98,6 @@ endif # HAVE_SPHINX
 # The following targets are independent of HAVE_SPHINX, and the rules should
 # work or silently pass without Sphinx.
 
-refcheckdocs:
-	$(Q)cd $(srctree);scripts/documentation-file-ref-check
-
 cleandocs:
 	$(Q)rm -rf $(BUILDDIR)
 	$(Q)$(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=doc/media clean
@@ -113,7 +110,6 @@ dochelp:
 	@echo  '  epubdocs        - EPUB'
 	@echo  '  xmldocs         - XML'
 	@echo  '  linkcheckdocs   - check for broken external links (will connect to external hosts)'
-	@echo  '  refcheckdocs    - check for references to non-existing files under Documentation'
 	@echo  '  cleandocs       - clean all generated files'
 	@echo
 	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

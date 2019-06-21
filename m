Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7314E912
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 091B3CA0294
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6014DCA028D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRMTC007017; Fri, 21 Jun 2019 15:27:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TcpRToeSt1AqvVwICbpgsV8yDF/DvFS72JgSIPj6w/c=;
 b=Imjn7r2S6jNLKKLPcISoi9gBokr7+6AzOt6nXGjT91gYoh1uf5XQRJMbsyr4NOu9SVAJ
 pfHpOZJvwZduSfRxDP0crFJJ/lAKrV7EaH9QdUqAHMsu7eOghFpi5yd18w6mTuHAbXxJ
 ntjClwaZOYYL/bXDNWomEmoyUq0PE+ujHdFclW636/YRqwHxF7OxkJFjT3KIh7lDBvtf
 3TZqAE9tMmeJejOkg85EGLdbOhWzePR6XMuY6uN7FzqtYdXzx+mR2+OWQSf0GNqL9VPx
 lTVz3ZTFBJJQmeJQdBImvcAIaxMyh+oFviFIxxRzk5815ZOuYY/LuzlbVB71nXUizgFr PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxss9jy-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD44784;
 Fri, 21 Jun 2019 13:27:15 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 97B1B2A50;
 Fri, 21 Jun 2019 13:27:15 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:15 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:15
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:50 +0200
Message-ID: <1561123618-2029-12-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 12/20] misc: stm32_fuse: Fix warnings when
	compiling with W=1
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

This patch solves the following warnings:

warning: no previous prototype for 'fuse_read' [-Wmissing-prototypes]
 int fuse_read(u32 bank, u32 word, u32 *val)
     ^~~~~~~~~
  CC      cmd/sf.o
warning: no previous prototype for 'fuse_prog' [-Wmissing-prototypes]
 int fuse_prog(u32 bank, u32 word, u32 val)
     ^~~~~~~~~
warning: no previous prototype for 'fuse_sense' [-Wmissing-prototypes]
 int fuse_sense(u32 bank, u32 word, u32 *val)
     ^~~~~~~~~~
warning: no previous prototype for 'fuse_override' [-Wmissing-prototypes]
 int fuse_override(u32 bank, u32 word, u32 val)
     ^~~~~~~~~~~~~

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/misc/stm32mp_fuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/stm32mp_fuse.c b/drivers/misc/stm32mp_fuse.c
index 8dc246b..801d946 100644
--- a/drivers/misc/stm32mp_fuse.c
+++ b/drivers/misc/stm32mp_fuse.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <command.h>
+#include <fuse.h>
 #include <misc.h>
 #include <errno.h>
 #include <dm/device.h>
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

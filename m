Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFBF333884
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:16:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D4B1C57B53;
	Wed, 10 Mar 2021 09:16:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D9E6C57195
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:16:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9D8H8003479; Wed, 10 Mar 2021 10:16:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=qsGdZpLkimc7giaygorkR0eWKiL+ch+rFi5FhMkhhZA=;
 b=J7G41hnc4HC2U+GSk9EsPj6G2cZps8nlwQeXSyXnaOnKMH+xT9ap2cKxHKqLb7j6AQ5A
 /C8sJ7ZKmaKS1B8Ajx+XxMp2FX/KFglUF9ECDgsxWTDvePZJ7sAMAf7BKqr/MBcWyyXE
 B3IfBiiFa5tMnLwE7dkz+wgvxF0CJqIaBMo4Cq3SPpIPSrCt0ZO9r2tC+YJfYer3c10R
 ls+8d0evYL5chpQIKcT0opCT3z+FOSJbHLDPppQ+PSn4bnD7qa3Mo895tSZ5314c8Ydp
 utpqxPEuV0B265Xf582OndRoKAqEasKe6FVwvqit9iVbJogb5BolP8jN5D/6+oeslj0O Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gpq1pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A316100038;
 Wed, 10 Mar 2021 10:16:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC5B9228D9D;
 Wed, 10 Mar 2021 10:16:42 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:42
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:27 +0100
Message-ID: <20210310101622.v2.3.I610bbc969f02fce04b772ee13cec3c26634abdc2@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Stefan Roese <sr@denx.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Bin Meng <bmeng.cn@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2 3/8] lmb: add a max parameter in the struct
	lmb_region
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

Add a max parameter in lmb_region struct to handle test
in lmb_add_region without using the MAX_LMB_REGIONS
define.

This patch allows to modify these size independently for
memory of reserved regions in the next patches.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- add a max parameter extracted from v1 [3/5]

 include/lmb.h | 1 +
 lib/lmb.c     | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/lmb.h b/include/lmb.h
index a3247544c1..f3397c7f73 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -21,6 +21,7 @@ struct lmb_property {
 
 struct lmb_region {
 	unsigned long cnt;
+	unsigned long max;
 	struct lmb_property region[MAX_LMB_REGIONS+1];
 };
 
diff --git a/lib/lmb.c b/lib/lmb.c
index 5cf419f439..a926198d48 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -95,6 +95,9 @@ static void lmb_coalesce_regions(struct lmb_region *rgn, unsigned long r1,
 
 void lmb_init(struct lmb *lmb)
 {
+	lmb->memory.max = MAX_LMB_REGIONS;
+	lmb->reserved.max = MAX_LMB_REGIONS;
+
 	lmb->memory.cnt = 0;
 	lmb->reserved.cnt = 0;
 }
@@ -179,7 +182,7 @@ static long lmb_add_region(struct lmb_region *rgn, phys_addr_t base, phys_size_t
 
 	if (coalesced)
 		return coalesced;
-	if (rgn->cnt >= MAX_LMB_REGIONS)
+	if (rgn->cnt >= rgn->max)
 		return -1;
 
 	/* Couldn't coalesce the LMB, so add it to the sorted table. */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

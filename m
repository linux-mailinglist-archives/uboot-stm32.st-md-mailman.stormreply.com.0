Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BEF6C535D
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Mar 2023 19:12:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91CFFC6A5E7;
	Wed, 22 Mar 2023 18:12:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64DD3C01E98
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 18:12:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MFM5AS002546; Wed, 22 Mar 2023 19:12:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=2qTXIabPXSfbfZzfJ17yi8tc32jcGQ+7wyMI9LQ8nQI=;
 b=bJRg3i8g9wWzNBhB0Zzz+mRzJMX42KC0PX59Uy0bYkXDxIpjhfEAYj7epTN7GtcGWB1o
 f7yhNIBrE6lg8+6r7T9WihY3k6qZRzyNoExqGvJ8/lHZ+FpjUAgd7Yy7vIXbbqGLG61w
 6sWsPlNi8kWX14jHFid9MKe89ySCxQqAV/8gVvKC0h+KiaEj+NIJasmG4pmoE5tvGgqL
 oken/qps0ZKiLAB2xsLG7JReGC6bfecp+UiENdRJJZ0JYsdjheJmhZYVncjr/SAIuLYS
 SX1BOl/2C/iKlff4ocfYtebaRWPD0IvdErPfeObCrhb7cqmG8LpB3twOtJp/yGObjf6i vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pfwctv72y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 19:12:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AA7610004A;
 Wed, 22 Mar 2023 19:12:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A9EA21BF78;
 Wed, 22 Mar 2023 19:12:34 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 22 Mar
 2023 19:12:34 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Mar 2023 19:12:26 +0100
Message-ID: <20230322191223.v2.2.I79b07546f01e96623c310b0a68382edadfacec31@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322191223.v2.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
References: <20230322191223.v2.1.I2a3a1c4e853d66857091cbef8d3a2ec87d65daba@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_15,2023-03-22_01,2023-02-09_01
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mark Millard <marklmi@yahoo.com>, Sjoerd Simons <sjoerd@collabora.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH v2 2/2] lmb: add max number of region in
	lmb_dump_region() output
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

Add the max number of region in lmb dump; this patch allows to
check the limit for usage of the LMB regions, memory or reserved.

Result on STM32MP157C-DK2:

STM32MP> bdinfo
.....
lmb_dump_all:
 memory.cnt = 0x1 / max = 0x2
 memory[0]	[0xc0000000-0xdfffffff], 0x20000000 bytes flags: 0
 reserved.cnt = 0x6 / max = 0x10
 reserved[0]	[0x10000000-0x10045fff], 0x00046000 bytes flags: 4
 reserved[1]	[0x30000000-0x3003ffff], 0x00040000 bytes flags: 4
 reserved[2]	[0x38000000-0x3800ffff], 0x00010000 bytes flags: 4
 reserved[3]	[0xd4000000-0xd7ffffff], 0x04000000 bytes flags: 4
 reserved[4]	[0xdcae5000-0xdfffffff], 0x0351b000 bytes flags: 0
 reserved[5]	[0xddafb5b8-0xdfffffff], 0x02504a48 bytes flags: 0
....

Reported-by: Mark Millard <marklmi@yahoo.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 lib/lmb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/lmb.c b/lib/lmb.c
index 8fbe453dfa9d..b2c233edb64e 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -27,7 +27,7 @@ static void lmb_dump_region(struct lmb_region *rgn, char *name)
 	enum lmb_flags flags;
 	int i;
 
-	printf(" %s.cnt  = 0x%lx\n", name, rgn->cnt);
+	printf(" %s.cnt = 0x%lx / max = 0x%lx\n", name, rgn->cnt, rgn->max);
 
 	for (i = 0; i < rgn->cnt; i++) {
 		base = rgn->region[i].base;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

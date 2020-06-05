Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBE1EF1F2
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jun 2020 09:22:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78363C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jun 2020 07:22:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0909C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 07:22:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0557MAB6028595; Fri, 5 Jun 2020 09:22:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=RhCQ+gkdsPVU2bQNUTe+KzwHvrFDCz4DOSYUj3v/O58=;
 b=aGTrHXV9O+4rAr8hiF3+BnzVBtIDMRNqFV3ai5WQADbZzQV+ZQv5I90Lj7L3IbdJUQIS
 orpbWA3kulZ3/SS+fl+IADpPbTyB70brA9k+psb1UiwOrlzhGOsdMhxw+UDrGAwLFX+9
 hk+DKi9tDVHoSNn8NUQB4z2TeeKrz60AJfkAXzkdyqmWDTEzF6Qimb0WX4A/uzomLMai
 aDFeJGdXs5Z1QURD7s4qpgOLAn0pEGJGIO+yWm5hIPCgyk2eWBt042g9LH7gKQ26pw+R
 4/rWs83rqBsdZs+Sty1RFD5Srx7otbTiM7jt6Btw4gk/4BXKvYBiCg0hjRRrblVd7Zd7 EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31fasesq2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jun 2020 09:22:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF4E1100034;
 Fri,  5 Jun 2020 09:22:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4E252AB5B6;
 Fri,  5 Jun 2020 09:22:32 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 5 Jun 2020 09:22:32 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jun 2020 09:22:11 +0200
Message-ID: <20200605092205.1.Ibab98d647c5748ec387b62823fa04035ac0afd74@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-05_01:2020-06-04,
 2020-06-05 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] optee: fix copy of optee reserved-memory node
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

From: Etienne Carriere <etienne.carriere@linaro.org>

Fix the loop that parses FDT for a reserved memory node named "optee".

Before this change, if at least one subnode was found in the
reserved-memory node, the function endlessly looped since instruction
continue returned back in the loop without updating variable subnode.
This change fixes the issue by using a for loop.

Fixes: 6ccb05eae01b ("image: fdt: copy possible optee nodes to a loaded devicetree")
Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 lib/optee/optee.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/optee/optee.c b/lib/optee/optee.c
index e59b5766e7..457d4cca8a 100644
--- a/lib/optee/optee.c
+++ b/lib/optee/optee.c
@@ -156,8 +156,9 @@ int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
 	/* optee inserts its memory regions as reserved-memory nodes */
 	nodeoffset = fdt_subnode_offset(old_blob, 0, "reserved-memory");
 	if (nodeoffset >= 0) {
-		subnode = fdt_first_subnode(old_blob, nodeoffset);
-		while (subnode >= 0) {
+		for (subnode = fdt_first_subnode(old_blob, nodeoffset);
+		     subnode >= 0;
+		     subnode = fdt_next_subnode(old_blob, subnode)) {
 			const char *name = fdt_get_name(old_blob,
 							subnode, NULL);
 			if (!name)
@@ -197,8 +198,6 @@ int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
 				if (ret < 0)
 					return ret;
 			}
-
-			subnode = fdt_next_subnode(old_blob, subnode);
 		}
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

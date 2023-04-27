Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 892496F06C1
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Apr 2023 15:37:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F306C6907C;
	Thu, 27 Apr 2023 13:37:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F31C4C6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:37:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RArX2p023735; Thu, 27 Apr 2023 15:37:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ci1MIMBh3AeUKQIPlos+pDXY9QBHxNp+g6QJ14J6038=;
 b=jD3OCsg1GQ5qu7Z7ezDAWQk/weF+RjGnj3mP1+ZjA7GtOlT5PUeIuNe90sGVjIPPJnQc
 74Fpg2UkxIvxhRHRvLGzaJOkERmBjN47idptE18F2BCeDpj1JgEv1+2f+8zRk0mpZmEu
 QBaVeCbbA4zTTINXnvKfzvsd4YlpusRAhfPnHnO1B00J6tlLHuUNzLEo7qk1mU0oIXy8
 +gDeRY1+jODoxi7iiBS0gDL8Vbbcb3yBehUd3liEINWlI5KAqFE4ghr02nh3wrQn7iAl
 UL/nFhjN6hE1h+Nxtz8nTbTbmJjKmQtDfGYcsNLku3mt8pMVvYzjwALGQiOSjbGeQZaV Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q5t4vywkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 15:37:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0963610002A;
 Thu, 27 Apr 2023 15:37:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03A322291A3;
 Thu, 27 Apr 2023 15:37:53 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Apr
 2023 15:37:52 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Apr 2023 15:36:38 +0200
Message-ID: <20230427153632.6.I332950b93da113030cd4c2f00a727b2f2c79602d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_07,2023-04-27_01,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 6/6] pmic: stpmic1: support new prefix node
	name for regulator
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

The '_' character is discouraged in the node name, this patch adds the
new prefix of regulator subnode, with the '-' character, in STM32MP1 driver
to support the new  naming rule in Linux kernel device trees.

It is a preliminary patch before Linux device tree synchronization
for STMicroelectronics boards.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/power/pmic/stpmic1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/pmic/stpmic1.c b/drivers/power/pmic/stpmic1.c
index 2c85410b1bf5..8701d4f971c9 100644
--- a/drivers/power/pmic/stpmic1.c
+++ b/drivers/power/pmic/stpmic1.c
@@ -34,7 +34,9 @@ static const struct pmic_child_info stpmic1_children_info[] = {
 	{ .prefix = "ldo", .driver = "stpmic1_ldo" },
 	{ .prefix = "buck", .driver = "stpmic1_buck" },
 	{ .prefix = "vref_ddr", .driver = "stpmic1_vref_ddr" },
+	{ .prefix = "vref-ddr", .driver = "stpmic1_vref_ddr" },
 	{ .prefix = "pwr_sw", .driver = "stpmic1_pwr_sw" },
+	{ .prefix = "pwr-sw", .driver = "stpmic1_pwr_sw" },
 	{ .prefix = "boost", .driver = "stpmic1_boost" },
 	{ },
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

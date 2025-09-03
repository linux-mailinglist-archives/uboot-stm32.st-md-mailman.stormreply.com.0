Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 101DBB41EE7
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Sep 2025 14:26:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE867C3FACD;
	Wed,  3 Sep 2025 12:26:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F03D9C3FAC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 12:26:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BVFLS008803;
 Wed, 3 Sep 2025 14:26:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PXery0EkTwFhsgyc45KbvKfY3Gic9n6DQJsNgo85PBY=; b=oYmwxLSVPU6AhtYu
 ZFDQBVqXQhRqQ5WeL6lVUfLfe2Af9xNmB6oytEYQwVgRQC1FducTjEYFWMgabHWH
 ZB2vLUz0z4Y/CDMh0rfAmI9JgU6qMsIg2omVvUCm+jb2oE4IiW2DMFxVi/vjrKWg
 uIGcxaH8mmDf4RY9Fq2HLFTBWhyc8WNbm1ihvPNVcZm6y2taYgwcgJi/DvRyjA0k
 bzVldh7sU5sB7iG/kqj4NQNzfvHoiD1dXb0B2/2bch95ZaOwL9jW8qAdiMqM7b5S
 wR8Cn/xu/x9r9s93+xeZwZmSDKNWU4yNcvZitFtGmf+HMngluIdr1It5Zj3nL2T8
 U7Wuxw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48urmxgyfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 14:26:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BD49740046;
 Wed,  3 Sep 2025 14:25:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2D7539C6EA;
 Wed,  3 Sep 2025 14:25:39 +0200 (CEST)
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 14:25:39 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Wed, 3 Sep 2025 14:25:35 +0200
MIME-Version: 1.0
Message-ID: <20250903-master-v2-1-5cdf73bff42c@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
In-Reply-To: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
To: Tom Rini <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH v2 1/7] ofnode: support panel-timings in
 ofnode_decode_display_timing
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

The "Display Timings" in panel-common.yaml can be provided by 2 properties
- panel-timing: when display panels are restricted to a single resolution
                the "panel-timing" node expresses the required timings.
- display-timings: several resolutions with different timings are supported
                   with several timing subnode of "display-timings" node

This patch update the parsing function to handle this 2 possibility
when index = 0.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/core/ofnode.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
index e040e3f2806ffe74c58dcd82f36307351acd5a99..5a721b46e5a3214e7bd437739776362c2d22a3c9 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -1221,13 +1221,16 @@ int ofnode_decode_display_timing(ofnode parent, int index,
 	int ret = 0;
 
 	timings = ofnode_find_subnode(parent, "display-timings");
-	if (!ofnode_valid(timings))
-		return -EINVAL;
-
-	i = 0;
-	ofnode_for_each_subnode(node, timings) {
-		if (i++ == index)
-			break;
+	if (ofnode_valid(timings)) {
+		i = 0;
+		ofnode_for_each_subnode(node, timings) {
+			if (i++ == index)
+				break;
+		}
+	} else {
+		if (index != 0)
+			return -EINVAL;
+		node = ofnode_find_subnode(parent, "panel-timing");
 	}
 
 	if (!ofnode_valid(node))

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

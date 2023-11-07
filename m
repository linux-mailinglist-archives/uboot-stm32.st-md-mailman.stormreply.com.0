Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D87E3756
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Nov 2023 10:18:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E9EEC6B463;
	Tue,  7 Nov 2023 09:18:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92DEAC6B461
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Nov 2023 09:18:09 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3A76Trwm015372; Tue, 7 Nov 2023 10:18:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=AJzC+RB
 O44UsP5TDwImSqbDVdacR0OJ+YEgVNDrOfeg=; b=1WV/D5LANZMWYlf/FY82Voh
 3CnPsazWRqVv/KLdH6cbsoSwyHG1Ap3L83yOtZm4dSg4+E8QkCPANneAUyYoIiEs
 P6sao7g/aCMupx8apyZx0yGGLhCWhM0VMc5ctkOE3X8riHnhcPeueHd5tqpagn1L
 NX4Zafm0HSTvkyRQ9yAdIzpDt3ccrHqEfnK/fO+s2g/VGD2JzyafdfRWL/+eReju
 uEXpcDY7obHKWLY3JtEyd4LivdSMSKm9smUKux6ual8q0ngP33+SOjV8HsUMJ/IW
 BodgxdASmIAcYP1XITuc3uZa+RNLmqH1DdneQemwEdGWbmlrvtS3gBAq5obH5gA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u5eq2jxhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Nov 2023 10:18:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AAE1E10002A;
 Tue,  7 Nov 2023 10:17:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18D53216821;
 Tue,  7 Nov 2023 10:17:58 +0100 (CET)
Received: from localhost (10.201.22.165) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 7 Nov
 2023 10:17:57 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 7 Nov 2023 10:17:40 +0100
Message-ID: <20231107101729.1.I843fdbc83d3f8522e4c43d47c72825b388643ac6@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>, deffo@gmx.de
Subject: [Uboot-stm32] [PATCH] bootstage: Correct exhasuted typo
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

From: Simon Glass <sjg@chromium.org>

Correct this typo in the warning message shown when no more bootstage
records can be added.

Signed-off-by: Simon Glass <sjg@chromium.org>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
I just cherry-pick the Simon's patch in the branch fix-bs-working
of the dm custodian git but it is not yet present in patchwork.

https://source.denx.de/u-boot/custodians/u-boot-dm/-/commit/8810b8dd3d233978c15203b23420fa819ab1e791

Regards

Patrick

 common/bootstage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/bootstage.c b/common/bootstage.c
index a68d883c684c..0e6d80718fd5 100644
--- a/common/bootstage.c
+++ b/common/bootstage.c
@@ -137,7 +137,7 @@ ulong bootstage_add_record(enum bootstage_id id, const char *name,
 			rec->flags = flags;
 			rec->id = id;
 		} else {
-			log_warning("Bootstage space exhasuted\n");
+			log_warning("Bootstage space exhausted\n");
 		}
 	}
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

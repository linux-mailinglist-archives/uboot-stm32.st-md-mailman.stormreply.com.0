Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429264CD63
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Dec 2022 16:51:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD792C6411C;
	Wed, 14 Dec 2022 15:51:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E2E7C65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 15:51:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEBD0hQ006433; Wed, 14 Dec 2022 16:51:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=r1siWEHDX5Sl4dfTE5C2xKKevtevZB3JYjj8UmCf2yk=;
 b=wWVjdmLrIeJwBl2OE01fRIAE7jK4dxA3vZ2RnZK12K6z/cbkbROXVQFoEUo+29c8A0x/
 aG78r5icMkn2n0Cv81XbTOuNmUVC3e//8f1CMH8QHhZczExwRyMVwJhBkm2cWC20HD4J
 Qhgev5BR+7cr95tclCLQfbp2xi34OWwu1kC7srpJX1Npn8p6LPxYwstCe3FRaMWTAjmG
 dF0oT1Ne6Nz+xq4R5Afqeq3ex1N9vvL2yZ0hakyQuQg4EzXUCkk/l2+06tQX/8BA0TNW
 FuzchOiHqC4Hp9OefSc56ff9gZEvUnoFp04ZJxlZt2SGy3XYQFxH5nizJdpUp9ECFMqM 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6us4c8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 16:51:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59C90100034;
 Wed, 14 Dec 2022 16:51:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 527D122F7DC;
 Wed, 14 Dec 2022 16:51:45 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 14 Dec
 2022 16:51:42 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Dec 2022 16:51:32 +0100
Message-ID: <20221214165126.2.I10631f84f71a23c2c3c6ede7299743000ce82ccd@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
References: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_07,2022-12-14_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] env: add failing trace in env_erase
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

Add trace in env save to indicate any errors to end user and avoid
silent output when the command 'env erase' is not executed as it is
done in env_save with commit 8968288cb477 ("env: add failing trace in
env_save")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/env.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/env/env.c b/env/env.c
index 69848fb06080..06078c7f3744 100644
--- a/env/env.c
+++ b/env/env.c
@@ -311,11 +311,15 @@ int env_erase(void)
 	if (drv) {
 		int ret;
 
-		if (!drv->erase)
+		if (!drv->erase) {
+			printf("not possible\n");
 			return -ENODEV;
+		}
 
-		if (!env_has_inited(drv->location))
+		if (!env_has_inited(drv->location)) {
+			printf("not initialized\n");
 			return -ENODEV;
+		}
 
 		printf("Erasing Environment on %s... ", drv->name);
 		ret = drv->erase();
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

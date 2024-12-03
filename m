Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F299E18E5
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 11:10:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF663C6C83D;
	Tue,  3 Dec 2024 10:10:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C09EC5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 10:10:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37eLis023399;
 Tue, 3 Dec 2024 11:10:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VgsGTq4f8/AZSroMeDtF1lp7HfSG253czErrSYy2/hI=; b=eXHpse6O4z0RAPnC
 UQ0zuNQMQGi4hu3QEtnmP7sKEGZYuZrDrN3oCpjItpCUcIQs7gqvcYV++agCUbqF
 7asJP/DdX78Cz/18nSW6SB1JUrPqaprG+SgzA5FLqfL8GfWQz1HITiJLGZa6k8jC
 HEE+k90gc1eTGgTDdVcJFSnqKXdcrikFNXPp3fmyhOw8ZfF9hAPE3EY2czg5JGTR
 rFrmc2QEVVv1i6A2uxV/hgmU6NT+xQ0602N4cKcZStbL6IY50s2E4OQVRLlRfNNM
 pUCyl+L7G96XPfB89a03Ea9iGj+cl+TKJpGgxskzAYvRP415zlCFFtn1Qhx0LerK
 cDs9Rw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 437tfgc807-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 11:10:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2E7CB4005E;
 Tue,  3 Dec 2024 11:09:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7B04267CB3;
 Tue,  3 Dec 2024 11:06:14 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 3 Dec
 2024 11:06:14 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Dec 2024 11:06:11 +0100
Message-ID: <20241203100611.354468-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203100611.354468-1-patrice.chotard@foss.st.com>
References: <20241203100611.354468-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jonas Karlman <jonas@kwiboo.se>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 2/2] power: regulator: replace dev_dbg() by
	dev_err() in regulator_post_bind()
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

To ease debugging, use dev_err() instead of dev_dbg() for
alerting when regulator has nonunique value.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
  - split initial patch into 2 commits to separate dev_dbg() and
    dev_err() migration.

 drivers/power/regulator/regulator-uclass.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index 80ea5e65d48..09567eb9dbb 100644
--- a/drivers/power/regulator/regulator-uclass.c
+++ b/drivers/power/regulator/regulator-uclass.c
@@ -446,7 +446,7 @@ static int regulator_post_bind(struct udevice *dev)
 	}
 
 	if (!regulator_name_is_unique(dev, uc_pdata->name)) {
-		dev_dbg(dev, "'%s' has nonunique value: '%s\n",
+		dev_err(dev, "'%s' has nonunique value: '%s\n",
 			property, uc_pdata->name);
 		return -EINVAL;
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

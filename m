Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDF2F1744
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Jan 2021 15:03:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12636C56635;
	Mon, 11 Jan 2021 14:03:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEA98C5660F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 14:03:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10BE2UaC014195; Mon, 11 Jan 2021 15:03:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=DA+bQiRMaZ70dQaY/kAvcdenlxyQKAv3HvDT/aPF33o=;
 b=qO6iD6to7jmXNkW0aFXrQ4u8ZPP3F9HK0yxqeRw8jyhinzewDpreZpRqVwdiaDviqhJc
 7paiCF6XHj6nFMA6PgKTBz5WaTj2cMIdJ3rC+GlA0xMyYdSjaDWd9nFtb359T+zU7ukG
 6bL54kBIMgbz5bcP3q4y+uQJudEyB285/g8rpzB+Cos4kSUuEGESn7zRQRKp1vl/AXaa
 eP5j+MGHdCw4xptTMsyy8+MFVKv9+IUbdCEFT1HpXQ18J/k2YDacypvTeeJeLVaOsvXQ
 SnoRbxXePxdERMyeGl7aXqRnEuWqymuJMa8Si5bnM7Lpv0K3OtIk5zgauaqLXMyBZsgV 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3xf5jc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 15:03:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5640010002A;
 Mon, 11 Jan 2021 15:03:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4850B2B4D28;
 Mon, 11 Jan 2021 15:03:55 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Jan 2021 15:03:54
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Jan 2021 15:03:47 +0100
Message-ID: <20210111140347.5754-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111140347.5754-1-patrice.chotard@foss.st.com>
References: <20210111140347.5754-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_26:2021-01-11,
 2021-01-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] pinctrl: Set PINNAME_SIZE to 16
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

To allow to print longer pin name, set PINNAME_SIZE to 16.

Fixes: d5a8313905f5("cmd: pinmux: Add pinmux command")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 include/dm/pinctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dm/pinctrl.h b/include/dm/pinctrl.h
index 1bdc8d3cbd..2f09c7fa49 100644
--- a/include/dm/pinctrl.h
+++ b/include/dm/pinctrl.h
@@ -6,7 +6,7 @@
 #ifndef __PINCTRL_H
 #define __PINCTRL_H
 
-#define PINNAME_SIZE	10
+#define PINNAME_SIZE	16
 #define PINMUX_SIZE	40
 
 /**
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

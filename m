Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D66F06BD
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Apr 2023 15:37:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D9BC6907C;
	Thu, 27 Apr 2023 13:37:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F77C6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:37:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RAKqqF004642; Thu, 27 Apr 2023 15:37:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=veceEC2m4EXUMLQzBuFMn3W5Wbd0NrLb7Bd48Lw8XT4=;
 b=yMRVCq5P0YvPg5BHBtvIHmZJh1vQzDuoslgSkRuRkkxKseOFfR3sQZ4+ddUXvnWqUUGw
 akicmPKw2jReXWywDdOqySZG5HB4NZTJuOMmNzZ9Bb0S7E3p64ud43jeNHeJeLE3UfdZ
 TJCtg8vbBsr+5MSvFq5JhMQeyrjqk3DjIUkndwjppungi9M/dWE6XTzAs+SxB/uj+LFE
 SSb/fSIspjR8n4VhSXbc4/RmBb7sb+GkLzH8wXad5HR/Vf8EuOyHQtXje+mObjFm3eVR
 sHlAixWpuIdKanMklJs6hPN91JbOcPj1oCpZ9JyJySMApliGJqz0FMrV9KqQnx/Uw3Tg 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q6xdjm4nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 15:37:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55037100038;
 Thu, 27 Apr 2023 15:36:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F0BD226FD5;
 Thu, 27 Apr 2023 15:36:50 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Apr
 2023 15:36:50 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Apr 2023 15:36:34 +0200
Message-ID: <20230427153632.2.Ie06da6845013adef7bc23ff4c379fda001542fa6@changeid>
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
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/6] stm32mp: bsec: add check on null size in
	misc ops
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

Add a protection in misc bsec ops for request with null size.

For example OP-TEE error occurs when get_eth_nb() return 0 in
setup_mac_address() for unknown part number because U-Boot read 0 OTPs.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index f5f4b20d4776..0dc1e5c3fdc4 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -622,7 +622,7 @@ static int stm32mp_bsec_read(struct udevice *dev, int offset,
 		shadow = false;
 	}
 
-	if ((offs % 4) || (size % 4))
+	if ((offs % 4) || (size % 4) || !size)
 		return -EINVAL;
 
 	if (IS_ENABLED(CONFIG_OPTEE) && priv->tee) {
@@ -678,7 +678,7 @@ static int stm32mp_bsec_write(struct udevice *dev, int offset,
 		shadow = false;
 	}
 
-	if ((offs % 4) || (size % 4))
+	if ((offs % 4) || (size % 4) || !size)
 		return -EINVAL;
 
 	if (IS_ENABLED(CONFIG_OPTEE) && priv->tee) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

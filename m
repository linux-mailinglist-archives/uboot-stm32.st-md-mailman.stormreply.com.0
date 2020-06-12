Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969D1F7568
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 10:41:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02B45C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Jun 2020 08:41:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86EEBC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 08:41:09 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C8cUvv003844; Fri, 12 Jun 2020 10:41:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=xMyZudjDR9IR+rym4kOtJMxkG5w4K/ZD1iEWwg/3f4A=;
 b=gRFqC9RjVSLsOaLRlKTYtebK51/RLoRy06ZjgCzv5nZUxX4jq7th8pO3VnUjMhIlCNXJ
 quwEqqifbLugEofi90vqmLJgRgFfESNIZ8lm6SO9eCTzIA20Dm+yfKDR9CcCd28ueaBT
 lKnx8EjFzijMcvVYIAt2pwwEAcc+BI+LgTSMCJIidOEn9/r639Ah2eOxArFzhnCGBg+r
 L1oZK16bWefK+iER87ZUUC7KYwJAXmIVVQVp76iKmdFcIQ1YR9FyZHg81VprdVYbOCWI
 ke4Jwv/hzYjTuy1BNRLpFoweV0u957qyPt0wputYRvB/HPwVejNKmDCNNP61mYBaBjO3 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g0ww70bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 10:41:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9750910002A;
 Fri, 12 Jun 2020 10:41:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C5AC2B6693;
 Fri, 12 Jun 2020 10:41:03 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 12 Jun 2020 10:41:03 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 12 Jun 2020 10:40:58 +0200
Message-ID: <20200612104052.1.Idb6dab984884f50e47f061ac36fa89da760babd4@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_07:2020-06-11,
 2020-06-12 signatures=0
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] power: regulator: stm32: vrefbuf: fix a
	possible overshoot when re-enabling
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

From: Fabrice Gasnier <fabrice.gasnier@st.com>

There maybe an overshoot:
- when disabling, then re-enabling vrefbuf too quickly
- or upon platform reset as external capacitor maybe slow
  discharging (VREFBUF is HiZ at reset by default).
VREFBUF is used by ADC/DAC on some boards. An overshoot on the reference
voltage make the conversions inaccurate for a short period of time. So:
- Don't put the VREFBUF in HiZ when disabling, to force an active
  discharge.
- Enforce a 1ms OFF/ON delay, also upon reset

Penalty is a 1ms delay is applied (even for a cold boot), when enabling
VREFBUF.

Fixes: 93cf0ae7758d ("power: regulator: Add support for stm32-vrefbuf")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/power/regulator/stm32-vrefbuf.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/power/regulator/stm32-vrefbuf.c b/drivers/power/regulator/stm32-vrefbuf.c
index 250773514f..92136961c2 100644
--- a/drivers/power/regulator/stm32-vrefbuf.c
+++ b/drivers/power/regulator/stm32-vrefbuf.c
@@ -43,8 +43,20 @@ static int stm32_vrefbuf_set_enable(struct udevice *dev, bool enable)
 	u32 val;
 	int ret;
 
-	clrsetbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_HIZ | STM32_ENVR,
-			enable ? STM32_ENVR : STM32_HIZ);
+	if (enable && !(readl(priv->base + STM32_VREFBUF_CSR) & STM32_ENVR)) {
+		/*
+		 * There maybe an overshoot:
+		 * - when disabling, then re-enabling vrefbuf too quickly
+		 * - or upon platform reset as external capacitor maybe slow
+		 *   discharging (VREFBUF is HiZ at reset by default).
+		 * So force active discharge (HiZ=0) for 1ms before enabling.
+		 */
+		clrbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_HIZ);
+		udelay(1000);
+	}
+
+	clrsetbits_le32(priv->base + STM32_VREFBUF_CSR, STM32_ENVR,
+			enable ? STM32_ENVR : 0);
 	if (!enable)
 		return 0;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

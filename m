Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A7E22D5B
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 09:47:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDE21CB40B0
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 07:47:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E36F3CB40AC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 07:47:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4K7kwBa014809; Mon, 20 May 2019 09:47:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=es5bYsM7Z8p0XacC3yuN2F7OXDqiyRD8qU569vJhlOA=;
 b=gftXC4CAnJVjofRFnts8pZTeMJidRhXdnKy4ypziojK3xL9BmcwhbxzU+EH3zHgzaIdV
 FYIb0DQ9N4GF/dr/4JXmrvQQHfl9zl8QZAg/BFDQ9qXezFswwFZZ8DwRhv5aBhlYpsA/
 0iA3sigc2hkEfTInVtL3vCJaHFJbrjdcwVTBBTCE1PkeSEzrK4cRNfhf4/RdIzmPK1Va
 h8FP6qboeb9hU9vS/vMdnLbtvb0Z5WkPcuz1BBuh5lI/eDgPfOojAypqglRTGm0vutmg
 ru924qFv9ayR3x4dhDum+Qipbqlic+4Loi2lmjzpITf4FDpnBuu3Hsy/otNcUEmbvepU ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj773tcku-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 09:47:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75F3C34;
 Mon, 20 May 2019 07:47:18 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60F271532;
 Mon, 20 May 2019 07:47:18 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 09:47:18 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 09:47:17
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 09:47:07 +0200
Message-ID: <1558338427-9230-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_04:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] pmic: stpmic1: add support for
	SYSRESET_POWER_OFF
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

Adds support for SYSRESET_POWER_OFF = PMIC power off used by command
power off and introduced by commit 751fed426f87 ("sysreset: Add a way
to find the last reset").
The driver use SYSRESET_POWER for the PMIC-level power cycle, with restart.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/power/pmic/stpmic1.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/power/pmic/stpmic1.c b/drivers/power/pmic/stpmic1.c
index 65296c5..c338148 100644
--- a/drivers/power/pmic/stpmic1.c
+++ b/drivers/power/pmic/stpmic1.c
@@ -221,7 +221,7 @@ static int stpmic1_sysreset_request(struct udevice *dev, enum sysreset_t type)
 	struct udevice *pmic_dev;
 	int ret;
 
-	if (type != SYSRESET_POWER)
+	if (type != SYSRESET_POWER && type != SYSRESET_POWER_OFF)
 		return -EPROTONOSUPPORT;
 
 	ret = uclass_get_device_by_driver(UCLASS_PMIC,
@@ -235,8 +235,13 @@ static int stpmic1_sysreset_request(struct udevice *dev, enum sysreset_t type)
 	if (ret < 0)
 		return ret;
 
-	ret = pmic_reg_write(pmic_dev, STPMIC1_MAIN_CR,
-			     ret | STPMIC1_SWOFF | STPMIC1_RREQ_EN);
+	ret |= STPMIC1_SWOFF;
+	ret &= ~STPMIC1_RREQ_EN;
+	/* request Power Cycle */
+	if (type == SYSRESET_POWER)
+		ret |= STPMIC1_RREQ_EN;
+
+	ret = pmic_reg_write(pmic_dev, STPMIC1_MAIN_CR, ret);
 	if (ret < 0)
 		return ret;
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

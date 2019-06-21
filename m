Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B23E64E919
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81ABCCA75A3
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBCDDCA75A1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRHEN031159; Fri, 21 Jun 2019 15:27:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=y9Jdq7AV1DoE338T9a24fnUJcYKdGMOI4Rbv5JIi7i4=;
 b=lYb379en/+cLAuaKZOeYi1CcgqKXHaY3OZ/CAgXvWG2n8+6H0c0hqbIIiXVl75F/0UUf
 Al6XwFo9qlnC8woXFZqvXPFWplBRl4TNsYbVw/MshO5X5FMnCNg6QrSf+gppDJ37uYyh
 Ld3GlyTnUaCHdicunLPMIm+7bRA0vD1BH9f+1vhy5STnVrbmkbt9uUrRYiyALmmUYeov
 1MzEtfcD9XUysyG42pBRf163NkNK+U0zKXLD3l4SohzZ3qW8yd4vt1C7R5o5/ej5KoMd
 iEGPauNXIGr5t4GujN+cyReTx8wvXkHoX8uUgHw5DFVGaw50viKkqW+NxdrymsHffE25 qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qeah-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9C3F34;
 Fri, 21 Jun 2019 13:27:19 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8EACD2A54;
 Fri, 21 Jun 2019 13:27:19 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:19 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:19
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:53 +0200
Message-ID: <1561123618-2029-15-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 15/20] power: stpmic1: Fix warnings when
	compiling with W=1
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

This patch solves the following warnings:
warning: this statement may fall through [-Wimplicit-fallthrough=]

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/power/regulator/stpmic1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/regulator/stpmic1.c b/drivers/power/regulator/stpmic1.c
index 50ef2a2..1e3f96f 100644
--- a/drivers/power/regulator/stpmic1.c
+++ b/drivers/power/regulator/stpmic1.c
@@ -422,6 +422,7 @@ static int stpmic1_ldo_set_mode(struct udevice *dev, int mode)
 	case STPMIC1_LDO_MODE_SINK_SOURCE:
 		ret &= ~STPMIC1_LDO12356_VOUT_MASK;
 		ret |= STPMIC1_LDO3_DDR_SEL << STPMIC1_LDO12356_VOUT_SHIFT;
+		/* fallthrough */
 	case STPMIC1_LDO_MODE_NORMAL:
 		ret &= ~STPMIC1_LDO3_MODE;
 		break;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

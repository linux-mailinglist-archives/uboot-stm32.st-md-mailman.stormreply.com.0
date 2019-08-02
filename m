Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9946B7F5C3
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 13:08:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65E40C35E17
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Aug 2019 11:08:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CD7EC35E05
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 11:08:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72B2M19027555; Fri, 2 Aug 2019 13:08:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TCEjK7eU8HPSRAfRH3zooi+vmFjmVBABDOtSdMtwlRM=;
 b=PMVy0rrc1AsrCKrPukX/6Zs6qiH+te/p0xoFekvL08tR7v0xeuNwnNI7qLVrobhqhBQf
 t2Qxi176Tl+gFBAGw90azRAbtwTJjJmJbImeOIgiseH5yqPmujPwENXLGyHY4URDOEtv
 PD0XGdvflePb0WI4jMkwr4+d5inmi/MnlF3CPc6KoZuRgP7xRCja7UUo2AOKfElXhwaQ
 Vz9Q1YxaiNKCXjIWaPWHPJyHD2TNvRGd5DXgthjMjdr0UdPP7G6wwCIfUgDFBVetplNA
 9KP4fgNnPUS/w5+CeCHVxKANx7HQIh5xUxEaNurLqdBADfiy74AEzBH6tWTJiUImH4zd Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4u7rm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 13:08:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B61F231;
 Fri,  2 Aug 2019 11:08:19 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD2A0207409;
 Fri,  2 Aug 2019 13:08:19 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019
 13:08:19 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 13:08:19
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 2 Aug 2019 13:08:08 +0200
Message-ID: <1564744088-16896-8-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
References: <1564744088-16896-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_05:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 7/7] misc: change RCC form MISC to NOP
	uclass
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

The RCC driver have no operation so the new NOP uclass
is more appropriate. It only used as parent for clock and reset driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- rebase v2019.10-rc1

 drivers/misc/stm32_rcc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/misc/stm32_rcc.c b/drivers/misc/stm32_rcc.c
index 13d7069..e7efcde 100644
--- a/drivers/misc/stm32_rcc.c
+++ b/drivers/misc/stm32_rcc.c
@@ -68,8 +68,6 @@ static int stm32_rcc_bind(struct udevice *dev)
 					    dev_ofnode(dev), &child);
 }
 
-static const struct misc_ops stm32_rcc_ops = {
-};
 
 static const struct udevice_id stm32_rcc_ids[] = {
 	{.compatible = "st,stm32f42xx-rcc", .data = (ulong)&stm32_rcc_clk_f42x },
@@ -82,8 +80,7 @@ static const struct udevice_id stm32_rcc_ids[] = {
 
 U_BOOT_DRIVER(stm32_rcc) = {
 	.name		= "stm32-rcc",
-	.id		= UCLASS_MISC,
+	.id		= UCLASS_NOP,
 	.of_match	= stm32_rcc_ids,
 	.bind		= stm32_rcc_bind,
-	.ops		= &stm32_rcc_ops,
 };
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

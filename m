Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F64E90D
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5AFFCA0288
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B6DDCA0285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRHE9031159; Fri, 21 Jun 2019 15:27:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=D9Ak649hWzNV8x8V5JXLeX/GymqZvqTs9rF7NCQU0Ms=;
 b=qHTowdnAY6rL+4EI06mP5SNMn0CYwsA4yfTeGQNnrHj+dNJVZKvLCCX3GgvhzsPv2sFl
 hHw9A/QN8CC+ErPG9Ui4q6tS38nWHn6TU7Y5i8va94XftsP9qesryjQscbzDsnMEF7cG
 BsM+/jz0oVJPeGhARe7bNF5npOXWdFd87CqRnjt2lk5gacfof5ZJUaPzZ/m6QyZv4mQa
 KWvKHFr1EnPsKrJV1+fxqfZYSM5TKhpbEZwPzVjSctMLeG+7+z+ckeDphtiVT6zwbOWN
 sdRnnH42yOxDm6Dczvq4+8f1jjCFs3qup7xR+F2oHmEX/X/ocjgigFw3d9Elct2Rj2t4 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813qe9g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:19 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FBFC64;
 Fri, 21 Jun 2019 13:27:09 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C1862A54;
 Fri, 21 Jun 2019 13:27:09 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:09 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:09
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:45 +0200
Message-ID: <1561123618-2029-7-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/20] adc: stm32: Fix warnings when compiling
	with W=1
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

drivers/adc/stm32-adc-core.c: In function 'stm32h7_adc_clk_sel':
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
   for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
                 ^
warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  for (i = 0; i < ARRAY_SIZE(stm32h7_adc_ckmodes_spec); i++) {
                ^
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/adc/stm32-adc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/adc/stm32-adc-core.c b/drivers/adc/stm32-adc-core.c
index a9aa143..04b6a8a 100644
--- a/drivers/adc/stm32-adc-core.c
+++ b/drivers/adc/stm32-adc-core.c
@@ -60,7 +60,8 @@ static int stm32h7_adc_clk_sel(struct udevice *dev,
 {
 	u32 ckmode, presc;
 	unsigned long rate;
-	int i, div;
+	unsigned int i;
+	int div;
 
 	/* stm32h7 bus clock is common for all ADC instances (mandatory) */
 	if (!clk_valid(&common->bclk)) {
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC5748B217
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jan 2022 17:27:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1CD2C5F1FF;
	Tue, 11 Jan 2022 16:27:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3517AC56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 16:27:18 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20BBoOfY024746;
 Tue, 11 Jan 2022 17:27:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ksKDoWy11hpbU9uXayLPWZXDAP38uVXfAGrF2GiwIW8=;
 b=w0V7IpEhyDb6rMU4NLI+VKwvS7XNKJqJK41LYwUaM+c9ceIPGJnsgeIYJTkzWwphHGuE
 B/2gZhYiR+kijK4rv6t+vC51HhoFOdhcdWQC/X/Wb3mobhHF8rvkr4WU3z3RGIeMjZaK
 IYQ8YR4oLET9izQ/GffXAjsVsfq6ul/ZynPxUkwLyH2xwwpB2VPS/wiNOA81sLdYn5JW
 L/hgy1zzswGVpo0JFkq8bAtfKLTvI922LPNOHvebNZeDVuXc199kcSxLnIO0CGUhdvGa
 hWTOgHjdo6yMDsxMJ2aTUq1nvm02n4o8HTsGrsy9Ox+JQUbufb8v2NNSIeEIodz207Jx 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dh9cb99hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 17:27:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BFE1D10002A;
 Tue, 11 Jan 2022 17:27:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B8F4D231237;
 Tue, 11 Jan 2022 17:27:16 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 11 Jan 2022 17:27:16
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 11 Jan 2022 17:27:12 +0100
Message-ID: <20220111172710.2.I85a4f70465cef5ef600f264706dca84c55c7efdb@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
References: <20220111162713.632395-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 2/3] dm: compare full name in
	uclass_get_by_name
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

Change uclass_get_by_name to use a strict string compare function
"strcmp" with the parameter 'name'.

This patch avoids issues when strlen(name)<strlen(uc_drv->name) as
the function uclass_get_by_name() no more use uclass_get_by_name_len(),
which limit the check with "strncmp" and length of name.

This problem is detected by the sandbox test for log filter:
in log_get_cat_by_name(), uclass_get_by_name("spi") = UCLASS_SPI_EMUL
for "spi_emul", it is not the expected result = UCLASS_SPI
for a search by name.
But it is the expected result for search with partial name
uclass_get_by_name_len("spi", 3).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/core/uclass.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/core/uclass.c b/drivers/core/uclass.c
index 336ea8d243..32b6cef167 100644
--- a/drivers/core/uclass.c
+++ b/drivers/core/uclass.c
@@ -196,7 +196,16 @@ enum uclass_id uclass_get_by_name_len(const char *name, int len)
 
 enum uclass_id uclass_get_by_name(const char *name)
 {
-	return uclass_get_by_name_len(name, strlen(name));
+	int i;
+
+	for (i = 0; i < UCLASS_COUNT; i++) {
+		struct uclass_driver *uc_drv = lists_uclass_lookup(i);
+
+		if (uc_drv && !strcmp(uc_drv->name, name))
+			return i;
+	}
+
+	return UCLASS_INVALID;
 }
 
 int dev_get_uclass_index(struct udevice *dev, struct uclass **ucp)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

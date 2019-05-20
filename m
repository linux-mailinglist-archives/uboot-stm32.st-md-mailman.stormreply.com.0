Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A32A0236A3
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:00:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52587C0D2A1
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 13:00:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E411C5C85F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 13:00:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KCfFeR010603; Mon, 20 May 2019 15:00:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lt+nefLJt3U5UNmlJOFaZHWIz1gzzq+ieT3+FLiuN6s=;
 b=EkpNK2dmT2bI1vnqmcC6g5O8WBzS/0L5CCBgxuV48ErDCGZmRXAWfDO9cSdnNmsHs0jO
 ApaDfpihFuQIIIuXYc4oRXTY075WuPZpDcOQT9ifp9wqcmxi0UrIWNVMO2I36sGDIXMQ
 NPYeSJDTu5mLKGYL7XMkDsbJSN6bYfMwRbAwghxn/PnTpNEkgJfifo8Yc9liSXqKxTD2
 VuG2O55z1r8D69z75vijjn2WSEnPq0bZwapyVHStJdfrtCr4mw5oX/ntA8dsroiyJsYA
 LTi3ReZCcNMOReuKo/bWqA4dUB0NZvJfEgFIV520tqSUiaGd0MHeMTCF7x4jJ1LW2nKF Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7h0kp3v-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 15:00:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 641D234;
 Mon, 20 May 2019 13:00:16 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4699526DE;
 Mon, 20 May 2019 13:00:16 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 15:00:16 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 15:00:15
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 15:00:01 +0200
Message-ID: <1558357207-7345-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/8] fdt: Allow to use EMBEDDED device tree
	for SPL
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

U-boot continue to use load DT from file system, this patch avoid
an error when U-Boot "Error: Out of memory" when it try to map
gd->fdt_blob (EMBEDDED pointer __dtb_dt_begin is not managed).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- solve issue for spl sandbox with dtb

 lib/fdtdec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index fea44a9..d25cfd6 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -1491,6 +1491,12 @@ int fdtdec_setup(void)
 	gd->fdt_blob = __dtb_dt_spl_begin;
 #  else
 	gd->fdt_blob = __dtb_dt_begin;
+#ifdef CONFIG_SANDBOX
+	if (sandbox_read_fdt_from_file()) {
+		puts("Failed to read control FDT\n");
+		return -1;
+	}
+#endif
 #  endif
 # elif defined(CONFIG_OF_BOARD) || defined(CONFIG_OF_SEPARATE)
 	/* Allow the board to override the fdt address. */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

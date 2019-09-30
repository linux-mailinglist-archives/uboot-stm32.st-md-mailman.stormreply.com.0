Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68920C2239
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 15:38:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 377D7C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 13:38:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABA3DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 13:38:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UDbAZj018786; Mon, 30 Sep 2019 15:38:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/der6aZ4gcQy7HHektaSIE+fuu7037yLMc6tUbckSpQ=;
 b=YXrs0Rz/XIxYaJbTJDfvzAKDSmw6e0BciZVKcM1fyBoDXTik3DJrX4FJOaRaZ+ILmza7
 nsZIpb1+iPjbG7SzYsGb6bSI4TULTXkP2Llb1rqNkowwrQSX7swniEwh3UP6K9Z0+3am
 pdk1i1+WTwN9kCvw3Z97wUyKRAG/Mo6AU8jWaXTm7tuOlRGR0iDBD+9BKhm2z3Qv4l9z
 4jccLOYGuW4hELuUZiQU+iNm0BcnYsxEgqVbKi1pN3HUB6v6Qlt3y5paekwCPqoW7wBf
 fIJgIyQ1ucZ1q1EDRwIlo4OAmfIJxGgAxfrAUezTSR3DY5ZUyOVUp0y7MyOFgXa4wG5v iQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w00uf1r-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 15:38:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A9E0C53;
 Mon, 30 Sep 2019 13:38:43 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12C1A2FF5FB;
 Mon, 30 Sep 2019 15:38:43 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 15:38:43 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 15:38:42
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 30 Sep 2019 15:38:22 +0200
Message-ID: <20190930133832.11992-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930133832.11992-1-patrick.delaunay@st.com>
References: <20190930133832.11992-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-25,2019-09-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 06/16] dfu: allow read with no data without
	error for EOF indication
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

This patch allows the DFU backend to indicate that that it can't
provide no more data to fill the DFU buffer, by setting b_left =0
without error, even if the size of received data is lower of the
expected total size indicated by get_medium_size.

For USB DFU stack point of view, it is acceptable:
the read length < requested size in DFU_UPLOAD and the
transaction is stopped.

That avoid infinite loop issue in dfu_read_buffer_fill because the
size for the DFU read is limited by get_medium_size = r_left
and the DFU stack expects that read is allowed up to this size.

This issue never occurs for current flash device (where chunk are
always completely read, and b_left will be never 0) but it is useful for
virtual partition when the backend only know the max size of this
alternate, the real size of the data are only known in the read
treatment.

PS: for file access on mmc, EOF is never reached as
    dfu_get_medium_size_mmc returns the exact size of the file.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- Update commit message

 drivers/dfu/dfu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index 8bd5216017..50919fcae9 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -396,6 +396,8 @@ static int dfu_read_buffer_fill(struct dfu_entity *dfu, void *buf, int size)
 				debug("%s: Read error!\n", __func__);
 				return ret;
 			}
+			if (dfu->b_left == 0)
+				break;
 			dfu->offset += dfu->b_left;
 			dfu->r_left -= dfu->b_left;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

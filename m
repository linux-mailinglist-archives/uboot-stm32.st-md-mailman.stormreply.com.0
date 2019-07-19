Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 630026E5EF
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 14:57:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A83EC0615F
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jul 2019 12:57:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5932C064E8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jul 2019 12:57:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6JCqkjV014641; Fri, 19 Jul 2019 14:57:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LqPw7DqUmINR71ngDMr/AumCe27x33wSagIkBneNy70=;
 b=fxU/gFgSiGJJK6mJ4PiQxD5adRhaM9lsolHjW6XdwP86Q7307t6iXmGLjFLXOW0v7Jbl
 RE9fznPDZrJ8jfBC8svRJKLyWrr2Zc3wfQc168yffyXaY/vdIfD1OjnEHKWEwkso4ZGl
 asNwrnoOHkk/iHHXJTOQ9gP5qtwstxkorhotqJ6yI8pdletGfzH4j/I2BA6zjcot/Kdh
 4SZPNPLHRWHQc0a0OPo3MPnjahjBC3rynj2a/hFwSOEspp7MgMRLc4weT1NmVCWbR4bR
 Pe3gkK5RIexto2TprK85KKsG+e9Q3n2lr9yJJrV4xa9FPQnheI1bo5DpUgHffQgY34a7 xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq4s28gv7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 19 Jul 2019 14:57:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A524E6F;
 Fri, 19 Jul 2019 12:57:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 902462D4F;
 Fri, 19 Jul 2019 12:57:35 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 14:57:35 +0200
Received: from localhost (10.201.23.85) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul 2019 14:57:35
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jul 2019 14:57:17 +0200
Message-ID: <1563541046-6432-6-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
References: <1563541046-6432-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-19_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RFC PATCH 05/14] dfu: allow read with 0 data for EOF
	indication
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

This patch allows into the DFU backend to indicate that there is no
remaining data (for EOF for example). That allows users to read a
buffer greater than the device size; the dfu stack stops the read
request when the backend return a length=0 without error.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/dfu/dfu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dfu/dfu.c b/drivers/dfu/dfu.c
index 01ec690..bcfa170 100644
--- a/drivers/dfu/dfu.c
+++ b/drivers/dfu/dfu.c
@@ -395,6 +395,8 @@ static int dfu_read_buffer_fill(struct dfu_entity *dfu, void *buf, int size)
 				debug("%s: Read error!\n", __func__);
 				return ret;
 			}
+			if (dfu->b_left == 0)
+				break;
 			dfu->offset += dfu->b_left;
 			dfu->r_left -= dfu->b_left;
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

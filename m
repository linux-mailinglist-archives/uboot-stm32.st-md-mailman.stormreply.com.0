Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5FAB21C7
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 16:20:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BD76C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 14:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8794AC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 14:19:59 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8DEGe0V026140; Fri, 13 Sep 2019 16:19:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=hCm21vsUnQ4rJGU2+hOK0XTMneBoESwvOUOiNlTxbME=;
 b=oKg+Z0Pgps6i8/Z+7PtFXD7qtQDJKAl6zSYL7xG/3ngiRcDiBsbDvBgfyPwr5M2sK0R3
 e//hL2VCcVgnx+MIreqOA51mF+fJM4+DCfltdAueL8G+flZje95onTmf8JHN83EtNp1L
 wAhKV4HiejY3b1RZDS6mtMfq8H1kkEO+AU2l/UUseVyiJ8jbMIhpeFZKm+1o8u+figBE
 bsOMPF58o7KdCjve7BJQ6UHis0q2Pq5kpskX96FzRntrFPEQHatq/9eSkvceBr9133V9
 hyu8Fs2ADOlIXV2qAUjnCz682hkQiN/2U+yjvDgFDAuzWfZM43xdyEmPeIS3t600AxV5 7A== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uytdxddcu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:19:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1232E4D;
 Fri, 13 Sep 2019 14:19:40 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27D212C7F40;
 Fri, 13 Sep 2019 16:19:39 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 16:19:39 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 16:19:38
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 13 Sep 2019 16:19:21 +0200
Message-ID: <20190913141930.15784-6-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913141930.15784-2-patrick.delaunay@st.com>
References: <20190913141930.15784-2-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_07:2019-09-11,2019-09-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/14] dfu: allow read with 0 data for EOF
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

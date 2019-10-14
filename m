Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2220D5C6D
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 09:28:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 770E1C36B11
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 07:28:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC4C5C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 07:28:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9E7RpjC007215; Mon, 14 Oct 2019 09:28:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=X+NBmrwmPev8L1QEqsvT3m9UR7BearMgeNSglHNxGB4=;
 b=UJndsbO3W4OkB2c4vkkIpZLQv7MdATEFoTwN9CCcAP63qAkIqkQPzW1rotp8zBEM3y6G
 hfjBrYZ45VhxTFLaf53G9JKuSbXIV4s9kuspbkG0ujtPTYGefN40Ysshn/Bh1KCxZMv9
 Gn/g5j9p2B+IYRoRCGyT3RuLSUbe91fSw4ySC9zp7nVhqQeCUdli7/Ew5GVhO5HGLEET
 wRiOmKWzbHr0yCy/NMqDycX5wtoHlnpXDWwojeAtKCKOiEX24jR6STJvttJeKZoGB8ot
 +KT2tfmTadzw+xlCIk6IGFzmDKbsUwMMMyn4+3meHe4bk38ITrwHOOUEx+TggguO2R7L WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9h5ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:28:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E443100034;
 Mon, 14 Oct 2019 09:28:27 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 360CC2ADFFB;
 Mon, 14 Oct 2019 09:28:27 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct
 2019 09:28:27 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 14 Oct 2019 09:28:26
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 14 Oct 2019 09:28:03 +0200
Message-ID: <20191014072812.21843-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014072812.21843-1-patrick.delaunay@st.com>
References: <20191014072812.21843-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-14_06:2019-10-10,2019-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 06/15] dfu: allow read with no data without
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

Changes in v3: None
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

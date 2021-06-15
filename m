Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 142343A7843
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Jun 2021 09:47:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDD12C597AE;
	Tue, 15 Jun 2021 07:47:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A232DC58D5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 07:47:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F7kkWd006545; Tue, 15 Jun 2021 09:47:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=nJSkccU+p7hk+MWwHMKt7R+2rFAH9cqjDqzhz8lSDI4=;
 b=wQJKDhPZT54fIwxdRSlg+DdEYNh/2ZfuXUFH1+tvp9vmTJHvIXld0qLAwI5vie4U43Hh
 RX7scZQRwmTKf5JS63vlhWNmeA+iN22C8ipM8yCNIrW18Q8zxFGWr+sBa4FqUZ/ZbGR8
 cU2/PlJbgGctvxGzmyVeLnMT310YT2nkuNvENaJlGHIMupEu/9yNbgCVrsfiOJaBrH8A
 G7RZ1q7vR/jR24JKxgn7XX0zAeMdJgqpFztH9gGKUxbBJoB5hlqkDRbcukZ3gqDAIq9i
 HIgPtpDzVTGUWCvBWljR1NBLdLULGFsKzwEGqZCzB1/k6zyDxGMiAeujX/1wUpXETmVt AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 396qqsg61g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 09:47:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0EA00100034;
 Tue, 15 Jun 2021 09:47:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9374217B90;
 Tue, 15 Jun 2021 09:47:52 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 15 Jun 2021 09:47:52
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 15 Jun 2021 09:47:41 +0200
Message-ID: <20210615094718.RFC.1.I1158bd6d095c996f2dbd4b0aa9327e4eee202331@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [RFC PATCH] dfu: handle short frame result of UPLOAD
	in state_dfu_idle
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

In DFU v1.1 specification [1] the DFU_UPLOAD (Short Frame)
is handled only in dfuUPLOADIDLE state:

- Figure A.1 Interface state transition diagram

- the state description in chapter A.2

A.2.3 State 2 dfuIDLE
  on Receipt of the DFU_UPLOAD request,and bitCanUpload = 1
  the Next State is dfuUPLOADIDLE

A.2.10 State 9 dfuUPLOAD-IDLE
  When the length of the data transferred by the device in response
  to a DFU_UPLOAD request is less than wLength. (Short frame)
  the Next State is dfuIDLE

In current code, when an UPLOAD is completely performed after the first
request (for example with wLength=200 and data read = 9), the DFU state
stay at dfuUPLOADIDLE until receiving a DFU_UPLOAD or a DFU_ABORT request
even it is unnecessary as the previous DFU_UPLOAD request already reached
the EOF.

This RFC patch proposes to finish the DFU uploading (don't go to
dfuUPLOADIDLE) and completes the control-read operation (go to
DFU_STATE_dfuIDLE) when the first UPLOAD response has a short frame as
an end of file (EOF) indicator even if it is not explicitly allowed in
the DFU specification but this seems logical.

[1] https://www.usb.org/sites/default/files/DFU_1.1.pdf

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
This case is correctly handle in dfu-util, see dfu_load.c

dfuload_do_upload()
{
....
        while (1) {
...
                rc = dfu_upload(dif->dev_handle, dif->interface,
                    xfer_size, transaction++, buf);
....
                dfu_file_write_crc(fd, 0, buf, rc);
                total_bytes += rc;

                if (total_bytes < 0)
                        errx(EX_SOFTWARE, "\nReceived too many bytes (wraparound)");

                if (rc < xfer_size) {
                        /* last block, return */
                        ret = 0;
                        break;
                }
        }
}

In the upload loop the code doesn't make difference for the first request
and the next one: the last block is detected as soon as the
received data < requested size.

So it is safe to do the same in U-Boot's DFU stack, skip the dfuUPLOADIDLE
state when the upload operation is finished after the first request.

This patch avoid to ABORT the unfinished UPLOAD request before the next
command.

Patrick.


 drivers/usb/gadget/f_dfu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/f_dfu.c b/drivers/usb/gadget/f_dfu.c
index 4bedc7d3a1..e9340ff5cb 100644
--- a/drivers/usb/gadget/f_dfu.c
+++ b/drivers/usb/gadget/f_dfu.c
@@ -336,6 +336,8 @@ static int state_dfu_idle(struct f_dfu *f_dfu,
 		f_dfu->dfu_state = DFU_STATE_dfuUPLOAD_IDLE;
 		f_dfu->blk_seq_num = 0;
 		value = handle_upload(req, len);
+		if (value >= 0 && value < len)
+			f_dfu->dfu_state = DFU_STATE_dfuIDLE;
 		break;
 	case USB_REQ_DFU_ABORT:
 		/* no zlp? */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1685442C458
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Oct 2021 17:01:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2DBFC5C834;
	Wed, 13 Oct 2021 15:01:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C284C5C831
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 15:01:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DDKX9a011459; 
 Wed, 13 Oct 2021 17:01:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=jhab7mR9ZMYgNR1RBQTrmwsgteiVIZvDdDKBkEq5gKs=;
 b=KMVsgar9LZAytkX1FOp/BhfkMekvAx5+s1jJt2eF/w1WjNT7lD8+abU1RHebqXplR4f7
 RBQzLIqQKamPPs/Uwk8dWhZtYtD7edx5pZamXvZTaMXB/R5jcKPgt5ZQ02TAgAQfKtNA
 dEK/CwKwrADchzfkiuqHZPn56zKp2+U8aNT6RV7qFY3SZ5P6lnkVqmF6PcA981HgD5om
 7aRn+RvVou0rUUmmKxFMOBuRiKgp+Y6tf9Fhxecfvji4UgQSJ/F99LjbIp95TZoWdOV6
 QKl3bx5zKf1K4trEfDP12ZnfhUrxT8hrFMBbhLbDmP2w2nZmV/X1PR0lXDm4ge7hCEn0 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bnuxttrek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 17:01:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87F4910002A;
 Wed, 13 Oct 2021 17:01:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E873231509;
 Wed, 13 Oct 2021 17:01:42 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 13 Oct 2021 17:01:41
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 13 Oct 2021 17:01:37 +0200
Message-ID: <20211013170053.1.I1158bd6d095c996f2dbd4b0aa9327e4eee202331@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_06,2021-10-13_02,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH] dfu: handle short frame result of UPLOAD in
	state_dfu_idle
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

This patch proposes to finish the DFU uploading (don't go to dfuUPLOADIDLE)
and completes the control-read operation (go to DFU_STATE_dfuIDLE) when
the first UPLOAD response has a short frame as an end of file (EOF)
indicator even if it is not explicitly allowed in the DFU specification
but this seems logical.

[1] https://www.usb.org/sites/default/files/DFU_1.1.pdf

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi Lukasz,

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

This patch was previously sent as RFC =
[RFC] dfu: handle short frame result of UPLOAD in state_dfu_idle
http://patchwork.ozlabs.org/project/uboot/list/?series=248838&state=*

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
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

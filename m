Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F330E95
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 15:11:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D947C07A5F
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 May 2019 13:11:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4969C07A5B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 13:11:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4VD7iaL005876; Fri, 31 May 2019 15:11:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VnelWbA6LXHbjZJTIep7AAa6pdMx5MHhhAPfhn5z/1I=;
 b=MYsheWm9oaABjNJie6i1PchK6FWr4sakwp5M8tdGtyrFccUv217/O3jmoE/g7U7XxMRN
 ETHNCeL8oPPCql9spFkXN0LPiO8PFApC9mkWPwfmxFL7XR5EGRdXHk7LbxfW2YqxX8+S
 RwZwcyJ41rjqRoHbSW1PxsMoiRRlyEz0PfZX04m83vSWRBL3/mUF7Yvt3kxta0IaZl0x
 pNVmFYnCZr6xh87cm1VpuAozHvAP32JZX2ylsP63vOHZC/hnEOZcmZY7k1etej5BMzgx
 R5obD1gZleT3G9vQQPtmXEzzhiRAlQYFm9KfsPSnvfSVTEsK6pdkiuCoRIVkbq1w8R2U 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptuacgd3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 31 May 2019 15:11:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A3083A;
 Fri, 31 May 2019 13:11:47 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23CA329C8;
 Fri, 31 May 2019 13:11:47 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May
 2019 15:11:47 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May 2019 15:11:46
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Fri, 31 May 2019 15:11:32 +0200
Message-ID: <1559308296-17027-4-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
References: <1559308296-17027-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-31_07:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v3 3/7] remoteproc: add device_to_virt ops
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

Introduce the device_to_virt function to allow translation between
device address (remote processor view) and virtual address (main
processor view).

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 include/remoteproc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/remoteproc.h b/include/remoteproc.h
index aa90a67..aef6ff2 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -113,6 +113,18 @@ struct dm_rproc_ops {
 	 * @return 0 on success, 1 if not responding, -ve on other errors.
 	 */
 	int (*ping)(struct udevice *dev);
+
+	/**
+	 * device_to_virt() - Return translated virtual address (optional)
+	 *
+	 * Translate a device address (remote processor view) to virtual
+	 * address (main processor view).
+	 *
+	 * @dev:	Remote proc device
+	 * @da:		Device address
+	 * @return virtual address.
+	 */
+	void * (*device_to_virt)(struct udevice *dev, ulong da);
 };
 
 /* Accessor */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
